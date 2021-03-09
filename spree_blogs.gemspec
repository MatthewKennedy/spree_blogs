lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require "spree_blogs/version"

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "spree_blogs"
  s.version = SpreeBlogs.version
  s.summary = "Shopify like blogging for Spree"
  s.description = "Adds multiple blogs to your Spree appliction with Action Text."
  s.required_ruby_version = ">= 2.2.7"

  s.author = "Matthew Kennedy"
  s.email = "m.kennedy@me.com"
  s.homepage = "https://github.com/matthewkennedy/spree_blogs"
  s.license = "BSD-3-Clause"

  s.files = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = "lib"
  s.requirements << "none"

  spree_version = ">= 3.2.0", "< 5.0"
  s.add_dependency "spree_core", spree_version
  s.add_dependency "spree_api", spree_version
  s.add_dependency "spree_backend", spree_version
  s.add_dependency "spree_extension"
  s.add_dependency "make_taggable", "~> 0.7.0"
  s.add_dependency "deface"

  s.add_development_dependency "spree_dev_tools"
end
