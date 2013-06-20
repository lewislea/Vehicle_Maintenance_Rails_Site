Feature: User can be added to database
    In order to use the application
    As a user
    I want to add myself to the database

Scenario: Happy Path
    When I go to the homepage
    When I click "Sign Up"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I fill in "password1" for "Password confirmation"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

Scenario: Invalid Email
    When I go to the homepage
    When I click "Sign Up"
    And I fill in "bobexample.om" for "Email"
    And I fill in "password1" for "Password"
    And I fill in "password1" for "Password confirmation"
    And I press "Sign up"
    Then I should see "1 error prohibited this user from being saved:"

    Scenario: Email already exists
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    When I click "Sign Up"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I fill in "password1" for "Password confirmation"
    And I press "Sign up"
    Then I should see "Email has already been taken"