local allowedGameIds = {482742811, 123456789, 987654321}

if table.find(allowedGameIds, game.PlaceId) then
    -- Get the Library
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
    if not Mercury then
        warn("Failed to load Mercury library!")
        return  -- Stop execution if Mercury fails to load
    end

    -- Create the GUI
    local GUI = Mercury:Create{
        Name = "Flint Hub",
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Dark,
        Link = "https://github.com/deeeity/mercury-lib"
    }

    -- Create a Tab
    local MainTab = GUI:Tab{
        Name = "Main",
        Icon = "rbxassetid://8569322835"  -- Replace with a suitable icon
    }

    -- Use Mercury Lib's Notification
    GUI:Notification{
        Title = "🎉 Supported Game! 🎉",
        Text = "",
        Duration = 5,
        Callback = function()
        end
    }

    -- Add a button to run the external script DIRECTLY
    MainTab:Button{
        Name = "Nameless Admin",
        Description = "Runs Nameless Admin by ltseverydayyou",
        Callback = function()
            local adminScriptURL = "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"
            local success, result = pcall(function()
                return loadstring(game:HttpGet(adminScriptURL))()
            end)
            if success then
                -- The script was loaded and executed successfully.
                if type(result) == "function" then
                    pcall(result) -- Execute the function, and handle errors during execution
                else
                    warn("Nameless Admin script loaded, but didn't return a function. Returned:", result)
                end
            else
                warn("Error loading or running admin script from", adminScriptURL, ":", result)
            end
        end
    }
else
    -- This game is not supported.
    warn("This game (" .. game.PlaceId .. ") is not in the allowed list.")
end
