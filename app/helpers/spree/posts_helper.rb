# frozen_string_literal: true

module Spree
  module PostsHelper
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
