# Animal Shelter API

### _Epicodus Project in Ruby on Rails, December 15, 2017_

### By Kelsey Langlois

## Description

_This is an API for an example animal shelter. Users can create, view, update, and delete animal records. There are also options for searching animal records by keyword, and obtaining a random animal record. Animal index, search, and random can be filtered to return only long-term residents of the animal shelter._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails db:seed
  rails s
  ```
* API will be available at ```http://localhost:3000```

## Version 1 Specifications

### Models
* Animal
  * ID: integer
  * Name: string
  * Species: string
  * Sex: string
  * Birthday: date
  * Description: string
  * Arrival Date: date

### API Endpoints
* _All API calls start with_ `/api/v1/`
* _API calls are limited to 1000 per IP address per day._

#### `GET /animals`
Get a list of all animals.
##### Params
  * `long_term` - string, _optional_ - set to 'true' to get only long-term residents of the animal shelter (over 6 months since arrival).

##### Responses
  * `200` _Returns a list of all animals._

#### `GET /animals/{id}`
Get a single animal's record based on id.
##### Responses
  * `200` _Returns the animal record with the given id._
  * `404` _Returns a not found message if animal with given id can't be found._

#### `GET /animals/random`
Get a random animal's record.
##### Params
  * `long_term` - string, _optional_ - set to 'true' to get only long-term residents of the animal shelter (over 6 months since arrival).

##### Responses
  * `200` _Returns a random animal record._

#### `GET /animals/search`
Search animals' names, descriptions, and species for a given term.
##### Params
  * `term` - string, _required_ - term to search for.
  * `long_term` - string, _optional_ - set to 'true' to get only long-term residents of the animal shelter (over 6 months since arrival).

##### Responses
  * `200` _Returns an array of all records with a name, description, or species that match the search term. Array is empty if no matches found._

#### `POST /animals`
Create a new animal record.
##### Params
  * `name` - string, _required_ - new animal's name.
  * `species` - string, _required_ - new animal's species.
  * `sex` - string, _required_ - new animal's sex.
  * `birthday` - date, _required_ - new animal's birthday. Must be on or before current date.
  * `description` - string - description of animal.
  * `arrival_date` - date - date animal arrived at shelter. Cannot be before birthday, or later than current date. Defaults to current date if no date given.

##### Responses
  * `201` - _Animal successfully created. Returns confirmation message and animal's record._
  * `422` - _Animal could not be saved. Returns error message._

#### `PATCH /animals/{id}`
Update an animal's record.
##### Params
  * `name` - string - new value for animal's name.
  * `species` - string - new value for animal's species.
  * `sex` - string - new value for animal's sex.
  * `birthday` - date - new value for animal's birthday. Must be on or before current date.
  * `description` - string - new description of animal.
  * `arrival_date` - date - new value for date animal arrived at shelter. Cannot be before birthday, or later than current date.

##### Responses
  * `200` - _Animal with given id successfully updated. Returns confirmation message and animal's record._
  * `404` - _Animal with given id could not be found. Returns error message._
  * `422` - _Animal with given id could not be updated. Returns error message._

#### `DELETE /animals/{id}`
Deletes an animals record.
##### Responses
  * `200` - _Animal deleted successfully. Returns confirmation message._
  * `404` - _Animal with given id could not be found. Returns error message._
## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Rack::Throttle

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
