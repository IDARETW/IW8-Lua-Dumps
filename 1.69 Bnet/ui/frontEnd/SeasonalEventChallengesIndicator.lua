module(..., package.seeall)

local var_0_0 = 20
local var_0_1 = 15
local var_0_2 = 4

local function var_0_3(arg_1_0, arg_1_1)
	if not arg_1_1 then
		return false
	end

	if arg_1_1.locationString and #arg_1_1.locationString > 0 then
		arg_1_0.Name:setText(Engine.CBBHFCGDIC(arg_1_1.locationString, arg_1_1.targetProgress))
	else
		return false
	end

	if SEASONAL_EVENT.IsUsingGameSourceChallengeTitles() then
		if arg_1_1.gameSource then
			local var_1_0 = LUI.GetGameSourceLocalizedNameByGameSourceID(arg_1_1.gameSource)

			arg_1_0.RewardName:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/GAMESOURCE_CHALLENGE_TITLE", var_1_0)))
		end
	elseif arg_1_1.challengeRef and #arg_1_1.challengeRef > 0 then
		local var_1_1 = Challenge.GetNameFromRef(arg_1_1.challengeRef, Challenge.Type.MISC)

		arg_1_0.RewardName:setText(var_1_1)
	end

	local var_1_2 = arg_1_1.lootData

	if var_1_2 then
		local var_1_3 = tonumber(var_1_2.rarity)
		local var_1_4 = LOOT.GetLootQualityString(var_1_3)
		local var_1_5 = LOOT.GetRarityColor(var_1_3)
		local var_1_6 = LOOT.GetRarityImage(var_1_3)
		local var_1_7 = LOOT.GetItemClassName(var_1_2.type, var_1_2.ref, var_1_2.ID)

		if var_1_4 and #var_1_4 > 0 and var_1_7 and #var_1_7 > 0 then
			arg_1_0.RewardInfo:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE", var_1_4, var_1_7))
			arg_1_0.RewardInfo:SetRGBFromTable(var_1_5)
		end

		if arg_1_0.RarityIcon and var_1_6 and var_1_6 ~= "" then
			local var_1_8 = RegisterMaterial(var_1_6)

			arg_1_0.RarityIcon:setImage(var_1_8)
			LOOT.ApplyRarityIconColoring(arg_1_0.RarityIcon, var_1_3)
		end
	else
		return false
	end

	if arg_1_1.maxValue and arg_1_1.currentValue and arg_1_1.maxValue > 0 then
		arg_1_0.ProgressDesc:setText(FormatLargeNumberForCurrentLanguage(arg_1_1.currentValue) .. "/" .. FormatLargeNumberForCurrentLanguage(arg_1_1.maxValue))
		arg_1_0.Progress:SetProgress(arg_1_1.currentValue / arg_1_1.maxValue)
		arg_1_0.Progress:SetAlpha(1)
	else
		arg_1_0.Progress:SetAlpha(0)
	end

	if arg_1_0.SnipeIcon and arg_1_1.gameSource then
		arg_1_0.SnipeIcon:UpdateSnipeIcon({
			selected = true,
			gameSourceID = arg_1_1.gameSource
		})
	end

	if arg_1_0.XPReward and arg_1_1.challengeRef and arg_1_1.challengeRef ~= "" then
		local var_1_9 = Challenge.GetIDFromRef(arg_1_1.challengeRef, Challenge.Type.MISC)
		local var_1_10 = Challenge.GetXPReward(var_1_9, Challenge.Type.MISC)

		arg_1_0.XPReward.XPAmount:setText(var_1_10)
	end

	if arg_1_0._sequences and not arg_1_0._sequences[SEASONAL_EVENT.GetCurrentInitSetupSequenceName()] then
		ACTIONS.AnimateSequence(arg_1_0, arg_1_1.isComplete and "ShowComplete" or "ShowIncomplete")
	else
		ACTIONS.AnimateSequence(arg_1_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())
		ACTIONS.AnimateSequence(arg_1_0, arg_1_1.isComplete and "ChallengeComplete" or "ChallengeIncomplete")
	end

	return true
