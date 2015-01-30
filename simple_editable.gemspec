$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_editable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_editable"
  s.version     = SimpleEditable::VERSION
  s.authors     = ["Alexey"]
  s.email       = ["mail@brocoders.com"]
  s.homepage    = "http://brocoders.com"
  s.summary     = "Quick inline editing gem"
  s.description = "This gem makes possible to edit objects and plain text in one click"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 4.0', '<= 4.2'

  s.add_dependency 'jquery-rails'

  s.add_development_dependency "sqlite3"
end
