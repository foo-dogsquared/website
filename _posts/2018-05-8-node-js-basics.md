---
layout: post
title: "Node.js: Basics"
date: 2018-05-08 21:47:24 +0800
author: foo-dogsquared
categories: node-js
tags: [node-js, programming-notes, javascript]
---
Ever since JavaScript boomed in popularity, so does its related technology as more people
create tools with JavaScript. Now, it does not only revolves around the browser as some kind of 
spice on the web page interaction but it also interacts with the
[server](https://nodejs.org/), [database](https://www.mongodb.com/), and [game](http://js13kgames.com/) [development](https://developer.mozilla.org/en-US/docs/Games) (well, it's still inside the browser but eh).

With JavaScript, we can also create [progressive web apps](https://developer.mozilla.org/en-US/docs/Web/Apps) that allows the app 
to interact as if it is a native app. Also with JavaScript, we can create web apps that function as [desktop apps](https://electronjs.org/) 
complete with similar features as that of a native program.

Alrighty then, onto the basic concepts around Node.js...

*I will refer Node.js as Node and even if so, they're interchangeable. <br>
Also reading this means that assuming you have basic familiarity*

<!-- Node.js logo -->
<img src="{{ '/assets/pictures/nodejs-logo.png' | relative_url }}" alt="Node.js logo" style="width:300px">
<p class="caption">Node.js Logo (as of 2018)</p>

## What is Node.js?
According to the [official Node.js website](https://nodejs.org/en/):
> Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. <br> Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. 

First, *a JavaScript runtime built on Chrome's V8 JavaScript engine*, a JavaScript runtime. 
[Here's a reliable answer what is a runtime environment](https://stackoverflow.com/a/3710234). 
Basically, a runtime environment has everything it needs to execute a program. 

Second, *uses an event-driven, non-blocking I/O model*. Event-driven? Non-blocking? A non-blocking 
event-loop that doesn't block I/O! More on that later.

With the appropriate tools, you can create a basic server that do those usual things and 
with the appropriate tasks and responses your program do, you can create a web app with the 
ability to store persisent data and use those persistent data the next time the program reboots.

### What does Node offer to the table?
Like things in life, Node also comes with certain advantages and disadvantages compared to other 
languages. To not further waste any time, we'll just go by bullet points:

#### Upsides:
- *One language across the stack* --- you may have heard of this but JavaScript is so expansive that you can build a web app with just one language with the MEAN (MongoDB, Express, Angular, Node.js) stack; because of this, words such as generalized developer or fullstack JavaScript have appeared; this also means that there is no need for learning more languages (mostly its syntax and mechanics) since with Node, it offers a complete set of tools for (web) app development
- *Huge package ecosystem* --- with a guided way of how we can manage our package with *npm*, we can use other people's code and reduce time easily; when we need a solution for a generic problem, most likely someone has created a more robust solution for it; with how one can easily setup Node and manage tools they can use, this is perhaps one of the biggest contributors of why JavaScript holds the title of the most popular language around for a few years
- *Simplifies writing server application*
- *Asynchronous I/O* --- one of Node's distinct features; basically, I/O process such as writing on a web server will not block the process of executing the code

#### Downside:
- *Harder to debug* --- its asynchronous nature makes it harder to debug and handle the errors
- *Not suitable for heavy CPU tasks* --- Node is not primarily built for that since it is single-threaded, it is mostly for building around web infrastructure and I/O processes

OK. Now that being said. Let's get right into the ---

## Concepts
Basically, Node is an extension of JavaScript in a way that deals mainly with <span class="word-definition" title="type of code that will be executed in an unknown time">asynchronous code</span>. Often this type of 
code deals with sending data, receiving data, and fetching resources. JavaScript does have ways to deal with those (especially 
nowadays with AJAX techniques and built-in code that deals with this exact type of work such as promises) but not often for a full 
time web app that really needs its data to be sent on a server or something(?). 

Anyways...

### Context
<!-- Concept #1: Context (Server) -->
The first concept that we should know is its context. "What does Node do?", "What system are we now interacting with this?", 
"What can we do with it?", stuff like that.

Well, that can mostly be answered with one word: servers.

We use Node to do server-sided programming, we interact with the server, and we can do some stuff that a server usually do: 
mostly the CRUD (Create, Read, Update, Delete) procedure. This usually means that we are away from the usual environment that 
the plain JavaScript is in which is the browser. 

Even though we can place Node on the same file where JavaScript is in, there are huge difference when we use it. One big 
difference is the globals. Since we are now away from the browser whenever we use Node, globals and APIs that are found in the 
browser such as `window` and `localStorage` are gone. In its stead, we are now interacting with a new 
set of globals: `__dirname`, `__filename`, `exports`, `modules`, and `require()`. Aside from those, we also now have the ability to interact with a file system to manipulate files, create a web server 
ourselves, and many more stuff. There is basically a lot of possibilities you can do now that you are standing on a server's 
level.

### Event Loop
<!-- Concept #2: Event Loop -->
Next concept: the *Event Loop*. <sup>*let's just hope I got this right*</sup>

"What is an event loop? How does it work?". To answer those questions, we need to know something about Node. Since Node is 
more or less an extension of JavaScript, it must deal with the same way how JavaScript does its execution: the event loop ([here is a reliable documentation of event loop in JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)).

If you understood how the process work in the given link, this will make it a whole lot easier to understand.
If else you didn't, here's a YouTube video that I saw from a Medium article (which is linked in the Re(Sources) below).

<iframe width="560" height="315" src="https://www.youtube.com/embed/8aGhZQkoFbQ?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

Now how does the event loop works on Node? (For a more detailed explanation of that, go [here](https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/#phases-in-detail))

By the time we use Node, that's when the event loop will be initialized and it will execute scripts that enables Node to call 
asynchronous APIs or set some timers. After the setup is complete, then it will begin to process the loop with the callbacks.
Those callbacks will enter several phases as described by the [official documentation on event loop](https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/). 
In each phase, Node will order those callbacks to be executed in a queue --- the first callback called will be the first to 
be executed and the first to be gotten out and the last callback called will be the last to be executed and the last to be gotten 
out (the First In, First Out (FIFO) principle). When the queue of callbacks is now done, then it will enter the next phase. And 
then continues and redo the executing-the-callbacks-in-a-queue cycle again. Of course, each phase has differences among how it 
handles the callbacks and what are the instructions to be set but generally, that's how the process goes.

Anyway, I might post a more detailed post about this once I understood it a little better. For now, those information are 
enough for a Node.js newcomer to take.

### Modules
<!-- Concept #3: Module -->
One of the concepts that we have to know about is **modules**.
Everything that we use in Node are called modules. Whether be it a built-in library, a third-party framework, a preprocessor, that 
is a module (at least that's what it said on the command line when executing something, anyway). Queue the meme...

<img src="{{ '/assets/pictures/oprah-module-meme.jpg' | relative_url }}" alt="A meme used in the wrong way, don't mind me here." style="width:400px;"><p class="caption">Cue the cringe...</p>

This, in concept, is quite similar to how we import modules in other languages, say in Python:

```python
    import os

    print(os.path.join(os.getcwd(), 'foo.txt'))
```
<p class="caption">module-import.py</p>

We imported a module named `os` to access its properties/methods that is available from that module.

In Node, the syntax is different but it has the same concept:

```js
    const path = require('path');

    console.log(path.join(__dirname, 'foo.txt'));
```
<p class="caption">module-import.js</p>

We imported a module name `path` to access its properties/methods that is available from that module and did some 
code that is functionally similar to the example given in Python.

Either way, you get the concept. We are using code from outside through some kind of a bridge that connects between those two 
files. The file we are connecting to is the module and in Node, we do that by announcing it with `require(name-of-module)` to access its properties and methods. Done.

### Modularity
<!-- Concept #4: Modularity -->
Also, take a look at the word **modules**. What other word(s) can we derive from it? *Modularity*! *Modularization*! [*Modular programming*](https://en.wikipedia.org/wiki/Modular_programming)?!

> Modularity is the degree to which a system's components may be separated and recombined.

Well, that's according to Wikipedia.

Maybe this should be the first thing to be talked about when it comes to modules, but that implies 
that we can separate those code somewhere else. The degree of modularity is also where one of Node's 
powerful features will shine.

How do we do that?

Let's demonstrate that with an application of it. First, let's just create some files:

<!-- First file -->
```js
// the module
console.log('Module demonstration');

const basicMath = {
    sum: (a, b) => a + b,
    difference: (x, y) => x - y,
    product: (multiplicand, multiplier) => multiplicand * multiplier,
    quotient: (dividend, divisor) => dividend / divisor,
    floorDivision: (dividend, divisor) => Math.floor(dividend / divisor),
    power: (base, exponent) => base ** exponent 
}

module.exports = basicMath;
```
<p class="caption">basicMath.js</p>

<!-- Second file -->
```js
const basicMath = require('./basicMath.js');

console.log(basicMath.power(2, 5), 
            basicMath.product(34, 6), 
            basicMath.quotient(4, 5), 
            basicMath.floorDivision(10, 3)
        ); // 32 204 0.8 3
```
<p class="caption">demo.js</p>

OK! Now we get to create our own modules! If you run it with `node ./demo.js` on your console, you'll see
two lines that will pop up: `Module demonstration` and whatever the results those properties you logged in 
<code class="fileName">demo.js</code>.

In the last line of the same file, as you might have guessed, this exports the object to be used 
whenever the file was required by another file.

This is the function of `module.exports`, it is one of the globals of Node that sets that an object (or a function) 
to be used by another file that required the module. In this case, `module.exports` sets the object 
`basicMath` that contains a bunch of properties to be used as part of another file. 

While on the subject of `module.exports`, `require()` is a function that accepts one parameter 
that could be any of the following: 

<div class="table" markdown="1">

| Parameters | Usage Example
| --- |
| A native module | `require('http')`
| A third-party module installed through *npm* | `require('express')`
| A path to a `.js` or `.json` file | `require('./path/to/your/module.js')`
| A path to a directory with a `.js` of the same name of the directory (or <code class="fileName">index.js</code> if none) | `require('./path/to/your/folder')`

</div>

This doesn't mean that the module that we imported only gave the object. In the second file, we used the `require()` to 
access <code class="fileName">basicMath.js</code> and we see in the console logs that we also saw something that we did not 
intended to call which is the first log that says `Module demonstration`. This came from the first line of the first 
file. So we can say that when we require a file, it will also go through the entire file --- BUT those code that are not included 
in `module.exports` in any way will only go through it once.

To prove this, let's modify our <code class="fileName">demo.js</code> a little bit, let's add another call into the same file:
```js
const basicMath = require('./basicMath.js');

console.log(basicMath.power(2, 5), 
            basicMath.product(34, 6), 
            basicMath.quotient(4, 5),
            basicMath.floorDivision(10, 3)
        ); // 32 204 0.8 3

const basicMath2 = require('./basicMath.js');

console.log(basicMath2.sum(10, 45)); // 55
```
<p class="caption">demo.js (again)</p>

And you will see... that the console log from the file that we required only happened once.

The big question that you might ask (if you are a fellow newb) is "What is this sorcery?"; the simplest explanation is 
Node is caching the modules, which means once Node got a hold of that module, it will stay and save or cache that module.

### NPM
*npm* is a package manager that comes with Node, that's what suppose to be anyway, a *Node Package Manager*. In it, you are 
able to install a ton of tools to be utilized by your app whether it is a module that helps you ease the process of creating 
functions around that particular feature, a framework that builds a scaffolding for your next project, and many more stuff.
With *npm*, it helps you find, install, and integrate those packages easily into your app. 

Here's a rundown for using *npm* (make sure the command line's current directory is in the directory of your app):

<div class="table" markdown="1">

| `npm init` | it will create <code class="fileName">package.json</code> that (somewhat) acts as a configuration file for *npm*
| `npm install name-of-module` | it will install `name-of-module` as a local package
| `npm install -g name-of-module` | it will install the module *globally*; this is mostly recommended for modules that has a command-line interface like `ember-cli` or `express-generator`
| `npm install -g npm` | this is how you would upgrade *npm*

</div>

As mentioned before, all of the modules that installed through *npm* can be used in the app by the same way by `require()`.

I would probably make a more detailed post on this one once I use it a little more often. *::sweats::*

-------

Well, that's all you (or rather, me) need to know about Node. It is a tool that can help you immensely in the world of 
web development. Because of its foundation based on JavaScript, it helped developing with JavaScript much more than 
what people could expect when working with JavaScript years ago.

## (Re)Sources:
- [Mozilla's Documentation on JavaScript Event Loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)
- [Node.js Event Loop](https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/) --- official documentation on Node.js event loop and usually, the documentation is easier to understand
- [Node.js Introduction Course on edX](https://courses.edx.org/courses/course-v1:Microsoft+DEV283x+1T2018/course/)
- [Node.js Notes For Professionals](http://book.goalkicker.com/NodeJSBook)
- [What exactly is Node.js? - Medium](https://medium.freecodecamp.org/what-exactly-is-node-js-ae36e97449f5) --- if you want a deeper (and more correct, reliable, and accurate) understanding of what is Node.js

<br>
*(P.S. First informative post like this and I screwed it up by writing long walls of text for small amount of info. I have **lots** of ways to go)*