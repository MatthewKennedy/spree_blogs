# frozen_string_literal: true

module Spree
  module Admin
    module BlogsHelper
      def view_in_store_link(blog, store)
        link_to(store.unique_name, store.url + blog_url(blog), class: "dropdown-item py-2 px-3")
      end
    end
  end
end
