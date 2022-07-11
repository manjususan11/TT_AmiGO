function() 
{
return {
"searchSummarySchema":{
                       // single # stands for mandatory response parameter and ## stands for optional response parameters
                       "query": "#string",
                       "queryType": "##string",
                       "queryTime": "#number",
                       "numResults": "#number",
                       "offset": "##number",
                       "totalResults":"##number",
                       "fuzzyLevel" : "#number"
                        
                   }
        }
}