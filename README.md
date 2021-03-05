# README

# Goal: 
Goal is to build a sample Ruby on Rails application that mimics pieces of the environment.\
We’ll be building an app that tracks dogs and when they were fed. This app will allow a user to manage Owners,\
their Dogs and when that dog was fed.  It will also allow a user to create a report of Owners/Dogs and Dog/Meals\
so we can see all the owners in our system and when each dog was fed.


# Requirements:
Ruby on Rails v:4.x+\
MySQL – version your choice\
GitHub\
Must run locally (localhost:xxxx via webrick/unicorn etc..  not a 3rd party service like Heroku)

# Direction:
Build three models called “owner”, “dogs” and “meals”.
-	“owner” will consist of “first_name”, “last_name”, “email” and “phone_number” (an owner can have multiple dogs) Email must be unique.
-	“dogs” is a child of “owner” and consists of “name”, “age”, “color” and “weight” (dogs can have multiple meals)
-	“meals” is a child of “dog” and represents when each dog was fed. It should contain “brand”, “quantity”, “finished” (T/F), and “finished_on” (timestamp) for when the dog was fed.

# Build two view groups:
Group 1 routed to /admin\ 
A view which allows a user to add/edit/delete an “owner”
A view which allows a user to add/edit/delete a “dog” and select it’s owner
A view which allows a user add/edit/delete a “meal” associated with a dog

# Group 2 routed to /reports
	A view which lists dogs grouped by owner and some method to sort (developer choice)
	Ability to click on a single dog and view all the meals that dog has been fed (sorted by most recent first). All the meal details should be visible and     meals that are not “finished” should be denoted in the list. 

# Running the App
make sure you are in the director for the Rails app
cd puppies
bundle to get all the gems
bundle install
create the Postgres database (you should have Postgres installed from the Day 1 setup steps)
rails db:create
run migrations
rails db:migrate
seed data
rails db:seed
run the Rails server
rails s
confirm the app is serving
http://localhost:3000/
Helpful Commands

rails new puppies\
cd puppies\
create a new resource:

rails g resource owner first_name last_name email phone_number:integer\
rails g resource dog owner:belongs_to name age:integer color weight:float\
rails g resource meal dog:belongs_to brand quantity:float finished:boolean finished_on:timestamps

# Instructions 
clone the repository\
cd to puppies\
bundle install\
rails db:drop\
rails db:create\
rails db:migrate\
rails db:seed\
rails s\
http://localhost:3000/reports/owners \ 
http://localhost:3000/reports/dogs \
http://localhost:3000/reports/dogs/#id to see dog report 


