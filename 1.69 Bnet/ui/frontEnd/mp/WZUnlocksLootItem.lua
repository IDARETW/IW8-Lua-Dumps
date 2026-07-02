module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LOOT.GetTypeForID(arg_1_2)
	local var_1_1 = LOOT.GetItemRef(var_1_0, arg_1_2)
	local var_1_2 = LOOT.GetGameSourceIDFromItemID(arg_1_2)
	local var_1_3 = LOOT.GetItemProgressionImage(var_1_0, var_1_1)
	local var_1_4 = LOOT.GetItemName(var_1_0, var_1_1)
	local var_1_5 = LOOT.GetItemClassName(var_1_0, var_1_1)

	arg_1_0.UnlockName:SetDecodeParams(0, 0, 0)
	arg_1_0.UnlockName:setText("")

	local var_1_6 = RegisterMaterial(var_1_3)
	local var_1_7 = Engine.DFEIGFBEH(var_1_6)

	if var_1_7 == 4 then
		ACTIONS.AnimateSequence(arg_1_0, "Icon4x1")
	elseif var_1_7 > 1 and var_1_7 < 4 then
		ACTIONS.AnimateSequence(arg_1_0, "Icon2x1")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Icon1x1")
	end

	arg_1_0.UnlockIcon:setImage(var_1_6)
	arg_1_0.UnlockName:setText(var_1_4)
	arg_1_0.UnlockName:SetDecodeParams(40, 1, 2)
	arg_1_0.UnlockType:setText(var_1_5)
	arg_1_0.WZSnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceID = var_1_2
	})

	local var_1_8 = ({
		[LOOT.itemSourceExclusivity.MW_WZ] = {
			layoutAnim = "MWItem"
		},
		[LOOT.itemSourceExclusivity.MW_EXCLUSIVE] = {
			layoutAnim = "MWItemOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS ")
		},
		[LOOT.itemSourceExclusivity.VG_WZ] = {
			layoutAnim = "VG",
			hideBackground = true
		},
		[LOOT.itemSourceExclusivity.VG_EXCLUSIVE] = {
			layoutAnim = "VGOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")
		},
		[LOOT.itemSourceExclusivity.ALL] = {
			layoutAnim = "WZ",
			hideBackground = true
		},
		[LOOT.itemSourceExclusivity.WZ_EXCLUSIVE] = {
			layoutAnim = "WZOnly"
		},
		[LOOT.itemSourceExclusivity.CW_WZ] = {
			layoutAnim = "BOItem",
			hideBackground = true
		},
		[LOOT.itemSourceExclusivity.CW_EXCLUSIVE] = {
			layoutAnim = "BOItemOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")
		},
		[LOOT.itemSourceExclusivity.CW_ZOMBIES_EXCLUSIVE] = {
			layoutAnim = "BOItemOnly",
			equipInModeText = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"))
		},
		[LOOT.itemSourceExclusivity.CW_MW_EXCLUSIVE] = {
			layoutAnim = "BOandMWItemOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")
		},
		[LOOT.itemSourceExclusivity.CW_VG_EXCLUSIVE] = {
			layoutAnim = "BOandVGItemOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")
		},
		[LOOT.itemSourceExclusivity.MW_VG_EXCLUSIVE] = {
			layoutAnim = "MWandVGItemOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")
		},
		[LOOT.itemSourceExclusivity.VG_ZOMBIES_EXCLUSIVE] = {
			layoutAnim = "VGOnly",
			equipInModeText = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM")
		}
	})[LOOT.GetGameSourceExclusivityByItemID(arg_1_2)]
	local var_1_9 = var_1_8.layoutAnim

	if var_1_8.equipInModeText then
		arg_1_0.EquipInMode:setText(var_1_8.equipInModeText)
	end

	ACTIONS.AnimateSequence(arg_1_0, var_1_9)

	if not arg_1_0._isAARUnlock then
		ACTIONS.AnimateSequence(arg_1_0, "Show")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateUnlockData = var_0_0
	arg_2_0._isAARUnlock = false

	if arg_2_2.isAARUnlock then
		arg_2_0._isAARUnlock = arg_2_2.isAARUnlock
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	ACTIONS.AnimateSequence(arg_2_0, "Hide")
end

function WZUnlocksLootItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 230 * _1080p, 0, 309 * _1080p)

	var_3_0.id = "WZUnlocksLootItem"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backing"

	var_3_4:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_3_4:SetAlpha(0.59, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backing = var_3_4

	local var_3_5
	local var_3_6 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_3_7 = LUI.UIBorder.new(var_3_6)

	var_3_7.id = "BorderBacking"

	var_3_7:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_3_7:SetAlpha(0.5, 0)
	var_3_7:SetBorderThicknessLeft(_1080p * 2, 0)
	var_3_7:SetBorderThicknessRight(_1080p * 2, 0)
	var_3_7:SetBorderThicknessTop(_1080p * 2, 0)
	var_3_7:SetBorderThicknessBottom(_1080p * 2, 0)
	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 230, 0, _1080p * 309)
	var_3_0:addElement(var_3_7)

	var_3_0.BorderBacking = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIImage.new()

	var_3_9.id = "UnlockIcon"

	var_3_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -55, _1080p * 55, _1080p * 125, _1080p * 234)
	var_3_0:addElement(var_3_9)

	var_3_0.UnlockIcon = var_3_9

	local var_3_10
	local var_3_11 = LUI.UIText.new()

	var_3_11.id = "EquipInMode"

	var_3_11:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_11:setText("", 0)
	var_3_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_11:SetAlignment(LUI.Alignment.Center)
	var_3_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 230, _1080p * 273, _1080p * 293)
	var_3_0:addElement(var_3_11)

	var_3_0.EquipInMode = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIText.new()

	var_3_13.id = "EquipInGame"

	var_3_13:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_13:setText("", 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_13:SetAlignment(LUI.Alignment.Center)
	var_3_13:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 230, _1080p * 253, _1080p * 273)
	var_3_0:addElement(var_3_13)

	var_3_0.EquipInGame = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIStyledText.new()

	var_3_15.id = "UnlockName"

	var_3_15:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_15:setText("", 0)
	var_3_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_15:SetWordWrap(false)
	var_3_15:SetAlignment(LUI.Alignment.Center)
	var_3_15:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_15:SetStartupDelay(1000)
	var_3_15:SetLineHoldTime(400)
	var_3_15:SetAnimMoveTime(1500)
	var_3_15:SetAnimMoveSpeed(1500)
	var_3_15:SetEndDelay(1000)
	var_3_15:SetCrossfadeTime(400)
	var_3_15:SetFadeInTime(300)
	var_3_15:SetFadeOutTime(300)
	var_3_15:SetMaxVisibleLines(1)
	var_3_15:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 67, _1080p * 91)
	var_3_0:addElement(var_3_15)

	var_3_0.UnlockName = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIStyledText.new()

	var_3_17.id = "UnlockType"

	var_3_17:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_17:setText("TEMP - Unlock Type", 0)
	var_3_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_17:SetWordWrap(false)
	var_3_17:SetAlignment(LUI.Alignment.Center)
	var_3_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_17:SetStartupDelay(1000)
	var_3_17:SetLineHoldTime(400)
	var_3_17:SetAnimMoveTime(1500)
	var_3_17:SetAnimMoveSpeed(1500)
	var_3_17:SetEndDelay(1000)
	var_3_17:SetCrossfadeTime(400)
	var_3_17:SetFadeInTime(300)
	var_3_17:SetFadeOutTime(300)
	var_3_17:SetMaxVisibleLines(1)
	var_3_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -105, _1080p * 113, _1080p * 91, _1080p * 109)
	var_3_0:addElement(var_3_17)

	var_3_0.UnlockType = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIImage.new()

	var_3_19.id = "LogoBanner"

	var_3_19:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_3_19:SetAlpha(0.25, 0)
	var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 228, _1080p * 2, _1080p * 49)
	var_3_0:addElement(var_3_19)

	var_3_0.LogoBanner = var_3_19

	local var_3_20
	local var_3_21 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_3_1
	})

	var_3_21.id = "WZSnipeIcon"

	var_3_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 180, _1080p * 9, _1080p * 41)
	var_3_0:addElement(var_3_21)

	var_3_0.WZSnipeIcon = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIImage.new()

	var_3_23.id = "SnipeIconSmall"

	var_3_23:SetAlpha(0, 0)
	var_3_23:SetScale(-0.3, 0)
	var_3_23:setImage(RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_small"), 0)
	var_3_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -90, _1080p * 90, _1080p * -22, _1080p * 74)
	var_3_0:addElement(var_3_23)

	var_3_0.SnipeIconSmall = var_3_23

	local function var_3_24()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_24

	local var_3_25
	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_3_9:RegisterAnimationSequence("Icon1x1", var_3_26)

	local function var_3_27()
		var_3_9:AnimateSequence("Icon1x1")
	end

	var_3_0._sequences.Icon1x1 = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		}
	}

	var_3_9:RegisterAnimationSequence("Icon2x1", var_3_29)

	local function var_3_30()
		var_3_9:AnimateSequence("Icon2x1")
	end

	var_3_0._sequences.Icon2x1 = var_3_30

	local var_3_31
	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_17:RegisterAnimationSequence("AR", var_3_32)

	local function var_3_33()
		var_3_17:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_33

	local var_3_34
	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("MWItem", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_13:RegisterAnimationSequence("MWItem", var_3_36)

	local var_3_37 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		}
	}

	var_3_19:RegisterAnimationSequence("MWItem", var_3_37)

	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("MWItem", var_3_38)

	local var_3_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("MWItem", var_3_39)

	local function var_3_40()
		var_3_11:AnimateSequence("MWItem")
		var_3_13:AnimateSequence("MWItem")
		var_3_19:AnimateSequence("MWItem")
		var_3_21:AnimateSequence("MWItem")
		var_3_23:AnimateSequence("MWItem")
	end

	var_3_0._sequences.MWItem = var_3_40

	local var_3_41
	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("BOItem", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_13:RegisterAnimationSequence("BOItem", var_3_43)

	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("BOItem", var_3_44)

	local var_3_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("BOItem", var_3_45)

	local var_3_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("BOItem", var_3_46)

	local function var_3_47()
		var_3_11:AnimateSequence("BOItem")
		var_3_13:AnimateSequence("BOItem")
		var_3_19:AnimateSequence("BOItem")
		var_3_21:AnimateSequence("BOItem")
		var_3_23:AnimateSequence("BOItem")
	end

	var_3_0._sequences.BOItem = var_3_47

	local var_3_48
	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_9:RegisterAnimationSequence("Hide", var_3_49)

	local var_3_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("Hide", var_3_50)

	local var_3_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("Hide", var_3_51)

	local var_3_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("Hide", var_3_52)

	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("Hide", var_3_53)

	local function var_3_54()
		var_3_9:AnimateSequence("Hide")
		var_3_15:AnimateSequence("Hide")
		var_3_17:AnimateSequence("Hide")
		var_3_19:AnimateSequence("Hide")
		var_3_23:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_54

	local var_3_55
	local var_3_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("BOItemOnly", var_3_56)

	local var_3_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LOOT_MP/EQUIP_IN_CW")
		}
	}

	var_3_13:RegisterAnimationSequence("BOItemOnly", var_3_57)

	local var_3_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("BOItemOnly", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("BOItemOnly", var_3_59)

	local var_3_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("BOItemOnly", var_3_60)

	local function var_3_61()
		var_3_11:AnimateSequence("BOItemOnly")
		var_3_13:AnimateSequence("BOItemOnly")
		var_3_19:AnimateSequence("BOItemOnly")
		var_3_21:AnimateSequence("BOItemOnly")
		var_3_23:AnimateSequence("BOItemOnly")
	end

	var_3_0._sequences.BOItemOnly = var_3_61

	local var_3_62
	local var_3_63 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_7:RegisterAnimationSequence("MWItemOnly", var_3_63)

	local var_3_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("MWItemOnly", var_3_64)

	local var_3_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LOOT_MP/EQUIP_IN_MODERN_WARFARE")
		}
	}

	var_3_13:RegisterAnimationSequence("MWItemOnly", var_3_65)

	local var_3_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("MWItemOnly", var_3_66)

	local var_3_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("MWItemOnly", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("MWItemOnly", var_3_68)

	local function var_3_69()
		var_3_7:AnimateSequence("MWItemOnly")
		var_3_11:AnimateSequence("MWItemOnly")
		var_3_13:AnimateSequence("MWItemOnly")
		var_3_19:AnimateSequence("MWItemOnly")
		var_3_21:AnimateSequence("MWItemOnly")
		var_3_23:AnimateSequence("MWItemOnly")
	end

	var_3_0._sequences.MWItemOnly = var_3_69

	local var_3_70
	local var_3_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 201
		}
	}

	var_3_9:RegisterAnimationSequence("Icon4x1", var_3_71)

	local function var_3_72()
		var_3_9:AnimateSequence("Icon4x1")
	end

	var_3_0._sequences.Icon4x1 = var_3_72

	local var_3_73
	local var_3_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_9:RegisterAnimationSequence("ShowNameAndType", var_3_74)

	local var_3_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("ShowNameAndType", var_3_75)

	local var_3_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("ShowNameAndType", var_3_76)

	local function var_3_77()
		var_3_9:AnimateSequence("ShowNameAndType")
		var_3_15:AnimateSequence("ShowNameAndType")
		var_3_17:AnimateSequence("ShowNameAndType")
	end

	var_3_0._sequences.ShowNameAndType = var_3_77

	local var_3_78
	local var_3_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_9:RegisterAnimationSequence("Show", var_3_79)

	local var_3_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("Show", var_3_80)

	local var_3_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("Show", var_3_81)

	local function var_3_82()
		var_3_9:AnimateSequence("Show")
		var_3_15:AnimateSequence("Show")
		var_3_17:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_82

	local var_3_83
	local var_3_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		}
	}

	var_3_4:RegisterAnimationSequence("ScaleCard", var_3_84)

	local var_3_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 297
		}
	}

	var_3_7:RegisterAnimationSequence("ScaleCard", var_3_85)

	local function var_3_86()
		var_3_4:AnimateSequence("ScaleCard")
		var_3_7:AnimateSequence("ScaleCard")
	end

	var_3_0._sequences.ScaleCard = var_3_86

	local var_3_87
	local var_3_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		}
	}

	var_3_19:RegisterAnimationSequence("GameSourceNonExclusive", var_3_88)

	local function var_3_89()
		var_3_19:AnimateSequence("GameSourceNonExclusive")
	end

	var_3_0._sequences.GameSourceNonExclusive = var_3_89

	local var_3_90
	local var_3_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("GameSourceExclusive", var_3_91)

	local function var_3_92()
		var_3_19:AnimateSequence("GameSourceExclusive")
	end

	var_3_0._sequences.GameSourceExclusive = var_3_92

	local var_3_93
	local var_3_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("WZ", var_3_94)

	local var_3_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_13:RegisterAnimationSequence("WZ", var_3_95)

	local var_3_96 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		}
	}

	var_3_19:RegisterAnimationSequence("WZ", var_3_96)

	local function var_3_97()
		var_3_11:AnimateSequence("WZ")
		var_3_13:AnimateSequence("WZ")
		var_3_19:AnimateSequence("WZ")
	end

	var_3_0._sequences.WZ = var_3_97

	local var_3_98
	local var_3_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("WZOnly", var_3_99)

	local var_3_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_13:RegisterAnimationSequence("WZOnly", var_3_100)

	local var_3_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2DarkBlue
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("WZOnly", var_3_101)

	local function var_3_102()
		var_3_11:AnimateSequence("WZOnly")
		var_3_13:AnimateSequence("WZOnly")
		var_3_19:AnimateSequence("WZOnly")
	end

	var_3_0._sequences.WZOnly = var_3_102

	local var_3_103
	local var_3_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("VG", var_3_104)

	local var_3_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_13:RegisterAnimationSequence("VG", var_3_105)

	local var_3_106 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		}
	}

	var_3_19:RegisterAnimationSequence("VG", var_3_106)

	local var_3_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("VG", var_3_107)

	local var_3_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_small")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("VG", var_3_108)

	local function var_3_109()
		var_3_11:AnimateSequence("VG")
		var_3_13:AnimateSequence("VG")
		var_3_19:AnimateSequence("VG")
		var_3_21:AnimateSequence("VG")
		var_3_23:AnimateSequence("VG")
	end

	var_3_0._sequences.VG = var_3_109

	local var_3_110
	local var_3_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("BOandMWItemOnly", var_3_111)

	local var_3_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LOOT_MP/EQUIP_IN_MW_AND_CW")
		}
	}

	var_3_13:RegisterAnimationSequence("BOandMWItemOnly", var_3_112)

	local var_3_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("BOandMWItemOnly", var_3_113)

	local var_3_114 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("BOandMWItemOnly", var_3_114)

	local var_3_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("BOandMWItemOnly", var_3_115)

	local function var_3_116()
		var_3_11:AnimateSequence("BOandMWItemOnly")
		var_3_13:AnimateSequence("BOandMWItemOnly")
		var_3_19:AnimateSequence("BOandMWItemOnly")
		var_3_21:AnimateSequence("BOandMWItemOnly")
		var_3_23:AnimateSequence("BOandMWItemOnly")
	end

	var_3_0._sequences.BOandMWItemOnly = var_3_116

	local var_3_117
	local var_3_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("BOandVGItemOnly", var_3_118)

	local var_3_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LOOT_MP/EQUIP_IN_CW_AND_VG")
		}
	}

	var_3_13:RegisterAnimationSequence("BOandVGItemOnly", var_3_119)

	local var_3_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("BOandVGItemOnly", var_3_120)

	local var_3_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("BOandVGItemOnly", var_3_121)

	local var_3_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("BOandVGItemOnly", var_3_122)

	local function var_3_123()
		var_3_11:AnimateSequence("BOandVGItemOnly")
		var_3_13:AnimateSequence("BOandVGItemOnly")
		var_3_19:AnimateSequence("BOandVGItemOnly")
		var_3_21:AnimateSequence("BOandVGItemOnly")
		var_3_23:AnimateSequence("BOandVGItemOnly")
	end

	var_3_0._sequences.BOandVGItemOnly = var_3_123

	local var_3_124
	local var_3_125 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_7:RegisterAnimationSequence("MWandVGItemOnly", var_3_125)

	local var_3_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("MWandVGItemOnly", var_3_126)

	local var_3_127 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LOOT_MP/EQUIP_IN_MW_AND_VG")
		}
	}

	var_3_13:RegisterAnimationSequence("MWandVGItemOnly", var_3_127)

	local var_3_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("MWandVGItemOnly", var_3_128)

	local var_3_129 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("MWandVGItemOnly", var_3_129)

	local var_3_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("MWandVGItemOnly", var_3_130)

	local function var_3_131()
		var_3_7:AnimateSequence("MWandVGItemOnly")
		var_3_11:AnimateSequence("MWandVGItemOnly")
		var_3_13:AnimateSequence("MWandVGItemOnly")
		var_3_19:AnimateSequence("MWandVGItemOnly")
		var_3_21:AnimateSequence("MWandVGItemOnly")
		var_3_23:AnimateSequence("MWandVGItemOnly")
	end

	var_3_0._sequences.MWandVGItemOnly = var_3_131

	local var_3_132
	local var_3_133 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_7:RegisterAnimationSequence("VGOnly", var_3_133)

	local var_3_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("VGOnly", var_3_134)

	local var_3_135 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LOOT_MP/EQUIP_IN_VG")
		}
	}

	var_3_13:RegisterAnimationSequence("VGOnly", var_3_135)

	local var_3_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 228
		}
	}

	var_3_19:RegisterAnimationSequence("VGOnly", var_3_136)

	local var_3_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("VGOnly", var_3_137)

	local var_3_138 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_small")
		}
	}

	var_3_23:RegisterAnimationSequence("VGOnly", var_3_138)

	local function var_3_139()
		var_3_7:AnimateSequence("VGOnly")
		var_3_11:AnimateSequence("VGOnly")
		var_3_13:AnimateSequence("VGOnly")
		var_3_19:AnimateSequence("VGOnly")
		var_3_21:AnimateSequence("VGOnly")
		var_3_23:AnimateSequence("VGOnly")
	end

	var_3_0._sequences.VGOnly = var_3_139

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZUnlocksLootItem", WZUnlocksLootItem)
LockTable(_M)
