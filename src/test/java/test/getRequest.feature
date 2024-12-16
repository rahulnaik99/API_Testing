Feature: To test GET ENDPOINT of the application

  Scenario: To test GET endpoint
    Given url 'https://www.google.com'
    And method get
    Then status 200
