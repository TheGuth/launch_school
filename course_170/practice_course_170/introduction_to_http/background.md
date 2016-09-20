# Background

## A Brief Overview & History

When you type a URL into the address bar of your web browser, you expect to see the website displayed in your browser. When you click on a link, or submit a form, your browser may display the next page, or display errors in your form so you can correct them and submit again. Your browser is the interface or window, through which you interact with the world wide web.

Under your browser's hood lies a collection of files -- CSS, HTML, Javascript, videos, images, etc. -- that makes displaying the page possible. All these files were sent from a server to your browser, the client, by a transport protocol called HTTP (yes, this is why URLs in your browser address bar start with "http://").

HTTP, or Hypertext Transfer Protocol, was invented by Tim Berners-Lee in the 1980s. It is a system of rules, a protocol, that serve as a link between applications and the transfer of hypertext documents. Stated differently, it's an agreement, or message format, of how machines communicate with each other. HTTP follows a simple model where a client makes a request to a server and waits for a response. Hence, it's referred to as a request response protocol. Think of the request and the response as text messages, or strings, which follow a standard format that the other machine can understand.

The HTTP protocol has been through several changes from its inception. The protocol started in its most simplified form returning only HTML pages. In 1991, the first document version HTTP/0.9 was released. In 1992, HTTP/1.0 was released with the ability to transmit different file types like CSS documents, videos, scripts and images. 1995 saw the release of HTTP/1.1, which introduced the ability to reuse established connections for subsequent requests, among a host of other features. Further improvements made to HTTP/1.1 in 1999 resulted in what we see today. At the time of this writing, HTTP/2 is in its early stages of development.

## How the Internet Works

The Internet consists of millions of interconnected networks that allow all sorts of computers and devices to communicate with each other. By convention, all devices that participate in a network are provided unique labels. The general term for this type of label is an Internet Protocol Address or IP Address and is similar to a computer's phone number on the Internet. Further, IP Addresses have port numbers that add more detail about how to communicate (think of company phone extensions). IP Addresses are represented as:

192.168.0.1
When a port number is needed, the address is specified as:

192.168.0.1:1234
where the IP Address is 192.168.0.1 and the port number is 1234. An IP Address acts as the identifier for a device or server, and can contain hundreds or thousands of ports, each used for a different communication purpose to that device or server.

When it comes to the wider Internet, effective communication begins when each device has a public IP address provided by an Internet Service Provider. But what about an address like http://www.google.com? How does your computer know what IP address it's mapped to? When we wish to connect to Google's main page, we do not type in the IP Address, we type in its URL.

## DNS

This mapping from URL to IP address is handled by the Domain Naming System or DNS. DNS is a distributed database which translates computer names like http://www.google.com to an IP address and maps the request to a remote server. Stated differently, it keeps track of URLs and their corresponding IP addresses on the Internet. So an address like http://www.google.com might be resolved to an IP address 197.251.230.45. By the way, you can also get to Google's main page by typing the IP address into your browser's address bar.

However, most people want to use a user-friendly address like http://www.google.com, instead of memorizing a number of digits. DNS databases are stored on computers called DNS servers. It is important to know that there is a very large world-wide network of hierarchically organized DNS servers, and no single DNS server contains the complete database. If a DNS server does not contain a requested domain name, the DNS server routes the request to another DNS server up the hierarchy. Eventually, the address will be found in the DNS database on a particular DNS server, and the corresponding IP address will be used to receive the request.

### Your typical interaction with the Internet starts with a web browser when you:

Enter an address like http://www.google.com into your web browser.
Your request is sent to your devices' network interface.
The request goes over the Internet where a search for http://www.google.com begins. Behind the scenes, http://www.google.com is simply a human-friendly name that represents an IP Address associated with a remote computer or a server.
The remote server accepts the request and sends a response over the Internet to your network interface which hands it to your browser.
Finally, the browser displays the response in the form of a web page.
The main thing you must understand is that when your browser issues a request, it's simply sending some text to an IP address. Because the client (web browser) and the server (recipient of the request) have an agreement, or protocol, in the form of HTTP, the server can take apart the request, understand its components and send a response back to the web browser. The web browser will then process the response strings into content that you can understand. Navigating to websites like Facebook, Google and Twitter means you've been using HTTP all along. The details were hidden, but your browser was issuing the requests and processing the responses automatically. The different parts of the Internet look something like:

## Internet

### Clients and Servers

The most common client is an application you interact with on a daily basis called a Web Browser. Examples of web browsers include Internet Explorer, Firefox, Safari and Chrome, including mobile versions. Web browsers are responsible for issuing HTTP requests and processing the HTTP response in a user-friendly manner onto your screen. Web browsers aren't the only clients around, as there are many tools and applications that can also issue HTTP requests.

The content you're requesting is located on a remote computer called a server. Servers are nothing more than machines or devices capable of handling inbound requests, and their job is to issue a response back. Often, the response they send back contains relevant data as specified in the request.

## Client Server

### Resources

Resource is a generic term for things you interact with on the Internet via a URL. This includes images, videos, web pages and other files. Resources are not limited to files and web pages. Resources can also be in the form of software that lets you trade stock or play a video game. There is no limit to the number of resources available on the Internet.

### Statelessness

A protocol is said to be stateless when it's designed in such a way that each request/response pair is completely independent of the previous one. It is important to be aware of HTTP as a stateless protocol and the impact it has on server resources and ease of use. In the context of HTTP, it means that the server does not need to hang on to information, or state, between requests. As a result, when a request breaks en route to the server, no part of the system has to do any cleanup. Both these reasons make HTTP a resilient protocol, as well as a difficult protocol for building stateful applications. Since HTTP, the protocol of the internet, is inherently stateless that means web developers have to work hard to simulate a stateful experience in web applications.

When you go to Facebook, for example, and log in, you expect to see the internal Facebook page. That was one complete request/response cycle. You then click on the picture -- another request/response cycle -- but you do not expect to be logged out after that action. If HTTP is stateless, how did the application maintain state and remember that you already input your username and password? In fact, if HTTP is stateless, how does Facebook even know this request came from you, and how does it differentiate data from you vs. any other user? There are tricks web developers and frameworks employ to make it seem like the application is stateful, but those tricks are beyond the scope of this book. The key concept to remember is that even though you may feel the application is stateful, underneath the hood, the web is built on HTTP, a stateless protocol. It's both what makes the web so resilient and distributed and hard to control, as well what makes it so difficult to secure and build on top of.

## Summary

This chapter covered an oversimplified interpretation of how the Internet works along with an explanation of a few key terms. You also learned about statelessness and how it impacts web applications. We'll take a closer look at what an address such as http://www.google.com is and what it's made up of in the next chapter.

