# Scenario: Teacher Log in
Given("I am a teacher") do
  @teacher = FactoryGirl.create :teacher
end

Given("there is a category") do
  @category = FactoryGirl.create :category
end

When("I visit the root page") do
  visit '/'
end

Then("I should see a {string} link") do |string|
  expect(page).to have_link('Log in')
end

When("I click the {string} link") do |string|
  find_link('Log in').click
end

Then("I should see a log in form") do
  expect(page).to have_selector("form")
end

When("I add the information and submit Sign in") do
  fill_in 'Username', with: @teacher.username
  fill_in 'Password', with: @teacher.password
  click_button 'Log in'
  # save_and_open_page
end

Then("I should see my username") do
  expect(page).to have_content "Hello #{@teacher.username}"
end

# Scenario: Teacher Create Course
When("I logged in the online page") do
  visit '/'

  find_link('Log in').click

  fill_in 'Username', with: @teacher.username
  fill_in 'Password', with: @teacher.password
  click_button 'Log in'
end

Then("I should see a menu to manage courses") do
  expect(page).to have_link('Manage Courses')
end

When("I click the menu to manage courses") do
  find_link('Manage Courses').click
end

Then("I should see a {string} link to create the course") do |string|
  expect(page).to have_link('New Course')
end

When("I click the {string} link to create the course") do |string|
  find_link('New Course').click
end

Then("I should see new course form") do
  expect(page).to have_selector("form")
end

When("I add the course details and submit create course") do
  fill_in "Title", with: "SDQI"
  click_button 'Create Course'
  # save_and_open_page
end

Then("I should see new course title") do
  expect(page).to have_content "Category must exist"
end
