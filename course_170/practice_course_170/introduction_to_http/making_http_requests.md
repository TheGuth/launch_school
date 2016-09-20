# Making HTTP Requests

## HTTP Request with a Browser

Making an HTTP request is easy. Say you want to visit Reddit in your browser. All you need to do is launch your browser and enter the address https://www.reddit.com and this is a snapshot of what you might see:

## HTTP request Browser

The server that hosts the main Reddit website handles your request and issues a response back to your browser. Your browser is smart enough to process the response that is sent back and display the site you see in the screenshot, with all its colors, images, text and presentation.

## HTTP Request with an HTTP Tool

Because browsers show us the processed version of the response, we don't get to see the raw response the server sent back. How do we see the raw HTTP response data?

For that, we can use an HTTP tool and just like the browser did when we entered a URL in the address bar, we can have our HTTP tool issue a request to https://www.reddit.com. Our HTTP tool, Paw, doesn't process the response and lets us see the raw response data, which looks something like this:

## HTTP request Tool

What a huge difference this raw response is from the display in your browser! If you've never seen raw HTTP response data before, this may be quite shocking. What you see here is, in fact, what your browser also receives, except it parses and processes that huge blob of data into a user-friendly format.

If you're learning about HTTP in order to become a web developer, you'll need to learn to read and process raw HTTP response data just by scanning it. Of course, you won't be able to convert it into a high-resolution picture in your head, but you should have a general idea of what the response is about. With enough experience, you can dig into the raw data and do some debugging and see exactly what's in the response.

## Using the Inspector

Every modern browser has a way to view HTTP requests and responses, and it's usually called the inspector. We're going to use the Chrome Inspector to demonstrate how to analyze your browser's HTTP communication.

Launch Chrome browser and open the Inspector by navigating to the Chrome Menu on the top right-hand corner of your browser. Select Tools then Developer Tools.
Send a new request to Reddit by entering the address https://www.reddit.com into your browser.
With the inspector still open click on the Network tab:

## Network Tab

The first thing you should notice is that there are a lot of entries there. Each entry is a separate request, which means just by visiting the URL, your browser is making multiple requests, one for every resource (image, file, etc.). Click on the first request for the main page, www.reddit.com entry:

## Network Tab

From here, you'll be able to see the specific request headers, cookies as well as the raw response data:

## Chrome HTTP Headers

The default sub-tab, Headers, shows the request headers sent to the server, as well as the response headers received back from the server.

Click on the Response sub-tab to see the raw response data.

## Chrome HTTP Headers

The response data should look similar to what we saw earlier using our HTTP tool, except Chrome displays the data in a single line.

Another thing to note when using the inspector's Network tab is, other than the first request, there are a ton of other requests returned:

## Network tab resources

Why are these additional responses sent back, who initiated the requests? What's happening is that the resource we requested, the initial www.reddit.com entry, returned some HTML. And in that HTML body are references to other resources like images, css stylesheets, javascript files and more. Your browser, being smart and helpful, understands that in order to produce a visually appealing presentation, it has to go and grab all these referenced resources. Hence, the browser will make separate requests for each resource referenced in the initial response. When you scroll down the Network tab, you'll be able to see all the referenced resources. These other requests are to make sure the page displays properly on your screen, among other things. Overall, you see that the browser's inspector gives you a good feel for these referenced resources. A pure HTTP tool, on the other hand, returns one huge response chunk without any concern for automatically pulling in referenced resources. A curl request will demonstrate this:

$ curl -X GET "https://www.reddit.com/" -m 30 -v
What you should see is just one request and the response containing the HTML, but no additional requests being automatically issued, like you see in a browser.

## Request Methods

Let's revisit the diagram from Step 3 above, when we looked at the responses in the Network tab. You might have noticed two columns named Method and Status. If you don't see the Method column, it may be hidden by default. To display the Method column, right click on Status and select Method. The Method column should now be visible next to the Status column.

## HTTP method and status

We'll spend this section looking at what the information shown in these columns mean.

Information displayed in the Method column is known as the HTTP Request Method. You can think of this as the verb that tells the server what action to perform on a resource. The two most common HTTP request methods you'll see are GET and POST. When you think about retrieving information, think GET, which is the most used HTTP request method. In the above diagram, you'll notice almost all of the requests use GET to retrieve the resources needed to display the web page.

The Status column shows the response status for each request. We'll talk about responses in detail later in the book. Important thing to understand is that every request gets a response, even if the response is an error -- that's still a response. (That's not 100% technically true as some requests can time out, but we'll set those rare cases aside for now.)

## GET Requests

GET requests appear in a link or the address bar of the browser. When you type an address like https://www.reddit.com into the address bar of your browser, you're making a GET request. You're asking the web browser to go retrieve the resource at that address, which means we've been making GET requests throughout this book. The same goes for interacting with links on web applications. The default behavior of a link is to issue a GET request to a URL. Let's make a simple GET request to https://www.reddit.com with an HTTP tool. Make sure to select GET and enter the address:

## simple GET request

You can view the raw HTTP response and other information sent back from the web server on the right panel.

curl users can enter the following command on their terminal:

$ curl -X GET "https://www.reddit.com/" -m 30 -v
We can also send query strings using an HTTP tool. Let's look at another quick example by sending a request to search for all things Michael Jackson at https://itunes.apple.com/ with query strings. The final URL will look like this:

