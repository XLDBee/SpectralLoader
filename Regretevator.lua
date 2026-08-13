local url = "https://api.jnkie.com/api/v1/luascripts/public/f3a2f63e6bdc537d360ff15470835d744a1e57f11f8f49a5f66be20f04a6e51b/download"
local ok, source = pcall(game.HttpGet, game, url)

if not ok then
    warn("Spectral Regretevator: HttpGet failed -> " .. tostring(source))
    return
end

local chunk, compileError = loadstring(source, "@Jnkie-Regretevator")
if not chunk then
    warn("Spectral Regretevator: compile failed -> " .. tostring(compileError))
    return
end

local ran, runtimeError = pcall(chunk)
if not ran then
    warn("Spectral Regretevator: runtime failed -> " .. tostring(runtimeError))
end
