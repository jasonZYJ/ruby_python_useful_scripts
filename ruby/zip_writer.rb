require 'zip'
module Purchasing
  class ZipWriter

    attr_accessor :input_dir, :output_file

    def initialize(input_dir, output_file)
      self.input_dir = input_dir
      self.output_file = output_file
    end

    def write
      entries = Dir.entries(input_dir) #TODO need to replace with sa file path
      entries.delete(".")
      entries.delete("..")
      zip = Zip::File.open(output_file, Zip::File::CREATE)
      write_entries(entries, "", zip)
      zip.close
    end

    def write_entries(entries, path, io)
      entries.each { |e|
        zip_file_path = path == "" ? e : File.join(path, e)
        disk_file_path = File.join(input_dir, zip_file_path)
        puts "Zipping " + disk_file_path #TODO Debug
        if File.directory?(disk_file_path)
          io.mkdir(zip_file_path)
          subdir =Dir.entries(disk_file_path); subdir.delete("."); subdir.delete("..")
          write_entries(subdir, zip_file_path, io)
        else
          io.get_ouDtput_stream(zip_file_path) { |f| f.puts(File.open(disk_file_path, "rb").read) }
        end
      }
    end

  end
end