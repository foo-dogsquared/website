---
layout: post
title:  "Weekly Resources and Learnings #3"
date: 2018-07-25 00:09:34 +0800
author: foo-dogsquared
categories: general
tags: [programming-notes, weekly-learnings, learning]
---

Woohoo! Third entry, third time's the charm, right? Also, as unexpected, this post is way longer than I thought.

## What I've learned this week
### Interaction with the Memory
This point has been nailed a lot on the first few lectures on CS50. Let's start from the very basics:

First, the computer needs memory to do stuff. When we say memory, we mean RAM or a Random Access Memory, 
[that green (or not green, depending on the manufacturer) module](https://i.imgur.com/eW6LMB6.jpg) stuck on your computer. The RAM 
is basically a storage for data but that also where's the manipulation of data occurs. The RAM is a volatile storage so any data 
there will be affected if there's any change outside of the hardware such as power, which will basically make the RAM obliterate 
whatever data stored in there.

Second, whenever we go run our program. The RAM will allocate resources to accomodate your program to be usable. Let's say 
whenever you declared a variable inside of the program, it will happily create a space for your variable and store it there. 
There is also the case that you, yourself can borrow or dynamically allocate chunks of memory. But of course, just like real 
life, you borrowed it so you have to give it back in case you see there's no need anymore for the dynamically allocated chunk.

In cases like C wherein the sizes of things such as the array and strings (which are just an array) are limited. We can declare 
and have data this limited that we can only do some predictions as a precaution. It's not a problem if there is a limited number 
of users with a limited number of use cases but for the most part, you might want to make your program adapt to a more broader 
things. This type of technique combined with other stuff like the `struct` can make your program more dynamic than ever. 

Lastly, now that we know that the memory allocate resources for the program. There is another point related to this, which is 
the parts of a memory. Specifically, we're focusing on the heap and the stack which is quite similar to the stuff the previous 
point has mentioned, concept-wise. You might get the intuition that the stack and the heap is a separate part of the memory, but 
as you expect from reading the first few words of this sentence, it is not. As most diagrams would show you, the stack and the 
heap belongs in the same part or pool, as you might have heard on some parts (\*cough\* CS50 \*cough\*). And as all things, 
it is not an unlimited magical source of magic things doing magical stuff for you... automagically. When either of those 
things reached to one's end having either one of them reached the very last part of the available memory, the program will 
crash.

So anyway, why are the two separate in the memory pool? IDK the exact details, that's for sure but I can tell **what** those parts 
do.  

#### The Stack
The stack holds the statically declared variables that was assigned into the program. We can say that the stack is the more 
organized one since it also handles the execution of each function from the source code in which it will place the data in 
order. There is one main stack that the program will always use and that is what they call the *runtime stack*. You might run 
across runtime stack in other terms such as the *call stack*, *program stack*, *execution stack*, or *THE stack*.

#### The Heap
The heap is another part in the memory allocation that helps with managing data inside of the program. Unlike the stack, the heap 
does not operator in an order and can be assigned pretty much anywhere in the memory pool. Another thing with the heap is that its 
allocated resources is separate from each other. Thus, the data element inside of the heap can be deallocated separately and can
be done in any order.

Relating with the second point of the topic which about dynamic memory allocation, this is where they live, apparently. And just 
like the point has said, if you borrowed a chunk of memory through dynamic allocation, you have to deallocate it yourself. The 
reason is that you might lose the references of those data and if that happens, you can't find it back anymore and will cause 
a memory leak. A memory leak is a bad case of program management since it cannot be claimed for future allocations anymore and 
can only be resetted back by restarting the operating system.

### Pointers
This relates to the previous topic which is about how the program interacts with the memory. 

Very short recap! A function passes on data **by value**, meaning each time a function calls, the stack frame will allocate 
some space for that function and copies the value of the data it needed. We know that with each declaration of the variable, 
some space for that variable will be opened and store it there and with the million of bytes our memory is holding, it is going 
to be out there, waiting to be used. What about if we have another variable with the same value? The same thing will happen, 
some chunk of memory will be allocated for the variable and store whatever value is in there. 

Now where does this lead to?

Remember each time there is a function call, the stack would allocate resources for it and copy 
all the needed data and then, it reached the end or has returned something, all data within that stack frame will be deallocated, 
now unavailable within reach for our program, including what would suppose to be the new output for our data.

Here's where pointers would come in to the rescue.

A pointer is basically a way to hold the reference / memory address that contains the value that we needed. A pointer's value 
will be the address that **points** to where the data is stored. Since its value is an address that will eventually point 
to the variable itself, we are effective using a new way to pass values instead of passing it by value, we are passing values 
**by reference**.

I think I'll just reserve the rest for the next post (finally).

### File Pointers
Yeah, file pointers are a different but related beast to pointers. They are basically giving us the ability to store and retrieve 
permanent data on the hard disk, where the permanent storage should be. I say it's a different (but related) beast to pointers 
since they have different mechanics, I should say.

Since we are talking about files, which is a basically a bunch of bytes, the scale would be kind of larger than our pointers. 
We can read the characters of the files, retrieve a chunk of the bytes from the file, and so many others.

File pointers begin (at least in C) with this:
{% highlight c linenos=table%}
FILE* inputFile_r = fopen("path/to/file.txt", "r");
FILE* inputFile_w = fopen("path/to/file.txt", "w");
{% endhighlight %}

As you can see, we have linked the same file with two different file pointers. Turns out that with file pointers, we can do 
stuff with the files, but only one operation per pointer. In this case, we can do **read** (`r`) and **write** (`w`) the file.
Now, we can do stuff with the files but it depends on the operation. Say that we want to add something to the file, we must add a 
file pointer with the write operation saying that "in this file, we can only write stuff in it".

Same with how we would dynamically allocate memory (and if you got some clues from the syntax), we would also close the file 
pointer, signifying that we are done with this file. Once we close that file pointer, we can't do stuff with it, anymore. We 
cannot read a string from a file, we cannot write some text on a file. We would have to reopen a file pointer for another 
operation.

### Planning and Organizing in Programming
> no plan survives contact with the enemy

Quote from Helmuth von Moltke the Elder, a military chief of staff. Well, having a plan is pretty much a good rule in all 
disciplines. As said by another military figure, General Dwight D. Eisenhower, that plans are useless but the skill of 
**planning** is indispensable. So yeah, that's the point I'm trying to make. Anyways, while progressing through the problem sets 
from the CS50 course, I've been forced to be more cautious on coding. Of course, as you might have seen on some of the websites, 
programming does not involve coding 100% of the time but debugging and trying to solve a problem, in effect, creating an outline.
I've been pretty much intimated with the problem sets (at the time of this writing, I'm currently on `resize.c`) so I tried and 
will try solving the upcoming problems with a different approach. I'll try to keep solving in spirit and continue to improve 
my problem solving skills, and in hindsight, planning skills. 

