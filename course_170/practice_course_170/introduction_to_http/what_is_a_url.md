# What is a URL?

## Introduction

When you need to locate someone's home, you need their house address. If you want to call your friend, you need your friend's phone number. Without that information, finding that house or calling your friend is not possible. Further, if you're provided an address or phone number, you can immediately tell one from the other, due to the uniformity of how the address looks like vs. a phone number.

There's a similar concept for finding and accessing servers on the Internet. When you want to check Facebook's games page, you start by launching your web browser and navigating to http://www.facebook.com/games. The web browser makes an HTTP request to this address resulting in the resource being returned to your browser. The address you entered, https://www.facebook.com/games, is known as a Uniform Resource Locator or URL. A URL is like that address or phone number you need in order to visit or communicate with your friend. A URL is the most frequently used part of the general concept of a Uniform Resource Identifier or URI, which specifies how resources are located. This section looks at what a URL is, its components and what it means to you as a web developer.

## URL Components

When you see a URL, such as "http://www.example.com/home", it's comprised of several components. We can break this URL into 3 parts:

http: this is called the URL scheme. It always comes before the colon and two forward slashes and tells the web client how to access the resource. In this case it tells the web client to use the Hypertext Transfer Protocol or HTTP to make a request. Other popular URL schemes are ftp, mailto or git.

www.example.com: The second part of the URL, is the resource path or host. It tells the client where the resource is hosted or located.

/home/: The third part of the URL, is the URL path. It shows what local resource is being requested.

## URL Components

Sometimes, the path can point to a specific resource on the host. For instance, www.example.com/home/index.html points to an HTML file located on the example.com server.

Additionally, URLs can contain a port number which the host uses to listen to HTTP requests. A URL in the form of: http://localhost:3000/profile is using the port number 3000 to listen to HTTP requests. The default port number for HTTP is port 80. Even though this port number is not always specified, it's assumed to be part of every URL. Unless a different port number is specified, port 80 will be used by default in normal HTTP requests. To use anything other than the default, one has to specify it in the URL.

## Query Strings/Parameters

A Query string or parameter is part of the URL and usually contains some form of data to be sent to the server. A simple URL with query strings might look like:

http://www.example.com?search=ruby&results=10
Let's take that apart:

Query String Component  Description
? This is a reserved character that marks the start of the query string
search=ruby This is a parameter name/value pair.
& This is a reserved character, used when adding more parameters to the query string.
results=10  This is also a parameter name/value pair.
Now let's take a look at an example. Suppose we had the following URL:

http://www.phoneshop.com?product=iphone&size=32gb&color=white
Query String Components

In the above example, name/value pairs in the form of product=iphone, size=32gb and color=white are passed to the server from the URL. This is asking the www.phoneshop.com server to narrow down on a product iphone, size 32gb and color white. How the server uses these parameters is up to the server side application.

Another common place where you may have seen query parameters in action is when you perform a search in any modern search engine. Because query strings are passed in through the URL, they are only used in HTTP GET requests. We'll talk about the different HTTP requests later in the book, but for now just know that whenever you type in a URL into the address bar of your browser, you're issuing HTTP GET requests. Most links are also HTTP GET requests, though there are some minor exceptions.

## Query Strings

Query strings are great to pass in additional information to the server, however, there are some limits to the use of query strings:

Query strings have a maximum length. Therefore, if you have a lot of data to pass on, you will not be able to do so with query strings.
The name/value pairs used in query strings are visible in the URL. For this reason, passing sensitive information like username or password to the server in this manner is not recommended.
Space and special characters like & cannot be used with query strings. They must be URL encoded, which we'll talk about next.
URL Encoding

By default URLs are designed to accept only certain characters in the ASCII character set. As such, unsafe or reserved characters not included in this set have to be converted or encoded to conform to this format. URL encoding serves the purpose of replacing these non-conforming characters with a % symbol followed by two hexadecimal digits that represent the ASCII code of the character.

Below are some popular encoded characters and example URLs:

Character ASCII code  URL
Space 20  http://www.thedesignshop.com/shops/tommy%20hilfiger.html
! 21  http://www.thedesignshop.com/moredesigns%21.html
+ 2B  http://www.thedesignshop.com/shops/spencer%2B.html
# 23  http://www.thedesignshop.com/%23somequotes%23.html
Characters must be encoded if:

They have no corresponding character within the ASCII character set.
The use of the character is unsafe. For example % is unsafe because it is used for encoding other characters.
The character is reserved for special use within the URL scheme. Some characters are reserved for a special meaning; their presence in a URL serve a specific purpose. Characters such as /, ? :, @ and & are all reserved and must be encoded.
For example & is reserved for use as a query string delimiter. : is also reserved to delimit host/port components and user/password.

So what characters can be used safely within a URL? Only alphanumeric and special characters $-_.+!'(),", and reserved characters when used for their reserved purposes can be used unencoded within a URL. As long as a character is not being used for its reserved purpose, it has to be encoded.

## Summary

In this chapter, we've discussed URLs and what a URL is. We also looked at components of the URL and concluded by exploring URL encoding. We'll dive a little deeper into requests and responses and what they comprise of after the preparations chapter.

