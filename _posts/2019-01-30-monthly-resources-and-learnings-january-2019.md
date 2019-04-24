---
author: foo-dogsquared
categories: "self-learning"
date: 2019-01-30 15:10:05 +0800
layout: post
tags: ["monthly-learnings", "learning"]
title: Monthly Resources and Learnings (January 2019)
---

## What I've learned
### Cookies and session management
There are quite a lot of resources of what is cookies and session management but I'll try my best on explaining that.

The internet is made up of servers that listen for requests coming from a device and respond accordingly. There are a lot of ways on how to make two (or more) devices to communicate between each other but the web mainly uses [HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP), a stateless application-layer protocol. Being stateless means that requests does not relate to one another and incoming (and previously occured) requests will get the same response no matter what. In other words, no information is retained between the two machines. The client request a page, the server responds with the webpage, and the client receives the page sent by the server. Repeat that a thousand times and the process and the result will be the same no matter what.

With web applications that needed stuff like user accounts wherein the server has to remember the state of the user, how do we solve this?

As you can tell from the header, with cookies and sessions!

Web cookies (for clarification) is a small piece of information sent by the server that is stored by the client. In the next requests, the client will send a request with the cookie attached and that is where the server will be able to keep track of it (although not securely keep track of it). 

<img src="{{ 'assets/pictures/self-learning-series/january-2019/server-client-diagram-model.png' | relative_url }}" alt="Simple client-server model with cookies">
<p class="caption">Simple client-server model with cookies</p>

Basically, think of the web cookies as an ID for your school. When your application request for the school has been accepted (and passed the prerequisite tests), you're now a student of the school/university/college/whatever-educational-institution-that-may-be and you'll granted a student ID as part of recognizing you as a student of the school/university/college/whatever-educational-institution-that-may-be. The next time you'll visit the school, you may be get checked for your ID in order to validate that you're a student of the school/university/college/whatever-educational-institution-that-may-be and continue your way in to do school-related stuff such as checking for your fees, entering classes, and other school shenanigans that requires the previlege of being a validated student of the school/university/college/whatever-educational-institution-that-may-be.

