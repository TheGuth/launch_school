# Assessment 179

### Question 1. What are the components of a URL?

  URLs are made up of: a protocol, a host, a port, a path, and parameters.

  https://google.com:443/?search=restaurants&username=james&password=hello
  
  ##### protocol = https:// 
  ##### host = google.com
  ##### path = /
  ##### params = search=restaurants&username=james&password=hello

### Question 2. What HTTP header determines how a client should interpret an HTTP response?

  The status code tells the client how it should interpret an HTTP response.

### Question 3. What does the HTTP status code 404 mean? How about 200?

  HTTP status code 404 means "Not Found"
  HTTP status code 200 means "OK"

### Question 4. During the processing of a request, the code needs to tell a client to go to a different URL. What Sinatra code would you write to do this, and how does the client know where to go?

  The code below is a route that redirects anyone who goes to the path "/" to the url path "/home" the client goes through the code in the get route and once it passes over the redirect knows to to to the url path "/home"

```ruby
get "/" do
  redirect "/home"
end
```

### Question 5. How does a Sinatra route determine what a response's body will be?

  the return value of the route block deteremines the response body passed on to the client. 

### Question 6. What are view helpers, and what are they used for?

  A view helper are methods that are used in the view file. These methods are made available in templates by Sinatra for the purpose of filtering and processing data that is being rendered into the page.

### Question 7. A GET request is made to a Sinatra application using the path /teams/56/players?sort=batting. We want to be able to access 56 as params[:team_id] within a Sinatra route. Write that route, assigning the team ID to an instance variable.

```ruby
get "/teams/:team_id/players" do
  @team_id = params[:team_id]
end
```

### Question 8. An application with user accounts needs to load the data for the current user from a database as the first step of handling any request made to it. Where can this shared code live within a Sinatra application so it doesn't have to be repeated in every route?

  This data can be loaded in a before block so that it executes before any routes or anything else that may be done.

### Question 9. Write a route that renders a view template called list.erb within a layout called wide_layout.erb.

```ruby
get "/list" do
  erb :list, wide_layout: :wide_layout
end
```

###  Question 10. A web browser and a Rails application are communicating. Which of these is the client, which is the server?

  The web browser is the client, and the Rails application is the server.

### Question 11. Given that @names = [“Larry”, “Curly”, “Moe”], write the ERB code to print out each name within an unordered list (ul) tag. Enclose each name within a list item tag (li).

```erb
<ul>
  <% @names.each do |name| %>
    <li>
      <%= name %>
    </li>
  <% end %>
</ul>
```

### Question 12. HTML forms can use which HTTP methods?

  HTML forms can use GET and POST methods.

### Question 13. Write a single Sinatra route that will match paths structured like these three examples:

/departments/produce/apples/fuji
/departments/produce/potatoes/waxy
/departments/bakery/bread/whole_wheat

Within the route, assign each of the last three URL segments to local variables.

```ruby
  get "/departments/:department/:food_item/:type" do
    @department = params[:department]
    @food_item = params[:food_item]
    @food_type = params[:type]
  end
```

### Question 14. How can user content be escaped within a Sinatra application?

  User content can be escaped by creating a method that escapes certain characters in the text with characters the browser won't interpret as code. The Rack library gives us a built in escape method, and there are others already built on the web that you can use if you won't want to build the method yourself. 

### Question 15. A Ruby project will typically include a Gemfile that declares its dependencies. What other two files need to be created in order to deploy a Sinatra application to Heroku using a production-ready web server?

  You need to create a config.ru file and a Procfile

























