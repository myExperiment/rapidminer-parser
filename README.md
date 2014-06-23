# Rapidminer parser

Parse RapidMiner workflows.

## Installation

Add this line to your application's Gemfile:

    gem 'rapidminer-parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rapidminer-parser

## Usage

    include 'rapidminer/parser
    wf = RapidMiner::Parser.parse_file("spec/x-validation_with_one-class_svm_636319.zip")


## Contributing

1. Fork it ( https://github.com/myExperiment/rapidminer-parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
