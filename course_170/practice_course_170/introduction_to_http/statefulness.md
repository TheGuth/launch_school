Stateful Web Applications

Introduction

We already know that the HTTP protocol is stateless. In other words, the server does not hang on to information between each request/response cycle.

HTTP request Browser

Each request made to a resource is treated as a brand new entity, and different requests are not aware of each other. This statelessness is what makes HTTP and the internet so distributed and difficult to control, but it's also the same ephemeral attribute that makes it difficult for web developers to build stateful web applications.

As we look around the internet and use familiar applications, we feel that the application somehow has a certain state. For example, when we log in to Facebook or Twitter, we see our username at the top, signifying our authenticated status. If we click around (which generates new requests to Facebook's servers) we are not suddenly logged out; the server response contains HTML that still shows our username, and the application seems to maintain its state.

In this chapter, we'll focus on how this happens by discussing some of the techniques being employed by web developers to simulate a stateful experience. Along the way, we'll also discuss some techniques used on the client to make displaying dynamic content easy. The approaches we'll discuss are:

Sessions
Cookies
Asynchronous JavaScript calls, or AJAX
A Stateful App

Let's begin by looking at an illustration of a stateful app. When you make a request to https://www.reddit.com, the home page shows up:

HTTP request Browser

Next, login with your username and password:

Dynamic Content

At the top, you'll notice your username, signifying that you're now successfully authenticated. If you refresh the page, which issues another request to the reddit server at https://www.reddit.com, you'll see that the page stays the same; you seem to be still logged in. What's happening here? Isn't HTTP supposed to be a stateless protocol? How does the server know to remember your username and dynamically display it on the page even after sending a new request? This behavior is so common now that we don't think twice about it. It's how the items in your shopping cart can stay as you keep adding items to it, sometimes even across multiple days. It's how Gmail identifies you and displays your name and some customized greeting. It's how all modern web applications work.

Sessions

It's obvious the stateless HTTP protocol is somehow being augmented to maintain a sense of statefulness. With some help from the client (i.e., the browser), HTTP can be made to act as if it were maintaining a stateful connection with the server, even though it's not. One way to accomplish this is by having the server send some form of a unique token to the client. Whenever a client makes a request to that server, the client appends this token as part of the request, allowing the server to identify clients. In web development, we call this unique token that gets passed back and forth the session identifier.

This mechanism of passing a session id back and forth between the client and server creates a sense of persistent connection between requests. Web developers leverage this faux statefulness to build sophisticated applications. Each request, however, is technically stateless and unaware of the previous or the next one.

This sort of faux statefulness has several consequences. First, every request must be inspected to see if it contains a session identifier. Second, if this request does, in fact, contain a session id, the server must check to ensure that this session id is still valid. The server needs to maintain some rules with regards to how to handle session expiration and also decide how to store its session data. Third, the server needs to retrieve the session data based on the session id. And finally, the server needs to recreate the application state (e.g., the HTML for a web request) from the session data and send it back to the client as the response.

This means that the server has to work very hard to simulate a stateful experience, and every request still gets its own response, even if most of that response is identical to the previous response. For example, if you're logged into Facebook, the server has to generate the initial page you see, and the response is a pretty complex and expensive HTML that your browser displays. The Facebook server has to add up all the likes and comments for every photo and status, and present it in a timeline for you. It's a very expensive page to generate. Now if you click on the "like" link for a photo, Facebook has to regenerate that entire page. It has to increment the like count for that photo you liked, and then send that HTML back as a response, even though the vast majority of the page stayed the same.

Fortunately, Facebook uses Ajax instead of refreshing your browser. But if Facebook didn't use Ajax, each page refresh would take a really long time.
There are many advanced techniques that servers employ to optimize sessions and, as you can imagine, there are also many security concerns. Most of the advanced session optimization and security concerns are out of scope of this book, but we'll talk about one common way to store session information: in a browser cookie

Cookies

A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle. Cookies or HTTP cookies, are small files stored in the browser and contain the session information. By default, most browsers have cookies enabled. When you access any website for the first time, the server sends session information and sets it in your browser cookie on your local computer. Note that the actual session data is stored on the server. The client side cookie is compared with the server-side session data on each request to identify the current session. This way, when you visit the same website again, your session will be recognized because of the stored cookie with its associated information.

Cookie Diagram

Let's see a real example of how cookies are initiated with the help of the browser inspector. We'll make a request to the address to http://www.yahoo.com. Note that if you're following along, you may have to use a different website if you already have an existing cookie from Yahoo.

With the inspector's Network tab open, navigate to that address and inspect the request headers:

cookie request headers

Note it has no reference to cookies. Next, look at the response headers:

Dynamic Content

You'll notice it has set-cookie headers that add cookie data to the response. This cookie data got set on the first visit to the website. Finally, make a request to the same address and then look at the request headers:

Dynamic Content

You'll see the cookie header set (note that this is the request header, which implies it's being sent by your client to the server). It contains the cookie data sent previously by the set-cookie response header. This piece of data will be sent to the server each time you make a request and uniquely identifies you -- or more precisely, it identifies your client, which is your browser. The browser on your computer stores these cookies. Now, if you were to close your browser and shut down your computer, the cookie information would still be persisted.

