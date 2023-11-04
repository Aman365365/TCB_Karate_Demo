@ignore
Feature: DATA-DRIVEN TESTING

  Background: 
    * def testData = Java.type('Runner.UtilsMethods')
    * def excelfilepath = ".\\src\\test\\java\\Data\\Worksheet.xlsx"
    * def payload = testData.readExcelData("Sheet1",excelfilepath)
    * print payload[rowindex]
    * def jsonpath = ".\\src\\test\\java\\Data\\templete.json"
    * def json = testData.readJsonTemplate(jsonpath)
    * def dataholder = testData.createJsonTemplate(json, payload)
    * print dataholder
    * print json
    * print payload
    * print dataholder[rowindex]
    * def requestPayload = dataholder[rowindex]
    * print requestPayload

  Scenario Outline: Test with Data from Excel
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request requestPayload
    When method POST
    Then status 201
    And print response
    And match response.id == 101

    Examples: 
      | rowindex |
      |        0 |
      |        1 |
      |        2 |