Having said that, a plan without organization will mostly ensues a mess. So, make sure that the plan goes with some kind of order.
One of the ways on how to create an organized plan is with an outline which is just mentioned a paragraph ago. 
There are plenty of ways to initiate a plan for a different purposes. In my case, I mostly plan with writing everything every idea 
I have down on paper and writing pseudocodes from those set of ideas, 
statements that represent the action or the function of the code. I generally write the general course of action then inspecting 
every list item I've just written then create subtasks, if the task can be broken down further into easy-to-digest statements. 

As a self-reminder, I must say that everything should be taken in moderation. The same with staying in the planning phase. You 
might create the perfect plan that goes with a guarantee that it will work but just like how most of our process in programming, 
we will encounter some obstacle that will eventually render the plan to be a failure. So yeah, don't get too ahead to be like 
a strategist to create *the* plan, just make a plan and go ahead with it. If it fails, then create another quick one.

Another self-reminder, don't plan for the big picture. As most programming advice post has said, programming is ultimately about 
problem solving and to solve problems, you must take the problem into small separate subproblems that takes small separate 
subtasks, and if a subtask can be broken down into subtasks, break it down further. I'm pretty sure you heard and seen that kind 
of advice a lot of time so I'll say it again: programming is about breaking things down into small steps that it cannot be broken 
down further.

