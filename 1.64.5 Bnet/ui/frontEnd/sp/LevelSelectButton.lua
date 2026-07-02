module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2)

	if Engine.BBGGBGEHAI(arg_1_1) then
		LUI.FlowManager.RequestPopupMenu(arg_1_0, "OverwriteSaveWarningPopup", true, arg_1_1, false, {
			mapName = arg_1_2
		})
	else
		local var_1_0 = MenuBuilder.BuildRegisteredType("SPPauseDifficultyFlyin", {
			controllerIndex = arg_1_1
		})

		var_1_0:SetMap(arg_1_2)
		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_1_1, false, {
			disableQuickAccessShortcuts = false,
			widget = var_1_0
		})
	end
end

local function var_0_1(arg_2_0)
	arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		SPSharedUtils.ShaderPreloadWrap(function()
			Dvar.BDEHAEGHAF("start", "")
			assert(arg_3_0.levelInfo)

			local var_4_0 = arg_3_0.levelInfo

			if var_4_0.isCurrentMission then
				LUI.FlowManager.RequestPopupMenu(arg_3_0, "ResumeOrRestartPopup", false, arg_3_1.controller, false, {
					controllerIndex = arg_3_1.controller,
					mapName = var_4_0.levelName,
					levelName = var_4_0.displayName
				})
			else
				var_0_0(arg_3_0, arg_3_1.controller, var_4_0.levelName)
			end
		end)
	end)
end

local function var_0_2(arg_5_0, arg_5_1)
	arg_5_0.Image:setImage(arg_5_1.image)
	arg_5_0.Text:setText(arg_5_1.displayName)

	arg_5_0.levelInfo = arg_5_1

	if arg_5_0.levelInfo.isCurrentMission then
		arg_5_0.Equipped:SetAlpha(1)
	else
		arg_5_0.Equipped:SetAlpha(0)
	end
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Image:SetMask(arg_6_0.Mask)

	arg_6_0.SetupButton = var_0_2
	arg_6_0._controllerIndex = arg_6_1

	var_0_1(arg_6_0)
end

function LevelSelectButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 105 * _1080p)

	var_7_0.id = "LevelSelectButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:setUseStencil(true)

	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Image"

	var_7_4:SetAlpha(0.4, 0)
	var_7_4:SetColorOp(COLOR_OP.saturation, 0)
	var_7_4:SetColorOpParam(1, 0)
	var_7_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -105, _1080p * 105, _1080p * -105, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Image = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Mask"

	var_7_6:SetScale(0.05, 0)
	var_7_6:SetColorOp(COLOR_OP.saturation, 0)
	var_7_6:SetColorOpParam(1, 0)
	var_7_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -105, _1080p * 105, _1080p * -105, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.Mask = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "TextBacker"

	var_7_8:SetRGBFromInt(0, 0)
	var_7_8:SetAlpha(0.6, 0)
	var_7_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -28, 0)
	var_7_0:addElement(var_7_8)

	var_7_0.TextBacker = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "Text"

	var_7_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_10:setText("", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(1000)
	var_7_10:SetLineHoldTime(500)
	var_7_10:SetAnimMoveTime(500)
	var_7_10:SetAnimMoveSpeed(50)
	var_7_10:SetEndDelay(1000)
	var_7_10:SetCrossfadeTime(500)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetShadowRGBFromInt(0, 0)
	var_7_10:SetOutlineRGBFromInt(0, 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 9, _1080p * -30, _1080p * -28, _1080p * -4)
	var_7_0:addElement(var_7_10)

	var_7_0.Text = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "HighlightTop"

	var_7_12:SetAlpha(0, 0)
	var_7_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -105, _1080p * -103)
	var_7_0:addElement(var_7_12)

	var_7_0.HighlightTop = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "HighlightBottom"

	var_7_14:SetAlpha(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_7_0:addElement(var_7_14)

	var_7_0.HighlightBottom = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "Lock"

	var_7_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_7_16:SetAlpha(0, 0)
	var_7_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -86, _1080p * -46)
	var_7_0:addElement(var_7_16)

	var_7_0.Lock = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "Equipped"

	var_7_18:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_7_18:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 184, _1080p * 202, _1080p * 81, _1080p * 100)
	var_7_0:addElement(var_7_18)

	var_7_0.Equipped = var_7_18

	local var_7_19
	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		}
	}

	var_7_4:RegisterAnimationSequence("DefaultSequence", var_7_20)

	local var_7_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -33
		}
	}

	var_7_16:RegisterAnimationSequence("DefaultSequence", var_7_21)

	local function var_7_22()
		var_7_4:AnimateSequence("DefaultSequence")
		var_7_16:AnimateSequence("DefaultSequence")
	end

	var_7_0._sequences.DefaultSequence = var_7_22

	local var_7_23
	local var_7_24 = {
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_24)

	local var_7_25 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocusDark
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_25)

	local var_7_26 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOver", var_7_26)

	local var_7_27 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOver", var_7_27)

	local var_7_28 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOver", var_7_28)

	local var_7_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOver", var_7_29)

	local function var_7_30()
		var_7_4:AnimateSequence("ButtonOver")
		var_7_8:AnimateSequence("ButtonOver")
		var_7_10:AnimateSequence("ButtonOver")
		var_7_12:AnimateSequence("ButtonOver")
		var_7_14:AnimateSequence("ButtonOver")
		var_7_16:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_30

	local var_7_31
	local var_7_32 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_32)

	local var_7_33 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_33)

	local var_7_34 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUp", var_7_34)

	local var_7_35 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUp", var_7_35)

	local var_7_36 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUp", var_7_36)

	local var_7_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUp", var_7_37)

	local function var_7_38()
		var_7_4:AnimateSequence("ButtonUp")
		var_7_8:AnimateSequence("ButtonUp")
		var_7_10:AnimateSequence("ButtonUp")
		var_7_12:AnimateSequence("ButtonUp")
		var_7_14:AnimateSequence("ButtonUp")
		var_7_16:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_38

	local var_7_39
	local var_7_40 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_40)

	local var_7_41 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverDisabled", var_7_41)

	local var_7_42 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOverDisabled", var_7_42)

	local var_7_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOverDisabled", var_7_43)

	local function var_7_44()
		var_7_8:AnimateSequence("ButtonOverDisabled")
		var_7_12:AnimateSequence("ButtonOverDisabled")
		var_7_14:AnimateSequence("ButtonOverDisabled")
		var_7_16:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_44

	local var_7_45
	local var_7_46 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_46)

	local var_7_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpDisabled", var_7_47)

	local var_7_48 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpDisabled", var_7_48)

	local var_7_49 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUpDisabled", var_7_49)

	local var_7_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUpDisabled", var_7_50)

	local function var_7_51()
		var_7_8:AnimateSequence("ButtonUpDisabled")
		var_7_10:AnimateSequence("ButtonUpDisabled")
		var_7_12:AnimateSequence("ButtonUpDisabled")
		var_7_14:AnimateSequence("ButtonUpDisabled")
		var_7_16:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_51

	local var_7_52
	local var_7_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Completed", var_7_53)

	local function var_7_54()
		var_7_4:AnimateSequence("Completed")
	end

	var_7_0._sequences.Completed = var_7_54

	local var_7_55
	local var_7_56 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Disabled", var_7_56)

	local var_7_57 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("Disabled", var_7_57)

	local function var_7_58()
		var_7_4:AnimateSequence("Disabled")
		var_7_16:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_58

	var_7_0:addEventHandler("button_over", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "ButtonOver")
	end)
	var_7_0:addEventHandler("button_up", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "ButtonUp")
	end)
	var_7_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "ButtonOverDisabled")
	end)
	var_7_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "ButtonUpDisabled")
	end)
	var_0_3(var_7_0, var_7_1, arg_7_1)
	ACTIONS.AnimateSequence(var_7_0, "DefaultSequence")

	return var_7_0
end

MenuBuilder.registerType("LevelSelectButton", LevelSelectButton)
LockTable(_M)
