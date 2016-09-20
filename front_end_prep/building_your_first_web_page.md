## What are HTML and CSS

HTML -- HyperText Markup Langauge, gives content structure and meaning by defining that content as Eample: (headings, paragraphs, or images.)

CSS -- Cascading Style Sheets, is a presentation language created to style the appearance of content Eample: (fonts or colors)

These two langauges HTML and CSS are independent of one another and should remain that way. CSS should not be written inside of an HTML document and vice versa.

As a rule, HTML will always represent content, and CSS will always represent the appearance of that content.

## Understanding Common HTML Terms

### Elements

ELements are designators that define the structure and content of objects within a page. <h1> - <h6> differnt levels of header elements. paragraph <p> elements that the list goes on to include the <a>, <div>, <span>, <strong>, and <en> elemetns and many more

### Tags

The use of less-than (<) and greater-than (>) angle brackets surrounding an element creates what is known as a tag. Tags most commonly occur in pairs of opening and closing tags.

Opening tag -- <div>
closing tag -- </div>

Content that falls between the opening and closing tags is the content of that element.

### Attributes

Attributes are properties used to provide additional information about an element. The most common attributes include:

The id attribute, which identifies an element;

The class attribute, which classifies an element;

The src attribute, which specifies a source for embeddable content;

The href attribute, which provides a hyperlink reference toa linked resource.

Attributes are defined within the opening tag, after an element's name

example: <a href="http://jamesrguthrie.com/">James Guthrie</a>

## Setting up the HTML Document Structure

HTML documents are plain text documents saved with an .html file

All HTML documents have required structure that includes the following declaration and elements; <!DOCTYPE html>, <html>, <head>, and <body>.

the document type declaration, or <!DOCTYPE html> informs web browsers which version of HTML is being used and is placed at the very beginning of the HTML document.

the <html> element signifies the beginning of the document.

Inside the <html> element, the <head> element identifies the top of the document, including any metadata (accompanying information about the page.) Content inside the <head> element is not displayed on the web page itself, instead, it may include the document title (which is displayed on the title bar in the browser window), links to any external files, or any other beneficial metadata.

All visibl content within the web page will fall within the <body> element

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Hello World</title>
  </head>
  <body>
    <h1>Hello World</h1>
    <p>Thisi s a web page.</p>
  </body>
</html>
```

Not all elements consist of opening and closing tags. some elements simpy receive their content or behavior from attributes within a single tage.


Code Validation The W3C has built HTML and CSS code validators that help look for mistakes.

## Understanding Common CSS Terms

Common terms include selectors, properties, and values.

### Selectors

As elements are added to a web page, they may be styled using CSS. A selector designates exactly which element or elements within our HTML to target and apply styles (such as color, size, and position).

Selectors may include a combination of different qualifiers to select unique elements, all depending on how specific we wish to be.

Selectors generally target an attribute value, such as an id or class value, or target the type of element, such as <h1> or <p>

css selector on <p>

p {
  
}

### Properties

Once an element is selected, a property determines the styles that will be applied to that element. Property names fall after a selector, within the curly brackets.

There are numerous properties we can use, such as background, color, font-size, height, width, etc...

css select on <p> with properties

p {
  color: ...;
  font-size: ...;
}

### Values

Values can be identified as the text between the colon, and semicolon 

p {
  color: orange;
  font-size: 16px;
}

## Working with Selectors

### Type Selectors

Type selectors target elements by their element type. such as:

div {
  
}

p {
  
}

### class Selectors

Class selectors allow us to select an element based on the element's class attribute value. Class selectors are a little more specific than type selectors, as they select a particul group of elements rather tha ll elements of one type.

Within CSS, classes are denoted by a leading period followed by the class attribute value.

.awesome {
  
}

.title {
  
}

<h1 class="title">hello world</h1>
<p class="awesome">awesome</p>

### ID Selectors

ID selectors are eve more precise than class selectors, as they target only one unique element at a time. Just as class selectors use an elements class attribute value as the selector, ID selectors use an elemtn's id attribute vlaue as selector.

Within CSS, ID selectors are denoted by a leading has sign, # followed by the id attribute value.

#jamesguthrie {
  
}

<div id="jamesguthrie">...</div>

## Referencing CSS

Best way is to reference an external style sheet, which is referenced from within the <head> element of our HTML document.

## CSS Resets
















