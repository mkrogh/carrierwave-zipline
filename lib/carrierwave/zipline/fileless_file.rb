module Carrierwave
  module Zipline
    #A nice little carrierwave class
    class FilelessFile < StringIO
      attr_accessor :original_filename
      def initialize(file, name=nil)
        super(file)
        @original_filename = name
      end

      def ext
        File.extname(@original_filename).delete(".").downcase
      end
    end
  end
end
