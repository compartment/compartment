Feature: Site
  As a developer
  I would like Compartment to manage multiple sites
  So that I only have to manage one application

  Scenario: No sites have been created.
    Given there are no sites
    When I visit the homepage
    Then I should see the setup wizard welcome page

  Scenario: Default site does not require a domain
    Given the default site exists
    And the site has a homepage
    When I visit the homepage
    Then I should see the site's homepage

  Scenario: Multiple sites exist
    Given the default site exists
    And another site exists with a specific domain
    And both sites have a homepage
    When I visit the homepage without specifying a domain
    Then I should see the default site's homepage
    When I visit the homepage while specifying the domain of the other site
    Then I should see the homepage of the other site

# TODO: A site should allow alternate domains for other environments
