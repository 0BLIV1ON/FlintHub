local allowedGameIds = {482742811, 123456789, 987654321}

local GITHUB_RAW_URL = "https://raw.githubusercontent.com/0BLIV1ON/FlintHub/refs/heads/main/main.lua"

local function loadLatestScript()
    local success, latestScript = pcall(game.HttpGet, GITHUB_RAW_URL)
    if success then
        local loadSuccess, func = pcall(loadstring, latestScript)
        if loadSuccess and func then
            func()
        else
            warn("Error loading latest script: ", loadstring)
        end
    else
        warn("Error fetching latest script: ", latestScript)
    end
end

if table.find(allowedGameIds, game.PlaceId) then
    loadLatestScript()
else
    warn("This game (" .. game.PlaceId .. ") is not in the allowed list.")
end
