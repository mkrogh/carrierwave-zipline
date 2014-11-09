# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/zipline/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-zipline"
  spec.version       = Carrierwave::Zipline::VERSION
  spec.authors       = ["Markus Krogh"]
  spec.email         = ["markus@casadelkrogh.dk"]
  spec.summary       = %q{Simple zipfile handler for carrierwave uploads. Allows you to process the zipfile directly on upload.}
  spec.description   = %q{Handle zipfile content using stringIO (in memory) file mocks.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