https://itunes.apple.com/search?term=Michael%20Jackson
before submitting a request, make sure to select GET.

## iTunes query strings

Here we are simply sending an HTTP GET request to the server at https://itunes.apple.com/ with parameter term=Michael%20Jackson where %20 is a URL-encoded character for SPACE.

The curl command for this example is:

$ curl -X GET "https://itunes.apple.com/search?term=Michael%20Jackson" -m 30 -v
That's all you need to know about issuing HTTP GET requests for now. The primary concepts are:

GET requests are used to retrieve a resource, and most links are GETs.
The response from a GET request can be anything, but if it's HTML and that HTML references other resources, your browser will automatically request those referenced resources. A pure HTTP tool will not.
There are size and security limitations to using GET requests.
POST Requests

We've seen how to retrieve or ask for information from a server with GET, but what if you need to send or submit data to the server? That's where another essential HTTP request method comes in: POST. POST is used when you want to initiate some action on the server, or send data to a server. Let's see an example with our HTTP tool:

## Simple Post request

Here is the curl command:

$ curl -X POST "https://echo.epa.gov" -m 30 -v
The above screenshot shows a POST request to https://echo.epa.gov and the response from the server. Typically from within a browser, you use POST when submitting a form. POST requests allow us to send much larger and sensitive data to the server, such as images or videos. For example, say we need to send our username and password to the server for authentication. We could use a GET request and send it through query strings. The flaw with this approach is obvious: our credentials become exposed instantly in the URL; that isn't what we want. Using a POST request in a form fixes this problem. POST requests also help sidestep the query string size limitation that you have with GET requests. With POST requests, we can send significantly larger forms of information to the server.

Let's see another example of making a POST request by filling out a web form. Our sample form looks like this in the browser:

web form

After filling out the form, you'll be redirected to a page that looks like this:

web form

Now let's switch over to our HTTP tool and simulate what we just did in the browser. Instead of filling out a form in the browser, we will send a POST request to http://al-blackjack.herokuapp.com/new_player. This is the URL that the first form (the one where we input a name) submits to:

Post request http tool

Or you can use curl:

$ curl -X POST "http://al-blackjack.herokuapp.com/new_player" -d "player_name=Albert" -m 30 -v
Notice that in the screenshot and curl command we're supplying the additional parameter of player_name=albert. It has the same effect as inputting the name into the first "What's your name?" form and submitting it.

We can verify the contents using the inspector (right click and select Inspect Element). You'll see that the player_name parameter we're sending as part of the POST request is embedded in the form via the name attribute of the input element:

## Post request http tool

But the mystery is, how is the data we're sending being submitted to the server since it's not being sent through the URL? The answer to that is the HTTP body. The body contains the data that is being transmitted in an HTTP message and is optional. In other words, an HTTP message can be sent with an empty body. When used, the body can contain HTML, images, audio and so on. You can think of the body as the letter enclosed in an envelope, to be posted.

The POST request generated by the HTTP tool or curl is the same as you filling out the form in the browser, submitting that form, and then being redirected to the next page. Look carefully at the raw response in the HTTP tool screenshot. The key piece of information that redirects us to the next page is specified in the field Location: http://al-blackjack.herokuapp.com/bet. Location and its associated data is part of what is known as an HTTP response header (yes, requests have headers too, but in this case, it's a response header). Don't worry too much about this yet as we'll discuss headers in a later section. Your browser sees the response header and automatically issues a brand new request to the URL specified in the Location header, thereby initiating a new, unrelated request. The "Make a bet" form you see is the response from that second request.

## HTTP Redirect location

If you're fuzzy on the previous paragraph, read it again. It's critical to understand that when using a browser, the browser hides a lot of the underlying HTTP request/response cycle from you. Your browser issued the initial POST request, got a response with a Location header, then issued another request without any action from you, then displayed the response from that second request. Once again, if you were using a pure HTTP tool, you'd see the Location response header from the first POST request, but the tool would not automatically issue a second request for you. (Some HTTP tools have this ability, if you check the "automatically follow redirects" option.)

## HTTP Headers

HTTP headers allow the client and the server to send additional information during the request/response HTTP cycle. Headers are colon-separated name-value pairs that are sent in plain text. By using the Inspector, we can see these Headers. Below, you can see both the request as well as the response headers:

## http headers

The above shows the various headers being transmitted during a request/response cycle. Further, we can see that the request and response contain a different set of headers under Request Headers:

http request headers

Request Headers

Request headers give more information about the server and the resource to be fetched. Some useful request headers are:

Field Name  Description Example
Host  The domain name of the server.  Host: www.reddit.com
Accept-Language List of acceptable languages. Accept-Language: en-US,en;q=0.8
User-Agent  A string that identifies the client.  User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36
Connection  Type of connection the client would prefer. Connection: keep-alive
Don't bother memorizing any of the request headers, but just know that it's part of the request being sent to the server. We'll talk about response headers in the next chapter.

## Summary

This was a brief introduction on making HTTP requests. After going through this section, you should be comfortable with:

using the inspector to view HTTP requests
making GET/POST requests with an HTTP tool
The most important components to understand about an HTTP request are:

URL
parameters
headers
message body (for POST requests)
In the next chapter, we'll continue learning about HTTP by looking at HTTP responses.