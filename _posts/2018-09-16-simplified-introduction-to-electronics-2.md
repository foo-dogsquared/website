---
layout: post
title:  "[Simplified!] Introduction to Electronics II"
date: 2018-09-16 18:00:05 +0800
author: foo-dogsquared
categories: electronics
tags: [programming-notes, electronics, simplified]
---

First things first, this is the second part of the whole post. You might want to go to the [first part]({{ site.baseurl }}{% post_url 2018-08-18-simplified-introduction-to-electronics-1 %}) 
in order to get the context but if you have read it or have an idea about the related topics, then let's continue on.

Now that we have discussed the non-tangible part of the electronics section, let's go and talk about the stuff that we are actually going 
to see a lot when we practically apply our electrical skills: electronic components and their functions, circuits, and more things to come as
we go on our way.

So let's get started into the very first thing to do when introducing our topic:

<!-- TODO: Ohm's Law -->
## What is electronics?
Yes, we haven't started discussing what electronics is.

Taking the whole definition of the word according from the book *Electronics For Dummies, 3rd Edition*:
> The word electronics describes both the field of study that focuses on the control of electrical energy and the physical systems (including circuits, components, and interconnections) that implement this control of electrical energy.

**In other words, electronics is a subject where we need to precisely control electrons to flow throughout an electronic system in order to do the things we would expect.**

"How do I make the lightbulb lit up"? Simple, we just need some wire that can conduct things, connect it to our bulb, connect them through a 
source and make a complete circuit.

"Now I want to make an LED lit up". We also just make a circuit similar to it and then... Oh, it burned out. It probably has too much current 
on there, we need a resistor that can reduce the electric charge flowing through our LED. Also, we need a new LED.

That is just some of the experiences I've had when trying out these things and I'm sure you will have those moments, too. Well, that's enough 
out-of-persona writing for today, I suppose.

In the world of electronics and when we actually do a practical application of the subject, it is mostly composed of controlling electrical 
charges in a precise manner. It is really a matter of getting our components to work on our circuits and hoping that it doesn't blow up. The 
way how electricity and circuits work is the little details that goes with it. Any slight misadjustment to our circuit arrangement may cause 
for the circuit to not entirely work. One electronic component that isn't working is all it takes to not make our circuit work, depending 
on the type of circuit that we built, of course. 

With those things that you'll expect, this contributed to the impression that starting out electronics is hard (aside from money that you'll 
shell out). However, this emphasizes why we need to study a bit about the inner workings of the electric circuits through their very 
components: the particles.

## Electrical circuits
OK, now that we have discussed what electronics is all about, let's talk about what all you're going to encounter: electrical circuits.

**Electrical circuits are made up of electronic components that lets electrons to flow around them completing a loop**.
We, as aspiring electrical engineers, have the objective of building circuits to make sure we have led electrons to flow to their destinations 
and do the tasks that we want them to do: lighting up an LED, making a running light, building a sound amplifier, and all sorts of good stuff.

Basically, circuits are classified according whether the circuit has been *closed* or *open*.

Closed circuits are basically what circuits are, providing the electronic components the amount of energy they needed in order to make them 
work since electrons continuously move.

![A closed circuit example in schematics]({{ 'assets/pictures/intro-to-electronics/closed-circuit.svg' | relative_url }})
<p class="caption">*A closed circuit of an LED with a resistor*</p>

Open circuits, on the other hand, did not make a complete closure or a break in the path, leaving the electrons to move but not 
continuously go in a loop. In other words, there will be no flow or current of electrons despite that there is a source of voltage.

![An open circuit example in schematics]({{ 'assets/pictures/intro-to-electronics/open-circuit.svg' | relative_url }})
<p class="caption">*An open circuit of an LED with a resistor*</p>

You might notice that the term *open circuit* is a bit of an oxymoron since the characteristic of a circuit is that it must complete a 
loop. To make things less confusing, we mostly refer the term by classifying the design of the circuit. 

![A switch circuit in schematics]({{ 'assets/pictures/intro-to-electronics/switch-circuit.svg' | relative_url }})
<p class="caption">*A switch circuit*</p>

Take note of a switch circuit as an example. Referring to the schematic given above, we have a simple circuit with an LED, a resistor, and a 
push button switch which will only let electric charges flow when the button is pushed. An inactive switch basically makes the circuit open 
but triggering it will cause it to be a closed circuit, thus the circuit will work and the LED will be lit up.

*Open circuits* may also refer if there is an accidental break in the path, something like an unintentional placement of components on a 
breadboard or a damaged component that renders it to be unusable and does not let the electrons flow through it.

Certainly like all things in life, circuits can get complex but we can break them all down into their basic components:
- *Source* — The origin of the force that causes the electrons to move around or in other words, *voltage*. Components that include in this category are batteries, electrical outlets, and a power module.
- *Load* — Similar to the term that we use to describe that one member of the group (although this one is more useful), the load is a component that consumes electricity. It is also the component that represents the function of the circuit from the lightbulb that illuminates an area to the robotic arm that can sense hotdog in its vicinity. Otherwise, there is really no point of building a circuit with the electrons just circling around, waiting to be converted into work.
- *Conductive path* — This refers to the conductors that provide the path for the electrons to flow through. Common examples include wires, 
metal strips, and metal sheets. 

## Schematics
Building a circuit schematic is basically a way to represent our circuit but its purpose does not end there. It also helps us to plan out 
our circuit to see where the electrons are flowing to and later on, monitor the variables of the circuit like the resistance, voltage, and 
current once we are more familiar with those elements integrated into circuit building.

**In other words, schematics is like a map that helps us to locate various components in a circuit.**

You've already saw some examples if you did not skip some parts, mostly referring the open and closed circuit illustration above. 

![A simple schematic]({{ 'assets/pictures/intro-to-electronics/closed-circuit.svg' | relative_url }})
<p class="caption">*A very simple example of an electronic schematic*</p>

Reading and understanding a schematic is a very important skill for an engineer even when it is not about electronics. Without it, we 
won't be able to understand what the circuit is all about, thus we would not be able to troubleshoot and debug it as effective as we would 
be.

Of course, you need to memorize the symbol (although not all of them since you have the internet nowadays) in order to write and understand 
schematics but writing out an effective and efficient circuit schematics requires an understanding of the electronic components that you'll be 
working with. There are some guidelines and standards when building out a circuit (and in hindsight, your schematics) but that is not the 
scope of this post and we'll just worry the little details we have from here.

