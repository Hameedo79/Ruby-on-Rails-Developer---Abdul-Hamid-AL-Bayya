# README

How to run the app:

* Open terminal

* get into the application directory
  
* execute command : rails db:migrate (to do database migration (creating tables, relations, etc))

* execute command : rails s (to run the rails server)


To run the latest stock price, please create .env file in the root directory of the app and add below variable :

RAPIDAPI_KEY=api_key_here

change the **api_key_here** to whatever the API Key for https://latest-stock-price.p.rapidapi.com