### Processing and p5.js
More Processing because why not? In case you're curious what is it about, Processing is a programming language (or is it a 
library because it is said to be built upon Java so...) that lets you create some creative stuff. Anyway, I got the syntax 
quickly since most of the programming language use the same concepts, anyway. After getting a bit comfortable with it, I've 
decided to go for [p5.js](http://p5js.org/) which is basically Processing except written for JavaScript. I played with a little 
bit and created my [first pen](https://codepen.io/foo-dogsquared/pen/LByzzR) that uses the library. This is getting interesting 
so far and I might go back study some geometry because of this. Plus, I've been wanting to see some kind of practical (I'm not 
sure if this is one) application of the subject, and this is one of the nicest thing I've got so far so I'm going to continue 
ahead. And another plus, more stuff to put for the next week entry and it is not all about computer stuff. 😁

## Article of the Week
### [The Work Required to Understand the Obvious (Or How to Be Wise) by *Zat Rana*](https://medium.com/@ztrana/the-work-required-to-understand-the-obvious-or-how-to-be-wise-e57a6bc542cf)
I took notice of this through inspecting my email and I think this article leaves me profoundly thinking. An article that speaks 
the issue which is the things we mostly ignore (that may or may not have values to it) especially the things that have been 
discovered long before us (or our acknowledgement of it) and how and why cliches are often undermined. I'm pretty sure there 
are some things you all have heard a lot of times to the point of ignoring it either because you've heard enough or you think you 
understood it well. Well, this is a chance for you to go for a introspection and perhaps a look into this article as well.

## Books of the Week
### [Programming Notes for Professional books](https://goalkicker.com/)
I know this has been featured as one of the very much recommended items on my 
[free resource list]({{ site.baseurl }}{% post_url 2018-05-1-free-resource-list %}) but man, I really can't recommend it enough, it's very 
good in my opinion. This is basically like an unofficial, offline documentation of the languages but they way they 
guide you to the basics is quite good since I find it hard to get into the basics reading from some of the official 
documentation. On a formal note, this is a site that hosts a plethora of books on a plethora of tools (programming languages and 
frameworks). This is based on the [now-defunct documentation from Stack Overflow](https://stackoverflow.com/documentation/) which 
closed on the latter half of last year, 2017 (although, you can still download the archived stuff). Seeing as these books were 
written from the guys from Stack Overflow and based on it from the said docsource, I say the content is good (I mentioned it 
already, I think).

Also, related stuff, I've made a [little project](https://foo-dogsquared.github.io/nfp-bookhub) that simply lists the books 
from the website. I've saved you a click (and a few seconds), right there.

## Podcast Episode of the Week
### [How to Learn Things Quickly from *Syntax*](https://syntax.fm/show/044/how-to-learn-new-things-quickly)
[Syntax](https://syntax.fm/) is a podcast hosted by a pair of developers, [Wes Bos](https://www.youtube.com/user/wesbos/)
whose famous for his courses such as [CSS Grids](https://cssgrid.io/) and [JavaScript30](https://javascript30.com/) (which 
both of them are free, by the way) and [Scott Tolinski](https://www.youtube.com/user/LevelUpTuts/) whose famous for 
his founding of LevelUpTuts, a site (with a YouTube channel which is linked to his name) that targets to beginners wanting 
to take a foot forward to web development. In this episode, they discuss the ways and their experiences as developers on how 
to learn quickly and efficiently, seeing as one of their aspects of being a developer is adapting to the ever-changing world 
of the technology.

## Site of the Week
### [Instructables](https://instructables.com)
Instructables is a site with a community of engineers, programmers, DIYers, and so much more. The main reason I was able to 
find this site is through finding a community that revolves around electronics which is a topic I'm starting to touch upon. 
This site usually features tutorials and classes on electronics, programming, 
[leatherworking](https://www.instructables.com/class/Beginning-Leatherworking-Class),
[electronics](https://www.instructables.com/class/LEDs-and-Lighting-Class), and even
[baking](https://www.instructables.com/class/Science-of-Baking). This is quite a nice find, overall, for me.

## Tools of the Week
### [Relaxio's White Noise Generator](https://play.google.com/store/apps/details?id=net.relaxio.relaxio)
Yeah, that's my pick for this week. If you haven't heard what's with the ambient sound / white noise (pun intended) all about, 
they're basically tools that can help with studying, meditating, sleeping, or just relaxing. I've been using this app last 
month to aid me in sleeping so that I can tolerate sleeping even with the noisiest of noises. It has a bunch of features for 
what supposed to be a simple generator of noise with certain color. We can mix multiple noises, make certain sounds reach at 
a certain volume, and even save them as one of your favorites and name them. Yeah, now you can go make a routine with noise 
with a single tap of a button in a certain menu. 

Anyway, if you're looking for an alternative, you can try [Rainy Mood](http://www.rainymood.com/) which is a website so that 
even non-Android users can join in the ambient noise hype, whatever that is. Also, visiting the site will direct to the mobile app 
version for both iOS and Android users.  

## Watch of the Week
### [Why I don't have long term goals? by *Jarvis Johnson*](https://www.youtube.com/watch?v=h3sXskf1gcg)
A video by Jarvis Johnson, one of the YouTubers that I can recommend with a full approval. Funny, informative, and profounding --- 
those are the words I can think whenever I describe his content. Anyways, it's a video that explains why long term goals are not 
quite the interest for him. Oh, he also talked about the opposite of a long term goal: short term goals and how they would help 
you in your growth. 

Anyway, opinion time! One of the major things I picked up from this video is that you shouldn't take a look too much into 
the future but that doesn't necessarily mean that you should entirely abandon the idea of doing stuff for the future. Another 
thing I've picked up from this is the balance of things ~~as all things should be~~, don't get your long term goal to be too 
narrow and too specific. Long term goals with the scope of the largest cave in the world that can fit a whole ecosystem is quite 
easy to maintain and at the same time, it is easy to get lost in terms of directing yourself to where you should grow from as a 
person or a career person or whatever aspect of life you want to improve. Meanwhile, long term goals with the scope of an iron 
sight from a gun for ants can either be downright impossible or can cause you to lose interest real quick. Instead, you should 
pick your long term goal based on the relative future. Yes, it mostly involves your current you. So go ahead and make something 
because you felt to. 

## Person of the Week
### [Lazy Game Reviewer (LGR)](https://www.youtube.com/user/phreakindee/) 
A YouTuber that specializes in retro PC gaming and hardware mixed with some modern stuff whenever he wants to especially with The 
Sims series, SimCity, and the Cities: Skylines, I guess. It is quite a good channel with the snark reviews, somewhat niche 
content (I guess), and that voice... I mean, really, it will make listening a very, very soothing experience. Give it a try if 
you haven't already.

---------

Hmmkay! That's a nicer wrap for this entry than I thought it would be. It's really a **whole lot** more than I expected, 
containing text worth 17 to 21 minutes? **WHAT?!** That's the equivalent of my normal type of post. 😮

Also, if you remembered what I've said about reviewing the sorting algorithms and noticed there is no review there, good on you.
You noticed it! 👍 I haven't found a good use of it, yet so I found remembering the concepts a bit more vague than the others. 
Learning by practice, as they say. But I will make it into the next entry, I promise! 🙏

Also, same to the electronics stuff. Actually, I might make it into my main type of post instead since I find the concept 
a little too big to be included in this type of post. Now that I think about it, I might also review what I've learned over 
this month which is mostly about the basics of computer science... Upcoming computer science basics post? 😉