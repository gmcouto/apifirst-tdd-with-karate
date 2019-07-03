Feature: Downcase Feature
  Background:
    * url mainUrlBase
    * path "/downcase"

  Scenario: valid case
    Given request "SOME MESSAGE TO CONVERT"
    And header Content-Type = 'text/plain;charset=utf-8'
    When method POST
    Then status 200
    And match header Content-Type == 'text/plain;charset=utf-8'
    And match $ contains "some message to convert"

  Scenario: empty string
    Given request ""
    And header Content-Type = 'text/plain;charset=utf-8'
    When method POST
    Then status 400
