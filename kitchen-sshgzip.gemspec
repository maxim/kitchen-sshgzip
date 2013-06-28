# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/sshgzip/version'

Gem::Specification.new do |spec|
  spec.name          = "kitchen-sshgzip"
  spec.version       = Kitchen::Sshgzip::VERSION
  spec.authors       = ["Maxim Chernyak"]
  spec.email         = ["max@bitsonnet.com"]
  spec.description   = %q{Speeds up test-kitchen scp uploads by gzipping directories}
  spec.summary       = %q{Speeds up test-kitchen scp uploads by gzipping directories}
  spec.homepage      = "http://github.com/maxim/kitchen-sshgzip"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'test-kitchen', '> 0.9'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
