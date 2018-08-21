---
layout: post
title:  "Weekly Resources and Learnings #7"
date: 2018-08-21 12:57:34 +0800
author: foo-dogsquared
categories: general
tags: [programming-notes, computer-science, learning]
---

Seventh entry, I'm feeling lucky. How will my learning journey unfolds to me?

Well, I'll be now posting these learnings every month, starting from the next month, now so I guess it'll be called as "Monthly Resources and 
Learnings". It might have a different classification of sorts like I'm going to put the site, channel, and tool of the week into one 
category now. IDK, I'll take some time thinking about that.

The reason why I want to make this into a monthly basis is mainly for two reasons:
- I'll have a lot more time to write so I'll be able to write more posts in better quality. This includes my future non-learnings post such as my *Simplified!* series.
- With more time, I'll be able to focus more on learning the more complex stuff on the fields I want to get in (i.e. computer science, electronics, mathematics) as they take more time to understand those topics. This will also affect my time efficiency as I am able to manage my time better.

Having this in a monthly format means I'm now mainly reviewing what I've learned once a month but who says I can only review it once per 
month? There are still ways to review it, you know: your ol' paper notebooks, digital notebooks, recalling information once in a while, and 
testing yourself which is one of the most effective way to retain information (or at least for me). The only difference is that my notes are 
just offline.

Anyways, let's get this seventh entry on the track and kiss the weekly format goodbye.

