Feature: to verify dummy app
 
	@postRequest
  Scenario Outline: create new employe detail
  Given url '<url>'
  And request {"name":"xyz","salary":"123","age":"23"}
  When method post
  Then status 200
  
  Examples:
  |url|
  |http://www.dummy.restapiexample.com/create|

  
  @readDataFromClass
  Scenario: Fetch data from java class
  Given def reusable = Java.type('com.karate.Reader')
  When def val = reusable.sum(10,30)
  And print val
  When def msg = reusable.loginMsg()
  And print msg
  
   @fetchDataFromCSV
  Scenario: Fetch data from CSV file
  Then eval data = read('empdetail.csv')
  And print data
  
  @postDataFromCSV
  Scenario Outline: create new employe detail from CSV files
  Given url 'http://www.dummy.restapiexample.com/create'
  And request {"name":<name>,"salary":<salary>,"age":<age>}
  When method post
  Then status 200
  
  Examples:
  |read('studentdetail.csv')|
  