Feature: Sites
  As a website owner, I would like Compartment CMS to manage multiple sites
  So that I only have to manage one application.

  Scenario: No sites have been created.
    Given there are no sites in the database
    When I visit the homepage
    Then I should see "Site Not Found"

  Scenario: Sites exist, but wrong domain.
    Given a site exists with the domain "localhost"
    When I visit the homepage using the domain "example.com"
    Then I should see "Site Not Found"

  Scenario: Site exists, correct domain
    Given a site exists with the domain "example.com"
    When I visit the homepage using the domain "example.com"
    Then I should not see "Site Not Found"