module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = not CONDITIONS.IsOnlineAndSignedIn(arg_1_1)

	arg_1_0.ClanTagButton:SetButtonDisabled(var_1_0)
	arg_1_0.EmblemsButton:SetButtonDisabled(var_1_0)
	arg_1_0.CallingCardsButton:SetButtonDisabled(var_1_0)

	local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_OFFLINE")

	if Engine.DBAEJAHFGJ(arg_1_1) then
		var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_FOR_GUEST")
	end

	arg_1_0.ClanTagButton.DisabledText:setText(var_1_0 and var_1_1 or "")
	arg_1_0.EmblemsButton.DisabledText:setText(var_1_0 and var_1_1 or "")
	arg_1_0.CallingCardsButton.DisabledText:setText(var_1_0 and var_1_1 or "")

	if var_1_0 then
		local var_1_2 = arg_1_0:GetIndexForElement(arg_1_0.RadialButton)

		arg_1_0:SetDefaultFocus(var_1_2)
	end
end

local function var_0_1(arg_2_0)
	arg_2_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move)
	arg_2_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown)
end

local function var_0_2(arg_3_0)
	arg_3_0.Description:setText("")
	arg_3_0:AddTooltipData(controllerIndex, {
		tooltipDescription = arg_3_0.Description:getText()
	})
end

local function var_0_3(arg_4_0)
	arg_4_0.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION_DESC"), 0)
	arg_4_0:AddTooltipData(controllerIndex, {
		tooltipDescription = arg_4_0.Description:getText()
	})
end

local function var_0_4(arg_5_0)
	arg_5_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move)
	arg_5_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown)
	assert(arg_5_0.Description)
	arg_5_0:AddTooltipData(controllerIndex, {
		tooltipDescription = arg_5_0.Description:getText()
	})
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	var_0_0(arg_6_0, arg_6_1)

	if arg_6_0.ProgressionButton then
		var_0_4(arg_6_0.ProgressionButton)
	end

	if arg_6_0.ChallengesButton then
		var_0_4(arg_6_0.ChallengesButton)
		arg_6_0.ChallengesButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			if not Engine.DBAEJAHFGJ(arg_7_1.controller) then
				ACTIONS.OpenMenu("BarracksChallenges", true, arg_7_1.controller)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_7_1.controller, false)
			end
		end)
	end

	if arg_6_0.IntelButton then
		arg_6_0.IntelButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			LUI.FlowManager.RequestAddMenu("CPIntel", false, arg_8_1.controller, false, {}, true)
		end)
		var_0_4(arg_6_0.IntelButton)
	end

	if arg_6_0.CustomizeButton then
		var_0_4(arg_6_0.CustomizeButton)
	end

	if arg_6_0.RecordsButton then
		var_0_4(arg_6_0.RecordsButton)
	end

	if arg_6_0.AchievementButton then
		var_0_4(arg_6_0.AchievementButton)
	end

	if arg_6_0.ClanTagButton then
		var_0_4(arg_6_0.ClanTagButton)
		arg_6_0.ClanTagButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			if CONDITIONS.IsOnlineAndSignedIn(arg_9_1.controller) then
				Engine.DHFGJHAADD(arg_9_1.controller, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_CLAN_TAG)

				local var_9_0 = Engine.DDAFEGDJHC(arg_9_1.controller)

				OSK.CBJGJDGFC(arg_9_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_CLAN_TAG"), var_9_0 or "", 5, true, true, true, function(arg_10_0, arg_10_1, arg_10_2)
					if arg_10_1 then
						Engine.IIEFBGGGA(arg_10_0, arg_10_1)
						Engine.DAGFFDGFII("uploadstats", arg_10_0)
					end
				end)
			else
				var_0_0(arg_6_0, arg_9_1.controller)
			end
		end)
		arg_6_0.ClanTagButton:addEventHandler("button_action_disable", function(arg_11_0, arg_11_1)
			var_0_0(arg_6_0, arg_11_1.controller)
		end)
	end

	if arg_6_0.CallingCardsButton then
		var_0_4(arg_6_0.CallingCardsButton)
		arg_6_0.CallingCardsButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			if CONDITIONS.IsOnlineAndSignedIn(arg_12_1.controller) then
				ACTIONS.OpenMenu("PlayerCardSelect", true, arg_12_1.controller)
			else
				var_0_0(arg_6_0, arg_12_1.controller)
			end
		end)
		arg_6_0.CallingCardsButton:addEventHandler("button_action_disable", function(arg_13_0, arg_13_1)
			var_0_0(arg_6_0, arg_13_1.controller)
		end)
	end

	if arg_6_0.EmblemsButton then
		var_0_4(arg_6_0.EmblemsButton)
		arg_6_0.EmblemsButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			if CONDITIONS.IsOnlineAndSignedIn(arg_14_1.controller) then
				ACTIONS.OpenMenu("EmblemSelectMenu", true, arg_14_1.controller)
			else
				var_0_0(arg_6_0, arg_14_1.controller)
			end
		end)
		arg_6_0.EmblemsButton:addEventHandler("button_action_disable", function(arg_15_0, arg_15_1)
			var_0_0(arg_6_0, arg_15_1.controller)
		end)
	end

	if arg_6_0.RadialButton then
		var_0_1(arg_6_0.RadialButton)
		var_0_2(arg_6_0.RadialButton)

		arg_6_0._showRadialTooltip = true

		arg_6_0.RadialButton:addEventHandler("button_over", function(arg_16_0, arg_16_1)
			if not Onboarding.Sprays.WasCompleted(arg_6_0, arg_6_1) then
				LUI.FlowManager.RequestPopupMenu(arg_6_0, "onboardingpopup", true, arg_6_1, false, ONBOARDING_DATA.GetOnboardingSprayData())
				Onboarding.Sprays.MarkCompleted(arg_6_0, arg_6_1)

				arg_6_0._showRadialTooltip = false
				arg_6_0:Wait(1).onComplete = function()
					arg_6_0._showRadialTooltip = true
				end
			elseif arg_6_0._showRadialTooltip then
				var_0_3(arg_6_0.RadialButton)
			end
		end)
	end

	local var_6_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_6_1()
		if Engine.JEDFGECDJ() > 1 then
			local var_18_0 = var_6_0:GetValue(arg_6_1) or Engine.IJEBHJIJF()

			var_0_0(arg_6_0, var_18_0)
		end
	end

	arg_6_0:SubscribeToModel(var_6_0:GetModel(arg_6_1), var_6_1)
