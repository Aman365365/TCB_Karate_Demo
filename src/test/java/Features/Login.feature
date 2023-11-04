@ignore
Feature: Login Fuctionality

Background:

   * def data = Java.type("Utils.ExcelUtility")
   * def path = ".\\src\\test\\java\\Data\\Cart.xlsx"
   * def excelData = data.readExcelData(path)
   * print excelData
* def userName = excelData[0].UserName
* def password = excelData[0].password
* configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*", "--disable-save-password-bubble", "--incognito" ] }
   * call read '../Locators/locators.json'
   * print baseUrl

@Login
Scenario: Successful login

   Given driver 'https://www.saucedemo.com/'
   * driver.maximize()
   And input(login.userNameField,userName)
   And input(login.passwordField,password)
   When click(login.logInButton)
   Then waitForUrl('https://www.saucedemo.com/inventory.html')   

   

   