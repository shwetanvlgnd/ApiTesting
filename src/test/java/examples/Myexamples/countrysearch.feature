Feature:Testing country list retrieval

Background:
* url 'https://restcountries.eu/rest/v2'


Scenario: First country should be Afghanistan

Given path 'all'
When method get
Then status 200
And json responseJson = response
And def firstCountryName = responseJson[0].name
* assert firstCountryName == 'Afghanistan'


Scenario: Search by country name

Given path 'name','India'
When method get
Then status 200
And json countries = response
* assert countries.length == 2
* assert countries[0].name == 'British Indian Ocean Territory'
* assert countries[1].name == 'India'



Scenario: Search by country full name

Given path 'name','aruba'
When method get
Then status 200
And json responseJson = response
And def countryname = responseJson[0].name
* assert countryname == 'Aruba'


Scenario: Search by ISO 2-letter or 3-letter country code

Given path 'alpha','aw'
When method get
Then status 200
And json responseJson = response
And def countryname = responseJson.name
* assert countryname == 'Aruba'


Scenario: Search by list of ISO 2-letter or 3-letter country codes

Given path 'alpha'
And param codes = 'col;no;es'
When method get
Then status 200
And json responseJson = response
* assert responseJson.length == 3
* assert responseJson[0].name == 'Colombia'
* assert responseJson[1].name == 'Norway'
* assert responseJson[2].name == 'Spain'


Scenario: Search by ISO currency code

Given path 'currency','cop'
When method get
Then status 200
And json responseJson = response
And def countryname = responseJson[0].name
* assert countryname == 'Colombia'

Scenario: Search by capital city

Given path 'capital','delhi'
When method get
Then status 200
And json responseJson = response
And def countryname = responseJson[0].name
* assert countryname == 'India'


Scenario: Search by calling code

Given path 'callingcode','91'
When method get
Then status 200
And json responseJson = response
And def countryname = responseJson[0].name
* assert countryname == 'India'



  Scenario: To get total number of countries in region

    Given path 'region','europe'
    When method get
    Then status 200
    And json responseJson = response
    * assert responseJson.length == 53
