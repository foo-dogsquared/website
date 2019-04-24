---
author: foo-dogsquared
categories: "self-learning"
date: 2019-1-4 19:13:45 +0800
layout: post
tags: [programming-notes, monthly-learnings, learning]
title: "Monthly Resources and Learnings (December 2018)"
---

## What I've learned
### Databases
Well, the formal notation of databases, anyway.

A database is basically a list of anything. From a list of flowers, categories, colors, countries, [lists](https://github.com/sindresorhus/awesome), planets, stars, criminals &mdash; anything, really. 

Speaking of lists, let's say that you are shopping materials in order to start with our more secure note-taking sessions because you are a determined student. 

The list might be a simple one that simply lists the materials but we may add more information to it: the quantity of the item, the size of the paper, the color of the item, specific brand, etc. 

![A shopping list]({{ 'assets\pictures\self-learning-series\december-2018\material-shopping-list-analogy.png' | relative_url }})

We follow through the list and react accordingly when we encounter new information. If we got one of the item in the list, we either cross it out and update it as something that it's done. Otherwise, we just have to make a workaround on that &mdash; getting an alternative product, for example. 

A database inside of a computer program usually works in the same way. With information on hand and always being used, the data inside of the list can be changed quite frequently. Like how our materials shopping list may not stay exactly the same or end up in the way we expect because of several factors like availability, affordability, quality, among other things. 

Let's get into the formal definition of a database. **A database is a collection of data that is organized in a certain way.** It hold a collection of entry points called a record which it contains an array of data called attributes. These attributes could be represented as the characteristics, the parts of the schema, or as any abstraction as you could abstract.

For a more complete notes about databases (and beyond databases), you can go to [my notes on databases right here on my remote notebook (when it is available 😁)](#).

### Code testing and test-driven development
Code testing is something that I'm not totally familiar with. I only tend to do it in the middle of the process, coding the program as I imagined it. Well, the development process of my previous side project, [automate-md](https://github.com/foo-dogsquared/automate-md), slapped me right in the face to know how important making tests are. It resulted in quite a mess especially with creating additional features and maintaining them. So I looked into code testing and its formal notation.

Code testing is quite an important aspect of programming. Of course, we are prone to making mistakes thus we need a way to test out our work. It's really just the concept of testing mixed in with code. But let's make a level-up of our understanding, shall we.

Coding programs is really another process of creating a product. From there, you plan out the process, pick the tools and materials, draw the blueprint, build foundations and supporting components, and give the finishing touches. In order to ensure that your product is at least in the reasonable quality, you have to test it to figure that out.

The process of testing depends on your approach on the way to realizing your product. You might do testing after you build or even before you build. The do-the-testing-after-you-build approach is the common one, mostly as an afterthought. Meanwhile, the do-the-testing-before-you-build approach is what we're going to talk about and indeed it has its term, *test-first development* (TFD).

Test-first development, as indicated by its name, is the approach of developing programs by building tests first before we start actually starting the development process. 

![Test-first development workflow]({{ 'assets\pictures\self-learning-series\december-2018\test-first-development-workflow.png' | relative_url }})
<p class="caption">Test-first development workflow</p>

A repetition of this process throughout the development process turns test-first development into test-driven development. A very simple way on how to think about this revolves around the phrase, **red, green, refactor**, as you'll see why that is. 

![Visualization of the phrase]({{ 'assets\pictures\self-learning-series\december-2018\red-green-refactor.png' | relative_url }})
<p class="caption">Visualization of the phrase</p>

The core of this technique revolves around these three phases that are indicated in each word of the phrase:

- understanding your use cases and writing (failiing) tests for it
- making those tests to pass
- revising or refactoring the functions

Being an approach that focuses on the tests, creating quality tests is a very helpful thing to look out here. Having tests of such quality are said to be: 

- independent of each other (that said, tests should come with a pre-configured state)
- run in isolation
- test one thing
- clear and concise
- execute fast

There are other factors to consider such as the external dependencies being mocked, can use real data when needed, and represents one goal in your process. With this type of tests, you should have a smoother development experience.

Simply put, test-driven development is simply a technique that lets you focus more on the design and requirements of your program by implementing tests first before you dive into the coding ocean. After actually implementing the code, you could refactor if needed or revise your code if it fails then re-test it.

If you want to have a clearer introduction, head on over to [main](https://github.com/dwyl/learn-tdd) [sources](http://www.agiledata.org/essays/tdd.html) I referred to. I'm also planning to get this one into my personal notes so keep an eye for that, if you want.

### Continuous integration systems
I got a question: how many times have you bombarded with [this video](https://youtu.be/b2l4zTS8lPg) before? ~~Am I one of the few who've been always greeted with this ad?~~

Anyways, to end this feeling of doubt and curiosity, I investigated further on what is a continuous integration system is on a deeper level. This is also done on a timely scale as I'm also learning test-driven development. 

A continuous integration (CI) system is basically a security guard for the codebase. It does things like alerting the developer team, check for the status of the code, initiate tests for them, etc. (not all security guards have those responsibilities but you know... 🙃).

Like a security guard, you would have to "hire" (install) a CI system. Well, just like the process of hiring, you have candidates to choose from: CircleCI, Travis CI, Jenkins, and many other more. You could also create it yourself, if you want and have the patience.

Using a CI system is one way on how to effective use code tests. In certain situations where everyone has their clone of the source code, they would have done some testing on their own machine.

![CI system example workflow]({{ 'assets/pictures/self-learning-series/december-2018/ci-system-workflow.png' | relative_url }})
<p class="caption">CI system example workflow</p>

However, this also opens up the possibility of someone forgetting to test whenever they contribute into the codebase. Wouldn't be easier if there is one central server that can check and test their contribution? That's what modern CI systems thrive to solve.

CI systems could be integrated with a remote repo which can make deploying apps easier. With this, you could go with a more automated workflow which means less manual errors (and also work burden with testing it out yourself). For team situations, it also has the added benefit of reducing integration problems which is quite common as expected.

This is not only easier for doing collaborative works but it is also nice for solo developers. They would spend less time debugging. In turn, it would add more time adding features and maintaining the codebase (or more relaxing time 🙂).  

## What I've been reading
### [Intuition Isn't Optional from *Better Explained*](https://betterexplained.com/articles/intuition-isnt-optional/)
It's an article that explains the insight of setting a higher standard for your learning. The author gives you new ways on how to set such standard, mainly by studying famous learners and by asking questions. I think that this is an insightful writing that teaches you how your standard of learning can influence your effectiveness at learning. Overall, the article is pretty short and you should be able to read in less than 20 minutes at the very least.

### [Learn Difficult Concepts with the ADEPT Method from *Better Explained*](https://betterexplained.com/articles/adept-method/)
Yes, another article from [Better Explained](https://betterexplained.com). It's a primer about the method that is being applied on their technical articles: the ADEPT method. Backronyms aside, it's a very useful addition to keep in mind with using the Feynman technique but really, you can use apply this method pretty much everywhere on the way that you view it. This can be a very useful way for me to take notes especially for my note-taking system that I'm trying to experiment with and it is a superb way to make summaries out of it. 

This can help you to break down difficult ideas into a more comprehensive and concrete stream of information. It is especially useful for abstract sciences like mathematics, logic, and computer science.

Here's the summary of the article: **basically when learning a difficult idea or trying to teach it to others, go with the more concrete stuff first and then you can get to the technical side**. To help you do that, the author had created a simple strategy to get you started: the ADEPT method. Each letter in the spelling stands for something:

| A | Analogy
| D | Diagram
| E | Example
| P | Plain English
| T | Technical description

Interestingly, it goes with the usual opposite of how I did. I would go with the technical description first and then I would draw similarities to the more concrete stuff in order to make the learning stick around a bit better. I like this approach better and I think I found a new approach to teaching that I could use which is the progressive way of teaching: starting with the rough analogies and concrete ideas then getting into the technical definitions. 

### [Starting a blog by *Ferruccio Balestreri*](https://ferrucc.io/posts/starting-a-blog/)
Well, yeah, it's about starting a blog. It includes useful insights for me. I think it's high time to level up my writing skills and my blog. Unlike my current writing which includes every necessary detail of a concept as much as possible, I'll try it out with a new style: to be brief and concise. I really think it's not that good anymore for me to adhere to that style (or maybe I'm missing out on something on the process itself). Besides, I already have an online version of my notes, too, which [I freely share in a GitHub repo](https://github.com/foo-dogsquared/a-remote-repo-full-of-notes-of-things-i-did-not-know-about).

## What I've been listening to
### [How to Choose What to Learn from *MetaLearn Podcast*](http://www.metalearn.net/podcasts/ml97-how-to-choose-what-to-learn)
Hey, a new podcast series! This is an episode from [Metalearn podcast](http://www.metalearn.net/podcasts), a podcast series that focuses on metalearning (the skill of learning how to learn), as indicated by its name. It is hosted by Nasos Papadopoulos (now that's a name right there), the main man behind the [Metalearn website](http://www.metalearn.net). Kinda similar to [College Info Geek](http://collegeinfogeek.com/) in terms of content, Metalearn also offers [related articles](http://www.metalearn.net/articles) on the skill of metalearning. 

About what the episode is about, it's about choosing what to learn, obviously. The episode offers a lot more on that, though, as the host gives you the practical viewpoint from the process of choosing and learning how does your decision can make or break. That particular perspective is one of the best ways on how to discuss such topics so I really recommend to give it a listen.

After you passed listening on the episode (and hopefully jotted down some noteworthy notes from it), [you can check out my notes and takeaways from the episode](https://github.com/foo-dogsquared/a-remote-repo-full-of-notes-of-things-i-do-not-know-about/blob/master/podcasts/metalearning/metalearning-97-how-to-choose-what-to-learn.md), as well. Don't forget to share it with me on your notes, pretty please? 😁

## What I've been watching to
### [Unit testing in JavaScript series from *Fun Fun Function*](https://www.youtube.com/playlist?list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr)
Yup, it's a video playlist of unit testing (with JavaScript) from [Fun Fun Function](https://www.youtube.com/channel/UCO1cgjhGzsSYb1rsB4bFe4Q), a YouTube catering to developers, beginners to advanced. It is hosted by Mattias Petter Johansson (also known as [mpj](https://twitter.com/mpjme)), a full-time developer. You might also recognize him as he eventually became a co-host on [DevTips](https://www.youtube.com/channel/UCyIe-61Y8C4_o-zZCtO4ETQ), a programming YouTube catering to the beginners.

Anyways, as self-explanatory as to what the playlist will be about: it's about unit testing. It shows you the typical what and how but most importantly the why which is the very first thing he discussed in the [first video of the playlist](https://www.youtube.com/watch?v=Eu35xM76kKY&list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr). Of course, I recommend to go through the playlist according to the part number. It's running at a total of less than 3 hours but there are still some interesting things in there, mainly with the dialogue 😉.

## What tools I want to share
### [StackEdit](https://stackedit.io/)
It's an in-browser markdown editor that lets you edit markdown files on the web 🙃. It also has offline functionalities so it can also act as some sort of an desktop or native app in your machine. Quite handy, if you ask me.

Anyway, it has your standard markdown text editor features: rendering your markdown file into HTML, markdown syntax preview, and an intuitive workflow. You can also sync with your Google account so that you can synchronize, import, and export it there. That's not all, folks! It has a whole *lot* of features, especially on linking your online writings with your different accounts. Want to store them in a GitHub repo? No problem, they have one. You can even synchronize your repo into the app. Want to publish your post from there? They have a built-in option for that too, featuring a couple of blogging platforms with Wordpress and Blogger. Want to publish them as a GitHub gist instead? Sure, they have one.

You can see that they have quite a list of features there. I found it very handy on being my editor for my notes which has [its own GitHub repo](https://github.com/foo-dogsquared/a-remote-repo-full-of-notes-of-things-i-did-not-know-about).

Lastly, StackEdit is, of course, free and open source. It has its source code [on public](https://github.com/benweet/stackedit/) so you can see the assurance of safety from others. It also has [a Chrome extension](https://chrome.google.com/webstore/detail/ajehldoplanpchfokmeempkekhnhmoha) that makes Google Drive integration goes up to eleven.

Word of warning, if you're sensitive with handling your contributions (like me), you may not want to synchronize one of your GitHub repo and just use the publish feature to the repo, instead. You'll be having a *lot* of unneeded contributions which sounds good for most people but really, a crappy way of boosting up your contribution list.

## What sites I've been visiting
### [Better Explained](https://betterexplained.com)
If you already read the readings of the month, it kinda gets repetitive now, doesn't it? 🙃 Seriously, from the first time I found content from this site, I'm absolutely loving this site. So much that I already recommend it on the month I found it (usually I would give it a month or two before I personally recommend it).

It's a site that mainly focuses on explaining concepts in order to make you better understand an idea through an intuition-first and progressive approach. How the site explains its concept is just like what the founder of the site said, "There’s no pretenses, no fuddy teacher, just an excited friend sharing what actually made an idea click". It mainly represents one of the famous quote of Einstein which is simply [one of the many philosophies](https://betterexplained.com/philosophy/) that they adapt.

In this site, it mainly tackles explaining mathematical concepts among other things with the intuition-first and progressive approach as supposed to the traditional baseline approach. It also gives you tips on the art of learning and how can you adapt the mindset of the author with their progressive way of teaching. One of my favorites articles out there is the first one that I found which is about [learning difficult subjects with the ADEPT method](https://betterexplained.com/articles/adept-method/). It's a pretty neat website about learning that specifically tackles mathematics and how you can go learning without leaning much on rote learning.

### [OpenStax](https://openstax.org/)
One of the best finds I have ever found on this my first year of hunting high-quality open access resources. I can't seriously describe it in words of how awesome of what this organization offers.

Anyways, this is the site of OpenStax, a non-profit educational initiative based of Rice University. It provides high-quality open educational resources for students and instructors alike. It is also backed up by large philanthropists and organizations such as Bill and Melinda Gates Foundation, National Science Foundation, The Open Society Foundations, and Google. 

Their main offerings is their [little library of books](https://openstax.org/subjects) authored from the organization itself, openly licensed and peer-reviewed by experts in the field of varying disciplines. Best of all, their library is still expanding &mdash; adding more books on more subjects and revising current books to be more updated and fixed, in case of errors. 

### [Music For Programming](https://www.musicforprogramming.net/)
This is a very cool find. I found this one on a [dev.to post](https://dev.to/hus_hmd/favourite-albums-to-listen-to-while-coding-25fb) discussing their favorite albums to listen to while coding. It's an episode list of albums which each episode is a music playlist compiled by somebody. I have only listened to only 2 episodes so I can't really tell the full experience but so far, most of the music are quite suitable for coding tasks at least in my experience. Most of them are basically ambient electronic music that really suits the nature of computers (because electronics and stuff).

What's more, this large album spanning of 52 episodes accumulating a total playtime of 56 hours so you really have a big selection of music here with each episode averaging at least an hour. I can only recommend this if you have a taste in ambient electronic music or just wanting to try new music. If you are looking for more stuff, you can look at the dev.to post I've linked earlier. I also found [another dev.to post which discusses music genres for different situations](https://dev.to/petermbenjamin/what-genres-do-you-listen-to-2h68) and mainly find in the discussion part of the post.

## Who are the content creators I've been following
### [Nick Zammeti](https://www.youtube.com/channel/UC3-0S7vXfwYY2jj5EkMpymA)
Nick Zammeti is a maker who mostly creates crafts with wood, resin, and a lot more. You'll notice that he's a little... funky at times and that what it makes him very entertaining. Also since it is an art YouTube channel, expect that they go a lot of ways for a lot of crazy stuff ranging from making an amazing bowl to creating experiements with the funkiest materials combination. 

### [The Taylor Series](https://www.youtube.com/channel/UC7590VTWe6m0kq3gJcgLINg)
The Taylor Series is a YouTube channel that focuses on getting the intuition on different mathematical concepts, similar to [Better Explained](). Yeah, the name of the channel refers to the [Taylor series]() and also acts as a pun from the owner of the channel, Derrick Taylor.  Compared to Better Explained, this one focuses a lot more on the crazier and more advanced side of mathematics. From looking at what inverse functions really is to knowing what the heck are things like tetration, you could pick up lots of mathematical insights from this channel. For a YouTube channel with less than twenty-thousand (20,000) subscribers, the owner of the channel sure has high production value for his videos.

### [The Beginner DEV](https://twitter.com/TheBeginnerDEV)
Now this is something different, it's a Twitter account. 🙃

It's simply just a variant of the official [dev.to](https://twitter.com/ThePracticalDev) that targets beginners as their main demographics. Content that can be found from this account is basically dev.to posts that are targeted for beginners (or at least dev.to posts that has the `beginners` as one of their tags). Overall, it's basically a neat shortcut when coming from Twitter in order to get browsing the beginner-friendly posts of the Practical Dev community. Otherwise, you can just browse post in the [site itself](https://dev.to) following the `#beginners` tag.

-----

I say that I'm officially got lazy at writing these stuff, hehehe...

Seriously though, I feel that my major writings such as the *Simplified!* series and the monthly learnings and resources should not go over at least 30 minutes worth of reading time. I'm dedicating to change my writing style towards my technical content. So I'm asking you to give some feedback towards my future content, pretty please. 