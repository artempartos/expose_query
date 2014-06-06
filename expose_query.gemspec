# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'expose_query/version'

Gem::Specification.new do |spec|
  spec.name          = "expose_query"
  spec.version       = ExposeQuery::VERSION
  spec.authors       = ["Nick Chubarov"]
  spec.email         = ["nick.chubarov@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'decent_exposure', '~> 2.0'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'actionpack', '>= 3.1.0'
  spec.add_development_dependency 'activesupport', '>= 3.1.0'

end
