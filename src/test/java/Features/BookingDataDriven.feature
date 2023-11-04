Feature: Test demo API

  Background: 
    * url 'https://restful-booker.herokuapp.com'
    * def testData = Java.type('Runner.UtilsMethods')
        
    * def excelFilePath =  ".\\src\\test\\java\\Data\\Worksheet.xlsx";
    * def payload = testData.readExcelData("Sheet2", excelFilePath)
    * def jsonpath = ".\\src\\test\\java\\Data\\BookingData.json"
    * def payl  = testData.readJsonTemplate(jsonpath)
    * def load = testData.createJsonTemplate(payl,payload)
    * print payl
    * print load
   # * print load[rowindex]
    #* def lo = load[rowindex]
    * print payload


  @setup
  Scenario:
    * def data =
    """
    function(i){
      if (i == 5) return null;
      return { rowindex: i };
    }
    """

  Scenario Outline: Run a sample Get API
    * print rowindex
    * def booking =
      """
      {
      "username": "admin",
      "password": "password123"
      }
      """
    * path '/auth'
    * header Accept = 'application/json'
    * request booking
    * method POST
    * status 200
    * print response
    * def token = response.token
    #Create booking
   
    * def head = {'Content-Type': 'application/json','Accept': 'application/json','Cookie': `token=${token}` }
    * print token
    * path '/booking'
    * headers head
    * request load[rowindex]
    * method POST
    * status 200
    * print response

    Examples:
      | karate.setup().data |


