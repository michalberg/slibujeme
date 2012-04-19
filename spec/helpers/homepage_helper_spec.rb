require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomepageHelper. For example:
#
# describe HomepageHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HomepageHelper do
  describe "generates proper thumbnail code for material" do
    it "as image tag when only image_assets" do
      material = build(:material)
      material.image_assets << build(:image_asset)
      material.save

      helper.render_asset_for_random_material(material).should match(/<img alt="\w+" src=".+image_asset_fixture\.png\?(\d+)" \/>/)
    end

    it "as placeholder div when no assets at all" do
      material = build(:material)
      material.save

      helper.render_asset_for_random_material(material).should eql("<div class=\"homepage-random-box-placeholder\"></div>")
    end
  end
end
