# frozen_string_literal: true

class Spree::PostImage < Spree::Asset
  has_one_attached :attachment

  validates :attachment, attached: true, content_type: %i[png jpg jpeg gif]
end
