# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "cgi"
require "xml/libxml"
require "zip/filesystem"
require "workflow_parser/rapidminer/input"
require "workflow_parser/rapidminer/output"
require "workflow_parser/rapidminer/process"
require "workflow_parser/rapidminer/operator"

# This is the concept of the RapidMiner package that myExperiment deals with

module WorkflowParser
module RapidMiner
  class Package

    # Title of the workflow.
    attr_accessor :title

    # Description of the workflow.
    attr_accessor :description

    # Preview image of the workflow.
    attr_accessor :image

    # Preview SVG of the workflow.
    attr_accessor :svg

    # Inputs to the workflow.
    attr_accessor :inputs

    # Outputs of the workflow.
    attr_accessor :outputs

    # The root process of the workflow.
    attr_accessor :process

    def self.parse(file_path)
      package = WorkflowParser::RapidMiner::Package.new

      Zip::File.open(file_path) do |zip|

        image = StringIO.new(zip.read("preview.png"))
        #image.original_filename = 'preview.png'

        svg = StringIO.new(zip.read("preview.svg"))
        #svg.original_filename = 'preview.svg'

        process = LibXML::XML::Parser.io(zip.get_input_stream("process.xml")).parse

        package.title = CGI.unescapeHTML(process.find("/process/title/text()")[0].to_s)
        package.description = CGI.unescapeHTML(process.find("/process/operator/description/text()")[0].to_s)
        package.image     = image
        package.svg     = svg
        package.process   = WorkflowParser::RapidMiner::Process.parse(process.find("/process")[0])
        package.inputs    = []
        package.outputs   = []

        # Parse the context of the workflow.

        process.find("/process/context/input/location").each do |element|
          input = WorkflowParser::RapidMiner::Input.new
          input.location = element.find("text()")[0].to_s
          package.inputs.push(input)
        end

        process.find("/process/context/output/location").each do |element|
          output = WorkflowParser::RapidMiner::Output.new
          output.location = element.find("text()")[0].to_s
          package.outputs.push(output)
        end
      end
      package
    end

    def get_components
      components = XML::Node.new("components")

      input_els  = XML::Node.new("inputs")
      output_els = XML::Node.new("outputs")

      inputs.each do |input|
        input_els << input.get_components
      end

      outputs.each do |output|
        output_els << output.get_components
      end

      components << process.get_components
      components << input_els
      components << output_els
    end

    def all_operators_aux(process, result)
      process.operators.each do |operator|
        result << operator

        operator.processes.each do |sub_process|
          all_operators_aux(sub_process, result)
        end
      end

      result
    end

    def all_operators
      all_operators_aux(process, [])
    end
  end
end
end
