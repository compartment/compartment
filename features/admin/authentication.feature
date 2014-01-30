Feature: Admin Authentication
  As a site owner
  I want the admin area to require authentication
  So that only authorized users can update content

  Background:
    Given the default site exists

  Scenario: Using invalid credentials
    When I sign in using invalid credentials
    Then I should see an error message that my credentials were incorrect

  Scenario: Using valid credentials
    When I sign in using valid credentials
    Then I should be redirected to the admin dashboard
