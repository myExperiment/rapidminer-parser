require "minitest/autorun"
require "workflow_parser/rapidminer/workflowprocessor"
require "test_helper"

class WorkflowProcessorTest < MiniTest::Test
  def test_workflow_processor
    assert_equal "RapidMiner", WorkflowParser::RapidMiner::WorkflowProcessor.display_name
    assert_equal "XML", WorkflowParser::RapidMiner::WorkflowProcessor.display_data_format
    assert_equal "application/vnd.rapidminer.rmp+zip", WorkflowParser::RapidMiner::WorkflowProcessor.mime_type
    assert_equal ["xml", "zip"], WorkflowParser::RapidMiner::WorkflowProcessor.file_extensions_supported
    assert WorkflowParser::RapidMiner::WorkflowProcessor.recognised?(open(X_VALIDATION))
    assert ! WorkflowParser::RapidMiner::WorkflowProcessor.recognised?(open(X_VALIDATION_TXT))
    assert WorkflowParser::RapidMiner::WorkflowProcessor.can_infer_metadata?
    assert WorkflowParser::RapidMiner::WorkflowProcessor.can_generate_preview_image?
    assert WorkflowParser::RapidMiner::WorkflowProcessor.can_generate_preview_svg?
  end
end
