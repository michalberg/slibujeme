# encoding: utf-8
require 'spec_helper'

describe Party do
  it "should have full_title" do
    party = build(:party, :full_title => "Celý název strany")
    party.full_title.should eql("Celý název strany")
  end
  
  describe "#to_s" do
    it "returns full_title if displayed value is set to it" do
      expected = "Full title"
      party = build(:party, :full_title => expected, :displayed_value => "full_title")
      party.to_s.should eql(expected)
    end
    
    it "returns title if displayed value is set to it" do
      expected = "Title"
      party = build(:party, :title => expected, :full_title => nil, :displayed_value => "title")
      party.to_s.should eql(expected)
    end
    
    it "falls back to title if display_value not set" do
      party = build(:party, :title => "PartyTitle")
      party.to_s.should eql("PartyTitle")
    end
  end
  
  it "validates full_title if displayed_value is full_title" do
    party = build(:party, :full_title => nil, :displayed_value => "full_title")
    party.valid?.should be_false
  end
end
