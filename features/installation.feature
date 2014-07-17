Feature: Installation
  As a developer
  I want to be guided through the process of setting up Compartment
  So that it's easy to get started

  Scenario: Using the executable
    When I run `compartment`
    Then I should see the help documentation

  Scenario: Creating a new app
    When I run `compartment new WebsiteName`
    Then a new compartment app directory should be created

  Scenario: Running for the first time
    Given I have created a Compartment app directory
    When I run 'rackup' from the app directory
    And I visit the homepage
    Then I should see the setup wizard welcome page
