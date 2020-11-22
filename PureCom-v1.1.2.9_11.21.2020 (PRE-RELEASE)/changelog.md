What's new in __PureCom-v1.1.2.9_11.21.2020?__
****

4 New Commands:
> /cd <arg2> - Changes current directory to <arg2>.
>
> /pd - Prints the current directory.
>
> /run-file <arg2> - Runs the lua file specified in the files directory, file extension inclusive.
>
> /rm-file <arg2> <arg3> - Is meant for moving file <arg2> to <arg3>, but can also be used for basic renaming.

Behavior Changes:
> The following commands now assume the working directory is the current directory
> 
> instead of assuming it is "files\": 
>  
> - /create-file
> - /edit-file
> - /rename-file
> - /run-file
> - /delete-file
> - /read-file
> - /create-dir
> - /delete-dir
> - /rm-file

Improved Error Handling:
> The following commands now have improved error handling to display the correct
> 
> message depending on what happened when it was executed:
>
> - /delete-file (*Major, used to have little to no truly correct and displayed message.*) 
> - /create-file (*Minor, now includes small conditional.*)
> - /edit-file (*Minor, now includes small conditional.*)
> - /run-app (*Minor, now includes conditional to check if file exists.*)
> - /run-file (*Minor, now includes conditional to check if file exists.*)

