# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toggle_switch/version'

Gem::Specification.new do |spec|
  spec.name          = "toggle_switch"
  spec.version       = ToggleSwitch::VERSION
  spec.authors       = ["Tatumaki"]
  spec.email         = ["tatumaki.x.euphoric@gmail.com"]

  spec.summary       = %q{ToggleSwitch is a useful switcher if complex configuration.}
  spec.description   = %q{ToggleSwitch provides switched block to your complexed configuration.}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
