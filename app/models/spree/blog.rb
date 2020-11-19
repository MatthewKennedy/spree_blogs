class Spree::Blog < Spree::Base
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  has_many :posts
  has_and_belongs_to_many :stores

  before_save :create_slug
  validates :title, presence: true

  scope :by_store, ->(store) { joins(:stores).where("store_id = ?", store) }

  private

  def location_after_save
    edit_admin_blog_post_url(@blog_post)
  end

  def create_slug
    self.slug = if slug.blank?
      title.to_url
    else
      slug.to_url
    end
  end
end
