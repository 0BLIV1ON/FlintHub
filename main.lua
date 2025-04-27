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

    -- Function to load and run an external script, with error handling
    local function loadAndRunScript(scriptURL, scriptName)
        local getSuccess, scriptContent = pcall(game.HttpGet, scriptURL)
        if getSuccess then
            local loadSuccess, scriptFunc = pcall(loadstring, scriptContent)
            if loadSuccess then
                local runSuccess, runResult = pcall(scriptFunc)
                if runSuccess then
                    -- success
                else
                    warn("Error running " .. scriptName .. " script:", runResult)
                end
            else
                warn("Error loading " .. scriptName .. " script:", scriptFunc)
            end
        else
            warn("Error getting " .. scriptName .. " script from", scriptURL, ":", scriptContent)
        end
    end

    -- Add a button to run the external script DIRECTLY
    MainTab:Button{
        Name = "Nameless Admin",
        Description = "Runs Nameless Admin by ltseverydayyou",
        Callback = function()
            local adminScriptURL = "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"
            loadAndRunScript(adminScriptURL, "Nameless Admin")
        end
    }

    -- Add another button to run Infinite Yield
    MainTab:Button{
        Name = "Infinite Yield",
        Description = "Runs Infinite Yield by EdgeIY",
        Callback = function()
            local infiniteYieldURL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
            loadAndRunScript(infiniteYieldURL, "Infinite Yield")
        end
    }

    -- Add a button to run the ESP script.
    MainTab:Button{
        Name = "ESP",
        Description = "Runs ESP script by 0BLIV1ON",
        Callback = function()
            local espScriptURL = "https://raw.githubusercontent.com/0BLIV1ON/esp/refs/heads/main/main.lua"
            loadAndRunScript(espScriptURL, "ESP")
        end
    }

    -- Add a button to reload the entire GUI and scripts
    MainTab:Button{
        Name = "Reload",
        Description = "Reloads the Flint Hub and all scripts",
        Callback = function()
            -- Destroy the current GUI
            GUI:Destroy()

            -- Reload Mercury Library
            Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
            if not Mercury then
                warn("Failed to reload Mercury library!")
                return  -- Stop if Mercury fails to load
            end

            -- Re-create the GUI
            GUI = Mercury:Create{
                Name = "Flint Hub",
                Size = UDim2.fromOffset(600, 400),
                Theme = Mercury.Themes.Dark,
                Link = "https://github.com/deeeity/mercury-lib"
            }

            -- Re-create the Tab
            MainTab = GUI:Tab{
                Name = "Main",
                Icon = "rbxassetid://8569322835"
            }

            --Re-create Notification
             GUI:Notification{
                Title = "🎉 Flint Hub Reloaded! 🎉",
                Text = "",
                Duration = 5,
                Callback = function()
                end
            }

            -- Re-add buttons
            MainTab:Button{
                Name = "Nameless Admin",
                Description = "Runs Nameless Admin by ltseverydayyou",
                Callback = function()
                    local adminScriptURL = "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"
                    loadAndRunScript(adminScriptURL, "Nameless Admin")
                end
            }

            MainTab:Button{
                Name = "Infinite Yield",
                Description = "Runs Infinite Yield by EdgeIY",
                Callback = function()
                    local infiniteYieldURL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
                    loadAndRunScript(infiniteYieldURL, "Infinite Yield")
                end
            }

            MainTab:Button{
                Name = "ESP",
                Description = "Runs ESP script by 0BLIV1ON",
                Callback = function()
                    local espScriptURL = "https://raw.githubusercontent.com/0BLIV1ON/esp/refs/heads/main/main.lua"
                    loadAndRunScript(espScriptURL, "ESP")
                end
            }
        end
    }
else
    -- This game is not supported.
    warn("This game (" .. game.PlaceId .. ") is not in the allowed list.")
end
