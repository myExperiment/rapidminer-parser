include RapidMiner

describe "parser" do
  it "parses x-validation workflow" do
    RapidMiner::Parser.parse_file("x-validation_with_one-class_svm_636319.zip")
  end
end
