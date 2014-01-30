Feature: Admin Content Areas
  As a theme designer
  I want my themes to have content areas
  So that admins are able to add content to them

  Background:
    Given the default site exists
    And I am signed in

  Scenario: Adding content
    When I visit the homepage
    Then I see a content area that I can add content blocks to
    When I add a content block to the content area
    Then the content block is added
    And I can add another content block to the content area
