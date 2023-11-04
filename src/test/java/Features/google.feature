@ignore
Feature: Test google search page

  Background:
    * configure driver = { type: 'chrome',  addOptions: ["--remote-allow-origins=*"]}
    * call read '../Locators/locators.json'

  @UI_Automation
  Scenario: Test google search using UI automation
    Given driver 'https://www.google.com/'
    * driver.maximize()
    * def isVisible = exists(searchPage.txtGoogleSearch)
    Then match isVisible == true
    And input(searchPage.txtGoogleSearch,"karatelabs")
    When submit().click(searchPage.btnSubmit)
    Then match driver.title == "karatelabs - Google Search"

