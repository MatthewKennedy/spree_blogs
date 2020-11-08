# frozen_string_literal: true

module Spree
  module Admin
    module PostsHelper
      def view_post_in_store_link(blog, post, store)

        unless store.url[/\Ahttp:\/\//] || store.url[/\Ahttps:\/\//]
          store_url = "http://#{store.url}"
        end

        link_to(store.unique_name, store_url + blog_post_path(blog, post), class: "dropdown-item py-2 px-3",  target: '_blank')
      end
    end
  end
end
