Given /^there are the following parties:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    Party.create!(attributes)
  end
end

Then /^there should be the following parties created:$/ do |table|
  table.hashes.each { |attributes| Party.find_by_title!(attributes[:title]) }
end
