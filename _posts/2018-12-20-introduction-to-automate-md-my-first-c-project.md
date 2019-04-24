---
author: foo-dogsquared
categories: "side-projects"
date: 2018-12-20 08:53:48 +0800
layout: post
tags: ["projects", "beginner", "cpp"]
title: Introduction to automate-md (my first C++ project)
---

OK! Another post on another side project. This time with [`automate-md`](https://github.com/foo-dogsquared/automate-md) Although it also acts as a post on my experience learning C++ and what lessons can be extracted from it.

## Side commentary
Fun little fact: the markdown file that is converted into HTML to make this post was created with this project.

This is meant as a way for me to learn a bit more on lower-level languages (well, compared to Python, Ruby, and JavaScript). It is also a way for me to be more mindful on the process on how I develop at least this big of a program. It is also a way to familiarize on developing a CLI program with the arguments and options and everything else in-between.

So far, it is also the first project for me to test out continuous integration (CI) systems. I tested it out with [Travis CI](https://travis-ci.com/) which is said to have a shallower learning curve than most CI systems so I did that. Anyways, let's get started with the personal documentation.

Although I can say that it is done, there's still have some fixes to go before I can proudly put it out there but then again, I could not put out a bug-free program within a reasonable amount of time. That'll take ages for me, completely not worth it. And I have it open sourced which mean others could contribute and see the things I did not.

## Overview
*GitHub repo:* [https://github.com/foo-dogsquared/automate-md](https://github.com/foo-dogsquared/automate-md)

It's a CLI program that is originally built with C, made as a intervention project as I progressed through CS50 (which I eventually stopped doing so... I should really work on that 😅) but eventually the project was ported to C++ (C++14, specifically). 

It was originally made with my personal problem which is creating some markdown files for blogging with the [Jekyll](http://jekyllrb.com/), a static site generator. It's very inefficient because my only solution at the time is copy-pasting a markdown file, modifying the data on the frontmatter, and renaming the file appropriately since the URL of each post is automatically assigned and it depends on the file name.

Now, it's built with more tools that I'm not much familiar with and more low-level abstractions to begin with (although not as low as C). It also got more features than ever, adding a total of three (well, two if you're clever enough) more functions that lets you to update, reset, and extract the frontmatter of the markdown file.

It also got support for [two more common frontmatter formats](https://gohugo.io/content-management/front-matter/) such as [TOML](https://github.com/toml-lang/toml) and [JSON](https://json.org/). Last, but not least, it provides some level of customization when it comes to adding and updating the frontmatter's data.

There's more upcoming features I plan but it's mostly going to be done for long as I move on to start other side projects.

## How it works
This time, it comes with more abstractions, according to my plan! The simplest explanation I could come up with is that the app is made up of two cores: the interface and the functions. Wait... it sounds similar to front-end and back-end of a web app. Yeah, pretty much all programs have this abstaction in some ways, now that I think about it.

![Application model]({{ 'assets/pictures/side-projects/automate-md/application-model.png' | relative_url }})

The mere difference for this one though is that internally, functions are made up after the application model. They are exclusively based on that and the forward compatiblility for future releases. 

Furthermore, if you want a more focused process abstraction on how the program works. Here's the algorithm model I've put on how each function in the program should work with the file:

![A more detailed version of the process model]({{ 'assets/pictures/side-projects/automate-md/focused-algorithm-model.png' | relative_url }})
<p class="caption">A more detailed version of the process model</p>

### Interface
As I said before, this is like the front-end part of the web app. Except in a CLI program, it is much easier since you don't have to worry about the graphics design, more on the application design on how to parse such arguments.

Being a first-timer on designing a CLI app on such scale, the one with multiple functions and multiple possibilities of values, I designed the app to parse a specific template of arguments.

Specifically, the program accepts two required arguments: the action and the required value. The rest of the arguments are obviously optional but they can also alter the usage and the flexibility of the program to a degree. In turn, the user has some choices in here.

```bash
automate-md action required_param [optional_params]...
```

All of the functions available in the program have that template (except for one function, which requires no optional parameter at all), so far. It enables me to have an easier design of the parsing through all of them which is just a simple expectation of values on the first and second argument (the program name isn't included in the count).

Now, for the optional parameters, I have to do something with it. Counting the infinite possibilities of those optional parameters, I decided to make a template for it, as well. Following how other CLI programs like with the `git`, `make`, and so does many others (virtually all of them), I've went for the flags and options indicator which is basically just a dash and any amount of character.

However, having seen that most flags (`-F`, for example) are just one dash with one letter, I decided to make my optional arguments to be like the options part. Indicated with double dash and a word (`--WORD`), I also included a separator which is an equal sign to make parsing a little easier.

So now, when the program executed in the real-world, it looks like this:

```bash
automate-md create "TITLE" --example=foobarbaz
```

It looks alright and indicative. However, I do have one more problem which is the configurable nature of the program. As the frontmatter is quite customary, I can't just entirely lock the freedom of the user to insert custom data. There needs to be a way for the user to do just that and I did come up with such way which is the optional command parameter indicator (what a mouthful).

Basically, the said optional command parameter indicator is the same as the options except it has been prefixed with a percentage sign (%).

```bash
automate-md create "TITLE" --%optional_command_parameter=VALUE
```

Yeah, that also looks indicative, right? Right.

In my plan, the program should be able to flexibly add and update the program with the command line. The easiest way to have that kind of configurability is with the options indicator. However, it only indicates one type of data which is just the key-value data that'll be processed with the frontmatter inside of the file. The optional command parameter indicator solves that particular problem.

Now, the interface's logic is appropriately stored in the `interface.cpp` (in the `src` directory). That's also where the optional parameters and the optional command parameters are usually parsed through to make a map. All of the optional parameters of any kind are stored on a map data structure so that I can implement the future features consistently and let from the body of the action functions themselves do the checking. 

![Application model in code form]({{ 'assets/pictures/side-projects/automate-md/application-model-code-form.png' | relative_url }})
<p class="caption">Application model in code form</p>

Also, if you want to see, most of the interface logic are coded in appropriately named [`src/interface.cpp`](https://github.com/foo-dogsquared/automate-md/blob/master/src/interface.cpp).

### Actions
The actions are basically the middleman of the program. In this case, these are the black boxes that processes your markdown file into whatever action the user told the system.

If you want to see how I made the actions' function structure, you can see it on [`src/cli/cli_actions.hpp`](https://github.com/foo-dogsquared/automate-md/blob/master/src/cli/cli_actions.hpp).

![Function actions basic form]({{ 'assets/pictures/side-projects/automate-md/application-action-basic-flowchart.png' | relative_url }})
<p class="caption">Function actions basic flowchart form</p>

Each of the actions has to interact with a key-value object that represents the frontmatter. The frontmatter object contains all of the relevant parameters needed to execute the functions that'll be passed at the end of each action.

The body of the functions are uniform in some way. Since there's a process that puts all arguments in a map data structure, all of the functions just has to access that data and iterate through the map. 

The optional command parameters are just enclosed inside of the code block of the iteration as a conditional. Any optional command parameter detected will add a part of the function or change a certain data, specifically the aforementioned frontmatter object.

After all of the parameters inside of the frontmatter object has been filled, it's time to pass the needed parameters to the functions that are laying underneath.

### Functions
Basically, these are the functions that are being executed after the action functions are done filling up the parameters for them. These are the ending points for the program: creating the new markdown, updating the frontmatter in the markdown file, extracting the frontmatter, and putting it into another file.

If you want to see it, most of the logic are coded in [`src/file_io/file_io.hpp`](https://github.com/foo-dogsquared/automate-md/blob/master/src/file_io/file_io.hpp).

## What could've done better
I can say that the planning of the program has gone smoother when compared to the last posted project. It is quite messy though. However, this is the first time that I focus intensely on the abstractions and the interactions of the individual parts of the program.

The development process is also messy. Since this is my first time using C++, most of the time are spent reading up and referring back to the documentations I could find on the internet. I wonder how many times have I visited [cppreference.com](https://en.cppreference.com/w/) and  [cpluscplus.com](http://www.cplusplus.com/)? If it's probably close to thousands, I'm not suprised. 

I've also spent most of my time testing out the features of the language and integrating tutorials on the [Learn CPP website](http://learncpp.com/). 

Of course, there are some mistakes made like with the carrying knowledge over to C++. Having coded with C, I started out to code with C++ with practices I've had with C. The biggest mistakes include not using `std::string` and instead using C-style strings with `char *`, relying on C libraries and functions like the `malloc` instead of `new`, etc.

However, out of the mistakes I've made, it's the amount of focus I've been putting. Well, it's scattered all over the place. I should adapt my schedule with the creation of the side project in a way that'll lead me to productive and focused sessions instead of the messy development I had gone through. 

So yeah, basically, time management. I've got to up my time management game. 😁

## What are the main takeaways from the process
- **Don't try to master everything before you move on. You can come back later, anyway. Knowing the relating concepts at a shallower level can help you understand and connect the dots between concepts. It is also more time-effective when compared to trying to understanding it to the brim before moving on to later concepts, anyway.**
- **Don't focus too much into optimizing your programs especially when at an early stage.**
- **Focus on documentation. It should be one of the top priorities not only because of the accessibility of it between your code but also because it is an available tool that can be used for yourself. Here, you are writing it for your future self who'll probably continue to develop the program.**

## Conclusion
Well, there we have it, my first C++ project. It's gotten to a bigger scale than I initially imagined but I still able to complete the core functions of it. 

The process is quite fun and slightly frustrated although that's expected. It is quite a challenge begin with as I have no knowledge of C++ whatsoever (aside from bits of knowledge coming from a basic C background). Speaking of process, the main thing I should improve upon as minding myself throughout is the amount of focus I put out each time I deal with this project probably due to my messy time management skills. Like I said before, gotta level that thing up.

What's next? I can't say what but I already plenty of ideas as I write them all down on my "idea dump" notebook. I'll have to see what is doable.
