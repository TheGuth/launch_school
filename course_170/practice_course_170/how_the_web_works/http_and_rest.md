# How the Web Works Part III: HTTP & REST

## What is HTTP?

HTTP is the protocol or rules that the clients and servers adhere to in the request-response cycle.

Hyper Text Transfer Protocol (HTTP) defines the syntax (the data format and encoding) semantics (the meaning associated with the syntax) and timing (speed and sequencing). Each HTTP request and response exchanged between a client and server is considered a single HTTP transaction.

## HTTP: The broad strokes

1. HTTP is text-based, meaning that the messages exchanged between the client and server are bits of text. Each message containts two parts: a header and a body.

2. HTTP is an application layer protocol, meaning it's just an abstraction layer that standardizes how hosts communicate. HTTP itself doesn't transmit the data. It still depends on the underlying TCP/IP protocol to get the request and response from on machine to another.

HTTP request or response is not encrypted and is vulbnerable to varioust types of security attacks.

HTTPS is more secure and uses encryption to keep tings safe. (stands for HTTP over TLS/SSL)

SSL is a security protocol that allows the client and server to communicate across a network in a secure way.

## HTTP: The fine strokes

### HTTP Request Header

HTTP Headers typically contain metadata (data about data) The metadata includes request type (GET, POST, PUT, DELETE), path, status code, contet-type, user-agent, cookie, post body (sometimes), and more

### HTTP Body

The Body holds the message/or primary information. could be html, javascript, etc...

### HTTP Methods

HTTP methods tell the server what to do with the data identified by the URL. This basically tells the server what action needs to happen on which resource.

Examples of HTTP Methods:

GET

POST

PUT

DELETE

### GET

GET method is used to read information for a given URL from a server.

GET requests are read-only, so the server should only retrieve the data unchagned.

GET requests are considered safe operations, because calling it multiple times should have the same effect.

GET requests are idempotent, which means calling it multiple times shouldn't change anything.

GET requests respond with a status code 200 (OK) if the resource was successfully found, and 404 (NOT FOUND) if the resource was not found.

### POST

POST method is used to create a new resource, such as a sign-up form.

You use POST when you want to create a subordinate resource to some other parent resource. Your post to this parent resource identified by the URL, and the server processes the new resource and associates it with the parent.

POST is neither safe nor idempotent, because making two or more identical POST requests will likely cause two new identical resources to be created.

POST requests respond with a status code 201 (CREATED) along with a location header with the link to the newly created resource.

### PUT

PUT is used to update the resouce identified by the URL using the information in the request body.

PUT requests are not considered safe operations because they modify state on the server.

PUT requests are idempotent because multiple identical PUT requests to update a resource should have the same effect as the first one.

PUT requests respond with a status code of 200 (OK) if the resource is found, and 404 (NOT FOUND) if the resource isn't found.

### DELETE

DELETE is used to delete the resource identified by the URL. 

DELETE requests are idempotent because if you DELETE a resource, it's deleted and even if you make multiple identical DELETE requests, the result is the same.

DELETE requests respond with a 200 (OK) status code if successfully deleted or 404 (NOT FOUND) if the resource to be deleted couldn't be found.

All of the above requests return a 500 (INTERNAL SERVER ERROR) if the processing fails and the server errors out.

## What is REST after all?

REST stands for "Representational State Transfer" It's an architecture style for desiging applications.

The basic idea is to use a "stateless", "client-server", "cacheable" protocol to make calls between machines (protocol usually HTTP).

full list of constraints
https://en.wikipedia.org/wiki/Representational_state_transfer

### Two most important Constraints

1. Uniform interface: This constraint tells you how to define the interface between the client and server.

Resources must be identifiable in a request. 

A Resource is the data that defines the resource representation.

Resources and resource representations are separate things (client only interacts with resource representation.)

The client must have enough information to manipulate resources on the server using the representation of the resource.

Every message exchanged between the client and server needs to be self-descriptive, with information on how to process the message.

Clients must send state data using HTTP body content, HTTP request headers, query parameters and the URL.

Servers must send state data using HTTP body content, response codes, and response headers.

2. Stateless: This constraint tells us that all the state data needed to handle a client request must be contained within the request itself (URL, query parameters, HTTP body, or HTTP headers) and the server must send all the state data neccessary back to the client through the response itself (HTTP headers, status code, and HTTP resonse body.)

State--or application state-- is the data necessary for a server to fulfill a request. This means that for every request, we resend the state information back and forth, so the server doesnt have to maintain, update and send the state.