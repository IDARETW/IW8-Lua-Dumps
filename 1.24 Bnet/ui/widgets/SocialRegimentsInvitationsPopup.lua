module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = Clans.EBDFICHCEJ(arg_1_0._controllerIndex)

	arg_1_0.PopupLayout:SetupPlayerGrid(var_1_0)
end

local var_0_1

local function var_0_2(arg_2_0)
	arg_2_0:Wait(1000, true).onComplete = function()
		return var_0_2(arg_2_0)
	end

	var_0_0(arg_2_0)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._controllerIndex = arg_4_1

	arg_4_0.PopupLayout:SetMenuTitle(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATIONS"))
	arg_4_0.PopupLayout:SetMenuLocation(FRIENDS.TabIDs.REGIMENTS, FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS)
	arg_4_0.PopupLayout.NoPlayersLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/ NO_INVITES_RECEIVED"))
	var_0_2(arg_4_0)
	arg_4_0:addEventHandler("restore_focus", var_0_2)

	local var_4_0 = Clans.CAIICFABDD(arg_4_1)

	arg_4_0.CheckboxButton:SetValue(var_4_0)

	local var_4_1 = LUI.UIBindButton.new()

	var_4_1.id = "bindButton"

	arg_4_0:addElement(var_4_1)

	arg_4_0.bindButton = var_4_1

	arg_4_0.bindButton:addEventHandler("button_alt1", function(arg_5_0, arg_5_1)
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
		Clans.JIFHCFFD(arg_4_1, arg_4_0.CheckboxButton:ToggleValue())
		Engine.EBIDFIDHIE("updategamerprofile")
	end)
	arg_4_0.CheckboxButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		Clans.JIFHCFFD(arg_4_1, arg_4_0.CheckboxButton:ToggleValue())
		Engine.EBIDFIDHIE("updategamerprofile")
	end)

	local function var_4_2(arg_7_0, arg_7_1)
		if not LUI.IsLastInputKeyboardMouse(arg_7_1.controllerIndex) then
			ACTIONS.LoseFocus(arg_7_0, "CheckboxButton", arg_7_1.controllerIndex)
			ACTIONS.GainFocus(arg_7_0, "PopupLayout", arg_7_1.controllerIndex)
		end
	end

	arg_4_0:registerEventHandler("update_input_type", var_4_2, {
		controllerIndex = arg_4_1
	})
end

function SocialRegimentsInvitationsPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_8_0.id = "SocialRegimentsInvitationsPopup"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("SocialPopupLayout", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "PopupLayout"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 825, 0, _1080p * 1080)
	var_8_0:addElement(var_8_4)

	var_8_0.PopupLayout = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("CheckboxButton", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "CheckboxButton"

	var_8_6.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REGIMENT_INVITES"), 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 655, _1080p * 145, _1080p * 178)
	var_8_0:addElement(var_8_6)

	var_8_0.CheckboxButton = var_8_6

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SocialRegimentsInvitationsPopup", SocialRegimentsInvitationsPopup)
LockTable(_M)
