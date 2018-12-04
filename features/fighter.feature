Feature: Fighter test

  Background:
    Given that the environment is healthy and clean

  Scenario: Get fighter by id
    Given that the fighter 'balboa.json' is in the database
    When the user requests it by id
    Then the response should have 'first_name' with 'Rocky' in the body
    And the response should have 'last_name' with 'Balboa' in the body

  Scenario: Delete fighter
    Given that the fighter 'balboa.json' is in the database
    When the user deletes it
    Then it should not be in the database anymore

  Scenario: Patch fighter
    Given that the fighter 'balboa.json' is in the database
    When the user patches with 'apollo.json'
    Then the response should have 'first_name' with 'Apollo' in the body
    And the response should have 'last_name' with 'Creed' in the body
