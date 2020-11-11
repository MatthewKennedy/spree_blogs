FactoryBot.define do
  factory :blog, class: Spree::Blog do
    title     { 'News' }
    meta_title   { 'SEO News Blog Title' }
    meta_description {'SEO News Blog Meta Description'}
    slug {'news'}
  end
end
