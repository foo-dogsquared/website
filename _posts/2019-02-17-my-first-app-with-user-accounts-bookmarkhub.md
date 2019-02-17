---
author: foo-dogsquared
categories: "side-projects"
date: 2019-02-17 10:03:23 +0800
layout: post
tags: ["projects", "node", "express"]
title: "My first app with user accounts: 'bookmarkhub'"
---

Here we go! Another project! I've been trying to implement the concepts I've been learning about for the past month or so. This time, it's about sessions, cookies, and user management. What could be a better way to actually implement than programming a social media-esque site about bookmarks!

## Overview
It's a website that saves your bookmark associated with your account. It can save [Netscape bookmarks](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa753582(v=vs.85)https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa753582(v=vs.85)) and [Pocket exports](https://help.getpocket.com/article/1015-exporting-your-pocket-list). In the upcoming future, it'll have the ability to add a name-URL key to add into the bookmark lists and import JSON file with specific formats. Also, it'll have the export bookmark feature. Until now, I wasn't able to deploy it mostly because I'm a noob on app deployment and free quality database services are rare as fully reaching the delivery time quota for the free pizza.

This is my biggest project, so far, on my one year (and ongoing) worth of programming. This is my implementation of server-related concepts: [user and session management](https://stackoverflow.com/questions/10960131/authentication-authorization-and-session-management-in-traditional-web-apps-and), [sessions and cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies), [web token](https://auth0.com/blog/ten-things-you-should-know-about-tokens-and-cookies/), [HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP), and the [MVC pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller). It's almost like a capstone project for those concepts that I really had a hard time grasping on the whole concept of servers and its related stuff. 

If you want to see the app yourself, go to the [README on the repo](https://github.com/foo-dogsquared/bookmarkhub/blob/master/README.md) and follow the instructions I listed there, then deploy it locally.

## How does it work
First, let's discuss the foundational libraries that are used for this app.

- [Express](https://expressjs.com/) &mdash; Well, if I want to quickly create a server-sided app, I need a framework for it.
- [Pug](https://pugjs.org/) &mdash; The views in the [model-view-controller]() part of the app.
- [SCSS](http://sass-lang.com/) &mdash; Simply the styling language used for the app.
- [MongoDB](https://mongodb.com/) &mdash; The data layer for this app. Though, it uses [Mongoose](https://mongoosejs.com/) to consistently validate and keep the data intact through schemas. 

There is also [a session store library using MongoDB](https://www.npmjs.com/package/connect-mongodb-session?activeTab=readme), [JSDom](https://github.com/jsdom/jsdom) for easily parsing HTML bookmarks, [JWT](https://jwt.io/) for token validations, and [Helmet](https://www.npmjs.com/package/helmet) for security (through HTTP headers). The frontend isn't entirely managed (aside from basic user interaction such as toggles and forms) since the core functions are located in the server.

I also use a testing library (which is [Mocha]()) for testing out the core features of the app (which is the bookmark import function). I admit that the testing implementation is crappy as I wasn't able to make the testing scope beyond just the one feature of the app. Well, I tried. If you have any feedback on this, you can contact [me through any of the contact list](http://foo-dogsquared.github.io/) or shoot me an [email](mailto://foo.dogsquared@gmail.com), whatever your poison.

The app, more or less, functions almost like a social media site since it focuses on sharing bookmarks. Let's break the features down into a list:

- user account management &mdash; registration, verification, logging in, logging out, and resetting the password with verification
- email sending &mdash; when the user registration is successful, when the user confirmation is successful, when the user asks for the password reset and when the reset has been successful
- session management &mdash; tracking of logged in users and their maximum age so the session database won't have much problem in case the user logged out irregularly (or didn't visit the website for a long time)
- web tokens &mdash; this is specifically for account confirmation and creating a token for password reset 
- importing of bookmarks &mdash; you can import bookmarks from [Netscape](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa753582(v=vs.85)) and [Pocket](https://help.getpocket.com/article/1015-exporting-your-pocket-list)
- seeing other users &mdash; well, it almost functions as a social media site, remember?

Hold on to your seat. It's going to be a somewhat serious and long discussion (whichever I ended up in my writing).

### User management
Of course, being a website that focuses on sharing bookmarks among people, there has to be a way of managing your users. Also, it means you'll implement a user management system. 

My implementation of a user management system is completely generic: user registration, user login, and user logout. There are only a few restrictions such as access on `/account/profile` is completely restricted until you are visiting the page as a user. Another example could be the user couldn't get to `/signup` and `/login`.

With the user management system in place, there has to be a session management system to track which of the users are logged in. So I did that with a session store with MongoDB which [someone already implemented it](https://github.com/mongodb-js/connect-mongodb-session). I didn't mind on how to implement it most of the stuff myself since I'm more focused on the concept of sessions and user management, overall.

Aside from the usual signup, login, and logout, I also implemented account verification and resetting passwords. Oh, and they also feature email sendings. In other words, if you want to reset your password, you have to go through how most websites handle it: an email will be sent, click through the link, type the new password, submit the new password, and then you're done!

If you're a newly registered user, you'll have to go through the verification process which is simple as visiting your email for the verification link and clicking on it. 

<img src="{{ '/assets/pictures/side-projects/bookmarkhub/user-authentication-system-simplified-workflow.png' | relative_url }}" alt="User authentication system simplified workflow">
<p class="caption">User authentication system simplified workflow</p>

I have thought of a way on how to implement the verification: 

- Generate a link that corresponds to the account.
- Send to the user via email.
- The user visits the link.
- Check if the account is valid (in other words, if it exists on the database).
- Then KLABLAMO! You're done!

<img src="{{ '/assets/pictures/side-projects/bookmarkhub/token-based-action-workflow.png' | relative_url }}" alt="General workflow for actions that requires a token">
<p class="caption">General workflow for actions that requires a token</p>

For resetting of passwords, it's mostly the same but a few extra steps.

- Generate a link that corresponds to the account.
- Send to the user via email.
- The user visits the link.
- If the token has expired, reject the process. Otherwise, continue.
- If the account is invalid, reject the process. Otherwise, continue.
- Prompt the user for the new password and submit it to the server.
- Change the password in the database.

For these, I need a couple of components: an email client and a web token generator.

I used [Nodemailer](https://nodemailer.com/) for the email client and I registered a new email address for the app (with Gmail, of course since I'm a cheapskate) and I've used [JSON web tokens (or JWT)](https://jwt.io/) for... the tokens. 

I could've used a more secure token generator option since there are a couple of things I did. Since [JWT are made so that the server does not have to hold the data](https://en.wikipedia.org/wiki/JSON_Web_Token#Vulnerabilities_and_criticism), it could mean it could easily be exploited if implemented improperly. ~~Now that I think about it, I have thought a few implementations without the JWT thing.~~

The solution I have in mind just includes an additional security layer for resetting the password by allowing one user to make one reset password token at any given time. It is yet to be implemented at the time of writing, though. ~~Or I could implement without the JWT.~~

### Bookmark import
The core function of the app is to share bookmarks. Since there are common bookmark formats such as [Netscape/digital bookmarks](https://en.wikipedia.org/wiki/Bookmark_(digital)) and [Pocket exports](https://help.getpocket.com/article/1015-exporting-your-pocket-list), I focused on that. 

I've already had the schema for the bookmarks so I'm planning from the start to implement it on my own. I looked for similar solutions for converting Netscape bookmarks and based my upcoming code around those solutions. Then, I started to create the algorithm. The algorithm is quite simple: 

- have the file as input
- scan the file
- convert the file accordingly
- output the object

<img src="{{ '/assets/pictures/side-projects/bookmarkhub/bookmark-schema-visualization.png' | relative_url }}" alt="Bookmark file conversion visualization">
<p class="caption">Bookmark file conversion visualization</p>

Anyway, this feature is kinda large (at least for me at the time) so I simply break the whole thing down into simple components:

- a validator &mdash; checks whether the file is a valid bookmark file
- a converter &mdash; check

Each of them to be associated with Netscape bookmarks and Pocket exports so I have at least 4 smaller function components to complete.

There's also an upcoming validator and converter for JSON bookmark files but there are not much use cases for it (I think...) so I don't know if it stays or not. 

#### Validators
Let's start with the first component: validators or as I want to call it, checkers (not that [checkers](https://www.pexels.com/photo/red-black-and-blue-tattersall-textile-827056/)).

For the bookmark file validators, the program just checks for the file extension. However, since both Netscape bookmarks and Pocket exports are both in HTML format, I have to implement additional checkings. For the Netscape bookmarks, I just have to check the doctype (`<!DOCTYPE NETSCAPE-Bookmark-file-1>`). For the Pocket exports which has the common HTML as the doctype (`<!DOCTYPE html>`), I have to check for the title since it is specifically assigned for it (exploitable but eh, at least its body is easy to parse through).

#### Converters
Next up is the converters. They are functions that convert specific files into a JSON object, to put it simply. The returned object should follow a specific format for it to be stored properly on the database:

```JSON
{
    "type": "STRING",
    "title": "STRING",
    "root_name": "STRING",
    "children": {}
}
```

- `type` &mdash; What type of bookmark is being imported (Netscape or Pocket)
- `title` &mdash; The title of the bookmark which is extracted from the `<title>`
- `root_name` &mdash; The name of the root folder
- `children` &mdash; The bookmarks themselves

Same as always, we have two formats (so far) to convert into objects: Netscape bookmarks and Pocket exports.

Since both Netscape bookmarks and Pocket exports are in HTML, I first thought of making an HTML parser myself to ramp up my skills but I discarded it and focus on finishing instead. I used [JSDOM](https://github.com/jsdom/jsdom) since I found the codebase of one of the solutions is using it. Besides, it's a perfect fit for what I need. 

Anyways, converting a Netscape bookmark into an object is kinda easy enough. To ensure you're reading with me, let's have an example bookmark.

Let's visualize a directory tree of a [pretty small sample of a bookmark](https://www-archive.mozilla.org/quality/browser/front-end/testcases/bookmarks/netscape-bookmarks.html) (changing the names to not distract with the links).

```
NETSCAPE_BOOKMARK
├───FOLDER_1
├───FOLDER_2
│   ├───LINK_2.1
│   ├───LINK_2.2
│   ├───LINK_2.3
│   ├───LINK_2.4
│   ├───LINK_2.5
│   └───LINK_2.6
├───FOLDER_3
│   ├───LINK_3.1
│   ├───LINK_3.2
│   ├───LINK_3.3
│   ├───LINK_3.4
│   ├───LINK_3.5
│   ├───LINK_3.6
│   ├───LINK_3.7
│   ├───LINK_3.8
│   └───LINK_3.9
├───FOLDER_4
│   ├───LINK_4.1
│   ├───LINK_4.2
│   ├───LINK_4.3
│   └───FOLDER_4.1
│       ├───LINK_4.1.1
│       ├───LINK_4.1.2
│       ├───LINK_4.1.3
│       ├───LINK_4.1.4
│       ├───LINK_4.1.5
│       ├───LINK_4.1.6
│       ├───LINK_4.1.7
│       ├───LINK_4.1.8
│       ├───LINK_4.1.9
│       ├───LINK_4.1.10
│       ├───LINK_4.1.11
│       ├───LINK_4.1.12
│       ├───LINK_4.1.13
│       ├───LINK_4.1.14
│       ├───LINK_4.1.15
│       ├───LINK_4.1.16
│       ├───LINK_4.1.17
│       ├───LINK_4.1.18
│       └───LINK_4.1.19
├───FOLDER_5
│   ├───LINK_5.1
│   ├───LINK_5.2
│   ├───LINK_5.3
│   ├───LINK_5.4
│   ├───LINK_5.5
│   ├───LINK_5.6
│   ├───LINK_5.7
│   ├───LINK_5.8
│   ├───LINK_5.9
│   ├───LINK_5.10
│   ├───LINK_5.11
│   ├───LINK_5.12
│   ├───LINK_5.13
│   └───LINK_5.14
└───LINK_1
```

You might get an algorithm of this already. Since nested folders are a thing, we can think of a simple function that does the following:

- Scans each item in the directory.
- If the item is a folder, scan the items in that folder.
- If the item is a link, add it in the object.
- Return the object.

That is just the very simplified pseudocode. Remember what is the input and the output of the function. The input is the folder which is represented through HTML and the output should be an object. If you like to, this could be a good coding exercise but let me show you some further details.

With the help of the [documentation](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa753582(v=vs.85)), here's my observation on the Netscape format:

- `<!DOCTYPE>` has `NETSCAPE-Bookmark-file-1` as their value
- paragraph elements (`<P>`) only serves as line separators
- folders are represented through `<DL>` and can contain any items, even folders
- the name of the folders are represented in headers (`<H3>`)
- individual items inside of folders are enclosed in `<DT>`
- links are (obviously) enclosed in anchor element (`<A>`) and usually makes the directory tree ends

Integrate our pseudocode with the observations then we have a concrete solution of a bookmark object from a Netscape bookmark. 

One more thing, there are subtle differences between each major browser (I tested on Edge, Firefox, and Chrome) but the core features are there. For instance, Firefox includes a description that is enclosed in `<dd>` for each link when it is available and it contributes to the *major* size difference with each bookmark.

I mean, look at this... LOOK AT THIS!

<img src="{{ '/assets/pictures/side-projects/bookmarkhub/bookmark-size-comparison.png' | relative_url }}" alt="Bookmark size comparison between major browsers">
<p class="caption">Bookmark size comparison between major browsers</p>

How about for a [Pocket export](https://help.getpocket.com/article/1015-exporting-your-pocket-list)? Fortunately, it's way easier now that we've discussed the steps needed for converting the Netscape bookmark! It is similar except with a different coat of paint. 

- Each folder are enclosed in `<ul>`
- Each item in the folder are enclosed in `<li>`
- Links, again, are enclosed in an anchor element (`<a>`)

Well, usually Pocket exports only have two folders: one for the unread and one for the read archive. In case that they do have nested folders, it is most likely that they're going consistent with the observations stated above.

I think you can go easy-peasy on this one if you want to make it as a coding exercise but still, go ahead. 😁

Take note that there are still missing features on bookmarks. You cannot manually add, remove, or edit one of the bookmarks. All of the bookmarks you've seen on your profile and the other users came from an import of some kind. That'll be for future consideration. I focused too much on the server programming so much that it basically crippled the time to develop bookmark-related features. Whoops... 😅

### Social media-esque features
Simply put, the only "social media" feature (if it is considered as one) is that you can see other people's profile. Well, that's it but I do want to discuss further plans for this type of feature.

To make it closer to a social media, I have to choose some social features and here's what I've considered:

- A homepage for shared bookmarks between all users
- Search page for the users
- A public list of all users (if you don't want to be in the list, you can set to private)

Anything else is on the backseat for now. I don't want to take too much time to develop it, thank you very much.

## What could've done better?
- **The testing** &mdash; No doubt! 😁 I need to have my software testing skill level up (especially that I also messed that up in my next project). I only have ONE feature tested for this app since I have no idea how to properly design tests for a server-sided Node.js app. I eventually got a grasp of different methods of testing which is something that I'll implement for this app and further beyond.
- **The planning** &mdash; As always... Well, I could say that I've improved, at the very least. 😊 I've put more time into the planning phase but not enough for an app that is quite the scale (relative to me, at least). I don't know for how long will this 'reckless-planning-and-going-straight-into-coding' strategy will benefit me. I did learn a *whole lot* from this experience: user account management, cookies and sessions, authentication and authorization, different security measures for a server-sided app, and integration between different libraries (and trying not to give a crap for overanalyzing which stack is the best for the situation). Woooh! It's quite a confidence booster, I must say!

## Conclusion
It's one of the biggest projects I have so far. It may be trivial for some of you but it's a large undertaking for me. I've never done something like this before and it felt satisfying! Though, I have to polish some things with the UI/UX (clearly not my specialty). 

If you're interested to see the [repo](https://github.com/foo-dogsquared/bookmarkhub), go ahead and do whatever you want: review the code, contribute to it, or whatever the things that are not listed here. If you want to contribute or want to see how the code works, I've also written a [code walkthrough](https://github.com/foo-dogsquared/bookmarkhub/blob/master/docs/general_app_structure.md) to get you started.

Feedbacks and constructive criticisms are quite appreciated (code reviews and design feedbacks, especially) which you can reach me out on my email at `foo.dogsquared at gmail dot com`.
