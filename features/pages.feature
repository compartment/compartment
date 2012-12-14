Feature: Pages
  As a site owner, I would like to manage multiple pages
  So that I can have a website with multiple pages.

  Background:
    Given a site exists with the domain "example.com"
    And the site has a theme

  Scenario: No pages exist
    Given the site does not have any pages
    When I visit the homepage
    Then I should see "Page Not Found"

  Scenario: Homepage exists
    Given the site has the following page:
      | title        | url_path | layout     |
      | the homepage | /        | one_column |
    When I visit the homepage
    Then I should not see "Page Not Found"
    And the page title should be "the homepage" 