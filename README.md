# PureCom
<img src="https://user-images.githubusercontent.com/60558693/99888937-37ae3b00-2c16-11eb-8583-7e6bebd72511.png" width="130">

Latest Version Details:
> v1.1.2.9_11.21.2020
> [Changelog.md](https://github.com/DaarkDev/purecom/blob/main/changelog.md)

## Description
The purpose of this console application is to provide a user friendly experience of something that potentially feels
somewhat similar to MS-DOS. I plan to maintain this project for as long as possible, as long as either I have the
motivation to do so, or at least the community wants me to keep committing and adding new features as well as continue
to develop this piece of software. There are a number of uses for this type of program, and I hope that you can find
the one or more ways that best suit you and provide what you would like. My goal for this program is for it to still
be a console application, but to continue to grow and provide users with a light-weight friendly and fast experience
on both ends. This project for now will be mainly scripted entirely in [Lua](https://www.lua.org), but as time goes
on it is possible that me or other contributors will somehow make use of other languages in this software. If you
are interested in becoming a contributor, you can join the discord (Information at the bottom of this page) and DM
or talk to me. Please note that I'm mainly looking for people who already have prior experience, or at least somewhat
know what they are doing and can contribute well in some way. If the instructions are not clear or you have suggestions,
feel free to keep me posted by joining our discord server and talking to me. Please do not try to hide the source of
my program for any reason, even if it is a modified distribution that is not the original, as I want everyone to be
able to learn and view the source of this project.

## User Manuel and Guide
If you are reading this right now, chances are you most likely don't know what you are doing. However, that's okay
since the entire point of this section is to make sure that at the end you *do* know what you're doing! So let's
get started straight away. When you download the latest release of PureCom, it will be in a zip file format. I
strongly recommend you extract/unzip this file before continuing, as it could cause errors or potentially straight
up not work at all. Once you've done that and your in the main folder of PureCom, your going to want to right-click
on the shortcut labeled: "run.bat", and then click edit. It doesn't really matter what program you use when doing this,
so I'm just going to use the default text editor since it's only simplistic batch code. Once your viewing the contents
of this file, find the line that says something like: "cd usernamehere". Once you've found that, change "usernamehere"
(or whatever it may be) to the user on your computer that you will be using. This is so that when you run this bat
as an administrator, it will be able to find its way to your Desktop (or other directory) where this folder should
be stored. It is recommended to always run this shortcut as an administrator, this is so that it can avoid potential
permission errors/issues when running commands or performing other tasks. Obviously, if this folder is not in your
desktop, then change the directory so that it can find its way to the "src" folder and be able to execute the main
lua file. I'm going to assume that you know how to do this, because it is very basic and does not require any
prior knowledge to figure this out. Once you've done this, make sure to run the bat shortcut as administrator
everytime you want to open PureCom to avoid errors, and your set!

### Selecting the correct Icon for the bat shortcut
If for whatever reason the icon for the file "run.bat" (shortcut) is not appearing or not properly displaying, then
right click on the file and then click on properties. Once you've done that, change the icon to the icon file that
should be located in the "resources" folder of PureCom. After that, your icon should be properly displaying!
If you have issues, please try to resolve them using common sense. Example: Don't download this in a different
directory and forget to check that it's properties are as they should be. If you still have trouble, please contact
me via discord and I can try to help you.

### Modifying the source code and making manual changes
If you would like to make your own version or distribution of this software, then you came to the right section!
However, if you have little to no prior lua experience or knowledge, I strongly recommend that you do not continue
or try to modify code in this software without help from someone who knows what they are doing. Anyways, let's 
continue. When you navigate to the "src" folder, you should find various other sub-folders inside of it as well as
the original "run.bat" file that isn't the shortcut. Along with this, you should see a file named "main.lua". This
file is how this program majorily ran and managed, so most everything will be inside of this file. Keep in mind that
when modifying the contents of this file, aftwards you will want to change the numeric value of the key "file_bytes"
which should be located in the global system table at the top of the page. You will want to change this to the number
of bytes that there is now after modification, so that users do not think they have accidentally messed with the
contents of the most important file. If you make unofficial changes, I would be very pleased if you could credit me
as the original creator of this software and include contact information to me, such as my discord user (Daark#8745)
or discord server (Link further down this page).

### Making applications for PureCom
Hello again! If you're reading this, most likely you are interested in making your own addons or applications for
other users to acquire, and I'll be telling you just how to do that in this section. It's actually quite simple,
and anyone with at least some basic knowledge of [Lua](https://www.lua.org) scripting and a minute or two should
be able to accomplish this. When you navigate to the apps folder (from the src folder) it should be completely
empty unless you have installed other user's applications already. To make your's, simply decide how you would
like to organize it (singular or multiple lua files, folder, etc) and then allow user's to download it and put
it into their apps folder. After that, there are a few ways your users can run what you've designed.

Method #1:
```lua
> /run-file apps\xyz.lua
```
This method is not as fast as the next, because you have to be CD'ed into the apps Directory or specify it in the second argument. 
This is assuming you want your application to actually be located in the apps folder, which it doesn't, it just adds accuracy
and minimizes confusion when people are trying to use this software.

Method #2:
```lua
> /run-app xyz.lua
```
This method is the better of the two, and requires you to type less assuming that your application is located in the apps directory.

### Optimal argument specification
This will be one of the most simple tutorial sections, and you're about to see why. While we are primarily targeted at
the windows platform, we also have basic support (Expect more bugs) for linux. Depending on which platform your on,
you'll want to use different basic grammar syntax to ensure what you are trying to accomplish is the most likely
outcome. While I'm not entirely sure why this works how it does, I've experimented and came to the conclusion of some
of the smaller differences in how to use the two different distributions. Keep in mind that the windows distribution was
made to be used on the actual windows operating system desktop/laptop (not website), and the linux version was made to
be used on [repl.it](https://www.repl.it). This is not saying altering the intended parameters will result in errors
and/or confusion, but this is saying that it is possibly that it could, which is why it's not recommended.

Method #1 (Windows):
> This section is for users who are using windows. I've found that on this platform,
it is generally better to use the backslash (\) instead of the forward slash (/) when
executing system commands within PureCom. This is what's recommended, but is not
necessarily universally applicable in all scenarios according to the parameters.

Method #2 (Linux, repl.it):
> This section is for users who are using the linux distribution of PureCom, specifically
on [repl.it](https://www.repl.it). My opinion is that generally, you will find that it is
better to use the forward slash (/) instead of the backslash (\). It is possible that this
is also applicable to the regular distributions of linux and not just on [repl.it](https://www.repl.it),
but I cannot know for sure. Keep in mind that these opinions are based off of what I have
found within a primarily short time range, so they could vary depending on the scenario.

### Current support and compatibility
Keep in mind that the windows distribution is the native version of PureCom, and has been
much more tested than the linux/[repl.it](https://www.repl.it) distribution. Generally speaking,
I find the native version to be much more functional and reliable, but still feel free to experiment
with the other version as well. You should also keep in mind that the native version (For Windows)
is all that you will find on this github repository. If you would like to download or use the other
version, join the discord which will be listed below near the bottom of the page.

Current representation of compatibility:
- [x] Windows
- [x] Linux/[repl.it](https://www.repl.it)

Comparison (Keep in mind that the following is my opinion, not necessarily truth in every scenario):
  - Windows:
    - [x] More thoroughly tested.
    - [x] Generally more reliable.
    - [x] Native distribution.
    - [x] Primarily maintained version.
    - [x] Easier to setup and use.
    - [x] Updated more frequently.
    - [x] Better testing and support for main features.
  - Linux/[repl.it](https://www.repl.it)
    - [x] More efficient due to linux OS nature.
    - [x] Will Require less system resources. (Even though both versions call for barely anything)
    - [x] More compatibility due to online nature. (Chrome OS, etc)
    - [x] Can be used on the go since it is primarily online.
