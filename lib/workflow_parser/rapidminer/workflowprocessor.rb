# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "workflow_parser/rapidminer/package"
require "workflow_parser/workflow_processor"


module WorkflowParser
module RapidMiner
  class WorkflowProcessor < WorkflowParser::WorkflowProcessor

    # Begin Class Methods

    # These:
    # - provide information about the Workflow Type supported by this processor,

    # MUST be unique across all processors
    def self.display_name
      "RapidMiner"
    end

    def self.display_data_format
      "XML"
    end

    def self.mime_type
      "application/vnd.rapidminer.rmp+zip"
    end

    # All the file extensions supported by this workflow processor.
    # Must be all in lowercase.
    def self.file_extensions_supported
      [ "xml", "zip" ]
    end

    def self.can_determine_type_from_file?
      true
    end

    def self.recognised?(file)
      file.rewind
      return WorkflowParser::RapidMiner::Parser.recognized?(file.path)
    rescue
      return false
    ensure
      file.rewind
    end

    def self.can_infer_metadata?
      true
    end

    def self.can_generate_preview_image?
      true
    end

    def self.can_generate_preview_svg?
      true
    end

    # End Class Methods


    # Begin Object Initializer

    def initialize(workflow_definition)
      super(workflow_definition)
      @rapid_miner_model = WorkflowParser::RapidMiner::Package.parse(workflow_definition)
    end

    # End Object Initializer


    # Begin Instance Methods

    # These provide more specific functionality for a given workflow definition, such as parsing for metadata and image generation.

    def get_title
      return nil if @rapid_miner_model.nil?
      return nil if @rapid_miner_model.title.blank?

      @rapid_miner_model.title
    end

    def get_description
      @rapid_miner_model.description
    end

    def get_workflow_model_object
      return @rapid_miner_model
    end

    def get_preview_image
      @rapid_miner_model.image
    end

    def get_preview_svg
      @rapid_miner_model.svg
    end

    def get_workflow_model_input_ports

    end

    def get_search_terms
      ""
    end

    def get_components
      @rapid_miner_model.get_components
    end

    # End Instance Methods
  end
end
end
