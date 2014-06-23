require 'rapidminer/parser'

describe "parser" do
  it "parses x-validation workflow" do
    RapidMiner::Parser.parse_file("spec/x-validation_with_one-class_svm_636319.zip")
  end
end
