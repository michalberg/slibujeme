require 'spec_helper'

describe Admin::PartiesController do
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
    it "returns http success with valid data" do
      post 'create', { :party => attributes_for(:party) }
      response.should redirect_to(admin_parties_path)
    end
    
    it "shows errors with invalid data" do
      post 'create', { :party => attributes_for(:party, :title => "") }      
      response.should be_success
      assigns(:party).errors[:title].count.should eql(1)
    end
  end

  context "with existing party" do
    before(:each) do
      @party = create(:party)
    end
    
    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit', { :id => @party.id }
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it "redirects to index" do
        put 'update', @party.attributes.merge(:title => "edited title")
        response.should redirect_to(admin_parties_path)
      end
    end

    describe "DELETE 'destroy'" do
      it "deletes party without materials and redirects to index" do
        delete 'destroy', { :id => @party.id }
        response.should redirect_to(admin_parties_path)
        expect { Party.find(@party.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
      
      it "refuses to delete party with material and redirects to index" do
        @material = build(:material)
        @material.image_assets << create(:image_asset)        
        @material.party = @party
        @material.save
        delete 'destroy', { :id => @party.id }
        response.should redirect_to(admin_parties_path)
        Party.find(@party.id).should eql(@party)
      end
    end
  end
end
