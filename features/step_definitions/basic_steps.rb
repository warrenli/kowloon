require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

假設 /^新登記的帳戶不會自動生效$/ do
  APP_CONFIG[:auto_activate] = false
end

假設 /^新登記的帳戶會自動生效$/ do
  APP_CONFIG[:auto_activate] = true
end

# Given /^I am on (.+)$/ do |page_name|
假設 /^我?來到了(.+)$/ do |page_name|
  visit path_to(page_name)
end

那麼 /^停留在登記版面!$/ do
  URI.parse(current_url).path.should == "/account"
end

那麼 /^被引導到(.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

# When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
當 /^我?在"([^\"]*)"欄位中輸入"([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

# When /^I press "([^\"]*)"$/ do |button|
當 /^我?按下了"([^\"]*)"按钮$/ do |button|
  click_button(button)
end

# Then /^I should see "([^\"]*)"$/ do |text|
那麼 /^我?應該看到"([^\"]*)"的提示信息$/ do |text|
  response.should contain(text)
end

