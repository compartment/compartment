Feature: Setup Wizard
  As a developer
  I want to be guided through the process of setting up a Compartment Site
  So that it's easy to get started using Compartment

  Scenario: Viewing the Setup Wizard
    Given there are no sites
    When I visit the homepage
    Then I should see the setup wizard welcome page

  Scenario: Submitting the Setup Wizard with invalid data
    Given I am viewing the setup wizard welcome page
    When I submit the setup wizard form without specifying the admin credentials
    Then I see the following validation messages:
      | Email can't be blank    |
      | Password can't be blank |

  Scenario: Submitting the Setup Wizard with valid data
    Given I am viewing the setup wizard welcome page
    When I complete the setup wizard by specifying the admin user credentials
    Then the default site is created
    And an admin account is created
    But no pages are created
    And I am redirected to the homepage
