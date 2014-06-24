# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "xml/libxml"

module RapidMiner
    # A RapidMiner operator.

    class Operator

      # The name of this operator.
      attr_accessor :name

      # Sub processes of this operator.
      attr_accessor :processes

      def self.parse(element)
        operator = RapidMiner::Operator.new
        operator.processes = []

        name = element.find("@name")

        operator.name = name[0].value if name.length > 0

        element.find('process').each do |process|
          operator.processes.push(RapidMiner::Process.parse(process))
        end

        operator
      end
     
      def get_components
        element = XML::Node.new("operator")
        element["name"] = name

        processes.each do |process|
          element << process.get_components
        end

        element
      end

    end
end
