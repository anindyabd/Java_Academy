Feature: Sign up page
  As a student learning Java,
  So that I can get access to a profile to track my progress,
  I want a sign up page that allows me to sign up.

  Background:

  Scenario:
    Given I am on the homepage
    When I follow "Sign up"
    Then I should see "Sign up"
    And I should see "Submit" button

  Scenario:
    Given I am on the homepage
    When I follow "Sign up" 
    And I fill in "Name" with "Minh"
    And I fill in "Email" with "dnguyen@colgate.edu"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678" 
    And I press "Submit"
    Then I should see "Welcome Minh"
    
  
