---
layout: post
title:  "Weekly Resources and Learnings #5"
author: foo-dogsquared
categories: general
tags: [programming-notes, weekly-learnings, learning]
---

The fifth entry. Woohoo! Consistency all the way for this thing. Now I just have to apply how I become consistent with this but 
not so much to the other things, hehe.

## What I've learned this week
### Memory and memory management (REVIEWED) 
Yeah, this has been reviewed for too long that I decided to make it into its own post in which you can visit it [here]({{ site.baseurl }}{% post_url 2018-08-7-simplified-introduction-to-the-memory-and-memory-management %}).
Anyway, here's a summarized version of it: the memory is a part of the computer that is used to hold and store data; in context of 
computer science, the memory is mostly referring to the RAM which is a type of memory that can hold and transfer data at a higher 
rate compared to other forms of storage such as a hard drive disk (HDD) and a solid state drive (SSD).

The program we write relates to it as the memory gives the resources that made our program to be able to run in the first place. 
As we go on, the memory works by dividing the resources for different purposes but the main thing that we are going to discuss is 
the stack and the heap which is really just a one shared memory pool.

The stack (or the call stack) is a part of the memory segment that manages automatic variables and the flow of the program 
through the stack frames. These stack frames are based on the function calls as the program is running. Only the most recent 
stack frame (effectively, the most recent function call) is currently active and all previous functions will pause executing. 
The most recent stack frame may only be *popped out* when the function that calls it finishes executing. There is a limit 
on how many stack frames the program can only run and exceeding it may cause a *stack overflow*.

Next is the heap where the dynamic memory allocation takes place. Both of the heap and the stack are in the same segment but 
traditionally, they are located at different spots of the memory and grow in separate directions. The heap, unlike the stack, 
have no form of organizing data and instead allocate them at random locations. There is no order of deallocation either, thus 
we need to free it ourselves in any order. Leaving the allocated memory is considered a dangerous move since it may cause a 
*memory leak* which will render the block of memory unavailable for the rest of the usage until the operating system reboots. 

Also, pointers. They are important, too. Seriously speaking, pointers are indeed a useful tool once you get to understand them. 
We can have two variables having the same value but at different address, pointers allows us to pinpoint only the variable that 
we really need by storing its address. And that's really all pointer is about: addresses. We can compare it to URLs which 
are addresses to the files. Now there are URL that can lead you to the same file but the location is entirely different, we could 
get it from a different site. Now that we have an identifier that contains the address of the variable, we can access it by 
*dereferencing* it. A dereferencing or an indirection, as others might call it, is the process of going to that address and 
getting the value inside of that address.
{% highlight c linenos=table %}

    // the entirety of pointers in C
    
    // declaring a variable
    int number = 42;

    // declaring a pointer variable with the type of the value
    int *number_ptr = &number;

    // dereferencing the pointer
    printf("%i\n", *number_ptr);


{% endhighlight %}

