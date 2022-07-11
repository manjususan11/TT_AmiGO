#### AmiGO QA Tests - Karate Automation Scripts
![Karate_Logo](https://user-images.githubusercontent.com/70334232/178340681-a52655b8-eb89-45fd-aa12-d709286292b3.png)


* This project will have/has automation tests for TomTom API calls
* IntelliJ IDE is preferred (community version is fine), I have used Eclipse for the scripting which is also compatible

##### Kick starter 

* TomTom's API documentation are used to develop test scenarios
* Identified test scenarios are converted as executable postman scripts and then to Karate BDD test
* The authorization keys are generated from TomTom developer account

##### Setting up 

* Download convenient IDE
* Install plug-in called "Cucumber for Java"
* In your IntelliJ for this project...
* go to File ---> Project Structure. Under Project Settings ---> Project ---> make sure Project SDK is set to 1.8 (or accordingly) and Project language level to 8 (or accordingly from dropdown)
* Under Project Settings ---> Modules ---> make sure Language level is set to 8 (similar to above one)
* Once above all are done, select Apply and OK
* Add Karate dependencies

##### Things to note before running a test

* For the demo purpose test can be run only locally
* Tests can be run at service level using the runner file for each specific service(either parallel or sequential)
* Tests can be run at tag level based on your requirements, for example sanity, functional,negative test etc.
* All the tests can be run using the common runner file
* Parallel execution reduces time but if you are not much aware of what tests are in there and whether parallel is safe or not, serially would be way to go.
* Since tests are running locally , the API keys to authorize  supposed to pass in config.js file manually 
* If you have no API key in handy , you can visit https://developer.tomtom.com/ and generate key for respective API

##### Run test from command line

```
mvn test -Dtest=<name of runner class>
```

##### Run from IDE

```
Right click on the runner file and select run as JUnit test
```

##### Run against different environment
* Currently the default test environment is passed as dev , but in a case where the project has different levels like dev,test,stage and prod, we can easily configure the base url to each environment and pass the env value in config.js file

##### Reporting
* Karate has default reporting system thats generates Summary report, Tag reports , Timeline reports etc and they can be found under atrget folder

#### Quick Walkthrough 
 Basic Framework Hierarchy : 3 features are picked to proceed with the automation , Search, Map & Traffic and each test are written at API level and each folder contain a parallel runner and sequential runner which will benefit when test are being written and execute test individually and to debug.
 
  Major components are 
* Feature file : Where the automation test script is written in Gherkin BDD format
 
* Runner File : It is a java class which decides the execution manner and execution control of test automation
 
* Karate config file : It is the core controller of Karate framework where the execution starts and the config file controls environment selection, secret handling and resource handlings and many more controlling tasks
 
* Resource file : The additional resource handlings such as validating out put of a an API response , handling the payload, passing one API response as input to other API etc. For demo purpose a schema file is defined as one of resource file 
 
* Helpers : Helpers are direction agents who helps the script in understanding where to find the resources, reusable function and other constants
* Logback file : For debugging and logging , INFO level gives basic and DEBUG level give detailed debugging logs


#### Improvements that can apply on framework level on a larger scale(In my opinion)

* Avoiding hard coded secrets & keys, instead can dynamically access from any of the vault on run time
* CI/CD test execution after each deployment
* Midnight executions to keep monitoring the API 
* Dedicated helper files for each services to handles constants and payloads
* Strong schema validations for positive and negative responses
* More elaborated custom reporting using Cucumber
