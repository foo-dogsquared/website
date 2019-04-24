---
layout: post
title:  "Weekly Resources and Learnings #6"
date: 2018-08-17 12:57:34 +0800
author: foo-dogsquared
categories: general
tags: [programming-notes, weekly-learnings, learning]
---

Sixth entry?! This is sick. 😎 

(Also I know it's delayed, thank you for understanding. I just forgot. No more excuses. 😜 Another also, there is an upcoming *Simplified!* 
entry about electronics, the main thing I'm currently focusing on especially on the basics, so be sure to keep an eye on that if you're 
interested.)

## What I've learned this week
### Electronics
I've been started out learning electronics a few weeks ago but writing a blog post about it is quite a very helpful for me to understand 
it a bit further. Now if you have a lot of time, you can read the more detailed post about it in an upcoming two-parter entries about 
electronics.
Here's the oversimplified and shortened version of the topic of electronics 💡,

Electronics is simply the science of controlling electric flow into our circuits. We have mainly three concepts we have to bear in mind 
when we want to enter the world wherein you get to create some stuff.

#### Current
Simply put, it is the amount of electrons flowing at a certain point per second. The unit of measurement that we are commonly using is an 
*ampere* or *amp* (\\(A\\)), for short. An amp is simply \\(6.241 * 10^{18}\\) electrons flowing per second. That number is a bit hard to 
memorize so we just say 1 coulomb which describes the magnitude of the exact same number. Just know that a coulomb describes the charge of 
\\(6.241 * 10^{18}\\) electrons in a period of time. While it's not necessary to know about this especially when we're starting out, it's 
still important to know a bit of these things as we might encounter it on to the more advanced topics of the field (probably...).

#### Voltage
In the practical world, we simply say that voltage is the force that makes electrons move around in a circuit but that does not 
necessarily true as that is what voltage can do. It produces a kind of force called the *electromotive force* (EMF) that pushes around 
the electrons. 

How we truly define a voltage is that it is the difference of electrical potential energy between two points. To simply things further and 
to make the concept easier to understand in the context of electronic, we can say that it is the difference of charges between two points. 

We measure voltage through a unit that is conveniently called *volts* \\((V)\\).

One has to be the positively charged object and the other to be negatively charged. Remember that the voltage is the **difference** between 
these two objects/points so the charges between them has to be **different** from each other.

Take the battery as an example. We know that the battery is a power supply and it has the unit Volt (V) associated with it. It also 
has a positive side/terminal and a negative side/terminal. 

#### Resistance
The last stop in our ingredient list is the resistance. It is the ability to resist the flow of the electron.

We measure resistance with a unit called *Ohms* denoted by the capital Greek letter Omega (Ω). 

Resistance basically cuts the electric charges of our circuit since inducing our circuit with a voltage value that is too high for the circuit 
can cause the components to burn out or worse, blow up. Take the famous example of an LED that is directly connected to the battery. If we 
connect the LED to the battery and form a complete circuit, the electrons will still flow but the LED cannot take it and eventually burn out 
since there is too many electrons flowing through it.

The early models of light bulbs also faced a similar problem since the thing that enables the bulb to make the light is simply a very thin 
filament. When electrons flow through the bulb, the filament will burn too hot to the point that it creates a strong area of light that is 
enough to light an area. When too many electrons flow through, the filament will still burn but it will burn to ashes or burn out, as they 
say. 

Those problematic encounters emphasize how incredibly important to consider about resistance. It is certainly not a useless thing and a 
thing to be considered last. 

#### Electronic components
To enter the world of electronics, we have to be familiar with some components like:
- the LED wherein it acts like a mini-lightbulb or an indicator for your devices
- the resistor that cuts down part of the voltage by converting the electric charges into heat 
- transistor that either acts a switch with a conditional or an amplifier boosting electrical charges
- integrated circuits that is basically a mini-circuit with components inside of it and comes with various forms and functions so you have to know the kind of IC you're getting, especially for logic gates and such

The introduction of electronics does not stop here. There's just a lot more to cover on this topic and it is too large for this summarized 
learning post of the week so you can just continue to read it on the upcoming two-parter *Simplified!* entries on electronics.
I sound like I've pulled a Buzzfeed on there but the concept is just too wide and generalistic that it is just better to link them to 
your articles. Plus I'm trying to keep this weekly learnings series under 20 minutes worth of reading time as much as possible. 

### Singly linked lists
These are basically a way to create flexible data by eliminating the problems in arrays (at least in C). In C, the arrays is also a bunch 
of data, placed together back to back in memory. Unlike on more modern programming languages like in JavaScript wherein we can place an array 
with all sorts of data, we can't combine data of different data types in an array, we have to place that particular data type we have declared 
on what type of data this array will hold.
```c
    // example of arrays in C
    int int_arr[4] = {1, 2, 3, 4};
    float float_arr[4] = {1.234, 2.345, 3.456, 4.999};
```

While arrays are great in holding out multiple data in one consistent memory location, it also comes with a downside: the size of the array 
is fixed and we cannot change it. Say that we have declared an array of size 4 like in the example above, we can only have 4 values in it. 
What if we want to expand the array? We can't. The simplest solution for that is to declare another array that is \\(n+1\\) of size, for 
example, if we want to insert one more data into our array. 

As you might have noticed, that is somewhat wasteful. It is not entirely efficient at all since we are wasting some space just to hold the 
same data and the additional data that we want to add.

Thankfully, there is a way on how to get around on that: *linked lists*.

A linked list has the advantage of holding multiple types of data at the cost of the ability to randomly access a part of the data easily. 
```c
    int int_arr[4] = {1, 2, 3, 4};

    // example of the random access part of the array
    int_arr[2] = 5;
    int_arr[1] = 10;
```