end

local function var_0_4(arg_2_0)
	if arg_2_0.Name then
		arg_2_0.Name:SetDecodeParams(var_0_0, var_0_1, var_0_2)
	end
end

local function var_0_5(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetData = var_0_3

	ACTIONS.AnimateSequence(arg_3_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())
	SEASONAL_EVENT.RegisterElementToModAnimEvent(arg_3_0)

	if SEASONAL_EVENT.IsSeasonalEventUsingDecodeChallengeText() then
		var_0_4(arg_3_0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function SeasonalEventChallengesIndicator(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 200 * _1080p)

	var_4_0.id = "SeasonalEventChallengesIndicator"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_4_4:SetAlpha(0.95, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 4, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Name"

	var_4_6:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 390, _1080p * 4, _1080p * 22)
	var_4_0:addElement(var_4_6)

	var_4_0.Name = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "RewardInfo"

	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_8:SetStartupDelay(2000)
	var_4_8:SetLineHoldTime(400)
	var_4_8:SetAnimMoveTime(2000)
	var_4_8:SetAnimMoveSpeed(50)
	var_4_8:SetEndDelay(2000)
	var_4_8:SetCrossfadeTime(250)
	var_4_8:SetFadeInTime(300)
	var_4_8:SetFadeOutTime(300)
	var_4_8:SetMaxVisibleLines(1)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 390, _1080p * 30, _1080p * 66)
	var_4_0:addElement(var_4_8)

	var_4_0.RewardInfo = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "RewardName"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_10:SetStartupDelay(2000)
	var_4_10:SetLineHoldTime(400)
	var_4_10:SetAnimMoveTime(2000)
	var_4_10:SetAnimMoveSpeed(50)
	var_4_10:SetEndDelay(2000)
	var_4_10:SetCrossfadeTime(250)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(1)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 390, _1080p * 48, _1080p * 72)
	var_4_0:addElement(var_4_10)

	var_4_0.RewardName = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Tab"

	var_4_12:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.Tab = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "Progress"

	var_4_14.Overlay:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_4_14.Overlay:SetAlpha(0.5, 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -24, _1080p * -14)
	var_4_0:addElement(var_4_14)

	var_4_0.Progress = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIStyledText.new()

	var_4_16.id = "ProgressDesc"

	var_4_16:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_4_16:setText("1/10", 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_16:SetWordWrap(false)
	var_4_16:SetAlignment(LUI.Alignment.Right)
	var_4_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 344, _1080p * 390, _1080p * -52, _1080p * -28)
	var_4_0:addElement(var_4_16)

	var_4_0.ProgressDesc = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "SnipeIcon"

	var_4_18:SetScale(-0.6, 0)
	var_4_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -199, _1080p * 85, _1080p * -12, _1080p * 60)
	var_4_0:addElement(var_4_18)

	var_4_0.SnipeIcon = var_4_18

	local var_4_19

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Divider") then
		local var_4_20 = {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 1,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		}

		var_4_19 = LUI.UIBorder.new(var_4_20)
		var_4_19.id = "Divider"

		var_4_19:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
		var_4_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 460, _1080p * -23, _1080p * -22)
		var_4_0:addElement(var_4_19)

		var_4_0.Divider = var_4_19
	end

	local var_4_21

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Border0") then
		local var_4_22 = {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 1,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		}

		var_4_21 = LUI.UIBorder.new(var_4_22)
		var_4_21.id = "Border0"

		var_4_21:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
		var_4_21:SetAlpha(0, 0)
		var_4_21:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 50, _1080p * -20)
		var_4_0:addElement(var_4_21)

		var_4_0.Border0 = var_4_21
	end

	local var_4_23
	local var_4_24 = LUI.UIImage.new()

	var_4_24.id = "RarityIcon"

	var_4_24:setImage(RegisterMaterial("icon_rarity_1"), 0)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -16, _1080p * 10, _1080p * 4, _1080p * 26)
	var_4_0:addElement(var_4_24)

	var_4_0.RarityIcon = var_4_24

	local var_4_25

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_4_0, "XPReward") then
		var_4_25 = MenuBuilder.BuildRegisteredType("SeasonalEventXPCard", {
			controllerIndex = var_4_1
		})
		var_4_25.id = "XPReward"

		var_4_25:SetScale(-0.5, 0)
		var_4_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 278, _1080p * 428, _1080p * 26, _1080p * 215)
		var_4_0:addElement(var_4_25)

		var_4_0.XPReward = var_4_25
	end

	local var_4_26

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "IconChallenge") then
		var_4_26 = LUI.UIImage.new()
		var_4_26.id = "IconChallenge"

		var_4_26:SetRGBFromTable(SWATCHES.EventPromos.AtlantisDarkRed, 0)
		var_4_26:SetAlpha(0, 0)
		var_4_26:setImage(RegisterMaterial("ui_mp_br_splash_banner_lep"), 0)
		var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 61, _1080p * 12, _1080p * 60)
		var_4_0:addElement(var_4_26)

		var_4_0.IconChallenge = var_4_26
	end

	local function var_4_27()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_27

	local var_4_28
	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowIncomplete", var_4_29)

	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ShowIncomplete", var_4_30)

	local function var_4_31()
		var_4_14:AnimateSequence("ShowIncomplete")
		var_4_16:AnimateSequence("ShowIncomplete")
	end

	var_4_0._sequences.ShowIncomplete = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.OutbreakRed
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		}
	}

	var_4_12:RegisterAnimationSequence("ModCW", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar,
			child = var_4_0.Progress.Fill
		}
	}

	var_4_14:RegisterAnimationSequence("ModCW", var_4_34)

	local function var_4_35()
		var_4_12:AnimateSequence("ModCW")
		var_4_14:AnimateSequence("ModCW")
	end

	var_4_0._sequences.ModCW = var_4_35

	local var_4_36
	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.OutbreakBlue
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		}
	}

	var_4_12:RegisterAnimationSequence("ModWZ", var_4_37)

	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare,
			child = var_4_0.Progress.Fill
		}
	}

	var_4_14:RegisterAnimationSequence("ModWZ", var_4_38)

	local function var_4_39()
		var_4_12:AnimateSequence("ModWZ")
		var_4_14:AnimateSequence("ModWZ")
	end

	var_4_0._sequences.ModWZ = var_4_39

	local var_4_40
	local var_4_41 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
		}
	}

	var_4_4:RegisterAnimationSequence("SetupSeasonalEvent", var_4_41)

	local var_4_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 454
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		}
	}

	var_4_6:RegisterAnimationSequence("SetupSeasonalEvent", var_4_42)

	local var_4_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		}
	}

	var_4_8:RegisterAnimationSequence("SetupSeasonalEvent", var_4_43)

	local var_4_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 104
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		}
	}

	var_4_10:RegisterAnimationSequence("SetupSeasonalEvent", var_4_44)

	local var_4_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_4_12:RegisterAnimationSequence("SetupSeasonalEvent", var_4_45)

	local var_4_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 454
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 182
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor,
			child = var_4_0.Progress.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder,
			child = var_4_0.Progress.Overlay
		}
	}

	var_4_14:RegisterAnimationSequence("SetupSeasonalEvent", var_4_46)

	local var_4_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 407
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 454
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 181
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_4_16:RegisterAnimationSequence("SetupSeasonalEvent", var_4_47)

	local var_4_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("SetupSeasonalEvent", var_4_48)

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Divider") then
		local var_4_49 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 96
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 626
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -48
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -80
			}
		}

		var_4_19:RegisterAnimationSequence("SetupSeasonalEvent", var_4_49)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Border0") then
		local var_4_50 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 20
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -20
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -20
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 49
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.TabMenuNoFocus
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			}
		}

		var_4_21:RegisterAnimationSequence("SetupSeasonalEvent", var_4_50)
	end

	local var_4_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 132
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 520
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 474
		}
	}

	var_4_24:RegisterAnimationSequence("SetupSeasonalEvent", var_4_51)

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_4_0, "XPReward") then
		local var_4_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = -0.44,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 406
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 32
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 557
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 226
			}
		}

		var_4_25:RegisterAnimationSequence("SetupSeasonalEvent", var_4_52)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "IconChallenge") then
		local var_4_53 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 25
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 10
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 73
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 58
			}
		}

		var_4_26:RegisterAnimationSequence("SetupSeasonalEvent", var_4_53)
	end

	local function var_4_54()
		var_4_4:AnimateSequence("SetupSeasonalEvent")
		var_4_6:AnimateSequence("SetupSeasonalEvent")
		var_4_8:AnimateSequence("SetupSeasonalEvent")
		var_4_10:AnimateSequence("SetupSeasonalEvent")
		var_4_12:AnimateSequence("SetupSeasonalEvent")
		var_4_14:AnimateSequence("SetupSeasonalEvent")
		var_4_16:AnimateSequence("SetupSeasonalEvent")
		var_4_18:AnimateSequence("SetupSeasonalEvent")

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Divider") then
			var_4_19:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Border0") then
			var_4_21:AnimateSequence("SetupSeasonalEvent")
		end

		var_4_24:AnimateSequence("SetupSeasonalEvent")

		if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_4_0, "XPReward") then
			var_4_25:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "IconChallenge") then
			var_4_26:AnimateSequence("SetupSeasonalEvent")
		end
	end

	var_4_0._sequences.SetupSeasonalEvent = var_4_54

	local var_4_55
	local var_4_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowComplete", var_4_56)

	local var_4_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE_BATTLEPASS")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonalEventCompleteColor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE_BATTLEPASS")
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ShowComplete", var_4_57)

	local function var_4_58()
		var_4_14:AnimateSequence("ShowComplete")
		var_4_16:AnimateSequence("ShowComplete")
	end

	var_4_0._sequences.ShowComplete = var_4_58

	local var_4_59
	local var_4_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_60)

	local function var_4_61()
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_61

	local var_4_62
	local var_4_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventAltColor,
			child = var_4_0.Progress.Fill
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ChallengeComplete", var_4_63)

	local var_4_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE_BATTLEPASS")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		}
	}

	var_4_16:RegisterAnimationSequence("ChallengeComplete", var_4_64)

	local function var_4_65()
		var_4_14:AnimateSequence("ChallengeComplete")
		var_4_16:AnimateSequence("ChallengeComplete")
	end

	var_4_0._sequences.ChallengeComplete = var_4_65

	local var_4_66
	local var_4_67 = {
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ChallengeIncomplete", var_4_67)

	local var_4_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_4_16:RegisterAnimationSequence("ChallengeIncomplete", var_4_68)

	local function var_4_69()
		var_4_14:AnimateSequence("ChallengeIncomplete")
		var_4_16:AnimateSequence("ChallengeIncomplete")
	end

	var_4_0._sequences.ChallengeIncomplete = var_4_69

	local var_4_70
	local var_4_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.OutbreakRed
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		}
	}

	var_4_12:RegisterAnimationSequence("ModVA", var_4_71)

	local var_4_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar,
			child = var_4_0.Progress.Fill
		}
	}

	var_4_14:RegisterAnimationSequence("ModVA", var_4_72)

	local function var_4_73()
		var_4_12:AnimateSequence("ModVA")
		var_4_14:AnimateSequence("ModVA")
	end

	var_4_0._sequences.ModVA = var_4_73

	var_0_5(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonalEventChallengesIndicator", SeasonalEventChallengesIndicator)
LockTable(_M)
