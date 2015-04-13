Feature: Lesson page layout
  As a student learning Java
  So that I have pages containing lessons in a nice format
  I want a page layout that contains a lesson

  Background: The Academy has several lessons
    Given these Lessons:
     | name         | number  | description       | skeleton_code | expectedresults | testcases | 
     | Hello World  | 100     | Write Hello World | skeleton code | Hi              | 1         |
     | Next Lesson  | 200     | Another Lesson    | more code     | Stuff           | 2         |

  Scenario: 
    Given I am on the lessons page
    When I follow "Lesson 100"
    Then I should see "Write Hello World"
    When I follow "Return to list of lessons"
    Then I should see "Lesson 200"
    When I follow "Lesson 200"
    Then I should see "Another Lesson"
    And I should see "more code"