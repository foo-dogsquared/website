---
layout: post
title:  "[Simplified!] Introduction to the Memory and Memory Management"
date: 2018-07-7 18:32:05 +0800
author: foo-dogsquared
categories: computer-science
tags: [programming-notes, computer-science, simplified]
---

<!-- TODO: Introduce to the memory -->
Remember the time wherein memory management is quite a very prominent thing to worry for our programs? For most of us (including 
me) probably doesn't since most modern programming languages abstract us away from those parts. We, for the most part, don't have 
to worry about that since programming languages such as JavaScript, Ruby, and Python does some memory-related stuff already for 
us. This does raises some concern about understanding the memory and memory management since it is already done for us. If that 
is already managed for us, then why bother learning about it?

It will show that having an understanding of some of the inner workings of the memory will make us better programmers in a sense 
that we know more about the tools we are using now. Our moments of confused wonder of how certain stuff works will be reduced 
(or will be stacked, it depends) and with a better understanding of the memory in relation to programming language will make us a better programmer and a betterw work output and then, we will be called by the higher offices and gave us a promotion, then we 
became to best programmer EVAR.

OK. That's a bit too much. Let's go back to the reality, shall we? 

Let us start!

Also, fair assumption over here is you are familiar with C or C++ but still, if you have interacted with a programming language 
for too long, you would get some context by instinct here even if you did not see the syntax yet.

## What is a computer memory?
The memory --- one of the fundamental elements in order for a computer to work is where to store and output data. Basically, 
it is the brain of the computer, holding these data we have inserted into the system. If were to imagine there is 
no such thing as a memory inside of the computer, we would probably see just nothing since there is no data to be retrieved from 
somewhere. Probably we won't have any program to run at all except for the BIOS booting, leaving the computer to be the big dumb 
hunk of metal junk.

Now, in general definition of the word 'memory' in terms of computer hardware, it can refer to a couple of things:
- primary storage --- where the temporary data such as variables in a source code are stored; this is also the fastest memory as handling of tasks especially in multitudes requires a lot of giving data to the CPU and storing back of the data in high speeds (i.e. random access memory (RAM) and read-only memory (ROM))
- secondary storage --- this is where the files are stored persistently; even if the power goes down, as long as the file is complete, the file would stay inside of that memory storage (i.e. hard disk drive (HDD), solid state drive (SSD))

...but in computer science, we refer it to the primary storage, most of the time, specifically the RAM which will be elaborated 
on to the later part of the post.

<!-- TODO: Explain how the physical memory works in abstract manner -->
## The CPU and the RAM
RAM, short for Random Access Memory and it is the main type of memory that we'll discuss. It's primary component is the capacitor 
which is an electronic component that stores electricity. In the ways of the computer, this is added with the context of a 
binary state whether it represents 0 or 1. If the capacitor is filled up, then it represents 1. Otherwise if it is mostly empty, 
then it is a 0. This became the physical representation of bits, combine that with bytes which is composed of 8 bits with the 
context that is the modern RAM commonly goes 1 gigabyte (GB) and above. So yeah, you can imagine that those things has a *lot* of 
those capacitors.

We mainly use RAM as our place of storing data and manipulating and transforming them into something else since they are much 
faster than any other types of storage. But the function of transforming of data is not really the function of the RAM but rather, 
the central processing unit, also known as the CPU.

The CPU is pretty much a counterpart to the RAM. If the RAM is the brain of the computer, the CPU is the heart of the computer as 
virtually every function of the computer is made possible with the CPU processing and moving all of those data. It "circulate" 
the bits around so that the computer system as a whole works even if a few components are missing such as a speaker or a mouse. 
Another thing is that the CPUs today are made of billions of transistor which is an electronic component that lets or blocks 
electricity flow. It need this gigantic amount of those transistors to match the billions of capacitors the RAM usually have.

The CPU and the RAM are quite connected, literally. As the RAM is connected to the CPU through a memory bus/connector so that the 
data stored in the RAM can be retrieved by the CPU and do the processing and outputting them into something else usually giving 
back to the RAM. 

<!-- TODO: Introduce to the parts of the memory -->
## The individual parts of the memory
So, if our common type of working memory has the capability to read and write bits of info at random location, how do we interact 
with them to get the things that we want to get? 

