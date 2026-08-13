local url = "https://api.jnkie.com/api/v1/luascripts/public/c24fa2c8c4ca2f9a978211b6149dbd9d9f8592cee05379c6e8744de377358dcd/download"
local ok, source = pcall(game.HttpGet, game, url)

if not ok then
    warn("Spectral Combat: HttpGet failed -> " .. tostring(source))
    return
end

local chunk, compileError = loadstring(source, "@Jnkie-CombatInitation")
if not chunk then
    warn("Spectral Combat: compile failed -> " .. tostring(compileError))
    return
end

local ran, runtimeError = pcall(chunk)
if not ran then
    warn("Spectral Combat: runtime failed -> " .. tostring(runtimeError))
end