Take note that the schematics doesn't only have the diagrams alone but also the different values that is associated with the components. 
Things like the resistance value for the resistors, the total voltage amount of the circuit, the amount of voltage that several components 
consumes on the circuit, and the amount of flow on the circuit are also included within to further help you troubleshoot and debug the 
circuit, if there's ever the problem of applying the wrong amount of values into it or something else.

Nowadays, there are softwares that aid you into building schematics like [Eagle](https://www.autodesk.com/products/eagle/free-download), 
[Tinkercad](https://www.tinkercad.com/), and [Fritzing](http://fritzing.org/) but for now, let's use a simple and intuitive one like 
[this online Circuit Diagram Editor](https://www.circuit-diagram.org/editor/). If you have already used similar softwares like those or 
already have a circuit building software that you are comfortable with, you may use it. It is just a recommendation, anyway.

## Ohm's Law
If you have read the first part of this post, you already have an idea of what this is about but still I think it is important since 
we are going to integrate this with a practical type of application.

As you may have encountered on your high school physics, Ohm's Law is generally a way to find out the missing component of a circuit but as 
you go on to apply the practical uses of it, I think you'll find it very useful.

Without further ado, here's the formula for Ohm's law:

$$ V = I * R $$

The law still has the same statement which is the about the current that is being directly proportional to voltage. Also, that is not the 
original formula, by the way, I just show you an easier way to reference it. 

Verbally speaking, we can say that the voltage (\\(V\\)) is directly proportional to the current (\\(I\\)) and resistance (\\(R\\)). Also take 
note that we can derive the formula to get the other variables, the current, for example, into this:

$$ I = \frac{V}{R} $$

The easier way to remember it is through the magic triangle most high school physics curriculum would teach:
![The Ohm's Law triangle]({{ 'assets/pictures/intro-to-electronics/ohms-law-triangle.jpg' | relative_url }})

When a variable in the formula has gone missing, you would just cover the component that is missing in the triangle and voila, you have 
your formula.

Let's say you want to know the resistance needed in order to make the circuit work at its optimal best. You would cover the representation of 
resistance in the triangle, in this case, the \\(R\\), then you would see the formula. Over time, you might not need as it is easy to 
remember it. Just remember one of the formula then you have the whole menu. You can just derive the other formulas algebraically.

![Example usage]({{ 'assets/pictures/intro-to-electronics/ohms-law-triangle-use.jpg' | relative_url }})
<p class="caption">*An example usage of the triangle*</p>

<!-- TODO: Individual parts of the components and materials -->
## Battery
Of course, in order to get your circuit working, you need to have a voltage source. You can have a circuit with a complete arrangement of 
electronic components and a complete route that loops through but as long as you don't have a voltage source, it will not do its work and 
it renders your circuit-building to be a bit pointless.

There are different kinds of batteries but knowing what kind of current they generate, the symbol for the common household battery that 
generates DC or electricity that flows only in one direction commonly looks like this:

![Schematic symbol of a battery](https://upload.wikimedia.org/wikipedia/commons/b/be/Symbol_baterie_2.svg)
<p class="caption">*Schematic symbol of a battery*</p>

There are different sources of voltage but as a beginner, we'll start out with something simple and something that we're quite familiar with: 
the battery cell. I call it a battery cell since it turns out that a battery is *group of units working together* and a 
*battery is made up of cells* which means a group of battery cell is a battery, like how most toys and some equipment requires a multiple 
battery cells of some kind.

A battery seems like a magical power source to those who are not familiar with it. It is a power source but it isn't exactly magical.

Being a voltage source, it has two points or sides, as we'll call it: one that is positively charged and the other that is negatively charged. 
We mostly refer to those two as a *terminal*, known as an *electrode*, so when we want to connect to the negative side, we call it as a 
negative terminal and so on. 

Well, we have two sides that are the opposite charge of each other but how do they do not reach into each other?

With the use of polarization which is a way of redistributing electrons and making both sides to be oppositely charged while still making the 
object electrically neutral. In this case, it is through a chemical called an *electrolyte* which makes oppositely charged particles 
(or *ions*) separate from each other and prevent the attraction from inside the cell.

What happens when you provide a conductive path between the two electrodes to make a circuit along with a load, some chemical processes start.
As the battery start to generate electromotive force through *electrochemical reactions*, ions start to move and as they have been blocked by 
the electrolyte inside of the cell, they have no choice but to flow out to the circuit. Positively charged atoms, on the other hand, starts to 
move towards the electrolyte wherein another chemical process will occur causing the incoming ions to flow out from the electrolyte, 
completing the circuit with these atoms flowing continuously.

## Light-emitting diodes (LED)
They are most likely your first buddies to make work on the circuit which is simply to light them up.

But before we can say what a LED does, let's take a quick look on the word that most likely caught your attention: *diodes*. A diode is 
simply a component that lets electricity flow in one direction. Think of them as a one way street, only letting traffic to flow in 
one direction. That's it. As you'd expect, they come in different forms and have different functions, not just illumination. There are 
diodes that are used as signal carriers, or light detectors, or even emit lasers. Just know that diodes are another electronic component, 
LED is just one of those kinds of diode.

The symbol of the LED is simply the symbol of the diode but with two arrows.

![Schematic symbol of an LED]({{ 'assets/pictures/intro-to-electronics/led-symbol.svg' | relative_url }})
<p class="caption">*Schematic symbol of an LED*</p>

Just a simple note: the line after the triangle represents the cathode or the negative electrode of the LED. It is easier to think that 
the line is simply the negative sign just rotated 90°.

Aside from illumination, you can use LEDs for other purposes such as an indicator for your devices to see if it has power or not, 
whether a particular unit inside of your device is functional, and stuff like that.

Now, an LED has what they call *polarity* which requires to be placed on a correct position when integrating it into your circuit. Generally, 
how an LED works is that it will enter from a positive electrode, the metal leg, and flows out from the negative electrode. You may sometimes 
see it being referred as the cathode being the negative terminal and the anode being the positive terminal but it can cause some confusion 
since the terms are also used for positive and negative ions, respectively.

![Inside of an LED](https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/%2B-_of_LED_2.svg/273px-%2B-_of_LED_2.svg.png)

Most of the time, they require little amount of charges so you have to be careful of applying too much charge or else they might burn out. 
And this is why you need a resistor.

So let's use it in a circuit, shall we? Hope you have a spare one.

Let's directly connect an LED into the ground without any resistor and see the magic... smoke.

![LED direct connection to ground]({{ 'assets/pictures/intro-to-electronics/led-direct-ground-circuit.svg' | relative_url }})

## Resistors
A resistor, as you might've guessed, has something to do with resistance. It's on the term itself, a resistor helps you decrease the amount 
of voltage by converting the amount of current it can resist into heat.

Unlike the LED, the resistor has no polarity, meaning you can place the resistor in whatever position and it will still able to conduct 
electric charges.

A resistor's symbol may vary but the common variations of it is a zigzag symbol or a simple rectangle but as we encounter more types of 
resistors, the symbols for each is different.

![Schematic symbol of a resistor]({{ 'assets/pictures/intro-to-electronics/resistors-symbol.svg' | relative_url }})
<p class="caption">*Schematic symbol of a resistor*</p>

To see the utmost importance of resistors, you can try to connect an LED directly without any resistors if you have a spare LED. If you did 
that, the LED might light but it goes out quickly and burn out, as in literally burst and destroyed from the heat from taking too much 
of the voltage. Now try to have a resistor connected into the circuit and voila, your LED lives for a week or so.

There are two kinds of resistors: *fixed* and *variable*. 

*Fixed resistors* basically have a *fixed* amount of resistance that is already determined by the manufacturer. Usually this comes in various 
forms but commonly they are found in ceramic and carbon film. With different forms come with different way of indicating their resistance 
value. Ceramic resistors may have their resistance value just written on them. IN the case of carbon films, however, they have those color 
bands that represent the resistance value.

Despite that fixed resistors have been named for their fixed value, they do have a bit of range through *tolerance values*. Which means a 
10KΩ resistor with a ±20% tolerance means they have a resistance range of 8KΩ to 12KΩ (20% of 10K or 10,000 is 2,000). Plus, if you are 
finding a 22KΩ resistor, for example, but can't find any, you can find a resistor with the resistance value and tolerance that reaches that 
particular value that you're searching for. You can also combine resistors to gain an equivalent value of resistance but this depends on 
the kind of circuit that they are on.

*Variable resistors*, on the other hand, have a resistance value that you can adjust up to the 
determined maximum value of the said resistor. Like the fixed resistors with the tolerance value, they have a range but unlike them, they can 
go from 0 up to their assigned maximum value. A 10KΩ variable resistor, for example, can go from 0Ω up to their maximum value, which is 10KΩ. 

Common examples include light-dimmer switches, volume control knobs on your speaker, and the heat knob on your microwave oven. Basically, 
they are giving you the opportunity to your circuits by accepting different values at a range just as those appliances and hardwares that 
gives various control of a particular setting. 

Want to dim the LED on your circuits like those fancy lights in a high-end building? Well now you can with the potentiometer. Want to make 
your custom-made speaker the ability to have controls on the output? You certainly know what needs to be done now.

The most common type of variable resistors is the *potentiometer* which is basically the knobs and switches that we interact with our 
everyday things but there is also a type of variable resistor that can give the amount of resistance depending on the presence of light, a 
*photoresistor*, as you may encounter it. There's also a type of variable resistor that changes the amount of resistance from the amount 
of force that we've applied on the surface, also known as a *force sensing resistor* (FSR). There is plenty of type of variable resistors 
that changes resistance according to the temperature, pressure, and many other factors that they may include in.

With all of that said, let's use a resistor on our circuit. Remember the LED circuit without the resistor that most likely gave up and gone 
into the LED heaven? Now let's not do that and add a resistor to our circuit.

![LED circuit with the resistor, this time]({{ 'assets/pictures/intro-to-electronics/led-resistor-circuit.svg' | relative_url }})

## Capacitors
Another one of the components that reduces the voltage in the flow of the circuit but the main difference with the resistors is that 
the capacitors store a little bit of those electric charges.

Capacitors or caps, for short, is mostly used to introduce time delays into your circuit by making your LED shines dimmer but we'll take a 
closer look into this.

<!-- two types of capacitor -->
There are many types of capacitors but generally, we classify them into two: *polarized* and *non-polarized*.

Having it in its name, the polarized capacitor has a polarity which means one side is positive and the other is negative. You have to put it 
in the correct position or else [it will explode](https://www.youtube.com/watch?v=3b7mjukhTyQ) or something. The polarized capacitor also has 
the same way of indicating the positive pin (anode) and the negative pin (cathode) as the LED does.

Non-polarized capacitors, on the other hand, does not have a polarity meaning we can place it in any position just like how we install a 
resistor into our circuit.

You may encounter the terms *electrolytic capacitors* and *ceramic capacitors* which belongs in the polarized and non-polarized category, 
respectively. For now, we are just going to understand whether the capacitors are polarized or not. On another note, ceramic capacitors are 
usually enough for our beginner projects. 

The symbols for both types of capacitors are the same except the polarized capacitors has a plus sign into it, signalling that the 
capacitor has a polarity.

![Schematic symbol of a capacitor]({{ 'assets/pictures/intro-to-electronics/capacitors-symbol.svg' | relative_url }})
<p class="caption">*Schematic symbol of a polarized and non-polarized capacitor*</p>

Fun fact, the RAM in your computer is made up of billions of these things representing 0s and 1s. [Put some shameless plugging of one of your articles in here]({{ site.baseurl }}{% post_url 2018-08-7-simplified-introduction-to-the-memory-and-memory-management %}).

Anyways, a capacitor is similar to a battery, containing metal plates holding out ions of both charges. Some of them are simply two metal 
plates just held very close to each other not to the point of touching but some of them has a material that keeps them separated, also known 
as a *dielectric*. In fact, its symbol resembles the core component of the capacitor: two metal plates on a distance.

As you expect, with all of these similarities with the battery, it still has some difference with the battery.

Both can store energy. The battery can produce and store those energy and the capacitor can only store but the defining feature of the 
capacitor is the ability to discharge energy quickly unlike the battery which releases energy gradually throughout the circuit. This makes 
the capacitor suitable for tasks that need a quick surge of energy like a flash bulb in a camera.

The way how a capacitor works is when it gains a hold of the ions, it just keeps them separated but it also creates an electric force, 
storing the electrical potential energy. Therefore, in order to use a capacitor in a circuit, we have to make sure that it is charged by 
letting current through it (obviously). That is simply it.

Capacitors are measured through its *capacitance*, the amount of electrical energy it can store. At usual cases, you can store more energy 
by getting two larger metal plates. The larger the capacitor, the more energy it can store but that is usually not the case. It also depends 
on the internal composition of the capacitor. When you put a specific kind of material between those metal plates, you can increase the 
amount of energy to be stored compared to when you have the metal plates of the same size without the material.

Capacitance, as expected, has a unit to describe the capability of the capacitor to store energy and that unit is called a *farad*, denoted 
simply by uppercase F. One farad \\((1F)\\) describe just how much capacitance is needed with one amp \\((1A)\\) of current with a change of 
voltage of one volt per second \\((1 \frac{V}{s})\\).

We can describe capacitance mathematically like this:

$$ 1F = 1\frac{A}{\frac{V}{s}} $$

However, we can simplify it into this:

$$ 1F = 1\frac{C}{V} $$

Remember that an amp per second \\((1\frac{A}{s})\\) is equivalent to a coulomb \\((1C)\\). A coulomb describe the magnitude carried by a 
specific number of electrons \\((6.241 * 10^{18})\\) in a second.

To put it into words, we can say that a farad describes how much capacitance is needed with a coulomb per volt.

Well, we don't really need to memorize those. Just know that capacitance and the unit, farad, describes something. In fact, all units 
describe something as a way to comprehend what is the revolving topic is all about. Current is with amps, voltage is with volts, resistance 
is with ohms, capacitance is with farads and they all have one thing in common: they are used to indicate and describe how they relate to 
other units.

We know that an amp is considered quite large. So does a farad. When we are starting out and buying out some capacitors to begin with, we 
mostly see that a capacitor  is usually measured at microfarads \\((μF)\\) or picofarads \\((pF)\\). In fact, that is the unit that the 
three-numbering system behind a ceramic capacitor is all about.

You can charge up a capacitor simply by including it in a circuit but it'll have different effects depending on the kind of circuit.

Let's say we want to include a polarized capacitor in our simple LED circuit.

<!-- PICTODO: simple LED circuit with an electrolytic capacitor -->
![Simple LED circuit with an electrolytic capacitor]({{ 'assets/pictures/intro-to-electronics/cap-circuit.svg' | relative_url }})

We'll see that our LED will lit up for a moment before turning off. What's happening with it?

We did charge our capacitor but eventually it got full, blocking the incoming electrons off since they have no way of going through a 
fully charged capacitor and this made the LED temporarily lit up in the first place. Depending on the specifications of the capacitor, the 
duration that the LED lit may vary, a capacitor with a larger capacitance will make the LED temporarily light up longer since it takes 
longer to fully charge it, assuming we have the same current and voltage as we did with a capacitor of a smaller capacitance.

Once the capacitor is fully charged we can actually light up the LED temporarily without the battery and only using the capacitor. Just 
make a circuit involving the LED, the resistor, and the capacitor to see the effect. Just make sure the polarity of them are in correct 
position to see it. 

When we finally get the capacitor to discharge properly, the LED lit up but only for a few moment. The moment the LED turns off, that's the 
sign the capacitor is mostly empty, having its stored energy released on the LED enabling it to light up for a short time.

Capacitors can store those energy for hours so you better discharge them first if you want to gain a closer look into the insides of it. 
Furthermore, some of the capacitors uses corrosive material that acts as the insulator so it is wise that we take some precautions if you're 
really curious to take a look at it.

Not only we can temporarily store some energy in our capacitor, we can also do some more things with it.

With the right amount of capacitance, we can make an LED fade its light but including a ~1K μF capacitor and see the magic happens. What's 
happening here is that the ions are stored onto the capacitor gradually, making the LED gradually lose its light since more and more 
incoming particles are blocked off from the capacitor nearing its full charge.

## Inductors
This is a tool that utilizes electromagnetism. How? Well, let's discuss a bit about the longest word in the first sentences in the paragraph, 
shall we?

Before we discuss how it works, here's the symbol for the inductor which is just a wavy line or something.

![Schematic symbol of the inductor]({{ 'assets/pictures/intro-to-electronics/inductor-symbol.svg' | relative_url }})
<p class="caption">*Schematic symbol of the inductor*</p>

As you may have encountered on your high school physics classes, electricity and magnetism are related in a way. As (accidentally) discovered 
then observed by Hans Christian Oersted in the 19th century through a compass needle nearby a battery, a magnetic field can be generated 
through electricity. The more electric charges there is, the stronger the magnetic field. We now tend to call this magnetic field that is 
generated by electricity to be an *electromagnetic field*, EMF or EM field since the former can also stand for electromotive force 
(remember what that is?).

Those electromagnetic fields can also store energy in a way so it is somewhat similar to a capacitor. The process on how it stores it energy 
is also somewhat similar to a capacitor: having to charge it up, though the difference is by building the field. 

When the process of creating an EM field has started, the flow is somewhat disrupted as it covers the charges flow that is in there by the 
time the EM field has begun to be created. Unlike the capacitor wherein the current (in DC) is completely blocked once the capacitor is full, 
the inductor lets the charges flow freely once the EM field is fully created.

Like the capacitor being measured through its capacitance, inductors can be measured through its *inductance*. Inducatance is the property 
of the inductor to induce this amount of electromotive force by this amount of change of the current. Inductance can be indicated by 
the SI unit, henry //((H)//) and that's about it.

Describing inductance and the henry unit is a bit off the scope of this so this will be on another post, someday.

**Simply put, an inductor is simply a coil of wire that creates an electromagnetic field when current are running through it.**

Well, that is simply it in the simple introduction but let's take it to a practical visible level.

Let's create an electromagnet by simply getting a core, whether it is some metallic object like a nail or even nothing, just air. With air, 
the effects will be weaker. Knowing that it will generate a magnetic field, making a magnet as the core will generate a much stronger 
magnetic field. So yeah, take your pick: air, metallic object, ~~or a magnet~~.

Once you've picked something as the core, simply wrap around the object in a wire and let the current run through the wire. Well, to see the 
magnetic effect of our *electromagnet*, simply put it closer to a metallic object and VOILA!

What is the practical application of using an inductor in a circuit? To be honest, I haven't used one yet but research leads me to inductors 
being used for filters, oscillators, and sensors. It also serves as a way to make circuits not disturb each other a bit too much. There's 
what they called *electromagnetic compatability* which dictates how "noisy" a circuit is when thrown in a real environment such as our 
household. Electromagnetic signals can be picked up by other circuits and it may affect their function or output which may lead to chaotic 
situations so having an inductor is a good way to keep those signals close to the original circuit and not disturb the other circuits.

A plausible example would be metal detectors which does use electromagnetism and the inductors used in there makes the indicator beeps when it 
detects a metallic object.

Another object that we might have encountered before that uses inductors are the automatic door sensor which works by generating an electric 
field. When a person enters the vicinity, the field will be disrupted and the interruption serves as the signal for the door sensor to open 
the door. It is generally not true for the majority but it is a simplified (geddit) explanation of how the door that automatically opens that 
most of us are probably amazed the first time we see it. 

## Transistors
Transistors are these three-terminal devices that can control the flow of the electric charges. These what makes one of the revolution of the 
computers and electronic devices, overall, through its ability to control electricity very quickly among its various capabilities compared to 
other components such as relays and vaccuum tubes. Without them, the electrical devices that we usually interact and hold into won't exist 
today as they would be in a size of a behemoth or a large room. These little magical things enable the miniaturization of those gadgets, 
gizmos, and other terms that starts with the letter 'G'.

What makes them revolutionary, exactly?

Transistors have two common operations that they can do: *switching* and "*amplifying*". Relays and vaccuum tubes can also switch and amplify 
electrical signals but transistors can do them both faster (and it costs less to manufacture, so it's a win-win situation right there).

Switching is simply the ability to allow or block electric flow and amplifying is the ability to boost electrical signals. They're pretty 
darn important. 

Switching allows us to create electrical systems from massive beasts like the internet to the simple stuff like the traffic lights. As 
previously said, computers also have those transistors hanging around in their system. It what makes the process of calculation possible in 
the first place and the rate of switching determines the speed of the computers so that's how you know its important. By the time these 
were one of the primary components, computers are able to compute a lot faster.

Amplifying, on the other hand, allows us to create some signals that can be reached out by a receiver. As the first search results might tell 
you, these what makes transmitters and hearing aids possible. Let's go with the hearing aid bit for one minute. With transistors, we are 
able to make those sounds louder for our half-deaf ear by receiving the sound signals, converting them to electric signals into the device, 
and amplifying and outputting them. 

Without further ado, let's go with the thing that we'll know but mostly not apply that particular knowledge until probably later as a beginner.

Transistors are made up of *semiconductors*, materials that are neither conductors nor insulators, which its atomic structure is nearly the 
same as an insulator, holding the atoms uniformly creating a crystalline structure. We can create some variants of the semiconductor through 
the process of *doping* (which has nothing to do with steroids, no worries there).

With the process of doping, we can either make an *n-doped* or *p-doped* semiconductors which refers to their atomic structure.

N-doped semiconductors have more electrons that they can't fit in with the covalent bonds inside of the structure. Those electrons then are 
moving around the crystalline structure, wandering freely. It is somewhat similar to creating a negative charge, hence the name.

P-doped semiconductors, on the other hand, have some missing electrons (or *holes*) in the covalent bonds. Those holes tend to last not that 
long in the same place as neighboring electrons quickly fill up that space, creating new holes in the process. When we imagine this process 
on a larger scale, we could see that it's like the holes are moving. You can think of them as a positively charged variants since they are 
missing a few electrons.

Both variants could act as a conductor when voltage is applied through them although the p-doped variant is acting closely to an n-doped 
variant by the time electricity conducts through them but more interesting things happen when both of them combined in some way, forming a 
*junction*.

When we combine a p-doped and n-doped variants together, it creates a *pn-junction* which is the basis of diodes but with transistors, we 
have three terminals. Since they are next to each other, some electrons from the n-doped variant will slightly go to the holes from the 
p-doped variant. This will render the sides of the variants that are bordering to each other to be slightly the opposite charge. A small side 
of the p-doped variant will be negative and the n-doped variant to be positive, creating what we call a *depletion zone*.

<!-- PICTODO: Depletion zone -->
![The pn-junction and the depletion zone]({{ 'assets/pictures/intro-to-electronics/depletion-zone.jpg' | relative_url }})

The depletion zone contains no moving charges so this acts a barrier and this renders the transistor to be switched off. The depletion zone 
also sets the *forward voltage* to be able to conduct electricity through the component. If the voltage on our circuit is less 
than the required voltage for the transistor, it simply won't work. 

The way how we apply some voltage affects the magnitude of the zone. 

Assuming that we have enough voltage to make the transistor to conduct electric charges, if we have applied voltage correctly, the depletion 
zone will narrow and letting electrons to push through the junction. This is called *forward-biasing*. With a simple example like an LED which 
if we would apply the voltages correctly on our simple LED circuit (you can imagine it, it's pretty simple at this point), the LED will light 
up.

<!-- PICTODO: Forward-biasing -->
![Forward biasing]({{ 'assets/pictures/intro-to-electronics/forward-bias.jpg' | relative_url }})

However, if we would reverse the voltage (connecting the cathode to the positive terminal and vice versa), the depletion zone widens.

<!-- PICTODO: Reverse-biasing -->
![Reverse biasing]({{ 'assets/pictures/intro-to-electronics/reverse-bias.jpg' | relative_url }})

Applying it with the reverse voltage also has a bit of limitation with the *peak reverse voltage* (PRV) / *peak inverse voltage* (PIV) wherein 
the component will start to break down and be able to create a reverse current if the applied voltage is higher than the anticipated PRV value 
of the component.

Transistors have two main types: the *bipolar junction transistors* (or BJT) and the *field effect transistors* (or FET).

For now, let's get into the first type of transistors which most beginners will likely start when interacting with the world of 
transistors.

As indicated by their name, bipolar junction transistors have two junctions that are woven next to each other. They are made up of two 
pn-junctions, creating a layer depending on the variants placed on the center. Mainly, there are two types of BJTs:
- NPN transistor — in this type, there is a thin piece of p-doped variant in the middle of two n-doped variants
- PNP transistor — it is the opposite, the n-doped variant is the middle between two p-doped variants

<!-- PICTODO: NPN transistor and PNP transistor junction picture -->
![BJT types]({{ 'assets/pictures/intro-to-electronics/bjt-transistor-types.jpg' | relative_url }})
<p class="caption">*The types of BJT: there's the PNP transistor (left) and the NPN transistor (right).*</p>

Commonly, there are three leads in a transistor: the *emitter*, the *base*, and the *collector*. Each of the leads are attached to one of the 
section in the junction. The base is usually in the center but you would have to search the datasheet for the transistor first to verify it. 
The base represents the middle junction, the one that is being sandwiched between the two other variants with the bigger section.

As previously said, a BJT is composed of two junctions: the *base-collector junction* and the *base-emitter junction*. 

The two junctions in the transistor are often thought as if they're interconnected in a way that if we apply voltage to one of the junction, 
the other will now be able to work. You can think of the transistor as a voltage-controlled insulator and the main way we can control the 
transistor is through the depletion zone.

As previously explained, the depletion zone can either narrows or widens depending on the direction of the applied voltage. By narrowing the 
insulating layer, we are making more of the current of charges to flow through. Same principle is applied from widening the layer though the 
difference is only fewer of the ions can pass through. 

Narrowing the depletion layer to its fullest is how we turn on the transistor. We could also make the transistor be partially open by 
widening the layer a little bit, something that we can't really do with the switches since they only go from fully on to fully off.

In using a transistor, we have to decide how to use it. Remember that the transistor has two basic functions: switching and amplifying.
Depending on how we connect the transistor will either cause the transistor to act as a switch or as an amplifier.

Let's go through a simple example of using the transistor mainly as an amplifier. Technologies such as a touch-sensor relies on the concept 
of amplification of signals through our touch to represent our inputs and at the same time, not get ourselves much in the way of 
electrical hazards.

Here's a circuit that acts a touch sensor with an LED.

<!-- PICTODO: touch sensor circuit with an LED -->
![Touch sensor LED circuit]({{ 'assets/pictures/intro-to-electronics/touch-sensor-led-circuit.svg' | relative_url }})

Take note that we are using an NPN bipolar junction transistor. For reference, the one that I used for this sample is the 2N3904.

The concept is simple: our body acts as the closer of the circuit. Our body acts as a conductor but it offers high amounts of resistance so 
only a handful of charges can flow through. Those charges that are able to flow are going into the base-emitter junction, narrowing the 
depletion layer.

By narrowing the depletion layer, we allow for the current that came from the collector section which is connected from the part with the
LED. The current from the collector actually remains constant and does not being affected or changed in any way from the input of the base but 
rather it is dependent on the input from the base.

In a way, it also acts as a switch. When we don't complete the circuit, the transistor is off and that means the depletion layer is there, 
blocking the current.

## Integrated Circuits
Another one of the important components in a computer system as these also revolutionized the cost and the physical space of the computers 
to be manufactured in the late 80's. All of the behemoth-sized computers in the early- to mid-20th century is just pales when compared 
to the processing power of the these tiny CPU chips.

"Uhh... OK, thanks for the useless information but what are integrated circuits, exactly?", the imaginary reader said.

What is an integrated circuit, exactly?

Also known as a chip or its shortened form, IC, these little nuggets are also an electrical circuit the difference being is that it is about 
the size of one of the segments of your finger (the index finger, specifically). Like the circuits that we are going to build every now and 
then, these chips come in different forms with different functions. Some of them are designed in a way to enable your circuit to do different 
things with different inputs, some of them helps you set up a timer, some of them may even help you with transmitting stuff, and so much more. 

Possibly the most advanced form of these integrated circuits, *microprocessors*, have the most capability: controlling devices such as 
cellular phones, personal computers, and digital appliances. We can even utilize it as a beginner with the use of Arduino which is an 
open-sourced hardware manufacturer that produces printed circuit boards (PCBs) with microprocessors. Using this can let us easily create 
devices that utilizes these microprocessors that let us create functions through code for various purposes but that is not the main focus of 
this post and probably going to be on a future post 😉.

We're focusing on to our usual simpler kind of integrated circuits which is more specific in terms of function and mostly composes of 
electronic component and does not usually requires programming to utilize it.

<!-- Introduce the DIP IC package -->
There are different forms of this component but the common variant that we'll see and discuss throughout in here and in the future 
posts related to electronics is the *dual in-line package*, also known in its initialized form, *DIP* because of the two parallel rows of 
electrical pins. This kind of form factor is also suitable for building circuits in a breadboard. In fact, that's why there's a middle 
gutter in order to fit them easily.

![DIP](https://upload.wikimedia.org/wikipedia/commons/8/80/Three_IC_circuit_chips.JPG)
<p class="caption">*Integrated circuits in dual in-line package*</p>

With all of those functions and not to mention, the massive amount of possibilities of differences between each chips, you have to find 
what they do exactly. Fortunately, you can easily reference that by looking at the model/part number that is imprinted at the front and 
googling it with the word "datasheet".

The datasheet of the IC may contain the internal diagram of the circuit and the specification of the components being used to help your 
circuit interact with them just fine. From there, you also get to see what each pin of the IC is and how they are being commonly used.

We access the function of the IC by connecting it to the *leads*. With our components connected into one of them, we can utilize the IC's 
functions, depending on the datasheet and what are the prerequisites in order to make it working.

One of the most common IC we will encounter includes logic gates which are basically are way to make our circuit accept inputs and give 
boolean outputs. If you're familiar with programming, you most likely encountered interacting with boolean values. It uses the same concept 
that lies on both of those which is boolean algebra.

![Different logic gates]({{ 'assets/pictures/intro-to-electronics/diff-logic-gates.svg' | relative_url }})
<p class="caption">*Different logic gates*</p>

<!-- TODO: Introduce the breadboard -->
## The breadboard
One of the most handy tool for a beginner like me when starting out to build circuits. A breadboard is the rectangular piece of plastic with 
a grid of holes where you plug your components in. Most of the electronic components will fit nicely into the hole (or sometimes referred to 
as a tie point).

You would see that a breadboard is sometimes referred to as a *solderless breadboard* since making a working circuit with this doesn't 
require a soldering, or melting of metal, to hold the components together and let the electrons flow. Since it doesn't require a solder which 
holds the components permanently on the printed circuit board (also known as a PCB), this lets us reuse our components. If we made a mistake 
on placing the components on our circuit, we can easily stuck it away from the board and place it in its appropriate location. This is why 
a breadboard is a perfect tool for prototyping and testing out our circuits. This is also why the breadboard is perfect for beginners to get 
started into practice right away. 

You would also commonly see some holes and studs on a side of the breadboard. This serves as a way to connect two breadboards together if 
you need a wider workspace for your circuit. For most beginner projects though, one breadboard is enough.

The breadboard sometimes come in different sizes, the common size being the full-size breadboard with a length that is roughly covers the 
length of your hand (or at least, my hand).

If we would remove the piece that holds our breadboard and get the insides of it, we would see that the breadboard is mainly composed of 
strips of metal. I'll discuss that at a later point in the post.

![Electrical connections of a breadboard]({{ 'assets/pictures/intro-to-electronics/breadboard-electrical-connections.jpg' | relative_url }})
<p class="caption">*Electrical connections of a typical breadboard*</p>

As said from [a video from ScienceBuddiesTV](https://www.youtube.com/watch?v=6WReFkfrUIk):
> To use the breadboard, you need to understand how the strips are connected into each hole.

In a typical breadboard, it usually comes with the two primary parts: the terminal strip and the bus strip. Commonly, you would see that these 
parts were being held together by a large piece of adhesive, so that you can place the breadboard anywhere.

### Terminal strip
The terminal strip is simply the centerpiece of the breadboard containing the labels with the numbers on the left and the right sides and the 
letters in the top and the bottom sides, if we would orient the breadboard vertically. The numbers part is typically considered as the row 
while the letters is the column. This is why most breadboard posts and pictures show the breadboard vertically.

The terminal strip is where you put in your electronic components but you can't just place the components anywhere.

In a terminal strip, we would see that the metal strips that's inside of it goes on horizontally on each row but it cuts out to the center 
where the gutter is. That particular gutter exists in order to easily fit our components like the integrated circuit and would not cause our 
components' *leads* or the metal legs to shorten. If we want to use the whole row, we need to have a component that can connect the two metal 
strips in the same row.

<!-- PICTODO: terminal strip horizontal metal strips -->
![Electrical connections of the terminal strip]({{ 'assets/pictures/intro-to-electronics/breadboard-terminal-strip.jpg' | relative_url }})

Those labels on each side are not meant for show either since they act as a guide to easily reference our components. If you are just starting 
out with a simple circuit, you would not probably use it a lot since it is easier to debug our circuit with less components but as you go on 
creating more complex circuit, it will certainly be useful as long as you keep track of your components well.

### Bus strip
The bus strip is the two pieces on the two sides of the breadboard. This is where we place the power line for our circuits. There are usually 
two columns for the bus strip: one for the supply voltage (the positive terminal) marked with the red line running across vertically on 
the left side of the strip and also a plus sign, and another one for the ground (the negative terminal) marked with blue or black line on the 
right and also a minus sign. There might be some breadboards that doesn't mark the bus strip (like the one I got) but typically, it also has 
the same placement.

![Electrical connections of the bus strips]({{ 'assets/pictures/intro-to-electronics/breadboard-bus-strips.jpg' | relative_url }})

As previously mentioned, this is where we place the power line for our circuit so this is where we connect our power supply into its 
appropriate place. Let's take a battery as an example.

In a battery, we would connect the positive terminal onto the side with the plus sign and the negative terminal on the ground side or the one 
with the minus sign. That is simply how we would supply power onto our circuit.

## Conclusion
There we go, the practical side of electronics. We have a lot of components and tools at our disposal in order to build a working circuit but 
above all, we need to be able to get the fundamental mechanics of how those components work at least in its basic core in order to utilize 
them properly. It is kind of like grammar: we can understand things even with the wrong grammar but wouldn't be better if we have a proper 
understanding of the grammar to get more things correctly. Most likely a bad analogy but the point get across (hopefully).

Electronics is mostly about building circuits and controlling the electrons to get them to the right place and do the right function that 
we aim for. Different tools and components are there like with LEDs, capacitors, batteries, transistors, integrated circuits, and our plain 
old wire.

For a little summary of things, here they are:
- *schematics* — They're the map of our circuit. It does not only tell where the components are placed but also tell the values associated with them. Each electronic component that we see has a symbol in the schematics. For example, the battery is simply two parallel lines with one line that is longer than the other, and the resistor which can be represented by a zigzag or a rectangle.
- *Ohm's Law* — Basically, the law states that the amount of voltage is directly proportionally to the amount of current. Applying the principle from this law for our circuit is very much important. It let us know the values needed for our circuit to work in an optimal performance and not get our components to fry or not functioning at all. Knowing the formula, \\(V = \frac{I}{R}\\), we can apply it to know how much resistance does it need for our LED to light up in its brightest (given that we know the voltage used and the amount of current needed to work by the LED and other stuff), how much voltage is needed to power up our very elaborative circuit #42, or how much current of charges is required to make this component work, among other things. 
- *battery* — The voltage source for our circuit. Batteries are not only the electrical source out there but they're pretty much the kind of source we're fiddling with as a beginner.
- *light-emitting diode* — They are simply a kind of diode that emits light when current passes through them
- *resistor* — It simply serves as a reducer of current since electronic components tend to break down if they receive too much current. You can see a component breaking down yourself simply by making an LED connect to the battery without it. There are many types of resistor but the one we usually see on our beginners electronic kit is the carbon film resistor which is a kind of a fixed resistor. The values of a carbon film resistor can be calculated as indicated by the color values embedded into the film. The colors and the position of the color strip means differently so better have your googling skills ready for the resistor color values. 
- *inductor* — A component that uses electromagnetism. There's not much use (or at least I found) for it in a beginner level but know that this component exists and serves as some kind of sensor
- *transistor* — It has two basic functions: switching and amplifying. It has three parts: the base, emitter, and collector. With switching, it depends whether or not there is current entering the base. When there is current from the base, then the transistor is "on" but it can go 
from "fully on" to "partially on". Otherwise, the transistor is "off". With amplifying, the function is also dependent on the current from the base. The current of charges from the base will represent how much current is going to flow from the current in the collector. When there is a bit of current from the base, the transistor's "gate" will open up, allowing the current from the collector to pass through. There is much more than this and as I continually revise this, I'm going to link you to this [page](http://amasci.com/amateur/transis.html) if you want a clearer explanation of how transistor works, OK. 😁
- *integrated circuits* — They are simply circuits that are compressed into a small package. Their functions quite vary and you simply have to identify their parts number to get their datasheet and understand better on how they work and what does the circuit inside looks like. The most common form of integrated circuits or IC, for short, is the dual in-line package (or DIP) and it is also breadboard-friendly.
- *breadboard* — It is simply a rectangular piece of material with grid holes and metal strips inside of it. Unlike with soldering which will make the components permanently attach to our circuit, the components that are attached to the breadboard are only stuck through the hole that is reaching to the metal strip. As such, it allows us for a bigger breather when we create a mistake since we can just quickly deattach it and reposition it. This is a tool perfect for creating a prototype for our circuit, testing it out, or a simple quick creative circuit building for fun.

## (Re)Sources:
- ### Books
    - [*Electronics For Kids (No Starch Press)*](https://www.nostarch.com/electronicsforkids/)
    - [Part 1: DC Circuits on *Fundamentals of Electric Circuits, 6th Edition (Alexander & Sadiku)*](https://www.amazon.com/Fundamentals-Electric-Circuits-Charles-Alexander/dp/0078028221)
    - [Part I: Fathoming the Fundaments of Electronics on *Electronics For Dummies, 3rd Edition (Wiley and Sons Inc.)*](https://www.amazon.com/Electronics-Dummies-Cathleen-Shamieh/dp/1119117976/)
    - [Part II: Controlling Current With Components on *Electronics For Dummies, 3rd Edition (Wiley and Sons Inc.)*](https://www.amazon.com/Electronics-Dummies-Cathleen-Shamieh/dp/1119117976)
    - [Chapter 4: Semiconductors on *Practical Electronics for Inventors, Fourth Edition (Scherz & Monk)*](https://www.amazon.com/Practical-Electronics-Inventors-Fourth-Scherz/dp/1259587541)
- ### Videos
    - [Basic Electricity - Resistance and Ohm's Law by *Afrotechmods*](https://www.youtube.com/watch?v=NfcgA1axPLo)
    - [Basic Electricity - Voltage by *Afrotechmods*](https://www.youtube.com/watch?v=TBt-kxYfync)
    - [Basic Electricity - What is an amp? by *Afrotechmods*](https://www.youtube.com/watch?v=8gvJzrjwjds)
    - [Electric Charge from *Crash Courses*](https://www.youtube.com/watch?v=TFlVWf8JX4A)
    - [How to use a breadboard by ](https://www.youtube.com/watch?v=6WReFkfrUIk)
    - [LED Basics by *Afrotechmods*](https://www.youtube.com/watch?v=Yo6JI_bzUzo)
    - [Simple guide to electronic components by *bigclivedotcom*](https://www.youtube.com/watch?v=6Maq5IyHSuc)
- ### Web
    - [How do batteries work on *Explain That Stuff*](https://www.explainthatstuff.com/batteries.html)
    - [Breadboard on *Wikipedia*](https://en.wikipedia.org/wiki/Breadboard)
    - [Coulomb on *Wikipedia*](https://en.wikipedia.org/wiki/Coulomb)
    - [Difference Between EMF and Voltage from *Difference Between*](https://www.differencebetween.com/difference-between-emf-and-vs-voltage/)
    - [Electric charge on *Wikipedia*](https://en.wikipedia.org/wiki/Electric_charge)
    - [Electromotive force on *Wikipedia*](https://en.wikipedia.org/wiki/Electromotive_force)
    - [Electronics for beginners on *Explain That Stuff*](https://www.explainthatstuff.com/electronics.html)
    - [How do capacitors work? on *Explain That Stuff*](https://www.explainthatstuff.com/capacitors.html)
    - [How electromagnets work? on *Explain That Stuff*](https://science.howstuffworks.com/electromagnet.htm)
    - [How do transistors work? No, how really they work?, Part 1 by *William Betty*](http://amasci.com/amateur/transis.html) — I recommend this one if you want to have a clarification on how transistors work
    - [How do transistors work? Short version by *William Betty*](http://amasci.com/amateur/trshort.html)
    - [Learn the Basic Electronic Components from *Build Electronic Circuits*](https://www.build-electronic-circuits.com/dbe-components/)
    - [What is the difference between emf and voltage? from *Quora*](https://www.quora.com/What-is-the-difference-between-emf-and-voltage)
    - [What You Need to Know About Current, Voltage and Resistance from *Build Electronic Circuits*](https://www.build-electronic-circuits.com/current-voltage-resistance/)
    - [Voltage on *Wikipedia*](https://en.wikipedia.org/wiki/Voltage)

## Choose your own learning adventure
More topics that I haven't discuss that may or may not be included or updated someday:
- Learn how soldering works and how to solder (this is probably the most important part)
- Arduino / Raspberry Pi integration (yes, they are beginner-friendly, don't worry)
- How computers work on a hardware level
- The beginning of the study to embedded systems
- Or you know, the simple DIY projects that you'll do; TRY TO APPLY IT!

## Author's Note
There you have it. The introduction to the whole electronics stuff that you need to know as a beginner. Hopefully not too much confusing. 😅

There is still a lot of stuff under this and you would have to research it for yourself in order to get a fuller picture but for now, all 
practical stuff is included in here to see it for ourselves and not get bored on to the theoretical stuff a bit too much, unless you're into 
that kind of thing.

If you think this post is confusing, you can simply say it to the comments or message me. That's what feedback and constructive criticisms are 
for. Seriously, I feel like this entry is a bad one. I may have to continually update it by the time this got published. I can't also stay 
this entry go any longer since I have other entries to go through.

Anyways, I forgot to include the objective of this series in the last post. Even though I can just edit it in, I don't want to edit 
an author's note if it is large enough of a point but anyways, here we go.

The very objective of this *Simplified!* series is to explain it in a simplified manner without oversimplifying it. I'm trying to 
utilize [Feynman Technique](https://curiosity.com/topics/learn-anything-in-four-steps-with-the-feynman-technique-curiosity/) by writing 
this type of posts. Although it is working since I can still remember the details needed to understand the concepts I've posted about, 
I am still in need of feedback for my writing. Also, IDK if this goes with the Feynman Technique since I tried to not oversimplify it.

So far, with these two *Simplified!* posts, each of them took me a span of a week simply because I'm writing the whole thing as I'm learning 
it, not really as on-the-go but as soon as I have tested and experimented on the subjects I'll write about (in memory and management and 
pointers wherein I wrote a bunch of bad code, for example). Plus I only do it on my free time. I simply think that it is better if I 
would write a *Simplified!* post a week after I've learned a concept to give it some time to cement the learnings on my head over time.

One of the most effective learning technique as said by this [comment on a Dev.to post](https://dev.to/adarshkkumar/comment/3opf) is to 
**learn**, **experiment**, then **teach others** (in this case, writing a blog).

It really forces me to research more about the topic that I will write and learned a lot more from it. From what my initial knowledge as I 
begin to write, it continually expands as I write. It's just an amazing process. It just works but also hard especially if I want to 
emphasize on the practical application of the topic. I'll figure it out as I write more of this stuff. Who knows, I might go back and improve 
my old posts someday.

For now, this serves as a good opportunity for me to solidify the concepts I've learned for this week and improve my writing skills. That's 
killing two birds with one stone stuff right there. IT'S EFFICIENCY!

Slightly unrelated note, if I would to write a low-level abstraction version of this, would it be another series that is called 
*Complexified!* and if I write a simpler version of a *Simplified!* post, would it be called as an *Oversimplified!* post?

Yeah, now that I think about it, I like those names. 😁 I'll be keeping those names for the future, for sure.