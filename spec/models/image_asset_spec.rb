require 'spec_helper'

describe ImageAsset do
  describe "#is_image?" do
    ["png", "jpg", "gif"].each do |image_type|
      it "returns true for #{image_type}" do
        img = ImageAsset.new
        img.image = Rack::Test::UploadedFile.new(Rails.root.join("factories", "files", "image_asset_fixture.#{image_type}"), "image/#{image_type}")
        img.save
        img.is_image?.should be_true
      end
    end
    
    it "returns false for pdf" do
      img = ImageAsset.new
      img.image = Rack::Test::UploadedFile.new(Rails.root.join("factories", "files", "image_asset_fixture.pdf"), "application/pdf")
      img.save
      img.is_image?.should be_false
    end
  end
end
