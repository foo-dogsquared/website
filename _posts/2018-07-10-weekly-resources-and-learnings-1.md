---
layout: post
title:  "Weekly Resources and Learnings #1"
date: 2018-07-10 17:46:34 +0800
author: foo-dogsquared
categories: general
tags: [programming-notes, weekly-learnings, learning]
---

OK! Time for some kind of an active blogging. I always tend to procrastinate about my main type of posts which is basically 
a beginner-friendly (probably) article about something that has been done for over a million times now. But as much as I want to 
make this feel somewhat professional, I also want to make it more personal --- youknowwhatImeanright?

So I'm starting this series (if you call that) for plenty of good reasons:
- helps me in building this habit of self-studying now that I have some kind of responsibility to do (I mean I can just abandon the responsibility but still... my future is somewhat on the line here)
- serves as a review for what I've learned in this week
- makes me look like an active blogger when most of the time, I'm not 😉

Anyways, I got this idea from a blog post which is also starting this similar idea: a weekly summarized post of what they've 
(because I don't know if the person's a he or she) learned that week. Probably unrelated, the same blog post also said they got 
that idea from another blog. Hooray for information sharing! 

Also, I'll link to a handful of resources that I found interesting so there's also that. Got that idea from 
[Thomas Frank's Friday Tools and Tips weekly newsletter](https://collegeinfogeek.com/), just so you know. Great! I'm ripping off 
from at least two persons with ideas. 😁

Alright, into the core content of this post:

## What I've learned this week
### C preprocessors and macros
Or at least defining a constant in C. One of the ways in defining constants in C is through a macros which are basically a fragment of code attached with a name with its name replaced with whatever the content of the macro by the time of runtime. Turns out (unsurprisingly) that these macros have different kinds, I don't know much about them yet but I'll look into it someday.
### Arrays in static type languages (or at least in C) 
They're fixed in size and memory size that depends on the type of data you're going to have in that array, and their memory locations between array elements are in consecutive addresses. Also arrays must have one type of data only, you can't combine both. Surely, there is a way on how array structures in dynamically typed languages since their arrays accepts different types of data. 
### Arrays in dynamically typed languages
Turns out arrays in some languages such as Python and JavaScript are not truly arrays at all but rather they are a list; this is especially true with JavaScript, the language I'm mostly familiar with, that arrays are also objects (well, everything in JavaScript is an object so that's a given). According to a fellow chatmate on a group chat, arrays in JavaScript are basically 
### Relation of characters to integers
Yeah, another one on C; as it turns out, the data type `char` is closely related to `int` as they are interlaced through ASCII code. When you convert an integer into the `char` data type, as long as it is in range of the ASCII values, it will be the character that matches the integer with the associated ASCII value. I'm pretty sure there will be deeper stuff than this but that's all I know for now.
### Modulo arithmetic 
I know what the modulo arithmetic does through the `%` operator on some languages like C and JavaScript but I've never thought about more use cases of it. This realization of what the modulo arithmetic can do came from the problem sets of CS50 (which I recommend you to take a quick glance if you want to get started on programming) from getting the digit in the `n`th place (even though I did it wrong, probably) and using it on data that needs repetition that comes to a circle. Yeah, shallow and wrong stuff but I'll take a closer look on it some day.

## Article of the Week
### [The Collector’s Fallacy: Why We Gather Things We Don’t Need by *Charles Chu*](https://medium.com/the-polymath-project/the-collectors-fallacy-why-we-gather-things-we-don-t-need-9a55ef9979ef)
An article that hits me right in the heart. As a self-learner trying to get as much resources as possible, I'm guilty of this in 
lots of ways: bookmarking links, downloading e-books, saving videos and posts, and whatnots, you name it! Chances are, I did it. 
Phoenix Wright would probably do his trademark "OBJECTION!" right away about my crimes of obsession of collecting stuff at the 
very start of the session. I'm trying to do the things he did such as reducing those junks (also trying my best to not get 
sentimental with it). I'm not going to delete my e-books, though. Those precious bandwidths just gone for nothing? I rather store 
and share them, that's a lot more helpful, surely.

## Book of the Week
### [High Performance Habits: How Extraordinary People Become That Way by *Brendon Burchard*](https://www.amazon.com/dp/1401952852/?tag=gooseducmedi-20)
Self-explanatory title, yeah. It gives you insight on how to be consistently best (not constantly best, those are different) at 
times you're doing what you're supposed to do for your work or for yourself in order to gain success. I did not buy an physical or 
an e-book version of it but rather I went through the 
[summarized version](https://www.actionablebooks.com/en-ca/summaries/high-performance-habits/) of it. Still, if you want to dwell 
deeper, you can buy the book.

## Podcast Episode of the Week
### [How to Take Criticism from the *College Info Geek Podcast*](https://collegeinfogeek.com/criticism/)
A gift in perfect timing for me. In this episode of the podcast of College Info Geek, the two hosts (Thomas Frank and his co-host) 
gives their insights on the subject, taking criticisms. As expected from their podcast, I find this one to be good and 
spontaneous, speaking from their experiences to further cement their advices and insights to be absorbed by you, the listener.

## Site of the Week
### [Deconstructing Excellence](http://www.deconstructingexcellence.com/)
It's a site that contains the summaries of thousands of books submitted by its members. 
Yeah, Actionable Books from the previous link is also one but I find it a bit low on choices. Anyway, Deconstructing Excellence 
has ton of choices of good books (what I mean on good books is related to self-management) like 
[How to Win Friends and Influence People by *Dale Carnegie*](https://www.amazon.com/How-Win-Friends-Influence-People/dp/0671027034),
[The Power of Habit by *Charles Duhigg*](https://www.amazon.com/Power-Habit-What-Life-Business/dp/081298160X), and more.

## Tools of the Week
### [Wakatime](http://wakatime.com/)
It's a time tracker tool for how long have you been coding. This tool comes as an extension to a plethora of code editors such as 
Visual Studio IDE, Brackets, Atom, and Sublime so most chances are, you can get your hands on this. Also, you have to create an 
account but it's worth a shot.

## Watch of the Week
### [Thinking like a Programmer from *O'Reilly*](https://www.youtube.com/watch?v=LjiYNyI8Ap4)
It's an insightful interview with Allen Downey, author of several free books from [Green Tea Press](https://greenteapress.com/wp/).
He explains how writing code can help into that programmer's mindset and set some experiences as examples of that concept (which 
is cool since it is adding authenticity with the message he's trying to express). I've been searching some insights on how to get 
into the programmer's thinking for a while now and I think his interview hits the nail on the answer. 

## Channel of the Week
### [Vinheteiro](https://www.youtube.com/channel/UCSE6yilNScIz1SLTNQvrXMw) 
He's a pianist with a YouTube channel with videos that features songs from video games, animes, TV shows, memes, and all things 
between. IDK, I'm just amused by this guy. You'll see why once you've seen enough of his content.

---------

Well, hope you find the first post in this series useful. 😁

I'll be sure to myself to keep this up consistently throughout at least for the latter half of 2018. So I guess that makes it 
23 more of this, yeah? 

Right, I'm also trying to push some computer engineering stuff now that I'm studying as a computer engineering student. So 
there's that unrelated thing... Just gotta find a decent electrical store that sells computer engineering stuff and I'll be good 
to go, probably. Ah well, whatever the case, I'll try to have some computer engineering mixed in here.