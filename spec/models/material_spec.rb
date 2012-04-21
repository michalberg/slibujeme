require 'spec_helper'

describe Material do
  it "validates if it has at least one asset" do
    @material = build(:material)
    @material.image_assets << build(:image_asset)
    @material.valid?.should be_true
  end
  
  it "is not valid if type of asset present" do
    @material = build(:material)
    @material.image_assets = @material.video_assets = []
    @material.valid?.should_not be_true
  end
end
