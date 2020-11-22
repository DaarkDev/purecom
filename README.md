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
on the shortcut ``run.bat``, and then click edit. It doesn't really matter what program you use when doing this,
so I'm just going to use the default text editor since it's only simplistic batch code. Once your viewing the contents
of this file, find the line that says something like ``cd usernamehere``. Once you've found that, change ``usernamehere``
(or whatever it may be) to the user on your computer that you will be using. This is so that when you run this bat
as an administrator, it will be able to find its way to your Desktop (or other directory) where this folder should
be stored. It is recommended to always run this shortcut as an administrator, this is so that it can avoid potential
permission errors/issues when running commands or performing other tasks. Obviously, if this folder is not in your
desktop, then change the directory so that it can find its way to the ``src`` folder and be able to execute the main
lua file. I'm going to assume that you know how to do this, because it is very basic and does not require any
prior knowledge to figure this out. Once you've done this, make sure to run the bat shortcut as an administrator
everytime you want to open PureCom to avoid errors, and your set!

### Selecting the correct Icon for the bat shortcut
If for whatever reason the icon for the file ``run.bat`` (shortcut) is not appearing or not properly displaying, then
right click on the file and then click on properties. Once you've done that, change the icon to the icon file that
should be located in the "resources" folder of PureCom. After that, your icon should be properly displaying!
If you have issues, please try to resolve them using common sense. Example: Don't download this in a different
directory and forget to check that it's properties are as they should be. If you still have trouble, please contact
me via discord and I can try to help you.

