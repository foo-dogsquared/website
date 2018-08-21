---
layout: post
title:  "[Simplified!] The Shock of Knowing Electronics"
alt_title: "Simplified! :: Introduction to Electronics I"
date: 2018-08-18 00:52:05 +0800
author: foo-dogsquared
categories: electronics
tags: [programming-notes, electronics, simplified]
---

<!-- TODO: Introduction to electronics and how it affects our lives today -->
Electricity, arguably the most important discovery of mankind. This incredibly amazing thing overwritten the humanity's way of 
living from manufacturing, transportation, utilities, infrastructure, agriculture, and computing which includes our common 
computers that can serve a variety of purposes such as calculating simple arithmetic to complex functions, play games, create 
digital art, and creating programs.

<!-- PICTODO: insert image here of different electronic devices -->
<img src="https://source.unsplash.com/Ae5jmF2PJXg/1024x512" alt="Different electronic devices at usual life.">

You get the idea, electricity pretty much integrates with everything now and it helped us a lot in a lot of ways. If you would 
think of an object that doesn't involve electricity, you would have a hard time thinking about that. 

I mean coins is an object that doesn't involve electricity but how are the coins created in the first place? Machines which does 
use electricity.

How about the clothes? Surely, there are some clothes that are created by hand but then most of them are created from the 
machines in order to mass produce them. There's also the sewing machine which it does have a mechanical version of it but 
nowadays, it is mostly electrical now.

Let's dive right into the world of electronics where these things are usually at your crafting table.

HINT: You can skip some of them since electronics is really a practical subject on the beginner level but that doesn't necessarily mean 
that you can go and be comfortable in electronics without understanding them.

<!-- TODO: How one can start studying electronics -->
## A new start on the world of electronics
OK. Now you want to make your feet wet into the waters of electronics. Usually, in order to get into electronics, you would need to have 
some components and tools. Otherwise, you would just go through the knowledge materials that you refer to as if it is just another storybook 
— to keep you entertained with all of the theoretical topics for a while and move on to the next one.

