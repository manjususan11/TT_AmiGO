  #Author: Susan Abraham
	Feature: AmiGO Traffic API
	
	Scenario: Happy path test : Verify Traffic API returns 200OK
	Given url trafficFindpath
	And param key = trafficAPIkey
	And param bbox = '4.8854592519716675,52.36934334773164,4.897883244144765,52.37496348620152'
	When method GET
	Then status 200
	
	Scenario: Negative test : Verify that invalid inputs returns right error code
	Given url trafficFindpath
	And param key = trafficAPIkey
	When method GET
	Then status 400
	
	Scenario Outline: Functional test : Verify Traffic API returning resposne with different bbox values
	Given url trafficFindpath
	And param key = trafficAPIkey
	And param bbox = '<bboxValue>'
	When method GET
	Then status 200
	Examples:
	| bboxValue                                                                  | 
	| 4.8854592519716675,52.36934334773164,4.897883244144765,52.37496348620152   |
	| 4.8854592519716675,52.36934334773164,3.897883244144765,52.37496348620152   |
	| 3.8854592519716675,52.36934334773164,4.897883244144765,52.37496348620152   |
	| 3.8854592519716675,52.36934334773164,2.897883244144765,52.37496348620152   |
	| 3.8854592519716675,52.36934334773164,8.897883244144765,52.37496348620152   |
	| 9.8854592519716675,52.36934334773164,1.897883244144765,52.37496348620152   |
	| 4.8854592519716675,52.36934334773164,6.897883244144765,52.37496348620152   |
	
	
	