Here's a visualization of the data structure on topic:
<!-- PICTODO: linked list visualization -->

To create a linked list data structure, you need to have the value of the node whether it is an integer, char, or a struct (which does let 
us combine data types) and a pointer to the next node. The last node on the list should point to nothing or in other words, a null pointer. 

Typically the code for the linked list structure look like this:
```c
    typedef struct s_llist
    {
        TYPE value;
        s_llist* next;
    }
    s_llnode;
```

You may notice that we have inserted a self-referential structure on the second line which means we have referred to the same struct. 
Self-referential structures also cannot have the declaration with the struct itself since the compiler doesn't know when to stop allocating 
memory for the struct (an infinite number of times to allocate for `struct s_llist`). Instead of the struct itself, we can have the 
pointer to the struct itself and we can have the struct itself in the struct, somehow.

Where's the *singly* in the "singly linked list"?

There are two types of a linked list: the first one is the singly linked list and the other one is the doubly linked list. A singly linked 
list is a linked list that only keeps one pointer and that points to the next node. As you have noticed on the visualization, there is no 
other way to refer to the previous node. We can't just go back since the pointer only points toward the next node. If we want to refer back 
to the previous node, we have to keep two pointers and that's where doubly linked list comes in.

Despite that a doubly linked list sounds more useful than the other one, singly linked list is still used. For example, we can create a hash 
table with the singly linked list to easily create a chain of nodes in a single hash node in case that the hash code from both data is similar.

## Article of the Week
### [Thinking About Errors in Your Code Differently from *Codecademy*](https://news.codecademy.com/errors-in-code-think-differently)
An article that encourages you to think about errors as a programmer and as a person living in life. I guess that sounds to dramatic but 
it can also change the way you think about errors outside of programming. One of the most crucial benefits I've gained from practicing 
programming is the acceptance of mistakes. I admit that I still can't get over some of the errors I made but I'm slightly improving of 
how I recieve errors, mistakes, and such.

## Book of the Week
### [Electronics For Dummies, 3rd Edition](https://www.amazon.com/Electronics-Dummies-Cathleen-Shamieh/dp/1119117976)
Since I'm studying electronics, well here's my recommended book for the wook. As always, as one of the book of the famous introductory 
book series, For Dummies, this is a good book to enter the world of electronics. It gives you the information you need to be familiar 
with the basics, sets you up for the practical applications through a thorough discussion on the inner workings of an electronic system. Or 
is it? IDK, I only read the first unit of this book.

## Podcast Episode of the Week
### [Paid Attention (Season 3, Episode 3) from *Mozilla IRL Podcast*](https://irlpodcast.org/season3/episode3/)
Yeah, Mozilla has a podcast series named IRL, apparently. In this series, they are focusing on the aspects of real life such as real life 
stories and relate it into our online lives and the future of the web, as a whole. This is an interesting episode, I have to say. It's 
about how the value of attention affects our lives especially how it affects from a business perspective and as individuals living out 
in real life. Several examples are given and some of those examples and perspective are given from the guest speakers whose known to the 
marketing industry.

## Site of the Week
### [Explain That Stuff](https://www.explainthatstuff.com/)
I wish I've seen this site way before but better late than never, I guess. This is a site full of introductory technical guide to different 
sciences like in electricity, nature, space, and all sorts of cool stuff. One of the nicest feature that this site has is that each of its 
article has a nice list of different materials that you can refer to.

## Tool of the Week
### [Forest](https://www.forestapp.cc/)
This is an app that helps you focus on the task and get away from using your smartphone by simply setting the timer. It's basically some type 
of pomodoro app but with TREES! You have a virtual tree and each time you initiated a focus session with the app, the tree will grow. 
Neglect the tree, then it will wither and die. Yeah, basically it helps you focus on that by making you feel about tress, virtual trees in 
particular.

## Watch of the Week
### [Angel City Chorale Rendition of Africa by Toto](https://www.youtube.com/watch?v=-c9-poC5HGw)
Let's relax for a while and have some different kind of watch for today, shall we! This is a video of the Angel City Chorale singing "Africa" 
by Toto, which is getting a lot more mentions on the internet now lately. Also by the time I put this on my list for future referrals, that's 
when I know that they apparently entered America's Got Talent and got a [golden buzzer on their latest performance which they sung "Baba Yetu", a famous song from the video game, Civ IV (which I recommend a lot, by the way)](https://www.youtube.com/watch?v=XStvwK6yKvs). 
I recommend giving them a watch on one of their performances, you can really tell on their faces that they have passion and really breathing 
in the meaning of the song.

## Channel of the Week
### [Thomas Frank](https://www.youtube.com/user/electrickeye91) 
This is the guy behind [College Info Geek](https://collegeinfogeek.com/). The kind of videos he produces are quite interesting to me, to say 
the least. Most of the time, it's about upping your productivity levels and gaining new perspectives about doing work. In fact, seems like his 
content that is being released is affiliated with the site. Also, his main site also has a [podcast](https://collegeinfogeek.com/cast/) and 
it is also one of my recommendations in my resource list. He is also one of the hosts on another podcast series, [Listen Money Matters](https://www.listenmoneymatters.com/) 
which is about personal finances. Pretty cool stuff.

---------

Hello! If you're reading this, well thanks for reading this because I have something to say. If you're trying to learn a new 
subject or a whole area of knowledge, try to look for a book targeted for kids since they are always been designed to be 
particularly very easy (and also fun). Plus, colorful books are always there, who doesn't love colors? 😁