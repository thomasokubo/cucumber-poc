Feature: Fighter test

  Background:
    Given that the environment is healthy and clean

  Scenario: Get fighter by id
    Given a profile 'balboa.json'
    When the user request it
    Then the response should have fighter with first name 'Rocky' in the body
