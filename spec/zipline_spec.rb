require 'spec_helper'
require 'carrierwave/zipline'
require 'fake_upload'

describe Carrierwave::Zipline do
  let(:zipline) {Carrierwave::Zipline}

  context "when processing non zip file" do
    let(:file) {FakeUpload.new("spec/files/bad.txt")}
    it "should not fail" do
      total = zipline.process(file) {|f| true}
      expect(total).to be == 0
    end
  end

  context "when processing nil" do
    it "should not fail" do
      total = zipline.process(nil) {|f| true}
      expect(total).to be == 0
    end
  end

  context "when processing simple zip file" do
    let(:file) {FakeUpload.new("spec/files/simple.zip")}

    it "should contain a file named 'WP_000069.jpg'" do
      total = zipline.process(file) {|f| f.original_filename == "WP_000069.jpg"}
      expect(total).to be == 1
    end

    it "should contain 3 files" do
      total = zipline.process(file) {|f| true}
      expect(total).to be == 3
    end

    it "should sort content (A < a)" do
      list = []
      zipline.process(file) {|f| list << f.original_filename}
      expect(list).to have(3).items
      expect(list[0]).to start_with  "WP"
      expect(list[1]).to start_with  "bad.txt"
      expect(list[2]).to start_with  "polaroid"
    end
  end

  context "when processing osx zip with images" do
    let(:file) {FakeUpload.new("spec/files/osx-archive.zip")}

    it "should contain 3 files" do
      total = zipline.process(file) {|f| true}
      expect(total).to be == 3
    end
  end
end

