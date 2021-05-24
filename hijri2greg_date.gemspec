# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hijri2greg_date/version'

Gem::Specification.new do |spec|
  spec.name          = "hijri2greg_date"
  spec.version       = Hijri2gregDate::VERSION
  spec.authors       = ["Thaha Muhammed"]
  spec.email         = ["mthaha1989@gmail.com"]
  spec.summary       = %q{Converter:Gregorian to Hijri Date and vice versa}
  spec.description   = %q{This is a converter that can convert gregorian
    dates to hijri dates and similiarly hijri dates to gregorian}
  spec.homepage      = "https://github.com/stormvirux/hijri2greg_date"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake"
end
