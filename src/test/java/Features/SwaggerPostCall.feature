Feature: Using Swagger Post API

  Background:
    * url "https://petstore3.swagger.io"
    * eval scOptions.setDestUrl("https://petstore3.swagger.io")
    * def param = {"id": 10,"petId": 198772,"quantity": 7,"shipDate": "2023-08-11T10:29:27.257+00:00","status": "approved","complete": true }

  Scenario: Swagger Post Call
    * eval scOptions.setPathPattern("/api/v3/store/order")
    Given path "api", "v3", "store","order"
    And request param
    When method POST
    Then status 200
    And print response
