Feature: sample karate test script

Background: Base Url
  Given url 'http://localhost:9191/'

Scenario: Test for the Home Page
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method Get
  Then status 200

  Scenario: Test for the Home Page
    And path 'normal/webapi/all'
    And header Accept = 'application/xml'
    When method Get
    Then status 200