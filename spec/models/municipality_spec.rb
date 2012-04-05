require 'spec_helper'

describe Municipality do
  it "should form a tree" do
    parent = create(:municipality)
    children = []
    3.times do
      children << create(:municipality, :parent_id => parent.id)
    end
    
    parent.has_children?.should be_true
    parent.children.should =~ children
    children.each { |child| child.parent.should eql(parent) }
  end
  
  it "should form a multilevel tree" do
    level1 = create(:municipality)
    level2 = create(:municipality, :parent_id => level1.id)
    level3 = create(:municipality, :parent_id => level2.id)
    
    level1.is_root?.should be_true
    level1.descendants.should =~ [level2, level3]
    level2.descendants.should =~ [level3]
    level2.descendants.should =~ level2.children
    
    level2.parent.should eql(level1)
    level3.parent.should eql(level2)
  end
end
