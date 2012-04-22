require 'spec_helper'

describe Admin::MunicipalitiesController do
  before(:each) do
    @user = create(:admin_user)
    sign_in @user
  end
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
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
    it "returns http success" do
      post 'create', { :municipality => attributes_for(:municipality) }
      response.should redirect_to(admin_municipalities_path)
    end
  end

  context "with existing record" do
    before(:each) do
      @municipality = create(:municipality)
    end
    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit', { :id => @municipality.id }
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it "with valid data redirects to index" do
        put 'update', @municipality.attributes.merge(:title => "edited title")
        response.should redirect_to(admin_municipalities_path)
      end
    end

    describe "DELETE 'destroy'" do
      it "with no materials attached to municipality deletes and redirect to index" do
        delete 'destroy', { :id => @municipality.id }
        response.should redirect_to(admin_municipalities_path)
        expect { Municipality.find @municipality.id }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
