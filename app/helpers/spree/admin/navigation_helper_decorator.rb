# frozen_string_literal: true

Spree::Admin::NavigationHelper.class_eval do
  def link_to_blog_in_store(resource, options = {})
    url = options[:url] || blog_post_slug(resource)

    options[:data] = { action: 'edit' }
    options[:class] = 'btn btn-outline-secondary btn-sm'
    link_to_with_icon('view.svg', Spree.t(:view_in_store), url, options)
  end
end
