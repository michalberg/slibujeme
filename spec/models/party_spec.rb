# encoding: utf-8
require 'spec_helper'

describe Party do
  it "should have full_title" do
    party = build(:party, :full_title => "Celý název strany")
    party.full_title.should eql("Celý název strany")
  end
end