Just like how the real world works, we access them through an *address*, a memory address. If you have been using for computers 
for so long like you're using like a cheat engine or something, you may have encountered these memory address as a hexadecimal 
number. In each address therein lies a byte or a group of bytes which may be referred to as a *word*. Each word in the memory has 
a unique address that is attached to them and in programming languages like C and C++ let us access those addresses directly 
although only limited to what the system has given to us. Basically, we are dividing the memory into chunks of varying sizes and 
we can access them through the address values.

Still, with bits that are now divided into bytes and eventually, words, it seems like a lot to worry about when we apply to what 
we know now into our programs. Well, thankfully, there is an abstraction for that. 

In each time there is a application program running like our own that we programmed, for example, the computer would allocate some 
resources in order to make that program up and booting. Also, we don't need to worry about all parts of the memory (most of the 
time) due to some restrictions like we can only interact with resources the computer has allocated for us and any interaction 
with the memory that we shouldn't touch is illegal and will throw an error to us for security purposes (which is called a 
segmentation fault or segfault, for short).

If the program is done running, the allocated resources would be freed and rendered as an available block for other programs. 

Now this allocated resource, the memory set, do have individual segments that make up the entire picture for our program (info from [GeeksForGeeks](https://www.geeksforgeeks.org/memory-layout-of-c-program/)). 

<!-- TODO: Introduce the main segments of the memory in C (DONE) -->
<img src="{{ 'assets/pictures/intro-to-memory/memory_segment.jpg' | relative_url }}" style="width:500px;" alt="Memory segment in C">
*The mistake in writing on the 'heap' part is glaring.*{: .caption}
<!-- insert memory segment drawing here -->

Starting from the low address, we have the:
- **text** --- Basically the code itself, albeit converted to binary code
- **initialized data segment** --- At times, it may be referred to simply as the data segment. This is where variables with initialized values are stored.
- **uninitialized data segment** --- May be referred to as **bss**. This is where uninitialized variables or variables set to 0 are stored. Since most of the time, compilers would throw a warning or an error regarding using uninitialized variables, this is mostly not being minded by newcomers. Also, we can undo the warning by compiling our program with the appropriate options for our compiler to ignore uninitialized variables.
- **stack** --- where automatic/declared variables are stored
- **heap** --- where the dynamic memory allocation takes place
- **high address** --- includes the command-line arguments and the environmental variables which are basically variables that interacts with the whole system and can affect the processes running inside of the environment 

<!-- TODO: Elaborate the stack -->
## The memory stack
The stack is a part of the shared memory pool that includes the statically declared or determined data. It may be referred to as 
the execution stack, the call stack, the runtime stack, or simply the stack. 

Generally, most popular programming languages such as C, Python, and JavaScript implemented some form of a call stack but still, 
it largely depends on the programming language. I just want you to keep that in mind.

The main function of the stack is to store data from our program but it also handles the function execution. 

Every variable that is declared will be pushed onto the stack.

The way how the stack works is that it is made up of stack frames. A stack frame is created from a function call and it can be 
removed from the stack either if the function returned something or finished running the code. Similar to how real life stacks 
work, it utilizes the First In, Last Out (FILO) approach. That means the most recent stack frame is the first to be "popped" out of the stack while the stack frame at the very bottom will be the last frame to be removed. 
```c
    
    int multiply(int a)
    {
        return a * a;
    }

    int square(int n)
    {
        return multiply(n);
    }

    int main(void)
    {
        int number = 6;
        number = square(number);
        printf("%i\n", number);

        return 0;
    }

```
<!-- insert image here -->
<img src="{{ 'assets/pictures/intro-to-memory/stack_frame.jpg' | relative_url }}" style="width: 500px;" alt="A visualization of the stack.">

Within each stack frame is an allocated memory space that is included with a set of data and values that have 
been passed on from the previous function(s). The most recent stack frame also gets to have 
its code to be executed and every stack frame below it has will pause its execution for a while until the function that pushes the 
most recent stack frame finishes executing.

The stack follows an arbitrary order or at least has some organization when it comes to memory allocation. Since it uses the 
[stack data type](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)), it can be easier to abstract how things in your 
program would work.

There exists a limitation and this commonly occurs to recursive function if it is not implemented properly. The stack can only 
hold a number of stack frames and this is usually referred to as the *stack bound*. When the number of stack frame has exceeded 
the stack bound, it will throw an error that the call stack has been exceeded or a [*stack overflow*](https://www.geeksforgeeks.org/heap-overflow-stack-overflow/) error. 
Bad things will inevitably happens when you encounter it, just take a look at 
[this guy](https://www.geek.com/games/why-gandhi-is-always-a-warmongering-jerk-in-civilization-1608515/).

The main thing with the stack is that its size is determined at compile time.
What about if we want to create space for those data that we don't know how to precisely determine it while the program is still 
running? We can still adjust it by coding out to possible values, variables, and such but it is not going to be an efficient 
solution in long term.

<!-- TODO: Elaborate the heap -->
## Dynamic memory allocation and the memory heap
This is where dynamic memory allocation comes from. This is a technique wherein the program can allocate resources at runtime. 
Since the memory set from the stack only provides the possible amount of memory from a function call, we have limited resource 
to begin with. Dynamic memory allocation allows us to get around that possible problem and make our programs more dynamic 
especially at taking inputs.

What about the heap? Where does it comes from?

Heap is the space where the dynamically allocated memory goes to. Remember that the stack and the heap are both memory locations 
used to describe the memory spaces so the dynamically allocated space must go somewhere and that is the heap.

Unlike the stack which has some form of organization, heap does not have. It assigns memory spaces randomly in the memory pool. 

<!-- insert image here -->
<img src="{{ 'assets/pictures/intro-to-memory/stack_and_heap.jpg' | relative_url }}" style="width:500px;" alt="Simplified visualization of the stack and the heap.">

Also, unlike the stack which pops out the memory space of the most recent stack frame when the function finishes running, the 
heap does not have any form of automatic deallocation and we would have to deallocate it ourselves. This does add on the random 
nature of the heap that we can deallocate it in any order.

The data assigned to the heap can interact with any part of the stack as long as the data has not been deallocated.

<!-- something about heap overflow -->
Like the stack, there is also a buffer overflow for the heap, namely, the [*heap overflow*](https://www.geeksforgeeks.org/heap-overflow-stack-overflow/). This usually happens if we continuously 
allocate our memory on the heap and did not free or deallocate it or if the size of the allocated memory that we request is 
too large for the computer to handle. 

Now it is easier if we just have that in code but before that, let's discuss another topic that relates to the memory management 
thing which is the pointer.

## Pointers
They are basically a way to pass variable by storing the memory address with the specific value that is inside of that address.

This has opened up other ways for us to pass variable since we can pass it *by reference*.

The way how a memory work, whenever we want to do something like initializing a variable, do a function, or return a 
calculation, the computer system would assign memory space somewhere in order to make those possible. With that in mind, we can 
initialize two variables with the same value but it would be on two different memory locations, in other words it passes *by 
value*.

<!-- Insert image here -->
<img src="{{ 'assets/pictures/intro-to-memory/diff_addresses.jpg' | relative_url }}" alt="A simple visualization of what I'm talking about, supposedly.">

Well, we can take the idea outside, shall we.
We can say that the concept of pointers are similar to URLs, which is a form of address to the file.
<img src="{{ 'assets/pictures/intro-to-memory/diff_url_addresses.jpg' | relative_url }}" alt="Another visualization of my stuff, don't mind the drawing.">
*Like I said, don't mind the drawing.*{: .caption}

We can get the very exact file through different addresses but then, on the computer's term, they are considered different. 
Plus if one of the maintainer updates a file, only one of them would be updated.

### Syntax
But first, let's be familiar on the syntax on pointers, at least on C. In C, we can assign a pointer with by adding an asterisk 
`*` into the variable name:
{% highlight c linenos=table %}

    // some variables
    int n = 9;
    float o = 12.345;

    // assigning a pointer variable for an integer and initializing it with an address
    int *n_ptr = &e;

    // assigning a pointer variable for a float and initializing it with an address
    float *o_ptr = &f;

    // assigning a pointer variable to a string literal with 10 char;
    char s[10] = "hello word";

{% endhighlight %}

What would happen here is that we assign a pointer variable with the name beside the `*` which will point to the memory 
address that has the value assigned from the assignment operator. Include that with the type that is beside the name that 
indicates what data type can we find inside of that address. 

Also, take note that the pointer variable has an address of its own so we can assign a pointer variable to another pointer 
variable. Although I don't see a valid use case of doing that yet but you can do that if you want to.

You might also notice the ambersand (&) on the initialization of the pointer variables. As it turns out, the ambersand (&) is the 
*address extraction operator* which is used on non-pointer variables such as `n` and `o` on the code above.

As one might conclude, the pointer variable needs an address in order to make it work and not get an error with unmatched type in 
the initialization of the pointer variable.

<img src="{{ 'assets/pictures/intro-to-memory/pointers.jpg' | relative_url }}" alt="Simple pointer visualization">
*Uhh... the design around the text is a design decision, yup. Not a mistake that has been decided into a design by accident at all. Yeah, it looks worse than I thought.*{: .caption}

If we would describe it what happening on line 6 on the code example above, we would say that we assign a pointer named `i` that 
points to the memory location which contains an integer, `7`. On line 8, we assign a pointer named `f` that points to the memory 
location which contains a float whose value is `12.345`. 

But how about on line 10? Why is it included there? That is just an array, is it related to pointers?

Well, yes. As it turns out, an array is already a form of a pointer. To be technical, it points to the first element of the array. 
So if we have been working with arrays in C before, you are already interacting with pointers in a way.

Just keep in mind what are we storing in a pointer variable: addresses. Like how we usually store appropriate data into a 
variable with a specified data type. We also need to insert only addresses or else the code would not be compiled and the 
compiler will throw an error.

Speaking of addresses, there is also one other type of a special address which is the null pointer which is a pointer that points 
to nothing. 
```c

    // assigning a pointer variable to a null pointer
    int *i = NULL;

```

It seems useless but it has a variety of use cases.

If we don't immediately assign it to something else, leading the pointer into the null pointer is said to be a safer option since 
undefined behavior could happen since its value could be a garbage value that is left from other programs. 

Just make sure that the pointer that points to the null pointer does not get dereferenced (in which we'll talk about in just a 
bit), otherwise we would get our program crashed due to a seg fault.

As this [video on CS50 has said](https://www.youtube.com/watch?v=XISnO2YhnsY):
> Pointers are nothing more than an address.

### Pointer dereferencing
OK. So we assign a variable that stores an address but what do we do with it, how about the values that is inside of that memory 
location? 

We can do that by *dereferencing* the pointer to get the values that is inside of it. Dereferencing, also known as indirection, is 
simply the process of going into that address and getting the value located at that address. 

How can we do that in C?

The syntax with dereferencing in C looks like this:
```c

    int addTwo(int a, int b);

    int main(void)
    {
        
        int *first_int = 6;
        int *second_int = 12;

        // dereferencing of the pointer and getting the values
        int sumOfTwo = addTwo(*first_int, *second_int);
        printf("%i\n", sumOfTwo);
    }

    int addTwo(int a, int b)
    {
        return a + b;
    }    

```

As you can see, it is mostly the same as we assign a pointer variable but take a closer look at the differences between assigning 
and dereferencing. When we want to create a pointer variable, we can see that it is on the left side of the assignment operator 
and also has the data type indicating the type of value that is located at the address assigned to the pointer variable.

Another example from the previous subpoint:
```c

    int n = 9;
    
    int *n_ptr = &n;

    printf("%i\n", *n); 

```

Would have this as a simple visualization when an indirection was needed:
<img src="{{ 'assets/pictures/intro-to-memory/dereferencing.jpg' | relative_url }}" alt="A simple dereferencing visualization.">

This has been previously mentioned but to nail the point: when the pointer points to a null pointer and we dereferenced it, the 
compiler would compile the program (assuming no errors were thrown at compile time, of course) but it would get a segmentation 
fault at runtime.
```c

    // one surefire way of getting a seg fault
    int main(void)
    {
        int *ptr = NULL;

        printf("%i\n", *ptr);

        return 0;
    }

```

We could also use the null pointer to do some error handling like avoiding to dereference the pointer if the pointer contains 
`NULL`, thus preventing some error like the segmentation fault.
```c

    // making sure to avoid to dereference a null pointer
    if (ptr != NULL) /* we can also use if (ptr) */
    {
        /* do some stuff */
    } 
    else 
    {
        /* some error-handling */
    }

```

<!-- TODO: Dynamic memory allocation demo in code -->
## Dynamic memory allocation in code
Now that we are done with what we should know with pointers, we can now demonstrate how do we dynamically allocate some memory 
for our program at runtime since we can't really adjust the memory resources from our stack.

For a recap, when we create some more complex and flexible programs, we should have a way on how to create some programs that can 
easily adjust to our input especially if we don't know what value that input is. For instance, if we want to have our program 
accept various set of data like the number of users which can dynamically change over time and we wouldn't really know the data 
that will come in.

Dynamic memory allocation lets us get around that by setting some memory aside on the fly while our program is running. In this 
way, we can set some memory space for the number of those data. Another thing with dynamic memory allocation is that any 
memory that is set by the system this way will take place in the heap.

Now how about doing them in code?

In C and C++, you can dynamically allocate memory by `malloc()` and its related functions such as `calloc()` and `realloc()`.

For now, we'll just focus on `malloc()` since it makes things easier to understand. The `malloc()` function needs an integer to 
how many memory (in bytes) do we need as its parameter and will return a pointer to that memory chunk.
{% highlight c linenos=table %}

    // assigning a float on the heap
    float *f = malloc(sizeof(float));

    // assigning a string of 9 chars (since must be /0 is included and it takes one more byte) on the heap
    char *s = malloc(sizeof(char));

    // creating a chunk of memory that can hold 20 integers
    int *numbers[20] = malloc((sizeof (int) * 20);

{% endhighlight %}

As you can see, we are assigning a chunk of memory that is being given by the computer through `malloc()` to a pointer variable. 
In line 2, we can describe it as we are requesting for a chunk of memory that is worth 4 bytes (the size of float) then 
assigning the pointer of the newly created memory chunk to a pointer variable named `f`. 

Keep in mind that we are using the `sizeof` operator here so that we can reduce throwing magic numbers in our program. Also, 
in this way, we can keep sustain our program some portability (the ability to run on other systems without much dependencies). 

Also, if `malloc()` cannot find some free memory, it will return a null pointer (`NULL`). 

This adds up another use case for the null pointer wherein we can check to know whether `malloc()` successfully obtained some 
memory for our program in order to prevent an accidental dereferencing and cause a segfault and do some error-handling, as well.
```c
    // creating
    float *arr = malloc(sizeof(float) * 10);

    if (arr == NULL) /* we can also use if (!arr) */
    {
        /* error-handling code */
    }
    
    /* continue on if it does returned a memory chunks */
```

Now, as previously mentioned, here's the problem when creating dynamically-allocated memory: it does not automatically 
deallocated or returned to the system once the function that created the dynamic allocation of the memory has finishes execution. 
We would have to free it ourselves with the `free()` function on C/C++.

Now, freeing the allocated memory is easy compared to creating the dynamic memory. All the `free()` function needs is a 
pointer that with the memory chunk being malloc'd.
```c

    int *a = malloc(sizeof(int) * 2);
    if (a == NULL)
    {
        /* error-handling code */
    }

    /* do some stuff with a */

    /* assume that we are done with it */
    free(a);

```

With that said, there are some things that you want to take in mind, specifically, the three golden rules of dynamic memory 
allocation (as ripped off from [CS50's Dynamic Memory Allocation video](https://www.youtube.com/watch?v=9uhSYDY4sxA)):
- every block of memory that have borrowed needs to be freed
- only `free()` what you have `malloc()`'d
- never `free()` the same `malloc`'d block twice

Well, generally, bad things can happen since we are talking about interacting with memory here and it might affect other 
programs, too.

As previously mentioned, there are some related functions of the `malloc()` family such as `realloc()` and `calloc()`.

### `realloc()`
Syntax: `realloc(void* ptr, size_t size)`

The `realloc()` function accepts a pointer to a malloc'd memory followed with the new size of the memory. It will deallocate the 
old chunk from where the `ptr` is pointing to and find a new one that is worth `size` bytes. Like `malloc()`, it will return a 
pointer to the new chunk and if it fails, it will return `NULL` instead.

```c

    int *user_id = malloc(sizeof(int) * no_of_users);
    if (user_id == NULL)
    {
        printf("malloc failed.");
        return 1;
    }

    /* some code */

    /* if you need to allocate some memory for the new data */
    realloc(user_id, sizeof(int) * new_no_of_users);
    if (!user_id) /* this is just the same as user_id == NULL */
    {
        printf("reallocation failed.");
        return 1;
    }

```

### `calloc()`
Syntax: `calloc(size_t n_items, size_t size)`

`calloc()` does the automatic initialization of the values inside of the memory for you so you don't have to worry about the 
garbage values. The functions also need two parameters except it requires the number of elements as its first value and the 
size (in bytes) of each element as its second value. The return value of the function is the same, however, as it returns a 
pointer to the newly allocated memory block and `NULL` if the function fails.

```c

    int number = 9;

    /* allocating 36 bytes into the heap and initializing them to 0 */
    int *mem_chunk = calloc(number, sizeof(int));
    
```

<!-- TODO: Our beloved resources section -->
## (Re)Sources:
- ### Books
    - [Chapter 22: Pointers on *C Notes For Professionals (Goalkicker)*](https://goalkicker.com/CBook/)
    - [Chapter 3: Hardware on *Computer Science Made Simple (V. Anton Spraul)*](https://www.amazon.com/Computer-Science-Made-Simple-hardware/dp/0767917073)
    - [Chapter 46: Memory Management on *C Notes For Professionals (Goalkicker)*](https://goalkicker.com/CBook/)
    - [Learn the Basic Electronic Components from *Build Electronics*](https://www.build-electronic-circuits.com/dbe-components/)
- ### Videos
    - [Blinky Pointer Video from *Stanford University Archive*](https://www.youtube.com/watch?v=f-pJlnpkLp0)
    - [Call Stack on *CS50*](https://www.youtube.com/watch?v=aCPkszeKRa4)
    - [Dynamic Memory Allocation on *CS50*](https://www.youtube.com/watch?v=9uhSYDY4sxA)
    - [Lecture on Memory from *CS50*](https://www.youtube.com/watch?v=Zn8OJMYT-gc)
    - [Pointers on *CS50*](https://www.youtube.com/watch?v=XISnO2YhnsY)
- ### Web
    - [Computer Memory from *Tutorials Point*](https://www.tutorialspoint.com/computer_fundamentals/computer_memory.htm)
    - [Computer memory on *Wikipedia*](https://en.wikipedia.org/wiki/Computer_memory)
    - [Heap and Stack Overflow from *GeeksForGeeks*](https://www.geeksforgeeks.org/heap-overflow-stack-overflow/)
    - [Memory Layout for C from *GeeksForGeeks*](https://www.geeksforgeeks.org/memory-layout-of-c-program/)
    - [Memory: Stack vs Heap by *Paul Gribble*](https://www.gribblelab.org/CBootCamp/7_Memory_Stack_vs_Heap.html)
    - [Null Pointer in C from *GeeksForGeeks*](https://www.geeksforgeeks.org/few-bytes-on-null-pointer-in-c/)
    - [What and where is the stack and heap on *Stack Overflow*](https://stackoverflow.com/q/79923)

## Where to go from here?
Here are some of the topics/concepts that you'll expect to encounter if you want to progress from this type of topic:
- Some data structures 
- Assembly programming (I guess way too advanced?)
- Electronics integration (y'know from computer engineering and stuff)

## Author's Note
Yes, it is another new series that's called *Simplified!* which sounds like one of the most common name for a beginner-friendly 
kind of posts out there. If there's a more cool-sounding name, I would take it but I'm not good at naming things. If we would 
take the previous regular posts such as [this one]({{ site.baseurl }}{% post_url 2018-06-21-a-closer-look-on-computers %}) or [that one]({{ site.baseurl }}{% post_url 2018-05-18-git-concepts-and-mechanics %}), they would be probably one on the series too but I don't want to include 
them in this series since I'm currently making a new writing and content style.

So I put the debut of this kind of series since I might make an more detailed version of this topic. It is kind of an interesting 
take since this topic of memory management goes beyond the things whatever I've explained above. If you want to get a more 
technical version of it, you can research about it yourself with Google, Stack Overflow, and a lot of resources regarding computer 
science or programming, in general.

If there is anything that ticks you off from my very simple drawing (such as the mistakes and accidents), cut me some slack as 
this is my first time. Although I can just restart with a new paper, I don't *really* want to waste paper.

**NOTE**: This article may undergo changes as I'm trying to explain the concepts better in a better and consistent way, same with 
other articles.