Feature: Installation
  As a developer
  I want to be guided through the process of setting up Compartment
  So that it's easy to get started

  Background:
    Given I have installed the Compartment gem

  Scenario: Using the executable
    When I type 'compartment' from the command line
    Then I should see the help documentation

  Scenario: Creating a new app
    When I type 'compartment new WebsiteName' from the command line
    Then a new compartment app directory should be created

  Scenario: Running for the first time
    Given I have created a Compartment app directory
    When I run 'rackup' from the app directory
    And I visit the homepage
    Then should see the welcome screen

  Scenario: Setup Wizard
    Given I am viewing the welcome screen
    When I complete the setup wizard
    Then the default site is created
    And an admin account is created