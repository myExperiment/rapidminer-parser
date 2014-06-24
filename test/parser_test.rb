require "test/unit"
require "rapidminer/parser"

class ParserTest < Test::Unit::TestCase

    def test_parse_file
        wf = RapidMiner::Parser.parse_file("test/x-validation_with_one-class_svm_636319.zip")
        assert_equal("Temporary title", wf.title)
    end
end
