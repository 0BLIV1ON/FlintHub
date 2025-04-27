local allowedGameIds = {482742811, 123456789, 987654321}

if table.find(allowedGameIds, game.PlaceId) then
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
    if not Mercury then
        warn("Failed to load Mercury library!")
        return
    end

    local GUI = Mercury:Create{
        Name = "Flint Hub",
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Dark,
        Link = "https://github.com/deeeity/mercury-lib"
    }

    local MainTab = GUI:Tab{
        Name = "Main",
        Icon = "rbxassetid://8569322835"
    }

    GUI:Notification{
        Title = "🎉 Supported Game! 🎉",
        Text = "",
        Duration = 5,
        Callback = function()
        end
    }

    MainTab:Button{
        Name = "Nameless Admin"
        Callback = function()
            local adminScriptURL = "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"
            local success, result = pcall(function()
                return loadstring(game:HttpGet(adminScriptURL))()
            end)
            if success then
                if type(result) == "function" then
                    pcall(result)
                else
                    warn("Nameless Admin script loaded, but didn't return a function. Returned:", result)
                end
            else
                warn("Error loading or running admin script from", adminScriptURL, ":", result)
            end
        end
    }

else
    warn("This game (" .. game.PlaceId .. ") is not in the allowed list.")
end
