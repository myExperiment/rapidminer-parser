# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "rapidminer/version"
require "rapidminer/package"
require "zip/filesystem"
require "stringio"

module RapidMiner
  class Parser
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
      RapidMiner::Package.parse(file)
    end

    def self.recognized?(file_or_buffer)
      buffer = ! file_or_buffer.is_a?(String)
      zip = nil
      begin 
        zip = Zip::File.new(file_or_buffer, false, buffer) 
        return !zip.find_entry("process.xml").nil?
      rescue
        return false
      ensure
        zip.close() if zip
      end
    end
  end
end
