
function fn() {
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    var config = {

        fuzzySearchPath: 'https://api.tomtom.com/search/2/search/amsterdam.json',
        fuzzyCoordinatesPath: 'https://api.tomtom.com/search/2/search/48.85826022.29449905431968.json',
        fuzzySearchBrokenPath: 'https://api.tomtom.com/search/2/search/.json',
        geometrySearchPath: 'https://api.tomtom.com/search/2/geometrySearch/pizza.json?view=Unified&relatedPois=off',
        mapDisplayPath: 'https://api.tomtom.com/map/1/tile/basic/main/0/0/0.pbf',
        trafficFindpath: 'https://api.tomtom.com/traffic/services/5/incidentDetails',

        //Please pass the working API keys , if not handy you can get it generated from 
        searchAPIkey: '<<pass valid key here>>',
        mapAPIkey: '<<pass valid key here>>',
        trafficAPIkey: '<<pass valid key here>>',

    };

    //search schema constants
    config.searchAPIConstants = karate.callSingle('classpath:helpers/constants.js');

    return config;
}