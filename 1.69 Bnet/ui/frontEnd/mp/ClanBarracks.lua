module(..., package.seeall)

local var_0_0 = {
	INFO = "ClanInfoDetails",
	DASHBOARD = "ClanDashboardDetails",
	MEMBERS = "ClanMembersDetails"
}
local var_0_1 = {
	INFO = "ClanInfoButton",
	DASHBOARD = "ClanDashboardButton",
	MEMBERS = "ClanMembersButton"
}
local var_0_2 = {
	[var_0_1.DASHBOARD] = {
		canOpenMenu = false,
		menu = "ClanDashboardMenu",
		detailsWidget = var_0_0.DASHBOARD
	},
	[var_0_1.MEMBERS] = {
		canOpenMenu = true,
		menu = "ClanMembersScreen",
		detailsWidget = var_0_0.MEMBERS
	},
	[var_0_1.INFO] = {
		canOpenMenu = true,
		menu = "ClanActionsMenu",
		detailsWidget = var_0_0.INFO
	}
}

local function var_0_3(arg_1_0)
	if arg_1_0.DetailsWidget and arg_1_0.DetailsWidget.RefreshClanData then
		arg_1_0.DetailsWidget:RefreshClanData(arg_1_0._clanData)
	end
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {
		clanId = arg_2_0._clanID
	}

	LUI.FlowManager.RequestAddMenu(var_0_2[arg_2_2].menu, true, arg_2_1, false, var_2_0)
end

local function var_0_5(arg_3_0)
	arg_3_0.DetailsWidget:closeTree()

	arg_3_0.DetailsWidget = nil
end

local function var_0_6(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {
		controllerIndex = arg_4_1,
		clanID = arg_4_0._clanID
	}

	if arg_4_2 == var_0_0.INFO then
		var_4_0.isProgressionWidgetEnabled = true
	end

	return var_4_0
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0
	local var_5_1 = var_0_2[arg_5_2.id].detailsWidget
	local var_5_2 = MenuBuilder.BuildRegisteredType(var_5_1, var_0_6(arg_5_0, arg_5_1, var_5_1))

	var_5_2.id = "DetailsWidget"

	var_5_2:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_5_0:addElement(var_5_2)

	arg_5_0.DetailsWidget = var_5_2

	var_0_3(arg_5_0)
end

local function var_0_8(arg_6_0, arg_6_1)
	arg_6_0._clanData = CLANS.GetClanData(arg_6_1, arg_6_0._clanID, {
		labels = arg_6_0._labels
	})

	var_0_3(arg_6_0)
end

local function var_0_9(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_2.controller or arg_7_0._controllerIndex

	if arg_7_0.DetailsWidget then
		var_0_5(arg_7_0)
	end

	var_0_7(arg_7_0, var_7_0, arg_7_1)
end

local function var_0_10(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_2.controller or arg_8_0._controllerIndex

	if var_0_2[arg_8_1.id].canOpenMenu then
		var_0_4(arg_8_0, var_8_0, arg_8_1.id)
	end
end

local function var_0_11(arg_9_0)
	local var_9_0 = arg_9_0.ClanBarracksMenuButtons.Buttons

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		iter_9_1:addEventHandler("button_over", function(arg_10_0, arg_10_1)
			var_0_9(arg_9_0, arg_10_0, arg_10_1)
		end)
		iter_9_1:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			var_0_10(arg_9_0, arg_11_0, arg_11_1)
		end)
	end
end

local function var_0_12(arg_12_0)
	arg_12_0:addEventHandler("refresh_clan_data", function(arg_13_0, arg_13_1)
		var_0_8(arg_12_0, arg_12_0._controllerIndex)
	end)
	arg_12_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_SEARCH_TAGS, function(arg_14_0, arg_14_1)
		arg_12_0._labels = CLANS.GetLabelsFromEvent(arg_14_1)

		if arg_12_0._clanData then
			arg_12_0._clanData.labels = arg_12_0._labels
		end
	end)
end

local function var_0_13(arg_15_0)
	local var_15_0 = LUI.UIBindButton.new()

	var_15_0.id = "selfBindButton"

	arg_15_0:addElement(var_15_0)

	arg_15_0._bindButton = var_15_0

	arg_15_0._helperBar:PushButtonPrompt({
		side = "left",
		button_ref = "button_left_stick",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLAN_ACTIONS")
	})
	arg_15_0._bindButton:addEventHandler("button_left_stick", function(arg_16_0, arg_16_1)
		LUI.FlowManager.RequestAddMenu("ClanActionsMenu", true, arg_15_0._controllerIndex, false, {
			controllerIndex = arg_15_0._controllerIndex,
			clanId = arg_15_0._clanID
		}, false)
	end)
end

local function var_0_14(arg_17_0)
	arg_17_0.ClanBarracksMenuButtons[var_0_1.DASHBOARD]:processEvent({
		name = "gain_focus"
	})
end

local function var_0_15(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0._controllerIndex = arg_18_1
	arg_18_0._clanID = Clans2.CFGBBBHFHB(arg_18_1)
	arg_18_0._helperBar = arg_18_2.helperBar or nil

	var_0_11(arg_18_0)
	var_0_12(arg_18_0)
	var_0_13(arg_18_0)
	var_0_14(arg_18_0)
	Clans2.BJFEDEICAC(arg_18_1, arg_18_0._clanID)
end

function ClanBarracks(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_19_0.id = "ClanBarracks"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("ClanBarracksMenuButtons", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "ClanBarracksMenuButtons"

	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 272, _1080p * 922)
	var_19_0:addElement(var_19_4)

	var_19_0.ClanBarracksMenuButtons = var_19_4

	var_0_15(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("ClanBarracks", ClanBarracks)
LockTable(_M)