### Growth mindset
The growth mindset is one of the most important research has done by [Carol Dweck](https://en.wikipedia.org/wiki/Carol_Dweck), a 
psychologist researching on the motivation of the people and how they do what they want to do.
Long ago, I've read [something about the growth mindset in one of Khan Academy's post](https://www.khanacademy.org/about/blog/post/95208400815/the-learning-myth-why-ill-never-tell-my-son-hes)
and that very important takeaway I've had with that article is the fact that our brain changes. One of the most interesting 
tidbits that has been said over the post is how one would start to change his thoughts about intelligence, by simply being 
exposed to a research post about growth mindset and internalizing it into our routines. Simply reading the causes and effects already changes our mind in a way due to the new information our brain has received. Our brain now knows that we grow by our 
mistakes, not by the number of the right answers we made. Or by embracing struggles and challenges, we can learn anything 
combine that on how to start learning in the right pace on the right place.

I go back on that article for those times I struggle just to remind myself that we grow through our mistakes. By looking at what 
we made wrong, we can spark some sort of discussions and that's where learning can take place. So, yeah, if you want to change 
your mindset, you should immerse yourself in these topics and internalize it. This is pretty much a very important stuff for 
yourself, in my opinion. With the internet being a very large place of information, you can start to get on what you have today.

### Arduino
Recently bought an Arduino and a new electronic kit so I'm very raring to go with learning electronics even more. Anyways, 
Arduino is a programmable circuit board (or a microcontroller) that allows you to create various devices covering from a 
thermostat, a microphone, an LED screen with different color patterns flashing at an interval, a digital clock, 
a motion detector, or a simple button circuit that will play a sound when pressed, anything you can imagine as long as you have 
a plan in mind. Since I'm just testing out the waters and I'm not very familiar with the basics of electronics much yet, I'm just 
going to do the last thing in the previously mentioned list of projects which is a simple sound button circuit. I've seen a 
tutorial of it long ago except that it uses a jelly bear candy that acts as a button with two rods inside of it that triggers the 
sound when those two rods touch. Sadly, I can't find it anymore (if you do, please notify me, I want to see it again) but 
nonetheless memorable, funny and amazing, in a way.

## Article of the Week
#### [How to Ask Smart Questions by *Eric Steven Raymond* & *Rick Moen*](http://www.catb.org/~esr/faqs/smart-questions.html)
I know that the site looks very outdated (or it is probably just me) but still have a look at the content, not the aesthetics. 
This is a very long article on how to give smart technical questions that targeted towards the developers. I think this is one 
of the skills developers, or rather all, could improve their success not only in their career but also for life. Another thing 
that can be affected here is the researching (or googling) skills which you're asking the right questions or building the right 
sentence, as long as you know the name what and where you are looking for.

## Book of the Week
#### [Mindset: The New Psychology of Success by *Carol S. Dweck*](https://www.amazon.com/Mindset-Psychology-Carol-S-Dweck/dp/0345472322)
Since I did said I'm going to research about growth mindset this week, I've noted a book for you which is Mindset by Carol 
Dweck which is a psychologist famous for her statements and theories about mindsets and how it can affect the success of 
whatever people are doing especially if it is for the future. I said pretty much everything I had about mindsets in the 
'What I've learned for the week' section. Anyways, if you want to save some bucks, you can go to ebook libraries or a book 
summary site in which one of them is right [here](https://fourminutebooks.com/mindset-summary/).

## Podcast Episode of the Week
#### [Developing Confidence, Finding Happiness, and Saying "No" to Millions from *The Tim Ferris Show*](https://tim.blog/2015/12/14/derek-sivers-on-developing-confidence-finding-happiness-and-saying-no-to-millions/)
OK. Can I feature another episode on a podcast series that was previously featured now? Because here's another new podcast series! 
It's the Tim Ferris Show podcast which covers deconstructions of how world-class performers from different areas like in music, 
art, investing, and acting, succeed in their field. It mostly giving you insights on their routines, habits, tricks, and a lot 
more. I found this series this week from roaming around Twitter and I liked and added it to my podcast list after I listened to 
this episode. In this episode, he converses with Derek Sivers, which he has [his own website](https://sivers.org/), about 
confidence and how Sivers got that confidence to say "no" to a lot of people and stand to his point and wants in mind. Be wary, 
it's two hours long. I just cut out through sessions since I have slow internet connection and oftentimes, if I focus on that 
solely to finish the whole podcast episode, I accomplish nothing. Hooray for finding ways.

## Site of the Week
#### [Dictionary of Obscure Sorrows](http://www.dictionaryofobscuresorrows.com/)
Yeah, this is a very interesting find to me. No, this is not a site about depression or sorrow (well, a little). It's a site 
to a project (named Dictionary of Obscure Sorrows, of course) that lists out words to describe an obscure emotion. This project 
also has a [YouTube channel](https://www.youtube.com/channel/UCDetdM5XDZD1xrQHDPgEg5w) which takes on the definition of the 
new words hoping to enter the common vocabulary (which apparently called neologism) in video form. 

## Tool of the Week
#### [Habitica](https://habitica.com)
Another tool that I've been using for a some time now. This is a program that helps you with doing your tasks by making it into 
a game. It is quite cool and an awesome way of reminding you to do those tasks combine that with a few of productivity tricks 
that is up in your sleeve like a pomodoro timer or a loud alarm. For me, I just add a note with a persona of a mad snarky boss 
to prove that I am a self-deprecating person and to harshly remind myself of where I am now instead of daydreaming about me being 
in the level of a rockstar programmer. It is also available as an app in Android and iOS so it is quite a handy app, no matter 
what kind of user you are whether an Anroid or an iOS (or none or why not both).

## Watch of the Week
#### [How to Excel at Math and Science by *MajorPrep*](https://www.youtube.com/watch?v=yjdhNyEmYpo)
This is a YouTube video that is covers the topic given by this book, [A Mind For Numbers by *Barbara Oakley*](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers). 
Most of the topics found on the book can also be gotten from a very famous Coursera course, [Learning How To Learn](https://www.coursera.org/learn/learning-how-to-learn/) 
which the author, Barbara Oakley, is included as one of the instructors of the course. It's a very good video covering the 
topics of the book, acting as a summary and an informative video. Of course, the only thing you should do is to apply it. 
Hopefully, you're not stuck on a YouTube watching spiral that is still happening to me after watching the video so you should 
start applying it immediately or as soon as possible.

## Channel of the Week
#### [Overly Sarcastic Productions](https://www.youtube.com/channel/UCodbH5mUeF-m_BsNueRDjcw) 
If you would watch their trailer, you know that their chanel is about making classical works such as Beowulf (the first video 
I've watched from their channel), Dante's Inferno, and Illiad into a much digestible and entertaining way. I really like this 
channel, I'm not much of a fan of classical works but seeing this kind of content is quite entertaining to me.

---------

I have no such words for this entry maybe except "I'M SO EXCITED TO FIDDLE WITH ARDUINO! ZKJDNFGIOEBFPSAOFIJAOI@Q#@)*U$)DDFUA". 
Seriously, it is one of the best decision I've made for a while, I'm very excited about what I can do with it but for now I'm 
just getting familiar towards working with electronics or perhaps, I can learn the basics of electronics while studying this 
thing. IDK much about this, it'll work out if I put more effort into this.

**NOTE**: Just for the sake of proper notification, I'm now changing 'Person of the Week' to 'Channel of the Week' including the 
previous entries since it just fits more and putting it with a label of 'Person of the Week' seems kind of stupid.