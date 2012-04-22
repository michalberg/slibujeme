require "spec_helper"

describe "/api/v1/parties", :type => :api do
  before do
    @parties = []
    3.times { @parties << create(:party) }
  end
  context "parties are viewable" do
    let(:url) { "/api/v1/parties" }
    it "json" do
      get "#{url}.json"
      
      parties_json = @parties.to_json
      last_response.body.should eql(parties_json)
      last_response.status.should eql(200)
      
      # parties = JSON.parse(last_response.body)
      # parties.any? do |p|
      #   
      # end
    end
  end
end