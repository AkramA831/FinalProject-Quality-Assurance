Feature: Admin Leave Management

  As an Admin,
  I want to manage employee leave by first adding entitlements
  and then assigning leave days against those entitlements.

  Background:
    Given the user is logged in as an Admin

  Scenario Outline: Admin grants entitlement and assigns leave to an employee
    # Step 1: Grant leave entitlement to the employee
    Given the admin is on the 'Leave Entitlements' page
    When the admin adds an entitlement for the employee "<employee_name>"
    And selects the leave type "<leave_type>" with an amount of "<entitlement_days>" days
    And saves the entitlement
    Then the system should confirm the entitlement was added successfully

    # Step 2: Assign leave to the same employee using their new entitlement
    And the admin navigates to the 'Assign Leave' page
    When the admin selects the same employee "<employee_name>"
    And selects the same leave type "<leave_type>"
    And sets the 'From Date' to "<from_date>" and 'To Date' to "<to_date>"
    And adds the comment "<comment>"
    And clicks the 'Assign' button
    Then the system should confirm the leave was successfully assigned

    Examples:
      | employee_name     | leave_type     | entitlement_days | from_date   | to_date     | comment             |
      | Raughan Iedit     | US - Vacation  | 15               | 2025-08-04  | 2025-08-06  | Approved vacation   |
      | Drozrak Crane     | CAN - Personal | 7                | 2025-09-10  | 2025-09-10  | Personal appointment|
      | FNU LNU           | US - FMLA      | 10               | 2025-11-03  | 2025-11-07  | Medical leave       |