Given /^there are the following elections:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    Election.create!(attributes)
  end
end
