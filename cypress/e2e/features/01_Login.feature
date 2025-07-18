Feature: User Authentication 
 
 Scenario Outline: User logs in with valid credentials
   Given user is on the login page
   When user logs in using username "<username>" and password "<password>"
   Then user should see the dashboard page
 
   Examples:
     | username | password  |
     | Admin    | admin123  |
 
Scenario Outline: User logs in with invalid credentials
    Given the user is on the login page
    When the user logs in using username "<username>" and password "<password>"
    Then an error message "Invalid credentials" should be shown

    Examples:
      | username | password    |
      | Admin    | wrongpass   |
      | invalid  | admin123    |


Scenario: User successfully logs out
    Background:
      Given the user is on the OrangeHRM login page
      When the user enters username "Admin" and password "admin123"
      And clicks the login button
      Then the user should be redirected to the Dashboard page

    When the user clicks on their profile section to open the dropdown
    And selects the "Logout" option
    Then the user should be redirected back to the login page
