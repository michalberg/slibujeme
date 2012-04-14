Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

When /^I type in "([^\"]*)" into autocomplete list "([^\"]*)" and I choose "([^\"]*)"$/ do |typed, input_name,should_select|
   page.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("focus") }
   fill_in("#{input_name}",:with => typed)
   page.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("keydown") }
   sleep 1
   page.driver.browser.execute_script %Q{ $('.ui-menu-item a:contains("#{should_select}")').trigger("mouseenter").trigger("click"); }
end

When /^I type in "([^\"]*)" into javascript select box "([^\"]*)" and I choose "([^\"]*)"$/ do |typed, input_name,should_select|
   page.driver.browser.execute_script %Q{ $('li.search-field input').trigger("focus") }
   # fill_in("#{input_name}",:with => typed)
   page.driver.browser.execute_script %Q{ 
     $("label:contains('#{input_name}')").siblings().find("li.search-field input").val("#{typed}") 
    }
   page.driver.browser.execute_script %Q{ $('li.search-field input').trigger("keydown") }
   sleep 1
   page.driver.browser.execute_script %Q{ $('.chzn-results li:contains("#{should_select}")').trigger("mouseenter").trigger("click").trigger("mousedown").trigger("mouseup"); }
end