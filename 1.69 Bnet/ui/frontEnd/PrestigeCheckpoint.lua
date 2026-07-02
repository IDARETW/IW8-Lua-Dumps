module(..., package.seeall)

function PrestigeCheckpoint(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 104 * _1080p, 0, 115 * _1080p)

	var_1_0.id = "PrestigeCheckpoint"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "PanelBackingimage"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 104, 0, _1080p * 115)
	var_1_0:addElement(var_1_4)

	var_1_0.PanelBackingimage = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Darkener"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 104, 0, _1080p * 115)
	var_1_0:addElement(var_1_6)

	var_1_0.Darkener = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Highlight"

	var_1_9:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_1_9:SetAlpha(0, 0)
	var_1_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 104, 0, _1080p * 115)
	var_1_0:addElement(var_1_9)

	var_1_0.Highlight = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIImage.new()

	var_1_11.id = "BaseDarken"

	var_1_11:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_1_11:SetAlpha(0, 0)
	var_1_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -25, _1080p * 25, _1080p * -26, 0)
	var_1_0:addElement(var_1_11)

	var_1_0.BaseDarken = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIImage.new()

	var_1_13.id = "Base"

	var_1_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_1_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -25, _1080p * 25, _1080p * -26, 0)
	var_1_0:addElement(var_1_13)

	var_1_0.Base = var_1_13

	local var_1_14
	local var_1_15 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_16 = LUI.UIBorder.new(var_1_15)

	var_1_16.id = "BorderBase"

	var_1_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_1_16:SetAlpha(0.5, 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 77, _1080p * 89, _1080p * 115)
	var_1_0:addElement(var_1_16)

	var_1_0.BorderBase = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIStyledText.new()

	var_1_18.id = "Rank"

	var_1_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_18:setText(Engine.CBBHFCGDIC("MENU/NUMBER"), 0)
	var_1_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_18:SetWordWrap(false)
	var_1_18:SetAlignment(LUI.Alignment.Center)
	var_1_18:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 76, _1080p * 91, _1080p * 111)
	var_1_0:addElement(var_1_18)

	var_1_0.Rank = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIImage.new()

	var_1_20.id = "Icon"

	var_1_20:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_20:SetAlpha(0.9, 0)
	var_1_20:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 84, _1080p * 11, _1080p * 75)
	var_1_0:addElement(var_1_20)

	var_1_0.Icon = var_1_20

	local var_1_21
	local var_1_22 = LUI.UIStyledText.new()

	var_1_22.id = "Title"

	var_1_22:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_1_22:SetAlpha(0.9, 0)
	var_1_22:SetScale(0.15, 0)
	var_1_22:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CAPS"), 0)
	var_1_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_22:SetWordWrap(false)
	var_1_22:SetAlignment(LUI.Alignment.Center)
	var_1_22:SetShadowMinDistance(0.01, 0)
	var_1_22:SetShadowMaxDistance(0.02, 0)
	var_1_22:SetShadowRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_22:SetOutlineMinDistance(0.01, 0)
	var_1_22:SetOutlineMaxDistance(0.05, 0)
	var_1_22:SetOutlineRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -108, _1080p * 108, _1080p * -11, _1080p * 5)
	var_1_0:addElement(var_1_22)

	var_1_0.Title = var_1_22

	local var_1_23
	local var_1_24 = LUI.UIText.new()

	var_1_24.id = "PrestigeMasterLabel"

	var_1_24:SetRGBFromTable(SWATCHES.CH2.CH2SeasonMaster, 0)
	var_1_24:SetAlpha(0, 0)
	var_1_24:SetScale(-0.1, 0)
	var_1_24:setText(ToUpperCase(Engine.CBBHFCGDIC("PRESTIGE/PRESTIGE_MASTER")), 0)
	var_1_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_24:SetWordWrap(false)
	var_1_24:SetAlignment(LUI.Alignment.Center)
	var_1_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -68, _1080p * 68, _1080p * 70, _1080p * 88)
	var_1_0:addElement(var_1_24)

	var_1_0.PrestigeMasterLabel = var_1_24

	local var_1_25
	local var_1_26 = LUI.UIImage.new()

	var_1_26.id = "IconLocked"

	var_1_26:SetAlpha(0, 0)
	var_1_26:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_1_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 84, _1080p * 21, _1080p * 85)
	var_1_0:addElement(var_1_26)

	var_1_0.IconLocked = var_1_26

	local var_1_27
	local var_1_28 = LUI.UIStyledText.new()

	var_1_28.id = "TitleLocked"

	var_1_28:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_28:SetAlpha(0, 0)
	var_1_28:SetScale(0.15, 0)
	var_1_28:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED_CAPS"), 0)
	var_1_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_28:SetWordWrap(false)
	var_1_28:SetAlignment(LUI.Alignment.Center)
	var_1_28:SetShadowMinDistance(0.01, 0)
	var_1_28:SetShadowMaxDistance(0.02, 0)
	var_1_28:SetShadowRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_28:SetOutlineMinDistance(0.01, 0)
	var_1_28:SetOutlineMaxDistance(0.05, 0)
	var_1_28:SetOutlineRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -70, _1080p * 70, 0, _1080p * 18)
	var_1_0:addElement(var_1_28)

	var_1_0.TitleLocked = var_1_28

	local function var_1_29()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_29

	local var_1_30
	local var_1_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("Earned", var_1_31)

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankSeason
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("Earned", var_1_32)

	local var_1_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_1_18:RegisterAnimationSequence("Earned", var_1_33)

	local var_1_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("Earned", var_1_34)

	local function var_1_35()
		var_1_11:AnimateSequence("Earned")
		var_1_13:AnimateSequence("Earned")
		var_1_18:AnimateSequence("Earned")
		var_1_20:AnimateSequence("Earned")
	end

	var_1_0._sequences.Earned = var_1_35

	local var_1_36
	local var_1_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_1_13:RegisterAnimationSequence("Unearned", var_1_37)

	local var_1_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_18:RegisterAnimationSequence("Unearned", var_1_38)

	local function var_1_39()
		var_1_13:AnimateSequence("Unearned")
		var_1_18:AnimateSequence("Unearned")
	end

	var_1_0._sequences.Unearned = var_1_39

	local var_1_40
	local var_1_41 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("EarnedMaxLevel", var_1_41)

	local var_1_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankSeason
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("EarnedMaxLevel", var_1_42)

	local var_1_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_1_18:RegisterAnimationSequence("EarnedMaxLevel", var_1_43)

	local var_1_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("EarnedMaxLevel", var_1_44)

	local function var_1_45()
		var_1_11:AnimateSequence("EarnedMaxLevel")
		var_1_13:AnimateSequence("EarnedMaxLevel")
		var_1_18:AnimateSequence("EarnedMaxLevel")
		var_1_20:AnimateSequence("EarnedMaxLevel")
	end

	var_1_0._sequences.EarnedMaxLevel = var_1_45

	local var_1_46
	local var_1_47 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("GridUnearned", var_1_47)

	local var_1_48 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("GridUnearned", var_1_48)

	local var_1_49 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("GridUnearned", var_1_49)

	local var_1_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("GridUnearned", var_1_50)

	local var_1_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("GridUnearned", var_1_51)

	local var_1_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("GridUnearned", var_1_52)

	local var_1_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 87
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("GridUnearned", var_1_53)

	local var_1_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("GridUnearned", var_1_54)

	local function var_1_55()
		var_1_4:AnimateSequence("GridUnearned")
		var_1_6:AnimateSequence("GridUnearned")
		var_1_9:AnimateSequence("GridUnearned")
		var_1_13:AnimateSequence("GridUnearned")
		var_1_16:AnimateSequence("GridUnearned")
		var_1_18:AnimateSequence("GridUnearned")
		var_1_20:AnimateSequence("GridUnearned")
		var_1_22:AnimateSequence("GridUnearned")
	end

	var_1_0._sequences.GridUnearned = var_1_55

	local var_1_56
	local var_1_57 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("GridLocked", var_1_57)

	local var_1_58 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("GridLocked", var_1_58)

	local var_1_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("GridLocked", var_1_59)

	local var_1_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("GridLocked", var_1_60)

	local var_1_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("GridLocked", var_1_61)

	local var_1_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_waypoint_locked")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_1_20:RegisterAnimationSequence("GridLocked", var_1_62)

	local var_1_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("GridLocked", var_1_63)

	local function var_1_64()
		var_1_6:AnimateSequence("GridLocked")
		var_1_9:AnimateSequence("GridLocked")
		var_1_13:AnimateSequence("GridLocked")
		var_1_16:AnimateSequence("GridLocked")
		var_1_18:AnimateSequence("GridLocked")
		var_1_20:AnimateSequence("GridLocked")
		var_1_22:AnimateSequence("GridLocked")
	end

	var_1_0._sequences.GridLocked = var_1_64

	local var_1_65
	local var_1_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_1_18:RegisterAnimationSequence("ShowPrestigeMaster", var_1_66)

	local var_1_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_24:RegisterAnimationSequence("ShowPrestigeMaster", var_1_67)

	local function var_1_68()
		var_1_18:AnimateSequence("ShowPrestigeMaster")
		var_1_24:AnimateSequence("ShowPrestigeMaster")
	end

	var_1_0._sequences.ShowPrestigeMaster = var_1_68

	local var_1_69
	local var_1_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_24:RegisterAnimationSequence("HidePrestigeMaster", var_1_70)

	local function var_1_71()
		var_1_24:AnimateSequence("HidePrestigeMaster")
	end

	var_1_0._sequences.HidePrestigeMaster = var_1_71

	local var_1_72
	local var_1_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_1_13:RegisterAnimationSequence("UnearnedLevelZero", var_1_73)

	local var_1_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_18:RegisterAnimationSequence("UnearnedLevelZero", var_1_74)

	local var_1_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("UnearnedLevelZero", var_1_75)

	local var_1_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		}
	}

	var_1_22:RegisterAnimationSequence("UnearnedLevelZero", var_1_76)

	local function var_1_77()
		var_1_13:AnimateSequence("UnearnedLevelZero")
		var_1_18:AnimateSequence("UnearnedLevelZero")
		var_1_20:AnimateSequence("UnearnedLevelZero")
		var_1_22:AnimateSequence("UnearnedLevelZero")
	end

	var_1_0._sequences.UnearnedLevelZero = var_1_77

	local var_1_78
	local var_1_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("LockedMaxLevel", var_1_79)

	local var_1_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankSeason
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("LockedMaxLevel", var_1_80)

	local var_1_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("LockedMaxLevel", var_1_81)

	local var_1_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("LockedMaxLevel", var_1_82)

	local var_1_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_26:RegisterAnimationSequence("LockedMaxLevel", var_1_83)

	local var_1_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_28:RegisterAnimationSequence("LockedMaxLevel", var_1_84)

	local function var_1_85()
		var_1_11:AnimateSequence("LockedMaxLevel")
		var_1_13:AnimateSequence("LockedMaxLevel")
		var_1_20:AnimateSequence("LockedMaxLevel")
		var_1_22:AnimateSequence("LockedMaxLevel")
		var_1_26:AnimateSequence("LockedMaxLevel")
		var_1_28:AnimateSequence("LockedMaxLevel")
	end

	var_1_0._sequences.LockedMaxLevel = var_1_85

	local var_1_86
	local var_1_87 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("GridEarned", var_1_87)

	local var_1_88 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("GridEarned", var_1_88)

	local var_1_89 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("GridEarned", var_1_89)

	local var_1_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("GridEarned", var_1_90)

	local var_1_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("GridEarned", var_1_91)

	local var_1_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("GridEarned", var_1_92)

	local var_1_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("GridEarned", var_1_93)

	local var_1_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 87
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("GridEarned", var_1_94)

	local var_1_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("GridEarned", var_1_95)

	local function var_1_96()
		var_1_4:AnimateSequence("GridEarned")
		var_1_6:AnimateSequence("GridEarned")
		var_1_9:AnimateSequence("GridEarned")
		var_1_11:AnimateSequence("GridEarned")
		var_1_13:AnimateSequence("GridEarned")
		var_1_16:AnimateSequence("GridEarned")
		var_1_18:AnimateSequence("GridEarned")
		var_1_20:AnimateSequence("GridEarned")
		var_1_22:AnimateSequence("GridEarned")
	end

	var_1_0._sequences.GridEarned = var_1_96

	return var_1_0
end

MenuBuilder.registerType("PrestigeCheckpoint", PrestigeCheckpoint)
LockTable(_M)
