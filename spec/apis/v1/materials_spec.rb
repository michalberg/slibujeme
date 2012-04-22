require "spec_helper"

describe "/api/v1/materials", :type => :api do
  before do
    @materials = []
    11.times do
      material = build(:material)
      material.image_assets << create(:image_asset)
      material.save
      @materials << material
    end
  end
  context "viewing" do
    let(:url) { "/api/v1/materials" }
    
    it "json without params returns last 10 materials" do
      get "#{url}.json"
      
      last_response.body.should eql(@materials.reverse![1, 10].to_json(
        :only => [:id], 
        :include => { 
          :image_assets => { :methods => :image_url, :only => [:id, :image_url] }, 
          :party => { :only => [:id, :title] }, 
          :election => { :only => [:id, :title] }, 
          :topics => { :only => [:id, :title] }, 
          :municipality => { :methods => :full_title, :only => [:id, :full_title] }, 
          :polititians => { :only => [:id, :name] } 
        }
      ))
      last_response.status.should eql(200)
    end
  end
end