Cookies can contain pretty much any information. You can go and send a cookie that contains a link to [your website](http://foo-dogsquared.github.io/), [your YouTube channel](https://www.youtube.com/channel/UCuMiU9bzATu5oTp-vhOlL2Q), [your GitHub account](https://github.com/foo-dogsquared), pretty much anything. It has one problem though and that it is visible for your client. Not only visible but also editable. What if you don't want to let your smart visitors to edit certain data?

That's where sessions will come in.

A session is basically a way to hide those very precious data. A session also lets a request to relate to other requests. As previously mentioned, HTTP is a stateless protocol which means that the information between client and server does not retain. With sessions, the server may remember that you visited the same page under the same IP address. Or the server may remember that you logged in as user `DEFINITELY_NOT_A_SPAM_ACCOUNT` for your ~~spam~~ activities.

One basic implementation of a session is with a database. Let's say that you have a database of users with their username, email address, and their password (hashed, of course). Then a visitor tried to log in and entered their account credentials (their username and password, for example) and it hit a jackpot with one of the user in the users database. In order to make that request with the correct credentials associate with the user from that point. You can generate a random string and store it in the session database then send that generated string as the session ID cookie to the client. As long as the visitor has the valid session ID, they would continue to explore the website as a user.

<img src="{{ 'assets/pictures/self-learning-series/january-2019/session-store-implementation.png' | relative_url }}" alt="Basic implementation of server-sided sessions">
<p class="caption">Basic implementation of server-sided sessions</p>

There's one thing with sessions, though. They're designed to be temporary. Sessions need to have an expiration. In cases that you didn't set an expiration for a session means that a hacker may just get a session ID and hijack the user. While the chances may be low (also depends on a lot of factors), it's still a possibility. You may just set the age of a session to be shorter though that will affect the user experience. Overall, it's a decision that you (and your team, if you have any) should consider to balance the security and the UX.

Back to the school/university/college/whatever-educational-institution-that-may-be analogy, the session store/database here will be the student database that got accepted in the current academic year. Your student information will not be in the database and will "expire" until the next academic year. Of course, you can still make your session not expire by enrolling for the next year. 

When you've enrolled and accepted as a student of the school in the next academic year, you'll be granted a school ID (remember what that represents?) that'll serve as a way for the school to verify you as a student. Now, you think you're safe and all but you still have potential issues to encounter as a verified student since the school only verifies you as a student as long as you have the ID (stupid, I know). 

If somebody stole that ID and entered the school trying to pose as you, it may get problematic. They may intentionally drop your grades, do malicious things, get you ostracized, and basically ruining your experience in the school. And now you find yourself miserable seeing the school from the distance, teary-eyed from thinking that your dreams may be crushed &mdash; but let's not get too far with the analogy, shall we.

In summary, cookies and sessions are things that make HTTP stateful. Web cookies is like your school ID to verify that you're a student of the school/university/college/whatever-educational-institution-that-may-be and the sessions is like the status that you got accepted and it what makes you granted the school ID in the first place. Without these two things, user tracking would not be possible (or at least very hard to do so).

### More about databases
My January project (which I'll post about it soon) utilizes a database that'll be filled with user information and a database for sessions. The prototype of the app uses a SQL-based DBMS called [SQLite](https://sqlite.org/) (which is quite stupid, I know) but I eventually found a not-stupider solution which is [MongoDB](https://mongodb.com/) but I found it very clunky to use since MongoDB is not that strict; it does not require a structure or a schema and it embodies of being dynamic (though it is the purpose of NoSQL databases, after all). 

So I used [Mongoose](https://mongoosejs.com/), an object relational modelling library (or rather object document modelling) for MongoDB. I used it because MongoDB is the easiest database that I found to get started on the go and because I need those boilerplate features like the validation, middleware, population, etc.

At that point, that's where I understood a bit more on the overall database. Basically, different databases have different data models that serve different purposes. In the case of SQL-based database management systems like SQLite and the more prominent examples for developing web apps such as [MySQL](https://www.mysql.com/) and [PostgreSQL](https://postgresql.org/), they are more suitable for querying large quantities of data.

What's so cool with databases is that it's like any other tool &mdash; you can use two or more, if you want to. 

If you go with a multi-database setup, you can put low-value but high-in-quantity data like logs (not this [log](https://images.pexels.com/photos/109568/pexels-photo-109568.jpeg?auto=compress&cs=tinysrgb&h=650&w=940)) in SQL-based DBMS and you can put high-value and big-sized data like user information and user images in NoSQL databases like MongoDB. Like I said before, different databases have different purposes. If you like to quickly prototype and make it up and running, you can go with MongoDB or other NoSQL databases with dynamic schemas. If you like consistency among your handled data, you would probably go with MySQL or another SQL-based DBMS.

## What I've been reading
### [25 years of coding, and I'm just beginning by *DeChamp*](https://dev.to/dechamp/25-years-of-coding-and-im-just-beginning-442n)
It's a [dev.to](https://dev.to/) post about putting your fears and perfectionism aside that has gone viral on the dev.to community and [other communities (or rather, community)](https://news.ycombinator.com/item?id=18946712), as well. It's quite fitting that the post about putting your fears aside by a person who mostly put his fear aside to post about this stuff has gone viral. Speaks a lot about ourselves (including me), doesn't it? Anyways, you should read both the discussion threads from [dev.to](https://dev.to/dechamp/25-years-of-coding-and-im-just-beginning-442n/comments) and [Hacker News](https://news.ycombinator.com/item?id=18946712). IDK, I picked up a lot of perspective (and reminders) there. It's just good to see these perspectives coming out from other people. It's a perspective-fest, I must say.

### [Algorithms by *Jeff Erickson*](https://algorithms.wtf/)
A casual book along with a casual redirecting hyperlink. What could go wrong? It's a book on algorithms and data structure. Yeah, that's all I need I say but it does have some attractive points. First and foremost is its writing. I already mentioned what it is &mdash; it's (mostly) casual. Second, it offers challenging problems (at least to me) and I hate/love it. Casual + challenging = much love and recommendation from me, 'nuff said.

## What I've been listening to
### [Self-Awareness and Intellectual Honesty from *Developer Tea*](https://developertea.simplecast.fm/0c32d85b)
Another [Developer Tea](https://developertea.simplecast.fm/) podcast episode. This time it's about, well, self-awareness and intellectual honesty (and dishonesty). I absolutely think that this is a good listening moment (also it's only about 15 minutes long so...).

## What I've been watching to
### [CS50 Web Programming](https://www.youtube.com/playlist?list=PLhQjrBD2T382hIW-IsOVuXP1uMzEvmcE5)
Yeah... It's another YouTube playlist. This time, it's from CS50's course on web programming with Python and JavaScript. You can also find this in MOOC format as a [HarvardX course on edX](https://www.edx.org/course/cs50s-web-programming-with-python-and-javascript). Anyways, it continues where CS50 has left off. Even though I technically finished the prerequisite course, I still decided to give it a try since I've been web developing for a bit and see more perspectives on it. Here you'll learn to program web apps with Python and JavaScript (obviously coming from the edX course) but you'll also learn some things along the way like continuous integration, version control, scalability, security, and a bunch of bread-and-butter when it comes to web development. This course really takes the cake when it comes to a course of breadth, specifically on web development. 

If you're truly new to the world of programming, may I recommend you to a MOOC course on [Harvard's CS50](https://www.edx.org/course/cs50s-introduction-computer-science-harvardx-cs50x), arguably their most famous MOOC. Like the aforementioned Harvard's web development course, this mostly has a focus on breadth when it comes to computer science concepts which I think it'll help very well especially if you want to pick up at a quick and good rate (if you put effort, obviously). 

### [My First Line of Code: Linus Torvalds](https://www.youtube.com/watch?v=S5S9LIT-hdc)
It's a short video about the first lines of code made by Linus Torvalds (the answer may suprise you!), you know the guy that made [Linux](https://linux.com/) and [Git](https://git-scm.com/). It's quite cool to see how influential figures like him firstly go into what them into the hall of known names, seeing these types of videos is quite relaxing for some reason. Ehh... I just want to note about it.

## What tools I want to share
### [Cygwin](https://cygwin.com/)
I generally look out for platform-agnostic tools but I make exceptions from time to time (I think). This one is a Windows-exclusive tool so if you're not an affected audience then freely skip this one unless you have other reasons. Anyways, it's a program that lets you have a Unix-like environment for your Windows machine. 

Yes, there are options like the [Linux Subsystem for Windows](https://docs.microsoft.com/en-us/windows/wsl/install-win10), virual machines, containers, and the good 'ol Linux installation on your machine but if you're lazy like me that doesn't want to fully migrate their OS for various reasons and have a slow internet connection, well here's a good option. Though like any other balancing options, there are things that you have to keep in mind: 

- First and foremost, as one of the first things that the site says, Cygwin is not a way to run native Linux apps. You have to build the source by yourself (which is a cool experience in it of itself). 
- Second, it's not a way for Windows app to make use of Linux functionalities. 
- Lastly, it's not a full-time Unix environment. Even though I'm not sure but a part of me tells that there are going to be differences between a native Unix environment and the Cygwin environment. Whatever that is, you just have to keep that in mind.

### [Entr](http://eradman.com/entrproject/)
Big shoutout to [Emgo, an acquintance and colleague of mine](https://github.com/Emgo-Dev) introduced it to me. *ENTR*, stands for "Event Notify Test Runner", is a CLI tool/utility that watches for immediate updates for your files. It sounds like any other file watcher programs but what's so great about it that it's not a package for some software that you have to install first, it's a standalone program (although you have to build it for yourself). Which means you can integrate pretty much everything with it as long as the program allows. Want to autocompile some C++ after immediate saving? You can do that! Want to reload automatically to see immediate feedback of the changes you've made in a CSS file? See if you can, my man! But let's not limit ourselves to programming-related task, you can do a bunch of stuff outside of that. Want to notify your changes? Yes way, Jose! Want to autocompile your TeX files into a PDF after each save (sounds CPU-heavy, though)? Yeah, why not. Want to automatically echo the results of a calculation from a prompt? Maybe, IDK... You'd be the judge.

Anyways, I think it's not wise to follow the words of someone whose newly using this tool (READ: me) so I'll introduce you to a [more proper introduction video on the tool](https://www.youtube.com/watch?v=9KAp_zWeI34) (which is also where Emgo introduced it to me) by [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA).

## What sites I've been visiting
### [Old Book Illustrations](https://www.oldbookillustrations.com/)
It's a site that contains illustrations with the style from old publications from the 18th century or less (well, there are still copyright to deal with). Heck, I think most of the illustrations here are legitimately came from the old books as a lot of them do come with the scan of the illustration (I mean that's what indicated by their [About section](https://www.oldbookillustrations.com/about/)). Aside from old book illustrations, they also provide biographies, articles, and other relevant information with the illustrations. So yeah, this is not only a image collection of illustrations of the distant centuries but it is a preservation site for it.

### [iconmonstrs](https://iconmonstr.com)
This is a site that offers more than 4000 free icons that are designed and created by one creator. That's quite a project right there. This is such a high quality site right here. Icons can be downloaded in various formats or just copied as an SVG or in base64 encoded text. Aside from general icons, it also contains popular brands like Twitter, GitHub, Instagram, and so much more. Aside from all of that, the site also looks cool.

## Who are the content creators I've been following
### [CS50](https://www.youtube.com/user/cs50tv)
If you're trying to learn programming with online resources, you've most likely heard of CS50. It's the name of the introductory computer science course that Harvard University offers over on [their site](https://cs50.harvard.edu/) (or on [edX](https://www.edx.org/course/cs50s-introduction-computer-science-harvardx-cs50x)). It eventually became one of the famous online course out there especially when it comes to computer science. Anyways, the CS50 staff also maintains a YouTube channel (which is the link provided for this section). This is where most of their content goes first. Their newly revised [CS50 course content](https://www.youtube.com/playlist?list=PLhQjrBD2T382eX9-tF75Wa4lmlC7sxNDH), for example, came out on their YouTube channel for so long way before it was release on the edX site on New Year. Aside from that, it also contains exclusive YouTube goodies to incentivize you on subscribing, probably. They have the pre-release version of the latest lectures, Twitch streams, and extra stuff along the way.

### [LOOK MUM NO COMPUTER](https://www.youtube.com/channel/UCafxR2HWJRmMfSdyZXvZMTw)
It's a YouTube channel with a weird channel name but very interesting content. You can get an impression of the channel by the name alone, that's all I can say. Anyways, it's being managed by an inventor and musician who's content all about creating crazy musical inventions and machineries. You have creating a [electronic keyboard made up of Furbies](https://www.youtube.com/watch?v=GYLBjScgb7o), [a machine that lets you play eight Tetris games simultaneously](https://www.youtube.com/watch?v=G1MsFDIWOqQ), and [circuit bending](https://www.youtube.com/watch?v=ChF10feen04), one of the rarest forms of bending in this day and age. Do I need to describe more?

### [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA)
Another YouTube channel that focuses on tech. This time lead by the titular [Luke Smith](https://lukesmith.xyz/), a developer or something. Anyways, here are some of the 💯🔥 legit 🔥💯 reasons you should subscribe to him:

- occasional memes 
- listed [PewDiePie](https://www.youtube.com/user/PewDiePie) as one of the good channels
- tech channul

Seriously speaking, this guy has good content related to tech. He does have occasional profound content, tool tutorials, and discussion about issues that are caused by or affected from the modern technology. I recommend to at least give a peek (not that, you pervs! 🤨) to his channel and another shoutout to [Emgo](https://michael.goldspinner.me/) for introducing this channel to me.

-----

Welcome to the extra stuff portion of this post! 😁

Right now, I'm trying to make a blog post on my January project and discuss the very underlying concept that I'm trying to learn from the project (which is sessions and cookies). Stay tuned for that, if you want to know more about it. 

Also, I have another project that I'm currently working on. This time, it's all about service workers which is also a future topic of mine to be discussed in a blog post. I'm more excited to work on this one, honestly. Nonetheless, I'll try to get my January project post to be out first. 
