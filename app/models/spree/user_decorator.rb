# frozen_string_literal: true

module Spree::UserDecorator
  def self.prepended(base)
    base.has_many :posts
  end
end

::Spree.user_class.prepend(::Spree::UserDecorator)
::Spree::PermittedAttributes.user_attributes.push :nickname
