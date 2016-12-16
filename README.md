# _Shoe Distribution_

#### By _**Joshua Rinard**, 12/16/2016_

## Description

Web Application that allows the user to create shoe stores, and brands they carry.
Allows user to assign brands to individual stores and to manage store data and brand data. The main objective of this app is to demonstrate many-to-many relationships between stores and brands using active record.

**User Stories**

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands.
* As a user, I want to be able to add shoe brands in the application
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I do not want stores and shoes to be saved if I enter a blank name.

## Setup/Installation Requirements

* Clone this repo: `git clone git@github.com:jrinard/shoe_distribution.git`
* Change to the repo directory: `cd shoe_distribution`
* Install gems: `bundle`
* Install the database: *Instructions Below*
* Run the app: `ruby app.rb`

## Database Setup Instructions

* Install and start postgres
* Run: `bundle exec rake db:create`
* Run: `bundle exec rake db:migrate`
* Run: `bundle exec rake db:test:prepare`

## Technologies Used

*HTML, Ruby, Sinatra, SQL, Postgres, JavaScript, MaterializeCSS*

### License

*MIT License*

Copyright (c) 2016 **_Joshua Rinard_**
