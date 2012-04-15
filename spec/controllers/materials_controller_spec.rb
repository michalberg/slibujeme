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
    it "redirects to materia detail" do
      post 'create', material.attributes.merge({ :material_polititians => "Politik1, Politik2"})
      response.should redirect_to(material_path(material.id))
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "UPDATE 'update'" do
    it "returns http success" do
      pending
      update 'update'
      response.should be_success
    end
  end

end
