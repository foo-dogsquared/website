---
layout: post
title:  "Weekly Resources and Learnings #4"
date: 2018-08-1 00:00:34 +0800
author: foo-dogsquared
categories: general
tags: [programming-notes, weekly-learnings, learning]
---

Wow! Fourth entry? I've never been this consistent in my life. Inspired me to do more of these, seriously!

## What I've learned this week
### Sorting algorithms (REVIEWED)
OK! If you have read the tiny endnote from the [last entry]({{ site.baseurl }}{% post_url 2018-07-24-weekly-resources-and-learnings-3 %}), you 
might have noticed the thing where it said about the exclusion of the sorting algorithms since I found little use of it and 
my brain tends to forget those kinds of information, especially the ones that I haven't practiced to a good use, yet. Luckily, 
I found [Brian Holt's Four Semesters of CS in Six Hours](http://btholt.github.io/four-semesters-of-cs/) that offers some 
exercises that can easily get you introducing to practice it immediately. This article course also has a video course version on 
[LinkedIn Learning](https://www.linkedin.com/learning/four-semesters-of-computer-science-in-5-hours/introduction) although it is 
called Four Semesters of CS in **Five** Hours and another video course on 
[Frontend Masters](https://frontendmasters.com/courses/computer-science/) that presents CS in **four** hours. Anyways, here 
we go:

#### Bubble sort
This is the most likely first sort that most computer science course would ever introduce --- and it is one, for a reason. 
It is the most common type of sorting our brain is ever been doing: we associate higher values to the right and lower values to 
the left as we go through the set of data that we encounter in our daily lives. So what is this method of sorting is all about? 
Bubble sort, in its essence, is a way of sorting through data by swapping items as it iterates through a set of data. As we 
go through the data, it effective pushes the higher values to the right and the lower values to the left, 'bubbling' through 
both ends of the set.

Here is the common pseudocode for the bubble sort:

```txt

   - set some sort of counter that tracks whether there is a swapping that went through
   - while there is still swapping
        - iterate through the array and get the two consecutive items
           - if 'nth' element is greater than the 'nth + 1' element
               - swap them
               - increment the counter, effectively telling that there is a swapping took place
           - else if 'nth' element is less than the 'nth + 1' element
               - do nothing
       - if there is no swap that took place
           - stop
       - otherwise, repeat from the start
```

Its worst case scenario (O) for a bubble sort is when the data that we need to sort through is entirely reversed. Especially if 
the first and the last element in the sorted array is in the opposite ends, we have to compare and swap, if needed, taking 
*n* amount of operations. Then go through the array *n* times in order for those elements at the very end to move from *n - 1*th 
place to the 1st place. With those said, the Big O notation of bubble sort is mostly O(n^2).

The best case scenario isn't exactly the best either, as we have to go through the entire array first before we can say it is 
already sorted, even though by instinct, we can say that it is already sorted. Effectively having Ω(n).

#### Insertion sort
Another one of the algorithms that sort things out, albeit with a different approach. Insertion sort works by going through 
the dataset once while sorting through with whatever it comes while going through the dataset. In other words, it goes through 
by organizing the dataset into sorted and unsorted. Each time we get the appropriate data (the smallest value, for example) from 
the unsorted part, we **insert** it into its appropriate place of the sorted part and call it sorted. Then, it continues to 
iterate through and repeat the process until the unsorted part of the list is no more. 

OK. My english has gotten worse from that, so I'll just try to have an outline what does insertion sort pseudocode usually look 
like:
```txt

    - call the first element sorted (since a single element on the data set is technically already sorted)
    - pick the smallest value (or whatever the criteria of your sorting) from the unsorted list
    - move the items if needed and insert the gotten data into its appropriate place in the sorted list 

```

The Big O notation for this O(n^2) simply because the list might be the total reverse of the sorted list. Thus, we have to 
process through the list *n* times and do the insertion *n* times.

For the Big Omega notation, we have Ω(n) for the case when the list is already sorted but since there is no way to say in the 
algorithm if it is sorted or not, we have to go through the array just to say that it is.

#### Merge sort
One of the main stars of this sorting show. Merge sort, unlike the previously mentioned sorting algorithms utilizes the 
divide-and-conquer approach, breaking things down into its subparts until it cannot be broken down and making action from 
there. So this means it uses recursion. A recursion, if you recall, must have a base case to prevent it from running it 
forever. In this case, we are breaking the list down until it cannot be broken down which goes up to one element in the list. 
Then we merge them and that's where the sorting goes up until we have risen to the full list.

Well, here's how the sorting algorithm goes in pseudocode:
```txt

    - sort the left half of the list
    - sort the right half of the list
    - merge the two halves and sort it
  
```

Since we are breaking things in into half every time we go into a task and its subtasks and we do not really compare every 
single item into every single item, we have a worst case scenario of O(n * log n) which is way less than the runtime of the 
previous algorithms. However, there is a catch to it. Since we are using recursion and the way how a recursive function will work 
in programming languages such as C that puts one more frame in the call stack, it's a bit worse when it comes to the memory or 
space complexity, as other sources might refer to because not only we consider the time complexity and but also the space (in 
context, memory) complexity. In each sublist, we have to create a new list and we have to utilize more memory for that. It's a 
very good technique with a bit of consideration. It's not that awful in the small scale of things but still calls for a 
consideration.

### Structs in C
Structs are generally a way to structure your big data into named components. We are basically giving a particular byte or a 
set of bytes in the memory a name so that it is easier to remember and organize our data. Structs are also used so that those 
set of data are located in a single unit of memory, allowing for an easier access of data within those blocks. In C, structs 
are declared like so:

```c
    struct NAME {
        type member_name1;
        type member_name2;
        ...
        type member_nameN;
    }

    // example use
    struct dog {
        char *name;
        char *breed;
        int feet;
        bool tail; 
    };
```

If you are using other programming languages such as JavaScript and Python, you would probably get some intuition from them 
as they are similar (in a way) to objects and dictionaries, respectively. To assign a variable with a struct, write first the 
`struct` keyword then include the name of the struct that you want to copy to:

```c

    struct NAME NAME_OF_VARIABLE;

    // relating to the examples given earlier
    struct dog first_dog;
    struct dog second_dog;

```

Now you've created some structs, there's that question of how to fill those values and how to access them. Accessing a member 
is made simple with the dot notation.
```c

    // syntax
    NAME_OF_VARIABLE.MEMBER;

    // example use
    strcpy(first_dog.name, "Doggo");
    strcpy(first_dog.breed, "pug");
    first_dog.feet = 4;
    first_dog.tail = true;

``` 

You might want to create structs at the top of the source code since most likely we want them to be used throughout multiple 
functions. In fact, you can also exclude the structs and stuff them all in a header file (`.h` file) and include them yourself 
with `#include NAME_OF_FILE.h`. This does not only help reduce our codebase a little bit but also helps with portability and 
managing projects that spans multiple files since we can just add an include macro with our header file.

### Defining your own data type
Fortunately in C, we have a way to declare our own types of data which is called `typedef`. Instead of something `char *`, we can 
associate it with `string`, similar how the CS50 library did. This is very useful in case you don't want to type out all those 
words or don't want to make your code a little too long and cumbersome.

Here's how `typedef` goes:
```c

    // syntax
    typedef OLD_NAME ALIAS;

    // example use
    typedef unsigned int u_int;
    typedef char* string;
    typedef struct dog dog;

```

It basically gives the data an alias so that you can skip over some extra steps to go through like with structs. In the third 
example, we are basically giving `struct dog` an alias of `dog` so that we can skip typing out `struct` every time we want to 
initialize a struct.

Apparently, we can also define a struct while we are building out the struct:
```c

    // example use
    typedef struct {
        char *name;
        char *unique_id;
        int student_no;
        float grade;
    }
    student;

    // declaring a student variable
    student first_student;
    student second_student;

```

### Struct pointers
Just like with any other data type, we can assign a pointer to a struct in the similar way.
```c

    struct student {
        char name[40];
        char unique_id[16];
        int student_no;
        float grade;
    };

    // assigning a pointer to a struct variable
    struct student *first_student = malloc(sizeof(struct student));

```

In the code above, we simply just borrowed some chunks of memory that is worth the size of the struct (more on that later) and 
store the address of it to `*first_student`.  

In case you're still wondering about using some dynamic allocation of the memory, we need those in order for the program to 
create related data on the fly in runtime. Also, with the dynamic allocation, we can be flexible in utilizing our memory, not 
entirely relying on the stack which does offers limited option when it comes to memory since there will be other functions 
that will use the stack. That's what the heap is for.

Also, forgot to mention that the `sizeof` operator automagically figure out the size of the whole struct for you. For instance, 
the struct above has 64 bytes, totalling from the 40 bytes of `char name[40]` (each `char` is 1 byte), 16 bytes from the 
`char unique_id`, 4 bytes from an integer, and another 4 bytes from a float. In conclusion, to store the data of a student, we 
need 64 bytes of memory which is not really that much, unless you're fiddling with a large scale dataset.

Like any other pointer variables that points to our usual data type like `int`, `float`, and `char`. We need to dereference 
(go to their address) them first before we can access its members.

```c

    // example use of accessing pointers that leads to struct
    strcpy((*first_student).name, "Doggo of Macedonia");
    (*first_student).student_no = 2018558846352768;

```

Seems like a little annoyance with the extra stuff but no worries, there is a succinct way that removes that burden which is 
the arrow operator (`->`). The arrow operator automatically does the deferencing of the pointer on the left side and accessing of 
the specified member which should be on the right side.

With that info on our mind, the given syntax now could be like this:
```c

    // example use of the arrow operator
    strcpy((first_student->name), "Doggo of Macedonia");
    first_student->student_no = 2018558846352768;

```

### The basics of electronics
I basically studied and reviewed a little about those electronic lessons in high school like the 
[Ohm's Law](https://en.wikipedia.org/wiki/Ohm's_law), electronic equipment, and the electronic schematics and their different 
representational symbols. I've also gotten a little deeper (about a few centimeters deeper, probably) about the components of 
electronics like what is an LED, a resistor, a capacitor, a soldering iron, a breadboard, and other stuff. Now, I just 
need to get a bit comfortable with gathering the components because every time I go out to buy and gather those, I tend to miss 
one important bit (which is always the jumper wires). At least, I found a cheap electronic kit to get started with testing 
out and stuff. All I've done for now is build a circuit that turns on a bunch of LEDs with a bunch of resistors and a 9V 
battery while I'm holding with my bare hands, exposed from the danger that my fingers may get hurt from the rapid heating of the 
light and the battery. I'll get better, even if I only made 2 LED lit up and the rest of the 10 LED circuit burnt out before 
I happen to know the consequences of having more voltage and having no resistance, IT IS STILL PROGRESS! 😁

Also note that I may create a post on basic electronics once I got the hang of it. ~~Yeah, rest in peace, my savings, you're now free.~~

## Article of the Week
#### [Give Yourself Permission to Suck: It's the Only Way to Learn by *Alan Henry*](https://lifehacker.com/5957937/give-yourself-permission-to-suck-its-the-only-way-to-learn)
It's a timely article of my year... Yeah, this tells you about how you should make expectations of yourself especially when 
you want to have another skill in your belt. It is common sense when you think about it but we all start from nothing. To reach 
at the top of the mountain, we have to climb it and those who stays only stays wherever they are. 

Also, I also want to supplement this with a something called a [growth mindset](https://www.khanacademy.org/youcanlearnanything) 
which is basically a mindset that believes that intelligence is relative to our actions and that we can learn anything as long as 
we put our time, effort, and quality practice into it. This particular mindset also embraces challenges which makes the growth 
mindset person to become even more excited to work on it because of the thrill of solving these kinds of challenges. So yeah, go 
ahead and read some stuff about that and let yourself unstuck from the chains of the fixed mindset, if you have one, and test 
yourself from the very nothing and build from there.

## Book of the Week
#### [Think Like a Programmer from *V. Anton Spraul*](https://www.amazon.com/Think-Like-Programmer-Introduction-Creative/dp/1593274246)
To be honest with you, I barely started reading this book but I'll give my recommendation to you for this week ~~since I don't 
have any other good picks for this entry~~. I think the title pretty much sums it up what is it all about: it teaches you how 
to think computationally (apparently, it is a word). Well, it does expects from the reader to know something about C++ but 
the type of degree you'll be interacting with are not that deep, as far as my scanning skills go. It teaches you how to look 
outside of code and apply it into your code in order to solve problems because it is one of the aspects of being a programmer, 
after all. Yeah, that's all I can say about it, NEXT!

## Podcast Episode of the Week
#### [Autodidactism from *Adam Savage's Tested*](https://www.tested.com/science/452732-autodidacticism-182013/)
Another week, another podcast episode from another podcast series. This time is a podcast series called 
[Tested](https://www.tested.com/) by Adam Savage, one of the former hosts of the famous show MythBusters, according to my 
research. I only heard one episode from this podcast which is the podcast episode of the week, obviously. So the subject is 
self-explanatory --- it's about autodidactism or self-learning. In here, they have talked about their opinions and 
experiences with learning on their own which it is an interesting take on absorbing new or similar perspectives, if you are 
looking for one. People telling their experiences about a particular subject is always a good thing for me, whether it is a 
unique take or not. It is the biggest reason why I picked it as the podcast episode of the week. 

## Site of the Week
#### [Freebbbles](http://freebbble.com/)
I'm prettty sure I got the spellling right. Anyways, if you are familiar with [dribbble](https://dribbble.com/), you'll notice 
the similarities and probably get the feeling that this is something about a site on design resources. Well, if you have that 
gut feeling, you'd be right. It is in fact, a site with design freebies made by the Dribbble community. Fonts, icon sets, 
texture packs, photos, whatever you need, you can (probably) find it here.

Speaking of fonts, I've been considering to pick a font for this site, something that can fit the atmosphere I intend to 
make into the reader --- something that feels like a font written by a semi-professional, semi-personal learner. Whatever, 
I'll just look more into it in the meantime.

## Tool of the Week
#### [Xtreme Download Manager](https://subhra74.github.io/xdm/)
It is one of the tools that I used in a *very* long time because of its usability. The function is in the name: a download 
manager, you know along the likes of [IDM](https://www.internetdownloadmanager.com/) on Windows, or 
[uget](http://ugetdm.com/) on Linux. It has the same features as your regular download manager: resuming downloads in case it is 
interrupted or just bad connection, refreshing of links to keep the files fresh from the server, and queueing of files so you 
don't have to worry about going back to the program every now and then --- but wait, there's more. XDM also has a feature wherein 
whenever it detects a video on your site, it will get that link and appear as a download button on your screen. It also has a 
built-in password manager for the credentials of the websites you've visited (although I use [LastPass](https://lastpass.com/) 
for that) and an option to automatically shut down whenever you finished your queue of downloads. Although the only complaint I 
have is that you have to download an appropriate extension of your browser in order to get automatic takeover of the download. 

## Watch of the Week
#### [Flow: the Secret to Happiness by *Mihaly Csikszentmihalyi*](https://www.youtube.com/watch?v=fXIeFJCqsPs)
You know those moments where you feel like in the zone, a continuous feeling that makes you very focused and pretty much into 
it whatever you're doing. That is the subject of the talk given by a famed psychologist, Mihaly Csikszentmihalyi. I 
will very much butcher the pronounciation of it if I were to orally speak that name (also, his last name is pronounced as 
'chik-sent-mi-ha-yi', according to the YouTube comments).

<img src="https://78.media.tumblr.com/f346da16707adaeec7e5e5c490070c4d/tumblr_nnsu1r37wH1qe60t4o1_400.gif">
*Into the zone we go*{: .caption}

I suggest that you watch the video in order to get the idea from the psychologist himself since the following statements are 
pretty much the fruit of my researching labors (and unlike Csikszentmihalyi, I'm not certified for this so you better watch it).
The concept of flow is that it is a highly focused mental state wherein we feel focus, happiness, and thrill from our doing. 
Basically, it can amount to by different factors like the challenge that the task is presenting, the willingness of the person 
to tackle such tricky problems, and how often we would stay focus on our given task. This state is not your ordinary state of 
focus. The person in the flow state only has one thing in their mind, which is the task itself. They are very focused that they 
would forget to eat, drink, or any other function besides doing the task (just be mindful if it is an eating disorder, though). 
This type of focus often results on the person being happy to take on his passioned craft into the doing grinder and have done a 
productive time spent from it. 

Now that I think about it, this ties well with the growth mindset stuff I've pulled out earlier. With the mindset to embrace 
the challenges, in effect going on through failures and mistakes, the person can be in the flow state in bursts mixed in with 
a couple of frustration, probably.

## Channel of the Week
#### [Daniel Shiffman from The Coding Train](https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw) 
I've watched this guy before from the official tutorial of [Processing](https://processing.org), 
[Hello Processing](http://hello.processing.org/). All I can say about him is that he is quite energetic and makes me listen to 
his videos even more. Which is now why I recommend to you his YouTube channel. Once you get past of his presentation around his 
content, you'll likely find him and his content to be quite the good ones (depends on your preferences and tastes, of course). 
Seriously, for me, he's really good and he has good content for you if you want to get started on programming in a fun and 
engaging way like his series for [p5.js](https://www.youtube.com/playlist?list=PLRqwX-V7Uu6Zy51Q-x9tMWIv9cueOFTFA) which does 
not only introduces you to [p5.js](http://p5js.org/) but also on programming, in general. He also has content outside of that 
and in fact, he has some coding challenges video wherein he makes some interesting programs like the game of Snake, game of life, 
and some rain with a color of purple or something. Just check him out yourselves on the YouTube link and see it for yourself.

---------

Another entry that is just about as long as my ~~ir~~regular blog post. That's a good thing. 

I'm quite excited how this is really turning out to be. I'm not very consistent when it comes to habitual things and honestly 
I've also been going through a little rocky situation from creating this type of entry, too. Almost felt like a chore but I'm 
trying not to do that anymore now that my schedule is a little bit more free (a little) so I can focus a bit (a little bit) more 
on this type of stuff which is great! 😊

Also, for this week (for the next entry), I'm currently researching more about this growth mindset thing. It's the kind of stuff 
I have an idea on but I've never considered it seriously and it is stated that reading research materials about it is already 
one of the ways on how to get a hold of that mindset since now our brain knows that intelligence is not fixated since 
birth and it is treated like a skill, a muscle that you have to exercise to improve your state. So yeah, why not give it a try, 
right? Bless the foundation of the internet, science, and research.

I've also wanted to recommend an article by Flavio Copes (which he also blogs in 
his [site](https://flaviocopes.com), by the way) which is about [being consistent](https://medium.freecodecamp.org/every-developer-should-have-a-blog-heres-why-and-how-to-stick-with-it-5fd55a247fbf) 
on your blogging journey. Why did I not include this in the 'Article of the Week' portion is also a mystery for me... If you 
also want to blog about something but not really planning it due to something in the like of the things that is mentioned inside 
of the article and want to hear it from a more certified figure that is not me, here you go.

On the other note, I've created a [study music playlist](https://www.youtube.com/playlist?list=PLz7wMhmjqqBzxaZPxosxdJOAhrPx9B3cw) 
(yes, another idea that is ripped off from the Thomas Frank College Info Geek) in accordance to my own learning style and 
preferred type of music (which is mostly video game soundtracks, as long as it is instrumental). You might want to check that out 
if my type of music is also one of your jam. If not, then you can just create one of your own with your preferred style of music 
whether it is the energetic orchestral type or lo-fi anime beats or anything really that can get you to the flow (HA! GEDDIT?! 
GEDDIT~?!! ok...).