module ActsAsTaggableOn
  module TagDecorator
   def self.prepended(base)
       base.extend FriendlyId
       base.friendly_id :name, use: [:slugged, :finders]
   end
  end
end

if Spree::Config[:blogs_use_tags]
  ActsAsTaggableOn::Tag.prepend ActsAsTaggableOn::TagDecorator
end
