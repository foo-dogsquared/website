---
layout: post
title:  "Git: Concepts and Mechanics"
date: 2018-05-28 7:03:34 +0800
author: foo-dogsquared
categories: git
tags: [programming-notes, git]
---

So... after a mishap happened on my site weeks ago (HINT: it is a page build failure from a file that list all of my posts that 
GitHub Pages decided to not accept it for some reason), I decided to write this as a way for level up my version control skills 
(or at least, review them for my sake). *sigh*

Well, IDK how to write an introduction for this, so let's get on to the main branch of this post but first, let us be familiar 
what Git really is.

<img src="{{ 'assets/pictures/git-logo.png' | relative_url }}" alt="Git Logo" width="250px">
<p class="caption">Git Logo (as of 2018)</p>

## Primary Primer on Version Control Systems
Version control, it may sound fancy, but it is a simple thing. You probably have done some form of version control in some 
way or another like the good ol' copying of file in another directory, saving it in a cloud storage, and storing it in a USB. 
Yeah, you get the idea, it is a form of file backup but that is not what version control is all about.

As said by the *About Version Control* section on the official Git book, *Pro Git* (in which you can download it from this 
[link](https://git-scm.com/book)), a version control system (VCS) is:
> a system that records changes to a file or set of files over time so that you can recall specific versions later

Well, it usually revolves around the changes happened on the files. That's how version control systems help you manage your 
files. As said by probably a thousand of articles and posts about Git (and other VCS), think of version control system as some 
kind of an EPIC save button that allows you to epically save things in case of an epic fail. Also, keep in mind that VCS are 
not only used for managing code files but also for other files as well whether it's a text file, a document file, or a spreadsheet 
so even a non-programming project (whatever that is) can utilize a VCS.

And as such tool with such usability, it is used mostly on big projects especially for those that requires multiple person (which 
composes of probably 95% out of those projects). In programming world, well, it is quite used extensively everywhere unless you 
are in one of those groups that hate using VCS possibly from traumatic events while using it.

This is why most of the recommended suggestions when entering the chaotic world of programming includes learning a version control 
system. This is a very helpful tool to be included in your toolkit and in your career since most tech group uses VCS, particularly 
Git.

Well, yes, there are [other version control softwares](https://en.wikipedia.org/wiki/List_of_version_control_software) out there, 
but most of them really uses either [Subversion](https://subversion.apache.org/) or [Git](https://git-scm.com/) 
(also keep in mind that they have a difference in terms of how they are being used).

If you want to have an overview on different version control systems, you can take a look in the *About Version Control* section 
on *Pro Git* where they will obviously glorify the system Git uses. Also, if you have the time to do so, you can refer to 
[this list of common vocabulary](https://en.wikipedia.org/wiki/Version_control#Common_vocabulary) to have a slight idea in case 
I've mentioned words such as *commit*, *branch*, and other words in advance.

And speaking of Git... Yeah, now we are going to talk how to Git... (HA! You thought I am going to include 'good/gud', eh?)

## History Lesson on Git
Well, before we *really* discuss Git. Let's have a little history lesson with Git, shall we? *(Of course, it's already set and 
you can do nothing about it [maybe except skipping this part but whatever])*

As you might have read on your own research with our quick reference teacher, Wikipedia-*sama*, Git was designed by Linus Torvalds 
(yes, the guy that developed the Linux kernel) from his need of distributing source code in his own way ever since the 
VCS that the Linux community uses ceases from becoming a free-of-charge tool.

After that incident, the Linux community (in particular, Torvalds) decided to write their own VCS that is similar to the ones they 
have used, however with additional criteria that makes Git to be what it is today. Such criteria that they wanted to be for Git 
are:
- simple
- easy to use
- fully distributed
- highly performant
- difficult to lose data

And within 2005, Git was born. Two months after Torvalds created the thing, he passed the maintenance duty to 
[somebody else](https://en.wikipedia.org/wiki/Junio_Hamano) and became a major contributor to the project, seeing as he is the 
one who managed to get Git to be in its version 1.0, then maintained the project many months after.

Then in 2008, GitHub (and the [octocat](https://assets-cdn.github.com/images/modules/logos_page/Octocat.png)) was born to 
be an accomplice to Git until it became the largest web hosting site for source code or something. 
[Then the rest is history, I guess](https://github.com/ten).

Now onto the main branch of this post...

## What is Git?
Git is a version control system with a command line interface (mainly) that uses a [distributing version control system (DVCS)](https://en.wikipedia.org/wiki/Distributed_version_control). 
Which means everyone involved will have a clone of the project to revise it in their own way then merge them when necessary into 
the server computer. 

DVCS also makes use of your local resources instead of relying on a network, meaning you can do some version control-related stuff 
offline. Compared to other CVS, this is a very huge advantage and it is one of the reasons why Git (and other DVCS) are quite fast 
in terms of doing an operation.

If you have read *About Version Control* section on *Pro Git* and understood what version control is and what are some ways to 
implement this system, you'll figure out that what makes Git different from other VCS is the way how Git treats its files.

## How do I use it?
If you're on a Windows OS or Mac OS, you would have to download Git [here](https://git-scm.com/downloads) and install it. 
Else if you are on a Linux-based OS, chances are Git is already installed --- makes sense as Git was developed for Linux. But 
in case that you did not have Git for some reason, you can download and install it through the installed package manager of 
the OS.

Anyway, the thing we need to know about when using Git is that it is uses CLI, that means we just have to get the command 
line to utilize it and be comfortable with seeing just text (although there are GUI version of it). 

Git has a plethora of commands so I would recommend to memorize a handful of important and useful commands and do make good use of 
the man page of git and `git --help` a lot. Being a decent programmer does not mean they know all of the commands and syntax of 
the language, they usually refer to documentation since there are other things other than syntax to worry about and there just a 
ton of them --- just a self-reminder.

While speaking of Git, we cannot really avoid not talking about GitHub, a web hosting site that implements Git as a source version 
control tool and what makes Git to be a rising star in the version control industry.

And while at on the subject of GitHub, I would suggest creating a GitHub account for it, if you do not have one already.

### Setting up Git
Now you have Git, it is time to configure Git which will be explained later. For now just run this command and fill it with 
appropriate values:
{% highlight bash %}
git config --global user.name "Your Name"
git config --global user.email mail@example.com
{% endhighlight %}

This command sets the name and email for all and upcoming repositories to be filled each time you commit.

If you want to have a different configuration of name and email in a single repository, you can go to the directory of the project 
of your choice then run the command without the `--global` option.

Why do you want to do this? Because each time you would send the updated files on a remote repository, it would ask you to 
fill the commit with the needed information such as your name and email to be associated. Also, it is obviously tiring, so there's 
that.

### Obtaining a repository
OK! Let's get into actually using Git. For starters, you can get a Git repository by either making your current directory to 
be a Git repository or cloning one from some place. For now, let's use with the former which you can do that by:
{% highlight bash %}
git init
{% endhighlight %}

And now you have a Git repository that is ready. A more detailed explanation on `git init` is that it creates the necessary files 
that basically serves as a local database to be referenced in case you want to push it to the remote repository (i.e. GitHub, 
BitBucket).

Well, now that we have ourselves a Git repo, what now?

### Checking files
We add some files in it, of course! Just add whatever files to your desire (of course, consider what files are you going to 
include). Next, run this command:
{% highlight bash %}
git status
{% endhighlight %}

Assuming it is a new Git repository, you will see something like:
{% highlight git %}
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        dog.ods
        folder-1/
        poop.txt.txt

nothing added to commit but untracked files present (use "git add" to track)
{% endhighlight %}
<p class="caption">`git status` output example</p>

...that as your output.

'`On branch master`', '`Untracked files`'... Yeah, you may be wondering, presumably fellow newb developer. What are those? 
What is this whole VCS thing about? What is your purpose? We'll go through them one concept at a time (maybe except the last one).

### Adding a file
For now, let's move on and do what the log says. Do run the said command:
{% highlight bash %}
git add .
{% endhighlight %}

Yes, `git add` must have a path as an argument. If you want to include them all, just go to the main location of your project and 
type the above command. You can also add multiple files by just separating their path locations with a space.
{% highlight bash %}
git add ./file1.txt ./folder-1/file2.txt
{% endhighlight %}

What this does is that it adds the specified file(s) into the staging area.

### Commiting a file
Anyway, now what does that do? Run `git status` again and you'll the see a log with a list of the now tracked and untracked files.
{% highlight git %}
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   folder-1/matter.txt
        new file:   poop.txt.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        dog.ods

{% endhighlight %}

OK! Now we have files that we can commit in which we can now commit those files with:
{% highlight bash %}
git commit
{% endhighlight %}

This will run an editor (*emacs* or *vim*) that let's you add a message. Since I find it hard to even *start to write* a 
line (my shell opens *vim* as the editor), I'll just add an `-m` flag with the message instead to skip that part.
{% highlight bash %}
git commit -m "Your commit massage"
{% endhighlight %}
<p class="caption">Command for reference</p>

Which will be added to the local database and containing the reference to those files that you've added.

OK! What if I made a mistake to my commit message? You can just commit another one but that is quite ineffecient at best since 
now you have two commits with identical stuff that appear on your log which renders one of them to be useless. You can do 
a replacing of a commit with this:
{% highlight bash %}
git commit --amend -m "Your commit message"
{% endhighlight %}

With this command, you still created two commits but the other one that has been replaced will not appear into your commit 
history. That means, less cluster needed for your work.

With each commit, there is also the hashstrings given to every one of them. This will also serve as your reference to those 
commits and it will be more helpful if you added a helpful commit message to not only make those commit a bit more memorable 
and easy to be referenced to but also helping towards other people not wasting their time finding that changes you've logged.

I think this [*xkcd* strip](https://xkcd.com/1296/) portrays a situation of writing not-good commit messages.

<img src="{{ 'assets/pictures/xkcd-git-commit.png' | relative_url }}" alt="A xkcd comic strip">
<p class="caption">Me when my site build failed</p>

If you have read a handful of tutorials and articles about the basics of Git, you probably minded about writing a good 
commit message. The following rules are ripped from the book 
*[Git Notes For Professionals](https://goalkicker.com/GitBook)* which was ripped from a 
[post](https://chris.beams.io/posts/git-commit/#seven-rules):
- Separate the subject line from body with a blank line
- Limit the subject line to 50 characters
- Capitalize the subject line
- Do not end the subject line with a period
- Use the imperative mood in the subject line
- Manually wrap each line of the body at 72 characters
- Use the body to explain *what* and *why* instead of *how*

### Comparing commits
OK! Now what? Try to change the content of a file and run `git status` again and you will see some output that tells you what 
tracked files are changed and what part of it has changed. This is useful but it is limited for that you can only see through it 
if you did not commit yet (I think). 

BUT! What if I want to compare two commits? That is quite possible thanks to this command:
{% highlight bash %}
git diff commit1 commit2 [--] path
{% endhighlight %}

You can omit one commit argument as it will be interpreted as the latest commit by default. You can also leave out the 
path argument if you want to view the changes you've made throughout the working tree.
If you want to specify a file (or a directory), you must include two en dash (-) then the path of the file after a whitespace.

Keep in mind that the commits there are the long hashstrings associated with each commit. If you want a list of your commits 
of your working tree, you can do...
{% highlight bash %}
git log
{% endhighlight %}

You can add a `--oneline` flag if it is too much of a pain to scroll through multitudes of lines just for each log. You can also 
add a `-n` with *n* that stands for the number of logs that will appear from the (*n*th - 1) commit before the most recent 
commit.

The output log you shall see is having two kinds of the changes you've made to the files specified.

### Pushing the project
If we are sure of the changes that we've made, you can now push that changes you've made to a remote repository with...
{% highlight bash %}
git push
{% endhighlight %}

Which will push the repository into the remote repository wherever the repository came from... except in our example, we don't 
have a remote repository, yet.

Oh, and have you created a GitHub account? If so, GREAT! If not, CREATE ONE NOW!

OK, now that we have a GitHub account (presumably), we now have a reference to a remote server. 

If you are just starting to use (or be familiar with) GitHub, you can view this video then go through the 
[playlist](https://www.youtube.com/playlist?list=PLg7s6cbtAD15G8lNyoaYDuKZSKyJrgwB-) to be more intimate with GitHub.

<iframe width="560" height="315" src="https://www.youtube.com/embed/noZnOSpcjYY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

Now that you are familiar with GitHub (presumably), we shall now push our test to the remote repository which is located 
on the GitHub's server. 

First, let's just create an empty repository then now we shall configure our local repository to be sent on that remote 
repository by...
{% highlight bash %}
git remote add origin <project url>
{% endhighlight %}

...wherein we added a location of the remote repository and named it `origin`. You can replace `origin` with something, just 
make sure you enter the correct value in the below commands.

For the project url, you can copy the link of your repository and add a `.git` at the end.

Next, run the `git push origin master` command and most likely you will see an error saying the push cannot be forwarded 
because some content are not found on the local repository.

To do this, we can *pull* the remote repository by
{% highlight bash %}
git pull origin master --allow-unrelated-histories
{% endhighlight %}

After, that you shall see some files have been added (if you added some files over GitHub) and the Git repository has now 
been configured. Then go right ahead and run `git push origin master` if you are pushing the local repository for the first 
time and if you go the url of your repository, you will see the files from your local repository has been added. 

-----

Well, hopefully that's enough for you to be ready for using Git in its basic level. If you still want some practice (or 
if this post done a horrible job of explaining things), you can put some practice time to it in this 
[page](https://try.github.io/levels/1/challenges/1) that is offered by GitHub. 

Anyway, there are still some things to talk about Git so let's immediately get on to that.

## File States
Like life, files has states. This, of course, open up different functions and different interactions whenever the files is in 
one of the particular states. In this topic, I consider that files in a Git repository have four states:

### Untracked Files
This is not a concise explanation of this thing but let's just say that the local database contains the reference of the files. 
Being a new Git repository (presumably), the local database does not contain any reference to the files and any files that is 
detected by Git in the Git repository will be considered as *untracked*. 

Any untracked files will not be interrupted by Git. You cannot commit 
those files, you cannot upload them to the central repository; basically, they will remain untouched by Git.

If you want to make a file to be not detectable by Git, you can add a <span class="fileName">.gitignore</span> file that contains 
a list of the path of the files that you want to remain undetectable. This reduces the hassle of managing files that is 
most likely be in a more error-prone way. So yeah, pretty useful if you want to stage all files except for those particular files 
in one go.

### Unmodified & Modified Files
After you commit a file, it will be considered now as an unmodified file but this can also be changed into a modified file if 
you... uh, modify the contents of it. 

Whenever the file is considered modified, it is ready to be staged on the staging area in which you can do that by `git add`.

### Staged Files
Files that are on the staging area. This is where files will end up before a commit. 

In a general sense, these are the files specified after you run `git add`.

This lets you to selectively choose files to be updated before you can be so sure of what you want for your next update of your 
codebase.

### Commited Files
Basically files that have their data saved into the local database. Yeah, that's it.

## Git Integrations
Git has earned some technologies that is being implemented with it. Examples of some of it is [GitHub](https://github.com), 
[BitBucket](https://bitbucket.com), and many others.

Usually, Git uses GitHub as its default remote repository. Whenever you finalize the update of your project, it will go to 
GitHub to push that repository online.

To have your Git repository configured to be sent on a particular location other than GitHub, enter the `git remote add` command 
with the appropriate values.

## (Re)Sources:
- [Distributed version control on *Wikipedia*](https://en.wikipedia.org/wiki/Distributed_version_control)
- [Git Basic Challenge on *CodeSchool*](https://try.github.io/levels/1/challenges/1) --- GitHub's offered training on basic Git
- [Git for Beginners on *SitePoint*](https://www.sitepoint.com/git-for-beginners/)
- [Git Notes For Professionals](https://goalkicker.com/GitBook) --- another recommended source
- [GitHub & Git Foundation Playlist --- GitHub Training & Guides *YouTube Channel*](https://www.youtube.com/playlist?list=PLg7s6cbtAD15G8lNyoaYDuKZSKyJrgwB-)
- [Pro Git](https://git-scm.com/book) --- the official Git book
- [Push existing project on GitHub on *Stack Overflow*](https://stackoverflow.com/q/17291995)