Feature: Admin Content Areas
  As a theme designer
  I want my themes to have content areas
  So that admins are able to add content to them

  Background:
    Given the default site exists
    And I am signed in

  @javascript @selenium
  Scenario: Adding content
    Given I am viewing a new page
    Then I should see a content area that I can add content blocks to
    # TODO: figure out if html should distinguish between content areas that allow single vs multiple content blocks
    When I click to add a content block to the content area
    And I select a type of content block
    Then the content block is added
    And I can add another content block to the content area

