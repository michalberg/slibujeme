Given /^there are the following parties:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    Party.create!(attributes)
  end
end
