Feature: Sign up page
  As a student learning Java,
  So that I can get access to a profile to track my progress,
  I want a sign up page that allows me to sign up.

  Background:

  Scenario:
    Given I am on the homepage
    And I press "Sign up"
    Then I should be on the "Sign up" page
    And I should see "Submit"

  Scenario:
    Given I am on the "Sign up" page
    And I enter my information
    And I press "Submit"
    Then I should see "Sign up successful"
    And I should be on my personal page
    
  
