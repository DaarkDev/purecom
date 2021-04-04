--[[
    Feel free to edit code but please credit me as the original creator.

	Daark#8745
]]
require "lfs"
local __red = "\27[31;1m"
local __midblue = "\27[94;1m"
local __green = "\27[32;1m"
local __lightgreen = "\27[92;1m"
local __darkgreen = "\27[32;1m"
local __cyan = "\27[96;1m"
local __darkcyan = "\27[36;1m" 
local __reset = "\27[0m"
local __white = "\27[37;m"
local __darkred = "\27[31;m"
local __yellow = "\27[93;1m"
local __uicolor = "\27[37;m"
__choices = {
	["red"] = __red,
	["midblue"] = __midblue,
	["green"] = __green,
	["lightgreen"] = __lightgreen,
	["darkgreen"] = __darkgreen,
	["cyan"] = __cyan,
	["darkcyan"] = __darkcyan,
	["white"] = __white,
	["darkred"] = __darkred,
	["reset"] = __reset
}
local __in = {
	["."] = "illegal",
	[".."] = "illegal",
	[".git"] = "illegal"
}
system = {
    ["message"] = [[
FileLink-CoDeX Snapshot 21w01a
]],
	["version"] = "CoDeX Snapshot 21w01a",
	["file_bytes"] = 11453,
	["full_userinput"] = function()
		local s = ""
		for k,v in pairs(__current) do
			s = s .. v .. " "
		end
		return s
	end
}
function __immediateDir()
	local dir = lfs.currentdir();
	local dirs = {};
	local c = 0;
	local s = "";
	for a in string.gmatch(dir, ".") do
		if a ~= "/" then
			s = s .. a;
			dirs[c] = s;
		else
			s = "";
			c = c + 1;
		end
	end
	for i = #dirs, 1, -1 do
		return dirs[i];
	end
end

local __file = io.open("uicolor.txt", "r");
local __filedata = __file:read("*a");
if __filedata == "" then
	print("NO USER-INPUT COLOR FOUND. SELECTING DEFAULT.");
	__uicolor = "\27[37;m";
else
	__uicolor = __choices[__filedata];
end
local __msgArray = {
	infoMsg = {
		["shutdown"] = function() print(__midblue .. "CALLING OS.EXIT" .. __reset) end,
		["user_input_color"] = function() print(__uicolor  .. "CURRENT USER INPUT COLOR" .. __reset) end,
	}
}
function system.checkArgs()
	if max_args >= #__current and min_args <= #__current then
		return
	else
		print(__red .. "Syntax Error: Max Args - " .. max_args .. " ~ Min Args - " .. min_args .. __reset)
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
	    local new = ""
	    local nc = 0
	end
	local last_percent = 100 * loop_counter / system.file_bytes  .. "%"
	print("LAST-PERCENT: " .. last_percent)
	print("STATUS: " .. __green .. "COMPLETE" .. __reset)
	print("COUNTED-BYTES: " .. i)
	print("FILE-BYTES: " .. b)
	if (i == b) then
		print("RESULT: " .. __green .. "NO DATA ISSUES DETECTED." .. __reset)
		os.execute("clear")
	else
		print("RESULT: " .. __red .. "POSSIBLE DATA ISSUES DETECTED." .. __reset)
	end
	-- Close this file to avoid errors when using the I/O library later.
	file:close()
	print(__yellow .. system.message .. __reset)
end
local __help_message = [[

Format: {number of args} commandName [args-purpose]...
{1} shutdown
{1} help
{1] list-apps
{2} list-from [arg2-dir]
{1} list-files
{2} create-file [arg2-dir/name]
{3} edit-file [arg2-dir/name] [arg3-operator]

]]
function __getAppDir()
	local file = io.open("appdir.txt", "r")
	if file then
		__appdir = file:read("*a")
		file:close()
	else
		local file = io.open("appdir.txt", "w")
		file:write("apps/")
		file:close()
		local file = io.open("appdir.txt", "r")
		__appdir = file:read("*a")
		file:close()
	end
