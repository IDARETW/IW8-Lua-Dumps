module(..., package.seeall)

function PrestigeMasterCheckpoint(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 76 * _1080p, 0, 117 * _1080p)

	var_1_0.id = "PrestigeMasterCheckpoint"
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

	var_1_4.id = "Base"

	var_1_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 63, _1080p * 91, _1080p * 117)
	var_1_0:addElement(var_1_4)

	var_1_0.Base = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "BorderBase"

	var_1_7:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_1_7:SetAlpha(0.25, 0)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 63, _1080p * 91, _1080p * 117)
	var_1_0:addElement(var_1_7)

	var_1_0.BorderBase = var_1_7

	local var_1_8
	local var_1_9 = LUI.UIStyledText.new()

	var_1_9.id = "Rank"

	var_1_9:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_9:setText(Engine.CBBHFCGDIC("MENU/NUMBER"), 0)
	var_1_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_9:SetAlignment(LUI.Alignment.Center)
	var_1_9:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 63, _1080p * 95, _1080p * 113)
	var_1_0:addElement(var_1_9)

	var_1_0.Rank = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIStyledText.new()

	var_1_11.id = "Title"

	var_1_11:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_1_11:SetAlpha(0.9, 0)
	var_1_11:SetScale(0.15, 0)
	var_1_11:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CAPS"), 0)
	var_1_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_11:SetAlignment(LUI.Alignment.Center)
	var_1_11:SetShadowMinDistance(0.01, 0)
	var_1_11:SetShadowMaxDistance(0.02, 0)
	var_1_11:SetShadowRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_11:SetOutlineMinDistance(0.01, 0)
	var_1_11:SetOutlineMaxDistance(0.05, 0)
	var_1_11:SetOutlineRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -59, _1080p * 59, 0, _1080p * 16)
	var_1_0:addElement(var_1_11)

	var_1_0.Title = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIStyledText.new()

	var_1_13.id = "TitleLocked"

	var_1_13:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_1_13:SetAlpha(0, 0)
	var_1_13:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CAPS"), 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_13:SetAlignment(LUI.Alignment.Center)
	var_1_13:SetShadowMinDistance(0.01, 0)
	var_1_13:SetShadowMaxDistance(0.02, 0)
	var_1_13:SetShadowRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_13:SetOutlineMinDistance(0.01, 0)
	var_1_13:SetOutlineMaxDistance(0.05, 0)
	var_1_13:SetOutlineRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, 0, _1080p * 16)
	var_1_0:addElement(var_1_13)

	var_1_0.TitleLocked = var_1_13

	local var_1_14
	local var_1_15 = LUI.UIImage.new()

	var_1_15.id = "Icon"

	var_1_15:setImage(RegisterMaterial("ui_icon_prestige_master_01"), 0)
	var_1_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -26, _1080p * 102, _1080p * 42, _1080p * 74)
	var_1_0:addElement(var_1_15)

	var_1_0.Icon = var_1_15

	local var_1_16
	local var_1_17 = LUI.UIImage.new()

	var_1_17.id = "IconLocked"

	var_1_17:SetAlpha(0, 0)
	var_1_17:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_1_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 70, _1080p * 21, _1080p * 85)
	var_1_0:addElement(var_1_17)

	var_1_0.IconLocked = var_1_17

	local function var_1_18()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_18

	local var_1_19
	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_1_4:RegisterAnimationSequence("Earned", var_1_20)

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_7:RegisterAnimationSequence("Earned", var_1_21)

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_1_9:RegisterAnimationSequence("Earned", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("Earned")
		var_1_7:AnimateSequence("Earned")
		var_1_9:AnimateSequence("Earned")
	end

	var_1_0._sequences.Earned = var_1_23

	local var_1_24
	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_1_4:RegisterAnimationSequence("Unearned", var_1_25)

	local var_1_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_7:RegisterAnimationSequence("Unearned", var_1_26)

	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_9:RegisterAnimationSequence("Unearned", var_1_27)

	local function var_1_28()
		var_1_4:AnimateSequence("Unearned")
		var_1_7:AnimateSequence("Unearned")
		var_1_9:AnimateSequence("Unearned")
	end

	var_1_0._sequences.Unearned = var_1_28

	local var_1_29
	local var_1_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_1_4:RegisterAnimationSequence("EarnedMaxLevel", var_1_30)

	local var_1_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_7:RegisterAnimationSequence("EarnedMaxLevel", var_1_31)

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_1_9:RegisterAnimationSequence("EarnedMaxLevel", var_1_32)

	local function var_1_33()
		var_1_4:AnimateSequence("EarnedMaxLevel")
		var_1_7:AnimateSequence("EarnedMaxLevel")
		var_1_9:AnimateSequence("EarnedMaxLevel")
	end

	var_1_0._sequences.EarnedMaxLevel = var_1_33

	local var_1_34
	local var_1_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankSeason
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("GridEarned", var_1_35)

	local var_1_36 = {
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

	var_1_7:RegisterAnimationSequence("GridEarned", var_1_36)

	local var_1_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_1_9:RegisterAnimationSequence("GridEarned", var_1_37)

	local var_1_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("GridEarned", var_1_38)

	local function var_1_39()
		var_1_4:AnimateSequence("GridEarned")
		var_1_7:AnimateSequence("GridEarned")
		var_1_9:AnimateSequence("GridEarned")
		var_1_11:AnimateSequence("GridEarned")
	end

	var_1_0._sequences.GridEarned = var_1_39

	local var_1_40
	local var_1_41 = {
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

	var_1_4:RegisterAnimationSequence("GridUnearned", var_1_41)

	local var_1_42 = {
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

	var_1_7:RegisterAnimationSequence("GridUnearned", var_1_42)

	local var_1_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_9:RegisterAnimationSequence("GridUnearned", var_1_43)

	local var_1_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("GridUnearned", var_1_44)

	local function var_1_45()
		var_1_4:AnimateSequence("GridUnearned")
		var_1_7:AnimateSequence("GridUnearned")
		var_1_9:AnimateSequence("GridUnearned")
		var_1_11:AnimateSequence("GridUnearned")
	end

	var_1_0._sequences.GridUnearned = var_1_45

	local var_1_46
	local var_1_47 = {
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

	var_1_4:RegisterAnimationSequence("GridLocked", var_1_47)

	local var_1_48 = {
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

	var_1_7:RegisterAnimationSequence("GridLocked", var_1_48)

	local var_1_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_9:RegisterAnimationSequence("GridLocked", var_1_49)

	local var_1_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("GridLocked", var_1_50)

	local function var_1_51()
		var_1_4:AnimateSequence("GridLocked")
		var_1_7:AnimateSequence("GridLocked")
		var_1_9:AnimateSequence("GridLocked")
		var_1_11:AnimateSequence("GridLocked")
	end

	var_1_0._sequences.GridLocked = var_1_51

	local function var_1_52()
		return
	end

	var_1_0._sequences.ShowPrestigeMaster = var_1_52

	local function var_1_53()
		return
	end

	var_1_0._sequences.HidePrestigeMaster = var_1_53

	local var_1_54
	local var_1_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_1_4:RegisterAnimationSequence("UnearnedLevelZero", var_1_55)

	local var_1_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_7:RegisterAnimationSequence("UnearnedLevelZero", var_1_56)

	local var_1_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_9:RegisterAnimationSequence("UnearnedLevelZero", var_1_57)

	local var_1_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("UnearnedLevelZero", var_1_58)

	local var_1_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_15:RegisterAnimationSequence("UnearnedLevelZero", var_1_59)

	local function var_1_60()
		var_1_4:AnimateSequence("UnearnedLevelZero")
		var_1_7:AnimateSequence("UnearnedLevelZero")
		var_1_9:AnimateSequence("UnearnedLevelZero")
		var_1_11:AnimateSequence("UnearnedLevelZero")
		var_1_15:AnimateSequence("UnearnedLevelZero")
	end

	var_1_0._sequences.UnearnedLevelZero = var_1_60

	local var_1_61
	local var_1_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_1_4:RegisterAnimationSequence("LockedMaxLevel", var_1_62)

	local var_1_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_1_7:RegisterAnimationSequence("LockedMaxLevel", var_1_63)

	local var_1_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_1_9:RegisterAnimationSequence("LockedMaxLevel", var_1_64)

	local var_1_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("LockedMaxLevel", var_1_65)

	local var_1_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/LOCKED_CAPS")
		}
	}

	var_1_13:RegisterAnimationSequence("LockedMaxLevel", var_1_66)

	local var_1_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_15:RegisterAnimationSequence("LockedMaxLevel", var_1_67)

	local var_1_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_17:RegisterAnimationSequence("LockedMaxLevel", var_1_68)

	local function var_1_69()
		var_1_4:AnimateSequence("LockedMaxLevel")
		var_1_7:AnimateSequence("LockedMaxLevel")
		var_1_9:AnimateSequence("LockedMaxLevel")
		var_1_11:AnimateSequence("LockedMaxLevel")
		var_1_13:AnimateSequence("LockedMaxLevel")
		var_1_15:AnimateSequence("LockedMaxLevel")
		var_1_17:AnimateSequence("LockedMaxLevel")
	end

	var_1_0._sequences.LockedMaxLevel = var_1_69

	return var_1_0
end

MenuBuilder.registerType("PrestigeMasterCheckpoint", PrestigeMasterCheckpoint)
LockTable(_M)
