Feature: Content Blocks

  Background:
    Given a site exists with pages
    And I am logged in

  Scenario: Creating a content block
    When I visit a page
    And I click the "Add Content" button within the content area
    Then I should see a modal
    And I should be able to choose different types of content blocks

