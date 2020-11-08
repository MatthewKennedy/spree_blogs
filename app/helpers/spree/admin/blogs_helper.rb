# frozen_string_literal: true

module Spree
  module Admin
    module BlogsHelper
      def view_in_store_link(blog, store)

        unless store.url[/\Ahttp:\/\//] || store.url[/\Ahttps:\/\//]
          store_url = "http://#{store.url}"
        end

        link_to(store.unique_name, store_url + blog_path(blog), class: "dropdown-item py-2 px-3")
      end
    end
  end
end
