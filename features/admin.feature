Feature: admin
  In order to let admins sign in to Online Course
  ,access the dashboard

  Background:
    Given I am an Admin
    When I visit the root page
    Then I should see the login Link in home page
    When I click the login link in home page
    Then I Should see a sign in form
    When I fill in the details and submit

  Scenario: Admin can access the Admin Dashboard

    Then I Should see the Admin Dashboard Link
    When I Click on Admin Dashboard
    Then I should see the site administration
