Feature: User profile
  As a student learning Java,
  So that I can track my progress as a learner,
  I want to have a user profile where I can see which lessons I have completed. 

  Background: The app contain a user profile
    Given these Users:
      | name | email            | password |
      | Adam | adam@colgate.edu | 12345678 |
    
    Given these Lessons:
     | name         | number  | description       | skeleton_code | expectedresults     | testcases | 
     | Hello World  | 100     | Write Hello World | skeleton code | 1,1                 | 1,1       |
     | Next Lesson  | 200     | Another Lesson    | more code     | Stuff               | 2         |


  Scenario:
    Given I am on the homepage
    When I follow "Sign in"
    Then I should see "Log in"
    When I fill in "Email" with "adam@colgate.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    Then I should see "Welcome adam@colgate.edu"
    When I follow "Sign out"
    Then I should see "Welcome to Java Academy"
    And I should not see "Welcom adam@colgate.edu"

  Scenario:
    Given I am on the homepage
    When I follow "Sign in" 
    And I fill in "Email" with "adam@colgate.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    And I follow "Lesson 100"
    And I fill in the hidden field "#realacesubmit" with "public class HelloWorld { public static void main(String[] args){System.out.print(1); } }"
    And I fill in the hidden field "#lessonid" with "1"
    And I press "Submit"
    Then I should see "Congratulations, your code passed the test!" 
    When I follow "Profile page"
    Then I should see "Lesson 100: Hello World"
 
