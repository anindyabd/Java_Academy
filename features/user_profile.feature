Feature: User profile
  As a student learning Java,
  So that I can track my progress as a learner,
  I want to have a user profile where I can see which lessons I have completed. 

  Background: The app contain a user profile
    id | password 
    Adam | 1234
    

  Scenario:
    Given I am on the homepage
    When I log in as Adam
    Then I should be on my user profile
    And I should be able to see the lessons list
    And I should see the lesson I have completed
