# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "zip/filesystem"
require "tempfile"
require "fileutils"
require "workflow_parser/rapidminer/version"
require "workflow_parser/rapidminer/package"

module WorkflowParser
module RapidMiner
  class Parser
    def self.parse_stream(stream)
      Tempfile.open("rapid_miner") do |zip_file|
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
      WorkflowParser::RapidMiner::Package.parse(file)
    end

    def self.as_filename(filename_or_buffer)
      if filename_or_buffer.is_a?(String)
        return filename_or_buffer
      elsif filename_or_buffer.respond_to? :path
        return filename_or_buffer.path
      else
        # zip/filesystem does not seem to support
        # reading from a buffer :(
        Tempfile.open("rapid_miner") do |file|
          FileUtils.copy_stream(filename_or_buffer, file)
          file.close
          return file.path
        end
      end
    end

    def self.recognized?(file_or_buffer)
      zip = nil
      begin
        zip = Zip::File.open(as_filename(file_or_buffer))
        return !zip.find_entry("process.xml").nil?
      rescue
        return false
      ensure
        zip.close() if zip
      end
    end
  end
end
end
