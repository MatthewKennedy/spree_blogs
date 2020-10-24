if Spree::Config[:blogs_use_tags]
  require 'acts-as-taggable-on'
end

class Spree::Post < Spree::Base
  belongs_to :blog

  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  if Spree::Config[:blogs_use_tags]
    ActsAsTaggableOn.force_lowercase = true
    acts_as_taggable_on :tags
  end

  before_save :create_slug, :set_published_at

  validates :title, presence: true

  if Spree::Config[:blogs_use_action_text]
    has_rich_text :summary_action_text
    has_rich_text :content_action_text
    validates :content_action_text, presence: true
  else
    validates :content, presence: true
  end

  default_scope { order('published_at DESC') }
  scope :visible, -> { where visible: true }
  scope :recent, ->(max = 5) { visible.limit(max) }

  if Spree.user_class
    belongs_to :author, class_name: Spree.user_class.to_s, optional: true
  else
    belongs_to :author, optional: true
  end

  has_one :post_image, as: :viewable, dependent: :destroy, class_name: 'Spree::PostImage'
  accepts_nested_attributes_for :post_image, reject_if: :all_blank

  def post_summary(chars = 200)
    if summary.blank?
      "#{body[0...chars]}..."
    else
      summary
    end
  end

  def self.by_date(date, period = nil)
    date = HashWithIndifferentAccess.new(date.to_unsafe_h) if date.is_a?(ActionController::Parameters)

    if date.is_a?(Hash)
      keys = %i[day month year].select { |key| date.include?(key) }
      period = keys.first.to_s
      date = DateTime.new(*keys.reverse.map { |key| date[key].to_i })
    end

    time = date.to_time.in_time_zone
    where(published_at: (time.send("beginning_of_#{period}")..time.send("end_of_#{period}")))
  end

  def self.by_tag(tag_name)
    tagged_with(tag_name, on: :tags)
  end

  def self.by_category(category_name)
    tagged_with(category_name, on: :categories)
  end

  def self.by_author(author)
    where(author_id: author)
  end

  # data for news archive widget, only visible posts
  def self.organize_blog_posts
    {}.tap do |posts|
      years.each do |year|
        months_for(year).each do |month|
          date = DateTime.new(year, month)
          posts[year] ||= []
          posts[year] << [date.strftime('%B'), visible.by_date(date, :month)]
        end
      end
    end
  end

  def self.years
    visible.map { |e| e.published_at.year }.uniq
  end

  def self.months_for(year)
    visible.select { |e| e.published_at.year == year }.map { |e| e.published_at.month }.uniq
  end

  private

  def create_slug
    self.slug = title.to_url if slug.blank?
  end

  def set_published_at
    self.published_at = Time.now if published_at.blank?
  end
end
