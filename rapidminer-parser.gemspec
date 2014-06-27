# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workflow_parser/rapidminer/version'

Gem::Specification.new do |spec|
  spec.name          = "workflow_parser-rapidminer"
  spec.version       = WorkflowParser::RapidMiner::VERSION
  spec.authors       = ["Don Cruickshank", "Stian Soiland-Reyes"]
  spec.email         = ["support@mygrid.org.uk"]
  spec.summary       = %q{RapidMiner workflow parser}
  spec.description   = %q{Parser for RapidMiner workflows, exposing title, description, inputs, outputs, etc.}
  spec.homepage      = "https://github.com/myExperiment/workflow_parser-rapidminer"
  spec.license       = "BSD-3-Clause"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.3"
  spec.add_development_dependency "coveralls"
  spec.add_runtime_dependency "rubyzip", "~> 1.1.4"
  spec.add_runtime_dependency "libxml-ruby", '~> 2.6.0'
  spec.add_runtime_dependency "workflow_parser", "~> 0.0"
end
