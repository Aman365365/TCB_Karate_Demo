Feature: cats crud

  Background:
  * def startMockServer = () => karate.start('Mock.feature').port
  * def port = callonce startMockServer
  * url 'http://localhost:' + port + '/cats'

  @perf
  Scenario: create, get and update cat
    Given request { name: 'Billi' }
    When method post
    Then status 200
    And match response == { id: '#uuid', name: 'Billi' }
    * def id = response.id

    Given path id
    When method get
    # this step may randomly fail because another thread is doing deletes
    Then status 200
    # intentional assertion failure
    And match response == { id: '#(id)', name: 'Billi' }

    Given path id
    When request { id: '#(id)', name: 'Bob' }
    When method put
    Then status 200
    And match response == { id: '#(id)', name: 'Bob' }

    # since we failed above, these lines will not be executed
    When method get
    Then status 200
    And match response contains { id: '#(id)', name: 'Bob' }