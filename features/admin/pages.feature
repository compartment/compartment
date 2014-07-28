Feature: Admin Pages
  As a site owner
  I would like to edit pages
  So that my website has content

  Background:
    Given the default site exists
    And I am signed in

  Scenario: Viewing pages index page
    Given I have already created some pages
    And I am viewing the admin dashboard
    When I visit the pages admin
    Then I see the list of pages that have been created

  Scenario: Creating a page
    Given I am viewing the pages index
    When I click to create a new page
    And I save the page
    And I should see "Title can't be blank"
    Then I should see "Path can't be blank"
    And I should see "Template can't be blank"
    And I specify the title
    When I specify the path
    And I specify the template
    And I save the page
    Then the page is created
    And I am taken to the page so I can edit it

  Scenario: Viewing a new page
    Given I am viewing a new page
    Then I see the admin toolbar
    And the page status is displayed as "Unpublished"
    And I see content areas where I can add content blocks

  Scenario: Publishing a page
    Given I have created a page that is not yet published
    And I am not signed in
    When I visit the page
    Then I should see the 404 page
    When I sign in
    And I visit the page
    And I click to publish the page
    Then the page should be visible when I log out
