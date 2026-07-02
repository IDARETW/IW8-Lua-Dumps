module(..., package.seeall)

local function var_0_0(arg_1_0)
	return Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_1_0) and Engine.CJJAFGIFAC(arg_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = not var_0_0(arg_2_1)

	arg_2_0.ClanTagButton:SetButtonDisabled(var_2_0)
	arg_2_0.EmblemsButton:SetButtonDisabled(var_2_0)
	arg_2_0.CallingCardsButton:SetButtonDisabled(var_2_0)
	arg_2_0.CallingCardFrame:SetButtonDisabled(var_2_0)
	arg_2_0.PlayerTitle:SetButtonDisabled(var_2_0)

	local var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_OFFLINE")

	if Engine.DBAEJAHFGJ(arg_2_1) then
		var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_FOR_GUEST")
	end

	arg_2_0.ClanTagButton.DisabledText:setText(var_2_0 and var_2_1 or "")
	arg_2_0.EmblemsButton.DisabledText:setText(var_2_0 and var_2_1 or "")
	arg_2_0.CallingCardsButton.DisabledText:setText(var_2_0 and var_2_1 or "")
	arg_2_0.CallingCardFrame.DisabledText:setText(var_2_0 and disabledText or "")
	arg_2_0.PlayerTitle.DisabledText:setText(var_2_0 and disabledText or "")

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
	assert(arg_3_0.CallingCardFrame.Description)
	assert(arg_3_0.PlayerTitle.Description)
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
	arg_3_0.CallingCardFrame:AddTooltipData(arg_3_1, {
		tooltipDescription = arg_3_0.CallingCardFrame.Description:getText()
	})
	arg_3_0.PlayerTitle:AddTooltipData(arg_3_1, {
		tooltipDescription = arg_3_0.PlayerTitle.Description:getText()
	})
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_0.ClanTagButton)
	assert(arg_4_0.CallingCardsButton)
	assert(arg_4_0.EmblemsButton)
	assert(arg_4_0.RadialButton)
	assert(arg_4_0.CallingCardFrame)
	assert(arg_4_0.PlayerTitle)
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
	arg_4_0.CallingCardFrame:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		local var_15_0 = arg_15_1.controller or arg_4_1

		if var_0_0(var_15_0) then
			ACTIONS.OpenMenu("PlayerCardFrameSelect", true, var_15_0)
		else
			var_0_1(arg_4_0, var_15_0)
		end
	end)
	arg_4_0.CallingCardFrame:addEventHandler("button_action_disable", function(arg_16_0, arg_16_1)
		var_0_1(arg_4_0, arg_16_1.controller)
	end)
	arg_4_0.PlayerTitle:addEventHandler("button_action", function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_1.controller or arg_4_1

		if var_0_0(var_17_0) then
			ACTIONS.OpenMenu("PlayerTitleSelect", true, var_17_0)
		else
			var_0_1(arg_4_0, var_17_0)
		end
	end)
	arg_4_0.PlayerTitle:addEventHandler("button_action_disable", function(arg_18_0, arg_18_1)
		var_0_1(arg_4_0, arg_18_1.controller)
	end)
	var_0_2(arg_4_0, arg_4_1)
end