end

function MPBarracksMenuButtons(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIVerticalList.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 600 * _1080p)

	var_19_0.id = "MPBarracksMenuButtons"

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

	var_19_4.id = "ProgressionHeader"

	var_19_4:SetRGBFromInt(12303291, 0)
	var_19_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/PROGRESSION"), 0)
	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 35)
	var_19_0:addElement(var_19_4)

	var_19_0.ProgressionHeader = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "ProgressionButton"

	var_19_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESSION")), 0)
	var_19_6.Description:setText(Engine.CBBHFCGDIC("ONBOARDING/CAREER_LEASONLEVELING_TITLE"), 0)
	var_19_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_6.DisabledText:SetAnimMoveTime(2000)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 45, _1080p * 95)
	var_19_0:addElement(var_19_6)

	var_19_0.ProgressionButton = var_19_6

	local var_19_7

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_19_8 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_19_1
		})

		var_19_8.id = "ChallengesHeader"

		var_19_8:SetRGBFromInt(12303291, 0)
		var_19_8.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES"), 0)
		var_19_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 105, _1080p * 140)
		var_19_0:addElement(var_19_8)

		var_19_0.ChallengesHeader = var_19_8
	end

	local var_19_9

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_19_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_10.id = "ChallengesButton"

		var_19_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES")), 0)
		var_19_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_CHALLENGES_DESC"), 0)
		var_19_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_10.DisabledText:SetAnimMoveTime(2000)
		var_19_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 150, _1080p * 200)
		var_19_0:addElement(var_19_10)

		var_19_0.ChallengesButton = var_19_10
	end

	local var_19_11

	if CONDITIONS.IsMPIntelMenuEnabled(var_19_0) then
		local var_19_12 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_19_1
		})

		var_19_12.id = "IntelHeader"

		var_19_12.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/INTEL"), 0)
		var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 210, _1080p * 245)
		var_19_0:addElement(var_19_12)

		var_19_0.IntelHeader = var_19_12
	end

	local var_19_13

	if CONDITIONS.IsMPIntelMenuEnabled(var_19_0) then
		local var_19_14 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_14.id = "IntelButton"

		var_19_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INTEL")), 0)
		var_19_14.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_DESC"), 0)
		var_19_14.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_14.DisabledText:SetAnimMoveTime(2000)
		var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 255, _1080p * 305)
		var_19_0:addElement(var_19_14)

		var_19_0.IntelButton = var_19_14
	end

	local var_19_15
	local var_19_16 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_19_1
	})

	var_19_16.id = "CustomizationHeader"

	var_19_16.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZATION"), 0)
	var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 315, _1080p * 350)
	var_19_0:addElement(var_19_16)

	var_19_0.CustomizationHeader = var_19_16

	local var_19_17

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		local var_19_18 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_18.id = "ClanTagButton"

		var_19_18.Text:setText(ToUpperCase(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_AND_REGIMENT_TAGS"))), 0)
		var_19_18.Description:setText(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG_DESC"), 0)
		var_19_18.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_18.DisabledText:SetAnimMoveTime(2000)
		var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 360, _1080p * 410)
		var_19_0:addElement(var_19_18)

		var_19_0.ClanTagButton = var_19_18
	end

	local var_19_19

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		local var_19_20 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_20.id = "CallingCardsButton"

		var_19_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT")), 0)
		var_19_20.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT_DESC"), 0)
		var_19_20.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_20.DisabledText:SetAnimMoveTime(2000)
		var_19_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 420, _1080p * 470)
		var_19_0:addElement(var_19_20)

		var_19_0.CallingCardsButton = var_19_20
	end

	local var_19_21

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		local var_19_22 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_22.id = "EmblemsButton"

		var_19_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS")), 0)
		var_19_22.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS_DESC"), 0)
		var_19_22.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_22.DisabledText:SetAnimMoveTime(2000)
		var_19_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 480, _1080p * 530)
		var_19_0:addElement(var_19_22)

		var_19_0.EmblemsButton = var_19_22
	end

	local var_19_23

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		var_19_23 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})
		var_19_23.id = "RadialButton"

		var_19_23.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION")), 0)
		var_19_23.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION_DESC"), 0)
		var_19_23.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_23.DisabledText:SetAnimMoveTime(2000)
		var_19_23:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 540, _1080p * 590)
		var_19_0:addElement(var_19_23)

		var_19_0.RadialButton = var_19_23
	end

	local var_19_24

	if not CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		var_19_24 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})
		var_19_24.id = "CustomizeButton"

		var_19_24.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY")), 0)
		var_19_24.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY_EDIT_DESC"), 0)
		var_19_24.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_24.DisabledText:SetAnimMoveTime(2000)
		var_19_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 600, _1080p * 650)
		var_19_0:addElement(var_19_24)

		var_19_0.CustomizeButton = var_19_24
	end

	local var_19_25
	local var_19_26 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_19_1
	})

	var_19_26.id = "StatsHeader"

	var_19_26.Title:setText(Engine.CBBHFCGDIC("MENU/STATS"), 0)
	var_19_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 660, _1080p * 695)
	var_19_0:addElement(var_19_26)

	var_19_0.StatsHeader = var_19_26

	local var_19_27
	local var_19_28 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_19_1
	})

	var_19_28.id = "RecordsButton"

	var_19_28.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RECORDS")), 0)
	var_19_28.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_RECORDS_DESC"), 0)
	var_19_28.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_19_28.DisabledText:SetAnimMoveTime(2000)
	var_19_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 705, _1080p * 755)
	var_19_0:addElement(var_19_28)

	var_19_0.RecordsButton = var_19_28

	local var_19_29

	if CONDITIONS.IsPCAchievementsMenuAvailable(var_19_0) then
		var_19_29 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_19_1
		})
		var_19_29.id = "AchievementButton"

		var_19_29.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT")), 0)
		var_19_29.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENTS_DESC"), 0)
		var_19_29.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_19_29.DisabledText:SetAnimMoveTime(2000)
		var_19_29:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 765, _1080p * 815)
		var_19_0:addElement(var_19_29)

		var_19_0.AchievementButton = var_19_29
	end

	var_19_6:addEventHandler("button_action", function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_1.controller or var_19_1

		ACTIONS.OpenMenu("ProgressionMenu", true, var_20_0)
	end)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		var_19_23:addEventHandler("button_action", function(arg_21_0, arg_21_1)
			local var_21_0 = arg_21_1.controller or var_19_1

			ACTIONS.OpenMenu("RadialCustomizationMenu", true, var_21_0)
		end)
	end

	if not CONDITIONS.IsNewBarracksIdentityEnabled(var_19_0) then
		var_19_24:addEventHandler("button_action", function(arg_22_0, arg_22_1)
			local var_22_0 = arg_22_1.controller or var_19_1

			ACTIONS.OpenMenu("BarracksCustomize", true, var_22_0)
		end)
	end

	var_19_28:addEventHandler("button_action", function(arg_23_0, arg_23_1)
		local var_23_0 = arg_23_1.controller or var_19_1

		ACTIONS.OpenMenu("BarracksRecords", true, var_23_0)
	end)

	if CONDITIONS.IsPCAchievementsMenuAvailable(var_19_0) then
		var_19_29:addEventHandler("button_action", function(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_1.controller or var_19_1

			if CONDITIONS.IsPCAchievementsMenuAvailable(var_19_0) then
				ACTIONS.OpenPCAchievementMenu(var_24_0)
			end
		end)
	end

	var_0_5(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("MPBarracksMenuButtons", MPBarracksMenuButtons)
LockTable(_M)
