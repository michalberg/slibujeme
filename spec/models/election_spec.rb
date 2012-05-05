require 'spec_helper'

describe Election do
  describe "validations" do
    ["from", "to"].each do |date_attr|
      it "validates presence of #{date_attr}" do
        election = build(:election, date_attr.to_sym => nil)
        election.valid?.should be_false
      end
    end
    
    it "validates that to is always after from" do
      election = build(:election, :from => Date.today, :to => Date.today - 1.day)
      election.valid?.should be_false
    end
  end
end
