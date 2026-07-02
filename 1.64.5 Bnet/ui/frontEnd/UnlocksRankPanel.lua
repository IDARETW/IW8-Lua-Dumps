module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.RadialProgressBar.Progress:SetRGBFromTable(arg_1_0._displayData._progressionColor)
	arg_1_0.RadialProgressBar:SetProgress(arg_1_0._displayData._rankPercentage)
	arg_1_0.RadialProgressBar.Percent:SetAlpha(0)
	arg_1_0.LevelUpXPDetails:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_REQUIRED_RANK", arg_1_0._displayData._xpForCurrentRank, arg_1_0._displayData._xpTillNextRank))
	arg_1_0.CurRankTitle:setText(ToUpperCase(arg_1_0._displayData._title))
	arg_1_0.CurRankIcon:setImage(RegisterMaterial(arg_1_0._displayData._rankIcon))
	arg_1_0.CurRankValue:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", arg_1_0._displayData._rankDisplay)))
	arg_1_0.CurRankText:setText(arg_1_0._displayData._rankName)

	if arg_1_0._displayData._prestigeMasterLevel ~= PROGRESSION.MASTER_LEVEL.INVALID_LEVEL and PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank(arg_1_0._displayData._rank) then
		arg_1_0.PrestigeMasterRibbon:setImage(RegisterMaterial(arg_1_0._displayData._prestigeMasterRibbon))
		ACTIONS.AnimateSequence(arg_1_0, "ShowPrestigeMaster")
	else
		ACTIONS.AnimateSequence(arg_1_0, "HidePrestigeMaster")
	end

	arg_1_0.CurRankValue:SetRGBFromTable(arg_1_0._displayData._prestigeMasterColor)
	arg_1_0.PrestigeMasterText:SetRGBFromTable(arg_1_0._displayData._prestigeMasterColor)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0._displayData)

	arg_2_0._displayData = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_2_1,
		_rankTypeOverride = PROGRESSION.RANK_TYPES.MILITARY
	})
	arg_2_0._displayData._title = Engine.CBBHFCGDIC("LUA_MENU/MILITARY")

	var_0_0(arg_2_0)

	if arg_2_0._displayData._isUsingSeasonalRank then
		ACTIONS.AnimateSequence(arg_2_0, "HideNextLevelDisplay")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetDisplayMilitaryData = var_0_1
	arg_3_0._displayData = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_3_1
	})
	arg_3_0._displayData._title = arg_3_0._displayData._isUsingSeasonalRank and Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_VALUE", arg_3_0._displayData._prestige) or Engine.CBBHFCGDIC("LUA_MENU/MILITARY")

	ACTIONS.AnimateSequence(arg_3_0.EarnRateBuff, "Show")

	if BATTLEPASS.IsOwned(arg_3_1) then
		ACTIONS.AnimateSequence(arg_3_0.EarnRateBuff, "LabelLeft")
	else
		ACTIONS.AnimateSequence(arg_3_0.EarnRateBuff, "LabelLeftNotOwned")
		ACTIONS.AnimateSequence(arg_3_0, "BattlePassNotOwned")
	end

	var_0_0(arg_3_0)

	if CONDITIONS.IsPostSeason() then
		ACTIONS.AnimateSequence(arg_3_0, "HideBattlePassOwnershipWidget")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	if CONDITIONS.IsLanguageAsian() then
		ACTIONS.AnimateSequence(arg_3_0, "Asian")
	end
end

