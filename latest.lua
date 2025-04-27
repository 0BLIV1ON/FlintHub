local allowedGameIds = {482742811, 123456789, 987654321}

if table.find(allowedGameIds, game.PlaceId) then
    -- This game is supported, so the following scripts will run.

    -- Get the Library (using loadstring as per the README)
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

    -- Add a button
    MainTab:Button{
        Name = "Click Me",
        Description = "Example Button",
        Callback = function()
            -- You can add more complex functionality here
        end
    }

    -- Add a Textbox
    MainTab:Textbox{
        Name = "Input",
        Callback = function(text)
        end
    }

    -- Add a Slider
    MainTab:Slider{
        Name = "Volume",
        Default = 50,
        Min = 0,
        Max = 100,
        Callback = function(value)
        end
    }

else
    -- This game is not supported.
    warn("This game (" .. game.PlaceId .. ") is not in the allowed list.")
end
