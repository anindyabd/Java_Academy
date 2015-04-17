Feature: User profile
  As a student learning Java,
  So that I can track my progress as a learner,
  I want to have a user profile where I can see which lessons I have completed. 

  Background: The app contain a user profile
    Given these Users:
      | name | email            | password |
      | Adam | adam@colgate.edu | 12345678 |
    

  Scenario:
    Given I am on the homepage
    When I follow "Sign in"
    Then I should see "Log in"
    When I fill in "Email" with "adam@colgate.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    Then I should see "Welcome adam@colgate.edu"
