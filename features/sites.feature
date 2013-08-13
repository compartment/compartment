Feature: Sites
  As a website owner, I would like Compartment CMS to manage multiple sites
  So that I only have to manage one application.

  Scenario: No sites have been created.
    Given there are no sites
    When I visit the homepage
    Then I should see "Site Not Found"

  Scenario: Sites exist, but wrong domain.
    Given a site exists with the domain "example2.lvh.me"
    When I visit the homepage using the domain "example.lvh.me"
    Then I should see "Site Not Found"

  Scenario: Site exists, correct domain
    Given a site exists with the domain "example2.lvh.me"
    When I visit the homepage using the domain "example2.lvh.me"
    Then I should not see "Site Not Found"