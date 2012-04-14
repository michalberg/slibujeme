require 'spec_helper'

describe Topic do
  it "should form a tree" do
    parent = create(:topic)
    children = []
    3.times do
      children << create(:topic, :parent_id => parent.id)
    end
    
    parent.has_children?.should be_true
    parent.children.should =~ children
    children.each { |child| child.parent.should eql(parent) }
  end
end
