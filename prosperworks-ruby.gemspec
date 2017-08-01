# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prosperworks/version"

Gem::Specification.new do |spec|
  spec.name          = "prosperworks-ruby"
  spec.version       = ProsperWorks::VERSION
  spec.authors       = ["Neeraj Chandra"]
  spec.email         = ["nchandra324@gmail.com"]

  spec.summary       = %q{A Ruby gem for the ProsperWorks Developer API}
  spec.description   = %q{A lightweight interface for the ProsperWorks Developer API}
  spec.homepage      = "https://rubygems.org/gems/prosperworks-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 3.0"
end
