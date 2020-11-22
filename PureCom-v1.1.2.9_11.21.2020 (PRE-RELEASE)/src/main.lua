-- Github Open Source PureCom
--[[
    Feel free to edit code but please credit me as the original creator.

	Daark#8745
]]
require "lfs"
system = {
    ["message"] = [[
~ PureCom-v1.1.2.9_11.21.2020 (PRE-RELEASE) ~
! WRITTEN IN PURE LUA !
~ RUN /help FOR INFORMATION & CMDS ~
]],
	["file_bytes"] = 9550,
}
function system.checkArgs()
	if max_args >= #__current and min_args <= #__current then
		return
	else
		print("Syntax Error: Max Args - " .. max_args .. " ~ Min Args - " .. min_args)
		xpcall(__main, __error)
	end
end
function system.byteDiagnostic()
	-- Open this file in reading mode.
	local file = io.open("main.lua", "r")
	-- Assign this file's data to variable data.
	local data = file:read("*a")
	-- Total byte count for conditional.
	local b = system.file_bytes
	-- Byte's counted so far.
	local i = 0
	-- Variable used later.
	local loop_counter = 0
	-- Loop to check and print percentage.
	for c in string.gmatch(data, ".") do
	    i = i + 1
	    loop_counter = loop_counter + 1
	    local number = 100 * i / (i + b-i)
	    local new = ""
	    local nc = 0
	end
	local last_percent = 100 * loop_counter / (loop_counter + b-loop_counter) .. "%"
	print("----REPORT~STATUS----")
	print("LAST-PERCENT: " .. last_percent)
	print("STATUS: COMPLETE")
	print("COUNTED-BYTES: " .. i)
	print("FILE-BYTES: " .. b)
	if (i >= b) then
		print("RESULT: NO DATA LOSS DETECTED.")
	else
		print("RESULT: POSSIBLE DATA LOSS DETECTED.")
	end
	print("----REPORT~STATUS----")
	-- Close this file to avoid errors when using the I/O library later.
	file:close()
	print(system.message)
