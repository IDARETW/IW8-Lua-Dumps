function ModuleInaccessible(arg_1_0)
	assert(not _G[arg_1_0])

	_G[arg_1_0] = setmetatable({}, {
		__index = function(arg_2_0, arg_2_1)
			return function()
				assert(false, "Functions from the " .. arg_1_0 .. " module are not allowed to be called from this scope.")
			end
		end
	})
end

if Engine then
	Engine.BFIHBCBIHJ = Engine.BFIHBCBIHJ or function()
		return false
	end
end

if Game then
	Game.BGFJAIBGDF = Game.BGFJAIBGDF or function()
		return Teams.allies
	end
else
	ModuleInaccessible("Game")
end

if Friends then
	-- block empty
else
	ModuleInaccessible("Friends")
end

if Leaderboards then
	-- block empty
else
	ModuleInaccessible("Leaderboards")
end

if Lobby then
	-- block empty
else
	ModuleInaccessible("Lobby")
end

if LobbyMember then
	-- block empty
else
	ModuleInaccessible("LobbyMember")
end

if Playlist then
	-- block empty
else
	ModuleInaccessible("Playlist")
end

MLG = MLG or {}
Customization = Customization or {}
MatchRules = MatchRules or {}
