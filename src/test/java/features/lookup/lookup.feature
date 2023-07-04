Feature: Tests for Lookup Endpoint

  Background: 
    * def lookupURL = baseUrl  + apiConfig.endpoint.lookup
    * def requestData = read('classpath:resources/lookup/request/lookupRequest.json')
    * def expectedResponse = read('classpath:resources/lookup/response/lookupResponse.json')


   
@smoke
  Scenario: Lookup by Artist
    Given url lookupURL
    And param id = requestData.artistID
    When method GET
    Then status 200
    #get each element using wildcard and match
    * def artistname = get response.results[*].artistName
    And match each artistname == expectedResponse.artistName
    # validate json schema
    * match response == {"resultCount":"##number", "results" : '#[] expectedResponse.resultsSchema'} 


  Scenario: Lookup by ISBN
    Given url lookupURL
    And param isbn = requestData.isbn
    When method GET
    Then status 200
    #match each element using contains predicate
    And match each response.results contains { trackName: '#?_== expectedResponse.trackName' }


