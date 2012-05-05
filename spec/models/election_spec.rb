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
  
  describe "scopes" do
    it "running" do
      create(:election, :from => Date.today - 20.days, :to => Date.today - 15.days)
      running = create(:election, :from => Date.today - 3.days, :to => Date.today + 3.days)
      
      Election.all.count.should eql(2)
      Election.running.first.should eql(running)
      Election.running.count.should eql(1)
    end
  end
end
