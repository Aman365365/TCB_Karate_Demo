Feature:karate netty

  Background:
    * def start = () => karate.start('KarateNettyMock.feature').port
    * def port = callonce start
    * url 'http://localhost:' + port

  Scenario:
    Given path '/books'
    When method GET
    Then status 200
    * def response1 = read('classpath:Data/books.json')
    And match response == response1
    * print response
    * match response.page == '#number'
    And match response.data[0].first_name == "Michael"