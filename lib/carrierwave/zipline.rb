require "carrierwave/zipline/version"
require "carrierwave/zipline/fileless_file"
require "zippy"

module Carrierwave
  module Zipline
    # Processes all files in the zipfile by passing a FilelessFile to a block
    # It will increment the number of files added each time the block yeilds a truthy value
    #
    # @param [ActionController::UploadedTempFile] zip_file the uploaded zipfile (uses #tempfile and #original_filename)
    # @yield [FilelessFile] A file less file that can be processed by carrierwave. Return a boolean for correct file count.
    # @return [Integer] the number of files added
    def self.process(zip_file)
      nbr_files = 0
      if zip_file and is_zip?(zip_file)
        Zippy.open(zip_file.tempfile) do |zip|
          Zippy.list(zip_file.tempfile).sort().each do |name|
            next if name =~ /__MACOSX|^\.|\/$/
            if yield(FilelessFile.new(zip[name], name))
              nbr_files +=1
            end
          end
        end
      end
      nbr_files
    end

    private
    def self.is_zip?(file)
      #Better check than .zip?
      File.extname(file.original_filename).downcase == ".zip"
    end
  end
end
