---
author: foo-dogsquared
categories: "self-learning"
date: 2019-03-05 15:04:44 +0800
layout: post
tags: ["monthly-learnings", "learning"]
title: Monthly Resources and Learnings (February 2019)
---

## What I've learned
### Service workers (in detail)
I've dabbled with service workers way last year with my [first realized app](https://github.com/foo-dogsquared/bookmarkdown) but I only stopped there. Restudying this, I decided to make it so in detail.

#### What are service workers?
A service worker is a program that runs in the background for the app to gain additional functions such as push notifications, app caching, and making your web page to look like a native app when added in the home screen of your phone. They can also be used to handle network requests. 

With service workers, you could make your web app to be offline but as soon as there is a good network connection, the app could rely on that instead and update the cache whenever possible. 

You could also add push notifications to your app. For example, if you visit [Product Hunt](https://www.producthunt.com/) on a browser and logged into it (assuming you already have an account, of course), you could receive periodic notifications about a new product.

Service workers, in general, go hand-in-hand with progressive web apps (PWA) to provide the same user experience when using a native app. Without service workers, you may not get your web app to work offline or make push notifications as easily as today.

In order to understand a bit more on service workers, let's look at the life of a service worker (in a literal sense). As I said before, it's a background script that runs with the app. Which means that we need to create that background script (or use a library/tool that can easily create that for us).

#### Service worker lifecycle
The service worker works on a cycle of states. Generally, they go through the following states:

<img src="{{ '/assets/pictures/self-learning-series/february-2019/service-worker-lifecycle.png' | relative_url }}" alt="Service workers lifecycle">
<p class="caption">Service workers lifecycle</p>

- *installing* &mdash; A service worker would be installed first through the [`register()`](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register) method that can be found in the [Navigator interface](https://developer.mozilla.org/en-US/docs/Web/API/Navigator) of the browser.
- *activating* &mdash; After the registration is finished, the service worker can now process and listen to events and do things that you've programmed.
- *idle* &mdash; Once the service worker does not have any tasks at hand, it goes idle and it automatically goes *terminated* until the client needs the service worker again. 

Since the operations done by service workers are usually asynchronous (as it is another type of a [web worker](https://www.html5rocks.com/en/tutorials/workers/basics/), after all), we can make full use of [promises](https://developers.google.com/web/fundamentals/getting-started/primers/promises) for programming their actions. If you're not familiar with promises, you can check out some example usage of it from [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises).

Let's try it with a very simple demo. Say that I've been tasked to make a very useful app at `https://example.com/toggle-body` to work entirely offline using a service worker.

Inside of the app are three files:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Simple service worker demo</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <span>Click anywhere, I guess.</span>

    <script src="main.js"></script>
  </body>
</html>
```
<p class="caption file-name">index.html</p>

```css
html, body {
    height: 100%;
    transition: .5s;
}

.active {
    background: black;
    color: white;
}
```
<p class="caption file-name">style.css</p>

```js
// Toggling the body style with a click
document.body.addEventListener('click', function (event) {
    document.body.classList.toggle('active')
})
```
<p class="caption file-name">main.js</p>

Let's get on with it! 😎 First, let's install a service worker.

In order to install a service worker, the browser must have the service worker API installed. You can check out [this page](https://jakearchibald.github.io/isserviceworkerready/) in order to see what browsers and their versions do have the service worker API shipped into the program. You can also check out the compatibility with [Can I Use?](https://caniuse.com/#feat=serviceworkers).

In the <span class="file-name">`main.js`</span> file, let's add the lines that enables us to register the service worker.

```js
// Registering
if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/toggle-body/serviceWorker.js')
        .then(function (registration) {
            console.log(`Service worker registration is successful: ${registration}`)
        })
        .catch(function (error) {
            console.error(`Service worker registration failed: ${error}`)
        })
}
else {
    console.log('Service workers are not supported.')
}
```

As you can see in the service worker registration line, we first check if the browser has the service worker API shipped before doing the registration to prevent an error to be thrown and completely stop the execution of the entire script. It may not be that big of a deal in this example since it's quite small and simple but imagine if you have a bigger app, it could cause a nastier user experience.

Take note that the [`register()`](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register) function needs a path to a valid JavaScript file **relative to the origin, not the app directory**. So for example, in this case, the app is located at `https://example.com/toggle-body` in the net. The service worker script that we want to install will be at `https://example.com/toggle-body/serviceWorker.js`. The origin here is `https://example.com/` which means that the file path parameter needs to be written as `/toggle-body/serviceWorker.js`. 

Assuming that the registration has been completed, we now have our service worker installed and the service worker registration success message has already logged into the console. 

The way how a service worker works is that it's running on its own thread executing things in the background. Unlike your regular JavaScript scripts, service workers don't have access to the DOM which means the `document` object is not available. Also, they don't have access to some of the properties inside of the `window` object. To be able to use APIs that the browser offers, you can use `this` or `self` with the latter being more recommended to use.

Now let's write our service worker script in a new file named `serviceWorker.js` in the root folder of our app directory, as indicated in the `register()` method. So now we should have at least 4 files.

```
/app
  - index.html
  - styles.css
  - main.js
  - serviceWorker.js
```

One of the fantastic offers of a service worker is to cache content. Although we already have [AppCache](https://developer.mozilla.org/en-US/docs/Web/HTML/Using_the_application_cache) on some browsers, it's in the process of depreciation and it has been removed from the web standards.

So let's cache our content!

We can cache our content at any point but for this simple example, we cache the app after the service worker installed. When the user visits the page, that's when the installation of the service worker starts if the user doesn't have a service worker already installed by the time they visit the page. While the service worker is being installed, we will cache our app.

<img src="{{ '/assets/pictures/self-learning-series/february-2019/example-caching-workflow.png' | relative_url }}" alt="Precaching process">
<p class="caption">Precaching process</p>

The answer to the question of when to cache content depends on a lot of factors: if it's a static type of file or data like the `index.html` or a CSS file, most likely you just cache it right at the service worker installation process. For dynamic data such as messages and news, they could be cache every time the data has been successfully fetched from the network. If the network connection failed, you can fallback to the cache and wait for a moment.

There's a lot of situations that you could encounter that needs different solutions. I recommend looking at the [service worker cookbook](https://serviceworke.rs/) or [Google's offline cookbook](https://developers.google.com/web/fundamentals/instant-and-offline/offline-cookbook/) to look at different ways of using service workers especially when it comes to caching.

With all of that said and done, let's write the script for caching our app:

```js
const cacheFolderName = 'simple-service-worker-demo'
const cacheVersion = 'v1'
const cacheName = cacheFolderName + cacheVersion

self.addEventListener('install', function (event) {
  event.waitUntil(
    caches
      .open(cacheName)
      .then(function (cache) {
        console.log('Caching all of the resources...')
        caches.addAll([
          './index.html',
          './styles.css',
          './main.js'
        ])
      }
    )
  )
})
```

There may be a part where you don't understand the syntax yet but don't worry, we'll get there in a jiffy.

The first few lines are quite easy to understand &ndash; we're just declaring constant variables to easily change the name of the cache when needed. Right after that is the hardest part yet. When the service worker is about to install (which is why we're referring to as `self`), that's when resources are being cached. You might be curious why there's the [`event.waitUntil()`](https://developer.mozilla.org/en-US/docs/Web/API/ExtendableEvent/waitUntil). It's there to ensure that the service worker will not install until the caching process has been successful.

To see the more service worker events, you can take a look at the below image taken from [MDN Web Docs](https://developer.mozilla.org):

<img src="{{ '/assets/pictures/self-learning-series/february-2019/sw-events.png' | relative_url }}" alt="Available events in service workers">
<p class="caption">Available events in service workers</p>

If the caching process has been successful, the installation will proceed and will be completed. 

There we have it! Our service worker is installed but we only cache our app. We don't do anything with our newly added cache that is until we told our service worker to do something about that.

One of the capabilities of a service worker is the ability to oversee our requests. Usually, the simplified process of the client-server request model without the service worker only consists of the client sending a request, reaching into the server, then the server sends back with a response.

<img src="{{ '/assets/pictures/self-learning-series/february-2019/normal-browser-workflow.png' | relative_url }}" alt="Usual client-server model workflow">
<p class="caption">Usual client-server model workflow</p>

With a service worker, those requests have to go through the service worker before getting into the server. In some cases, the service worker can also send a response and effectively completes the process without the server.

<img src="{{ '/assets/pictures/self-learning-series/february-2019/service-worker-workflow.png' | relative_url }}" alt="Example workflow of a client and a server with a service worker">
<p class="caption">Example workflow of a client and a server with a service worker</p>

You see where I'm getting at? That's right! We're going to do exactly that! How you may ask? Let me explain it for you to the best that I can!

Each time the client sends a request for a resource (i.e. an image, a CSS file, a JS script), the service worker detects it as a `fetch` event. So simply, we'll add an event listener for that:

```js
// setting up event listener for the fetch event
self.addEventListener('fetch', function (event) {
  // magic magic magicka
})
```

The event object in the `fetch` event is simply a [`Request`](https://developer.mozilla.org/en-US/docs/Web/API/Request) object. So let's add a bit of logical code. As I said before, the requirements here is that our app should rely on the network first before falling back to the cache. So let's code for that:

```js
self.addEventListener('fetch', function (event) {
  console.log(`Fetching at ${event.request.url}`)

  // network falling back to cache
  event.respondWith(
    fetch(event.request).catch(function () {
      return caches.match(event.request)
    })
  )
})
```

This code was based (or copied, if you're a savage) from [Google's offline cookbook on network falling back to cache](https://developers.google.com/web/fundamentals/instant-and-offline/offline-cookbook/#network-falling-back-to-cache). Let's inspect the code line by line to understand the whole picture.

- We already know that the service worker listens to a fetch event. When the fetch event was triggered, the service worker will log the URL of the resource that is being requested.
- The service worker then takes over and handles the request themselves. The response would just go as normal but with a bit of a catch (geddit?). If the network fetching has failed, we chain it to the [`Promise.catch()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch) and send it with the equivalent resource from the cache as the response with [`Cache.match()`](https://developer.mozilla.org/en-US/docs/Web/API/Cache/match).

Ta-da! There we have it! Our simple service worker demo! If you reset the service worker either by deleting it from the browser ([`chrome://serviceworker-internals/`](chrome://serviceworker-internals/) for Chrome and other based browsers or [`about:debugging#workers`](about:debugging#workers) for Firefox and other based browsers, for example), waiting for the working service worker to be a day old (just for the kicks), you have your 'app' working offline. If you want to see the complete picture or want to see the whole code in its full glory, then you can [visit this GitHub Gist](https://gist.github.com/foo-dogsquared/72a590f33da3d29fd60d25efa649440c). 

Now we see one of the capabilities of service workers. There are plenty of other features that you can add such as push notifications. In the future, service workers may have the capability of [background syncing](https://developers.google.com/web/updates/2015/12/background-sync) (which is [already present in Chrome](https://jakearchibald.github.io/isserviceworkerready/#background-sync), as of this writing) or [geofencing](https://www.cio.com/article/2383123/geofencing-explained.html).

With service workers and caching, you can even go with a custom 404/offline page similar to [this demo from Google](https://googlechrome.github.io/samples/service-worker/custom-offline-page/). As an exercise, why don't you try it out in this example? There's a lot more of what you can do with service workers especially if you want your app to function well as if it's one of the native mobile apps.  

### Vue and single page applications (SPA)
After learning about Vue and web components back in October with an [implemented project](https://github.com/foo-dogsquared/simplesvg-sprites) after that, nothing much happens. I studied Vue for the sake of learning more on front-end projects and their overlapping concepts that they often have in common such as web components and easy DOM manipulation.

Well, this time around, I've decided to create a Vue project with the use of tools that are readily available to aid me on creating a project faster than [my first project this February](https://github.com/foo-dogsquared/300-words-a-day). I've used the [Vue CLI](https://cli.vuejs.org/) and the [official routing library](https://router.vuejs.org/) to create [my first single-page application](https://github.com/foo-dogsquared/virtual-idea-dice) (or SPA, for short).

Instead of going back to how I mostly do my Vue projects (with horribly included Vue code inside of an `index.html`), I've tried to do it with [single Vue file components](https://vuejs.org/v2/guide/single-file-components.html) which made my code more organized (at the very least). Here's where I explored the concept of single-page applications.

Single-page applications (or SPA, for short), as the name indicates, is an application where most of its data and functions are shown in one page and is usually handled directly by the browser instead of the server. This type of application is made possible through [service workers](https://www.html5rocks.com/en/tutorials/service-worker/introduction/). Though it's not necessary, creating SPA are commonly used with front-end frameworks (i.e. [Angular](https://angular.io/), [React](http://reactjs.org/), [Vue](http://vuejs.org/), and [Ember](https://emberjs.com)) to speed up development time. 

An example of a SPA could be [Gmail](https://www.gmail.com) where most of the data is handled by the browser and as a result, the app feels like a native desktop application. Though it uses multiple pages, the core functionality of viewing and sending emails can only be found on one page which is in the index page of the app. Also, the app has certain offline functionalities like holding off your emails to be sent until a network connection is present.

I'll delve more into this once I experienced enough with using frontend frameworks like [React](http://reactjs.org/) and [Vue](http://vuejs.org/).

## What I've been reading to
### [Launching tips for makers](https://www.youdontneedwp.com/gkiely/marketing-tips-from-makers)
It's an article that describes for effective marketing for the products you're launching. It contains tips from a couple of makers which is [@thepatwalls (Pat)](https://twitter.com/thepatwalls) and [@Booligoosh (Ethan)](https://twitter.com/Booligoosh). It's a neat reference for me in case I'm rearing for marketing my products. Very cool. 🙂👍

### [APIs you don't know you needed by *Mikhali*](https://dev.to/mkrl/apis-you-didnt-know-you-needed-38c)
One of the best articles this month, boi. No questions. Seriously though, this is a [dev.to](https://dev.to) article by [Mikhali](https://dev.to/mkrl) about a bunch of ~~useless~~ very useful APIs that you'll regret to lose once you've seen it. So beware! Before you read this article, make sure your mind is ready for what's about to come. There's no going back.

### [Front-End Performance Checklist 2019](https://www.smashingmagazine.com/2019/01/front-end-performance-checklist-2019-pdf-pages/)
It's a (*very long*) checklist and an explainer guide for explaining how to establish a focus on performance for the front-end of your web apps. They really put the meaning of a comprehensive guide in this one. All of the performance-related knowledge you need is right there from asset optimization to testing and monitoring your web app as you go developing it. It's a good thing they provided a print-ready version of the checklist, though.

## What I've been listening to
### [Hasty Treat - Code Quality Tooling from *Syntax*](https://syntax.fm/show/113/hasty-treat-code-quality-tooling)
It's a podcast episode from Syntax, ~~the tastiest web development treats out there~~ a podcast series that focuses on web development hosted by [Wes Bos](https://twitter.com/wesbos/) and [Scott Tolinski](https://twitter.com/stolinski). In the episode, they basically talk about the tools that can aid you in putting out quality code such as linters, code monitors, and text editors. I should also mention that they have a [Part 2](https://syntax.fm/show/115/hasty-treat-code-quality-tooling-part-2) of it that talks about types, testing, and exceptions.

## What I've been watching to
### [CS50 on Twitch](https://www.youtube.com/playlist?list=PLhQjrBD2T381GoWDSziZYoaK7CY9JXtWK)
Well, it's another CS50-related playlist and the title is self-explanatory. It's the CS50 (staff) on Twitch. It is composed of streams where they do software-related activities: coding programs, set up certain things, teaching the basics. Well, they also play [some](https://www.youtube.com/watch?v=0cesxxUQ38M&list=PLhQjrBD2T381GoWDSziZYoaK7CY9JXtWK&index=16) [games](https://www.youtube.com/watch?v=UIUs9KXjYQQ&index=20&list=PLhQjrBD2T381GoWDSziZYoaK7CY9JXtWK) too.

### [Django Tutorials by *Corey Schafer*](https://www.youtube.com/playlist?list=PL-osiE80TeTtoQCKZ03TU5fNfx2UY6U4p)
It's a series of YouTube videos from [Corey Schafer](https://www.youtube.com/channel/UCCezIgC97PvUuR4_gbFUs5g), a developer with a YouTube channel that focuses on software development with a bit of focus on Python. I'm 25% through the tutorial and I gotta say it's pretty solid. The structure of the tutorial is pretty solid and the pacing is moderately fast, not too fast but not too slow. I really recommend this tutorial series if you want to learn about [Django](https://www.djangoproject.com/) or want to start developing some web applications.

### [What task would make today great? by *Fun Fun Function*](https://www.youtube.com/watch?v=T2KbMeS9lLQ)
It's a 20-minute video by [@mpj](https://twitter.com/mpjme) from [Fun Fun Function](https://www.youtube.com/channel/UCO1cgjhGzsSYb1rsB4bFe4Q) that is about how to make a task that would affect your day. This is not a full-on tutorial unlike most of the videos on the channel but rather this is one of those videos where he talks and walks around (which is cool to see the beautiful views 😁). It's more of a vlog or a person-to-person talk and what do you know, I love this format. 

## What tools I want to share
### [Gidgitz](https://gidgitz.com/)
It's a website by [DeChamp](https://dev.to/dechamp). The way how I would describe this site is that it's like a Swiss knife. It's got a Base64 encoder/decoder, ASCII to binary converter, a Prettier-esque tool for XML, JSON converter, and... a Chuck Norris facts screen, of all things. It's a neat little tool to play around with in case you don't have much to do. 

### [ShareX](https://getsharex.com/)
It's a Windows-exclusive tool that captures screenshot and recordings. Simple as that but it has a list of convenient features: hotkey mapping, automatic image uploading, customizable configurations such as custom folder destinations, and a variety of screenshots and recordings options. You can capture in MP4, GIF, PNG, and JPG. Heck, you can even capture texts from a picture! If that wasn't cool enough for a screenshot tool, I don't know what is awesome anymore. The only obvious unfortunate side here is that it's Windows-exclusive but there's a [Linux and FreeBSD clone](https://github.com/Francesco149/sharenix) of ShareX that is in development right now.

## What sites I've been visiting
### [Boomkrak](http://boomkrak.com)
It's a site that lists out design-related resources and put them in its own category. Also, included in a nice-looking site, as well. I'm not very adept at web design so this is quite a useful site for me. Hmm... This just inspires me to create a project based on this site. 😏

### [Google Coding Competitions](https://codingcompetitions.withgoogle.com/)
It's a site featuring coding competitions from Google. Clear as a newly built 4K monitor? Good. That's all you need to know. What about the skill requirement? Personally, I would recommend you to join in a few rounds. Did you fail *just* on the first question? That's good to know! At least I'm not alone on the boat anymore. 😁

### [Stackshare](https://stackshare.io/)
As the name implies, it's a website that lets you share and browse tech stacks. It's a good site to explore possible combinations to what tool you could use for your next project. Want to know what tools used to build Facebook? [Here you go.](https://stackshare.io/facebook/facebook) Here's something that I really want to know, the tech stack of [Stack Overflow](https://stackshare.io/stack-exchange/stack-overflow) 😲. Aside from the tech stacks, you could also browse and review the tools that are inside of the tech stacks. It's quite useful for knowing their credibility (or popularity) in the industry and exploring other tools that you don't know about yet.

## Who are the content creators I've been following
### [Atomic Shrimp](https://www.youtube.com/user/AtomicShrimp)
It's a YouTube channel of a semi-casual YouTuber about... well, anything, I think. One thing for sure is that Atomic Shrimp is all about is ideas. His content revolves around random stuff which is consistent with his channel philosophy: [scambaiting](https://www.youtube.com/watch?v=BduftT_n-Xg), [weird stuff in a can](https://www.youtube.com/playlist?list=PLk5KvJPikK010VM4uJumeNG3_QnvYi0e4), and [random projects and crafts](https://www.youtube.com/playlist?list=PLk5KvJPikK02ZjEVs7c1Gutkgs_uFK4Uf). Whatever content that he likes to talk about, he names it and that's the reason why I'm attracted to this channel. It's just a casual channel with (mostly) educational and entertainment value from a casual YouTuber. 

### [Eddie Woo](https://www.youtube.com/channel/UCq0EGvLTyy-LLT1oUSO_0FQ)
It's a YouTube channel of a mathematics teacher [Eddie Woo](https://misterwootube.com/) that focuses on mathematical stuff (obviously). His videos are similar to [Professor Leonard's](https://www.youtube.com/user/professorleonard57) with the said YouTuber teaching things in a classroom except Professor Leonard's content focuses more on calculus while Eddie Woo's content focuses on pre-calculus. Hmm... I think I just found a perfectly complementary pair. 😮

-----

OK! Now's that done, it's time for the SHAMELESS ADVERTISEMENT! 😁👍

What's the next news story? Well, I'll be more focused on the more advanced concepts of programming like string parsing (one of my biggest weaknesses), data structures, design patterns, and crafting and planning for a more efficient algorithm. I'll be sure to write a blog post about them as I go (as long as I remind myself to do this every now and often). I should seriously take a habitual process regarding writing... 🤔

Anyways, another project shill! This time it's one of the simplest yet most useful projects (at least for me) that hopefully, you'll find useful, as well. "What will it be?", you (probably) asked. It's a simple project regarding freebies that serves as a breakthrough for using relational databases. Also, I'll be using [Django](https://www.djangoproject.com/) (and Python) and [React](http://reactjs.org/) for this just to make things different. Not all things are set so there may be changes regarding this upcoming project. 

I'm also being noisy about it on my [Twitter](https://twitter.com/foo_dogsquared) so you can know about the upcoming project more over there.

Anyways, see you in the next blog post!
