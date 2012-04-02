Given /^there are the following municipalities:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    Municipality.create!(attributes)
  end
end
