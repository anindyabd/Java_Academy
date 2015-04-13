Feature: List of lessons and exercises
  As a student learning Java,
  So that I can see what lessons and exercises are available to me,
  I want a page displaying the full list of lessons and exercises.

  Background: The Academy has several lessons
    Given these Lessons:
     | name         | number  | description       | skeleton_code | 
     | Hello World  | 100     | Write Hello World | skeleton code |
     | Next Lesson  | 200     | Another Lesson    | more code     |


  Scenario: 
    Given I am on the lessons page 
    Then I should see "Lesson 100"
    And I should see "Lesson 200"
    When I follow "Lesson 100"
    Then I should see "Write Hello World"

