require "test/unit"
require "rapidminer/parser"

class ParserTest < Test::Unit::TestCase
  def test_parse_file
    package = RapidMiner::Parser.parse_file("test/x-validation_with_one-class_svm_636319.zip")
    assert_equal("X-Validation with One-Class SVM", package.title)
    assert_equal([], package.inputs)
    assert_equal([], package.outputs)
    assert_equal("Process", package.process.operators[0].name)
    process = package.process.operators[0].processes[0]
    assert_equal("Retrieve Sonar", process.operators[0].name)
    assert_equal("10fold X-Validation", process.operators[1].name)
    assert_equal("Only Rock examples", process.operators[1].processes[0].operators[0].name)
  end
  def test_get_components
    package = RapidMiner::Parser.parse_file("test/x-validation_with_one-class_svm_636319.zip")
    doc = LibXML::XML::Document.new
    doc.root = package.get_components
    #puts doc.root
    assert_equal("Process", doc.find("/components/process/operator/@name").first.value)
    # Remember xpath arrays are 1-based... :/
    assert_equal("Retrieve Sonar", 
                 doc.find("/components/process/operator/process/operator[1]/@name").first.value)
    assert_equal("10fold X-Validation", 
                 doc.find("/components/process/operator/process/operator[2]/@name").first.value)
    assert_equal("Only Rock examples", 
                 doc.find("/components/process/operator/process/operator[2]/process/operator[1]/@name").first.value)
  end
end
