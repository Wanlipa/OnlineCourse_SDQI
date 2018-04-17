Feature: Student
  In order to let student register to Online Course web application
  and can see courses.

  Background:
    Given I am a student
    Given there is a course

  Scenario: Student can register Online Course page
  The student should be able to register

    When I visit the root page website
    Then I should see a "Register" link to register
    When I click the "Register" link to register
    Then I should see a Register form
    When I add the information and submit Register
    Then I should see my username as student


  Scenario: Student can enroll the course

    When I visit the root an log in
    Then I should see a "Courses" link in home page
    When I click the "Courses" link in home page
    Then I should see a "Read More..." link in the course
    When I click the "Read More..." link in the course
    Then I should see a "Enroll Now" link to regis the course
    When I click the "Enroll Now" link to regis the course
    Then I should see a Enrollment Detail form
    When I add the semester and year detail and submit
    Then I should see the message enroll successfully