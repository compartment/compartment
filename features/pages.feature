Feature: Pages
  As a visitor
  I would like a site to have pages
  So that the website has content

  Background:
    Given the default site exists

  Scenario: The site has a homepage by default
    When I visit the homepage
    Then I should see the default site's homepage

  Scenario: Requesting a page that does not exist
    When I visit a random page
    Then I should see the 404 page

  Scenario: Requesting a page that does exist
    When I visit a random page that exists
    Then I should see the page

  Scenario: Requesting a page that belongs to a different site
    When I visit a random page that belongs to a different site
    Then I should see the 404 page
