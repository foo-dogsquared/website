---
layout: post
title:  "Weekly Resources and Learnings #2"
date: 2018-07-17 18:30:34 +0800
author: foo-dogsquared
categories: general
tags: [programming-notes, weekly-learnings, learning]
---

Alright! Second entry, second step into this consistency of habits thing, and a second good news to me since I learnt something.
Well, I'll also a recap every now and then just to make sure I am not learning for just the sake of learning. Yeah, quite the 
nerd. Anyway, let's go in the main point of the post. 

## What I've learned this week
### Gatsby
Yeah, I think I'll go with Gatsby with this site but not definitely today. "What is Gatsby?", you might've ask? Gatsby is simply 
a static site generator (SSG) similar to Jekyll, the SSG this blog was built upon. I chose Jekyll at the time because of the 
support from GitHub Pages which will automatically build the site for you by just storing the source files, so no more the extra 
hassle of having to build the site before you store it in the repo. But in any case, I am kind of bored with Jekyll and so, I am 
trying to learn Gatsby for a couple of reasons:
to learn React (and in hindsight, Node), to learn GraphQL which is something I am curious about, and to rebuild my site. 
### Computational complexity
There is a measurement on how effective and efficient an algorithm is. But first, there are some things 
we have to be mindful of whenever we talk about these things. First, there is the dataset that the algorithm must process in. 
Let's say the algorithm takes ten, a hundred, a thousand, a hundred thousand, or even a million inputs but for the sake of 
example, we usually go with *n*. So it means the code takes *n* inputs but what counts here is the number of steps that 
block of code goes through in order to fully process the data, whatever functions it was instructed to do.

Now for the most part, we usually describe how effective an algorithm is through the Big O notation and the Big Omega notation. 
#### Big O (O)
It is the notation used for describing the worst-case runtime of the algorithm. So when we say it has a worst-case runtime of 
*n* or `O(n)` (read as big O of *n*), the maximum steps that algorithm can take is through *n* times, whatever the number of 
datasets that algorithm involves.
The Big O is usually the one that is being talked about whenever we speak of the algorithm runtimes, in general. So when we
say the runtime of an algorithm, it is usually the Big O notation.
#### Big Omega (Ω)
If the Big O notation is a pessimist, this one is the optimist. It is used to describe the best-case scenario, that is, the 
least amount of steps to fully process the inputs the algorithm has to process. Of course, the Big Omega notation has to be 
less than the Big O notation. ~~What kind of information I am typing now?~~
#### Big Theta (Θ)
When the maximum and the minimum number of steps are the same. We can describe it with the Big Theta notation. I don't know 
the 99.6% of the whole general computer science stuff but it is said that the Big Theta notation is rarely referred. Just 
bear it in mind that this exists.
#### Usual Representation
These are the usual time to describe the complexity of the algorithm:
<div class="table" markdown="1">

| Runtime | Term
| --- |
| O(1) | Constant time
| O(log n) | Logarithm time
| O(n) | Linear time
| O(n log n) | Linearithm time
| O(n^2) | Quadratic time
| O(∞) | Infinite time

</div>

### Sorting algorithms
They have different speed and different usage. Things like the selection sort, the bubble sort, the insertion sort, the merge 
sort which is my main focus for now. I haven't really written some kind of a sorting algorithm yet but I'm currently 
going for it. I'll write a more detailed version of this in the next entry of this series but for now all I can say is that 
these sorting algorithm all have the same goal of sorting through a list but they all have different ways in doing so. 
The merge sort, for example, uses the divide and conquer approach which makes the number of steps in the process to go by in 
half thus, the number of steps whenever the dataset is increasing will be minimal. While the other approach such as the 
insertion sort goes through the whole list for once and it involves manipulating the elements whilst in the process.

### Recursion
I know about recursion but I haven't still wrote a recursive function other than the factorial function and the things you 
would usually code from a tutorial. I always go through whether I have to use iterations/loops or recursion. Anyway, I have 
read some stuff that when use a recursive function when the task branches off. I know it's not really set in stone and it is 
more a guideline. 

Also, recursion, have different consequences depending on the implementation of the programming language.
For example, some languages are slower when compared to using an iterative version of that function since it consumes a stack 
frame in the memory space. In some cases, there are languages that implemented to adapt to recursive function 
like, for example, the tail call optimization wherein the function returns the value when the recursive function gets called, 
thus avoiding to allocate a new stack frame.