end
local __help_message = [[
	
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
]]
local __lookup = {
    ["/shutdown"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        print("Shutting system down...")
        os.exit()
    end,
    ["/help"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        print(__help_message)
		xpcall(__main, __error)
    end,
    ["/list-apps"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        for file in lfs.dir("apps\\") do
            if file ~= "." and file ~= ".." then
                print(file)
            end
        end
		xpcall(__main, __error)
    end,
    ["/list-from"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

        for file in lfs.dir(__current[2]) do
            if file ~= "." and file ~= ".." then
                print(file)
            end
        end
        xpcall(__main, __error)
    end,
    ["/list-files"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

    	for file in lfs.dir("files\\") do
    		if file ~= "." and file ~= ".." then
    			print(file)
    		end
    	end
    	xpcall(__main, __error)
    end,
    ["/create-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

        local file = io.open(__current[2], "r")
        if file then
            print("FileCreation: File already exists.")
        else
            local file = io.open(__current[2], "w")
            if file == nil then
            	print("FileCreation: Error.")
            	file:close()
            	xpcall(__main, __error)
            else
            	file:close()
            	print("Success.")
            end
        end
        file:close()
		xpcall(__main, __error)
    end,
    ["/edit-file"] = function()

    	max_args = 3; min_args = 3; system.checkArgs();

    	local __options = "wa"
    	if string.match(__options, __current[3]) then
    	else
    		print("FileEditing: Invalid editing operator.")
    		xpcall(__main, __error)
    	end
        local file = io.open(__current[2], "r")
        local __file_data = file:read("*a")
        if file then
            local file = io.open(__current[2], __current[3])
            local __new_data = io.read()
            if file:write(__new_data) == true then
            	print("Success.")
            	file:close()
            else
            	print("FileEditing: Error.")
            	file:close()
            	xpcall(__main, __error)
            end
        else
            print("FileEditing: File does not exist.")
			xpcall(__main, __error)
        end
        file:close()
		xpcall(__main, __error)
    end,
    ["/rename-file"] = function()

    	max_args = 3; min_args = 3; system.checkArgs();

    	if os.execute("rename " .. __current[2] .. " " .. __current[3]) == 1 then
    		print("FileRenaming: Error.")
    		xpcall(__main, __error)
    	else
    		print("Success.")
    		xpcall(__main, __error)
    	end
        xpcall(__main, __error)
    end,
    ["/run-app"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

    	local file = io.open("apps\\"..__current[2], "r")
    	if file then
    	else
    		print("ExecutingFile: File does not exist.")
    		xpcall(__main, _error)
    	end
        dofile("apps\\" .. __current[2])
        xpcall(__main, __error)
    end,
    ["/run-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

    	local file = io.open(__current[2], "r")
    	if file then
    	else
    		print("ExecutingFile: File does not exist.")
    		xpcall(__main, _error)
    	end
    	dofile(__current[2])
    	xpcall(__main, __error)
    end,
    ["/delete-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

       	if os.remove(__current[2]) then
       		print("Success.")
       		xpcall(__main, __error)
       	else
       		print("FileDeletion: Error.")
       	end
        xpcall(__main, __error)
    end,
	["/read-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

		local file = io.open(__current[2], "r")
		if file then
			local __data = file:read("*a")
			print("File Data: " .. __data)
		else
			print("FileReading: File does not exist.")
		end
		file:close()
		xpcall(__main, __error)
	end,
    ["/reload"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        dofile("main.lua")
        xpcall(__main, __error)
    end,
    ["/create-dir"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

    	if lfs.mkdir(__current[2]) == true then
    		print("Success.")
    		xpcall(__main, __error)
    	else
    		print("DirectoryCreation: Directory already exists?")
    		xpcall(__main, __error)
    	end
    	xpcall(__main, __error)
    end,
    ["/byte-diagnostic"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

    	system.byteDiagnostic()
    	xpcall(__main, __error)
    end,
    ["/delete-dir"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

    	if lfs.rmdir(__current[2]) == true then
    		print("Success.")
    		xpcall(__main, __error)
    	else
    		print("DirectoryDeletion: Error.")
    		xpcall(__main, __error)
    	end
    	xpcall(__main, __error)
    end,
    ["/rm-file"] = function()

    	max_args = 3; min_args = 3; system.checkArgs();

    	if os.rename(__current[2], __current[3]) ~= nil then
    		print("Success.")
    		xpcall(__main, __error)
    	else
    		print("FileRenamingOrMoving: Error.")
    	end
    	xpcall(__main, __error)
    end,
    ["/cd"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

    	if lfs.chdir(__current[2]) then
    		print("Success.")
    		xpcall(__main, __error)
    	else
    		print("ChangingDirectory: Error.")
    	end
    	xpcall(__main, __error)
    end,
    ["/pd"] = function()
    	max_args = 1; min_args = 1; system.checkArgs();
    	print(lfs.currentdir())
    	xpcall(__main, __error)
    end,
}
function __error()
    xpcall(__main, __error)
    return 1
end
--Main Loop
function __main()
    io.write("> ")
    local __input = io.read()
    __current = {}
    for i in string.gmatch(__input, "%S+") do
        table.insert(__current, i)
    end
	local __lcounter = 0
    for k,v in pairs(__lookup) do
		if k == __current[1] then
			v()
			xpcall(__main, __error)
		else
			local __tcounter = 0
			for _,v in pairs(__lookup) do
				__tcounter = __tcounter + 1
			end
			__lcounter = __lcounter + 1
			if __lcounter == __tcounter then
				print("CommandExecution: Command not recognized.")
				xpcall(__main, __error)
			end
		end
	end
end
system.byteDiagnostic()
xpcall(__main, __error)
