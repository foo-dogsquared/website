---
layout: post
title: "Monthly Resources and Learnings (September 2018)"
date: 2018-09-30 14:27:21 +0800
author: foo-dogsquared
categories: self-learning
tags: [programming-notes, monthly-learnings, learning]
---

OK! The first entry to the new monthly format of my learnings note. It is a working method for me to have a bit more time than usual and 
more on the learning side so good for me, I guess. I also found a better naming system for this kind of post that is a thousand times better 
rather than simply numbering them. Might as well change those in the weekly learnings. Totally thought of that originally, yeah...

## What I've learned
### Abstract data types
I've learned a bit about on how data structures work in the big picture at least a little bit. Reading sections about data structures brought 
me to the general definition of data structures that it is used to describe how data would work. There is also what they call the 
*abstract data type* which describes what is the data and how are we going to visualize it. In short, data structures describes the how, and 
abstract data type describes the what.

Abstract data types are used to make it easier to understand the bigger picture in our application since the details of data-handling 
processes are omitted, in other words, it serves as an *abstraction*. Since we can understand what data are we handling from the outside, 
we can use other peoples' codes as long as we know the limitations and restrictions implemented.

We can take the use of abstract data types by using it as a tool for organizing our thoughts and data. For example, we can create an 
abstraction for coordinates, text, RGB color codes, and images. Each of the data types have operations that we can do with them, what possible 
values they contain, and what processes are relevant to interact with them.

ADTs have common abstractions that are included in most programming languages such as the primitive data types: 
- numbers which operations can include applying arithmetics (addition, subtraction, division, and multiplication) 
- strings which can be used to append, concatenate, or copy other strings
- boolean which can be combined (AND and OR) or inverted (NOT)

Another abstractions commonly found is the stack which can be popped (remove the most recent item) or pushed (add an item on the top of the 
stack), queues which can enqueue (add another item on the very end of the queue) or dequeue (remove the first item on the queue), and 
lists which it can insert an item, remove an item, and get an item.

Overall, abstract data types are used for abstraction, as indicated by their name. Abstracting the overall structure of the data by not 
focusing on the way data are handled. Focusing on the handling process of the data means that we focus on the *data structure* of the 
data.

### More general electronics
This is a summary and most of the stuff came from 
[this post]({{site.baseurl}}{% post_url 2018-08-18-simplified-introduction-to-electronics-1 %}) so this will only take a bit too short 
(or a bit too long since the post has 47 minutes of average reading time).

Anyways, introducing the world of electronics (or at least electronic engineering) without the electronic components is like introducing 
mathematics without the numbers. One of the main thing in electronics is controlling electrons in your circuit in a precise manner and 
with circuits, of course, you're going to encounter these electronic components.

I've noted about some components already in the [last weekly learnings entry]({% post_url 2018-08-21-weekly-resources-and-learnings-7 %}) 
so I'll mainly focus on one thing that I've had the hardest time understanding it: the transistors.

First, to understand transistors, we need to understand a bit about semiconductors and in some way, diodes. Diodes are made up of 
semiconductors, materials that are not conductors nor insulators. We can, however, change the 
properties of the material through the process of *doping* where certain chemicals are injected to make the material positively charged or 
*p-doped* or negatively charged or *n-doped*. When we apply voltage through the doped variants of the material, certain effects like 
electrons moving through will occur.

However, more interesting happens when we combine the variants, forming a *pn-junction* in the process. However, the atomic structure 
difference between the two variants make the electrons in the border to form a barrier. We mostly refer to this as the *depletion layer* or 
the *depletion zone* where there is no additional charges made, hence no potential for electricity to flow through. 

We can get through the depletion zone, however, given with enough voltage. The voltage needed for the current to flow through the depletion 
layer is called either called the *forward voltage* or the *reverse voltage* depending on where the current intends to flow. Mostly, we're 
dealing with the forward voltage such as in LEDs but in the future, we might deal with the case of needing to resist against the current 
so we need to know the reverse voltage instead.

