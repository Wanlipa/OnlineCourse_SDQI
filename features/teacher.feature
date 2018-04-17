Feature: Teacher
  In order to let teacher sign in to Online Course web application
  and can see manage course.

  Background:
    Given I am a teacher
    Given there is a category

  Scenario: Teacher can log in Online Course page
  The teacher should be able to log in

    When I visit the root page
    Then I should see a "Log in" link
    When I click the "Log in" link
    Then I should see a log in form
    When I add the information and submit Sign in
    Then I should see my username

  Scenario: Teacher can create the course
    When I logged in the online page
    Then I should see a menu to manage courses
    When I click the menu to manage courses
    Then I should see a "New Course" link to create the course
    When I click the "New Course" link to create the course
    Then I should see new course form
    When I add the course details and submit create course
    Then I should see new course title
