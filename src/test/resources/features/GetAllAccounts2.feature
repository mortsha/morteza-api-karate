@Regression
Feature: Get all account

  Scenario: Get all accounts
    Given url "https://tek-insurance-api.azurewebsites.net"
    Given path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/accounts/get-all-accounts"
    And header Authorization = "Bearer " + response.token
    When method get
    Then status 200
    And print response