### Modifying the source code and making manual changes
If you would like to make your own version or distribution of this software, then you came to the right section!
However, if you have little to no prior lua experience or knowledge, I strongly recommend that you do not continue
or try to modify code in this software without help from someone who knows what they are doing. Anyways, let's 
continue. When you navigate to the ``src`` folder, you should find various other sub-folders inside of it as well as
the original ``run.bat`` file that isn't the shortcut. Along with this, you should see a file named ``main.lua``. This
file is how this program is majorily ran and managed, so most everything will be inside of this file. Keep in mind that
when modifying the contents of this file, aftwards you will want to change the numeric value of the key ``file_bytes``
which should be located in the global ``system`` table at the top of the page. You will want to change this to the number
of bytes that there is now after modification, so that users do not think they have accidentally messed with the
contents of the most important file. If you make unofficial changes, I would be very pleased if you could credit me
as the original creator of this software and include contact information to me, such as my discord user (Daark#8745)
or discord server (Link further down this page).

### Making applications for PureCom
Hello again! If you're reading this, most likely you are interested in making your own addons or applications for
other users to acquire, and I'll be telling you just how to do that in this section. It's actually quite simple,
and anyone with at least some basic knowledge of [Lua](https://www.lua.org) scripting and a minute or two should
be able to accomplish this. When you navigate to the ``apps`` folder (from the ``src`` folder) it should be completely
empty unless you have installed other user's applications already. To make yours, simply decide how you would
like to organize it (singular or multiple lua files, folder, etc) and then allow users to download it and put
it into their ``apps`` folder. After that, there are a few ways your users can run what you've designed.

Method #1:
```lua
> /run-file apps\xyz.lua
```
This method is not as fast as the next, because you have to be CD'ed into the apps Directory or specify it in the second argument. 
This is assuming you want your application to actually be located in the apps folder, which it doesn't have to be, it just adds accuracy
and minimizes confusion when people are trying to use this software.

Method #2:
```lua
> /run-app xyz.lua
```
This method is the better of the two, and requires you to type less assuming that your application is located in the ``apps`` directory.

### Optimal argument specification
This will be one of the most simple tutorial sections, and you're about to see why. While we are primarily targeted at
the windows platform, we also have basic support (Expect more bugs) for linux. Depending on which platform your on,
you'll want to use different basic grammar syntax to ensure what you are trying to accomplish is the most likely
outcome. While I'm not entirely sure why this works how it does, I've experimented and came to the conclusion of some
of the smaller differences in how to use the two different distributions. Keep in mind that the windows distribution was
made to be used on the actual windows operating system desktop/laptop (not an online website), and the linux version was made to
be used on [repl.it](https://www.repl.it). This is not saying altering the intended parameters will result in errors
and/or confusion, but this is saying that possibly it could, which is why it's not recommended.

Method #1 (Windows):
> This section is for users who are using windows. I've found that on this platform,
it is generally better to use the backslash (\\) instead of the forward slash (/) when
executing system commands within PureCom. This is what's recommended, but is not
necessarily universally applicable in all scenarios according to the parameters.

Method #2 (Linux, repl.it):
> This section is for users who are using the linux distribution of PureCom, specifically
on [repl.it](https://www.repl.it). My opinion is that generally, you will find that it is
better to use the forward slash (/) instead of the backslash (\\). It is possible that this
is also applicable to the regular distributions of linux and not just on [repl.it](https://www.repl.it),
but I cannot know for sure. Keep in mind that these opinions are based off of what I have
found within a primarily short time range, so they could vary depending on the scenario.

### Current support and compatibility
Keep in mind that the windows distribution is the native version of PureCom, and has been
much more tested than the linux/[repl.it](https://www.repl.it) distribution. Generally speaking,
I find the native version to be much more functional and reliable, but still feel free to experiment
with the other version as well. You should also keep in mind that the native version (for Windows)
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

*In the end, I think that it comes down to personal preference and where you want to use it.*

### Command Compatibility
If this documentation length is scaring you, don't worry, it's very easy to use and simplistic.
If it's not, then good for you! In this section, I'll be talking about how to properly utilize
commands to avoid errors whenever you can. This should be relatively short, as there isn't as
much to say here and I should be able to say everything needed in a shorter length. Let's get
started! One of the main things is making sure you know how to properly rename and move files
and directories. Also, keep in mind that this section is strictly for the native version of
windows, as the linux/[repl.it](https://www.repl.it) distribution simply hasn't been tested
enough for me to say firmly. Although, keep in mind that this may not necessarily always
stay true and it is just what my opinion is and what I have found.

Properly utilizing the renaming commands:
When using the ``> /rename-file`` command, make sure you are following the correct syntax,
and always using backslashes (\\) whenever necessary:
```lua
> /rename-file dir\xyz.format dir\newname.format
```
This command is strictly __NOT__ meant to be used for moving files or directories. It is only
meant to rename files, not even renaming directories, and should work as long as the syntax is
correct and the location of the file is still maintained.

How to use the other renaming command:
This is the second of two renaming commands, and is meant to move and rename directories, as well
as also move files. Keep in mind it also may work for other tasks such as plainly renaming files,
but is not the intended usage so it is recommended to use a simpler ``> /rename-file`` command
if that is what you are trying to accomplish:
```lua
> /rm-file dir\xyz.format dir\newdir\xyz.format
```
Always make sure to use backslashes (\\) when necessary to avoid possible errors and problems.

### Understanding and thinking about error messages
This is likely going to also be one of the shortest sections, as frankly there isn't as much
that I need to talk about. The main thing I want to mention is that *especially* but not *only*
when dealing with file-related commands, it could be possible that an error was thrown because
a file that was supposed to be there, or you thought was there, isn't. (However, it could also
be due to a internal system error) Before running commands especially related to handling files, 
I recommend checking to make sure that the files you thought existed actually do. If you run
into further errors and need assistance, make sure to contact me preferably via discord.

### Understanding the *essential* ``/cd`` and ``/pd`` commands
These are some of the most essentials commands that there actually are, besides possibly
the more file-related commands themselves. In this section, I will be showing you how to
properly utilize these commands.

The ``/cd`` command:
```lua
> /cd directory
```
If you don't remember to use backslashes (\\) anywhere else, *please* remember to use them here.
While it may not seem as essential as it may appear to do the same thing, I still don't recommend
it because, well, if you make a mistake, chances are you won't like the outcome. Here are some
basic ways you can use this command:
```lua
> /cd dir\dir
```
```lua
> /cd files
```
```lua
> /cd ..
```
All of these examples are fairly simplistic, but I aim for this documentation/readme file to be
understandble by everyone regardless of your knowledge level and understanding of related topics.
The first example will CD you into a directory inside of a directory, which you might need to do
at some point. The second example will CD you into the files directory, which I've had to do plenty
of times. The third, but most definitely not least, will CD you into one directory above. In my opinion,
the third example is by far the most useful way to utilize this command because you may find yourself
needing to back up one or more directories, and this is the perfect way to do it. For those wondering,
in this context and scenario the term "CD" stands for "change directory". It's a simple yet effective
and efficient way to change the current working directory if you need to concentrate there, without
having to keep endlessly typing the name of the directory as you execute commands.

The ``/pd`` command:
```lua
> /pd
```
Above you see most likely the only context this command will ever be used in, because both it's
max and minimum required arguments are equal to numerical 1. Although, don't mistake this command
as not useful. This command prints the current working directory, which I find extremely helpful
so that you don't have to remember which directory you are currently in.

### Miscellaneous and debugging commands
Currently, only a few commands fit into one of these categories. However, they are still quite
useful and in my opinion it's worth knowing how to properly use them.

The ``/shutdown`` command:
```lua
> /shutdown
```
The first command is ``/shutdown``, which you really only need to use if for whatever reason
you can't or don't want to exit the command prompt by clicking on the standard windows
exit button, but this may have more functionality in the future.

The ``/help`` command:
```lua
> /help
```
This is the one command that every program __MUST__ have in my opinion, especially so that
people who are new to the environment can figure out how to use the commands properly
and also what is the correct syntax. This command will display the following message:
```
/shutdown - Shuts the system down.
/help - Prints this message.
/list-apps - Lists all files in the apps folder.
/list-from <arg2> - Lists all files in the <arg2> directory.
/list-files - Lists all files.
/create-file <arg2> - Creates a file named <arg2> if it does not already exist.
/edit-file <arg2> <arg3> - Edits the <arg2> file using the <arg3> operation.
/rename-file <arg2> <arg3> - Renames the file <arg2> to be called <arg3>.
(ONLY USED TO RENAME FILES, DO NOT TRY TO MOVE FILES OR DIRECTORIES USING THIS.)
/run-app <arg2> - Runs the lua file specified using <arg2>, file extension inclusive.
/run-file <arg2> - Runs the lua file specified in the files directory, file extension inclusive.
/delete-file <arg2> - Deletes the file <arg2>.
/read-file <arg2> - Reads the entire content of file <arg2> if it exists.
/create-dir <arg2> - Creates directory named <arg2>.
/delete-dir <arg2> - Deletes directory named <arg2>.
/byte-diagnostic - Shows the amount of bytes this file should have compared to how many it found.
/cd <arg2> - Changes current directory to <arg2>.
/pd - Prints the current directory.
/rm-file <arg2> <arg3> - Is meant for moving file <arg2> to <arg3>, but can also be used for basic renaming.
/reload - Executes the main file. This could be used if you are editing this file as
you are in the command prompt and don't want to exit and re-open the bat file.
BE CAREFUL WITH THIS COMMAND.
```
As long as your current PureCom version is up to date, this message should contain all the current
commands and also the correct syntax for how you should execute them.

The ``/reload`` command:
```lua
> /reload
```
This command only has this one usage, but it could have more in the future. This command
will reload the current "main.lua" file, but keep in mind this is a risky feature and
that it is recommended to shutdown command prompt and re-open it first.

The ``/byte-diagnostic`` command:
```lua
> /byte-diagnostic
```
This is the last of the commands in this category, but definitely not the least.
This command will compare the current amount of bytes in the "main.lua" file 
to the amount of bytes it should have, by displaying a report status with some
information as well as what percent of bytes the file has that it should have.
This is one of the reasons why you should not modify the ``main.lua`` file without
updating the ``file_bytes`` key's value in the global table ``system`` after.

### Contributors
  - Daark#8745
    - [x] Main Author & Owner
    
### Contact Information
  - Main Author & Owner
    - Daark#8745
  - Community Discord Server
    - [Invite link.](https://discord.gg/aEvNWXZVCz)

### Disclaimer
*It is my request that if you make a different version or distribution of my software then please
give basic credit to me as well as make all of the source openly viewable so anyone and everyone can
view and learn from it. You are welcome to modify it, just please be honest and maintain integrity
as I expect most people would. My biggest goal for this project is for it to be open-sourced to that
anyone and everyone from all ages and levels of knowledge & understanding from rookie all the way to
professional can be able to openly use this software. Please DM me on discord if you have any comments
or concerns, my contact information is listed above as well as the discord server invite link. If you
somehow made it this far into the README file, then I congratulate you. Thanks for reading!*
