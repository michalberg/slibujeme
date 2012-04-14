# encoding: utf-8
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
  
  context "#full_title" do
    let!(:shire) { create(:municipality, :title => "Jihomoravský kraj") }
    let!(:district) do |district| 
      district = build(:municipality, :title => "Brno-Město")
      district.parent = shire
      district.save
      district
    end
    
    let! :city do |city|
      city = create(:municipality, :title => "Brno")
      city.parent = district
      city.save
      city
    end
    
    it "is title with parent district in bracket if city" do
      city.full_title.should eql("Brno (okr. Brno-Město)")
    end
    
    it "is only title if district" do
      district.full_title.should eql("Brno-Město")
    end
    
    it "is only title if shire" do
      shire.full_title.should eql("Jihomoravský kraj")
    end
  end
end
