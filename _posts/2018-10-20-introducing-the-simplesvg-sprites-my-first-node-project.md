---
layout: post
title: "Introducing the simplesvg-sprites (my first Node project)"
date: 2018-10-20 15:27:06 +0800
author: foo-dogsquared
categories: side-projects
id: simplesvg-sprites
tags: [projects, beginner, node-js]
---

As you have read the title, in this post, I'll just be introducing my first "serious" Node app: [**`simplesvg-sprites`**](https://simplesvg-sprites.herokuapp.com/). I spent developing on it on the span of 10 days as I familiarize myself with the concepts of an API, how back-end works, and... other stuff.

Also, as this is a personal development blog of an aspiring person to be in the software/tech industry, I find it lacking that I have no post that highlights my own project so why not start one right now.

## Side commentary
Like what most side-projects are meant for, this is developed as a way for me to learn the basic ropes of Node. At the same time, I also used this as an opportunity to be familiar with Git and GitHub flow such as organizing my code with Git, using the "Issues" and "Projects" tab, and posting pull requests.

To be honest, I've never really made a Node app before only because I'm not confident of my programming skills at the time. Although I did some MOOCs such as on edX and [eventually made a post about it]({% post_url 2018-05-8-node-js-basics %}), it eventually drowned out in priorities since I also had not so much ideas of what to code (even though it can be something simple as an API, but even creating an API scares me off at the time so...). 

Until I decided to pick up on it again last month and I was suppose to follow along the course I've been 
studying under but an idea suddenly sprung and I thought it is a very good project for a beginner so I developed it while taking the course.

## Overview
It's an app that will create an SVG composed of `<symbol>`s made up of icons from [Simple Icons](https://simpleicons.org/). You just select an icon from the `<select>` list either located at the site if you're viewing it with a width more than 600px or with a toggle button that will show the list hidden somewhere.

You can select an icon to be included either by selecting it then pressing the 'Add to list' button or double-clicking it for convenience sake. The `<select>` list allows multiple selections at one time so there's that. Unfortunately, the app is clearly not optimized yet for mobile users since there's no way for most phones to enable multiple selection and `<select>` with the `multiple` attribute pretty much acts as a button (at least in my case) so it is on consideration on how to optimize the UX on that.

You can also remove some of the icons you've selected either by selecting them individually then pressing the 'Remove selected list items' button or selecting the 'Remove all list items' button to easily remove them all.

After you've made decision with the list of icons to be included inside of the SVG, press the 'Compile to SVG' button and confirm it to start creating the SVG which will take place on the server.

This is an app composed of two parts: the front-end and the back-end with each having its libraries as shown in the representation of the app's components below:

![The app components]({{ 'assets/pictures/side-projects/simplesvg-sprites/app-components.png' | relative_url }})

