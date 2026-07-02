module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		SQUAD.RefreshAnimation(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		SQUAD.RefreshAnimation(arg_3_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_4_0, arg_4_1)
		SQUAD.RefreshAnimation(arg_4_0, "ButtonDisabled")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		SQUAD.RefreshAnimation(arg_5_0, "ButtonOverDisabled")
	end)
end

local function var_0_1(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._squadTeamData = arg_6_2
	arg_6_0._isMyPlayerInSquad = arg_6_0._squadTeamData:IsPlayerInSquad()

	local var_6_0 = arg_6_2.memberList[1]

	arg_6_0.Member:SetupSquadMember(arg_6_1, var_6_0)
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.SetupSquadTeam = var_0_1
end

function WarzonePrivateMatchSquadSoloTeam(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 50 * _1080p)

	var_8_0.id = "WarzonePrivateMatchSquadSoloTeam"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "Background"

	var_8_4.TextGlow:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchSquadTeamMember", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Member"

	var_8_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 380, _1080p * -19, _1080p * 19)
	var_8_0:addElement(var_8_6)

	var_8_0.Member = var_8_6

	ACTIONS.AnimateSequenceByElement(var_8_0, {
		elementPath = "self.Member",
		sequenceName = "Solo",
		elementName = "Member"
	})
	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WarzonePrivateMatchSquadSoloTeam", WarzonePrivateMatchSquadSoloTeam)
LockTable(_M)
