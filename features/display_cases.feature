Feature: display a list of all cases
  
  As a collaborating physician
  I want to view all of my patient cases
  So that I can have all of my information in one place
  
Background: Cases by Clinician

  Given the following cases exist:
  | name                | age     | gender  |   diagnosis     |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
    
Scenario: View cases
    When I go to the home page
    Then I should see "Sally Mae"
    And I should see "Freddie Mac"

Scenario: Verify cases exist
    Given I am on the home page
    And I follow "Sally Mae"
    Then I should see "Breast Cancer"