---
layout: post
title:  "Node.js: NPM"
date: 2018-05-15 04:25:33 +0800
author: foo-dogsquared
categories: node-js
tags: [node-js, programming-notes, javascript]
---

Now that we've tackled a little bit about Node, we know that Node.js comes with a huge number of user-created modules that will 
mostly help you solve problems and reduce time tremendously. This gives us a wide area of freedom to how we will structure our 
app and choose our tool into completion. But how do we do this? --- especially if the project becomes larger in scale. 

Of course, you already know the answer from reading the title. NPM!

## What is NPM?
Ah, of course we're starting with this question.

Node Package Manager or *npm* is the default package manager with a command line interface (CLI) that comes with Node. 

If you're not familiar with package managers, a package manager is just a collection of tools that automates installing, removing, 
upgrading and configuring of packages or programs. Think of them like an app store, Windows Store, for example. From that, you can 
navigate around and look for stuff and find a particular program. With one click, the app store will take care the rest for you, 
downloading the app, installing the app, and updating the app. Other examples of package managers are [`apt`](https://en.wikipedia.org/wiki/Advanced_Packaging_Tool) (Debian-based), 
[`DNF`](https://en.wikipedia.org/wiki/DNF_(software)) (Fedora-based), [`pacman`](https://en.wikipedia.org/wiki/Pacman_(Arch_Linux)) (Arch Linux), [`homebrew`](https://brew.sh/) (OS X), and [`chocolatey`](https://chocolatey.org/) (Windows).

There are basically many package managers out there with different purposes, the kinds of package managers that are given as 
examples are for installing programs but for some such as `NuGet` and `npm` are used for handling development libraries and such.

Also, *npm*'s repository holds over *600, 000* packages, one of the (if not, **the**) world's biggest registry for software 
packages... Yeah...

## How do we utilize it?
To get started with *npm*, we need to get into the directory of our project first.

Then, how we start with utilizing *npm* depends on what you want to go.

Let's start with the basics. First, let's run `npm init`.

After that you shall see a bunch of questions that you shall answer. Most of them can be skipped, anyway, but that depends on you.
If you want to create a `package.json`{: .file-name} right away, you can run `npm init -y` with the `-y` or `--yes` 
flag that kind of stand for "YES TO ALL OF THEM! NOW GIVE ME THAT JSON!", then you can just edit the information over there if you 
want to.

You'll see the `package.json`{: .file-name} and its keys (or fields). Most of them are pretty much self-explanatory. 
The only required fields in there are the `name` and the `version`.
Most likely the ones that are going to get your curiousity is the `main` and `script` keys in the `.json` file. `main` denotes the 
main entry point for your program. Let's say you've published your package and named it `the_dog` and a user installed your 
package. How are they going to use it? With `require()`, of course! Although in this case, it is `require('the_dog')`. On the 
other hand, `scripts` is a field containing a list of aliases that represents a certain command. 

Well, that aside, you can just refer [here](https://docs.npmjs.com/files/package.json), if you want a more concise explanation of 
each field.

If you predict that you are going to create a bunch of `package.json`{: .file-name}, you can set some configurations 
to be the default value when you create those initialized `.json` files by `npm set init.<configuration>` in which `configuration` 
stands for the keys that will appear on your `package.json`{: .file-name} (although you might have to refer to the 
documentary to search how to reach to that key/field).

For example, when you don't want to edit to get your name and license on each `package.json`{: .file-name}, you can 
set your configurations with this:
```bash
    npm set init.author.name "AUTHOR_NAME"
    npm set init.license "MIT"
```

So that each time you set `npm init -y` or similar commands, you'll see that the `author` and the `license` field are already 
filled up with the value you've set with `npm set`.

OK! Now that settled, what's next?

Well, we should probably *install packages* now!

## Installing (and Uninstalling) Packages
The first thing we should about packages is that we can install these either locally or globally.

Local packages are installed through a `node_modules` folder inside of the current directory (of your command line) meanwhile 
global packages are installed in a folder, most likely in the home directory or root directory of your OS or your user's folder. 

Now to find those packages for your specialized needs, you can go the [official webiste of *npm*](http://npmjs.com/) and use their 
package finder for the packages in their repository. You can also find the packages using the command line with:
```bash
    npm search NAME_OF_MODULE
``` 
...which will give a list of the search result complete with relevant information like description, 
the author, its latest version, and the date of update.

### Global Packages
Anyways, first we'll deal with installing packages globally. To install packages globally, you can enter this command:
```bash
    npm install -g NAME_OF_MODULE # or
    npm i -g NAME_OF_MODULE
```

The `-g` flag, as you'd expect, stands for global. You can also install multiple packages in one go by just separating the 
modules with a whitespace:
```bash
    npm install -g NAME_OF_MODULE NAME_OF_MODULE2 NAME_OF_MODULE3
```

Now, there are considerations when you install a package globally. One of them when you want to use that package with the command 
line and another one of them when that package has some features that can be accessed through a command line. Examples of packages 
that are mostly meant to be installed globally (or at least, can be used globally) are `express-generator` (a framework that 
creates a scaffolding for your app), `ember-cli` (similar to `express-generator`), `eslint` (a JavaScript linter), `jshint` (yes, 
another JavaScript linter), and `node-dev` (a very helpful tool that restarts your app every time it is modified).

You can see where your global packages are installed by running this command:
```bash
    npm list -g --depth=0 # or
    npm ls -g --depth=0
```
The `-g` that also obviously stands for global and the thing that'll most likely get your attention, `--depth=0` flag means 
to not list its submodules (or dependencies) 0 level deeper or in other words, none at all. Try to remove or modify the `--depth` 
flag to see what I mean. 

Also, you will see what libraries and their version numbers have you installed globally, so that's a handy command.

Now, what if we don't need that particular package anymore and want to get rid of it? Well, we can just *uninstall* it.
```bash
    npm uninstall -g NAME_OF_MODULE # or
    npm un -g NAME_OF_MODULE
```

Like how you can install multiple packages in one line, you can also uninstall multiple modules in one line:
```bash
    npm uninstall -g NAME_OF_MODULE ANOTHER_MODULE AND_YET_ANOTHER_MODULE
```

### Local Packages
Next, we'll deal with installing packages locally. As previously mentioned, this will not install your packages on a unified 
folder or directory but through the `node_modules` folder inside of your current working directory.

***Well, there are additional details to keep in mind when installing local packages which will be explained by the 
following topics so please do read until the end.***

The installation process is the same except with one teeny tiny difference:
```bash
    npm install NAME_OF_MODULE # or
    npm i NAME_OF_MODULE
```

Yes, keen reader, the `-g` flag is gone. Suprising, isn't it?

Anyways, not only the installation process is mostly the same but also the monitoring process is mostly the same. To look at the 
modules installed in your project, run the same command without the `-g` flag.
```bash
    npm list --depth=0 # or
    npm ls --depth=0
```

If you saw the output from the above command, you'll notice some name with a version number is outputted before the directory 
of the `node_modules`. Well, that came from the `package.json`{: .file-name}.

What about uninstalling it? Pfft, mostly the same, too!
```bash
    npm uninstall NAME_OF_MODULE # or
    npm un NAME_OF_MODULE
```

## The `package.json`{: .file-name}
The said file, as previously discussed, is created through `npm init`. This particular file is quite an important part when 
it comes into your workflow. How?

Remember how I said that `package.json`{: .file-name} serves as a configuration file (in some way)? Well, we can 
put that into practice. You can paste this code, name the file `package.json`{: .file-name} and put it in a 
empty directory (or you can just download it <a href="{{ '/assets/dl-files/node-js-npm/package.json' | prepend: site.baseurl }}" download="package.json">here</a> and put it in an empty folder).

```json
{
  "name": "sample-project",
  "version": "1.0.0",
  "description": "This is just a sample exercise.",
  "main": "index.js",
  "dependencies": {
    "lodash": "4.17.10",
    "sass": "1.3.2",
    "test-lib": "2.1.2",
    "underscore": "1.9.0"
  },
  "devDependencies": {
    "node-dev": "3.1.3"
  },
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "foo-dogsquared",
  "license": "MIT"
}
```
<p class="caption">*package.json*</p>

Then once you have the file in place, run `npm install` then wait until it has been resolved. Next, enter `npm ls --depth=0` to 
see the packages installed and you'll see the packages listed in the `dependencies` field in the `.json` file has been installed.
Then, pretend that you're amazed that you have got another trick in your sleeve. Lastly, absorb the knowledge that `npm install` 
basically looks for the dependencies in the `package.json`{: .file-name} file if the tool found one on the current 
working directory.

Due to this function, it lets us to be more portable and more accessible. Instead of transferring what could be thousands of small 
files due to the packages and their dependencies, we can just send the `package.json`{: .file-name} to 
other developers and be done with it. Well, that is the halfway of the whole picture, anyway.


## Package Maintenance
OK! Now that your app has packages installed, you might wonder if there's any processes you have to worry. And yes there is, 
presumably fellow newb developer! 
There's a lot of them, most of which are not covered in this post, so go check out the 
[official documentation](https://docs.npmjs.com/) of this tool in order to get more out of it.

Anyways, onto the question, what are some of those processes?

I'm pretty sure you have already read the header, maintaining packages!
It is one of the most important processes while developing your app. Basically, you're keeping an eye out for how you install 
your packages and how others would install the needed packages without entirely breaking your project if they try to render it 
on their side of things.

If you want to be secure about maintaining your packages while reducing the problem of breaking your project from a big package 
update, for instance, you can install and lock the version of a package by adding the `--save-prod` or `-P` flag in your standard 
`npm install NAME_OF_MODULE`. 
```bash
    npm install NAME_OF_MODULE -P # saving the package into dependencies
```
Actually, as of *npm 5*, you don't need to worry about that since *npm* does that for you automatically. Still, there are options.

Else if you're using a tool that is mostly for testing and development purposes, you can use:
```bash
    npm install NAME_OF_MODULE -D # saving it into devDependencies
```
Any packages that is installed this way will be saved into the `devDependencies` field which means that packages enlisted in there 
will appear in the development environment and will not appear when pushed into production. 

Else if you want the exact version of a package and lock it in the file:
```bash
    npm install NAME_OF_MODULE -E # saving the package with the exact version number
```

And if you don't want to list packages into `package.json`{: .file-name}, you can use:
```bash
    npm install NAME_OF_MODULE --no-save # IDK what's this for but why not?
```

You know what? Just refer [here](https://docs.npmjs.com/cli/install). There a handful of stuff that is not yet mentioned in this 
post.

Oh, and you should keep in mind about how *npm* caches the package whenever you install a new package so that it does not have 
to rely on the internet when it tries to install a package for the second time. If you want to get it clean and declutter from 
the packages that have gathered over time, you can run:

```bash
    npm cache clean
```

You can add a `--force` option in order to... forcefully remove all of the cache stored in wherever *npm* stores its cache (but 
use it if you know what you are doing).

-------

In summary:
* `npm init` first for your app
* `npm install NODE_MODULE` to install *npm* packages
* `package.json`{: .file-name} is important and serves as a configuration file for your app (in a way)
* `npm install` to install stuff from a `package.json`{: .file-name}
* how to uninstall packages again?
* you can do a bunch of stuff and you can know it by referring to the [official documentation](https://docs.npmjs.com/)
* something about dependencies and how to lock those packages in order to be more reproducible for others

*additions and update of info are upcoming for sure*

Anyway, that is the introduction of *npm*. Far from an ideal *good* introduction and that's the best I could do (for now) but 
hopefully it's enough. Just remember when in doubt, meet Google-*sama* and R.I.P. (~~RIP In Peace~~ Research, Immerse, Practice)
those topics apart! 

## (Re)Sources:
- [A Beginner's Guide to npm --- the Node Package Manager on *SitePoint*](https://www.sitepoint.com/beginners-guide-node-package-manager/)
- [Node.js Introduction Course on *edX*](https://courses.edx.org/courses/course-v1:Microsoft+DEV283x+1T2018/course/)
- [Node.js Notes for Professionals](https://goalkicker.com/NodeJSBook)
- [*npm* Documentation](https://docs.npmjs.com/)
- [*npm* Official Website](http://npmjs.com/) --- also features a search engine for its packages
- [What is the --save option for npm install? on *Stack Overflow*](https://stackoverflow.com/q/19578796/8633667)