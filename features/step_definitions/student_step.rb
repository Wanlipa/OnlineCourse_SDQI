# Scenario: Student Register
Given("I am a student") do
  @student = FactoryGirl.build :student
  @st119000 = FactoryGirl.create :st119000
end

Given("there is a course") do
  @course = FactoryGirl.create :course
end

When("I visit the root page website") do
  visit '/'
end

Then("I should see a {string} link to register") do |string|
  expect(page).to have_link('Register')
end

When("I click the {string} link to register") do |string|
  find_link('Register').click
end

Then("I should see a Register form") do
  expect(page).to have_selector("form")
end

When("I add the information and submit Register") do
  fill_in 'Username',with: @student.username
  fill_in 'Email', with: @student.email
  fill_in 'Password', with: @student.password
  fill_in 'Password confirmation', with: @student.password_confirmation
  click_button 'Sign up'
  # save_and_open_page
end

Then("I should see my username as student") do
  expect(page).to have_content "Hello #{@student.username}"
end

# Scenario: Student Enrollment
When("I visit the root an log in") do
  visit '/'

  find_link('Log in').click

  fill_in 'Username', with: @st119000.username
  fill_in 'Password', with: @st119000.password
  click_button 'Log in'
end

Then("I should see a {string} link in home page") do |string|
  expect(page).to have_link('Courses')
end

When("I click the {string} link in home page") do |string|
  find_link('Course Page').click
end

Then("I should see a {string} link in the course") do |string|
  expect(page).to have_link('Read More...')
end

When("I click the {string} link in the course") do |string|
  find_link('Read More...').click
end

Then("I should see a {string} link to regis the course") do |string|
  expect(page).to have_link('Enroll Now')
end

When("I click the {string} link to regis the course") do |string|
  find_link('Enroll Now').click
end

Then("I should see a Enrollment Detail form") do
  expect(page).to have_selector("form")
end

When("I add the semester and year detail and submit") do
  select(1, :from => 'Semester')
  select(2018, :from => 'Year')
  click_button 'Regis'
  # save_and_open_page
end

Then("I should see the message enroll successfully") do
  expect(page).to have_content "You enroll the course successfully!!"
end

