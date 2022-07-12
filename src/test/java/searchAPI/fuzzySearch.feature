	#Author: Susan Abraham
	Feature: AmiGO Search API
	
	Background: 
	* def getSearchResponse = call read(searchAPIConstants.SearchResponse)
	
	Scenario: Happy path test : Verify that fuzzy search is successfully returning 200OK with valid input parameters
	Given url fuzzySearchPath
	And param key = searchAPIkey
	When method GET
	Then status 200
	
	Scenario: Functional test : Verify that the fuzzy serach is returning expected location with valid schema 
	Given url fuzzySearchPath
	And param key = searchAPIkey
	When method GET
	Then status 200
	* def searchResp = $.[*]
	And assert searchResp.length > 0 
	* print searchResp.length
	#validating the schema of expected response
	And match searchResp contains getSearchResponse.searchSummarySchema
	
	Scenario: Negative test : Verify that invalid inputs returns right error code
	Given url fuzzySearchBrokenPath
	And param key = searchAPIkey
	When method GET
	Then status 400
	
	Scenario: Larger payload test : Verify that the API handles a larger payload(request body)
	Given url geometrySearchPath
	And param key = searchAPIkey
	And request {"geometryList":[{"type":"POLYGON","vertices":["37.7524152343544,-122.43576049804686","37.70660472542312,-122.43301391601562","37.712059855877314,-122.36434936523438","37.75350561243041,-122.37396240234374"]},{"type":"CIRCLE","position":"37.71205,-121.36434","radius":6000},{"type":"CIRCLE","position":"37.31205,-121.36434","radius":1000}]}
	When method POST
	Then status 200
	
	#This test will fail as the search functionlaity is not functioning based on the coordinates entering
	Scenario: Exploratory test : Verify the search with location coordinates 
	Given url fuzzyCoordinatesPath
	And param key = searchAPIkey
	When method GET
	Then status 200
	* def searchResp = $.results[0].address.municipality
	And assert searchResp.length > 0 
	* print searchResp.length
	And assert searchResp == 'Paris'
	
	

