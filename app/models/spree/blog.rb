class Spree::Blog < Spree::Base
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  has_many :posts, dependent: :destroy

  before_save :create_slug


  private

  def location_after_save
    edit_admin_blog_post_url(@blog_post)
  end

  def create_slug
    if slug.blank?
      self.slug = title.to_url
    else
      self.slug = slug.to_url
    end
  end
end
