  #Author: Susan Abraham
	Feature: AmiGO Display Map API
	
	@sanity
	Scenario: Happy path test : Verify Map Display API returns 200OK
	Given url mapDisplayPath
	And param key = mapAPIkey
	And param view = 'Unified'
	And param language = 'NGT'
	When method GET
	Then status 200
	
	Scenario: Negative test : Verify that invalid inputs returns right error code
	Given url mapDisplayPath
	And param key = mapAPIkey
	And param view = 'Unifieds'
	And param language = 'NGT'
	When method GET
	Then status 400
	
	Scenario Outline: Functional test : Verify Map Display API returning resposne with different view combinations
	Given url mapDisplayPath
	And param key = mapAPIkey
	And param language = 'NGT'
	And param view = '<view>'
	When method GET
	Then status 200
	Examples:
	| view      | 
	| Unified   |
	| IL        |
	| IN        |
	
	
	