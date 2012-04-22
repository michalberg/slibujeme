require 'spec_helper'

describe Admin::MaterialsController do
  before(:each) do
    @admin = create(:admin_user)
    sign_in(@admin)
  end
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success"
  end

  describe "PUT 'update'" do
    it "returns http success"
  end

end
