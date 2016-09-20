# How the Web Works: A Primer for Newcomers to Web Development (or anyone, really)

Client: An application such as Chrome or Firefox, that runs on a computer and is connected to the inernet. Primary function is to take user interactions and translate them into requesnts to another computer called a web server. Every client computer has a unique address called an IP address that other computers can use to identify it.

Server: A machine that is connected to the internet and also has an IP address. A server waits for requests from other machines (e.g. a client) and responds to them. Servers have special sofware that tells them how to handle incoming requests from other machines. The primary function of a web server is to store, process and deliver web pages to clients. There are different types of servers, including web servers, database servers, file servers, application servers, and more.

IP address: Internet Protocol Address. A numerical identifier for a device (compuer, server, printer, router, etc.) on a TCP/IP network. Every computer on the internet has an IP address that it uses to identify and communicate with other computers. IP addresses have four sets of numbers separated by decimal points (244.155.65.2) This is called the "logical address". In order to locate a device in the network, the logical IP address is converted to a physical address by the TCP/IP protocol software. This physical address (MAC address) is built into your hardware.

ISP: Internet Service Provider. ISP is the middle man between the client and servers. For the typical homeowner, the ISP is usually a "cable company". When your browser gets a request from you to go to www.github.com, it doesnt know what to llok for www.github.com. So it's the ISP's job to do a DNS (Domain Name System) lookup to ask what IP address the site you're trying to visit is configured to.

DNS: Domain Name System. A distributed database which keeps track of computer's domain names and their corresponding IP addresses on the Internet. DNS exists so users can enter www.github.com instead of an IP address.

Domain Name: Used to identify one or more IP addresses. Users use the domain name (www.github.com) to get to a website on the internet. When you use a domain name in your browser, the DNS uses it to look up the corresponding IP address for the given website.

TCP/IP: Transmission Control Protocl/Internet Protocl. The most widely used communications protocl. A "protocl" is simply a standard set of rules for soing something. TCP/IP a=is used as a standard for transmitting data over networks.

Port Number: A 16-bit integer that identifies a specific port on a server and is always associated with an IP address. It serves as a way to identify a specific process on a server that network requests could be forwarded to.

Host: A computer connected to a network-- it can be a client, server or any other type of device. Each host has a unique IP address. A host could be a web server that serves the pages for the website.

HTTP: Hyper-text Transfer Protocol. The protocl that web browsers and web servers use to communicate with each other over the internet.

URL: Uniform Resource Locators. URLs identify a particular web resource. a simple example is https://github.com/someone. The URL specifies the protocl ("https"), host name (github.com) and file name (someone's profile page). A user can obtained the web resource identified by this URL via HTTP from a network host whose domain name is github.com

## The Journey from code to webpage

### Part 1

You type a URL into your browser

https://github.com

### Part 2

The browser parses the information conatined in the URL.

protocol ("https")
domain name ("github.com")
resource ("/") no resource after domain name. So browser knowns to go to the main (index) page

### Part 3

The browser communicates with your ISP to do a DNS lookup of the IP address for the web server that hosts www.github.com. DNS contacts Root Name Server, which replies with the IP address for a name server for the ".com" top-level domain. This address is sent back to your DNS service. Which then contacts the ".com" name server and asks for the address

### Part 4

Once the ISP receives the IP address of the destination server, it sends it to your web browser.

### Part 5

Your browser takes the IP address and the given port number from the URL (HTTP protocl defaults to port 80 and HTTPS defaults to port 443) and opens a TCP socket connection. At this point your browser and web server are finally connected.

### Part 6

Your web browser sents an HTTP request to the web server for the main HTML web page

### Part 7

The web server receives the request and looks for that HTML page. If it exists, the web server prepares the response and sends it back to your browser. If it can't find the requested page, it will send an HTTP 404 error message, which stands for "Page Not Found".

### Part 8

Your web browser takes the HTML page it receives and then parses through it doing a full head to toe scan looking for other assets that are listed, such as images, CSS files, JavaScript files, etc..

### Part 9

For each asset listed, the browser repeats the entire process above, making additional HTTP request to the server for each resource.

### Part 10

Once the browser has finished loading all other assets that were listed in the HTML page, the page will finally be loaded in the browser window and the connection will be closed.

## Crossing the Internet Abyss

When information is transmitted during a request the information is broken up into many tiny chunks called packets. Each packet is tagged with a TCP header, which include the source and destination port numbers, and an IP header which includes the source and destination IP address to give it its idenityt. Packets can take any route and as many hops as it needs to get to the final destination.

So how do all the packets know how to get to their destination without getting lost? 

The answer is TCP/IP

IP: Internet Protocol -- its job is to send and route packets to other computers using the IP headers (the IP addresses) on each packet.

TCP: Transmission Control Protocl is responsible for breaking the message or file into smaller packets, routing packets to the correct application on the destination computer using the TCP headers, resending the packets if they get lost on the way, and reassembling the packets in the correct order once they've reached the other end.

## Painting the Final Picture

Browsers have a rendering engine that receives the content of the resources in small chunks. Then using an HTML parsing algorithm the browser is told hot to parse the resources.

Once parsed, it generates a tree structure of the DOM elements. DOM stands for Document Object Model and it is a convention for how to represent objects locating in an HTML documents. 

These objects or "nodes" of every document can be manipulated using scripting languages like JavaScript.

Once the DOM tree is build, the stylesheets are parsed to understand how to style each node. Using this information, the browser traverses down DOM nodes and calculates the CSS style, position, coordinates, etc for each node.

The the browser paints the page to your screen accordingly.
