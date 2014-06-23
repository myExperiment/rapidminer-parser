# Copyright (c) 2010-2014 University of Manchester and the University of Southampton
require "rapidminer/parser/version"

module Rapidminer
  module Parser
      def self.parse_stream(stream)
          Tempfile.open("rapid_miner", "tmp") do |zip_file|
            begin
              zip_file.write(stream)
              zip_file.close
	      parse_file(zip_file.path)
	    ensure 
	      zip_file.unlink()
	    end
	  end
      end
      def self.parse_file(file)
	      RapidMiner::Parser::Package.parse(file)
      end
  end
end
