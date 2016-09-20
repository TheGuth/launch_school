HTTP is a text-based protocol that is the foundation of the web.
There are two parties involved in HTTP: the client and the server.
A complete HTTP interaction involves a request which is sent from the client to the server, and a response which is sent from the server to the client.
A request is sent to a host and must include a method and a path. It may also include parameters, headers, or a body.
GET is the HTTP method used to retrieve a resource from the server.
A response must include a status. It may also include headers or a body.
A 200 OK status in a response means the request was successful.
Modern web browsers include debugging tools that allow you to inspect the HTTP activity of a page.

Although it is not something you'd normally do, it is possible to interact with HTTP manually because it is a text-based protocol.
HTTP is built on top of TCP, which is a networking layer that handles communicating between two computers.
URLs are made up of many components: a protocol, a host, a port, a path, and parameters.
Query parameters are parameters that are included in a URL. They are appended to the path using ?. Parameters are specified in the URL using the form key=value.
Parameters after the first are appended to the URL using &.
HTTP is stateless, which means that each request is handled separately by the server. By carefully crafting URLs and parameters, stateful interactions can be built on top of HTTP.


Sinatra is a small web framework.
HTTP requests are handled in Sinatra by creating routes for a path or set of paths.
Routes are created using methods named after the HTTP method to be handled. So, a GET request is is handled by a route defined using the get Sinatra method.
View templates can be written in many templating languages, such as ERB. They provide a place to define the HTML display of a response outside of the route handling it. Templating languages are usually better suited to describing HTML than plain Ruby.
A layout is a view template that surrounds a specific response's template. They are used to provide shared HTML that is used by all views, and often include links to stylesheets and JavaScript files.
Routes can specify parameters by using colon followed by the parameter name: /chapters/:number. In this case, the value would be accessible within the route using params[:number].
Code placed in a before block is executed before the matching route for every request.
View helpers are Ruby methods that are used to minimize the amount of Ruby code included in a view template. These methods are defined within a helpers block in Sinatra.
A user can be sent to a new location in response to a request by redirecting. This is done in Sinatra using the redirect method.
The files in a project can be identified as either server-side or client-side code based on where they will be evaluated.



# HTTP

## Describe what HTTP is and the role of the request and the response.

  HTTP is a text-based protocol that is the foundation of the web. There are two parties involved in HTTP; The client and the server.

  A complete HTTP interaction involveds a request which is sent from the client to the server, and a response which is sent from the server to the client.

## What are the components of an HTTP request and an HTTP response?

  HTTP Request: includes a method and a path, and it may also include parameters, headers, or a body.

  HTTP Response: includes a status, but may also include headers or a body.


## Identify the components of a URL. Construct a URL that contains a few params and values.

  URLs are made up of: a protocol, a host, a port, a path, and parameters.

  https://google.com:443/?search=restaurants&username=james&password=hello
  
  protocol = https:// 
  host = google.com
  path = /
  params = search=restaurants

## Explain the difference between GET and POST, and know when to choose each.

  A GET requests are used to read information for a given URL from a server, and are read-only, meaning that the data should never be modified on the server. The server should simply retrieve the data unchanged. GET is idempotent, meaning that submiting multiple GET requests to the same URL should cause the exact same effect

  GET status code 200 (OK) resource was found

  GET status code 404 (NOT FOUND) resource was not found

  A POST request is used to create a new resource, such as a sign-up form. POST is neither safe nor idempotent.

  POST requests responde with a status code 201 (CREATED) along with a location header with the link to the newly created resource.

## What is the difference between client-side and server-side code? For each file in a Sinatra project, be able to say which it is.

  Client-side code: runs on the client or browser and is what the user interacts with. Examples: JavaScript, HTML, and CSS

  Client-side files: Stylesheets (.css), Javascript Files (.js), 

  Server-side code: runs on the server which gets requests from the client and sends a response back. Examples: Ruby, java, C++, Python, etc..

  Server-side files: Gemfile, Ruyb files (.rb), View Templastes (.erb)

  VIew Templaetes are considered server-side code because they have to be proccesed by a program on the server before being sent to the client.


# Web

## How does an HTML form element interact with the server-side code that processes it

  When a form is submitted, the browser makes a HTTP request.

  This request is made to the path or URL specified in the action attribute of the form element.

  The method attribute of the form determines if the request made will use GET or POST

  The value of any input elements in the form will be sent as parameters. The keys of these parameters will be determined by the name attriute of the corresponding input element.

## Why is user-entered content a security risk? Be aware of how to mitigate this risk

User-entered content is a security risk, because if user-entered content isn't parsed the user could enter code that could be executed on the web app. That is why we have to filter any usesr-entered content, just in case


# Sinatra

## Start a new Sinatra project and write simple routes to handle requests.


## What are the benefits of using view templates? Be able to use an ERB template in a Sinatra route.

  templates allow us to make our webpages for dynamic and allow us to input code into our web pages. Say we want a different <title> for each page we can make this possible through a template by defining it in Ruby coe, and then the value would be inserted into the template before the user would see it.

## What is the session? Where it is stored? How it is used?

  The session is a way for developers to store information on the client side. We use cookies and crytpographic tenchniques to mintain state without storing as much data on the server. The cookies then are sent with every request to the server which then uses the data to remember the state of the application for that specific client. 

## write a view helper and use it within a view template.
  helpers do

  end

  methods that are used in the view should be in a helper block.

  These are methods that are made available in templates by Sinatra for the purpose of filtering and processing data that is being rendered into the page.

## Explain how redirection works and why it would be needed in a web application.

  Routes don't have to return HTML code that will be returned to the user's browser. They can also send the browser to a different URL using the redirect method in Sinatra

  It is common to redirect a user as the result of creating or updating some data, such as when a web site redirects a user to an order confirmation page after a payment form is successfully submitted.

























