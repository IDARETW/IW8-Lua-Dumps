module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "CustomizeSummary")
	ACTIONS.AnimateSequence(arg_1_0.BarracksCustomizeSummary, CONDITIONS.IsOnlineAndSignedIn(arg_1_0._controllerIndex) and arg_1_1 or "ShowSpraysGestures")
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Clans.CEACCICGB(arg_2_1) or {}

	arg_2_0._switchClanTagEnabled = arg_2_0._currentClanTagType == ClanTagType.OFFICIAL or #var_2_0 > 0

	arg_2_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(arg_2_0._switchClanTagEnabled and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1 and arg_3_0.MPBarracksMenuButtons[arg_3_1] and arg_3_0.MPBarracksMenuButtons:GetIndexForElement(arg_3_0.MPBarracksMenuButtons[arg_3_1]) then
		arg_3_0.MPBarracksMenuButtons:processEvent({
			name = "lose_focus"
		})
		arg_3_0.MPBarracksMenuButtons[arg_3_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	Loot.GADJEFJEA(arg_4_1, LOOT.typeNames[LOOT.itemTypes.PLAYERCARD])
	Loot.GADJEFJEA(arg_4_1, LOOT.typeNames[LOOT.itemTypes.EMBLEM])
	Loot.GADJEFJEA(arg_4_1, LOOT.typeNames[LOOT.itemTypes.SPRAYS])
	Loot.GADJEFJEA(arg_4_1, LOOT.typeNames[LOOT.itemTypes.GESTURES])

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		arg_4_0.MPBarracksMenuButtons.CallingCardsButton:UpdateNewItemNotification(0)
		arg_4_0.MPBarracksMenuButtons.EmblemsButton:UpdateNewItemNotification(0)
		arg_4_0.MPBarracksMenuButtons.RadialButton:UpdateNewItemNotification(0)
	else
		arg_4_0.MPBarracksMenuButtons.CustomizeButton:UpdateNewItemNotification(0)
	end

	local var_4_0 = arg_4_0:GetCurrentMenu()

	if var_4_0 then
		var_4_0.MPTabsMenu.Tabs:GetCurrentTab():SetBreadcrumb(false)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = LOOT.IsCategoryNew(arg_5_1, LOOT.itemTypes.PLAYERCARD)
	local var_5_1 = LOOT.IsCategoryNew(arg_5_1, LOOT.itemTypes.EMBLEM)
	local var_5_2 = LOOT.IsCategoryNew(arg_5_1, LOOT.itemTypes.SPRAYS)
	local var_5_3 = LOOT.IsCategoryNew(arg_5_1, LOOT.itemTypes.GESTURES)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		arg_5_0.MPBarracksMenuButtons.EmblemsButton:UpdateNewItemNotification(var_5_1 and 1 or 0)
		arg_5_0.MPBarracksMenuButtons.CallingCardsButton:UpdateNewItemNotification(var_5_0 and 1 or 0)

		local var_5_4 = var_5_2 or var_5_3

		arg_5_0.MPBarracksMenuButtons.RadialButton:UpdateNewItemNotification(var_5_4 and 1 or 0)
	else
		local var_5_5 = var_5_0 or var_5_1 or var_5_2 or var_5_3

		arg_5_0.MPBarracksMenuButtons.CustomizeButton:UpdateNewItemNotification(var_5_5 and 1 or 0)
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.MPBarracksMenuButtons.ProgressionButton)
	assert(arg_6_0.MPBarracksMenuButtons.RecordsButton)

	if CONDITIONS.IsMPIntelMenuEnabled(arg_6_0) then
		assert(arg_6_0.MPBarracksMenuButtons.IntelButton)
	end

	arg_6_0.FocusButtonByName = var_0_2
	arg_6_0._controllerIndex = arg_6_1

	PROGRESSION.PrestreamRankUnlocksIcons(arg_6_0, arg_6_1)

	local function var_6_0()
		if not arg_6_0.BarracksChallengesSummary.initialized then
			arg_6_0.BarracksChallengesSummary:InitializeData(arg_6_1)
		end

		ACTIONS.AnimateSequence(arg_6_0, "ChallengesSummary")
	end

	local function var_6_1()
		ACTIONS.AnimateSequence(arg_6_0, "CustomizeSummary")
	end

	local function var_6_2()
		if not CONDITIONS.IsMagmaGameMode() then
			ACTIONS.AnimateSequence(arg_6_0, "StatsSummary")
		else
			ACTIONS.AnimateSequence(arg_6_0, "HideStatsSummary")
		end
	end

	local function var_6_3()
		if PROGRESSION.IsElder(arg_6_1) or Dvar.IBEGCHEFE("lui_force_elder_progression_menu") then
			ACTIONS.AnimateSequence(arg_6_0, "ElderProgressionSummary")
		else
			ACTIONS.AnimateSequence(arg_6_0, "ProgressionSummary")
		end
	end

	local function var_6_4()
		if Engine.CGABICJHAI() then
			assert(arg_6_0.MPBarracksMenuButtons.AchievementButton)
			ACTIONS.AnimateSequence(arg_6_0, "AchievementsSummary")
		end
	end

	local function var_6_5()
		ACTIONS.AnimateSequence(arg_6_0, "IntelSummary")
	end

	if arg_6_0.MPBarracksMenuButtons.ChallengesButton then
		arg_6_0.MPBarracksMenuButtons.ChallengesButton:addEventHandler("button_over", var_6_0)
		arg_6_0.MPBarracksMenuButtons.ChallengesButton:addEventHandler("button_over_disable", var_6_0)
	end

	if not CONDITIONS.IsNewBarracksIdentityEnabled() then
		arg_6_0.MPBarracksMenuButtons.CustomizeButton:addEventHandler("button_over", var_6_1)
	end

	arg_6_0.MPBarracksMenuButtons.ProgressionButton:addEventHandler("button_over", var_6_3)
	arg_6_0.MPBarracksMenuButtons.RecordsButton:addEventHandler("button_over", var_6_2)

	if CONDITIONS.IsMPIntelMenuEnabled(arg_6_0) then
		arg_6_0.MPBarracksMenuButtons.IntelButton:addEventHandler("button_over", var_6_5)
	end

	if arg_6_0.MPBarracksMenuButtons.ClanTagButton then
		arg_6_0._switchClanTagEnabled = false
		arg_6_0._currentClanTagType = FRIENDS.GetCurrentClanTagType(arg_6_1)

		arg_6_0:addEventHandler("text_input_complete", function(arg_13_0, arg_13_1)
			if arg_13_1.text then
				Engine.IIEFBGGGA(arg_6_1, arg_13_1.text)
			end
		end)
		arg_6_0:addEventHandler("update_clan_tag_type", function(arg_14_0, arg_14_1)
			arg_6_0._currentClanTagType = arg_14_1.clanTagType

			var_0_1(arg_6_0, arg_6_1)
		end)
		arg_6_0.MPBarracksMenuButtons.ClanTagButton:addEventHandler("button_over", function(arg_15_0, arg_15_1)
			if CONDITIONS.IsSystemLink(arg_6_0) then
				var_0_0(arg_6_0, "ShowCustomClanTagTopLeft")
			else
				var_0_0(arg_6_0, "ShowClanTags")
				arg_6_0.BarracksCustomizeSummary:UpdateClanTagType(arg_6_0._currentClanTagType)
				var_0_1(arg_6_0, arg_6_1)
			end
		end)
		arg_6_0.MPBarracksMenuButtons.ClanTagButton:addEventHandler("button_up", function(arg_16_0, arg_16_1)
			if LUI.IsLastInputGamepad(arg_6_1) then
				arg_6_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(0)

				arg_6_0._switchClanTagEnabled = false
			end
		end)
	end

	if arg_6_0.MPBarracksMenuButtons.CallingCardsButton then
		arg_6_0.MPBarracksMenuButtons.CallingCardsButton:addEventHandler("button_over", function(arg_17_0, arg_17_1)
			var_0_0(arg_6_0, "ShowCallingCard")
		end)
	end

	if arg_6_0.MPBarracksMenuButtons.EmblemsButton then
		arg_6_0.MPBarracksMenuButtons.EmblemsButton:addEventHandler("button_over", function(arg_18_0, arg_18_1)
			var_0_0(arg_6_0, "ShowEmblem")
		end)
	end

	if arg_6_0.MPBarracksMenuButtons.RadialButton then
		arg_6_0.MPBarracksMenuButtons.RadialButton:addEventHandler("button_over", function(arg_19_0, arg_19_1)
			ACTIONS.AnimateSequence(arg_6_0, "ShowGestureAndSprayPanel")
		end)
	end

	if PROGRESSION.IsElder(arg_6_1) or Dvar.IBEGCHEFE("lui_force_elder_progression_menu") then
		arg_6_0.MPBarracksMenuButtons.ProgressionButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OFFICER_PROGRESSION")))
		arg_6_0.MPBarracksMenuButtons.ProgressionButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_OFFICER_PROGRESSION_DESC"), 0)
	end

	var_0_4(arg_6_0, arg_6_1)

	local var_6_6 = LUI.UIBindButton.new()

	var_6_6.id = "bindButton"

	arg_6_0:addElement(var_6_6)

	arg_6_0.bindButton = var_6_6

	arg_6_0.bindButton:addEventHandler("button_left_stick", function(arg_20_0, arg_20_1)
		if Dvar.IBEGCHEFE("MOSNKSLTKM") then
			var_0_3(arg_6_0, arg_6_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		end
	end)
	arg_6_0.bindButton:addEventHandler("button_alt1", function(arg_21_0, arg_21_1)
		if arg_6_0._switchClanTagEnabled then
			local var_21_0 = arg_6_0._currentClanTagType == ClanTagType.CUSTOM and ClanTagType.OFFICIAL or ClanTagType.CUSTOM

			Engine.GGIHFEAGD(arg_6_1, var_21_0)

			arg_6_0._currentClanTagType = var_21_0

			Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		end
	end)

	if Engine.CGABICJHAI() then
		arg_6_0.MPBarracksMenuButtons.AchievementButton:addEventHandler("button_over", var_6_4)
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	local function var_6_7()
		local var_22_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_6_0.Darken:SetScale(var_22_0)
	end

	arg_6_0:addAndCallEventHandler("onVideoChange", var_6_7)

	local var_6_8 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_6_9()
		local var_23_0 = var_6_8:GetValue(arg_6_1) or Engine.IJEBHJIJF()

		if Engine.JEDFGECDJ() > 1 then
			arg_6_0.BarracksCustomizeSummary:SetData(var_23_0)

			if arg_6_0.BarracksStatsSummary then
				arg_6_0.BarracksStatsSummary:SetData(var_23_0)
			end
		end
	end

	arg_6_0:SubscribeToModel(var_6_8:GetModel(arg_6_1), var_6_9)
end

function MPBarracksMenu(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIVerticalNavigator.new()

	var_24_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_24_0.id = "MPBarracksMenu"
	var_24_0._animationSets = var_24_0._animationSets or {}
	var_24_0._sequences = var_24_0._sequences or {}

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = {
		worldBlur = 1,
		controllerIndex = var_24_1
	}
	local var_24_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_24_4)

	var_24_5.id = "WorldBlur"

	var_24_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_24_0:addElement(var_24_5)

	var_24_0.WorldBlur = var_24_5

	local var_24_6
	local var_24_7 = LUI.UIImage.new()

	var_24_7.id = "Darken"

	var_24_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_24_7:SetAlpha(0.5, 0)
	var_24_0:addElement(var_24_7)

	var_24_0.Darken = var_24_7

	local var_24_8

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		var_24_8 = MenuBuilder.BuildRegisteredType("BarracksStatsSummary", {
			controllerIndex = var_24_1
		})
		var_24_8.id = "BarracksStatsSummary"

		var_24_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1824, _1080p * 200, _1080p * 885)
		var_24_0:addElement(var_24_8)

		var_24_0.BarracksStatsSummary = var_24_8
	end

	local var_24_9
	local var_24_10 = MenuBuilder.BuildRegisteredType("UnlocksRankPanel", {
		controllerIndex = var_24_1
	})

	var_24_10.id = "BarracksProgressionSummary"

	var_24_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1034, _1080p * 200, _1080p * 959)
	var_24_0:addElement(var_24_10)

	var_24_0.BarracksProgressionSummary = var_24_10

	local var_24_11
	local var_24_12 = MenuBuilder.BuildRegisteredType("BarracksCustomizeSummary", {
		controllerIndex = var_24_1
	})

	var_24_12.id = "BarracksCustomizeSummary"

	var_24_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1625, _1080p * 200, _1080p * 859)
	var_24_0:addElement(var_24_12)

	var_24_0.BarracksCustomizeSummary = var_24_12

	local var_24_13
	local var_24_14 = MenuBuilder.BuildRegisteredType("BarracksChallengesSummary", {
		controllerIndex = var_24_1
	})

	var_24_14.id = "BarracksChallengesSummary"

	var_24_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1664, _1080p * 200, _1080p * 976)
	var_24_0:addElement(var_24_14)

	var_24_0.BarracksChallengesSummary = var_24_14

	local var_24_15
	local var_24_16 = MenuBuilder.BuildRegisteredType("MPBarracksMenuButtons", {
		controllerIndex = var_24_1
	})

	var_24_16.id = "MPBarracksMenuButtons"

	var_24_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 556, _1080p * 185, _1080p * 835)
	var_24_0:addElement(var_24_16)

	var_24_0.MPBarracksMenuButtons = var_24_16

	local var_24_17
	local var_24_18 = MenuBuilder.BuildRegisteredType("ElderProgressionRankPanel", {
		controllerIndex = var_24_1
	})

	var_24_18.id = "ElderProgressionRankPanel"

	var_24_18.CurRankTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_RANK"), 0)
	var_24_18:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 604, _1080p * -886, _1080p * 200, _1080p * -121)
	var_24_0:addElement(var_24_18)

	var_24_0.ElderProgressionRankPanel = var_24_18

	local var_24_19

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		var_24_19 = MenuBuilder.BuildRegisteredType("GestureAndSprayPanel", {
			controllerIndex = var_24_1
		})
		var_24_19.id = "GestureAndSprayPanel"

		var_24_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1604, _1080p * 200, _1080p * 755)
		var_24_0:addElement(var_24_19)

		var_24_0.GestureAndSprayPanel = var_24_19
	end

	local var_24_20

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_21 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("DefaultSequence", var_24_21)
	end

	local var_24_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("DefaultSequence", var_24_22)

	local var_24_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("DefaultSequence", var_24_23)

	local var_24_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("DefaultSequence", var_24_24)

	local var_24_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("DefaultSequence", var_24_25)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("DefaultSequence", var_24_26)
	end

	local function var_24_27()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("DefaultSequence")
		end

		var_24_10:AnimateSequence("DefaultSequence")
		var_24_12:AnimateSequence("DefaultSequence")
		var_24_14:AnimateSequence("DefaultSequence")
		var_24_18:AnimateSequence("DefaultSequence")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("DefaultSequence")
		end
	end

	var_24_0._sequences.DefaultSequence = var_24_27

	local var_24_28

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("ChallengesSummary", var_24_29)
	end

	local var_24_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("ChallengesSummary", var_24_30)

	local var_24_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("ChallengesSummary", var_24_31)

	local var_24_32 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("ChallengesSummary", var_24_32)

	local var_24_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("ChallengesSummary", var_24_33)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("ChallengesSummary", var_24_34)
	end

	local function var_24_35()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("ChallengesSummary")
		end

		var_24_10:AnimateSequence("ChallengesSummary")
		var_24_12:AnimateSequence("ChallengesSummary")
		var_24_14:AnimateSequence("ChallengesSummary")
		var_24_18:AnimateSequence("ChallengesSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("ChallengesSummary")
		end
	end

	var_24_0._sequences.ChallengesSummary = var_24_35

	local var_24_36

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_37 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("CustomizeSummary", var_24_37)
	end

	local var_24_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("CustomizeSummary", var_24_38)

	local var_24_39 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("CustomizeSummary", var_24_39)

	local var_24_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("CustomizeSummary", var_24_40)

	local var_24_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("CustomizeSummary", var_24_41)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_42 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("CustomizeSummary", var_24_42)
	end

	local function var_24_43()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("CustomizeSummary")
		end

		var_24_10:AnimateSequence("CustomizeSummary")
		var_24_12:AnimateSequence("CustomizeSummary")
		var_24_14:AnimateSequence("CustomizeSummary")
		var_24_18:AnimateSequence("CustomizeSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("CustomizeSummary")
		end
	end

	var_24_0._sequences.CustomizeSummary = var_24_43

	local var_24_44

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_45 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("StatsSummary", var_24_45)
	end

	local var_24_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("StatsSummary", var_24_46)

	local var_24_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("StatsSummary", var_24_47)

	local var_24_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("StatsSummary", var_24_48)

	local var_24_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("StatsSummary", var_24_49)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_50 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("StatsSummary", var_24_50)
	end

	local function var_24_51()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("StatsSummary")
		end

		var_24_10:AnimateSequence("StatsSummary")
		var_24_12:AnimateSequence("StatsSummary")
		var_24_14:AnimateSequence("StatsSummary")
		var_24_18:AnimateSequence("StatsSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("StatsSummary")
		end
	end

	var_24_0._sequences.StatsSummary = var_24_51

	local var_24_52

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("ProgressionSummary", var_24_53)
	end

	local var_24_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("ProgressionSummary", var_24_54)

	local var_24_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("ProgressionSummary", var_24_55)

	local var_24_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("ProgressionSummary", var_24_56)

	local var_24_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("ProgressionSummary", var_24_57)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_58 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("ProgressionSummary", var_24_58)
	end

	local function var_24_59()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("ProgressionSummary")
		end

		var_24_10:AnimateSequence("ProgressionSummary")
		var_24_12:AnimateSequence("ProgressionSummary")
		var_24_14:AnimateSequence("ProgressionSummary")
		var_24_18:AnimateSequence("ProgressionSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("ProgressionSummary")
		end
	end

	var_24_0._sequences.ProgressionSummary = var_24_59

	local var_24_60

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_61 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("ElderProgressionSummary", var_24_61)
	end

	local var_24_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("ElderProgressionSummary", var_24_62)

	local var_24_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("ElderProgressionSummary", var_24_63)

	local var_24_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("ElderProgressionSummary", var_24_64)

	local var_24_65 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("ElderProgressionSummary", var_24_65)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_66 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("ElderProgressionSummary", var_24_66)
	end

	local function var_24_67()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("ElderProgressionSummary")
		end

		var_24_10:AnimateSequence("ElderProgressionSummary")
		var_24_12:AnimateSequence("ElderProgressionSummary")
		var_24_14:AnimateSequence("ElderProgressionSummary")
		var_24_18:AnimateSequence("ElderProgressionSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("ElderProgressionSummary")
		end
	end

	var_24_0._sequences.ElderProgressionSummary = var_24_67

	local var_24_68

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_69 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("AchievementsSummary", var_24_69)
	end

	local var_24_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("AchievementsSummary", var_24_70)

	local var_24_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("AchievementsSummary", var_24_71)

	local var_24_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("AchievementsSummary", var_24_72)

	local var_24_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("AchievementsSummary", var_24_73)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("AchievementsSummary", var_24_74)
	end

	local function var_24_75()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("AchievementsSummary")
		end

		var_24_10:AnimateSequence("AchievementsSummary")
		var_24_12:AnimateSequence("AchievementsSummary")
		var_24_14:AnimateSequence("AchievementsSummary")
		var_24_18:AnimateSequence("AchievementsSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("AchievementsSummary")
		end
	end

	var_24_0._sequences.AchievementsSummary = var_24_75

	local var_24_76

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("IntelSummary", var_24_77)
	end

	local var_24_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("IntelSummary", var_24_78)

	local var_24_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("IntelSummary", var_24_79)

	local var_24_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("IntelSummary", var_24_80)

	local var_24_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("IntelSummary", var_24_81)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_82 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("IntelSummary", var_24_82)
	end

	local function var_24_83()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("IntelSummary")
		end

		var_24_10:AnimateSequence("IntelSummary")
		var_24_12:AnimateSequence("IntelSummary")
		var_24_14:AnimateSequence("IntelSummary")
		var_24_18:AnimateSequence("IntelSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("IntelSummary")
		end
	end

	var_24_0._sequences.IntelSummary = var_24_83

	local var_24_84

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_85 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("HideStatsSummary", var_24_85)
	end

	local var_24_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("HideStatsSummary", var_24_86)

	local var_24_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("HideStatsSummary", var_24_87)

	local var_24_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("HideStatsSummary", var_24_88)

	local var_24_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("HideStatsSummary", var_24_89)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_90 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("HideStatsSummary", var_24_90)
	end

	local function var_24_91()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("HideStatsSummary")
		end

		var_24_10:AnimateSequence("HideStatsSummary")
		var_24_12:AnimateSequence("HideStatsSummary")
		var_24_14:AnimateSequence("HideStatsSummary")
		var_24_18:AnimateSequence("HideStatsSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("HideStatsSummary")
		end
	end

	var_24_0._sequences.HideStatsSummary = var_24_91

	local var_24_92

	if CONDITIONS.InFrontendPublicMP(var_24_0) then
		local var_24_93 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_8:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_24_93)
	end

	local var_24_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_10:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_24_94)

	local var_24_95 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_12:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_24_95)

	local var_24_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_24_96)

	local var_24_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_24_97)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
		local var_24_98 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_19:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_24_98)
	end

	local function var_24_99()
		if CONDITIONS.InFrontendPublicMP(var_24_0) then
			var_24_8:AnimateSequence("ShowGestureAndSprayPanel")
		end

		var_24_10:AnimateSequence("ShowGestureAndSprayPanel")
		var_24_12:AnimateSequence("ShowGestureAndSprayPanel")
		var_24_14:AnimateSequence("ShowGestureAndSprayPanel")
		var_24_18:AnimateSequence("ShowGestureAndSprayPanel")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_24_0) then
			var_24_19:AnimateSequence("ShowGestureAndSprayPanel")
		end
	end

	var_24_0._sequences.ShowGestureAndSprayPanel = var_24_99

	var_0_5(var_24_0, var_24_1, arg_24_1)
	ACTIONS.AnimateSequence(var_24_0, "DefaultSequence")

	return var_24_0
end

MenuBuilder.registerType("MPBarracksMenu", MPBarracksMenu)
LockTable(_M)
