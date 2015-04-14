Feature: Text editor for adding code
  As a student learning Java,
  So that I can type in code for the lesson/exercise I'm on,
  I want a text editor to type in code

  Background: The Academy has several lessons
  Given these Lessons:
     | name         | number  | description       | skeleton_code | 
     | Hello World  | 100       | Write Hello World | skeleton code |

  Scenario: 
    Given I am on the lessons page 
    When I follow "Lesson 100"
    Then I should see "skeleton code"

  Scenario:
    Given I am on the "Lesson 100" page
    Then I should see the editor
    And I should be able to type code into the editor


