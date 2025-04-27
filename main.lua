local allowedGameIds = {482742811, 123456789, 987654321}

if table.find(allowedGameIds, game.PlaceId) then

    -- Get the Library
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

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
        Icon = "rbxassetid://8569322835" -- Replace with a suitable icon
    }

    -- Use Mercury Lib's Notification
    GUI:Notification{
        Title = "🎉 Supported Game! 🎉",
        Text = "",
        Duration = 5,
        Callback = function()
        end
    }

    -- Add a button to run the external script
    MainTab:Button{
        Name = "Nameless Admin",
        Description = "Runs Nameless Admin by ltseverydayyou",
        Callback = function()
            local success, script = pcall(game:HttpGet, "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua")
            if success then
                local loadSuccess, func = pcall(loadstring, script)
                if loadSuccess and func then
                    func() -- Execute the loaded script
                else
                    warn("Error loading admin script:", loadSuccess)
                end
            else
                warn("Error getting admin script:", success)
            end
        end
    }

else
    -- This game is not supported.
    warn("This game (" .. game.PlaceId .. ") is not in the allowed list.")
end
