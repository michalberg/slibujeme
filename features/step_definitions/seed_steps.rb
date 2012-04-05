Then /^there should be municipality "([^"]*)" with parent "([^"]*)" and child "([^"]*)"$/ do |title, parent_title, child_title|
  m = Municipality.find_by_title!(title)
  m.parent.title.should eql(parent_title)
  m.children.exists?(:title => child_title).should be_true
end