Feature: To validate the GET End point
  To validate the get end point response

  Scenario: To get the data with Authorisation token
    Given header Authorisation = 'Bearer '+ tokenID
    Given url baseUrl+'/public/v2/users/1616/posts'
    When method GET
    Then status 200
    And print response
    And print responseTime
    And print name
    And print tokenID
    * print responseTime
    * print responseStatus
    * print responseHeaders
    * print responseCookies
