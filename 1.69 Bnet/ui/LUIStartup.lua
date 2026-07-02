jit.off()

local function var_0_0(arg_1_0)
	Engine.BHFFIBEFFH(arg_1_0, "requires")
	require(arg_1_0)
	Engine.DCHDDCJCEG(arg_1_0, "requires")
end

DebugPrint("Running LUIStartup.lua")
var_0_0("ui.requires.AlwaysLoaded")

if Engine.DDJFBBJAIG() then
	var_0_0("ui.requires.FrontEnd")
	var_0_0("ui.requires.frontEnd.CP")
	var_0_0("ui.requires.frontEnd.SP")
	var_0_0("ui.requires.frontEnd.MP")
else
	var_0_0("ui.requires.InGame")

	if Engine.EAIICIFIFA() then
		var_0_0("ui.requires.ingame.CP")

		if Engine.EACHICHBCD() then
			Engine.DIDFHBFDFG(PauseReason.KEY_INPUT)
		end
	elseif not Engine.EAAHGICFBD() then
		var_0_0("ui.requires.ingame.SP")
	elseif not Engine.EAIICIFIFA() and Engine.EAAHGICFBD() then
		var_0_0("ui.requires.ingame.MP")
	end
end

if Dvar.IBEGCHEFE("NKRTLQQTOL") then
	var_0_0("ui.requires.Development")
end

local var_0_1 = getmetatable(_G)

if not var_0_1 then
	var_0_1 = {}

	setmetatable(_G, var_0_1)
end

function var_0_1.__newindex(arg_2_0, arg_2_1, arg_2_2)
	error("LUI Error: Tried to create global variable " .. arg_2_1, 2)
end
