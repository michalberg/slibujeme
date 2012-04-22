require 'spec_helper'

describe Admin::PolititiansController do
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

  context "with existing record" do
    before(:each) do
      @polititian = create(:polititian)
    end
    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit', { :id => @polititian.id }
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it "with valid data redirects to index" do
        put 'update', @polititian.attributes.merge(:name => "Foo Bar")
        response.should redirect_to(admin_polititians_path)
      end
    end
  end
end
