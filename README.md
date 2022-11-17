# <h1> RubyChallenge </h1>
Building a fullstack sample API for a URL shortener
By: Mariell Sanchez 

In this file you will find varios elements that will give you a better understanding of how every task was completed.

<h2> Tasks </h2>
All of the required tasks were fully completed, in this seccion we are going to go task by task explaining how it was completed.

<h3> Task 1 </h3>
In the development of this task I figured to use the ID of each element as the short code since there were no explicit limitations regarding this. When executed, it returns a JSON with a success message, the element created and the short code that is equivalent to the ID.

<h3> Task 2 </h3>
In this task I created a validators folder with a url_validator.rb file inside, I took the validator code from https://storck.io/posts/better-http-url-validation-in-ruby-on-rails/ and it did a greatjob validating the URLs.

<h3> Task 3 </h3>
At first I got multiple mistakes in this task because the URLs I had created at first did not include de HTTPS protocol, once I fix that it worked as expected. In this method I also increment the click_count on the element.

<h3> Task 4 </h3>
Incrementing the click_count on the element in task 3 really helped me during this tasks. I created a get http request called 'top' and it returns the top 100 most frequently accesses short urls. I used the order descending method with the click_count attribute, then limited it to 100 so this would give me the result.

<h3> Task 5 </h3>
For this I used Open-uri and Nokogiri for getting the tittle of the web page. This job is executed every time a new short_url is created.

<h2> Set up </h2>
For setting up the environment you need to run the following commands

<h3> Intial Setup </h3>
    docker-compose build
    docker-compose up mariadb
    # Once mariadb says it's ready for connections, you can use ctrl + c to stop it
    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml build

<h3> To run migrations </h3>
    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml run short-app-rspec rails db:test:prepare

<h3> To run the specs </h3>
    docker-compose -f docker-compose-test.yml run short-app-rspec

<h3> Run the web server </h3>
    docker-compose up

<h2> Testing the API </h2>

<h3> Adding a URL </h3>
    curl -X POST -d "full_url=https://google.com" http://localhost:3000/short_urls.json

<h3> Getting the top 100 </h3>
    curl localhost:3000

<h3> Checking your short URL redirect </h3>
    curl -I localhost:3000/abc

<h2> Last but no least </h2>
Thank you for this opportunity :)

- Mariell