end
__getAppDir()
function __getApps()
	for folder in lfs.dir(__appdir) do
		if not __in[folder] then
			for file in lfs.dir( __appdir .. folder) do
				if string.match(file, ".lua") then
					print(__appdir, folder, file)
					require(__appdir .. folder .. "/" .. file:sub(1, file:len() - 4))
				end
			end
		end
	end
end
__lookup = {
    ["exit"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        __msgArray.infoMsg.shutdown();
	os.execute('sleep 1');
        os.exit();
    end,
    ["help"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        print(__help_message)
	xpcall(__main, __error)
    end,
    ["list-apps"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

        for file in lfs.dir("apps\\") do
            if file ~= "." and file ~= ".." then
                print(file)
            end
        end
	xpcall(__main, __error)
    end,
    ["list-from"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

        for file in lfs.dir(__current[2]) do
            if file ~= "." and file ~= ".." then
                print(file)
            end
        end
        xpcall(__main, __error)
    end,
    ["list-files"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

    	for file in lfs.dir("files/") do
    		if file ~= "." and file ~= ".." then
    			print(file)
    		end
    	end
    	xpcall(__main, __error)
    end,
    ["create-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

        local file = io.open(__current[2], "r")
        if file then
            print(__red .. "commandError:" .. __reset, "File already exists.")
        else
            local file = io.open(__current[2], "w")
            file:close()
        end
	xpcall(__main, __error)
    end,
    ["edit-file"] = function()

    	max_args = 3; min_args = 3; system.checkArgs();

    	local __options = "wa"
    	if string.match(__options, __current[3]) then
    	else
    		print(__red .. "commandError:" .. __reset, "Invalid operation operator.")
    		xpcall(__main, __error)
    	end
        local file = io.open(__current[2], __current[3])
        local __new_data = io.read()
        file:write(__new_data)
        file:close()
	xpcall(__main, __error)
    end,
    ["vim-file"] = function()

	    max_args = 2; min_args = 2; system.checkArgs();
            
	    os.execute("vim " .. __current[2])
            xpcall(__main, __error)
    end,
    ["mv"] = function()

    	max_args = 3; min_args = 3; system.checkArgs();

    	os.execute("mv " .. __current[2] .. " " .. __current[3])
        xpcall(__main, __error)
    end,
    ["run-app"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();
        os.execute('lua5.1 ' .. ' apps/' .. __current[2])
        xpcall(__main, __error)
    end,
    ["run-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();
    	os.execute('lua5.1 ' ..  __current[2])
    	xpcall(__main, __error)
    end,
    ["delete-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

       	os.execute("rm " .. __current[2])
        xpcall(__main, __error)
    end,
    ["read-file"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

	local file = io.open(__current[2], "r")
	if file then
		local __data = file:read("*a")
		print(__yellow .. __data .. __reset)
		file:close()
	else
		print(__red .. "commandError:" .. __reset, "File not found.")
	end
	xpcall(__main, __error)
    end,
    ["reload"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();
        
        os.execute('lua5.1 main.lua')
	os.exit()
        xpcall(__main, __error)
    end,
    ["create-dir"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();
	
    	os.execute("mkdir " .. __current[2])
    	xpcall(__main, __error)
    end,
    ["byte-diagnostic"] = function()

    	max_args = 1; min_args = 1; system.checkArgs();

    	system.byteDiagnostic()
    	xpcall(__main, __error)
    end,
    ["delete-dir"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();

    	os.execute("rm -r " .. __current[2])
    	xpcall(__main, __error)
    end,
    ["cd"] = function()

    	max_args = 2; min_args = 2; system.checkArgs();
	
    	print(lfs.chdir(__current[2]))
    	xpcall(__main, __error)
    end,
    ["pd"] = function()
    	max_args = 1; min_args = 1; system.checkArgs();

    	print(lfs.currentdir())
    	xpcall(__main, __error)	
    end,
    ["cf"] = function()
	max_args = 3; min_args = 3; system.checkArgs();

	os.execute("cp " .. __current[2] .. " " .. __current[3]);
	xpcall(__main, __error)
    end,
    ["user-input-color"] = function()
	max_args = 2; min_args = 1; system.checkArgs();

	if __current[2] == nil then
		__msgArray.infoMsg.user_input_color();
		xpcall(__main, __error);
	else
		local __file = io.open("uicolor.txt", "w");
		__file:write(__current[2]);
		__file:close();
		__uicolor = __choices[__current[2]];
		print(__choices[__current[2]] .. "NEW USER-INPUT COLOR");
		xpcall(__main, __error);
	end
    end,
    ["rm-f"] = function()
	max_args = 2; min_args = 2; system.checkArgs();

	os.execute("rm -rf " .. __current[2])
	xpcall(__main, __error);
    end,
    ["link"] = function()
	max_args = 5; min_args = 2; system.checkArgs();
	
	local __twolook = {
		["make"] = function()
			print(__yellow, os.execute('git clone --depth 1 https://github.com/DaarkDev/link'))
			if __current[3] == "purge" then
				lfs.chdir("link");
				os.execute("rm -rf .git")
				lfs.chdir("..");
			end
			xpcall(__main, __error);
		end,
		["update"] = function()
			if __current[3] == nil then
				print(__yellow, os.execute("git pull --depth 1"))
				xpcall(__main, __error);
			else
				local __prevdir = lfs.currentdir()
				lfs.chdir(__current[3])
				print(__yellow, os.execute("git pull --depth 1"))
				lfs.chdir(__prevdir)
				xpcall(__main, __error)
			end
			xpcall(__main, __error);
		end,
		["get"] = function()
			print(__midblue .. "Finding packages" .. __reset)
			local file = io.open("link/" .. __current[3], "r")
			if file then
				print(__yellow .. "Package found" .. __reset)
				local data = file:read("*a")
				local lines = {}
				for line in io.lines("link/" .. __current[3]) do
					table.insert(lines, line)
				end
				print(__midblue .. "Fetching " .. lines[1])
				print(__midblue .. "Version " .. lines[2])
				print(os.execute("git clone --depth 1 " .. lines[3] .. " " .. __current[4] .. "/" .. lines[1]))
				local __prevdir = lfs.currentdir();
				if __current[5] == "purge" then
					lfs.chdir(__current[4] .. "/" .. lines[1]);
					os.execute("rm -rf .git");
					lfs.chdir(__prevdir);
				end
				file:close()
				xpcall(__main, __error)
			else
				print(__red .. "Package not found!" .. __reset)
				xpcall(__main, __error)
			end
			xpcall(__main, __error);
		end
	}
		if __twolook[__current[2]] then
			__twolook[__current[2]]();
		else
			print(__red .. "Link: Sub-command not found!" .. __reset)
			xpcall(__main, __error)
		end
		xpcall(__main, __error);
	end
}
function __error(e)
   print(__red .. "commandError:" .. __reset, e)
   xpcall(__main, __error)
end
xpcall(__getApps, __error)
--Main Loop
function __main()
    local __curdir = lfs.currentdir()
    io.write(__red .. "beta" .. __white .. "-" .. __midblue .. system.version .. __darkcyan .. "@" .. __lightgreen .. __immediateDir() .. __darkcyan .. " > " .. __uicolor)
    local __input = io.read()
    __current = {}
    for i in string.gmatch(__input, "%S+") do
        table.insert(__current, i)
    end
	if __lookup[__current[1]] then

		__lookup[__current[1]]()
		xpcall(__main, __error)
	else
		print(__red .. "commandExecution:" .. __reset .. " Command not recognized.")
		xpcall(__main, __error)
	end
end
system.byteDiagnostic()
xpcall(__main, __error)
