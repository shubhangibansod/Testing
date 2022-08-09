Feature: to verify weather api

#	@first
  #Scenario: verify current weather data
  #Given url 'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=55175e8bd5c78bf978ad942e1d34cc84'
  #When method get
  #Then status 200
  #And match response.weather[0].description contains 'overcast clouds'
  #And match response.weather[0].id == '#number'
 
	@getRequest
  Scenario Outline: verify current weather data
  Given url '<url>'
  When method get
  Then status 200
  And def desc = response.main.temp_max
  Then print desc
  
  Examples:
  |url|
  |https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=55175e8bd5c78bf978ad942e1d34cc84|
  
  @getEmpDetail
  Scenario: Get emp data
  Given url 'https://dummy.restapiexample.com/api/v1/employees'
  When method get
  Then status 200
  And print response
  Then match each response.data ==
  """
   {
      "id": "#number",
      "employee_name": "#string",
      "employee_salary": "#number",
      "employee_age": "#number",
      "profile_image": "#string"
    }
  """
  When def outputAge = []
  When def outputID = []
  And eval for(var i=0;i<response.data.length;i++) if(response.data[i].employee_name.endsWith("Kelly"))   outputAge.push(response.data[i].employee_age),outputID.push(response.data[i].id)
  Then print outputAge
  And print outputID
  
  @getOneEmpDetail
  Scenario: Get emp data
  Given url 'https://dummy.restapiexample.com/api/v1/employee/1'
  When method get
  Then status 200
  And print response
  And def otherresponse = call read('first3.feature@getRequest')
 Then print otherresponse.desc 
 
  
 @writeOutputToTxtFile
  Scenario: Writing the response to txt file
  Given url 'https://dummy.restapiexample.com/api/v1/employee/1'
  When method get
  Then status 200
  And print response
  Then karate.write(response,"empDetail.txt")
  And def otherresponse = call read('first3.feature@getRequest')
 Then print otherresponse.desc 