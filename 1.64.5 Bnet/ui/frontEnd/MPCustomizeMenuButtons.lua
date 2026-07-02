module(..., package.seeall)

local function var_0_0(arg_1_0)
	return Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_1_0) and Engine.CJJAFGIFAC(arg_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = not var_0_0(arg_2_1)

	arg_2_0.ClanTagButton:SetButtonDisabled(var_2_0)
	arg_2_0.EmblemsButton:SetButtonDisabled(var_2_0)
	arg_2_0.CallingCardsButton:SetButtonDisabled(var_2_0)

	local var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_OFFLINE")

	if Engine.DBAEJAHFGJ(arg_2_1) then
		var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_FOR_GUEST")
	end

	arg_2_0.ClanTagButton.DisabledText:setText(var_2_0 and var_2_1 or "")
	arg_2_0.EmblemsButton.DisabledText:setText(var_2_0 and var_2_1 or "")
	arg_2_0.CallingCardsButton.DisabledText:setText(var_2_0 and var_2_1 or "")

	if var_2_0 then
		local var_2_2 = arg_2_0:GetIndexForElement(arg_2_0.RadialButton)

		arg_2_0:SetDefaultFocus(var_2_2)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.ClanTagButton.Description)
	assert(arg_3_0.CallingCardsButton.Description)
	assert(arg_3_0.EmblemsButton.Description)
	assert(arg_3_0.RadialButton.Description)
	arg_3_0.ClanTagButton:AddTooltipData(arg_3_1, {
		tooltipDescription = arg_3_0.ClanTagButton.Description:getText()
	})
	arg_3_0.CallingCardsButton:AddTooltipData(arg_3_1, {
		tooltipDescription = arg_3_0.CallingCardsButton.Description:getText()
	})
	arg_3_0.EmblemsButton:AddTooltipData(arg_3_1, {
		tooltipDescription = arg_3_0.EmblemsButton.Description:getText()
	})
	arg_3_0.RadialButton:AddTooltipData(arg_3_1, {
		tooltipDescription = arg_3_0.RadialButton.Description:getText()
	})
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_0.ClanTagButton)
	assert(arg_4_0.CallingCardsButton)
	assert(arg_4_0.EmblemsButton)
	assert(arg_4_0.RadialButton)
	var_0_1(arg_4_0, arg_4_1)
	arg_4_0.ClanTagButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.controller or arg_4_1

		if var_0_0(var_5_0) then
			Engine.DHFGJHAADD(var_5_0, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_CLAN_TAG)

			local var_5_1 = Engine.DDAFEGDJHC(var_5_0)

			OSK.CBJGJDGFC(var_5_0, Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_CLAN_TAG"), var_5_1 or "", 5, true, true, true, function(arg_6_0, arg_6_1, arg_6_2)
				if arg_6_1 then
					Engine.IIEFBGGGA(arg_6_0, arg_6_1)
					Engine.DAGFFDGFII("uploadstats", arg_6_0)
				end
			end)
		else
			var_0_1(arg_4_0, var_5_0)
		end
	end)
	arg_4_0.ClanTagButton:addEventHandler("button_action_disable", function(arg_7_0, arg_7_1)
		var_0_1(arg_4_0, arg_7_1.controller)
	end)
	arg_4_0.CallingCardsButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller or arg_4_1

		if var_0_0(var_8_0) then
			ACTIONS.OpenMenu("PlayerCardSelect", true, var_8_0)
		else
			var_0_1(arg_4_0, var_8_0)
		end
	end)
	arg_4_0.CallingCardsButton:addEventHandler("button_action_disable", function(arg_9_0, arg_9_1)
		var_0_1(arg_4_0, arg_9_1.controller)
	end)
	arg_4_0.EmblemsButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1.controller or arg_4_1

		if var_0_0(var_10_0) then
			ACTIONS.OpenMenu("EmblemSelectMenu", true, var_10_0)
		else
			var_0_1(arg_4_0, arg_10_1.controller)
		end
	end)
	arg_4_0.EmblemsButton:addEventHandler("button_action_disable", function(arg_11_0, arg_11_1)
		var_0_1(arg_4_0, arg_11_1.controller)
	end)
	arg_4_0.RadialButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or arg_4_1

		ACTIONS.OpenMenu("RadialCustomizationMenu", true, var_12_0)
	end)
	arg_4_0.RadialButton:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not Onboarding.Sprays.WasCompleted(arg_4_0, arg_4_1) then
			LUI.FlowManager.RequestPopupMenu(arg_4_0, "onboardingpopup", true, arg_4_1, false, ONBOARDING_DATA.GetOnboardingSprayData())
			Onboarding.Sprays.MarkCompleted(arg_4_0, arg_4_1)
		end
	end)
	arg_4_0.RadialButton:addEventHandler("button_action_disable", function(arg_14_0, arg_14_1)
		var_0_1(arg_4_0, arg_14_1.controller)
	end)
	var_0_2(arg_4_0, arg_4_1)
end

function MPCustomizeMenuButtons(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalList.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 319 * _1080p)

	var_15_0.id = "MPCustomizeMenuButtons"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0

	var_15_0:SetSpacing(10 * _1080p)

	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "ClanTagButton"

	var_15_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG")), 0)
	var_15_4.Description:setText(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG_DESC"), 0)
	var_15_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_15_4.DisabledText:SetAnimMoveTime(2000)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_15_0:addElement(var_15_4)

	var_15_0.ClanTagButton = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "CallingCardsButton"

	var_15_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT")), 0)
	var_15_6.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT_DESC"), 0)
	var_15_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_15_6.DisabledText:SetAnimMoveTime(2000)
	var_15_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
	var_15_0:addElement(var_15_6)

	var_15_0.CallingCardsButton = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "EmblemsButton"

	var_15_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS")), 0)
	var_15_8.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS_DESC"), 0)
	var_15_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_15_8.DisabledText:SetAnimMoveTime(2000)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
	var_15_0:addElement(var_15_8)

	var_15_0.EmblemsButton = var_15_8

	local var_15_9
	local var_15_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_15_1
	})

	var_15_10.id = "RadialButton"

	var_15_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION")), 0)
	var_15_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION_DESC"), 0)
	var_15_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_15_10.DisabledText:SetAnimMoveTime(2000)
	var_15_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
	var_15_0:addElement(var_15_10)

	var_15_0.RadialButton = var_15_10

	var_0_3(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("MPCustomizeMenuButtons", MPCustomizeMenuButtons)
LockTable(_M)
