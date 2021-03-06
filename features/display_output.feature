Feature: Display output of running code to user
  As a student learning Java, 
  So that I can see the output of the code I typed in,
  I want a display that shows me the results of my code.
  
  Background: The Academy has several lessons
    Given these Lessons:
     | name         | number  | description       | skeleton_code | expectedresults   | testcases  | 
     | Hello World  | 100     | Write Hello World | skeleton code | ["Hello World\n"] | 1,2,3      |
     | Next Lesson  | 200     | Another Lesson    | more code     | ["Stuff\n"]       | 2,3,4      |

  Scenario: 
    Given I am on the lessons page
    When I follow "Lesson 100"
    Then I should see "Submit"
    And I press "Submit"
    Then I should see "Results"
    And I should see "We could not run your code"
    And I should see "Return to list of lessons"
    When I follow "Return to list of lessons"
    Then I should see "Lesson 100" 

  Scenario:
    Given I am on the lessons page
    When I follow "Lesson 100"
    And I fill in the hidden field "#realacesubmit" with "hi"
    And I fill in the hidden field "#lessonid" with "1"
    And I press "Submit"
    Then I should see "Results"
    And I should see "Your code was submitted successfully!"
    And I should see "We could not run your code"
