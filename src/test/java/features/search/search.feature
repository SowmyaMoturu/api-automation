Feature: Tests for Search Endpoint

  Background: 
    * def searchURL = baseUrl  + apiConfig.endpoint.search
    * def requestData = read('classpath:resources/search/request/searchRequest.json')
    * def expectedResponse = read('classpath:resources/search/response/searchResponse.json')


   @searchByMediaTypeAndEntity @ignore
  Scenario: Search by Media Type - Sample to call one scenario from another scenario
    Given url searchURL  
    And param term = '#(term)'
    And param term = '#(media)'
    And param entity = '#(entity)'
    When method GET
    * print "this is called from same feature"
  

  Scenario: Search by term with defaults
    Given url searchURL  
    And param term = requestData.term
    When method GET
    Then status 200 
    And match each response.results contains { country: '#?_== expectedResponse.defaultCountry' , currency: '#?_== expectedResponse.defaultCurrency' }


  Scenario: Search by Composite term and country
    Given url searchURL
    And param term = requestData.compositeTerm
    And param country = requestData.country
    When method GET
    Then status 200
    #match each element using contains predicate for multiple elements
    And match each response.results contains { country: '#?_== expectedResponse.country' , currency: '#?_== expectedResponse.currency' }

    @call
  Scenario: Search by media - use calling from another feature
  
   * def result = call read('anotherSearch.feature') { term: requestData.mediaTerm, media: requestData.media }
   * print result.response
   # validate JSON schema
   * match result.response == {"resultCount":"##number", "results" : '#[] #object'} 
   * print expectedResponse.resultsSchema
   
   @call 
  Scenario: Search by mediatype - use calling from tagged scenario from the  feature
  
   * def result = call read('search.feature@searchByMediaTypeAndEntity') { term: requestData.entityTerm, media: requestData.entityMedia , entity:requestData.entity}
   * print result.response
   
    




