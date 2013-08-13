Feature: Authentication
  As a site owner, I want to log in before editing content
  So that only authorized users can update content

  Background:
    Given a site exists

  Scenario: User does not have an account
    When I visit the login page
    And I fill out the login form with "abc" and "xyz"
    Then I should see the error "Invalid email or password"

  Scenario: User has an account and uses valid credentials
    Given I have the following user:
      | email            | password |
      | user@example.com | pashwerd |
    When I visit the login page
    And I fill out the login form
    Then I should be redirected to the admin dashboard
