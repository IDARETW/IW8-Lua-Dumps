module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move)
	arg_1_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown)
	assert(arg_1_0.Description)
	arg_1_0:AddTooltipData(controllerIndex, {
		tooltipDescription = arg_1_0.Description:getText()
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ProgressionButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if PROGRESSION.IsElder(arg_2_1) or Dvar.IBEGCHEFE("lui_force_elder_progression_menu") then
			ACTIONS.OpenMenu("ElderProgression", true, arg_3_1.controller)
		else
			ACTIONS.OpenMenu("UnlocksMenu", true, arg_3_1.controller)
		end
	end)

	if arg_2_0.ChallengesButton then
		var_0_0(arg_2_0.ChallengesButton)
		arg_2_0.ChallengesButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			if not Engine.DBAEJAHFGJ(arg_4_1.controller) then
				ACTIONS.OpenMenu("BarracksChallenges", true, arg_4_1.controller)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_4_1.controller, false)
			end
		end)
	end

	if arg_2_0.IntelButton then
		arg_2_0.IntelButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			LUI.FlowManager.RequestAddMenu("CPIntel", false, arg_5_1.controller, false, {}, true)
		end)
		var_0_0(arg_2_0.IntelButton)
	end

	if arg_2_0.CustomizeButton then
		var_0_0(arg_2_0.CustomizeButton)
	end

	if arg_2_0.ProgressionButton then
		var_0_0(arg_2_0.ProgressionButton)
	end

	if arg_2_0.RecordsButton then
		var_0_0(arg_2_0.RecordsButton)
	end

	if arg_2_0.AchievementButton then
		var_0_0(arg_2_0.AchievementButton)
	end

	if arg_2_0.ClanTagButton then
		var_0_0(arg_2_0.ClanTagButton)
		arg_2_0.ClanTagButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			if CONDITIONS.IsOnlineAndSignedIn(arg_2_1) then
				Engine.DHFGJHAADD(arg_2_1, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_CLAN_TAG)

				local var_6_0 = Engine.DDAFEGDJHC(arg_2_1)

				OSK.CBJGJDGFC(arg_2_1, Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_CLAN_TAG"), var_6_0 or "", 5, true, true, true, function(arg_7_0, arg_7_1, arg_7_2)
					if arg_7_1 then
						Engine.IIEFBGGGA(arg_7_0, arg_7_1)
						Engine.DAGFFDGFII("uploadstats", arg_7_0)
					end
				end)
			end
		end)
	end

	if arg_2_0.CallingCardsButton then
		var_0_0(arg_2_0.CallingCardsButton)
	end

	if arg_2_0.EmblemsButton then
		var_0_0(arg_2_0.EmblemsButton)
	end

	if arg_2_0.RadialButton then
		var_0_0(arg_2_0.RadialButton)
		arg_2_0.RadialButton:addEventHandler("button_over", function(arg_8_0, arg_8_1)
			if not Onboarding.Sprays.WasCompleted(arg_2_0, arg_2_1) then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "onboardingpopup", true, arg_2_1, false, ONBOARDING_DATA.GetOnboardingSprayData())
				Onboarding.Sprays.MarkCompleted(arg_2_0, arg_2_1)
			end
		end)
	end
end

