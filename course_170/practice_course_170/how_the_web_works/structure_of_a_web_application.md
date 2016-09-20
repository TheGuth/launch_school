# How the Web Works Part II: Client-Server Model & the Structure of a Web Application

## The Client-Server Model

The idea of a client and server communicating over a network is called the "Client-Server" model. 

THe Client-Server model is really just a way to describe the give-and-take relationship between the client and server in a web application.

## A Basic Web App Configuration

There are hundresds of ways to configure a web application. That said, most of them follow the same basic structure: a client, a server, and a database.

### The Client

The client is what users interacts with. So "Client-side" code is responsible for most of what a user actually sees. This includes:

1. Defining the structure of the web page

2. Setting the look and feel of the web page

3. Implementing a mechanism for responding to user interactions (clicking buttons, entering text, etc.)

#### Structure:

The layout and content of your webpage are defined by HTML (usually HTML 5)

HTML stands for Hyper Text Markup Langauge. It allows you to describe the basic physical structure of a document using HTML tags. Each Html tag describes a specific element on the document.

For example:
```html
<html>
  <meta charset="utf-8" />
    <title>SUPER BASIC</title>
  <head>
    <script src="lib/lodash.js"></script>
  </head>
  <body>
    <header>
      Hello Friends!
    </header>
    <h1>My super duper fun heading</h1>
    <div id="mywebsite">
      <p>
        Welcome to my super basic website
      </p>
      <ul id="hello">
        <li>hello 1</li>
        <li>hello 2</li>
        <li>hello 3</li>
      </ul>
      <button id="button">Get me another Hello!</button>
    </div>
    <script type="myAwesomeJavaScript.js"></script>
  </body>
</html>
```

The content within the "<h1>" tag describes the heading.

The content within the "<p>" tag describes a paragraph.

The content within the "<button>" tag describes button.

and so on...

A web browser uses these HTML tags to determine how to display the document.

#### Look and Feel:

To define the look and feel of a webpage, web developers use css, which stands for Cascading Style Sheets. CSS is a language that lets you describe how the elements defined in your HTML should be styled, allowing changes in font, color, layout, simple animations, and other superficial elements.

```css
body {
  font-family: 'sans-serif';
  font-color: 'black':
  font-size: 14;
}

h1 {
  font-color: 'red'
  font-size: 20;
}

#hello {
  font-style: italic;
}
```

#### User interactions:

Lastly, JavaScript comes into the picture to handle user interactions.

for example, if you want to do something when a user cliks a button

```js
var button = document.getElementById('button');
button.addEventLIstner('click', function() {
  alert('You clicked me!');
});
```

Some user interaction, like the one above, can be handled without ever having to reach out to your server, hence the term "client_side JavaScript."

Other interactions such as a user comment that might need to be stored in a database would be sent to a server.

### The Server

Listens to requests coming in from the client. When you set up an HTTP server, you set it up to listen to a port number. A port number is always associated with the IP address of a computer. 

Ports are like separate channels on each computer that can be use to perform different tasks. 

Once you've set up an HTTP server to listen to a specific port, the server waits for client requests coming to that specific port, and then performs any actions stated by the request, and sends any requested data via an HTTP response.

### The database

Databases are the basements of web architecture. A databases is a place to store information so that it can easily be accessed, managed, and updated.

## How to Scale a Simple Web Application

The above configuration is great for simple applications, But as applications grow, a single server won't have the power to handle thousands-- if not millions-- of concurrent requests from visitors.

To scale properly we have distribute the incoming traffic across a group of back-end servers

If you have multiple servers, each with its own IP address. How does the DNS know which instance of your application to send your traffic to? It doesn't.

A Load balancer acts as a traffic cop that routes client requests across the servers in the fastest and most efficient manner possible.

A virtual IP address points to the load balancer, which is what the users client uses, the load balancer then jumps in to distribute the traffic to the various back-end servers in real-time using an algorithm to determine which server to send the request.

algorithm examples:

Round Robin -- evenly distributing incoming requests across all available servers. (chosen usually if servers have similar processing speed and memory.)

Least Connections -- The next request is sent to the server with the least number of active connections.

## Services

A service is just another server, except that it only interacts with other servers.

Each service has a self-contained unit of functionality, such as authorizing users or providing a search functionality.

Services allow you to break up your single web server into multiple services that each performs a discrete functionality.

Main benifit to breaking up a single server into many services: Allows you to scale the services completely independently, allows teams to work independently as well.

## Content Delivery Networks

CDN (Content Delivery Network) is a large distributed system of "proxy" servers deployed across many data centers, a proxy server is just a server that acts as an intermediary between a client and a server.