Now, what does a transistor have to do with semiconductors and diodes? Well, transistors are made up of semiconductor materials and they 
function like a diode, in a way, since they are made up of junctions.

There are two types of transistors: the *bipolar junction transistors* (BJT) and the *field effect transistors* (FET). Mainly, they have 
the same function but they have different ways on how they are supposed to do their duty. 

In this note, I'll discuss mostly on the common type of transistor that we encounter as a beginner which is the former type of transistors.

Bipolar junction transistors, as indicated by their name, are made up of two junctions: a base-emitter junction and a base-collector junction. 
These two junctions then are joined together, forming either the two variants of a BJT: the NPN transistor or the PNP transistor. Each of the 
section in the transistor is attached to a lead and we mainly refer to those leads as the *base*, *emitter*, and the *collector*. Each 
model of the transistor may have different arrangement to what each lead represents so we mostly need to search about it on the internet or 
ask the manufacturer/seller, if they have one.

The thing with the BJT is that we have two current of charges to interact with, one that will enter to the base and the other to be the 
collector. The emitter represents the output depending on the input, the voltage from the base. Remember that with the transistor, we 
need enough voltage for the current to be able to flow through.

There is an analogy I found on the internet while searching for a more simplified explanation of the transistors which can be summed up as 
this: the way how a transistor works can be compared to a waterhose spewing pressurized water with our thumb. The small movement of the thumb 
results in big changes of movement of the water coming out of it. The way how our thumb is positioned at the end dictates how the water should 
come out. In other words, it amplifies the current of the water.

**That is what amplification really is. It's not boosting a small signal to a larger one, it's using a small signal to control a larger one.**

### Vue.js
Vue is a frontend framework mainly used to easily create user interface for your apps. Unlike with React and Angular where they bring the full 
package, Vue is minimalistic and lightweight, allowing you to bring only the stuff that you need. 

Like with similar framework and libraries, Vue is focusing on aiding you to create user interface on the webpage by making a part of the 
element to be a reusable component. These components are then rendered in the page, gradually (or instantly) bringing life into your page.

The first concept we should know is the component system which is previously mentioned. In Vue, it is encouraged to make your app into 
several components. These components, when used into our JavaScript file with the Vue library, are then rendered but the functionality of 
Vue does not end there. 

Vue is also *reactive*, meaning a change of the state can make the component shown in the page to be updated. This allows for modularity, 
reusability, and ease of updating your components.

To demonstrate a bit of Vue in this page, let's just create one:
```html
    <div id="app">
        <h1>{{ text }}</h1>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
        const app = new Vue({
            data: {
                text: "Hello world"
            }
        })
    </script>
```

A very simple example, we just did a page with a header that says "Hello world". As you might tell from intuition, the containing data in 
the `text` inside of two curly bracket pairs (or a template, in Vue syntax) came from the Vue instance with the object. Vue gets the data 
with the `data` object which is the standard and serves as a frontend to where we will get the data.

That is not what Vue all does, it can also render a component if it is needed.

```html
    <div id="app">
        <h1 v-if="active">{{ text }}</h1>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
        const app = new Vue({
            data: {
                active: true,
                text: "Hello world"
            }
        })
    </script>
```

There's now something new and that is the `v-if`. That is what we call a *directive* which is basically prefixed with `v-` so it is easier 
to know that this came from Vue.

Here, we have set the condition for the header to show up only if `active` returns a boolean value of true, which is true.

Now let's open up the console and make the header not appear in our page. This is where we demonstrate the reactive side of Vue.

```javascript
    app.active = false; // or app.active = !app.active;
```

Aaaand the header's gone.

We could add some interactivity in here (that does not involve the console), let's add a toggle button, the simplest of web interactivity 🙃.
With Vue, we could easily add a function to be tied into a component with the `v-on` directive with the event to be listened, in this case, 
with a simple click.

