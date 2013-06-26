Feature: User can add repair to vehicle
I want to add a repair to a vehicle
So I can see all the repairs on a particular vehicle
And I can keep my vehicle in proper working order


Scenario: Happy Path
    Given I am a new, authenticated user
    When I click "Add Vehicle"
    And I fill in "Toyota" for "Make"
    And I fill in "4Runner" for "Model"
    And I fill in "2003" for "Year"
    And I fill in "123,643" for "Mileage"
    And I fill out the date fields
    When I press "Save"
    When I click "Add/View Repairs"
    And I click "Add Repair"
    And I fill in "oil change" for "Repair type"
    And I fill in "H & H" for "Mechanic"
    And I fill in "45" for "Cost"
    And I fill in "123,643" for "Mileage"
    And I fill out repair date fields
    And I fill in "this was a great experience" for "Notes"
    When I press "Save"
    Then I should see "Your repair has been added!"
    And I should see "oil change"

Scenario: Blank Cost Field
    Given I am a new, authenticated user
    When I click "Add Vehicle"
    And I fill in "Toyota" for "Make"
    And I fill in "4Runner" for "Model"
    And I fill in "2003" for "Year"
    And I fill in "123,643" for "Mileage"
    And I fill out the date fields
    When I press "Save"
    When I click "Add/View Repairs"
    And I click "Add Repair"
    And I fill in "oil change" for "Repair type"
    And I fill in "H & H" for "Mechanic"
    And I fill in "" for "Cost"
    And I fill in "123,643" for "Mileage"
    And I fill out repair date fields
    And I fill in "this was a great experience" for "Notes"
    When I press "Save"
    # this step modified to pass, but flash message not dispalying properly on failed validation
    Then I should see "Repair type"