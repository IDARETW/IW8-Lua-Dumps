module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if CONDITIONS.IsClanUIEnabled() then
		arg_1_0.BarracksCustomizeSummary.ActiveClanTagBacker:SetAlpha(arg_1_1 and 0.5 or 0)
		arg_1_0.BarracksCustomizeSummary.ActiveClanTag:SetAlpha(arg_1_1 and 1 or 0)
		arg_1_0.BarracksCustomizeSummary.ActiveClanTagTitle:SetAlpha(arg_1_1 and 1 or 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.BarracksCustomizeSummary.ClanTagBacker:SetAlpha(arg_2_1 and 0.5 or 0)
	arg_2_0.BarracksCustomizeSummary.ClanTag:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.BarracksCustomizeSummary.ClanTagTitle:SetAlpha(arg_2_1 and 1 or 0)
end

local function var_0_2(arg_3_0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTagEquippedIcon:SetAlpha(0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTag:SetAlpha(0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTagBacker:SetAlpha(0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTagTitle:SetAlpha(0)
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = EmblemEditorUtils.IsClanEmblemEnabled(arg_4_1)

	arg_4_0.BarracksCustomizeSummary.ClanEmblem:SetAlpha(var_4_0 and 1 or 0)
	arg_4_0.BarracksCustomizeSummary.Emblem:SetAlpha(var_4_0 and 0 or 1)
end

local function var_0_4(arg_5_0, arg_5_1)
	if Engine.DIHDIGEBJF(arg_5_0._controllerIndex) == ClanTagType.CUSTOM then
		var_0_1(arg_5_0, true)
		var_0_0(arg_5_0, false)
	else
		var_0_1(arg_5_0, false)
		var_0_0(arg_5_0, true)
	end

	ACTIONS.AnimateSequence(arg_5_0, "CustomizeSummary")
	ACTIONS.AnimateSequence(arg_5_0.BarracksCustomizeSummary, CONDITIONS.IsOnlineAndSignedIn(arg_5_0._controllerIndex) and arg_5_1 or "ShowSpraysGestures")

	if arg_5_1 == "ShowAll" then
		var_0_3(arg_5_0, arg_5_0._controllerIndex)
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0._switchClanTagEnabled = false
end

local function var_0_6(arg_7_0, arg_7_1)
	if arg_7_1 and arg_7_0._buttonScheme[arg_7_1] and arg_7_0._buttonScheme:GetIndexForElement(arg_7_0._buttonScheme[arg_7_1]) then
		arg_7_0._buttonScheme:processEvent({
			name = "lose_focus"
		})
		arg_7_0._buttonScheme[arg_7_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	local var_8_0 = LOOT.IsCategoryNew(arg_8_1, LOOT.itemTypes.PLAYERCARD)
	local var_8_1 = LOOT.IsCategoryNew(arg_8_1, LOOT.itemTypes.EMBLEM)
	local var_8_2 = LOOT.IsCategoryNew(arg_8_1, LOOT.itemTypes.SPRAYS)
	local var_8_3 = LOOT.IsCategoryNew(arg_8_1, LOOT.itemTypes.GESTURES)

	if CONDITIONS.IsNewBarracksIdentityEnabled() and CONDITIONS.IsCoreMultiplayerNotBr() then
		arg_8_0.MPBarracksMenuButtons.EmblemsButton:UpdateNewItemNotification(var_8_1 and 1 or 0)
		arg_8_0.MPBarracksMenuButtons.CallingCardsButton:UpdateNewItemNotification(var_8_0 and 1 or 0)

		local var_8_4 = var_8_2 or var_8_3

		arg_8_0.MPBarracksMenuButtons.RadialButton:UpdateNewItemNotification(var_8_4 and 1 or 0)
	else
		local var_8_5 = var_8_0 or var_8_1 or var_8_2 or var_8_3

		arg_8_0._buttonScheme.CustomizeButton:UpdateNewItemNotification(var_8_5 and 1 or 0)
	end
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.MPBarracksMenuButtons then
		arg_9_0._buttonScheme = arg_9_0.MPBarracksMenuButtons
	else
		arg_9_0._buttonScheme = arg_9_0.WZBarracksMenuButtons
	end

	assert(arg_9_0._buttonScheme.RecordsButton)

	if CONDITIONS.IsMPIntelMenuEnabled(arg_9_0) then
		assert(arg_9_0._buttonScheme.IntelButton)
	end

	arg_9_0.FocusButtonByName = var_0_6
	arg_9_0._controllerIndex = arg_9_1

	PROGRESSION.PrestreamRankUnlocksIcons(arg_9_0, arg_9_1)

	local function var_9_0()
		if not arg_9_0.BarracksChallengesSummary.initialized then
			arg_9_0.BarracksChallengesSummary:InitializeData(arg_9_1)
		end

		ACTIONS.AnimateSequence(arg_9_0, "ChallengesSummary")
	end

	local function var_9_1()
		var_0_4(arg_9_0, "ShowAll")
	end

	local function var_9_2()
		if not CONDITIONS.IsMagmaGameMode() then
			ACTIONS.AnimateSequence(arg_9_0, "StatsSummary")
		else
			ACTIONS.AnimateSequence(arg_9_0, "HideStatsSummary")
		end
	end

	local function var_9_3()
		ACTIONS.AnimateSequence(arg_9_0, "ProgressionSummary")
	end

	local function var_9_4()
		if Engine.CGABICJHAI() then
			assert(arg_9_0._buttonScheme.AchievementButton)
			ACTIONS.AnimateSequence(arg_9_0, "AchievementsSummary")
		end
	end

	local function var_9_5()
		ACTIONS.AnimateSequence(arg_9_0, "IntelSummary")
	end

	if arg_9_0._buttonScheme.ChallengesButton then
		arg_9_0._buttonScheme.ChallengesButton:addEventHandler("button_over", var_9_0)
		arg_9_0._buttonScheme.ChallengesButton:addEventHandler("button_over_disable", var_9_0)
	end

	if arg_9_0._buttonScheme.ProgressionButton then
		arg_9_0._buttonScheme.ProgressionButton:addEventHandler("button_over", var_9_3)
	end

	if arg_9_0._buttonScheme.CustomizeButton then
		arg_9_0._buttonScheme.CustomizeButton:addEventHandler("button_over", var_9_1)
	end

	arg_9_0._buttonScheme.RecordsButton:addEventHandler("button_over", var_9_2)

	if CONDITIONS.IsMPIntelMenuEnabled(arg_9_0) then
		arg_9_0._buttonScheme.IntelButton:addEventHandler("button_over", var_9_5)
	end

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		if arg_9_0.MPBarracksMenuButtons.ClanTagButton then
			arg_9_0._switchClanTagEnabled = false
			arg_9_0._currentClanTagType = FRIENDS.GetCurrentClanTagType(arg_9_1)

			arg_9_0:addEventHandler("text_input_complete", function(arg_16_0, arg_16_1)
				if arg_16_1.text then
					Engine.IIEFBGGGA(arg_9_1, arg_16_1.text)
				end
			end)
			arg_9_0:addEventHandler("update_clan_tag_type", function(arg_17_0, arg_17_1)
				arg_9_0._currentClanTagType = arg_17_1.clanTagType

				var_0_5(arg_9_0, arg_9_1)
			end)
			arg_9_0.MPBarracksMenuButtons.ClanTagButton:addEventHandler("button_over", function(arg_18_0, arg_18_1)
				if CONDITIONS.IsSystemLink(arg_9_0) then
					var_0_4(arg_9_0, "ShowCustomClanTagTopLeft")
				else
					var_0_4(arg_9_0, "ShowClanTags")

					if not CONDITIONS.IsClanUIEnabled() then
						var_0_2(arg_9_0)
					end

					arg_9_0.BarracksCustomizeSummary:UpdateClanTagType(arg_9_0._currentClanTagType)
					var_0_5(arg_9_0, arg_9_1)
				end
			end)
			arg_9_0.MPBarracksMenuButtons.ClanTagButton:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
				var_0_4(arg_9_0, "ShowSpraysGestures")
			end)
			arg_9_0.MPBarracksMenuButtons.ClanTagButton:addEventHandler("button_up", function(arg_20_0, arg_20_1)
				if LUI.IsLastInputGamepad(arg_9_1) then
					arg_9_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(0)

					arg_9_0._switchClanTagEnabled = false
				end
			end)
		end

		if arg_9_0.MPBarracksMenuButtons.CallingCardsButton then
			arg_9_0.MPBarracksMenuButtons.CallingCardsButton:addEventHandler("button_over", function(arg_21_0, arg_21_1)
				var_0_4(arg_9_0, "ShowCallingCard")
			end)
			arg_9_0.MPBarracksMenuButtons.CallingCardsButton:addEventHandler("button_over_disable", function(arg_22_0, arg_22_1)
				var_0_4(arg_9_0, "ShowSpraysGestures")
			end)
		end

		if arg_9_0.MPBarracksMenuButtons.EmblemsButton then
			arg_9_0.MPBarracksMenuButtons.EmblemsButton:addEventHandler("button_over", function(arg_23_0, arg_23_1)
				var_0_4(arg_9_0, "ShowEmblem")
			end)
			arg_9_0.MPBarracksMenuButtons.EmblemsButton:addEventHandler("button_over_disable", function(arg_24_0, arg_24_1)
				var_0_4(arg_9_0, "ShowSpraysGestures")
			end)
		end

		if arg_9_0.MPBarracksMenuButtons.RadialButton then
			arg_9_0.MPBarracksMenuButtons.RadialButton:addEventHandler("button_over", function(arg_25_0, arg_25_1)
				ACTIONS.AnimateSequence(arg_9_0, "ShowGestureAndSprayPanel")
			end)
		end
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_9_0)

		if not Onboarding.BarracksCH2WZEquip.WasCompleted(arg_9_0, arg_9_1) then
			LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingpopup", true, arg_9_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingCH2WZBarracksEquipData())
			Onboarding.BarracksCH2WZEquip.MarkCompleted(arg_9_0, arg_9_0._controllerIndex)
		end
	elseif not Onboarding.BarracksCH2MWEquip.WasCompleted(arg_9_0, arg_9_1) then
		if not Engine.CHBHFFFIGH() and not Engine.EAABDHIDFJ() then
			if not Engine.CHDGBEFDHB() then
				LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingpopup", true, arg_9_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingCH2MWBarracksEquipData())
			else
				LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingpopup", true, arg_9_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingCH2MWLazeBarracksEquipData())
			end
		end

		Onboarding.BarracksCH2MWEquip.MarkCompleted(arg_9_0, arg_9_0._controllerIndex)
	end

	var_0_7(arg_9_0, arg_9_1)

	local var_9_6 = LUI.UIBindButton.new()

	var_9_6.id = "bindButton"

	arg_9_0:addElement(var_9_6)

	arg_9_0.bindButton = var_9_6

	arg_9_0.bindButton:addEventHandler("button_left_stick", function(arg_26_0, arg_26_1)
		if Dvar.IBEGCHEFE("MOSNKSLTKM") then
			local var_26_0 = arg_26_0:getParent()

			if var_26_0 then
				LOOT.ClearBarracksBreadcrumbs(var_26_0, var_26_0._buttonScheme, arg_26_1.controller)
			end

			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
			arg_9_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_l3",
				helper_text = ""
			})
		end
	end)
	arg_9_0.bindButton:addEventHandler("button_alt1", function(arg_27_0, arg_27_1)
		if arg_9_0._switchClanTagEnabled then
			local var_27_0 = arg_9_0._currentClanTagType == ClanTagType.CUSTOM and ClanTagType.OFFICIAL or ClanTagType.CUSTOM

			Engine.GGIHFEAGD(arg_9_1, var_27_0)

			arg_9_0._currentClanTagType = var_27_0

			Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		end
	end)

	if Engine.CGABICJHAI() then
		arg_9_0._buttonScheme.AchievementButton:addEventHandler("button_over", var_9_4)
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	local function var_9_7()
		local var_28_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_9_0.Darken:SetScale(var_28_0)
	end

	arg_9_0:addAndCallEventHandler("onVideoChange", var_9_7)

	local var_9_8 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_9_9()
		local var_29_0 = var_9_8:GetValue(arg_9_1) or Engine.IJEBHJIJF()

		if Engine.JEDFGECDJ() > 1 then
			arg_9_0.BarracksCustomizeSummary:SetData(var_29_0)

			if arg_9_0.BarracksStatsSummary then
				arg_9_0.BarracksStatsSummary:SetData(var_29_0)
			end
		end
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_9_0, "WZWipSetup")
	end

	arg_9_0:SubscribeToModel(var_9_8:GetModel(arg_9_1), var_9_9)
end

function MPBarracksMenu(arg_30_0, arg_30_1)
	local var_30_0 = LUI.UIVerticalNavigator.new()

	var_30_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_30_0.id = "MPBarracksMenu"
	var_30_0._animationSets = var_30_0._animationSets or {}
	var_30_0._sequences = var_30_0._sequences or {}

	local var_30_1 = arg_30_1 and arg_30_1.controllerIndex

	if not var_30_1 and not Engine.DDJFBBJAIG() then
		var_30_1 = var_30_0:getRootController()
	end

	assert(var_30_1)

	local var_30_2 = var_30_0
	local var_30_3
	local var_30_4 = {
		worldBlur = 1,
		controllerIndex = var_30_1
	}
	local var_30_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_30_4)

	var_30_5.id = "WorldBlur"

	var_30_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_30_0:addElement(var_30_5)

	var_30_0.WorldBlur = var_30_5

	local var_30_6
	local var_30_7 = LUI.UIImage.new()

	var_30_7.id = "Darken"

	var_30_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_30_7:SetAlpha(0.5, 0)
	var_30_0:addElement(var_30_7)

	var_30_0.Darken = var_30_7

	local var_30_8

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_30_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
			controllerIndex = var_30_1
		})

		var_30_9.id = "Vignette"

		var_30_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		var_30_0:addElement(var_30_9)

		var_30_0.Vignette = var_30_9
	end

	local var_30_10

	if CONDITIONS.InFrontendPublicMP() then
		var_30_10 = MenuBuilder.BuildRegisteredType("BarracksStatsSummary", {
			controllerIndex = var_30_1
		})
		var_30_10.id = "BarracksStatsSummary"

		var_30_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1824, _1080p * 200, _1080p * 885)
		var_30_0:addElement(var_30_10)

		var_30_0.BarracksStatsSummary = var_30_10
	end

	local var_30_11
	local var_30_12 = MenuBuilder.BuildRegisteredType("UnlocksRankPanel", {
		controllerIndex = var_30_1
	})

	var_30_12.id = "BarracksProgressionSummary"

	var_30_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 599, _1080p * 1029, _1080p * 200, _1080p * 959)
	var_30_0:addElement(var_30_12)

	var_30_0.BarracksProgressionSummary = var_30_12

	local var_30_13
	local var_30_14 = MenuBuilder.BuildRegisteredType("BarracksCustomizeSummary", {
		controllerIndex = var_30_1
	})

	var_30_14.id = "BarracksCustomizeSummary"

	var_30_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1625, _1080p * 200, _1080p * 859)
	var_30_0:addElement(var_30_14)

	var_30_0.BarracksCustomizeSummary = var_30_14

	local var_30_15

	if not CONDITIONS.IsChallengeTabEnabled() then
		var_30_15 = MenuBuilder.BuildRegisteredType("BarracksChallengesSummary", {
			controllerIndex = var_30_1
		})
		var_30_15.id = "BarracksChallengesSummary"

		var_30_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1664, _1080p * 200, _1080p * 976)
		var_30_0:addElement(var_30_15)

		var_30_0.BarracksChallengesSummary = var_30_15
	end

	local var_30_16
	local var_30_17 = MenuBuilder.BuildRegisteredType("ElderProgressionRankPanel", {
		controllerIndex = var_30_1
	})

	var_30_17.id = "ElderProgressionRankPanel"

	var_30_17.CurRankTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_RANK"), 0)
	var_30_17:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 604, _1080p * -886, _1080p * 200, _1080p * -121)
	var_30_0:addElement(var_30_17)

	var_30_0.ElderProgressionRankPanel = var_30_17

	local var_30_18

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		var_30_18 = MenuBuilder.BuildRegisteredType("GestureAndSprayPanel", {
			controllerIndex = var_30_1
		})
		var_30_18.id = "GestureAndSprayPanel"

		var_30_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1604, _1080p * 200, _1080p * 755)
		var_30_0:addElement(var_30_18)

		var_30_0.GestureAndSprayPanel = var_30_18
	end

	local var_30_19

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		var_30_19 = MenuBuilder.BuildRegisteredType("WZBarracksMenuButtons", {
			controllerIndex = var_30_1
		})
		var_30_19.id = "WZBarracksMenuButtons"

		var_30_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 583, _1080p * 230, _1080p * 830)
		var_30_0:addElement(var_30_19)

		var_30_0.WZBarracksMenuButtons = var_30_19
	end

	local var_30_20

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_30_21 = MenuBuilder.BuildRegisteredType("MPBarracksMenuButtons", {
			controllerIndex = var_30_1
		})

		var_30_21.id = "MPBarracksMenuButtons"

		var_30_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 583, _1080p * 185, _1080p * 785)
		var_30_0:addElement(var_30_21)

		var_30_0.MPBarracksMenuButtons = var_30_21
	end

	local var_30_22

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("DefaultSequence", var_30_23)
	end

	local var_30_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("DefaultSequence", var_30_24)

	local var_30_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("DefaultSequence", var_30_25)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("DefaultSequence", var_30_26)
	end

	local var_30_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("DefaultSequence", var_30_27)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("DefaultSequence", var_30_28)
	end

	local function var_30_29()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("DefaultSequence")
		end

		var_30_12:AnimateSequence("DefaultSequence")
		var_30_14:AnimateSequence("DefaultSequence")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("DefaultSequence")
		end

		var_30_17:AnimateSequence("DefaultSequence")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("DefaultSequence")
		end
	end

	var_30_0._sequences.DefaultSequence = var_30_29

	local var_30_30

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("ChallengesSummary", var_30_31)
	end

	local var_30_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("ChallengesSummary", var_30_32)

	local var_30_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("ChallengesSummary", var_30_33)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_34 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("ChallengesSummary", var_30_34)
	end

	local var_30_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("ChallengesSummary", var_30_35)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("ChallengesSummary", var_30_36)
	end

	local function var_30_37()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("ChallengesSummary")
		end

		var_30_12:AnimateSequence("ChallengesSummary")
		var_30_14:AnimateSequence("ChallengesSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("ChallengesSummary")
		end

		var_30_17:AnimateSequence("ChallengesSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("ChallengesSummary")
		end
	end

	var_30_0._sequences.ChallengesSummary = var_30_37

	local var_30_38

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("CustomizeSummary", var_30_39)
	end

	local var_30_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("CustomizeSummary", var_30_40)

	local var_30_41 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("CustomizeSummary", var_30_41)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_42 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("CustomizeSummary", var_30_42)
	end

	local var_30_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("CustomizeSummary", var_30_43)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("CustomizeSummary", var_30_44)
	end

	local function var_30_45()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("CustomizeSummary")
		end

		var_30_12:AnimateSequence("CustomizeSummary")
		var_30_14:AnimateSequence("CustomizeSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("CustomizeSummary")
		end

		var_30_17:AnimateSequence("CustomizeSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("CustomizeSummary")
		end
	end

	var_30_0._sequences.CustomizeSummary = var_30_45

	local var_30_46

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_47 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("StatsSummary", var_30_47)
	end

	local var_30_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("StatsSummary", var_30_48)

	local var_30_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("StatsSummary", var_30_49)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_50 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("StatsSummary", var_30_50)
	end

	local var_30_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("StatsSummary", var_30_51)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("StatsSummary", var_30_52)
	end

	local function var_30_53()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("StatsSummary")
		end

		var_30_12:AnimateSequence("StatsSummary")
		var_30_14:AnimateSequence("StatsSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("StatsSummary")
		end

		var_30_17:AnimateSequence("StatsSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("StatsSummary")
		end
	end

	var_30_0._sequences.StatsSummary = var_30_53

	local var_30_54

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_55 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("ProgressionSummary", var_30_55)
	end

	local var_30_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 989
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("ProgressionSummary", var_30_56)

	local var_30_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("ProgressionSummary", var_30_57)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_58 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("ProgressionSummary", var_30_58)
	end

	local var_30_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("ProgressionSummary", var_30_59)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_60 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("ProgressionSummary", var_30_60)
	end

	local function var_30_61()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("ProgressionSummary")
		end

		var_30_12:AnimateSequence("ProgressionSummary")
		var_30_14:AnimateSequence("ProgressionSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("ProgressionSummary")
		end

		var_30_17:AnimateSequence("ProgressionSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("ProgressionSummary")
		end
	end

	var_30_0._sequences.ProgressionSummary = var_30_61

	local var_30_62

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_63 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("ElderProgressionSummary", var_30_63)
	end

	local var_30_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("ElderProgressionSummary", var_30_64)

	local var_30_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("ElderProgressionSummary", var_30_65)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_66 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("ElderProgressionSummary", var_30_66)
	end

	local var_30_67 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("ElderProgressionSummary", var_30_67)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("ElderProgressionSummary", var_30_68)
	end

	local function var_30_69()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("ElderProgressionSummary")
		end

		var_30_12:AnimateSequence("ElderProgressionSummary")
		var_30_14:AnimateSequence("ElderProgressionSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("ElderProgressionSummary")
		end

		var_30_17:AnimateSequence("ElderProgressionSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("ElderProgressionSummary")
		end
	end

	var_30_0._sequences.ElderProgressionSummary = var_30_69

	local var_30_70

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_71 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("AchievementsSummary", var_30_71)
	end

	local var_30_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("AchievementsSummary", var_30_72)

	local var_30_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("AchievementsSummary", var_30_73)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("AchievementsSummary", var_30_74)
	end

	local var_30_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("AchievementsSummary", var_30_75)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_76 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("AchievementsSummary", var_30_76)
	end

	local function var_30_77()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("AchievementsSummary")
		end

		var_30_12:AnimateSequence("AchievementsSummary")
		var_30_14:AnimateSequence("AchievementsSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("AchievementsSummary")
		end

		var_30_17:AnimateSequence("AchievementsSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("AchievementsSummary")
		end
	end

	var_30_0._sequences.AchievementsSummary = var_30_77

	local var_30_78

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_79 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("IntelSummary", var_30_79)
	end

	local var_30_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("IntelSummary", var_30_80)

	local var_30_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("IntelSummary", var_30_81)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_82 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("IntelSummary", var_30_82)
	end

	local var_30_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("IntelSummary", var_30_83)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_84 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("IntelSummary", var_30_84)
	end

	local function var_30_85()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("IntelSummary")
		end

		var_30_12:AnimateSequence("IntelSummary")
		var_30_14:AnimateSequence("IntelSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("IntelSummary")
		end

		var_30_17:AnimateSequence("IntelSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("IntelSummary")
		end
	end

	var_30_0._sequences.IntelSummary = var_30_85

	local var_30_86

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("HideStatsSummary", var_30_87)
	end

	local var_30_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("HideStatsSummary", var_30_88)

	local var_30_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("HideStatsSummary", var_30_89)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_90 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("HideStatsSummary", var_30_90)
	end

	local var_30_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("HideStatsSummary", var_30_91)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_92 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("HideStatsSummary", var_30_92)
	end

	local function var_30_93()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("HideStatsSummary")
		end

		var_30_12:AnimateSequence("HideStatsSummary")
		var_30_14:AnimateSequence("HideStatsSummary")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("HideStatsSummary")
		end

		var_30_17:AnimateSequence("HideStatsSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("HideStatsSummary")
		end
	end

	var_30_0._sequences.HideStatsSummary = var_30_93

	local var_30_94

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_95 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_10:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_30_95)
	end

	local var_30_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_30_96)

	local var_30_97 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_30_97)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_98 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_15:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_30_98)
	end

	local var_30_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_30_99)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_100 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_30_18:RegisterAnimationSequence("ShowGestureAndSprayPanel", var_30_100)
	end

	local function var_30_101()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("ShowGestureAndSprayPanel")
		end

		var_30_12:AnimateSequence("ShowGestureAndSprayPanel")
		var_30_14:AnimateSequence("ShowGestureAndSprayPanel")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("ShowGestureAndSprayPanel")
		end

		var_30_17:AnimateSequence("ShowGestureAndSprayPanel")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("ShowGestureAndSprayPanel")
		end
	end

	var_30_0._sequences.ShowGestureAndSprayPanel = var_30_101

	local var_30_102

	if CONDITIONS.InFrontendPublicMP() then
		local var_30_103 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 230
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 905
			}
		}

		var_30_10:RegisterAnimationSequence("WZWipSetup", var_30_103)
	end

	local var_30_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 998
		}
	}

	var_30_12:RegisterAnimationSequence("WZWipSetup", var_30_104)

	local var_30_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 889
		}
	}

	var_30_14:RegisterAnimationSequence("WZWipSetup", var_30_105)

	if not CONDITIONS.IsChallengeTabEnabled() then
		local var_30_106 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 230
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 1006
			}
		}

		var_30_15:RegisterAnimationSequence("WZWipSetup", var_30_106)
	end

	local var_30_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -91
		}
	}

	var_30_17:RegisterAnimationSequence("WZWipSetup", var_30_107)

	if CONDITIONS.IsNewBarracksIdentityEnabled() then
		local var_30_108 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 230
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 785
			}
		}

		var_30_18:RegisterAnimationSequence("WZWipSetup", var_30_108)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_30_109 = {}

		var_30_19:RegisterAnimationSequence("WZWipSetup", var_30_109)
	end

	local function var_30_110()
		if CONDITIONS.InFrontendPublicMP() then
			var_30_10:AnimateSequence("WZWipSetup")
		end

		var_30_12:AnimateSequence("WZWipSetup")
		var_30_14:AnimateSequence("WZWipSetup")

		if not CONDITIONS.IsChallengeTabEnabled() then
			var_30_15:AnimateSequence("WZWipSetup")
		end

		var_30_17:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsNewBarracksIdentityEnabled() then
			var_30_18:AnimateSequence("WZWipSetup")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_30_19:AnimateSequence("WZWipSetup")
		end
	end

	var_30_0._sequences.WZWipSetup = var_30_110

	var_0_8(var_30_0, var_30_1, arg_30_1)
	ACTIONS.AnimateSequence(var_30_0, "DefaultSequence")

	return var_30_0
end

MenuBuilder.registerType("MPBarracksMenu", MPBarracksMenu)
LockTable(_M)