The most important thing here (aside from Express) is the [Simple Icons npm package](https://www.npmjs.com/package/simple-icons) since it serves as the database of the whole collection from Simple Icons.

## How it works
### Back-end
As I said before, it is composed of two parts: the front-end and the back-end.

The main star of the show is (of course, none other than) the back-end and we'll first examine how the back-end works first to understand the front-end. The server serves the front-end and it is where the core function of the app is located. It is where the output is being processed and created.

Most of the functions of the back-end are mainly accessed through HTTP requests. You can just refer to each of them in the [README](https://github.com/foo-dogsquared/simplesvg-sprites#api).

Anyways, since the Simple Icons npm package is really just one gigantic object with a template on each property.
```json
{
    ".NET": {
        "title": ".NET",
        "hex": "5C2D91",
        "source": "https://docs.microsoft.com/en-us/dotnet/images/hub/net.svg",
        "svg": "<svg aria-labelledby=\"simpleicons-dot-net-icon\" role=\"img\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\"><title id=\"simpleicons-dot-net-icon\">.NET icon</title><path d=\"M3.1672 7.5655v8.749H4.19v-6.325a8.979 8.979 0 0 0-.0488-1.1998h.0384a2.9082 2.9082 0 0 0 .2784.5473l4.4973 6.9774h1.2569V7.5655H9.1904v6.1526a9.2574 9.2574 0 0 0 .0619 1.286h-.0234c-.0544-.1056-.173-.3002-.3553-.585L4.4964 7.5656zm9.315 0v8.749h4.65l.0048-.9599h-3.6087v-3.0331h3.1579V11.4h-3.1579V8.4916h3.3884v-.926zm5.4374 0v.926h2.5149v7.823h1.0216v-7.823H24v-.926zM.6534 15.067a.643.643 0 0 0-.4565.2062A.6719.6719 0 0 0 0 15.753a.6623.6623 0 0 0 .1968.4799.6479.6479 0 0 0 .4799.2015.6623.6623 0 0 0 .4799-.2015.6575.6575 0 0 0 .2015-.48.667.667 0 0 0-.2015-.4798.6575.6575 0 0 0-.4799-.2062.643.643 0 0 0-.0234 0z\"/></svg>\n"
    },
    ...
    "Zillow": {
        "title": "Zillow",
        "hex": "0074E4",
        "source": "http://zillow.mediaroom.com/logos",
        "svg": "<svg aria-labelledby=\"simpleicons-zillow-icon\" role=\"img\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\"><title id=\"simpleicons-zillow-icon\">Zillow icon</title><path d=\"M17.381 18.056c-7.43.445-15.51 3.135-16.362 3.51l.989-2.789c2.521-1.166 8.775-3.469 16.486-4.019-.15.57-.961 2.671-1.125 3.285l.012.013zm2.649-7.509s-.363.765-.709 1.814c-2.954.18-7.635 1.154-9.915 1.98 1.186-1.08 8.686-8.61 8.686-8.61C20.985 7.71 24 10.155 24 10.155l-3.97.395v-.003zm-17.55.33c1.647-.75 6.265-2.146 10.685-3.181 0 0-8.497 7.845-10.859 10.275l1.95-5.28c-1.516.225-2.184.315-4.256.75l2.479-2.551.001-.013zm10.6-8.432c.734.359 3.45 2.205 4.419 2.888-3.096.074-9.135 1.409-11.652 2.25 2.065-1.568 5.903-4.53 7.233-5.148v.01z\"/></svg>"
    }
}
```

It is easy to create an API that'll create a more simplified database out of it. The first API action that I created has something to do with simply creating a database that lists out all of the names of the icons in one array in `/database` with `GET` as the method.

On one side, I also defined an API endpoint that'll give the client the icons with the template in `/simple-icons` with the needed query simply by extracting the property of the gigantic object and putting them all in one smaller object (converted into JSON) as the response.

Lastly, the core function of the app, which is creating the SVG with `<symbol>` is also made suitable for making it into an HTTP request with `/compile` with POST as the needed method with the required key-values in the body.

How it works is almost the same as the function embedded in `/simple-icons` added with a few steps. First, the server will read the body in the `icons` key then it will filter out the valid values.

Then I prepared the SVG template then extract the needed data from the Simple Icon npm package as the server iterated through the valid values. From that point, the SVG template is also started to fill up with the `<symbol>` tags with the needed attribute.

Luckily, creating the template of the SVG itself is easier than expected since the SVG code from Simple Codes has a pattern. So I made the server to search the SVG with a regex (regular expression).

If you're not familiar with regex, you can refer to [Mozilla's docs on them](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions)

```
 /(<svg .+>)(<title .+>)(.*)(<\/title>)(<.+ .+\/>)(<\/svg>)/
```

I also made a separate regex that searches the `viewBox` attribute which is all located from the first subgroup of the regex ([reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#Using_parentheses)) since it is simply the best solution for now. If I included it in the subgrouping, there would be trouble regarding capturing the `<svg>` and its attributes part in one consistent group.

Anyways, once the whole `icons` query in the body has been iterated, the server will prepare the respond with the SVG in one completed package.

### Front-end
The front-end is mostly built with Vue so that I can easily create the UI that I imagined it would be (although, admittedly it is just a ripoff of the layout from [my first webpage that uses Vue](https://foo-dogsquared.github.io/)). How I imagine the front-end is that it should mainly serve as a GUI version of the back-end since I also planned the very function of the app to be made possible only with HTTP requests. 

The front-end then requests the entire catalog of icons through an HTTP request to `/database` (origin included if you're requesting it outside of the app) and store them to the local storage including with a timestamp. Of course, I made sure to update the database in the front-end by making it request for the database in the same location if it detects that the local day of the user is not the same as before. 

![How I "cache" the database]({{ 'assets/pictures/side-projects/simplesvg-sprites/database-mechanism.png' | relative_url }})

This way, I can easily reduce the possible workload of the server by limiting it since the Simple Icons package is surely locked and installed in one version. Although this also leads it to be very disadvantageous when the database is updated in the middle of the day. 

At first, I tried to make the whole thing into an HTML form but I was having a hard time with integrating those so I put it outside of the `<form>` instead. From that point, I was able to easily create the functions of the buttons especially with the 'Compile' function. Each function of the button is nothing too fancy with most of them are integrated through Vue so data can be easily be binded.

## What could've done better
The planning phase of the app, surely. There is little planning that have been going on for this development project as I only limits to the UI, general actions of the server, and the scope of the project. I should've considered more planning options to have at least an optimal paved roadmap of my project, or even a prototyping phase of my app.

Another thing is about my programming habits. Since my internet is slow, I have those moments wherein I get distracted in less than 10 seconds only because of the buffering between each page although that could not be considered as an excuse. 

The habits that I took notice of not only relates to distraction every once in a while but also to the way how I organize my code. It is *very* messy. So much, in fact, that I spent majority of the development time refactoring and modularizing code to make it readable, maintainable, and not fragile as much as possible.

Considering that this is a simple app designed to be a learning stepping stone, it is somewhat expected to be somewhat of a mess. It turned out to be interesting, too. I've took notes on how to improve taking my notes each project and what habits are very detrimental to productivity.

## Conclusion
So there's that. My first back-end and first full-stack app is pretty much far from perfect with the implementations and data management decisions but that's what practice is for. I fully expect nothing perfect will come out of this, just with the best ability of what I can implement and program from what I've learned. I'm very clueless of what am I doing at the time 🤣. As long as I learned on how to improve myself as a programmer, I found this project to be a success (50% of them, anyway).

What I've learned from this project is improving habits: planning, prototyping, and focusing being the main point. From a technical side things, I've also learned all about HTTP and how do they work with the server and the client. 

Regardless, I've learned a lot especially regarding back-end and APIs. Using APIs suddenly make sense and reading API docs are easier for me, now. I've also noted to mind my code organizing and planning skill. It'll be a lot more compelling to do in the future projects, for sure.

If you have any suggestions or improvements over my writing, just send a comment here. You can also check out the [repo of the app](https://github.com/foo-dogsquared/simplesvg-sprites) to see how it's been developed. Of course, valid bug issues/suggestions and code improvements with pull requests are very much appreciated.