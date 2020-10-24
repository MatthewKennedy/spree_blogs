# frozen_string_literal: true

module Spree
  module PostsHelper
    def post_link_list
      link = Struct.new(:name, :url)
      Post.recent.collect { |post| link.new(post.title, posts_slug(post)) }
    end

    def post_tag_list_html(post)
      post.tag_list.map { |tag| link_to tag, tag_path(tag) }.join(', ').html_safe
    end

    def tag_cloud(tags, classes)
      return [] if tags.blank?

      max_count = tags.max_by(&:count).count.to_f
      tags.each do |tag|
        index = ((tag.count / max_count) * (classes.size - 1))
        yield tag, classes[index.nan? ? 0 : index.round]
      end
    end
  end
end