## What I've learned this week
### More Git
Well, this week I've encountered some problems building my site on GitHub Pages (and eventually move my blog onto a new repo). I've had my 
fair share of frustration and self-reminders that I should take this as a challenge because that proves I have little knowledge with this 
thing. Anyway, I've learned a bit more about Git. The workflow of a distributed version control system (DVCS), branching, rebasing, and 
having your credentials verified since [Git can apparently be used to spoof commits](https://dev.to/agrinman/spoof-a-commit-on-github-from-anyone-4gf4)
making anyone look like that they have contributed into the scene.

Branching is a process on the workflow that flows out from the root / master branch. This is mostly used to make developing new features 
more organized and not so much of a chaotic process unlike a sole master branch that carries the burden of being the development repo which 
shouldn't be since the master branch should be used as a production code, in some cases. Then those development branches, when the supposed 
task is done, is supposed to be pull requested into the master branch. Integrating the code from the dev branch into the master branch and 
possibly fix some merge conflicts while at it. Yeah, you can tell that I don't branch out my workflow a lot.

Rebasing, on the other hand, is simply "rewriting" the history of the repo, mostly through its commits. You can erase one of the commits or 
squash them all into one commit. Rebasing also affects other files and taking you back into the state of the repo at that time of that commit 
so be prepared to fix some merge conflicts.

I'll be a little more mindful when using Git since I have to say that my practice using Git is quite bad. Putting all of the code, whether in 
development or not, into the master branch. Also with my practices, it caused some very bad events like not having a complete backup or 
restarting back into a valuable point when the code really goes bad and out of control.

### More electronic stuff
I've been digging a lot more about electronics lately that I decided to make a *Simplified!* post out of it. There's still an upcoming part of 
the post so keep an eye out for that, not like that I upload very often, anyway.

In that upcoming second part, you'll learn on what electronics is all about and the related concepts that you need to learn in order to get 
started: schematics, practical application of the theoretical parts that have been discussed on the first part, and the electronic components 
that you'll always see as a budding electrical engineer.

About the meat of the stuff, I've been learning how different electronic components work and basically reviewing the stuff that I passed off 
when I was in high school: the diodes, the resistors, the batteries, and all kinds of electrical stuff. I've been also going a bit deeper on 
using Arduino wherein I made some basic stuff that is the examples provided in the Arduino IDE. Nothing special in any way but I still think 
it's cool. Anyways, a bit of summary for each components:
- *diode* — An electronic component that lets electric charges flow in one direction. The name diode comes the fact that it has two parts, one that is positively charged or the anode which attracts the electrons and the other that is the negatively charged or the cathode which where the electrons will flow out of the component. Since there is different charges for each end, you might encounter to refer these electronic components as polarized where it refers to the distribution of electrons throughout the object but it is still electrically neutral. Also, since it has different charges for those ends, you would have to connect them in a proper way, depending on the flow of the electrons.
- *breadboard* — A tool that lets you build a circuit without permanently soldering them onto a circuit board which is exactly why they are perfect for prototyping, creating, and debugging your circuit. A breadboard is basically just organized metal strips that provides a route for electrons to build your circuit. In a typical breadboard, you would see that there are two parts: the *terminal strip* which is where you usually place your electronic components and it is electrically connected horizontally for each row except at the center, leaving two rows of metal strips per row and the *bus strip* which where you usually use it as the ground and source line, connecting your voltage source to the bus strip and connecting it to your terminal strip in order to make your circuit fully functional.
- *resistor* — An electronic component that reduces the voltage by converting electric energy into heat. Unlike diodes, the resistors is not polarized which means you can connect them in any way and doesn't have two different charges. There are different appearances for the resistor such as the [wirewound resistor]() and the [carbon film]() resistor but normally, you would see the carbon film variation with a group of colored stripes. Those colored stripes indicate the resistance value of the resistor which dictates how much of the current can it resists.
- *capacitor* — It stores the electric charge of the circuit. This is the component that your RAM in the computer relies on by representating the bits through whether the capacitor is filled or not, 0 if mostly empty or 1 if it is not. Anyways, the capacitor is mostly used to introduce time delays for your circuits. When the capacitor is trying to build up charge, that's when the circuit will fully work or something along those lines. The capacitor comes in different types but mostly we categorize them whether it is *polarized* or *non-polarized*. As you've read from the previous items about components with polarity, a polarized capacitor has a positively charged side and negatively charged side, meaning you have to place them in a correct position. Non-polarized capacitors, on the other hand, does not. As a beginner, we mostly fiddle with the non-polarized capacitor since the polarized capacitor is mostly used for the circuits that consumes fairly large values.
- *transistor* — It's basically a wire that blocks or allows electrons to pass through. It has three wires that represent the switch-like function whether the electrons will be blocked or not. Technically, the electrons are "blocked" by letting it flow into the collector, instead, where the electrons just stay there. The way on how it works is that its function will be dictated by the electrical signal. If a signal that tells the transistor to block the upcoming flow, it will rightfully do its duty and block the electrons and instead go to the collector part of the transistor. A transistor's service does not end being a switch-wannabe, it also has another function which is amplifying these electrical signals. This is where the collector part of the transistor will be used as additional energy for the signal. This is what hearing aids relies on: it amplifies sound by recieving these sounds as electrical signals and amplify it from the transistor. 
- *integrated circuit* — Integrated circuit or IC, for short, is basically a circuit that is compressed into one tiny chip. This is one of the most important component as they come in different forms and different functions. In order to understand an integrated circuit, you would have to refer to their datasheet which describes the arrangement of the components and the function of different pins as it is one of the ways how you can put some input and get some output.

## Article of the Week
#### [Follow these simple rules and you’ll become a Git and GitHub master by *Ariel Camus*](https://medium.freecodecamp.org/follow-these-simple-rules-and-youll-become-a-git-and-github-master-e1045057468f)
Speaking of Git, here's an article I found about standard practices of using Git. It's not a law or something that is set in stone but it 
is good recommendation of utilizing it in order to make the development process easier. If you're already familiar with Git and GitHub, you 
probably won't have much to learn here but in case you're in the same level of familiarity as mine, you'll learn a few tidbits here and 
there.

## Book of the Week
#### [Self Debug by *Karan Kurani*](https://leanpub.com/selfdebug/)
It's a book for those who are in software development industry at any point in their career, whether you're a professional or someone's 
who's just starting out. It is not complete yet and it might have some glaring errors here and there but the most important thing that 
we should focus on is the content. This is a book that talks about how you can improve as a software developer just not technically 
because there's still a lot of stuff outside of code that you have to deal and polish: soft skills and emotional wellbeing. There is 
also a [video from freeCodeCamp](https://www.youtube.com/watch?v=ZU1B9LGjnAA) about it so be sure to check it out, I guess?

## Podcast Episode of the Week
#### [Advice For Beginners - Tech Skills, Applying for Jobs, Focus, Imposter Syndrome + More from *Syntax*](https://syntax.fm/show/058/advice-for-beginners-tech-skills-applying-for-jobs-focus-imposter-syndrome-more)
Another week, another Syntax podcast episode. As you can tell from the long title, this is a podcast episode mainly targeted for 
beginners like me. It's a perfect podcast episode at this time. It's a bunch of tips about how you can start out as someone who is 
starting to gain a foot inside the industry house. Very good podcast episode especially that it comes from the two credible developers, 
[Wes Bos](https://www.youtube.com/user/wesbos) and [Scott Tolinski](https://www.youtube.com/user/LevelUpTuts/), both has a YouTube 
channel for their content. Really recommend this one.

## Site of the Week
#### [The Noun Project](http://thenounproject.com/)
A site that features free icons, although you can pay for it, you can still use it for free as long as you give the right amount of 
attribution to the creator. I've been using this only about a week ago when making a slight overhaul for my blogsite with the new 
icons and everything. You can find some stuff on almost everything: icon to indicate updates, notifications, or errors? They have that. 
Pretty cool stuff and pretty much worth it.

## Tool of the Week
#### [Grammarly](https://app.grammarly.com/)
It's a proofreading tool that checks and correct your grammar and stuff. Also, you can know the definitions of the words on-the-fly with this 
tool. Anyways, this has been recommended to me after giving some feedback about the pros and cons of a two-parter post (which my previous 
*Simplified!* entry is). Anyways, it also has a premium option but the free version is mostly enough for me. Although I forgot to use it 
on my most recent *Simplified!* post, I'm now working with this tool to improve on it. Well, that reminds me to make this as a habit and 
include it in my writing toolbelt.

## Watch of the Week
#### [Learning and Memory: How it Works and When it Fails](https://www.youtube.com/watch?v=a_HfSnQqeyY)
If you have a *lot* of time to watch this 2-hour video, then go ahead and watch this in one gulp or you can go and watch it in sessions just 
like what I did. Anyways, this is a video that tackles how our memory works and how it interacts with the different parts of it 
subconsciously. I found some parts of the lecture to be discussed on other references on memory, specifically the book, [A Mind For Numbers](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers)
and its associated course at Coursera, [Learning How to Learn](https://www.coursera.org/learn/learning-how-to-learn/) which I recommend a 
lot, too.

## Channel of the Week
#### [Professor Messer](https://www.youtube.com/channel/UCkefXKtInZ9PLsoGRtml2FQ) 
Professor Messer is a figure in IT industry who's pretty much known for his free IT course that provides knowledge for those who will take 
some IT certifications like the CompTIA A+ training. His videos in the site is pretty embedded from YouTube and this is where you can take 
a look on his contents. If you are someone who are siding on the software side on the computer often, you might want to take a primer on 
the hardware systems since at the end of the day, computers are basically simple yet complex arrangement of electronic components that 
makes up the hardware: motherboard, CPU, extension cards, keyboard, mouse, monitor, and so on. You don't really need to know the 
nitty-gritty details in each of the video but understanding the core of each is quite enough, in my opinion.

---------

Yup, I've moved my blog now to be a part of my site since my `username.github.io` will be a front-page now, something like a portfolio page. 
Anyways, I've also enabled the comments now because I can't activate it for some reason weeks ago and I don't know what to do.

Also, I'll just casually mention my [study playlist](https://www.youtube.com/playlist?list=PLz7wMhmjqqBzxaZPxosxdJOAhrPx9B3cw), IDK. You can 
create one for yourself if you are not quite a fan of the genre I used to listen to. We're building some positive productivity habit in here 
now.

Next plan, I'll try to automate the creation of these weekly learning posts. "If you do this task frequently, try to automate it", I say. 
I think I'm going to build this kind of tool with C or maybe Python, IDK. I'm more comfortable with C.