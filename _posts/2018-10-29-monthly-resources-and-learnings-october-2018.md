---
layout: post
title: "Monthly Resources and Learnings (October 2018)"
date: 2018-10-29 17:36:52 +0800
author: foo-dogsquared
categories: self-learning
tags: [programming-notes, monthly-learnings, learning]
---

Ah, yes, October - the month of spoops. Sorry I've got no tricks but I do have treats for those who visit this page today, yesterday, and... pretty much this one doesn't go away. Riiiiight?

## What I've learned
### World outside of Arduino (AKA More electronics stuff)
The first tool I have been introduced into developing hardware projects through integrating software is none other than Arduino, everybody's favorite microcontroller (may differ to other people) or something. I noted, however, that a lot of my hardware projects are just small in scale and realized that the Arduino is a bit of overkill. 

Because of it, I've decided to expand my overview on electronics with non-Arduino microcontrollers. Due to my limited budget, I've only a few options. Fortunately, I found the [ATtiny85](https://www.microchip.com/wwwproducts/en/ATtiny85) and the [ATMEGA328P](https://www.microchip.com/wwwproducts/en/ATMEGA328P) which is both a cheap and a solid option for a beginner. Now, all I need is a [programmer](https://en.wikipedia.org/wiki/Programmer_(hardware)) that can convert code into electrical signals to be used on the microprocessor (or I think that's what it does). As for the IDE, I've found a few options which are [PlatformIO IDE](https://platformio.org/) and the [MPLab X IDE from Microchip](http://www.microchip.com/mplab/mplab-x-ide). I don't know where to start yet with the materials but I do have some reference materials such as this [page from the Build Electronic Circuits](https://www.build-electronic-circuits.com/microcontroller-programming/).

### Node.js, HTTP, and APIs (but mostly about HTTP and APIs)
I wrote a couple of stuff about Node long ago (in May 2018) but I did not eventually used it only because of lack of ideas and I have difficulty all of the stuff at the time but things have changed, I'm more familiar to JavaScript and basic programming concepts now and after I've made my [first VueJS app](http://foo-dogsquared.github.io/), I thought why not give Node another shot. For the longest time, I've used JavaScript as my go-to language simply because it lives on the browser which is something that we all use everyday nowadays. 

So I've looked up on the official documentation and my go-to MOOC sites like edX to look for a Node course and eventually I got it easier to fill up the information this time. For the longest time, the thing that I did not understand is with the HTTP which is simply an application-layer protocol that most web pages tend to use to transfer information between two points.

Understanding Node requires you to understand a bit more about HTTP and how computers communicate wirelessly. Let's take a shallow dive on exploring of these concepts.

#### HTTP
HTTP, as I said before, is an application-layer protocol. Simply think of those as a technical specification of some sorts of how things should work in a communications system. HTTP was originally developed for web browsers and web servers but it can used for things outside of the usual internet web. 

Furthermore, HTTP is a stateless protocol, meaning none of the data will be saved and another request to the same type will result in the same response. There are some workaround on this such as using cookies or caching documents and other needed data among many others.

In a communication context that uses HTTP, we know that the machine that sends out data is called the *client* while the machine that listen to the requests and responds with the appropriate data is the *server*.

![HTTP with the client-server model]({{ 'assets/pictures/self-learning-series/october-2018/http-client-server-model.svg' | relative_url}})
*HTTP with the client-server model*{: .caption}

OK. So we know that the communication process between two machines starts with the client requesting something. From the client, it sends out an *HTTP request* which consist of the headers and the body.

The headers contain data about the client (so the server can correctly configure the appropriate data to be sent out) and the type of the request itself.

The body, on the other hand, contains the appropriate data needed for the server to figure out the data they will send to the client.

Think of the request as the old-fashioned snail mail envelope. The headers is in the outside of the envelope, containing the address of the server where the request is to be sent, the address of the client where the response is to be sent back, and the other headers that the server may parse through - sort of like a secret keyword between two people. The body is obviously the letter that is inside of the envelope, containing the message (data) for the server to read and figure out which of the data is appropriate to be sent regarding the request. 

![HTTP as an envelope]({{ 'assets/pictures/self-learning-series/october-2018/http-as-envelope.svg' | relative_url }})

Now what does those have to do with Node? Of course, everything really! Node is a JavaScript runtime environment that specializes in running servers. It simply means that you can program the back-end stuff with JavaScript: the syntax, the concepts, and other stuffs. 

Of course, the main difference between the JavaScript in the browser is that you don't have the browser globals and APIs like `Window`, `Document`, `WebAssembly`, and all of those stuff that first appeared when you type a letter in the web browser's JavaScript console.

Node's API lets you create the actions that your server will initiate every time it receives a particular data or request. Let's say that you want to return a JSON with dogs-related data everytime the server receives a GET request in a particular API endpoint. OK, let's talk about APIs now.

#### APIs
APIs, stands for *Application Programming Interface*, is simply a way for the developer to use a function of another machine (the server) without fully understanding its containing code. Using an API is not only for convenience but also for security. This is what programs use to communicate between other programs without exposing much of their own data.

The term "API" can be used in most context like with a library, frameworks, pre-configured toolkit/bundles, operating systems, and last but not least (in fact, it is the most), web-based services/systems.

In a web-based service, APIs are usually initiated with HTTP requests. When you've used an web-based API before, you'll most likely have encountered the word 'endpoint'. An API endpoint is simply the end channel in the communication context. 

In most RESTful API documentation, you would see the endpoints look like this:

```
GET /dogs/DOG_NAME/

GET /cats/:name
```

URI with different methods represent different endpoints. This means that these two are different endpoints:

```
GET /cats/:name

POST /cats/:name
```

With those different endpoint, you can do different things. Either you can create data, read available data, update an existing data, or delete necessary information (or the *CRUD* operation).

#### Most of web is an API
Now let's leverage the idea of API with the whole web. As it turns out, using the web is also an existing form of APIs. Similar to the ideas of using/retrieving data, we already use a form of API through URLs.

If you want a more interactive way of answering the question "How does using the web is a form of API?", let's take out our command prompt with `cURL` installed. 

As ~~ripped off~~ said from the Wikipedia page, [`cURL`](https://en.wikipedia.org/wiki/CURL) is a software utilized for transferring data through different protocols. Getting from context clues, I think you already know what is it about.

Like I've previously mentioned, accessing to a webpage whether through browser, library, or anything is already a form of using web-based API. We could see it ourselves using `cURL`.

Assuming with `cURL` already installed in your shell, run this command in the shell prompt:

```bash
curl -H "test_header: #1" -v https://foo-dogsquared.github.io #hehehe
```

What this command essentially means is that we run the `curl` program to send a request to the `index.html` stored in my website with the additional header of `test_header` with `#1` as the value. The custom header is there so we can easily see our request.  The `-v` flag simply means to show a verbose output, describing anything that is happening from the retrieval and this is what enables us to see our sent request.

From there, you might see the response's header that is that similarly looks like this:

```http
HTTP/1.1 200 OK
Server: GitHub.com
Content-Type: text/html; charset=utf-8
Strict-Transport-Security: max-age=31556952
Last-Modified: Sat, 27 Oct 2018 11:09:12 GMT
ETag: "5bd44758-bb5"
Access-Control-Allow-Origin: *
Expires: Sun, 28 Oct 2018 09:13:26 GMT
Cache-Control: max-age=600
X-GitHub-Request-Id: 2AC0:4AC9:1C274F0:26811A2:5BD57B5D
Content-Length: 2997
Accept-Ranges: bytes
Date: Sun, 28 Oct 2018 09:47:58 GMT
Via: 1.1 varnish
Age: 114
Connection: keep-alive
X-Served-By: cache-pao17420-PAO
X-Cache: HIT
X-Cache-Hits: 1
X-Timer: S1540720078.138096,VS0,VE0
Vary: Accept-Encoding
X-Fastly-Request-ID: db0f3203133d0d6fdf54831f20fdce17359efa41
```

Along with the header of the response also comes with the body which is simply the HTML source code of the page.

The most important thing to look at here is the HTTP status code located at the response headers. From there, we can see the HTTP version used same with the status code and its message. HTTP response status code between 200 to 299 generally means the request has been successfully responded but I would suggest checking out [other references](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) just in case. 

Above the response is the processes that happened before we got our response and the request that has been sent. Remember the custom header that you put in? Great! Look for that and you'll find the request that `curl` (or any similar program you've used for this one) sent to the server. For the server that the request got sent to, the custom header that we put in generally mean nothing (unless you've hit an endpoint by accident or something) and get ignored.

```http
GET / HTTP/1.1
Host: foo-dogsquared.github.io
User-Agent: curl/7.55.1
Accept: */*
test_header: #1
```

You'll see that the request's format is quite similar, containing key-value pairs and what not.

At the first line, we have the request method and the HTTP version. 

The second line, the one with the `Host` header, is an intuitive one, the location of the data that we want to retrieve. 

The third line, with the `User-Agent` header, I'm pretty sure you can get its meaning from context clues but basically it is the data about the client itself. Remember the envelope analogy previously mentioned from several paragraphs ago? It is used as a basis for the server to respond with the appropriate data. Some more applications on the `User-Agent` part is detecting what OS does the user have or what device does the user have at the time of request. It is how some websites send a mobile version of their website when their server detects that the user, ahem, uses a mobile phone.

The `Accept` header is basically what type of content files does the client needs. In this case, we just defaults to anything, meaning any detected files will do. You can refer [here](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) for more information.

And the line with the `test_header`... Uh... I already said what was that for...

### Set theory
Yeah, let's properly define what a set is, mathematically, to the best of my ability. **A set is a well-defined collection of objects/elements. Well-defined, meaning, that we can determine whether an element belongs in a set or not.**

We define set all around us, whether be it in real life or in mathematical thinking mode. Most of us organize objects according to a criteria. If we were to organize books, most of us would probably define the set according to alphabetical order or according to subject.

In order to make it easier to know what a set is, we usually assign a variable to name it. Let's say a set of books $B$, a set of letters $L$ or a set of numbers $N$.

Formally speaking, we can define and notate a set in different ways.
- *verbal* — using sentences to describe the elements in a set
- *roster form* — listing each elements once inside of a brace ('{}') notation
- *set-builder notation* — a combination of the two, only that we are using a variable as a placeholder for that member

An example would make it easier to comprehend. Let's define a set with letters of the English alphabet that composed of vowels.

Here's how we would define a set $S$ verbally: let $S$ be the set of vowels in the English alphabet.

...in roster form: $S =\\{$ **a, e, i, o, u**{: .mathjax-text} $\\}$,

...and, in set-builder notation: $S = \\{x\ \|\ x$ **is a vowel**{: .mathjax-text} $\\}$.

If we would to read sets in set-builder notation, we could read (of what was denoted in the above example) as: *the set of all $x$ such that $x$ is a vowel*.

![Reading a set in set-builder notation]({{ 'assets/pictures/self-learning-series/october-2018/set-builder-notation-example-read.svg' | relative_url }})
*How to read the expression*{: .caption}

Of course, each way of denoting sets have its pros and cons. With verbal form, we have a free way on how we could describe the elements on our set but given with the precise nature of mathematics, it needs to be accurate and stick to the usual indicators to be used in our sentences. In roster form needing to list every elements in the set, it depends on the size of the set. Lastly, with the set-builder notation, it gives us what I think the most flexible option but in some cases like a smaller set, it is better and more concise to describe the set in roster method.

Since the set-builder notation is probably the most common form of describing a set so we'll mostly focus on discussing sets with this notation.

#### Common number sets
On mathematical description of sets, there are some set of numbers are often used so much that they have a symbol to represent them:
- *empty set* $(\mathbb{\emptyset})$ — equivalent to $\\{\\}$ or $\\{\text{$x$ \| $x \neq x$}\\}$
- *natural numbers* $(\mathbb{N})$ — includes only from 1 to positive infinity with an interval of 1 so **{1, 2, 3, 4, 5, ...}**{: .mathjax-text}
- *whole numbers* $(\mathbb{W})$ — includes zero and the whole set of natural numbers so **{0, 1, 2, 3, 4, 5, ... }**{: .mathjax-text} or to put it in another way, $\\{\text{$x\ \|$ $x = 0$}$ **or a part of**{: .mathjax-text} $\mathbb{N}\\}$
- *integers* $(\mathbb{Z})$ — includes the whole numbers with their inverse values (except for 0) so it can be described as **{..., -3, -2, -1, 0, 1, 2, 3, ...}**{: .mathjax-text}
- *rational numbers* $(\mathbb{Q})$ — to put it simply, rational numbers are basically numbers that can be exactly represented as a simple *ratio* between two integers $\frac{a}{b} \text{ as long as $b \neq 0$}$; in roster form, it can be represented either as $\\{\text{$\frac{a}{b}$ \| $a \in \mathbb{Z}$}$ **and**{: .mathjax-text} $\text{($b \neq 0$ and $b \in \mathbb{Z}$)}\\}$ or $\\{\text{$x$ \| $x$}$ **has a terminating or non-repeating decimal representation**{: .mathjax-text} $\\}$ (by the way, if you're curious why rational numbers are denoted with $(\mathbb{Q})$, it's because it came from an Italian word, *quoziente*, meaning "quotient")
- *irrational numbers* $(\text{$\mathbb{P}$ or $\mathbb{I}$ or $\mathbb{R} \setminus \mathbb{Q}$})$ — on the other hand, irrational numbers are simply numbers that cannot be exactly defined using simple ratios thus their decimal point representation may be non-terminating and non-repeating; in roster form, it is $\\{\text{$x$ \| $x$}$ **is a non-rational number**{: .mathjax-text} $\\}$  
- *real numbers* $(\mathbb{R})$ — generally, any number that can be represented with decimal places so we can go with $\\{\text{$x$ \| $x$}$ **has a decimal representation**{: .mathjax-text} $\\}$

#### Set equality
**Like numbers, sets can be compared to each other to conclude that they are equal and we do that by comparing their members to see if both sets have them and checking if both of them have the same number of elements.**

Say, that we have two sets:

$A$ **is the set whose members is the first five positive even integers**{: .mathjax-text}

...and...

$\text{$B$ = \{10, 6, 4, 8, 2\}}$

Both sets have 2, both sets have 4, boat sets have 6, both sets have 8, and finally, both sets have 10. The two sets are also a set composed of 5 elements so with the basic conditions passed, we can say that the sets $A$ and $B$ are equal. Denoting that they're both equal is as simple as equating them with an equal sign, similar to how we would write equations.

$$ A = B $$

#### Set combinations
We can also combine sets. There are two main ways on combining sets: *intersection* and *union*.

![Visualization of set combinations on a Venn diagram]({{ 'assets/pictures/self-learning-series/october-2018/set-combo-venn-ex.svg' | relative_url }})
*Visualization of set combinations on a Venn diagram*{: .caption}

**The intersection of the sets refers to the overlap between the members of the sets. It can be denoted by $S \cap E$, referring to the elements that overlap in all sets.** 

$$ A \cap B $$

If we have two sets say $C=$ **{4, 3, 10, 9, 11, 23, 1}**{: .mathjax-text} and $D=$ **{3, 6, 9, 12, 15}**{: .mathjax-text}, we would say that the intersection of sets $C$ and $D$, $C \cap D$, is **{3, 9}**{: .mathjax-text}.

<!-- PICTODO: visualization of set intersections -->
![Visualization of set intersections on a Venn diagram]({{ 'assets/pictures/self-learning-series/october-2018/intersection-venn-ex.svg' | relative_url }})
*Visualization of set intersections on a Venn diagram*{: .caption}

**Meanwhile, a union refers to the totality of all sets. Usually denoted with $S \cup E$, referring to all elements included in the sets.**

$$ A \cup B $$

From the example that was given a few sentences earlier, the union of sets $C$ and $D$ will be **{1, 3, 4, 6, 9, 10, 11, 12, 15, 23}**{: .mathjax-text}.

![Visualization of set unions on a Venn diagram]({{ 'assets/pictures/self-learning-series/october-2018/union-venn-ex.svg' | relative_url }})
*Visualization of set unions on a Venn diagram*{: .caption}

There are more than this than sets, it is just the start of journey into reviewing pre-calculus stuff again so I'll just refer to a book which will be in the next section. 🙂

## What I've been reading
<!-- Books, articles, and other textual references -->
### [Precalculus, 3rd Edition (*Stitz & Zeager*)](http://www.stitz-zeager.com/szprecalculus07042013.pdf)
This is an open source mathematics book by Stitz & Zeager, who offer additional free and open source pre-calculus books from [their website](http://www.stitz-zeager.com/). I've gotta say that it is a decent pre-calculus book, so far. Like what you would expect from a textbook, this book offers exercise for you to make sure you've made solid progress and getting to master the concepts that are later needed for more complex topics. It also has answers for those exercise so you can make sure that you have a reference in some way although I recommend to have more (but not too many) ways of checking your answers like using a tool like [Symbolab](https://www.symbolab.com/).

### [The Real Difference Between a Rich Mindset vs. a Poor Mindset](https://www.listenmoneymatters.com/rich-vs-poor-mindset/)
An article from the [Listen Money Matters](https://www.listenmoneymatters.com/) community. This shows the difference of being rich and poor not only material-wise but mostly mindset-wise. It is said that our thinking and our self-perception when it comes to everything. Kind of common sense thing, but here's an article that'll explain how both mindset does and what effects it can have. 

### [Structure and Interpretation of Computer Programs, 2e (HTML version)](https://sarabander.github.io/sicp/)
This is a book that was converted into HTML by [sarabander](https://github.com/sarabander). From here, it's like taking this book anywhere as long as you have internet access. This book introduces you to how computer programs are usually created from the perspective of a computer scientist using proven structured and algorithmic problem solving.

### [Apprenticeship Patterns (*D. Hoover & A. Oshineye*)](https://www.oreilly.com/library/view/apprenticeship-patterns/9780596806842/)
Authored by Dave Hoover and Adewale Oshineye, what you'll find in this book is the authors' experience and wisdom gathered from different people of varying diversity from different places, to different level of expertise, even to different arts. Mainly, this is a book about going to the software industry with an apprentice's mindset, appreciating your first time going into code, the journey that you'll be going through, and the approaches when it comes to learning about the more noble concepts and stuff. 

## What I've been listening to
<!-- Audiobooks, podcast episodes, videos and other auditory references -->
### [Asking For Help and Speaking Up from the *Soft Skills Engineering*](https://softskills.audio/2018/07/30/episode-118-asking-for-help-and-speaking-up/)
An episode from [Soft Skill Engineering](https://softskills.audio), a podcast series that focuses on the non-technical side of the software programming industry hosted by two developers, [Dave Smith](https://twitter.com/djsmith42) and [Jamison Dance](https://twitter.com/jergason). Here, they answered mainly two questions about the right time to ask questions and the dealings with group dynamics such as meetings. 

Most of the points given in the podcast are quite simple, straightforward, and summarized (at least for me) that I don't need to make a summarized/opinionated version of it. So I'll just quickly end it here. 🙂 

### [Optimism bias from *You Are Not So Smart Podcast*](https://youarenotsosmart.com/2018/09/11/yanss-135-why-we-are-more-realistic-when-evaluating-others/)
Self-titled episodes are self-explanatory summaries of the episode, I guess. It's an episode from [You Are Not So Smart](https://youarenotsosmart.com/), a blog from David McRaney that focuses on the irrational thinking movement and other modern psychology stuff. Here, he interviewed with one of the neurologist and the director of [Affective Brain](http://affectivebrain.com), [Tali Sharot](http://affectivebrain.com/?page_id=161) about, well, optimism bias. 

For a quick overview, optimism bias is basically the belief of being in a lesser risk and negative consequences. It is what enables us to sometimes ignore warning or even do stuff that we know it's dangerous but it can also act as a motivator for us to put effort into realizing our future, for example, since we believe that our future will be beautiful. It basically acts as a double-egded sword, just depending on how we act towards it.

But in this episode, they talked about more inner workings of it. "How does this optimism bias enables us to advance further in a civilization?", "Why does multiple people remember the same events differently?", and "How does optimism bias affects us as individuals?" — these are some of the questions that I had formed in mind after I listened to the podcast. It is quite cool to learn about this and answer the questions yourself through more research and more recalls. 

Anyways, I'll just invite you to listen to the podcast, I'm pretty sure they can elaborate and explain on that in a simple manner. Just as he warned you in the beginning about the audio quality, he knows that you'll be forgiving that as the topic and the talk itself is interesting.

## What I've been watching to
### [5 ways to listen better](https://www.youtube.com/watch?v=cSohjlYQI2A)
This is a TED talk from Julian Treasure, a communication expert, that emphasizes the culture of listening and how the lack of it is becoming an adversity to our lives. Of course, the speaker delivers the reason most people clicked on the video: 5 ways to listen better. I'll try to summarize it in my own words but basically listening is becoming less relevant as the world around us focuses more on getting attention through social media, news site, and marketing schemes. It is becoming a competition of having the loudest shout on room. Treasure then points out on how to get our listening skills back on edge.
- silence — serves as a time for our ears to recalibrate and to rest
- "mixer" — an exercise that improves our listening by filtering channels and focusing on what those are
- "savoring" — an exercise that simply makes us appreciate mundane sounds
- listening positions — a communication technique that can express non-verbally
- RASA — an acronym from the Sanskrit word, "rasa", meaning essence; means Receive, Appreciate, Summarize, Ask

### [A simple way to break a bad habit](https://www.youtube.com/watch?v=-moW9jvvMr4)
It is another TED talk. This time, though, it focuses more on how to break your habit through the natural reward-based system and mindfulness. It encourages you to get curious everytime you're compulsively acting against a trigger whether be it checking your emails, what does smoking feels like, etc. By the time you've done getting into the hook of the negative trigger, be mindful in how and what effects does it bring. Then the charm should go away, becoming less interested in doing it in the first place, and feeling the joy of letting it go because you've basically confirmed it yourself that the habit is indeed bad. That's how I understood it.

### [How to Get Better at Math](https://www.youtube.com/watch?v=HPsazrVSjl8)
A video from Thomas Frank, known to be the founder of [College Info Geek](https://collegeinfogeek.com/), that gives advice on how to get better at math. Let's cut to the chase, shall we. The ways on how to get better at math is simple: practice a LOT. Still, there are other ways on how to get better at math, not just brute forcing your way with practice. 

First is to breaking down complex problem into smaller ones, isolate those smaller concepts, and practice. Pretty much on any knowledge fields, complex concepts are built upon simpler concepts. The point is, master the foundational concepts to get a better grasp at the more complex ones because they're more likely to stump you when you have less.

Second is to work on similar problems using simpler and easier to handle numbers. This lets us to focus more on the concepts themselves rather than the numbers on the original problem.

Third, if you have difficulty or have a need to review them, simply refer to resources such as books, explainer articles, and tools such as Wolfram Alpha or Symbolab. Having a step-by-step solution tool like the last two tools mentioned in the previous sentence can help us understand the concepts further but be aware of the danger when relying too much on the given solution.

Last but not least, work on the same or similar problems, unaided. This'll really make your understanding to stretch and mold into readying ourselves understanding more noble concepts, gaining more confidence to learn more complex concepts. Instead of working through problems for the sake of finishing it, aim to understand and master the concept.

## What tools I want to share
### [Calibre](https://calibre-ebook.com/)
This is an free open-source software (FOSS) that focuses on e-book management. It has some neat features like creating a whole list from different directories, conversion to different e-book formats (.epub, .pdf, etc.), separation of e-books according to tags, and a whole lot more. I haven't explore to full feature list of it yet, as I have limited need for a library management, but it is a good tool to ease up finding and managing your e-books.

### [draw.io](https://draw.io)
It's a solid free and open source software (or I guess, FOSS) for easy creation of diagrams, charts, flowcharts, and even electrical schematics although I'm pretty sure there are software more strongly built for that. I've used it starting from [my first project showcase (somewhat) entry]({{ site.baseurl}}{% post_url 2018-10-20-introducing-the-simplesvg-sprites-my-first-node-project %}) and now, it is included in my writing toolkit. In fact, this is the tool I've used to make the visuals in this entry. Being an open source software, it has its [Git repo hosted on GitHub](https://github.com/jgraph/drawio). Also, if you've noticed, there's also [an offline desktop version](https://about.draw.io/integrations/#integrations_offline) that supports the Big 3 OS (Windows, Mac, and Linux) for ease of access in case you're working cross-platform. 

### [MyJSON](http://myjson.com)
A simple JSON storage and server. This is a good one for developing your apps in case you need some kind of a quick testing tool. Did I mention it is also very easy to use? Just paste your JSON data and let the server takes care storing that for you. To be honest, IDK for how long they can store your JSON but sure enough, it is mostly used for testing.

### [Postman](https://www.getpostman.com/)
I've been referred to this one from one of Microsoft's courses on building prototypes with NodeJS. This is a development tool specifically designed to test web-based APIs and overall make the process of API development much smoother. You can easily send HTTP request of different kinds, create a mock server, help you create API documentations, and monitor API calls. They offer both a free (which is why is in here) and pro version supporting usage on Windows, Mac OS, and Linux environments. Of course, the pro version having more capabilities than the free version but still, the free version is enough (at least for me).

## What sites I've been visiting
### [cppreference.com](https://en.cppreference.com/w/)
A reference site that is surely known by most programmers who uses C++. I've been trying to program with C++ this month to leverage my toolkit a bit and mostly because I want to make development process somewhat easier instead of completely drowning of search pages about C. Besides, a lot of resources in C tie in with C++ so there's another reason.

### [hackster.io](https://www.hackster.io/)
A community of makers, inventors, and electricians that produces DIY hardware projects, shares information on electronics and programming, and welcomes newbies to the world of electronics and related-stuff. Its project catalog ranges from the popular Arduino to popular Raspberry Pi to other stuff like Matlab, Azure, and, basically they have a lot, OK. 

### [SparkFun](https://www.sparkfun.com/)
It's the website of the company of... Sparkfun, of course. Aside that it offers electronics and hardware products, it also has a collection of learning resources for those who are looking for a treasure trove of electronics fundamentals. They also have a bunch of project articles that doubly serves as an advertisement of their products. They have the products of everything a beginner on electronics might ask for, [an entry-level multimeter](https://www.sparkfun.com/products/12966), [an AVR programmer](https://www.sparkfun.com/products/9825) — heh, why not up the ease to eleven and [make it directly connected from a USB](https://www.sparkfun.com/products/11801) (only for [ATtiny45](https://www.microchip.com/wwwproducts/en/ATtiny45) & [ATtiny85](https://www.microchip.com/wwwproducts/en/ATtiny85), though).

## Who are the content creators I've been following
### [98Demake](https://www.youtube.com/channel/UC4vIcQOyHOcjCgEAVsjenxg)
A YouTube channel that focuses on making games if it were made on 1998, referring to their name. Despite that, the "VIDEO_GAME_NAME if it's made in 1998" videos are actually animations, cleverly made to look like a game from 1998 with the assets, animations, and concepts tied relatively if the game does made in 1998. The channel owner recently made a horror game, too, named [September 1999](https://98demake.itch.io/september1999) which you can play it for free.

### [Derek Banas](https://www.youtube.com/channel/UCwRXb5dUK4cvsHbx-rGzSgw)
A YouTube that makes tutorials that mostly covers almost anything from game development, using Blender, learning Japanese, product reviews, playing Dungeons & Dragons, cooking... psychology... electronics... and last but not least, general programming stuff. Wow! He does a lot. Just check his channel for yourselves and take your pick. I'm mostly subscribed to this guy due to his electronics and Arduino tutorials which is good.

### [Joseph's Machines](https://www.youtube.com/channel/UCbNvfx3rYYxEopnRGxfu53Q)
A YouTube channel that focuses on Rube Goldberg machines, very compilcated machines that does a simple task. The owner of the channel really has passion to push Rube Goldberg (or I guess properly called as kinetic art) into something else. Why did I said that? It's because aside from performing live shows, he also has a series called *Jiwi's Machines*, a comedy sketch show almost giving a 1980s vibes that really showcases these kinetic art forms.

### [Professor Leonard](https://www.youtube.com/channel/UCoHhuummRZaIVX7bD4t2czg)
This one has been recommended to me while checking out for some calculus lessons. Anyways, as you may have intuitively guess if you've read the previous sentence, this is a YouTube channel that produces mathematical lessons by a professor in a live video format with the person actually appearing and actually writing in an actual whiteboard, as if we are actually inside of a real classroom.

------

You've been reading this to the end (or at least the end paragraph)? Great! Because now it's SHAMELESS ADVERTISEMENT TIME (for the most part, anyway)!

This month I've been trying to improve my Jekyll site, especially with the CSS, readability, and configuring MathJax. It is pretty much a pain with MathJax since [it apparently has its own way of linebreaking](https://stackoverflow.com/questions/15235077/mathjax-word-wrap). Additional research states that MathJax will also only calculates the linebreaking thing once. That means once the MathJax LaTex texts has been rendered, that's it for the most part. Try to change the browser viewport width and the text will not go along ~~because watch out, IT'S A REBEL~~ and the horizontal scrolling bar will appear, making the navigation of my pages to suffer. So I've devised my own way of using MathJax which is kind of hacky, to be honest. I'll probably make a post about it, probably.

But you know what's the good thing about MathJax right now? [It's currently being build from the ground up](https://www.mathjax.org/MathJax-v3-beta.2/). That's right! A major rewrite with improvement over its rendering and internal infrastructure. I'm very excited for that, I don't like how I have to wait and see the raw LaTex code before having to see the fully rendered text that is not fully styled yet then seeing that the style being applied.

Also, I've been getting 5 to 15 seconds trying to build it now. Being a site with less than 35 pages or so, this is somewhat of an inconvenience for me especially considering the future. Imagine if it has double the amount of posts. So I'm going to take a dive in using another static site generator which will be Hugo for the next month, taking a few days off, because it is said to be blazingly fast.

OK NOW IT'S REEEEEEEAL SHAMELESS ADVERTISEMENT TIME!!!

For the third(?) time, I'll just shamelessly shill my 
[study playlist](https://www.youtube.com/playlist?list=PLz7wMhmjqqBzxaZPxosxdJOAhrPx9B3cw) in here. If you're not a fan of the usual musical 
genres that are listed in there, I encourage you to make one on your own (unless you just don't want any music while you're studying or 
working).

Also, I'll shamelessly plug one of my apps, [one-for-all](https://foo-dogsquared.github.io/one-for-all/) (not related to *that* One For All or anything, hehehehe). It's an app that shows different search engine interfaces *all at one* page (get it?). I've built it since I always find myself creating a new page on the browser then typing in the name of the website I want to search on THEN I type the relevant stuff in the website. With this app, well, NO MORE! To make the app customizable, I've based around how the app will accept data through a file named `se-list.json`. From there, you can put valid values yourself in which case you should check the [docs](https://github.com/foo-dogsquared/one-for-all#the-needed-data) for the certain values.