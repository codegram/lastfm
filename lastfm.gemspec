# -*- encoding: utf-8 -*-
require File.expand_path("../lib/lastfm/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "lastfm"
  s.version     = LastFM::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Josep M. Bach', 'Josep Jaume Rey', 'Oriol Gual']
  s.email       = ['info@codegram.com']
  s.homepage    = "http://github.com/codegram/lastfm"
  s.summary     = "Simple LastFM client"
  s.description = "Simple LastFM client"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "lastfm"

  s.add_runtime_dependency "crack"

  s.add_development_dependency "bundler", ">= 1.0.2"
  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "vcr"
  s.add_development_dependency "simplecov"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
