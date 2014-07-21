Feature: Admin Authentication
  As an admin
  I want the admin area to require authentication
  So that only authorized users can update content

  Background:
    Given the default site exists
    And I have an admin user account

  Scenario: Viewing the sign in page
    When I visit the admin dashboard
    Then I should be redirected to the sign in page

  Scenario: Using invalid credentials
    Given I am viewing the sign in page
    When I fill out the sign in form using invalid credentials
    Then I should see an error message that my credentials were incorrect

  Scenario: Using valid credentials
    Given I am viewing the sign in page
    When I fill out the sign in form using valid credentials
    Then I should be redirected to the admin dashboard