### Processing (the programming language)
I took some break from the usual stuff I do when programming so I quickly glanced over some stuff that is outside of whatever 
I am doing which is mostly about logic and data structures and whatnot. And I found the world of generative art. 
[Processing](https://processing.org) is a programming language that is built by the artists, for the artists. Well, it is similar 
to playing with HTML5 Canvas and [p5.js](http://p5js.org/) was apparently related with this. So far, I've followed their 
video tutorial and saw [one of the most awesome video players I've ever seen](http://hello.processing.org/) in the works, just 
saying. So far, I've fun with it. Quite the potential stress reliever for me, unfortunately, creative art is not my thing nor my 
specialty, so...

## Article of the Week
### [The Art of Command Line by *jlevy*](https://github.com/jlevy/the-art-of-command-line)
It's not an article per se but whatever, looks like one to me. 😁 Anyways, this is actually a GitHub repo that guides you to be 
a master in using the command line in one page. Sounds awesome, isn't it? This is basically a collection of tips on how to use 
a command line (specifically Bash but it can apply to other scripting shells like PowerShell in Windows, for example). It has 
tips for basics usage, system debugging, processing of files and their data, etc. You get the idea, they have lots of stuff for 
different situations.

## Book of the Week
### [The Subtle Art of Not Giving a F\*ck by *Mark Manson*](https://www.amazon.com/Subtle-Art-Not-Giving-Counterintuitive/dp/0062457713)
Another book with a self-explanatory title. I have a paperbook version of this and I'm halfway finished so at least I can say 
the full (more like half) experience of reading this. Spoiler alert, this is a book that teaches you how to see the important 
things and let go of everything else. Despite with the crude, vulgar language, the slap-in-the-face talks, and the brutally 
(as in brutally brutal) honest talk to a lot of common stuff, if you don't mind that, you'll probably see the message the author 
is giving. Honestly, the reading experience is a bit stale the further you read on but I still recommend this book for the idea 
and its quirk. If you want to not want to spend for it, here's a 
[summarized version](https://fourminutebooks.com/the-subtle-art-of-not-giving-a-fck-summary/) of it.

## Podcast Episode of the Week
### [Self-Esteem from the *SadBoyz Podcast*](https://sadboyzpod.com/episodes/self-esteem)
If you've never heard of name of the podcast series, *SadBoyz* is a podcast hosted by a pair of hosts, 
[Jarvis](http://twitter.com/jarvis) (who has a [YouTube channel](http://youtube.com/jarvisjohnson)) and 
[Jordan](http://twitter.com/jordanadika) and a guest, if they have one. This podcast is generally about almost everything, 
from careers, self issues, to societal problems. *Almost everything*, really. Also, their podcast has a 
[YouTube channel](https://www.youtube.com/channel/UCsv_tpDUp-atfn-zzcsGyIg) too that contains the video version of their 
podcast if you want to watch them speak.

## Site of the Week
### [Regexr](https://regexr.com/)
A site that focuses on regular expressions. It has features like real-time searches and results, an in-site reference, and even 
a search function for community-built patterns so you can use other people's regex. Quite the stuff if you are looking to build 
up your regex building skills.  

## Tools of the Week
### [Materials Theme by *equinosocio*](https://equinsuocha.io/projects/material-theme/)
Well, a theme is probably not categorized in the hard definition of a 'tool' but for me, it is. It can be used as a tool in 
helping you to code more efficiently because you gotta take care of your eyes, you know. Anyway, I recently discovered this 
theme from the Gatsby tutorial by Scott in *LevelUpTuts*. I find the darker+high-contrast theme to be absolutely fantastic 
especially on JavaScript files and it is quite pleasing on the eyes and now discovered the ❤ for high contrast themes. 😁
### [nativefier by *jiahaog*](https://github.com/jiahaog/nativefier)
This has been referred to me by someone on Discord (you know who you are 😀). This is a CLI program that converts web page into 
a desktop application as in an `.exe` program on Windows and similar stuff on Mac and Linux. It uses Electron (the framework 
VS Code and Atom was built upon) to make your web apps executable on a desktop system. I've used this one to convert 
[one of my projects](https://github.com/foo-dogsquared/one-for-all) into a desktop app and it is quite awesome to see your 
web page into a desktop app for some reason especially if you think your web app is much suitable to be one. But still, I don't 
think my web app is worth the [117 MB](https://i.imgur.com/jGHYJjo.png) for just being a simple app that lists out a bunch 
of input areas from a JSON file.

## Watch of the Week
### [Why our screens make us less happy? by *Adam Alter* from TED](https://www.youtube.com/watch?v=0K5OO2ybueM)
It's a TED talk by Adam Alter about the impact of using technology in our lives. Aside that it is kind of fitting for me 
since I am trying to get away with less time, I think this is a wonderful video overall. While this talk will leave different 
impact for different people, this talk can be much more valuable if you can get the message that can be applicable to you. 
For my case, I got the idea that our screens make us less happy is mostly because of the insta-culture this internet has 
implanted in almost every modern culture especially now that we can get information with a few instances of keystrokes away. 
I was about to say my whole idea that I got from this talk but it is going to take a whole new post, probably, so I'll leave it 
at that. Go watch it, you may get a few meaningful lessons from there that you can keep in mind, hopefully. 

## Channel of the Week
### [Kollektivet2](https://www.youtube.com/channel/UCBtvGVEUmTuR7bKBDT03_FA) 
A YouTube channel of a now-ended TV show in Norwegian about funny skits and funny music videos. It also has some exclusive YouTube 
content for it. Even though they have some content in Norwegian, they have English skits too, fortunately for us English-using 
people to join in on the fun. I discovered it through a random search of one of their song's lyrics (which is named a Hit Song) 
for an activity then I search for the song since I was curious for it. Then, the rest is history.

---------

Going so good so far for the second entry. As always, hope you find it useful. 😁

About the computer engineering stuff I mentioned in the previous entry. Yeah, still trying into the basics of electronics. How 
am I going to transpose it into a blog post is a main problem now, hehe. I have (almost) all of the materials ready to be a part 
of my experimental learning journey. Still finding an electronic store for other stuff. 