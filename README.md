# <h1> RubyChallenge </h1>
Building a fullstack sample API for a URL shortener
By: Mariell Sanchez 

In this file you will find varios elements that will give you a better understanding of how every task was completed.

<h2> Tasks </h2>
All of the required tasks were fully completed, in this seccion we are going to go task by task explaining how it was completed.

<h3> Task 1 </h3>
"Given a URL, we should get back a shortcode for that URL of the shortest possible length relative to the number of links currently in the system."

In the development of this task I figured to use the ID of each element as the short code since there were no explicit limitations regarding this. When executed, it returns a JSON with a success message, the element created and the short code that is equivalent to the ID.

<h3> Task 2 </h3>
"Invalid URLs should not be able to be entered into the system."

In this task I created a validators folder with a url_validator.rb file inside, I took the validator code from https://storck.io/posts/better-http-url-validation-in-ruby-on-rails/ and it did a greatjob validating the URLs.

<h3> Task 3 </h3>
"If you go to http://yourhostname.com/shortcode, you should be redirected to the full URL."

At first I got multiple mistakes in this task because the URLs I had created at first did not include de HTTPS protocol, once I fix that it worked as expected. In this method I also increment the click_count on the element.

<h3> Task 4 </h3>
" There should be an API response with the top 100 most frequently accessed shortcodes."

Incrementing the click_count on the element in task 3 really helped me during this tasks. I created a get http request called 'top' and it returns the top 100 most frequently accesses short urls. I used the order descending method with the click_count attribute, then limited it to 100 so this would give me the result.

<h3> Task 5 </h3>
"The title of the web page for each of the shortened URLs should be fetched and stored in the database using a background job."
For this I used Open-uri and Nokogiri for getting the tittle of the web page. This job is executed every time a new short_url is created.

