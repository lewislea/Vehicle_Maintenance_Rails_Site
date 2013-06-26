Feature: User can add vehicle
I want to add a vehicle
So I can track repairs
And be a responsible vehicle owner


Scenario: Happy Path
    Given I am a new, authenticated user
    When I click "Add Vehicle"
    And I fill in "Toyota" for "Make"
    And I fill in "4Runner" for "Model"
    And I fill in "2003" for "Year"
    And I fill in "123,643" for "Mileage"
    And I fill out the date fields
    When I press "Save"
    Then I should see "Your vehicle has been added!"

Scenario: Blank Form Field
    Given I am a new, authenticated user
    When I press "Add Vehicle"
    And I fill in "Toyota" for "Make"
    And I fill in "4Runner" for "Model"
    And I fill in "" for "Year"
    And I fill in "45,667" for "Mileage"
    And I fill out the date fields
    When I press "Save"
    Then I should see "Year can't be blank"

Scenario: Incorrect Type of Input
    Given I am a new, authenticated user
    When I press "Add Vehicle"
    And I fill in "Toyota" for "Make"
    And I fill in "4Runner" for "Model"
    And I fill in "bdhs" for "Year"
    And I fill in "123,643" for "Mileage"
    And I fill out the date fields
    When I press "Save"
    Then I should see "Year is not a number"

Scenario: Mileage Saved Correctly to Database
    Given I am a new, authenticated user
    When I press "Add Vehicle"
    And I fill in "Toyota" for "Make"
    And I fill in "4Runner" for "Model"
    And I fill in "2010" for "Year"
    And I fill in "123,643" for "Mileage"
    And I fill out the date fields
    When I press "Save"
    Then I should see "123643"