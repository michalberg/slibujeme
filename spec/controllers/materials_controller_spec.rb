require 'spec_helper'

describe MaterialsController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:material) { create(:material) }
    it "returns http success" do
      get 'show', {:id => material.id}
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
    let(:material) { build(:material, :id => 1) }
    let(:user) { build(:user) }
    it "redirects to material detail" do
      attrs = { 
        "material" => material.attributes.delete_if { |_, val| !val }, 
        "user" => {"email" => user.email},
        "material_polititians" => "Politik1, Politik2"
      }

      post 'create', attrs
      response.should redirect_to(material_path(material.id))
    end
  end
end
