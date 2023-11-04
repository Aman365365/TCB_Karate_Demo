Feature: API chaining

Background:
  * def utility = Java.type('Runner.RandomDataUtility')
  * def randomName = utility.getRandomFirstName()
  * def randomName1 = utility.getRandomFirstName()
  * print randomName
  * def randomMail = utility.getRandomEmailName()
  * def randomMail1 = utility.getRandomEmailName()
  * print randomMail

Scenario: Create, Get, Update, Delete user with specific Id
Given url 'https://gorest.co.in/public/v2/users'
And request {"name":"#(randomName)","email":"#(randomMail)","gender":"male","status":"active"}
And header Authorization = 'Bearer ff4f2c2e9e16d44d079dc5521c1281ceaefb005ed2b0434d45c41d8c6ce6a063'
When method POST
Then status 201
And print response
And def Id = response.id
And print Id


Given url 'https://gorest.co.in/public/v2/users/' + Id
And header Authorization = 'Bearer ff4f2c2e9e16d44d079dc5521c1281ceaefb005ed2b0434d45c41d8c6ce6a063'
When method GET
Then status 200
And print response


Given url 'https://gorest.co.in/public/v2/users/' + Id
And request {"name":"#(randomName1)","email":"#(randomMail1)","gender":"male","status":"active"}
And header Authorization = 'Bearer ff4f2c2e9e16d44d079dc5521c1281ceaefb005ed2b0434d45c41d8c6ce6a063'
When method PUT
Then status 200
And print response

Given url 'https://gorest.co.in/public/v2/users/' + Id
And header Authorization = 'Bearer ff4f2c2e9e16d44d079dc5521c1281ceaefb005ed2b0434d45c41d8c6ce6a063'
When method DELETE
Then status 204
And print response