Feature: PIM - Employee Information Management

  As an Admin, I want to manage employee records by adding, searching,
  and ensuring data integrity.

  Background:
    Given the user is logged in as an Admin
    And the user navigates to the PIM page

  Scenario Outline: Admin successfully adds a new employee with required details
    When the user clicks the 'Add Employee' button
    And fills in the first name "<firstname>" and last name "<lastname>"
    And clicks the 'Save' button
    Then the system should confirm the creation and show the personal details page for "<firstname> <lastname>"

    Examples:
      | firstname   | lastname  |
      | Raughan     | Iedit     |
      | Caerthynna  | Crain     |
      | Drozrak     | Crane     |

  Scenario Outline: System shows validation errors for missing required fields
    When the user clicks the 'Add Employee' button
    And fills in the first name "<firstname>" and last name "<lastname>"
    And clicks the 'Save' button
    Then a validation message "Required" should be displayed for the "<field_name>" field

    Examples:
      | firstname | lastname | field_name |
      |           | Smith    | First Name |
      | John      |          | Last Name  |

  Scenario Outline: Admin searches for an existing employee by name
    Given the user is on the PIM employee list page
    When the user enters "<employee_name>" in the Employee Name search field
    And clicks the search button
    Then the results table should contain a record for "<employee_name>"
    And the record count should be "(1) Record Found"

    Examples:
      | employee_name       |
      | Raughan Iedit       |
      | Caerthynna Crain    |