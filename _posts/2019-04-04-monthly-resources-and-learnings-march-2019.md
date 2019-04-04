---
author: foo-dogsquared
categories: "self-learning"
date: 2019-04-04 01:25:49 +0800
layout: post
tags: ["monthly-learnings", "learning"]
title: Monthly Resources and Learnings (March 2019)
---

## What I've learned
### React and Gatsby
Well, I have set some rules for myself about using front-end frameworks that I should just stick to one. However, in order to get the best results of it, I guess I have to get my hands dirty with the other options. Now, for this option, I have to try out React since I'm a bit familiar with the common concepts of front-end frameworks which is mostly about components. 

I've dabbled with [React](http://reactjs.org/) a little bit, then gone on ahead with [Gatsby](http://gatsbyjs.org/), a static site generator that's made with React. I've used it since it makes the most sense for my project which is a simple freebies resource list. I mean it's not like my data is going to be updated 24/7 at a constant pace so a static site generator is a fitting tool for this.

Gatsby is said to have an easier way of integrating data with or without [GraphQL](https://graphql.org/). I didn't integrate GraphQL for it since I thought my project is simple enough and I don't want to deal with new "shiny" stuff like this.

Gatsby is kind of hard to use, at first. The official documentation is enough but not enough when you have a specific use case (though we have Stack Overflow for that). All things went well smoothly until I encountered a production build error. Turns out Gatsby has a different workflow for development and production and all I had to do is change the directory name from `pages` to `templates`... for some reason.

Anyways, one of my biggest mistakes is just getting into production while learning a new tool. Obviously, I expect the worst result from this but at least I was able to experience it and know how it feels.

### Lexing and token analysis
String parsing is one of my weakest points when it comes to programming. Usually, I go to regexes and just apply `String.prototype.match` (or similar to other languages) and hope for the best. However, I encountered a situation where it is not applicable at all, no matter how much I tried.

When I was about to fill up the data for my "Freebies Hunt" project, I had to do it by referencing a [certain file](https://github.com/foo-dogsquared/freebies-resource-list). Obviously, I don't want to manually add it since it is too tedious and I won't have a unified interface for updating data (and it is still tedious to do even if I had to do it with [`jayson-db`](https://github.com/foo-dogsquared/freebies-resource-list)) so I tried to parse through it.

Fortunately (or not, whatever you want to view it), my file has a certain pattern.

```md
## TYPE
- [NAME](URL) &mdash; **(PERSONAL COMMENT)**; DESCRIPTION
```

However, there are some things that make it more complex (for me). The personal comment and the description are entirely optional. Not all freebies in the list have a personal comment, a description, or both. For you, regex veterans out there may see this as easy but I had a difficult time parsing through this. After trying to bash my head in a wall with regexes, I decided to give up and create a lexer instead which is a first.

Initially, I created a simple lexer which detects individual words and includes it in a token type. Here's the draft for the initial version:

```md
## SAMPLE TYPE
- [NAME1](LINK1) &mdash; **(PERSONAL_COMMENT1)** SAMPLE DESCRIPTION
```

into...

```json
[
    {
        "type": "TYPE",
        "data": "SAMPLE TYPE"
    },
    {
        "type": "NAME",
        "data": "NAME1"
    },
    {
        "type": "LINK",
        "data": "LINK1"
    },
    {
        "type": "MDASH_SEPARATOR",
        "data": ""
    },
    {
        "type": "PERSONAL_COMMENT",
        "data": "PERSONAL_COMMENT1"
    },
    {
        "type": "DESCRIPTION",
        "data": "SAMPLE DESCRIPTION"
    },
    {
        "type": "NEWLINE",
        "data": ""
    }
]
```

Not only it's a simple one but it's a very effective and efficient way of getting the data that I need. Though it took longer than it should be, I gave myself a pass since this is the first lexer that I have.

Eventually, the lexer that I created for the markdown list might be the best way to go ahead of the project since it provided a decent interface of my data. I can just open up the markdown file, update it, build it, and the data is updated.

## What articles I've been reading
### [Learn it Yourself](https://egoless.tech/learn-it-yourself/)
It's an article about relying mostly on yourself to learn and how you can improve your self-learning skills. It details on what to do for yourself in order to resolve a bug or an error on your program. Overall, it's a good article for beginners especially with the other things the writer links to. He even links to one of my favorite articles of all time, [How to Ask Questions the Smart Way](http://www.catb.org/~esr/faqs/smart-questions.html).

### [Small focused modules by *Sindre Sorhus*](https://blog.sindresorhus.com/small-focused-modules-9238d977a92a)
You might have heard of Sindre Sorhus. He's known for publishing a lot of programs which you can see it from [his GitHub profile](https://github.com/sindresorhus/). He talks about how he can publish open source programs in such a large quantity. As you can tell from the title of the article, it is possible through building small focused modules. How small? It can be *quite small* that the program can only do one thing. I recommend you to go check out his article otherwise I might just explain the whole thing here.

## What tools I want to share
### [Figma](https://figma.com)
It's a web-based program on app design and prototyping similar to [Adobe XD](https://www.adobe.com/products/xd.html). Though both tools are free to use, one has clearer advantages than the other. Figma can be used 100% online, it can also go offline (though you still need internet connectivity if you want to use online features for obvious reasons), and it is completely free for individuals [though it still has its limitations](https://www.figma.com/pricing/). 

Anyway, this is referred to me by [Zaydek](https://twitter.com/username_ZAYDEK/) and he's also kind enough to give some pointers about using this type of programs. At first, I have a difficult time using it but after Zaydek pointed the directions in the [tutorials](https://www.youtube.com/watch?v=T0kRCTOX0zY) (I guess I'll be looking for these things from now on), I was able to get a grasp on using it and even created my first custom-made logo. Quite excited to integrate this on my upcoming projects. Really recommending this! 😁👍

## What sites I've been visiting
### [/r/learnprogramming](https://www.reddit.com/r/learnprogramming/)
It's a beginner-friendly [reddit](https://www.reddit.com) community on starting and learning programming. It's one of my [recommendations for online programming communities](https://foo-dogsquared.github.io/blog/posts/free-resource-list#communities). I gotta say that this is where my motivation is coming along (among many others) since I see fellow programmers interacting with a beginner mindset. It's one of my main mental model and perspective that I'm trying to go for. Also, they have a [decent wiki for those who are finding some inspirations](https://www.reddit.com/r/learnprogramming/wiki/).

### [Boomkrak](http://boomkrak.com/)
It's a resource list curated by the [Lieur Company](https://twitter.com/lieurco) that collects the best resources for getting started into your projects. They have categorized their list according to their purposes. They have listed tools for collaboration, communication, user research, presentation, and more. I mainly navigate in this site looking for design-related resources and what they found is pretty good so far especially with the icon sets. This gives a thumbs up from me.

## Who are the content creators I follow
### [LGR](https://www.youtube.com/channel/UCLx053rWZxCiYWsBETgdKrQ)
A YouTube channel led by Clint that focuses on retro computing. You'll see that his channel offers quite some variety. Not only that he has old computer restorations or retro hardware reviews but he also does games review (from all ages from the 1990s to modern games), trips to the thrift stores, and gameplay videos. Also, his soothing voice and the charm of his writings especially in his review videos is a big bonus, adding an original style to his stuff. I can say that this is a channel to watch out for if you're looking anything computing-related.

### [The Coding Train](https://www.youtube.com/user/shiffman)
A YouTube channel hosted by Dan Shiffman, a programmer mostly known for his creative works with programming (creative programming?). He does streams and programming tutorials but most of the time, he solves programming and mathematical challenges. One of the best ways of learning how to solve problems is by watching one and I think this channel provides exactly that (and it's very wonderful). Not only Dan Shiffman is a very entertaining person on-stream but also he does in a way that you can learn from him. You can see how he works and plans in real-time. I recommend to give his channel a gander and see what his content is about.

-----

If you have been reading my monthly learnings or just happen to read certain blog posts, you know that I already recommended the two featured channels. I just think it's worth re-recommending them since the quality of their content (especially The Coding Train) is consistent at best and it's still one of the best at what they do. LGR for mostly retro computing content and The Coding Train for programming and the coding challenges. Their content is still worth recommending and I just couldn't find any new content creators I could recommend for this month 😅.

Also, it's that time again for SHAMELESS ADVERTISEMENT TIME!

This time, it's the first Gatsby (and React) project that I've ever done which is a simple resource list similar to [Boomkrak](http://boomkrak.com/). This time, though it's created with [my own freebies list]({{ site.baseurl }}{% post_url 2018-05-1-free-resource-list %}). Unfortunately, though with another of this freebie list means another place of a burden to maintain it so I'm officially abandoning the blog's resources list and make this project as my official go-to platform to update it. It also means I don't have to update it every single time I found something interesting so that's pretty cool.

Anyways, this project took longer than expected since I encounter a bunch of limitations, mainly: 

- a good free database (that is not Firebase)
- my horrible tool-choosing skill &mdash; I initially thought of using Django because I want to learn about it but over time it's becoming a horrible idea so... there's that lesson to pick up. 

But I did have some good things to pick up from this mess of a process: 

- I made my own lexer &mdash; It also caused me to study more about how to make effective string parsing algorithms without automatically going to regexes for it. 
- I also made my own JSON-based database management system (kinda) &mdash; I figured that since the API will have to be stored somewhere (most likely as a JSON file), I have to make sure of its integrity which is why I created my own JSON database management system (kinda), [jayson-db](https://github.com/foo-dogsquared/jayson-db). 
- I also published my first couple of npm packages &mdash; Well, because of this, I also published some packages as a way to share my things and effectively improve the project in a way that is accessible to all. 
