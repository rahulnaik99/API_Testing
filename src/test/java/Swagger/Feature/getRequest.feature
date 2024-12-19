Feature: sample karate test script

Background: Base Url
  Given url 'http://localhost:9191/'

Scenario: Test for the Home Page with match repsonse
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method Get
  Then status 200
  Then print response
  Then match response ==
  """
  [
    {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        }
      ]
    }
  ]
  """


  Scenario: Test response Match XML
    And path 'normal/webapi/all'
    And header Accept = 'application/xml'
    When method Get
    Then status 200
    Then print response
    Then match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
      </experience>
      <project>
      <project>
      <projectName>Movie App</projectName>
      <technology>
      <technology>Kotlin</technology>
      <technology>SQL Lite</technology>
      <technology>Gradle</technology>
      </technology>
      </project>
      </project>
      </item>
      </List>
      """

  Scenario: Test match response with Deep for Json
    And path 'normal/webapi/all'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    Then print response
    Then match response contains deep {"jobTitle": "Software Engg"}

  Scenario: Test match response with header
    And path 'normal/webapi/all'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    Then print response
    Then match header Connection == 'keep-alive'

  Scenario: Test match response with XML
    And path 'normal/webapi/all'
    And header Accept = 'application/XML'
    When method Get
    Then status 200
    Then print response
    Then match response/List/item/jobId == '1'
    Then match response/List/item/jobDescription == 'To develop andriod application'
    Then match response.[0].project[0].technology[2] == 'Gradle'

  Scenario: Test match response with header
    And path 'normal/webapi/all'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    Then print response
    Then match header Connection == '#notnull'
