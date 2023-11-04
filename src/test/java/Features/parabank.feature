@ignore
Feature: Parabank Register
  Background:
    * configure driver = { type: 'chrome',  addOptions: ["--remote-allow-origins=*"]}
    * call read '../Locators/locators.json'
    * def data = Java.type("Utils.ExcelUtility")
    #Read Excel Data
    * def path = ".\\src\\test\\java\\Resources\\parabank_register.xlsx"
    * def payload = data.readExcelData(path)
    * print payload
    * def address = payload[0]['Address']
    * def firstname = payload[0]['First Name']
    * def lastname = payload[0]['Last Name']
    * def city = payload[0]['City']
    * def state = payload[0]['State']
    * def address = payload[0]['Address']
    * def zipcode = payload[0]['Zipcode']
    * def phone = payload[0]['Phone']
    * def ssn = payload[0]['SSN']
    * def username = payload[0]['Username']
    * def password = payload[0]['Password']
    * def confirm_password = payload[0]['Confirm']
    * def sleep = function(pause){ java.lang.Thread.sleep(pause*1000) }
    * print zipcode
    * print phone
    * print ssn
  @UI_Automation
  Scenario: Register to Parabank
    Given driver 'https://parabank.parasoft.com/parabank/index.htm'
    * driver.maximize()
    When click('{a}Register')
    * call sleep 2
    Then match driver.title == "ParaBank | Register for Free Online Account Access"
    #Fill form
    And input(Parabank.firstname, firstname)
    And input(Parabank.lastname, lastname)
    And input(Parabank.city, city)
    And input(Parabank.state, state)
    And input(Parabank.address, address)
    And input(Parabank.zipcode, zipcode)
    And input(Parabank.phone, phone)
    And input(Parabank.ssn, ssn)
    And input(Parabank.username, username)
    And input(Parabank.password, password)
    And input(Parabank.confirm_password, confirm_password)
    * call sleep 3
    When submit().click(Parabank.register_button)
    * call sleep 3
    * focus('{a}Log Out')
    Then click('{a}Log Out')

