# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-heroku_memcached-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-heroku_memcached-extension"
  s.version     = RadiantHerokuMemcachedExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantHerokuMemcachedExtension::AUTHORS
  s.email       = RadiantHerokuMemcachedExtension::EMAIL
  s.homepage    = RadiantHerokuMemcachedExtension::URL
  s.summary     = RadiantHerokuMemcachedExtension::SUMMARY
  s.description = RadiantHerokuMemcachedExtension::DESCRIPTION

  s.add_dependency "memcached-northscale", "~> 0.19.5.4"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end

  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  s.require_paths = ["lib"]
end
