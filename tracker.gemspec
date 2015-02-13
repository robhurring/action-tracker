# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracker/version'

Gem::Specification.new do |spec|
  spec.name          = "tracker"
  spec.version       = Tracker::VERSION
  spec.authors       = ["robhurring"]
  spec.email         = ["robhurring@gmail.com"]
  spec.summary       = %q{Service tracker}
  spec.description   = %q{Service tracker}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", ">= 3.2.18", "<= 4.1.10"
end