function MPBarracksMenuButtons(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalList.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 600 * _1080p)

	var_9_0.id = "MPBarracksMenuButtons"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:SetSpacing(10 * _1080p)

	local var_9_3

	if not CONDITIONS.IsChallengeTabEnabled("") then
		local var_9_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_9_1
		})

		var_9_4.id = "ChallengesHeader"

		var_9_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES"), 0)
		var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 35)
		var_9_0:addElement(var_9_4)

		var_9_0.ChallengesHeader = var_9_4
	end

	local var_9_5

	if not CONDITIONS.IsChallengeTabEnabled("") then
		local var_9_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})

		var_9_6.id = "ChallengesButton"

		var_9_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES")), 0)
		var_9_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_CHALLENGES_DESC"), 0)
		var_9_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_6.DisabledText:SetAnimMoveTime(2000)
		var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 45, _1080p * 95)
		var_9_0:addElement(var_9_6)

		var_9_0.ChallengesButton = var_9_6
	end

	local var_9_7

	if CONDITIONS.IsMPIntelMenuEnabled(var_9_0) then
		local var_9_8 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_9_1
		})

		var_9_8.id = "IntelHeader"

		var_9_8.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/INTEL"), 0)
		var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 105, _1080p * 140)
		var_9_0:addElement(var_9_8)

		var_9_0.IntelHeader = var_9_8
	end

	local var_9_9

	if CONDITIONS.IsMPIntelMenuEnabled(var_9_0) then
		local var_9_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})

		var_9_10.id = "IntelButton"

		var_9_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INTEL")), 0)
		var_9_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_DESC"), 0)
		var_9_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_10.DisabledText:SetAnimMoveTime(2000)
		var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 150, _1080p * 200)
		var_9_0:addElement(var_9_10)

		var_9_0.IntelButton = var_9_10
	end

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "CustomizationHeader"

	var_9_12.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZATION"), 0)
	var_9_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 210, _1080p * 245)
	var_9_0:addElement(var_9_12)

	var_9_0.CustomizationHeader = var_9_12

	local var_9_13

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		local var_9_14 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})

		var_9_14.id = "ClanTagButton"

		var_9_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_AND_REGIMENT_TAGS")), 0)
		var_9_14.Description:setText(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG_DESC"), 0)
		var_9_14.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_14.DisabledText:SetAnimMoveTime(2000)
		var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 255, _1080p * 305)
		var_9_0:addElement(var_9_14)

		var_9_0.ClanTagButton = var_9_14
	end

	local var_9_15

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_15 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})
		var_9_15.id = "CallingCardsButton"

		var_9_15.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT")), 0)
		var_9_15.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT_DESC"), 0)
		var_9_15.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_15.DisabledText:SetAnimMoveTime(2000)
		var_9_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 315, _1080p * 365)
		var_9_0:addElement(var_9_15)

		var_9_0.CallingCardsButton = var_9_15
	end

	local var_9_16

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_16 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})
		var_9_16.id = "EmblemsButton"

		var_9_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS")), 0)
		var_9_16.Description:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_ICONS_DESC"), 0)
		var_9_16.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_16.DisabledText:SetAnimMoveTime(2000)
		var_9_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 375, _1080p * 425)
		var_9_0:addElement(var_9_16)

		var_9_0.EmblemsButton = var_9_16
	end

	local var_9_17

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_17 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})
		var_9_17.id = "RadialButton"

		var_9_17.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION")), 0)
		var_9_17.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION_DESC"), 0)
		var_9_17.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_17.DisabledText:SetAnimMoveTime(2000)
		var_9_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 435, _1080p * 485)
		var_9_0:addElement(var_9_17)

		var_9_0.RadialButton = var_9_17
	end

	local var_9_18

	if not CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_18 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})
		var_9_18.id = "CustomizeButton"

		var_9_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY")), 0)
		var_9_18.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY_EDIT_DESC"), 0)
		var_9_18.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_18.DisabledText:SetAnimMoveTime(2000)
		var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 495, _1080p * 545)
		var_9_0:addElement(var_9_18)

		var_9_0.CustomizeButton = var_9_18
	end

	local var_9_19
	local var_9_20 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_9_1
	})

	var_9_20.id = "StatsHeader"

	var_9_20.Title:setText(Engine.CBBHFCGDIC("MENU/STATS"), 0)
	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 555, _1080p * 590)
	var_9_0:addElement(var_9_20)

	var_9_0.StatsHeader = var_9_20

	local var_9_21
	local var_9_22 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_9_1
	})

	var_9_22.id = "ProgressionButton"

	var_9_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RANK_PROGRESSION")), 0)
	var_9_22.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_PROGRESSION_DESC"), 0)
	var_9_22.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_9_22.DisabledText:SetAnimMoveTime(2000)
	var_9_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 600, _1080p * 650)
	var_9_0:addElement(var_9_22)

	var_9_0.ProgressionButton = var_9_22

	local var_9_23
	local var_9_24 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_9_1
	})

	var_9_24.id = "RecordsButton"

	var_9_24.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RECORDS")), 0)
	var_9_24.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_RECORDS_DESC"), 0)
	var_9_24.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_9_24.DisabledText:SetAnimMoveTime(2000)
	var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 660, _1080p * 710)
	var_9_0:addElement(var_9_24)

	var_9_0.RecordsButton = var_9_24

	local var_9_25

	if CONDITIONS.IsPCAchievementsMenuAvailable(var_9_0) then
		var_9_25 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})
		var_9_25.id = "AchievementButton"

		var_9_25.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT")), 0)
		var_9_25.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENTS_DESC"), 0)
		var_9_25.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_25.DisabledText:SetAnimMoveTime(2000)
		var_9_25:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 720, _1080p * 770)
		var_9_0:addElement(var_9_25)

		var_9_0.AchievementButton = var_9_25
	end

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_15:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1.controller or var_9_1

			ACTIONS.OpenMenu("PlayerCardSelect", true, var_10_0)
		end)
	end

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_16:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			local var_11_0 = arg_11_1.controller or var_9_1

			ACTIONS.OpenMenu("EmblemSelectMenu", true, var_11_0)
		end)
	end

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_17:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			local var_12_0 = arg_12_1.controller or var_9_1

			ACTIONS.OpenMenu("RadialCustomizationMenu", true, var_12_0)
		end)
	end

	if not CONDITIONS.IsNewBarracksIdentityEnabled(var_9_0) then
		var_9_18:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			local var_13_0 = arg_13_1.controller or var_9_1

			ACTIONS.OpenMenu("BarracksCustomize", true, var_13_0)
		end)
	end

	var_9_24:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_1.controller or var_9_1

		ACTIONS.OpenMenu("BarracksRecords", true, var_14_0)
	end)

	if CONDITIONS.IsPCAchievementsMenuAvailable(var_9_0) then
		var_9_25:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			local var_15_0 = arg_15_1.controller or var_9_1

			if CONDITIONS.IsPCAchievementsMenuAvailable(var_9_0) then
				ACTIONS.OpenPCAchievementMenu(var_15_0)
			end
		end)
	end

	var_0_1(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("MPBarracksMenuButtons", MPBarracksMenuButtons)
LockTable(_M)
