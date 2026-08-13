local env = getgenv()
local PlaceId = game.PlaceId
local GameId = game.GameId

local BASE_URL = "https://raw.githubusercontent.com/XLDBee/SpectralLoader/main/"

env.SPECTRAL_LOADER_BASE_URL = BASE_URL

warn(("Spectral Loader | PlaceId=%d GameId=%d"):format(PlaceId, GameId))

local function loadRemote(path)
    local ok, source = pcall(game.HttpGet, game, BASE_URL .. path)
    if not ok then
        warn("Spectral Loader: HttpGet failed for " .. path .. " -> " .. tostring(source))
        return nil
    end

    local chunk, compileError = loadstring(source, "@" .. path)
    if not chunk then
        warn("Spectral Loader: compile failed for " .. path .. " -> " .. tostring(compileError))
        return nil
    end

    return chunk
end

local function run(path)
    local chunk = loadRemote(path)
    if not chunk then
        return
    end

    local ok, runtimeError = pcall(chunk)
    if not ok then
        warn("Spectral Loader: runtime failed for " .. path .. " -> " .. tostring(runtimeError))
    end
end

if GameId == 4712126054
    or PlaceId == 13559635034
    or PlaceId == 14582748896 then
    run("CombatInitation.lua")
elseif GameId == 1709917610
    or PlaceId == 4972273297 then
    run("Regretevator.lua")
else
    warn("Spectral Loader: no script for this game (PlaceId=" .. tostring(PlaceId) .. ")")
end
