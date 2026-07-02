module(..., package.seeall)

function PrestigeMasterProgressItem(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 503 * _1080p, 0, 78 * _1080p)

	var_1_0.id = "PrestigeMasterProgressItem"
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

	var_1_4.id = "PanelBackingImage"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_1_4:SetAlpha(0.2, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.PanelBackingImage = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Darken"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_6:SetAlpha(0.3, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Darken = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Highlight"

	var_1_9:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_1_9:SetAlpha(0.2, 0)
	var_1_9:SetBorderThicknessLeft(_1080p * 2, 0)
	var_1_9:SetBorderThicknessRight(_1080p * 2, 0)
	var_1_9:SetBorderThicknessTop(_1080p * 2, 0)
	var_1_9:SetBorderThicknessBottom(_1080p * 2, 0)
	var_1_0:addElement(var_1_9)

	var_1_0.Highlight = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIImage.new()

	var_1_11.id = "CompleteImage"

	var_1_11:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_1_11:SetAlpha(0, 0)
	var_1_11:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 455, _1080p * 473, _1080p * 30, _1080p * 48)
	var_1_0:addElement(var_1_11)

	var_1_0.CompleteImage = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIImage.new()

	var_1_13.id = "PrestigeMasterRibbon"

	var_1_13:setImage(RegisterMaterial("ui_icon_prestige_master_01"), 0)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 258, _1080p * 7, _1080p * 71)
	var_1_0:addElement(var_1_13)

	var_1_0.PrestigeMasterRibbon = var_1_13

	local var_1_14
	local var_1_15 = LUI.UIStyledText.new()

	var_1_15.id = "Rank"

	var_1_15:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_1_15:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CALLING_CARD_PRESTIGE_1"), 0)
	var_1_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_15:SetAlignment(LUI.Alignment.Left)
	var_1_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_15:SetStartupDelay(1000)
	var_1_15:SetLineHoldTime(1000)
	var_1_15:SetAnimMoveTime(1500)
	var_1_15:SetAnimMoveSpeed(500)
	var_1_15:SetEndDelay(1000)
	var_1_15:SetCrossfadeTime(400)
	var_1_15:SetFadeInTime(300)
	var_1_15:SetFadeOutTime(300)
	var_1_15:SetMaxVisibleLines(1)
	var_1_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 25.5, _1080p * 172.5, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_15)

	var_1_0.Rank = var_1_15

	local var_1_16
	local var_1_17 = LUI.UIImage.new()

	var_1_17.id = "LockedImage"

	var_1_17:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_1_17:SetAlpha(0, 0)
	var_1_17:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_1_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 444, _1080p * 484, _1080p * 21, _1080p * 62)
	var_1_0:addElement(var_1_17)

	var_1_0.LockedImage = var_1_17

	local function var_1_18()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_18

	local var_1_19
	local var_1_20 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Unlocked", var_1_20)

	local var_1_21 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_1_6:RegisterAnimationSequence("Unlocked", var_1_21)

	local var_1_22 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("Unlocked", var_1_22)

	local var_1_23 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("Unlocked", var_1_23)

	local var_1_24 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_15:RegisterAnimationSequence("Unlocked", var_1_24)

	local function var_1_25()
		var_1_4:AnimateSequence("Unlocked")
		var_1_6:AnimateSequence("Unlocked")
		var_1_9:AnimateSequence("Unlocked")
		var_1_13:AnimateSequence("Unlocked")
		var_1_15:AnimateSequence("Unlocked")
	end

	var_1_0._sequences.Unlocked = var_1_25

	local var_1_26
	local var_1_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Locked", var_1_27)

	local var_1_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Locked", var_1_28)

	local var_1_29 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("Locked", var_1_29)

	local var_1_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("Locked", var_1_30)

	local var_1_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -220.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29.5
		}
	}

	var_1_15:RegisterAnimationSequence("Locked", var_1_31)

	local var_1_32 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_17:RegisterAnimationSequence("Locked", var_1_32)

	local function var_1_33()
		var_1_4:AnimateSequence("Locked")
		var_1_6:AnimateSequence("Locked")
		var_1_9:AnimateSequence("Locked")
		var_1_13:AnimateSequence("Locked")
		var_1_15:AnimateSequence("Locked")
		var_1_17:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_33

	local var_1_34
	local var_1_35 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Completed", var_1_35)

	local var_1_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Completed", var_1_36)

	local var_1_37 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("Completed", var_1_37)

	local var_1_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 454
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 473
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.MainMenuLines
		}
	}

	var_1_11:RegisterAnimationSequence("Completed", var_1_38)

	local var_1_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("Completed", var_1_39)

	local var_1_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_15:RegisterAnimationSequence("Completed", var_1_40)

	local function var_1_41()
		var_1_4:AnimateSequence("Completed")
		var_1_6:AnimateSequence("Completed")
		var_1_9:AnimateSequence("Completed")
		var_1_11:AnimateSequence("Completed")
		var_1_13:AnimateSequence("Completed")
		var_1_15:AnimateSequence("Completed")
	end

	var_1_0._sequences.Completed = var_1_41

	return var_1_0
end

MenuBuilder.registerType("PrestigeMasterProgressItem", PrestigeMasterProgressItem)
LockTable(_M)
