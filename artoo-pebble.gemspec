# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artoo-pebble/version"

Gem::Specification.new do |s|
  s.name        = "artoo-pebble"
  s.version     = Artoo::Pebble::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ron Evans"]
  s.email       = ["artoo@hybridgroup.com"]
  s.homepage    = "https://github.com/hybridgroup/artoo-pebble"
  s.summary     = %q{Artoo adaptor and driver for Pebble smart watch}
  s.description = %q{Artoo adaptor and driver for Pebble smart watch}

  s.rubyforge_project = "artoo-pebble"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'artoo', '~> 1.0.0.rc2'
  s.add_runtime_dependency 'hybridgroup-pebblewatch', '~> 0.1.2'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'minitest-happy'
  s.add_development_dependency 'mocha', '~> 0.14.0'
end