Let's now revisit the original example of how Reddit, or any web application, keeps track of the fact that we maintain our authenticated status even though we issue request after request. Remember, each request is unrelated to each other and are not aware of each other - how does the app "remember" we're authenticated? If you're following along, perform the following steps with the inspector open:

Click the resources tab and navigate to https://www.reddit.com

Expand the cookies section and click on www.reddit.com where you'll see the cookies that came with our initial request under the value column:

no session

After logging in, you should notice a unique session in the last row. That session id is saved into a cookie in your browser, and is attached along with every future request that you make to reddit.com:

no session

With the session id now being sent with every request, the server can now uniquely identify this client. When the server receives a request with a session id, the server will look for the associated data based on that id, and in that associated session data is where the server "remembers" the state for that client, or more precisely, for that session id.

Where is the session data stored? 
The simple answer is: on the server somewhere. Sometimes, it's just stored in memory, while other times, it could be stored in some persistant storage, like a database or key/value store. Where the session data is actually is not too important right now. The most important thing is to understand that the session id is stored on the client, and it is used as a "key" to the session data stored server side. That's how web applications work around the statelessness of HTTP.
It is important to be aware of the fact that the id sent with a session is unique and expires in a relatively short time. In this context, it means you'll be required to login again after the session expires. If we log out, the session id information is gone:

no session

This also implies that if we manually remove the session id (in the inspector, you can right click on cookies and delete them), then we have essentially logged out.

To recap, we've seen that the session data is generated and stored on the server-side and the session id is sent to the client in the form of a cookie. We've also looked at how web applications take advantage of this to mimic a stateful experience on the web.

AJAX

Last, we'll briefly mention AJAX and what it means in the HTTP request/response cycle. AJAX is short for Asynchronous JavaScript and XML. Its main feature is that it allows browsers to issue requests and process responses without a full page refresh. For example, if you're logged into Facebook, the server has to generate the initial page you see, and the response is a pretty complex and expensive HTML page that your browser displays. The Facebook server has to add up all the likes and comments for every photo and status, and present it in a timeline for you. As we described earlier, it's a very expensive page to re-generate for every request (remember, every action you take -- clicking a link, submitting a form -- issues a new request).

When AJAX is used, all requests sent from the client is performed asynchronously, which just means that the page doesn't refresh. Let's see an example by performing some search on google:

Make a request to http://www.google.com and open the browser's inspector network tab. You'll notice the network tab is empty:

empty network tab

As soon as you start your search, you'll see the network tab gets flooded with requests.

Google search

No doubt you've performed searches many times and notice the page doesn't refresh. The Network tab however gives us some new insight into what's happening: every letter you type is issuing a new request, which means that an AJAX request is triggered with every key-press. The responses from these requests are being processed by some callback. You can think of a callback as a piece of logic you pass on to some function to be executed after a certain event has happened. In this case, the callback is triggered when the response is returned. You can probably guess that the callback that's processing these asynchronous requests and responses is updating the HTML with new search results.

We won't get into what the callback looks like or how to issue an AJAX request, but the main thing to remember is that AJAX requests are just like normal requests: they are sent to the server with all the normal components of an HTTP request, and the server handles them like any other request. The only difference is that instead of the browser refreshing and processing the response, the response is processed by a callback function, which is usually some client-side JavaScript code.

Summary

This chapter covered techniques used by web developers to mimic statefulness, despite having to work with HTTP, a stateless protocol. You learned about cookies and sessions, and how modern web applications remember state for each client. You also used the inspector to see cookies and the session id in action. Finally, you learned about the role AJAX plays in displaying dynamic content in web applications.