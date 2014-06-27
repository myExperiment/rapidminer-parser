require "minitest/autorun"
require "rapidminer/workflowprocessor"
require "test_helper"

class WorkflowProcessorTest < MiniTest::Test
  def test_workflow_processor
    assert_equal "RapidMiner", RapidMiner::WorkflowProcessor.display_name
    assert_equal "XML", RapidMiner::WorkflowProcessor.display_data_format
    assert_equal "application/vnd.rapidminer.rmp+zip", RapidMiner::WorkflowProcessor.mime_type
    assert_equal ["xml", "zip"], RapidMiner::WorkflowProcessor.file_extensions_supported
    assert RapidMiner::WorkflowProcessor.recognised?(open(X_VALIDATION))
    assert ! RapidMiner::WorkflowProcessor.recognised?(open(X_VALIDATION_TXT))
    assert RapidMiner::WorkflowProcessor.can_infer_metadata?
    assert RapidMiner::WorkflowProcessor.can_generate_preview_image?
    assert RapidMiner::WorkflowProcessor.can_generate_preview_svg?
  end
end