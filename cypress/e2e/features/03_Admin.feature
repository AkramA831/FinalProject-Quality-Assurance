Feature: Admin - User Management

  As an Admin, I want to add new users and search for existing ones
  to manage system access effectively.

  Background:
    Given the user is logged in as an Admin
    And the user navigates to the Admin user management page

  Scenario Outline: Admin successfully adds a new user
    When the admin clicks the 'Add' button
    And selects the user role "<role>"
    And enters an existing employee name "<employee_name>"
    And selects the status "<status>"
    And enters a new username "<username>"
    And enters and confirms the password "<password>"
    And clicks the 'Save' button
    Then the system should confirm that the user was created successfully
    And the user "<username>" should appear in the user list

    Examples:
      | role      | employee_name     | status  | username     | 
      | Admin     | Raughan Iedit     | Enabled | pete.admin   |
      | ESS       | Caerthynna Crain  | Enabled | odis.ess     | 
      | ESS       | FNU LNU           | Disabled| new.employee | 

  Scenario Outline: Admin fails to find users with non-existent criteria
    When the admin enters "<username>" in the Username field
    And enters "<employee_name>" in the Employee Name field
    And clicks the search button
    Then the system should display a "No Records Found" message in the results table

    Examples:
      | username           | employee_name  |
      | NonExistentUser123 |                |
      |                    | Michael Scott  |
      | NonExistentUser456 | Dwight Schrute |