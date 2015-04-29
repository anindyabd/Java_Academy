Feature: Ability to submit code
  As a student learning Java
  So that I can submit my code to see if it's correct,
  I want a submit button that submits my code and gives me a result

  Background: The Academy has several lessons
    Given these Lessons:
     | name         | number  | description       | skeleton_code | expectedresults     | testcases | 
     | Hello World  | 100     | Write Hello World | skeleton code | 1,1                 | 1,1       |
     | Next Lesson  | 200     | Another Lesson    | more code     | 2                   | 2         |

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
    When I follow "Lesson 200"
    Then I should see "Submit"
    And I fill in the hidden field "#realacesubmit" with "public class HelloWorld { public static void main(String[] args){System.out.print(2); }  }"
    And I fill in the hidden field "#lessonid" with "2"
    And I press "Submit"
    Then I should see "Results"
    And I should see "Your code was submitted successfully!"
    And I should see "Your code returned this on standard output"
    And I should see "Congratulations, your code passed the test!" 

