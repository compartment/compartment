Feature: Theme
  As a site owner
  I want to be able to style my site using themes
  So that my website can have a nice design

  Background:
    Given the default site exists
    And the site has a homepage

  Scenario: Site does not have a theme
    Given the site does not have a theme
    When I visit the homepage
    Then I should see the default theme

  Scenario: Site is using a custom theme
    Given the site has specified a custom theme
    When I visit the homepage
    Then I should see the custom theme