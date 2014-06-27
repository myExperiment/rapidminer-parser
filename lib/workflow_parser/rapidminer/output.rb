# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "xml/libxml"

module WorkflowParser
module RapidMiner
  # A RapidMiner output.
  class Output

    # The location of the output.
    attr_accessor :location

    def get_components
      element = XML::Node.new("output")
      element["location"] = location
      element
    end
  end
end
end
