Feature: delete all cats found

  Background:
    * def startMockServer = () => karate.start('Mock.feature').port
    * def port = callonce startMockServer
    * url 'http://localhost:' + port + '/cats'

  Scenario: this scenario will be ignored because the gatling script looks for the tag @name=delete
    * print 'this should not appear in the logs !'
    When method get
    Then status 200

  @name=delete
  Scenario: get all cats and then delete each by id
    When method get
    Then status 200

    * def delete = read('cats-delete-one.feature')
    * def result = call delete response