Feature: Hello Feature
  Background:
    * url mainUrlBase
    * path "/hello"

  Scenario: "Only to" valid message
    Given request {"to": "Gabriel"}
    And header Content-Type = 'application/json;charset=utf-8'
    When method POST
    Then status 200
    And match header Content-Type == 'application/json;charset=utf-8'
    And match $ contains {"message": "Hello Gabriel, I'm World"}

  Scenario: "To and from" valid message
    Given request {"to": "John", "from": "Doe"}
    And header Content-Type = 'application/json;charset=utf-8'
    When method POST
    Then status 200
    And match header Content-Type == 'application/json;charset=utf-8'
    And match $ contains {"message": "Hello John, I'm Doe"}

  Scenario: "To" cannot be empty
    Given request {"to": ""}
    And header Content-Type = 'application/json;charset=utf-8'
    When method POST
    Then status 400

  Scenario: "To" has size limit
    Given request {"to": "a0123456789012345678901234567890123456789012345678901234567890123456789"}
    And header Content-Type = 'application/json;charset=utf-8'
    When method POST
    Then status 400