function UnlocksRankPanel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 788 * _1080p)

	var_4_0.id = "UnlocksRankPanel"
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

	var_4_4.id = "BottomBacking"

	var_4_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, _1080p * 472, _1080p * 518)
	var_4_0:addElement(var_4_4)

	var_4_0.BottomBacking = var_4_4

	local var_4_5
	local var_4_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_7 = LUI.UIBorder.new(var_4_6)

	var_4_7.id = "BottomBorder"

	var_4_7:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_4_7:SetAlpha(0.5, 0)
	var_4_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, _1080p * 472, _1080p * 518)
	var_4_0:addElement(var_4_7)

	var_4_0.BottomBorder = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIImage.new()

	var_4_9.id = "BackingMid"

	var_4_9:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_4_9:SetAlpha(0.5, 0)
	var_4_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, _1080p * 400, _1080p * 462)
	var_4_0:addElement(var_4_9)

	var_4_0.BackingMid = var_4_9

	local var_4_10
	local var_4_11 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_12 = LUI.UIBorder.new(var_4_11)

	var_4_12.id = "BorderMid"

	var_4_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_4_12:SetAlpha(0.5, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, _1080p * 400, _1080p * 462)
	var_4_0:addElement(var_4_12)

	var_4_0.BorderMid = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "BackingTop"

	var_4_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_4_14:SetAlpha(0.5, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, 0, _1080p * 390)
	var_4_0:addElement(var_4_14)

	var_4_0.BackingTop = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "BackingTopHeader"

	var_4_16:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_16:SetAlpha(0.3, 0)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, 0, _1080p * 61)
	var_4_0:addElement(var_4_16)

	var_4_0.BackingTopHeader = var_4_16

	local var_4_17
	local var_4_18 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_19 = LUI.UIBorder.new(var_4_18)

	var_4_19.id = "TopBorder"

	var_4_19:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_4_19:SetAlpha(0.5, 0)
	var_4_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -162, _1080p * 168, 0, _1080p * 390)
	var_4_0:addElement(var_4_19)

	var_4_0.TopBorder = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIText.new()

	var_4_21.id = "NextRankTitle"

	var_4_21:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_4_21:SetAlpha(0.7, 0)
	var_4_21:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEXT_LVL_XP")), 0)
	var_4_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_21:SetAlignment(LUI.Alignment.Center)
	var_4_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -154, _1080p * 154, _1080p * 408, _1080p * 426)
	var_4_0:addElement(var_4_21)

	var_4_0.NextRankTitle = var_4_21

	local var_4_22
	local var_4_23 = LUI.UIText.new()

	var_4_23.id = "LevelUpXPDetails"

	var_4_23:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_4_23:setText("", 0)
	var_4_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_23:SetAlignment(LUI.Alignment.Center)
	var_4_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -154, _1080p * 154, _1080p * 429, _1080p * 453)
	var_4_0:addElement(var_4_23)

	var_4_0.LevelUpXPDetails = var_4_23

	local var_4_24
	local var_4_25 = LUI.UIStyledText.new()

	var_4_25.id = "CurRankText"

	var_4_25:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_4_25:SetAlpha(0.7, 0)
	var_4_25:setText("", 0)
	var_4_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_25:SetAlignment(LUI.Alignment.Center)
	var_4_25:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_25:SetStartupDelay(1000)
	var_4_25:SetLineHoldTime(1000)
	var_4_25:SetAnimMoveTime(1500)
	var_4_25:SetAnimMoveSpeed(500)
	var_4_25:SetEndDelay(1000)
	var_4_25:SetCrossfadeTime(400)
	var_4_25:SetFadeInTime(300)
	var_4_25:SetFadeOutTime(300)
	var_4_25:SetMaxVisibleLines(1)
	var_4_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 155, _1080p * 315, _1080p * 339)
	var_4_0:addElement(var_4_25)

	var_4_0.CurRankText = var_4_25

	local var_4_26
	local var_4_27 = LUI.UIText.new()

	var_4_27.id = "CurRankValue"

	var_4_27:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_27:setText("", 0)
	var_4_27:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_27:SetAlignment(LUI.Alignment.Center)
	var_4_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 155, _1080p * 338, _1080p * 377)
	var_4_0:addElement(var_4_27)

	var_4_0.CurRankValue = var_4_27

	local var_4_28
	local var_4_29 = LUI.UIImage.new()

	var_4_29.id = "CurRankIcon"

	var_4_29:setImage(RegisterMaterial("icon_t9_rank_10"), 0)
	var_4_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -85, _1080p * 85, _1080p * 100, _1080p * 270)
	var_4_0:addElement(var_4_29)

	var_4_0.CurRankIcon = var_4_29

	local var_4_30
	local var_4_31 = LUI.UIText.new()

	var_4_31.id = "CurRankTitle"

	var_4_31:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_4_31:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_RANK"), 0)
	var_4_31:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_31:SetAlignment(LUI.Alignment.Center)
	var_4_31:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -154, _1080p * 154, _1080p * 10, _1080p * 53)
	var_4_0:addElement(var_4_31)

	var_4_0.CurRankTitle = var_4_31

	local var_4_32
	local var_4_33 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_4_1
	})

	var_4_33.id = "EarnRateBuff"

	var_4_33.EarnRate:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_33.EarnRate:SetAlignment(LUI.Alignment.Right)
	var_4_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 185, _1080p * 375, _1080p * 478, _1080p * 510)
	var_4_0:addElement(var_4_33)

	var_4_0.EarnRateBuff = var_4_33

	local var_4_34
	local var_4_35 = {
		Progress_maskMaterial = "career_button_circle_mask",
		Progress_segmentMaterial = "ui_prog_radial_segment",
		controllerIndex = var_4_1
	}
	local var_4_36 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", var_4_35)

	var_4_36.id = "RadialProgressBar"

	var_4_36.Backer:setImage(RegisterMaterial("ui_mp_wz_progress_backer"), 0)
	var_4_36.Progress:setImage(RegisterMaterial("ui_mp_wz_progress_segment"), 0)
	var_4_36:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -110, _1080p * 110, _1080p * 75, _1080p * 295)
	var_4_0:addElement(var_4_36)

	var_4_0.RadialProgressBar = var_4_36

	local var_4_37
	local var_4_38 = LUI.UIImage.new()

	var_4_38.id = "PrestigeMasterRibbon"

	var_4_38:SetAlpha(0, 0)
	var_4_38:setImage(RegisterMaterial("ui_icon_prestige_master_01"), 0)
	var_4_38:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 350, _1080p * 382)
	var_4_0:addElement(var_4_38)

	var_4_0.PrestigeMasterRibbon = var_4_38

	local var_4_39
	local var_4_40 = LUI.UIText.new()

	var_4_40.id = "PrestigeMasterText"

	var_4_40:SetRGBFromTable(SWATCHES.CH2.CH2SeasonMaster, 0)
	var_4_40:SetAlpha(0, 0)
	var_4_40:setText(ToUpperCase(Engine.CBBHFCGDIC("PRESTIGE/PRESTIGE_MASTER")), 0)
	var_4_40:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_40:SetWordWrap(false)
	var_4_40:SetAlignment(LUI.Alignment.Center)
	var_4_40:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_40:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -102, _1080p * 102, _1080p * 332, _1080p * 350)
	var_4_0:addElement(var_4_40)

	var_4_0.PrestigeMasterText = var_4_40

	local function var_4_41()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_41

	local var_4_42
	local var_4_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 429
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 395
		}
	}

	var_4_21:RegisterAnimationSequence("AR", var_4_43)

	local var_4_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 412
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 462
		}
	}

	var_4_23:RegisterAnimationSequence("AR", var_4_44)

	local var_4_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 61
		}
	}

	var_4_31:RegisterAnimationSequence("AR", var_4_45)

	local function var_4_46()
		var_4_21:AnimateSequence("AR")
		var_4_23:AnimateSequence("AR")
		var_4_31:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_46

	local var_4_47
	local var_4_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("HideNextLevelDisplay", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HideNextLevelDisplay", var_4_49)

	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("HideNextLevelDisplay", var_4_50)

	local var_4_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("HideNextLevelDisplay", var_4_51)

	local var_4_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 300
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 270
		}
	}

	var_4_29:RegisterAnimationSequence("HideNextLevelDisplay", var_4_52)

	local function var_4_53()
		var_4_9:AnimateSequence("HideNextLevelDisplay")
		var_4_12:AnimateSequence("HideNextLevelDisplay")
		var_4_21:AnimateSequence("HideNextLevelDisplay")
		var_4_23:AnimateSequence("HideNextLevelDisplay")
		var_4_29:AnimateSequence("HideNextLevelDisplay")
	end

	var_4_0._sequences.HideNextLevelDisplay = var_4_53

	local var_4_54
	local var_4_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		}
	}

	var_4_31:RegisterAnimationSequence("Asian", var_4_55)

	local function var_4_56()
		var_4_31:AnimateSequence("Asian")
	end

	var_4_0._sequences.Asian = var_4_56

	local var_4_57
	local var_4_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZError
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("BattlePassNotOwned", var_4_58)

	local function var_4_59()
		var_4_4:AnimateSequence("BattlePassNotOwned")
	end

	var_4_0._sequences.BattlePassNotOwned = var_4_59

	local var_4_60
	local var_4_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 319
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("ShowPrestigeMaster", var_4_61)

	local var_4_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 333
		}
	}

	var_4_27:RegisterAnimationSequence("ShowPrestigeMaster", var_4_62)

	local var_4_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_38:RegisterAnimationSequence("ShowPrestigeMaster", var_4_63)

	local var_4_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("ShowPrestigeMaster", var_4_64)

	local function var_4_65()
		var_4_25:AnimateSequence("ShowPrestigeMaster")
		var_4_27:AnimateSequence("ShowPrestigeMaster")
		var_4_38:AnimateSequence("ShowPrestigeMaster")
		var_4_40:AnimateSequence("ShowPrestigeMaster")
	end

	var_4_0._sequences.ShowPrestigeMaster = var_4_65

	local var_4_66
	local var_4_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 339
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("HidePrestigeMaster", var_4_67)

	local var_4_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 338
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 377
		}
	}

	var_4_27:RegisterAnimationSequence("HidePrestigeMaster", var_4_68)

	local var_4_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_38:RegisterAnimationSequence("HidePrestigeMaster", var_4_69)

	local var_4_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("HidePrestigeMaster", var_4_70)

	local function var_4_71()
		var_4_25:AnimateSequence("HidePrestigeMaster")
		var_4_27:AnimateSequence("HidePrestigeMaster")
		var_4_38:AnimateSequence("HidePrestigeMaster")
		var_4_40:AnimateSequence("HidePrestigeMaster")
	end

	var_4_0._sequences.HidePrestigeMaster = var_4_71

	local var_4_72
	local var_4_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("HideBattlePassOwnershipWidget", var_4_73)

	local var_4_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("HideBattlePassOwnershipWidget", var_4_74)

	local var_4_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("HideBattlePassOwnershipWidget", var_4_75)

	local function var_4_76()
		var_4_4:AnimateSequence("HideBattlePassOwnershipWidget")
		var_4_7:AnimateSequence("HideBattlePassOwnershipWidget")
		var_4_33:AnimateSequence("HideBattlePassOwnershipWidget")
	end

	var_4_0._sequences.HideBattlePassOwnershipWidget = var_4_76

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("UnlocksRankPanel", UnlocksRankPanel)
LockTable(_M)
