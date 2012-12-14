Feature: Authentication
  As a site owner, I want to log in before editing content
  So that only authorized users can update content

  Background:
    Given a site exists

  Scenario: User does not have an account
    When I visit the login page
    And fill out the login form
    Then I should see the error "Invalid Credentials"

  Scenario: User has an account and uses valid credentials
    Given I have a user account
    When I visit the login page
    And fill out the login form
    Then I should be redirected to the admin dashboard
