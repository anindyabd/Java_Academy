Feature: Ability to submit code
  As a student learning Java
  So that I can submit my code to see if it's correct,
  I want a submit button that submits my code and gives me a result

  Background: The Academy has several lessons
    Given these Lessons:
     | name         | number  | description       | skeleton_code | expectedresults | testcases | 
     | Hello World  | 100     | Write Hello World | skeleton code | Hi              | 1         |
     | Next Lesson  | 200     | Another Lesson    | more code     | Stuff           | 2         |

  Scenario: 
    Given I am on the lessons page
    When I follow "Lesson 100"
    Then I should see "Submit"
    And I press "Submit"
    Then I should see "Results"
    And I should see "We could not run your code"
    And I should see "Return to list of lessons"

  Scenario:
    Given I am on the lessons page
    When I follow "Lesson 100"
    Then I should see "Submit"
    And I enter the right code in the box
    And I press "Submit" 
    Then I should see "Results"
    And I should see "Your code executed successfully"
