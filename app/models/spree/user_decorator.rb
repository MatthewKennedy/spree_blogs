# frozen_string_literal: true

module Spree::UserDecorator
  def self.prepended(base)
    base.has_many :posts, foreign_key: :author_id
  end
end

::Spree.user_class.prepend(::Spree::UserDecorator)
::Spree::PermittedAttributes.user_attributes.push :nickname, :website_url, :bio_info
