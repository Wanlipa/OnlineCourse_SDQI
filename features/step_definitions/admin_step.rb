Given("I am an Admin") do
  @admin = FactoryGirl.create :admin
end

Then("I should see the login Link in home page") do
  expect(page).to have_link('Log in')
end

When("I click the login link in home page") do
  find_link('Log in').click
end

Then("I Should see a sign in form") do
  expect(page).to have_selector("form")
end

When("I fill in the details and submit") do
  fill_in 'Username', with: @admin.username
  fill_in 'Password', with: @admin.password
  click_button 'Log in'
end

Then("I Should see the Admin Dashboard Link") do
  expect(page).to have_link('Admin Dashboard')
end

When("I Click on Admin Dashboard") do
  find_link('Admin Dashboard').click
  # save_and_open_page
end

Then("I should see the site administration") do
  expect(page).to have_content "Site Administration"
end

