@ignore
Feature: delete cat by id and verify

  Background:
    * def startMockServer = () => karate.start('Mock.feature').port
    * def port = callonce startMockServer
    * url 'http://localhost:' + port + '/cats'

  Scenario:
    Given path id
    When method delete
    Then status 200
    And match response == ''

    Given path id
    And header karate-name = 'cats-get-404'
    When method get
    Then status 404