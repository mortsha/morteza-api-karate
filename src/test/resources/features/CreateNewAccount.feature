@Regression
Feature: Create a new account

  Background: Generate token
    Given url "https://tek-insurance-api.azurewebsites.net"
    Given path "/api/token"
    And request
      """
      {
       "username": "supervisor",
       "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    And print response

  Scenario: Create a new account
  	* def dataGenerate = Java.type('api.data.DataGenerator')
  	* def autoEmail = dataGenerate.getEmail()
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + response.token
    And request
      """
      {
       "email": "#(autoEmail)",
       "firstName": "Morteza",
       "lastName": "Sharifi",
       "title": "Mr.",
       "gender": "MALE",
       "maritalStatus": "SINGLE",
       "employmentStatus": "Tester",
       "dateOfBirth": "1996-11-28",
       "new": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail
