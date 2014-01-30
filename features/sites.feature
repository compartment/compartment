Feature: Sites
  As a developer
  I would like Compartment to manage multiple sites
  So that I only have to manage one application

  Scenario: No sites have been created.
    Given there are no sites
    When I visit the homepage
    Then I should see the welcome screen

  Scenario: One site exists
    Given the default site exists
    When I visit the homepage
    Then I should see the default site's homepage

  Scenario: Multiple sites exist
    Given the default site exists
    And an addition site exists
    When I visit the homepage without specifying a domain
    Then I should see the default site's homepage
    When I visit the homepage specifying the domain of the other site
    Then I should see the homepage of the other site
