require 'spec_helper'

describe MaterialsController do
  describe "GET 'search'" do
    it "without search query redirects to root_path" do
      get 'search'
      response.should redirect_to(root_path)
    end

    it "returns http success with search query" do
      get 'search', {:q => "Brno"}
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @material = build(:material)
      @material.image_assets << create(:image_asset)
      @material.save
    end

    it "returns http success" do
      get 'show', {:id => @material.id}
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @material = build(:material, :id => 1)
    end
    it "redirects to material detail" do
      attrs = {
        "material" => @material.attributes.merge({:image_assets_attributes => [attributes_for(:image_asset)]}).delete_if { |_, val| !val },
        "user" => {"email" => "foo@bar.baz" },
        "material_polititians" => "Politik1, Politik2"
      }

      post 'create', attrs
      response.should redirect_to(material_path(@material.id))
    end
  end
end
