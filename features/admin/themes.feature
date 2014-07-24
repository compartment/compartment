Feature: Theme Administration
  As an admin
  I want to change the appearance of my site using themes
  So that my website can have a nice design

  Background:
    Given the default site exists
    And I am signed in as an admin

  Scenario: Viewing a list of available themes
    When I visit the theme administration page
    Then I see a list of themes
    And I see that my current theme is the default theme

  Scenario: Selecting a different theme
    Given the site has a homepage
    And I am viewing the theme administration page
    When I select a different theme
    And I visit the homepage
    Then I should see the theme that I selected
