require 'spec_helper'

describe Admin::TopicsController do
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
    it "redirects to index" do
      post 'create', {:topic => attributes_for(:topic, :parent_id => "") }
      response.should redirect_to(admin_topics_path)
    end
  end

  context "with existing record" do
    before(:each) do
      @topic = create(:topic)
    end
    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit', {:id => @topic.id }
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it "with proper params redirect to index" do
        put 'update', @topic.attributes.merge(:title => "edited title")
        response.should redirect_to(admin_topics_path)
      end
    end

    describe "DELETE 'destroy'" do
      it "deletes topic and redirects to index if no materials have that topic" do
        delete 'destroy', {:id => @topic.id}
        response.should redirect_to(admin_topics_path)
        expect { Topic.find(@topic.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it "refuses to delete and redirecs to index if some materials have this topic" do
        @material = build(:material)
        @material.image_assets << create(:image_asset)
        @material.topics << @topic
        @material.save
        delete 'destroy', {:id => @topic.id}
        response.should redirect_to(admin_topics_path)
        Topic.find(@topic.id).should eql(@topic)
      end
    end
  end
end
