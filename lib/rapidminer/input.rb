# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "xml/libxml"

module RapidMiner

    # A RapidMiner input.

    class Input
    
      # The location of the input.
      attr_accessor :location

      def get_components
        element = XML::Node.new("input")
        element["location"] = location
        element
      end
    end
end
