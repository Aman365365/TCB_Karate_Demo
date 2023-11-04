Feature: windows notepad

  Scenario:
    * robot { window: 'Document - WordPad', fork: 'write', highlight: true }
    * def sWidget = '//document'
    * def text = read('classpath:Data/text.txt')
    * def sText = text
    * locate(sWidget).click()
    * input(sText)
    * def values = locate(sWidget).value
    * print values
    * def oRegion = locate(sWidget).region
    * print 'region:', oRegion
    * screenshot()