```html
    <div id="app">
        <h1 v-if="active">{{ text }}</h1>
        <button v-on:click="toggle">Toggle</button>
    </div>
```

Then, build the toggle function of the button. Take note that when we now refer to the functions in the Vue instance, it should be placed into 
the `methods` object.

```html
    <script>
        const app = new Vue({
            data: {
                active: true,
                text: "Hello world"
            },
            methods: {
                toggle: function() {
                    this.active = !this.active;
                }
            }
        })
    </script>
```

And now we have created a functional toggle button that'll make the header show up or not.

You should visit the "Getting started" guide in the [official docs of Vue](https://vuejs.org/v2/guide/) since it is clearer and more 
concise especially with its examples.

> UPDATE FROM THE FUTURE: Hello! It's me from the future. Someone contacted me to include the following resource and I think it is good to put it [here](https://www.toptal.com/vue-js/interview-questions). It's basically a review of Vue.js in Q&A form and I think it is a good quick flashcard-type of question for you to do.

## What I've been reading
<!-- Books, articles, and other textual references -->
### [3 Actions You Can Take Right Now to Be More Organized from *LinkedIn Learning Blog*](https://learning.linkedin.com/blog/productivity-tips/3-actions-you-can-take-right-now-to-be-more-organized)
It's a simple article for giving tips on how to be more organized towards your work. Despite being a LinkedIn article which is mostly 
targeted towards professionals at work, this is a helpful one for everyone who's looking for a way to make their workflow or homeflow a bit 
better.

### [Arduino For Dummies](https://www.amazon.com/Arduino-Dummies-John-Nussey/dp/1118446372)
Another *For Dummies* series book, it is a good introductory series, after all. Anyway, after I found the subsequent lessons on electronics 
a little bit too far for the scope I've been aiming for, I've decided to jump on something related which is Arduino. Sure enough, the series 
also has a book on Arduino.

## What I've been listening to
<!-- Audiobooks, podcast episodes, videos and other auditory references -->
### [5 Questions: Bad at Math, Choosing Goals, and Relationship Productivity from *College Info Geek Podcast*](https://collegeinfogeek.com/reader-qa-23/)
I haven't listened to a whole lot of podcast this month so there's only one. It's another episode from College Info Geek podcast. 
Self-explanatory and long title, at that. The part that I'm most interested in is the 'Bad in Math' and 'Choosing Goals' since I'm not 
good in math and I tend to be in places when choosing a goal.

## What I've been watching to
### [Data Structures and Algorithms in JavaScript from *freeCodeCamp*](https://www.youtube.com/watch?v=t2CEgPsws3U)
It's a video from the freeCodeCamp channel that introduces you to the data structures and algorithms, using JavaScript as the instrument. 
It is a long video, lasting from almost 2 hours. I applied the same strategy watching long videos: do it in sessions but make sure to 
review the previously discussed matters at that point, no matter how well I understood it, I never know how well I understood it, anyway. 

## What tools I want to share
### [Mozilla Thunderbird](https://www.thunderbird.net/)
Thunderbird is *the* most solid option when choosing an email client in my opinion: solid extensions/add-ons, responsive receiving time, 
and great app performance. Anyways, as you can tell, Thunderbird is one of the projects developed by Mozilla. 
All in all, its reception got great and led to a solid foundation for open-sourced projects, being included as the default email client 
in some operation systems (mainly Linux-based) but it was on hold from version 52. All of that was changed until the version 60 came out 
in August 2018 and decided to skip versions 5x because it's a *real* comeback this time. With a new logo with the same style as Firefox 
Quantum, the new version of Mozilla's web browser. 

## What sites I've been visiting
### [All About Circuits](https://www.allaboutcircuits.com/)
This is a site that focuses on electronics where you can find an assortment of stuff from textbooks to video lectures. Those offer came from 
the community which has a forum for discussing electronics-related: some basic electronics to embedded systems. I've been lurking to this 
site only last week and I found a lot of useful stuff like with [this textual references covering the basics of electronics on a technical level](https://www.allaboutcircuits.com/textbook/). 

### [Scott Young](https://www.scotthyoung.com/)
It's the site of Scott Young, a programmer and entrepreneur. His blog focuses on ways on how to be efficient on learning and be productive, 
overall. Accumulating over 2000 articles, you'll have plenty of articles to search around. Young is also known to be an efficient learner, 
starting the MIT challenge, a self-challenge that is basically leveling yourself up by modifying MIT's cirriculum on their 4-year computer 
science course and learning it for a year. The challenge showcases and focuses on how you can learn a lot more efficient and does not 
necessarily mean that you are an equivalent of a student of MIT.

### [Teach Yourself CS](https://teachyourselfcs.com/)
It's a website that serves as a pointer to the references that you can get when studying a particular subfield in the world of computer 
science. There is a resource pool for you when you want to learn programming, computer architecture, data structures and algorithms, some 
mathematics, networking, databases, and a bunch of other computer science-related stuff. It's a handy website, I'll say.

### [Learn CPP](https://learncpp.com)
I've been wanting to learn about C++ simply because I find a lot of resources on it compared to C. This is simply a tutorial site that teaches 
you to program with C++. You have your standard programming for beginners tutorial stuff: introducing the concept of variables, iteration, 
recursion, and other intermediate stuff (did I just mention it is a tutorial site for beginners).

## Who are the creators I've been following
<!-- Channels of the creators, entertainers, etc. -->
### [Draw With Jazza](https://www.youtube.com/user/drawwithjazza)
The YouTube channel of Jazza, a professional artist. You know, the one that paints with stuff. Having a YouTube channel that revolves around 
art, you will get some crazy stuff. His videos range from a simple demonstration of the creation process of an art, speedpaintings, tutorials, 
and all sorts of crazy challenges with things that never meant to be used as an art tool. Everything is an art tool for Jazza. Anyways, he 
has founded a studio on his own and has [a website](https://jazzastudios.com/) on it so that's another thing to go.

### [Kevin MacLeod](https://www.youtube.com/channel/UCSZXFhRIx6b0dFX3xS8L1yQ)
If you have been watching videos or listening audio by other content creators for too long, then you might have encountered this name before. 
If you have remembered it, congratulations! For those who did not rung a bell, this is the guy mostly famous through his royalty-free 
CC-licensed tracks that can be used for everybody since the early 2000s. And here's his official YouTube channel that I linked for some 
reason. I just find it amusing.

### [Punished Props Academy](https://www.youtube.com/channel/UC27YZdcPTZM24PgjztxanEQ)
I've found this channel through one of Jazza's video where he created the concept art for his virtual reality-themed superhero costume, VRtist 
(geddit, it's a combo of VR and ARtist, ok, I'll stop explaining the joke). I've gotta say, I find their content amazing. This is another 
YouTube channel that revolves around art: the art of making costumes. Well, mostly cosplay costumes but still, COSTUMES! Their videos are 
basically like a documentary of the creation process of a costume but their videography has some style. Seriously, it is entertaining to watch 
those transitions.

<!-- PICTODO: GIF of a cool transition here -->

------

Rather than the "X of the Month" thing that I was going for, I've decided to categorize and combine them under one header. It makes it easier 
to categorize in case I found something in a totally different format like say, an audiobook which is something I rarely use. It lets me 
include stuff very easily. I like this template better and it is so much easier to look at and classify things.

Also, sorry for the low count for this one, my computer crashes a lot this month which *really* interrupts my flow. It interrupted so 
much that I focus on anything that does not require my computer, like electronics, for example. Ah well, at least it left something good for 
me but now I have to focus more for the time I missed. Here's hoping a new start! 🎉