function WZCustomizeMenuButtons(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIVerticalList.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 319 * _1080p)

	var_19_0.id = "WZCustomizeMenuButtons"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0

	var_19_0:SetSpacing(10 * _1080p)

	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "SocialIdentity"

	var_19_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SOCIALIDENTITY"), 0)
	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 40)
	var_19_0:addElement(var_19_4)

	var_19_0.SocialIdentity = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "ClanTagButton"

	var_19_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG")), 0)
	var_19_6.Description:setText(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG_DESC"), 0)
	var_19_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_6.DisabledText:SetAnimMoveTime(2000)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 50, _1080p * 100)
	var_19_0:addElement(var_19_6)

	var_19_0.ClanTagButton = var_19_6

	local var_19_7

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_19_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_8.id = "CallingCardsButton"

		var_19_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT")), 0)
		var_19_8.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT_DESC"), 0)
		var_19_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_8.DisabledText:SetAnimMoveTime(2000)
		var_19_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 110, _1080p * 160)
		var_19_0:addElement(var_19_8)

		var_19_0.CallingCardsButton = var_19_8
	end

	local var_19_9
	local var_19_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_10.id = "CallingCardFrame"

	var_19_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CALLINGCARDFRAME")), 0)
	var_19_10.Description:setText(Engine.CBBHFCGDIC("MENU/FRAME_SELECT_DESC"), 0)
	var_19_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_10.DisabledText:SetAnimMoveTime(2000)
	var_19_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 170, _1080p * 220)
	var_19_0:addElement(var_19_10)

	var_19_0.CallingCardFrame = var_19_10

	local var_19_11
	local var_19_12 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_12.id = "PlayerTitle"

	var_19_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAYERTITLE")), 0)
	var_19_12.Description:setText(Engine.CBBHFCGDIC("MENU/TITLE_SELECT_DESC"), 0)
	var_19_12.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_12.DisabledText:SetAnimMoveTime(2000)
	var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 230, _1080p * 280)
	var_19_0:addElement(var_19_12)

	var_19_0.PlayerTitle = var_19_12

	local var_19_13
	local var_19_14 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_14.id = "EmblemsButton"

	var_19_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS")), 0)
	var_19_14.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS_DESC"), 0)
	var_19_14.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_14.DisabledText:SetAnimMoveTime(2000)
	var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 290, _1080p * 340)
	var_19_0:addElement(var_19_14)

	var_19_0.EmblemsButton = var_19_14

	local var_19_15
	local var_19_16 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_19_1
	})

	var_19_16.id = "GameplayIdentity"

	var_19_16.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMEPLAYIDENTITY"), 0)
	var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 350, _1080p * 390)
	var_19_0:addElement(var_19_16)

	var_19_0.GameplayIdentity = var_19_16

	local var_19_17
	local var_19_18 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_18.id = "RadialButton"

	var_19_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION")), 0)
	var_19_18.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION_DESC"), 0)
	var_19_18.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_18.DisabledText:SetAnimMoveTime(2000)
	var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 400, _1080p * 450)
	var_19_0:addElement(var_19_18)

	var_19_0.RadialButton = var_19_18

	local var_19_19

	if CONDITIONS.IsVehicleCustomizeEnabled() then
		var_19_19 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})
		var_19_19.id = "VehicleCustomizationButton"

		var_19_19.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION")), 0)
		var_19_19.Description:setText(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION_DESC"), 0)
		var_19_19.DisabledText:setText(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION"), 0)
		var_19_19.DisabledText:SetAnimMoveTime(2000)
		var_19_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 460, _1080p * 511)
		var_19_0:addElement(var_19_19)

		var_19_0.VehicleCustomizationButton = var_19_19
	end

	local var_19_20
	local var_19_21 = MenuBuilder.BuildRegisteredType("WatchSelectButton", {
		controllerIndex = var_19_1
	})

	var_19_21.id = "WatchSelectButton"

	var_19_21.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT")), 0)
	var_19_21.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT_DESC"), 0)
	var_19_21.PlayMenuButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT_DISABLED_TEXT"), 0)
	var_19_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 521, _1080p * 572)
	var_19_0:addElement(var_19_21)

	var_19_0.WatchSelectButton = var_19_21

	if CONDITIONS.IsVehicleCustomizeEnabled() then
		var_19_19:addEventHandler("button_action", function(arg_20_0, arg_20_1)
			local var_20_0 = arg_20_1.controller or var_19_1

			ACTIONS.OpenMenu("VehicleSelect", true, var_20_0)
		end)
	end

	var_19_21:addEventHandler("button_action", function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_1.controller or var_19_1

		ACTIONS.OpenMenu("WatchSelect", true, var_21_0)
	end)
	var_0_3(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("WZCustomizeMenuButtons", WZCustomizeMenuButtons)
LockTable(_M)
