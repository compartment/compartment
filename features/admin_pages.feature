Feature: Admin Pages
  As a site owner who has logged in, I would like to edit content while on the page
  So that it is easier to update page content.

  Background:
    Given a site exists with pages and content
    And I am logged in

  Scenario: Viewing a page
    When I visit a page
    Then I should see the admin toolbar
    And I should see an "Edit" button when I hover over a content block
    And I should see an "Delete" button when I hover over a content block
    And I should see that I can add a content block to a content area

  Scenario: Editing a page
    When I visit a page
    And I click "Edit" on a content block
    Then I should be able to change the content
    And the new content should be displayed