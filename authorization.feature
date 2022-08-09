
Feature: Validating basic authorization
 
  @BasicAuthorization
  Scenario: validate basic authorization for jira and get user detail
    Given url 'https://shubhangi1996.atlassian.net//rest/api/3/user?accountId=62dcf8ac4913d0b73488903f'
    And header Authorization = call read('basic-auth.js') { username: 'bansod.shubhangi@tcs.com', password: 'UpDvBkTzmZOA42sJm6S32DF1' }
    When method get
    Then status 200

  @BasicAuthorizationWithPost
  Scenario: validate basic authorization for jira and add user detail
  Given url 'https://shubhangi1996.atlassian.net/rest/api/3/user'
  And header Authorization = call read('basic-auth.js') { username: 'bansod.shubhangi@tcs.com', password: 'UpDvBkTzmZOA42sJm6S32DF1' }
  And request {"emailAddress": "ragini@atlassian.com"}
  When method post
  Then status 201
  
  
   @BasicAuthorizationWithPostDataFromCSV
  Scenario Outline: validate basic authorization for jira and add user detail
  Given url 'https://shubhangi1996.atlassian.net/rest/api/3/user'
  And header Authorization = call read('basic-auth.js') { username: 'bansod.shubhangi@tcs.com', password: 'UpDvBkTzmZOA42sJm6S32DF1' }
  And request {"emailAddress": <emailAddress>}
  When method post
  Then status 201
  
  Examples:
  |read('email.csv')|

 @getEmpDetailthroughKarateConfigURL
  Scenario: Get emp data
  Given url appBaseURL
  When method get
  Then status 200