# Workflow parser for Rapidminer

Parse [RapidMiner](http://rapidminer.com/) workflows.

[![Build Status](https://travis-ci.org/myExperiment/workflow_parser-rapidminer.svg?branch=master)](https://travis-ci.org/myExperiment/workflow\_rapidminer)

## Installation

Add this line to your application's Gemfile:

    gem 'workflow_parser-rapidminer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install workflow_parser-rapidminer

## Usage

    include 'workflow_parser/rapidminer/parser
    wf = WorkflowParser::RapidMiner::Parser.parse_file("spec/x-validation_with_one-class_svm_636319.zip")


## Contributing

1. Fork it ( https://github.com/myExperiment/workflow\_parser-rapidminer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
