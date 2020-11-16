module MakeTaggable
  module TagDecorator
    def self.prepended(base)
      base.extend FriendlyId
      base.friendly_id :name, use: [:slugged, :finders]
    end
  end
end

MakeTaggable::Tag.prepend MakeTaggable::TagDecorator
