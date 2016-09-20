# Processing Responses

## Introduction

So far we've been sending various requests and looking at the raw HTTP data sent back by the server. This raw data returned by the server is called a response. We'll spend this section analyzing the various components of an HTTP response.

## Status Code

The first component we'll look at is the HTTP Status Code. The status code is a three-digit number that the server sends back after receiving a request signifying the status of the request. The status text displayed next to status code provides the description of the code. It is listed under the Status column of the Inspector:

## HTTP Status Inspector

The most common response status code you'll encounter is 200 which means the request was handled successfully. Other useful status codes are:

Status Code Status Text Meaning
200 OK  The request was handled successfully.
302 Found The requested resource has changed temporarily. Usually results in a redirect to another URL.
404 Not Found The requested resource cannot be found.
500 Internal Server Error The server has encounter a generic error.
As a web developer, you should know the above response status codes and their associated meaning very well.

Let's look at examples of each:

### 302 Redirect

What happens when a resource is moved? The most common strategy is to re-route the request from the original URL to a new URL. The general term for this kind of re-routing is called a redirect. When your browser sees a response status code of 302, it knows that the resource has been moved, and will automatically follow the new re-routed URL in the Location response header. In this section, we'll focus on redirects in the context of a Browser and an HTTP tool.

Say you want to access the account profile at Github, you'll have to go to the address https://github.com/settings/profile. However, in order to have access to the profile page, you must first be signed in. If you're not already signed in, the browser will send you to a page to do that. After you enter your credentials, you'll be redirected to the original page you were trying to access. This is a pretty common workflow most web applications employ. Let's see how the browser and the HTTP tool handle that workflow.

First you enter https://github.com/settings/profile into your browser. Because the browser is smart and helpful, it'll simply follow the redirect and display the Github sign in page:

### browser redirect

Compare that with the HTTP tool (note the status code), which does not automatically follow the redirect:

### http tool redirect

Take note of the Location response header (it's a little hard to see, on line 12). You should see Location: https://github.com/login?return_to=https%3A%2F%2Fgithub.com%2Fsettings%2Fprofile, which contains a return_to parameter with a value of the URL where the client should be redirected to after signing in. Compare that with the screenshot from the browser above: you'll notice that the address https://github.com/login?return_to=https%3A%2F%2Fgithub.com%2Fsettings%2Fprofile is the same as what's in the browser address bar.

### 404 Not Found

Next, let's look at a 404 response status code in the browser. The server returns this status code when the requested resource cannot be found. Remember, a resource can be anything including audio files, CSS stylesheets, JavaScript files, images etc. Let's send a request to retrieve our awesome image at https://www.dropbox.com by sending a GET request to https://www.dropbox.com/awesome_file.jpg:

Dropbox 404

We see the nice default 404 page from Dropbox. Now take a look the response of the same request using a pure HTTP tool:

Dropbox 404

Because the resource we want does not exist, the browser shows us nice formatted text while the HTTP tool shows us the raw response with the status code.

500 Internal Server Error

A 500 status code says "there's something wrong on the server side". This is a generic error status code and the core problem can range from a mis-configured server setting to a misplaced comma in the application code. But whatever the problem, it's a server side issue. Someone with access to the sever will have to debug and fix the problem, which is why sometimes you see a vague error message asking you to contact your System Administrator. In the wild, a 500 error can be shown in a variety of ways, just like a 404 page can. Here's an example of a generic error page from the default Rails application:

### browser 500

Using an HTTP tool, we can see the status code and raw data:

http tool 500

Response Headers

Like request headers, we can also use the inspector to view response headers:

http response headers

Response headers offer more information about the resource being sent back. Some common response headers are:

Header Name Description Example
Content-Encoding  The type of encoding used on the data.  Content-Encoding: gzip
Server  Name of the server. Server:thin 1.5.0 codename Knife
Location  Notify client of new resource location. Location: https://www.github.com/login
Content-Type  The type of data the response contains. Content-Type:text/html; charset=UTF-8
There are a lot more response headers, but just like request headers, it's not necessary to memorize them. They have subtle effects on the data being returned, and in some cases, they have subtle workflow consequences (eg, your browser automatically following a Location response header). Just understand that response headers contain additional meta-information about the response data being returned.

## Summary

In this chapter, we've discussed the components of HTTP responses. We've also looked at how to use the inspector to view the headers associated with an HTTP response. Although we have only scratched the surface of the HTTP protocol, we hope this will empower you to dig further should the need arise.

In sum, we've seen that HTTP is nothing more than an agreement in the form of formatted text that dictates how a client and server communicate.

The most important parts of an HTTP response are:

status code
headers
message body, which contains the raw response data
See if you can figure out where each of the above components are in the screenshot below.