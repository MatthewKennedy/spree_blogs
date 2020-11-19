FactoryBot.define do
  factory :post, class: Spree::Post do
    title { "First Post" }
    content { "First post content" }
    meta_title { "SEO First Post Title" }
    meta_description { "SEO First Post Meta Description" }
    slug { "first-post" }
    excerpt { "First post excerpt" }
  end
end