Entering the world of electronics can be sometimes a mess and will make your workspace looks like a garage that needs a yard sale so be 
prepared to be get your hands dirty and get your organizing skills on to your daily toolbelt. (Or you know, get a container suitable for the 
components and you won't have a big worry, probably.)

<!-- PICTODO: example of a workspace -->
<img src="{{ 'assets/pictures/intro-to-electronics/my-workspace.png' | relative_url }}" alt="My workspace.">
<p class="caption">Also, welcome to my chaotic workspace, everybody.</p>

Usually, with electronics, you would want to have some basic components like LEDs, resistors, capacitors, switches, integrated circuits, and 
transistors and some tools like a breadboard, wire splicer, tweezers, and your ol' handy-dandy paper and pen because we are not 
really going full-on engineering without some kind of planning and theoretical stuff, right?

I would recommend to research more about the electronic components afterwards but for now, let's take a very quick glance over each components 
for a very quick headstart:
- breadboard — mainly serves as prototyping tool for the circuit (we'll get to that later)
- light-emitting diodes — also known simply as LEDs; they are not only used for illumination but also serves as indicators for our devices
- resistors — control the electricity flow by reducing the voltage from the flow
- capacitors — store a bit of electricity
- switches — simply connect or disconnect the electricity flow
- transistors — they are simply switches that redirects electricity flow by the electrical signals
- integrated circuits — it refers to any circuit that is *integrated* into a chip or any viable small container

<!-- PICTODO: insert image here of the different electronic components like the breadboard, transistors, resistors, wires, and such -->
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Componentes.JPG/1200px-Componentes.JPG">
<p class="caption">Can you identify some parts at the end of the part two of this entry?</p>

With all of these said, it is usually recommended for a complete beginner to just buy an beginners' electronic kit since all of the materials 
needed to get started are already there. You would just have to practice to choose components yourself on the later part when you are more 
comfortable with the mechanics of each components and the tools.

<!-- TODO: Introduce the concept of electricity -->
## Electricity
In order to start raring into building those DIY electronics stuff that you always see on different websites, you have to be 
familiar with the foundational concept(s) it is based upon which is *electricity*. It is the driving force of the devices 
you always interact with: personal computers, smartphones, remote control, lamps, doorbells, cars, and sub-infinitely more, as you 
can tell.

Electricity seems magical to an person who is not familiar with the inner workings of it. Let's start with a seemingly simple example, 
like the remote controller for your TV. It is mainly made up of buttons and when we press those buttons, stuff happens. Like if we press 
the button for increasing the volume, the audio output from the TV does increases. It all seems like a mysterious magical box/rectangle 
thing with the buttons that can indeed do stuff in your TV.

Or if you have fiddled something like fixing a light bulb, for example.

We connect the light bulb's terminal with two connecting wires, then connect the other end of the two wires with a battery and place it appropriate to the charges to the battery, and voila, the light bulb lit up. How does that even work?

As it turns out, the force that makes your electronic devices work as they should be is made up of atoms — very small particles that can 
only be seen through a special kind of microscope. These atoms, as you probably encountered before on school, the basic building blocks of 
everything we can see in the universe and are made up of three smaller particles: the neutron, the proton, and the electron. The latter two of 
which have electrical charges: proton usually has a positive charge, and electron usually has a negative charge. In most circumstances, 
the protons and the neutrons make up the nucleus and the electrons just fly outside of the nucleus orbitting around it. So yeah, we can 
imagine it as if the atom is like the solar system: the nucleus is the sun and the electrons are the planets orbitting around it.

<!-- PICTODO: insert image of the structure of an atom with the labelling of its parts -->
<img src="{{ 'assets/pictures/intro-to-electronics/atom-structure.jpg' | relative_url }}" alt="Structure of an atom">

The number of protons and electrons make up the composition and define what type of atom it is. For instance, if we would want to have 
a hydrogen atom, we would just have an atom that is mainly composed of one proton and one electron. Substances containing only one type 
of atom are often referred to as an *element* as in the elements that can be found in the periodic table.

<!-- PICTODO: insert image here of a hydrogen atom -->
<img src="{{ 'assets/pictures/intro-to-electronics/hydrogen-atom.jpg' | relative_url }}" alt="Hydrogen atom">

Objects (i.e. a chair, a speaker, or a USB cable) and materials (i.e. leather, rubber, or plastic) are a larger bunch altogether that 
these are usually made from several elements mixed together into what they call a *compound*. These compounds and elements are what 
makes up the objects and materials. Usually, these composition also what dictates how components of the atoms move and interact.

But really, what we are specifically looking for in here is the electrons. They are the culprit in making electronic things do stuff.

## Electric charges
Each of these particles, as you know from basic physics, have what they call an *electric charge* which describes how they would interact with 
another particle. Protons and electrons are both particles that are electrically charged, they just have different type of charges. As 
previously mentioned, protons usually have a positive charge while electrons have a negative charge. This would dictate how particles would 
interact with each other: positively-charged particles would attract to negatively-charged particles and repel fellow positively-charged
particles. The same behaviour describes how negatively-charged particles do except the type of particle in each type of interaction is 
reversed. This behavior is very similar to the how magnet poles work. Magnets with two poles would have its both end attracted to its opposite 
pole and repelled to the same pole. This is what essentially the *Law of Attraction* is.
> Like charges repel, opposite charges attract.

<!-- PICTODO: insert image of a magnet with two opposite poles -->
<img src="{{ 'assets/pictures/intro-to-electronics/law-of-attraction.jpg' | relative_url }}" alt="Law of attraction">

There are some objects whose the atoms’ electrons are freely flying around the atom shell, labelling them to be as *free electrons*. These 
extra electrons are now moving freely wherever they want as long as they hang around the atom unless they are being interacted with an 
outside force.

The number of free electrons around an object is used to describe the charge of the object. Having too many electrons can be said that the object is negatively charged and having a few missing electrons renders the object positively charged.

*Conductors* such as metals are defined as letting these extra electrons to flow around since the materials are loosely bound, so much loose 
that the free electrons are jumping from atom to atom.
*Insulators* such as wood, leather and plastic, on the other hand, are so tightly packed that the electrons cannot move around. They just 
sit there with the electrons and the protons stay in one place.

Another thing with the electric charge is that it is the underlying most basic quantity to be used on electronic systems. We can express it 
on mathematical terms.

(For the sake of the scope of this post, I'm going to keep it at a minimal.)

Take note that a coulomb is used to describe the magnitude carried by \\(6.241 * (10^{18})\\) electrons in a second.

Electric charge is using coulomb (C) (pronounced as "col-lume") as the unit of measurement. As you may have encountered on your high school 
physics, there is a constant called the [elementary charge](https://en.wikipedia.org/wiki/Elementary_charge) in which it describes the 
charge of a proton. You may not have heard the term but you have likely encountered that \\(e^+\\) is equal to \\(1.602 * (10^{-19}) C\\). 
The charge of a single electron can be denoted as \\(e^-\\) and it is equivalent to the charge of proton, albeit negative.

With this equating the balance between them, an object can stay electrically neutral but even if the object has a 
charge, the net charge is still down to zero. We cannot really add nor subtract the amount charge on the particle without affecting the other. 
This is what the *law of conservation of change* is all about:
> Energy can neither be created nor destroyed, only transferred.

Therefore, charge can neither be created nor destroyed, only transferred.

While we're on the topic of electric charges, let's go and jump through some of the very important concepts when it comes to electronics like: 
- electric flow
- current
- voltage
- resistance

<!-- TODO: Introductory concepts -->
## The fundamental concepts of electricity
The previously mentioned four concepts pretty much sums up of what you would always encounter when dwelling further into electronics. 

### Electric flow
This refers to the movement of electrons around a circuit.

[As of tradition](https://en.wikipedia.org/wiki/Hydraulic_analogy) (or I just can't think of another analogy), let's imagine the 
electrical circuit as a water pipe system. You most likely know the appearance and components of an electric circuit even if you haven't 
interacted with it that much. In a simple electrical circuit like a LED circuit, there is:
- wire as the water pipe
- the battery as the water pump
- the resistor as the narrower water pipe thing
- the LED as the faucet, releasing energy as heat

Take note of this analogy as we will continuously add comparisons as we go on further into the concepts.

<!-- PICTODO: electrical circuit and water pipe analogy -->
<img src="https://upload.wikimedia.org/wikipedia/commons/d/d8/Electronic-hydraulic_analogy.svg" alt="Water pipe analogy">
<p class="caption">Water pipe analogy (I have to put a picture there)</p>

How does an electric flow occurs?

Starting from the big picture. We know that objects are made from atoms. We know that atoms are composed of electrons, protons, and neutrons. 
We certainly know that electrons hang around the orbit of the protons and neutrons forming a nuclei at the center. We know that there are 
certainly some free electrons that are hanging around outside of that atom shell. We know, for certain, that electrons repel from each other 
and attracts to a proton. 

Let's think about that last statement and elaborate with an example. Let's think of a simple chain of atoms with some electrons orbitting 
around them.

<!-- PICTODO: picture of a chain of atoms -->
<img src="{{ 'assets/pictures/intro-to-electronics/chain-of-atoms.jpg' | relative_url }}" alt="A chain of atoms">
<p class="caption" >A chain of atoms</p>

Let's imagine there's an electron is moving for whatever reason.

<!-- PICTODO: picture of a moving electron with its path -->
<img src="{{ 'assets/pictures/intro-to-electronics/atom-chain-movement.jpg' | relative_url }}" alt="A chain of atoms">
<p class="caption" >Then a chain reaction will occur</p>

Since electrons repel from each other, whenever there's a movement of an electron, surely there will be other electrons that will be affected 
from it. Even though this is not true for most of the time, we can say that we can move one electron without affecting the other.

From the example above, let's scale things up from a chain of atoms to an assembly to atoms, say from a conductor.

<!-- PICTODO: atom arrangement of a conductor -->
<img src="{{ 'assets/pictures/intro-to-electronics/conductor-atom-composition.jpg' | relative_url }}" alt="The atoms inside of a conductor, probably">
<p class="caption" >Simplified representation of the atom structure inside of a conductor</p>

Since conductors have an arrangement that is loosely bound only held by protons that stay in one place preserving the structure of the 
metal, electrons can freely move jumping from one atom to another. From that point, we can really see the chaotic and numerous movements that 
will occur when one electron moves.

Now let's imagine that conductor is now a part of an electric circuit which unlike [that circuit], this is made up of materials that can 
let electrons flow, AKA conductors. If there is any force that made electrons move, try to imagine what will happen now that it is in a 
complete circuit. Since we are now essentially connecting conductors to form a path for the electrons, the electrons have more space 
to explore and in case there is a force that made the electrons move, a chain reaction will occur between electrons. An electron will push 
away an electron and that electron will push other electrons which in turn will push other electrons in their way as they're being repelled. 

**Within a circuit, they're basically going on a circle. An endless loop of repelling electrons going on circles until the forces that is making them move in the first place stops interferring.**

That is how an electric flow occurs in its basic form.

In the water pipe system analogy, we can simply say that the electric flow is simply when the water pump starts to work to create the force 
that makes the water go through the pipes.

<!-- PICTODO: electric flow vs water flow -->

### Current
The second item on the list is the current which, simply **describes the flow of the electricity by measuring the number of charge carriers (usually electrons) passing through a single point in any given time**.

Continuing the water pipe analogy, the current is the amount of water flowing through at a certain point. In fact, the word current is 
borrowed from a unit in hydraulics that describes the amount of water flowing through at a certain point. The more you know. 🌈⭐


Current is usually uses the SI unit, amperes (A) or amps, for short. An ampere is said to be about \\(6.241 * (10^{18})\\) flowing electrons per 
second. You don't need to memorize that number, just know that an ampere measures a lot of electrons is flowing. As we start out from our 
journey of learning electronics from the very beginning, we often work with electronic system that utilizes a lot fewer of these amperes, most 
of them does not even go up to 1 unit of ampere. Devices such as a mouse, antenna, and those small-scale DIY electronic projects you see on 
the internet uses amperes ranging from microamps (μA) to miliamps (mA) when compared to the common appliances like the fridges, vacuum cleaner 
and a television wherein each appliances usually uses more than 1A.

Speaking of amperes, the unit Coulomb (C) is related to it in a way that it describes the magnitude of a certain number.

Remember what 1C represents and how many electrons in an ampere? Both of them measures around \\(6.241 * (10^{18})\\) electrons. So we can say 
that an ampere is equal to one coulomb of charge per second.

<!-- Representation of an ampere with a coulomb -->

$$ 1 A = \frac{1 C}{1 s}$$

### Voltage
The third variable on the list is the voltage. We can simply say that voltage is the force that pushes around the electron so that the 
electric flow can start but there's a slight confusion around the term. The technical term for the force that pushes around the electron is 
the *electromotive force* (EMF) but we can still use the term "voltage" to describe the necessary force to make electron flow happens. 

To make things easier to understand between this, the force that makes free electrons flow is what electromotive force *is* and to make the 
force that makes the free electrons flow is what voltage *does*.

Now let's talk about what voltage *is*.

As stated from [Afrotechmod's video on voltage](https://www.youtube.com/watch?v=TBt-kxYfync), "**Voltage is a difference in electrical potential energy per unit of charge between two points.**"

Let's break the definition down by discussing the definition of the keywords in the definition.

As you have encountered on elementary physics, *energy* is the ability to do work. Work simply means any action whether it is moving of 
things, heating of things, or transforming of energy into something else.

*Potential energy* is the potential to do work. Like an object in an elevated height, having the potential to do work by the gravity that 
constantly pulls down everything only blocked by the ground it standing on. Another example is with an arrow ready to be fired from the bow, 
the arrow has a potential energy that is being held by the bowstring. The moment that bowstring is released, the arrow will propel, 
actually utilizing and releasing energy and interaction with the objects in its way. 

<!-- PICTODO: object in height -->

How about *electrical potential energy*? Simply put, it is electrical energy with the potential to do work. The battery, when 
left alone doing nothing, has an electrical potential energy. Same with the conductors whose free electrons are just waiting to get out and 
move on to different parts of the circuit. Or any components waiting for their work, generally.

Next is the *per unit of charge* part of the definition. That's easy as we've already discussed that before: coulombs. A coulomb is a *unit* 
of charge. What about for energy? Generally, when talking about energy, it uses what they call a *joule*. Therefore, one of the ways to 
describe voltage in units is \\(V = \frac{J}{C}\\). To put it into words: for each coulomb of charge flowing through the circuit, a certain 
amount of joules of energy is released.

OK. Now's let take a look at the definition again:
> Voltage is a **difference** in electrical potential energy per unit of charge **between two points**.

A difference of electrical potential energy between two points. Generally, in order to have a difference, one has to be higher and the 
measure that is being based the number of electrons. One has to be positively charged (aka lack of free electrons) and the other to be 
negatively charged (aka has too many electrons). Yeah, it is the reason why batteries have a negative and positive terminals. 

In the cases of batteries, we can say that the voltage is the difference of potential energy between those two terminals.

<!-- PICTODO: water pipe analogy on voltage -->

In case you're still holding to the water pipe analogy, voltage is basically pressure, the force that pushes water around the pipe circuit. 
Also, you may see voltage is being called into its other names such as *potential difference*, *tension*, and even *pressure*.

### Resistance
Last but not the least, the resistance which in its most essence the measurement of getting against the electric flow. This is probably one 
of the hardest to configure, at least in my personal experiences. As the lack of this ingredient will cause your component to blow up. 
However, this does emphasize the importance of applying resistance into our circuit.

<!-- elaborate on what the resistance is all about -->
**Resistance simply measures the strength of opposition of an object / electronic component from the current**. In other words, resistance 
is the ability to go against the flow.

Resistance uses the SI unit, *ohms*, represented by the Greek uppercase letter omega (Ω). 

When the resistance value is more than the current, it defeats the purpose of the resistance as it is made to reduce the amount of current 
that's flowing into. Think about it, even if we have never tinkered too much with an electric circuit, we know when we've put too much 
resistance on the circuit, the circuit will not work as if no current is flowing at all or it will have a very weak electron flow. For 
exmaple, if we have a simple LED circuit with a resistor whose value is too high, the LED will have a dimmer light compared when applied 
with a resistor with lower resistance (don't directly connect the LED with the batter alone, though, it will burn out). 

If we were to represent the resistance in the water pipe system analogy, it will be a narrower pipe. There will be a decrease on the amount 
of water that will flow through it.

<!-- PICTODO: the water pipe system analogy on resistance -->

## Ohm's Law
Now that we have discussed the three main variables which are current, voltage, and resistance, we can now go into details of how they 
relate to each other.

Enter Georg Ohm, who is the first to be recognized to say that there is a relationship between the three. He noticed that the current is 
directly proportional to the voltage, coupled with the concept of resistance. Ever since, scientists agreed and decided to make it as a 
law... or something. And here we are, discussing about *Ohm's Law*. 

**As previously mentioned two sentences ago, Ohm's Law states that the current is directly proportional to the voltage.**

However, there is another variable included in the circuit and that is the resistance. Knowing how resistance would work in a circuit, you 
can conclude the mathematical relationship between them:

$$ I = \frac{V}{R} $$

Knowing that it is a algebraic representation of their relationship, you can derive the formulas on how to get the remaining variables.

For voltage:
$$ V = I * R $$

For resistance:
$$ R = \frac{V}{I} $$

I find it much easier if you would take the formula for voltage in mind, practically speaking, since it is much easier to derive formulas 
from that point compared to others.

As we go on to the practical side of electronics, we will see how to use in practical application but for now, let's get up and running with 
an example:

<!-- TODO: OHM"s LAW problem exmaple 1 -->
Say that we have a 9V battery with an LED that tolerates up to 20mA. How much resistance are we going to apply to the circuit?

Well, the unknown value is resistance so let's use the formula, \\(R = \frac{V}{I}\\).

We just integrate our given values into the formula, then that's it. The given values are our voltage (\\(V\\)) which is 9 and for the current 
(\\(I\\)) which is 20mA. Since the standard unit for the current is an amp (A), we would convert the values into its appropriate units. In 
this case, we simply convert 20mA (miliamps) into A (amp).

To convert the needed value for the current with the simple use of dimensional analysis (a term for checking the relation of one unit to 
another): $$ 20mA * \frac{1A}{1000mA} = 0.02A $$

$$ R = \frac{V}{I} $$

$$ R = \frac{9V}{0.02A} = 450Ω $$

So we need 450Ω to balance out the circuit.

## Summary
Before we get to the practical part of electronics, we have to be familiar with the inner workings of the circuit, the main thing we are 
working with when go tinker around.

Objects are made up of atoms and each of these are made up of smaller particles, namely: *protons*, *neutrons*, and *electrons*. 
Each of these particles can be found numerously, with the protons and neutrons staying in the center forming a nucleus and 
the electrons orbitting around the nucleus. 

However, there are also electrons that hang outside of the atom shell called the *free electrons*. The number of electrons dictate the 
*charge* of the particle. Having too many is considered to be negatively charged and having an inadequate number is considered to be 
positively charged.

The charge of a particle also dictates how they interact with the other particles. *Like charges repel and opposite charges attract*.

*Conductors* such as metals have a structure that is loosely holding these electrons with only the nucleus (the protons and the neutrons) 
stay constantly which is why conductors can still hold their form. *Insulators* such as plastic, on the other hand, have an atom 
structure that is very strict, the free electrons cannot freely move from atom to atom.

*Electric circuits* are made up of conductors and insulators, regulating and handling electric flow through different *electronic components* (which will be talked about in the next part).

Inside of the circuit, there is a lot of electrons. These electrons are just staying on the component unless there is force that makes them 
move and be pushed around on the circuit. If the force exists to push around the electrons, these electrons will start a domino effect wherein 
one electron repels the other then that electron will also repel the other electrons.

Then if we have a complete circuit that is working, these electrons will just continually push other as they are being attracted into the 
positively charged terminal then being pushed again by the negatively charged terminal, creating a loop that just keeps going. This is what 
an *electric flow* is. 

There are three main variables in a circuit:
- the *current* — the flow of the circuit
- the *voltage* — the strength of the flow of the circuit
- the *resistance* — the limiter of the strength or else the components of the circuit may recieve too much flow and burn out

When we try to combine these variables in a circuit, we can use a formula to check their values. This is also useful if we try to solve for 
some values in order to balance them out and not get an extreme situation where we either burn out the components or made the components too 
weak. 

$$ I = \frac{V}{R} $$

That formula derived is from the Ohm's Law which states the current is proportional to the voltage but with the resistance being considered.

------

OK. We are mostly done with the theoretical parts of electronics. I decided to make this into a two-parter since it is quite long (about 
more than 40 minutes worth of reading in total time). It is better to split it up into two 20 minutes sessions than a whole 40 minute session. 
Besides, [spaced repetition](https://en.wikipedia.org/wiki/Spaced_repetition) is a good learning technique than cramming down the whole 
thing down in one swoop.

There will be an upcoming part two of this post, so stay tuned on that!

## (Re)Sources:
- ### Books
    - [*Electronics For Kids (No Starch Press)*](https://www.nostarch.com/electronicsforkids/)
    - [Part 1: DC Circuits on *Fundamentals of Electric Circuits, 6th Edition (Alexander & Sadiku)*](https://www.amazon.com/Fundamentals-Electric-Circuits-Charles-Alexander/dp/0078028221)
    - [Part 1: Fathoming the Fundaments of Electronics on *Electronics For Dummies, 3rd Edition (Wiley and Sons Inc.)*](https://www.amazon.com/Electronics-Dummies-Cathleen-Shamieh/dp/1119117976/)
- ### Videos
    - [Basic Electricity - Resistance and Ohm's Law by *Afrotechmods*](https://www.youtube.com/watch?v=NfcgA1axPLo)
    - [Basic Electricity - Voltage by *Afrotechmods*](https://www.youtube.com/watch?v=TBt-kxYfync)
    - [Basic Electricity - What is an amp? by *Afrotechmods*](https://www.youtube.com/watch?v=8gvJzrjwjds)
    - [Electric Charge from *Crash Courses*](https://www.youtube.com/watch?v=TFlVWf8JX4A)
    - [How to use a breadboard by ](https://www.youtube.com/watch?v=6WReFkfrUIk)
    - [LED Basics by *Afrotechmods*](https://www.youtube.com/watch?v=Yo6JI_bzUzo)
    - [Simple guide to electronic components by *bigclivedotcom*](https://www.youtube.com/watch?v=6Maq5IyHSuc)
- ### Web
    - [Breadboard on *Wikipedia*](https://en.wikipedia.org/wiki/Breadboard)
    - [Coulomb on *Wikipedia*](https://en.wikipedia.org/wiki/Coulomb)
    - [Difference Between EMF and Voltage from *Difference Between*](https://www.differencebetween.com/difference-between-emf-and-vs-voltage/)
    - [Electric charge on *Wikipedia*](https://en.wikipedia.org/wiki/Electric_charge)
    - [Electromotive force on *Wikipedia*](https://en.wikipedia.org/wiki/Electromotive_force)
    - [Electronics for beginners on *Explain That Stuff*](https://www.explainthatstuff.com/electronics.html)
    - [Learn the Basic Electronic Components from *Build Electronic Circuits*](https://www.build-electronic-circuits.com/dbe-components/)
    - [What is the difference between emf and voltage? from *Quora*](https://www.quora.com/What-is-the-difference-between-emf-and-voltage)
    - [What You Need to Know About Current, Voltage and Resistance from *Build Electronic Circuits*](https://www.build-electronic-circuits.com/current-voltage-resistance/)
    - [Voltage on *Wikipedia*](https://en.wikipedia.org/wiki/Voltage)

## Choose your own learning adventure
Well there are some things that are not discussed in here (which may or may not be added) such as:
- Electronic schematics/diagrams
- Practical application of the electronics (psst... it is what the next part of this post is about)
- A deeper theoretical integration of the fundamental concepts

## Author's Note
Image credits to [Unsplash](http://unsplash.com/), [Wikimedia Commons](https://commons.wikimedia.org/wiki/Main_Page), and me. All credits 
deserve to the author with their rights. 😁

[This Unsplash photo](https://unsplash.com/photos/Ae5jmF2PJXg) is from [Jens Johnsson](https://unsplash.com/@jens_johnsson), the 
[components photo from Wikimedia](https://en.wikipedia.org/wiki/File:Componentes.JPG) is from the author, [Kae](https://commons.wikimedia.org/wiki/User:Kae).
While I created the pictures with Paint 3D from Windows (IDK how to Illustrative/Inkscape/Sketch, OK?).

All pictures used (including mine, if anyone wants to use it for some reason) are free for use for any purpose (mostly).