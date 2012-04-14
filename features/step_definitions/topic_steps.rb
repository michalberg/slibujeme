Then /^there should be topic "([^"]*)" with children:$/ do |title, children|
  # table is a Cucumber::Ast::Table
  @topic = Topic.find_by_title!(title)
  @topic.children.map{ |child| {"title" => child.title} }.should =~ children.hashes
end

Given /^there are the following topics:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    Topic.create!(attributes)
  end
end