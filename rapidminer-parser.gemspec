# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapidminer/parser/version'

Gem::Specification.new do |spec|
  spec.name          = "rapidminer-parser"
  spec.version       = Rapidminer::Parser::VERSION
  spec.authors       = ["Don Cruickshank", "Stian Soiland-Reyes"]
  spec.email         = ["support@mygrid.org.uk"]
  spec.summary       = %q{RapidMiner workflow parser}
  spec.description   = %q{Parser for RapidMiner workflows, exposing title, description, inputs, outputs, etc.}
  spec.homepage      = "https://github.com/myExperiment/rapidminer-parser"
  spec.license       = "BSD-3-Clause"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
