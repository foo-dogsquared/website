---
author: foo-dogsquared
categories: "side-projects"
date: 2019-02-07 14:55:02 +0800
layout: post
tags: ["projects", "web-extension", "javascript"]
title: Introducing remote-repo-author-viewer (My first web extension)
---

Hey y'all, foo-dogsquared here. Today, I'll be introducing you to my first web extension, the [`remote-repo-author-viewer`](https://addons.mozilla.org/en-GB/firefox/addon/remote-repo-author-viewer/) or `rrav`, for short. 

## Side commentary
I created this web extension as a side project to go away from developing my main side project for a while. Also, I just have to create this extension after an idea suddenly popped into my brain. Overall, it has a niche use.

## Overview
It's a neat little extension that provides links to the remote repo/code whenever you visit a supported site like GitHub. This is especially useful if you're visiting a GitHub page. More sites will be supported soon. 

## How it works
The way it works is pretty simple: it justs detects through the URL and detects the author and the project, if possible. Currently, the code implementation is quite messy, how the URL is being parsed feel forced. I eventually thought of a way on how to parse through URLs a smoother process than before but it is not yet implemented on code.

Anyways, here's my abstract of the whole object:

```
<protocol>://<host>/<account name>/<project name>
```

That is simply it: a URL template for the location of the project. The template can be modified in some way, of course. For example, the remote repo sites might have this template, instead:

```
<protocol>://<host>/account/<account name>/project/<project name>
```

Where the subpath after the route `/account` is the route for the author and their projects.

But the template is different for the project pages (GitHub pages and GitLab pages, for example) themselves. Here's my template on it:

```
<protocol>://<account name>.<origin subdomain>/<project name>
```

Yeah... [My own blog](https://github.com/foo-dogsquared/blog) which is located in `https://foo-dogsquared.github.io/blog`, for example follows this template. [GitLab pages](https://about.gitlab.com/features/pages/) also have the same template (mostly, if I miss anything).

## What are the main takeaways from the process
- **Read more carefully now 😂. Seriously a lot of the mistakes in this development session are because of not reading and understanding the API.** 
- **A bit of planning can be still a tremendous help.**
- **Take a step back and look at the big picture of things before going back to focus on a part of it**

## Conclusion
Overall, it's a fun process. I like to take these little side sessions to get off my main side project for a while. Although I'm considering to take a bit more focused on multiple projects, maybe take it on a weekly basis just to reduce the fatigue and boredom from creating the project. Or maybe it's just a matter of perspective. Who knows? One thing for sure, I'll make it with a 
different perspective AND time management this time.

I'll probably make a walkthrough on creating a web extension too if I have any other ideas that is possible in web extension form. Until then, see you on the next post.
