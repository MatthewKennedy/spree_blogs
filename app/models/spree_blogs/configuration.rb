module SpreeBlogs
  class Configuration < Spree::Preferences::Configuration
    preference :use_action_text, :boolean, default: false
  end
end
