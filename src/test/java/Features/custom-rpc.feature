Feature: even java interop performance test reports are possible

  Background:
    * def Utils = Java.type('Runner.MockUtils')

  Scenario: fifty
    * def payload = { sleep: 50 }
    * def response = Utils.myRpc(payload, karate)
    * match response == { success: true }

  Scenario: seventy five
    * def payload = { sleep: 75 }
    * def response = Utils.myRpc(payload, karate)
    * match response == { success: true }

  Scenario: hundred
    * def payload = { sleep: 100 }
    * def response = Utils.myRpc(payload, karate)
    * match response == { success: true }