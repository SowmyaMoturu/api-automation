Feature: Tests for Search Endpoint

Background: 
  * def searchURL = baseUrl  + apiConfig.endpoint.search

@ignore
Scenario: Search by Media Type - Sample to call one scenario from another scenario
  Given url searchURL  
  And param term = '#(term)'
  And param term = '#(media)'
  When method GET

