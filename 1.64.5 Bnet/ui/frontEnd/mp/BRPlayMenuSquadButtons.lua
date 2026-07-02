module(..., package.seeall)

local var_0_0 = {
	LOOK_FOR_PARTY = 40,
	FILL_TOGGLE = 30
}

local function var_0_1(arg_1_0, arg_1_1)
	if not arg_1_0.FillToggleButton then
		arg_1_0.FillToggleButton = Lobby.CreateFillToggleButton(arg_1_0, arg_1_1)

		arg_1_0.FillToggleButton:setPriority(var_0_0.FILL_TOGGLE)
		arg_1_0:addElement(arg_1_0.FillToggleButton)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	if not arg_2_0.LookForPartyButton then
		arg_2_0.LookForPartyButton = Lobby.CreateLookForPartyButton(arg_2_0, arg_2_1)

		arg_2_0.LookForPartyButton:setPriority(var_0_0.LOOK_FOR_PARTY)
		arg_2_0:addElement(arg_2_0.LookForPartyButton)
		arg_2_0.LookForPartyButton:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
			LUI.FlowManager.RequestAddMenu("BRLookForParty", false, arg_3_1.controller, false, {
				openFromMenu = true
			})
		end)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = Lobby.IsSplitScreenEnabled()

	if arg_4_0.LookForPartyButton and arg_4_0.UpdateLockStatus then
		arg_4_0.LookForPartyButton:SetButtonDisabled(var_4_0)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local function var_5_0()
		local var_6_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		if arg_5_0.FillToggleButton then
			arg_5_0.FillToggleButton:SetButtonDisabled(var_6_0)
		end
	end

	local var_5_1 = DataSources.frontEnd.lobby.inSplitScreen
	local var_5_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_5_3 = DataSources.frontEnd.lobby.memberCount

	arg_5_0:SubscribeToModel(var_5_2:GetModel(arg_5_1), var_5_0, true)
	arg_5_0:SubscribeToModel(var_5_3:GetModel(arg_5_1), var_5_0, true)
	arg_5_0:SubscribeToModel(var_5_1:GetModel(arg_5_1), var_5_0)
	arg_5_0:addEventHandler("update_publisher_variables", var_5_0)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.AddFillToggleButton = var_0_1
	arg_7_0.AddLookForPartyButton = var_0_2
	arg_7_0.UpdateSubscriptions = var_0_4
	arg_7_0.UpdateLockStatus = var_0_3
end

function BRPlayMenuSquadButtons(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalList.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_8_0.id = "BRPlayMenuSquadButtons"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:SetSpacing(6 * _1080p)
	var_0_5(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("BRPlayMenuSquadButtons", BRPlayMenuSquadButtons)
LockTable(_M)
