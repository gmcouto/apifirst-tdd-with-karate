Feature: Downcase Feature
  Background:
    * url mainUrlBase
    * path "/uppercase"

  Scenario: valid case
    Given request "some message to convert"
    And header Content-Type = 'text/plain;charset=utf-8'
    When method POST
    Then status 200
    And match header Content-Type == 'text/plain;charset=utf-8'
    And match $ contains "SOME MESSAGE TO CONVERT"

  Scenario: empty string
    Given request ""
    And header Content-Type = 'text/plain;charset=utf-8'
    When method POST
    Then status 400
