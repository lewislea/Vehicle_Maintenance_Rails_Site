Given(/^the user "(.*?)" with password "(.*?)"$/) do |username, password|
  user = User.create(:email => 'bob@example.com', :password => 'password1')
  refute user.new_record?
end

When(/^I go to the homepage$/) do
  visit '/'
end

When "I go to the vehicles page" do
  visit vehicles_path
end

When(/^I (?:click|press) "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field_named|
  fill_in field_named, with: value
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

Given (/^I am a new, authenticated user$/) do
  email = 'bob@example.com'
  password = '11111111'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"

end
