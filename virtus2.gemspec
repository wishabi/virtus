# -*- encoding: utf-8 -*-

require File.expand_path('../lib/virtus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "virtus2"
  gem.version     = Virtus::VERSION.dup
  gem.authors     = [ "Piotr Solnica", "Daniel Orner" ]
  gem.email       = [ "dmorner@gmail.com" ]
  gem.description = "Attributes on Steroids for Plain Old Ruby Objects"
  gem.summary     = gem.description
  gem.homepage    = "https://github.com/wishabi/virtus2"
  gem.license     = 'MIT'

  gem.require_paths    = [ "lib" ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md TODO.md]

  gem.add_dependency('descendants_tracker', '~> 0.0', '>= 0.0.3')
  gem.add_dependency('coercible', '~> 1.0')
  gem.add_dependency('axiom-types', '~> 0.1')

  gem.add_development_dependency 'rake'
  gem.required_ruby_version = '>= 2.0'
end
