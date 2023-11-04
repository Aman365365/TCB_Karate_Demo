Feature: Title of your feature



  Scenario: pathMatches('/books') && methodIs('get')
    * def responseStatus = 200
    * def response = read('classpath:Data/books.json')
    * print response


