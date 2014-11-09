class FakeUpload
  attr_accessor :file, :original_filename

  def initialize(file)
    @file = file
    @original_filename = File.basename file
  end

  def tempfile
    open(@file)
  end
end
