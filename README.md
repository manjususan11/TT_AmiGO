![Karate_Logo](https://user-images.githubusercontent.com/70334232/178341220-32e8b41f-717b-4e44-973c-4eec04b9b7ea.png)
## AmiGO QA Tests - Karate Automation Scripts

* This project will have/has automation tests for TomTom API calls
* IntelliJ IDE is preferred (community version is fine), I have used Eclipse for the scripting which is also compatible


#### Why to automate 
* Considering the input parameters , we could arrive on N numbers of test cases and doing each test manually after every deployment is not practically possible hence making valid combination for positive test and negative tests are good practice which can be triggered after each deplyment multiple times 
* The outcome of each request contains a schema and validating each json array OR elements manually is time taking and chances for human errors are high , hence automating schema validation will benefit in making sure that the contract between clients are not broken
* Overall all reduction in manual effort, cost and time
* Once we have stable automation farmework, every sprint we need to just decide which tests to run and which are not to, and addition of newly added features


#### Kick starter 

![image](https://user-images.githubusercontent.com/70334232/178350945-08c8691d-e0c0-4e9d-be96-f132cab41f33.png)

* TomTom's API documentation are used to develop test scenarios-Search,Traffic & Map Display(e.g. https://developer.tomtom.com/traffic-api/api-explorer)
* Identified test scenarios are converted into meaningful test cases in an excel(in real time can be use any of test case management tool for mapping)
* Test cases are converted into executable postman scripts and then to Karate BDD test
* The authorization keys are generated from TomTom developer account

Sample test case management

![image](https://user-images.githubusercontent.com/70334232/178348586-479b109a-4003-4438-865d-bdb0e7877607.png)



#### Setting up 

* Download convenient IDE preferably IntelliJ/eclipse
* Install plug-in called "Cucumber for Java"
* In your IntelliJ for this project...
* go to File ---> Project Structure. Under Project Settings ---> Project ---> make sure Project SDK is set to 1.8 (or accordingly) and Project language level to 8 (or accordingly from dropdown)
* Under Project Settings ---> Modules ---> make sure Language level is set to 8 (similar to above one)
* Once above all are done, select Apply and OK
* Add Karate dependencies


#### Things to note before running a test

* For the demo purpose test can be run only locally
* Tests can be run at service level using the runner file for each specific service(either parallel or sequential)
* Tests can be run at tag level based on your requirements, for example sanity, functional,negative test etc.
* All the tests can be run using the common runner file
* Parallel execution reduces time but if you are not much aware of what tests are in there and whether parallel is safe or not, serially would be way to go.
* Since tests are running locally , the API keys to authorize  supposed to pass in config.js file manually 
* If you have no API key in handy , you can visit https://developer.tomtom.com/ and generate key for respective API


#### Run test from command line

```
mvn test -Dtest=<name of runner class>
```

#### Run from IDE

```
Right click on the runner file and select run as JUnit test
```
![image](https://user-images.githubusercontent.com/70334232/178341686-b37d7e12-061a-44b5-935a-d49024b20827.png)

#### Run against different environment
* Currently the default test environment is passed as dev , but in a case where the project has different levels like dev,test,stage and prod, we can easily configure the base url to each environment and pass the env value in config.js file
![image](https://user-images.githubusercontent.com/70334232/178341808-ad7ee2b7-a99f-44e4-8073-e8fd53f05531.png)


#### Reporting
* Karate has default reporting system thats generates Summary report, Tag reports , Timeline reports etc and they can be found under target folder

![image](https://user-images.githubusercontent.com/70334232/178341905-1d96916a-2ecd-4d80-a96d-ec6e31ab92d5.png)


#### Quick Walkthrough 
Basic Framework Hierarchy : 3 features are picked to proceed with the automation , Search, Map & Traffic and each test are written at API level and each folder contain a parallel runner and sequential runner which will benefit when test are being written and execute test individually and to debug.

![image](https://user-images.githubusercontent.com/70334232/178342035-2d1a5cde-12b1-4e55-aa2a-606b8afe0044.png)

 
  Major components are 
* Feature file : Where the automation test script is written in Gherkin BDD format
![image](https://user-images.githubusercontent.com/70334232/178342122-8441f323-25d5-4f94-b315-bceb7a41214e.png)

 
* Runner File : It is a java class which decides the execution manner and execution control of test automation
![image](https://user-images.githubusercontent.com/70334232/178342181-ca96390a-dacc-4114-a41a-da46813e8d96.png)

 
* Karate config file : It is the core controller of Karate framework where the execution starts and the config file controls environment selection, secret handling and resource handlings and many more controlling tasks
![image](https://user-images.githubusercontent.com/70334232/178342328-36ed7c82-3ee1-4754-9a69-fc7766cd143e.png)

 
* Resource file : The additional resource handlings such as validating out put of a an API response , handling the payload, passing one API response as input to other API etc. For demo purpose a schema file is defined as one of resource file 
![image](https://user-images.githubusercontent.com/70334232/178342413-5428d254-691d-4e88-9b3c-e75dc628e6ae.png)

 
* Helpers : Helpers are direction agents who helps the script in understanding where to find the resources, reusable function and other constants
![image](https://user-images.githubusercontent.com/70334232/178342531-3d8fe723-16e2-4ccc-ac4c-5cc724d4bc09.png)


* Logback file : For debugging and logging , INFO level gives basic and DEBUG level give detailed debugging logs
![image](https://user-images.githubusercontent.com/70334232/178342631-8d021e4c-7be1-4163-a502-2a98a7ebf9eb.png)


#### Sample Test Results 

A successful execution

![image](https://user-images.githubusercontent.com/70334232/178342902-b0952354-c36c-4736-8703-4be3166ff07c.png)

A failed test

![image](https://user-images.githubusercontent.com/70334232/178343053-10e8048b-b1e6-4f29-a282-b30ebf308d7e.png)

#### Improvements that can apply on framework level on a larger scale(In my opinion)

* Avoiding hard coded secrets & keys, instead can dynamically access from any of the vault on run time
* CI/CD test execution after each deployment
* Midnight executions to keep monitoring the API 
* Dedicated helper files for each services to handles constants and payloads
* Strong schema validations for positive and negative responses
* More elaborated custom reporting using Cucumber
