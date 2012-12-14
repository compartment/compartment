Feature: Theme
  As a site owner, I want to be able to choose between different themes
  So that my website can be easily designed

  Background:
    Given a site exists

  Scenario: Site does not have a theme
    Given the site does not have a theme
    When I visit the homepage
    Then I should see the site using the default theme
