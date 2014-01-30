Feature: Admin Content Blocks
  As a site owner
  I want to manage my page content in the form of blocks
  So that my experience is customized to the type of block

  Background:
    Given the default site exists
    And I am signed in

  Scenario: Adding a content block
    When I visit the homepage
    And I choose to add a content block to a content area
    Then I am presented with the option to select the type of content
    When I choose the type of content block
    Then the content block is added
    And the content block is in edit mode

  Scenario: Viewing an existing content block
    Given I have already created a content block
    Then I see that I can edit the content block
    And I see that I can delete the content block

  Scenario: Editing a content block
    Given I am editing a text content block
    When I enter text into the content block
    And I save the content block
    Then the content block is saved
    And the content block is in view mode

  Scenario: Removing a content block
    Given I have added a content block
    When I choose to delete the content block
    Then the content block is removed