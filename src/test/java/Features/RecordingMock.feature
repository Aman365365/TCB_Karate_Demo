Feature: PlayBack Scenario


  Scenario: Run a sample Get API
    * def st = Java.type('RecordedStubs.RecordingMock')
    * def startserver = st.setup()
    * def startRecord = st.startRecoding()

    Given url  'http://localhost:8080/api/users?page=2'
    When method GET
    Then status 200
    And print response
    * def stub = st.stubbing()
    * def stopserver = st.tear()
