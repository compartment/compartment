Feature: Page
  As a visitor
  I would like a site to have pages
  So that the website has content

  Background:
    Given the default site exists

  Scenario: Viewing the homepage
    Given the site has a homepage
    When I visit the homepage
    Then I should see the site's homepage

  Scenario: Requesting a page that does not exist
    When I visit a random page
    Then I should see the custom 404 page defined by the site's theme

  Scenario: Requesting a page that exists
    Given a random page exists
    When I visit the page
    Then I should see the page

  # TODO

  # Scenario: Requesting a page that belongs to a different site
  #   When I visit a random page that belongs to a different site
  #   Then I should see the 404 page
