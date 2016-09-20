### Question 2. What HTTP header determines how a client should interpret an HTTP response?

  The content-Type HTTP header determines how the client should interpret the response, it lets the client know what content is being delivered in the body.

### Question 4. During the processing of a request, the code needs to tell a client to go to a different URL. What Sinatra code would you write to do this, and how does the client know where to go?
  
  The code below would send a status 302 telling the client that the url has permanetly moved to a new location. The resource should also include this lcoation. it tells the client to use the new URL the next time it wants to fetch the same resource.

```ruby
get "/" do
  status 302
  redirect "/home"
end
```

### Question 9. Write a route that renders a view template called list.erb within a layout called wide_layout.erb.

```ruby
get "/list" do
  erb :list, layout: :wide_layout
end
```

### Question 13. Write a single Sinatra route that will match paths structured like these three examples:

/departments/produce/apples/fuji
/departments/produce/potatoes/waxy
/departments/bakery/bread/whole_wheat

Within the route, assign each of the last three URL segments to local variables.

```ruby
  get "/departments/:department/:food_item/:type" do
    department = params[:department]
    food_item = params[:food_item]
    food_type = params[:type]
  end
```

### Question 14. How can user content be escaped within a Sinatra application?

  User content can be escaped by creating a method that escapes certain characters in the text with characters the browser won't interpret as code. The Rack library gives us a built in escape method, and there are others already built on the web that you can use if you won't want to build the method yourself. 

  Rack::Utils.escape_html

  or

  set :erb, escape_html: true



