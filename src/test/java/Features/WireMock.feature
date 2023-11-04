Feature: Test demo API

  Background:
    * def st = Java.type('Runner.MockingObjectRunner')
    * def startserver = st.setup()

  @Get
  Scenario: Run a sample GetMock API Endpoint
    * def stub = st.stubbing()
    Given url  'http://localhost:8080/whatssup'
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name == "Michael"
    * def jsonresponse = read('classpath:Data/books.json')
    And match response == jsonresponse
    * def Endserver = st.tear()

   @Post
  Scenario: Run a sample PostMock API Endpoint
    * def stub = st.stubForPostRequest()
    Given url  'http://localhost:8080/userId/id'
    And request {"username":"admin","password":"password123"}
    When method POST
    Then status 201
    And print response
    And match response.first_name == "Michael"
    * def Endserver = st.tear()


   @Put
  Scenario: Run a sample PUTMock API Endpoint
    * def stub = st.stubForPutRequest()
    Given url  'http://localhost:8080/id=7'
    And request {"username":"admin","password":"password123"}
    When method PUT
    Then status 202
    And print response
    And match response.first_name == "Michael"
    * def Endserver = st.tear()

  @Bad
  Scenario: Run a sample BadMock API Endpoint
    * def stub = st.stubForBadRequest()
    Given url  'http://localhost:8080/apk/jar'
    When method GET
    Then status 400
    * def Endserver = st.tear()