Feature: Pages
  As a user of the site, I would like to see multiple pages
  So that I can browse the site.

  Background:
    Given a site exists
    # And the site has a theme

  Scenario: No pages exist
    Given the site does not have any pages
    When I visit the homepage
    Then I should see "404: Page not found"

  # @javascript
  Scenario: Homepage exists
    Given the site has the following page:
      | title        | url_path | template   |
      | the homepage | /        | one_column |
    When I visit the homepage
    Then I should not see "404: Page not found"
    And the page title should be "the homepage" 