Security

As we've repeatedly stated throughout this book, the same attributes that make HTTP so difficult to control, also make it so difficult to secure. Now that you know about how web applications dance their way around the statelessness of HTTP, you can probably guess that there are some security ramifications lurking around the corner. For example, what if someone steals my browser's session id, does that mean they can log in as me? Or what if I'm accessing a random website, can they peek into my Reddit or Facebook cookie, where my session id information for those sites are stored? We'll spend this chapter discussing some common security issues that creep up with HTTP. This is by no means an exhaustive list of security issues; just common ones that any web developer would be expected to know.

Secure HTTP (HTTPS)

As the client and server send requests and responses to each other, all information in both requests and responses are being sent as strings. If a malicious hacker was attached to the same network, they could employ packet sniffing techniques to read the messages being sent back and forth. As we learned previously, requests can contain the session id, which uniquely identifies you to the server, so if someone else copied this session id, they could craft a request to the server and pose as your client, and thereby automatically being logged in without even having access to your username or password.

This is where Secure HTTP, or HTTPS, helps. A resource that's accessed by HTTPS will start with https:// instead of http://, and usually be displayed with a lock icon in most browsers:



With HTTPS every request/response is encrypted before being transported on the network. This means if a malicious hacker sniffed out the HTTP traffic, the information would be encrypted and useless.

HTTPS sends messages through a cryptographic protocol called TLS for encryption. Earlier versions of HTTPS used SSLor Secure Sockets Layer until TLS was developed. These cryptographic protocols use certificates to communicate with remote servers and exchange security keys before data encryption happens. You can inspect these certificates by clicking on the padlock icon that appears before the https://:



Although most modern browsers do some high level check on a website's certificate on your behalf, viewing the certificate sometimes serves as an extra security step before interacting with the website.

Same-origin policy

The same-origin policy is an important concept that permits resources originating from the same site to access each other with no restrictions, but prevents access to documents/resources on different sites. Stated differently, it prevents scripts from one site from manipulating documents from another site. Documents in the same origin must have the same protocol, hostname and port number. For example, the HTML document at http://www.test.com/aboutus.html can embed the contents of the JavaScript file at http://www.test.com/fancy.js because they share the same origin, have the same protocol, hostname and port number (the default port 80). Conversely, it also means documents at http://www.test.com cannot embed documents hosted on http://www.example.com because they do not share the same origin.

The same origin policy pertains to accessing the contents of files, and not linking. You are always free to link to any URL.
While secure, this is also very cumbersome for web developers who have legitimate needs for cross domain content access, so Cross-origin resource sharing or CORS was developed. CORS is a mechanism that allows resources from one domain to be requested from another domain, bypassing the same-origin policy. CORS works by adding new HTTP headers, which allow servers to serve resources to permitted origin domains.

The same-origin policy is an important guard against session hijacking (see next section) attacks and serves as a cornerstone of web application security. Let's look at some HTTP security threats and their counter-measures.

Session Hijacking

We've already seen that the session plays an important role in keeping HTTP stateless. We also know that a session id serves as that unique token used to identify each session. Usually, the session id is implemented as a random string and comes in the form of a cookie stored on the computer. With the session id in place on the client side now every time a request is sent to the server, this data is added and used to identify the session. In fact, this is what many web applications with authentication systems do. When a user's username and password match, the session id is stored on their browser so that on the next request they won't have to re-authenticate.

Unfortunately, if an attacker gets a hold of the session id, both the attacker and the user now share the same session and both can access the web application. In session hijacking, the user won't even know an attacker is accessing his or her session without ever even knowing the username or password.

Countermeasures for Session Hijacking

One popular way of solving session hijacking is by resetting sessions. With authentication systems, this means a successful login must render an old session id invalid and create a new one. With this in place, on the next request, the victim will be required to authenticate. At this point, the altered session id will change, and the attacker will not be able to have access. Most websites implement this technique by making sure users authenticate when entering any potentially sensitive area, such as charging a credit card or deleting the account.

Another useful solution is by setting an expiration time on sessions. Sessions that do not expire give an attacker an infinite amount of time to pose as the real user. Expiring sessions after, say 30 minutes, gives the attacker a far narrower window to access the app.

Finally, as we have already covered, another approach is to use HTTPS across the entire app to minimize the chance that an attacker can get to the session id.

Cross-Site Scripting (XSS)

The final security concern we'll talk about, and a very important one for all web developers, is called Cross-site scripting, or XSS. This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly.

For example, the form below allows you to add comments, which will then be displayed on the site.

Comment form

Because it's just a normal HTML <textarea>, users are free to input anything into the form. This means users can add raw HTML and JavaScript into the text area and submit it to the server as well:

Comment form

If the server side code doesn't do any sanitization of input, the user input will be injected into the page contents, and the browser will interpret the HTML and JavaScript and execute it. In this case an alert message will pop up, which is definitely not the desired outcome. Attackers can craft ingeniously malicious HTML and JavaScript and be very destructive to both the server as well as future visitors of this page. For example, an attacker can use JavaScript to grab the session id of every future visitor of this site and then come back and assume their identity. It could happen silently without the victims ever knowing about it. Note that the malicious code would bypass the same-origin policy because the code lives on the site.

Potential solutions for cross-site scripting

One way to prevent this kind of attack is by making sure to always sanitize user input. Eliminate problematic input, such as <script> tags, or disallowing HTML and JavaScript input altogether in favor of a safer format, like Markdown.

The second way to guard against XSS is to escape all user input data when displaying it. If you do need to allow users to input HTML and JavaScript, then when you print it out, make sure to escape it so that the browser does not interpret it as code.

Summary

In this section, we covered various aspects of security in web applications. Needless to say, this is a huge topic, and we've only scratched the surface of a few common issues. The point of this chapter is to reveal how fragile and problematic developing and securing a web application is, and it's mostly due to working with HTTP.