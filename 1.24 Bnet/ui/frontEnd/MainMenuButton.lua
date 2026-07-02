module(..., package.seeall)

local var_0_0 = 120
local var_0_1 = 2

function NewDone(arg_1_0)
	local var_1_0 = arg_1_0:getParent()

	ACTIONS.AnimateSequence(var_1_0, "New")
end

local var_0_2 = {
	[MAIN_MENU.BladeStates.Installing] = {
		refreshCondition = function(arg_2_0)
			local var_2_0 = type(arg_2_0._stateParameters.progress) ~= type(arg_2_0._lastStateParameters.progress)
			local var_2_1 = arg_2_0._stateParameters.suspended ~= arg_2_0._lastStateParameters.suspended

			return var_2_0 or var_2_1
		end,
		refreshAction = function(arg_3_0)
			ACTIONS.AnimateSequence(arg_3_0, "DefaultSequence")

			if arg_3_0._stateParameters.suspended then
				ACTIONS.AnimateSequence(arg_3_0, "InstallingSuspended")
			elseif arg_3_0._stateParameters.progress and type(arg_3_0._stateParameters.progress) == "number" then
				ACTIONS.AnimateSequence(arg_3_0, "InstallingProgress")
			else
				ACTIONS.AnimateSequence(arg_3_0, "Installing")
			end
		end
	},
	[MAIN_MENU.BladeStates.Blocked] = {
		refreshCondition = function(arg_4_0)
			return false
		end,
		refreshAction = function(arg_5_0)
			ACTIONS.AnimateSequence(arg_5_0, "DefaultSequence")
			ACTIONS.AnimateSequence(arg_5_0, "Blocked")
		end
	},
	[MAIN_MENU.BladeStates.New] = {
		refreshCondition = function(arg_6_0)
			return false
		end,
		refreshAction = function(arg_7_0)
			ACTIONS.AnimateSequence(arg_7_0, "DefaultSequence")
			ACTIONS.AnimateSequence(arg_7_0, "OnNew")
		end
	},
	[MAIN_MENU.BladeStates.Neutral] = {
		refreshCondition = function(arg_8_0)
			return false
		end,
		refreshAction = function(arg_9_0)
			ACTIONS.AnimateSequence(arg_9_0, "DefaultSequence")
		end
	}
}

local function var_0_3(arg_10_0)
	local var_10_0 = var_0_2[arg_10_0._currentState]

	if var_10_0 and (arg_10_0._currentState ~= arg_10_0._lastState or var_10_0.refreshCondition(arg_10_0)) then
		var_10_0.refreshAction(arg_10_0)
	end
end

local function var_0_4(arg_11_0)
	if arg_11_0._stateParameters.progress and type(arg_11_0._stateParameters.progress) == "number" then
		arg_11_0.InstallProgressBar:SetProgress(arg_11_0._stateParameters.progress, var_0_0, var_0_1)
	end
end

local function var_0_5(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._currentState = arg_12_1
	arg_12_0._stateParameters = arg_12_2

	var_0_3(arg_12_0)
	var_0_4(arg_12_0)

	arg_12_0._lastState = arg_12_1
	arg_12_0._lastStateParameters = arg_12_2
end

local function var_0_6(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.Mask:SetAlpha(1, 0)
	arg_13_0.Glint:SetMask(arg_13_0.Mask)

	arg_13_0._lastState = MAIN_MENU.BladeStates.Neutral
	arg_13_0._stateParameters = {}
	arg_13_0._lastStateParameters = {}
	arg_13_0.RefreshState = var_0_5

	arg_13_0:setActionSFX(SOUND_SETS.mainMenu.selectMode)
end

function MainMenuButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 50 * _1080p)

	var_14_0.id = "MainMenuButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "Background"

	var_14_4:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
	var_14_4:SetPixelGridEnabled(true)
	var_14_4:SetPixelGridContrast(0.5, 0)
	var_14_4:SetPixelGridBlockWidth(2, 0)
	var_14_4:SetPixelGridBlockHeight(2, 0)
	var_14_4:SetPixelGridGutterWidth(1, 0)
	var_14_4:SetPixelGridGutterHeight(1, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.Background = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIStyledText.new()

	var_14_6.id = "Text"

	var_14_6:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_14_6:SetAlpha(0.4, 0)
	var_14_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_14_6:setText("", 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_6:SetWordWrap(false)
	var_14_6:SetAlignment(LUI.Alignment.Center)
	var_14_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_14_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_6:SetStartupDelay(1000)
	var_14_6:SetLineHoldTime(400)
	var_14_6:SetAnimMoveTime(150)
	var_14_6:SetAnimMoveSpeed(50)
	var_14_6:SetEndDelay(1000)
	var_14_6:SetCrossfadeTime(400)
	var_14_6:SetFadeInTime(300)
	var_14_6:SetFadeOutTime(300)
	var_14_6:SetMaxVisibleLines(1)
	var_14_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * -18, _1080p * 18)
	var_14_0:addElement(var_14_6)

	var_14_0.Text = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "Lock"

	var_14_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_14_8:SetAlpha(0, 0)
	var_14_8:SetScale(-0.25, 0)
	var_14_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_14_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_14_0:addElement(var_14_8)

	var_14_0.Lock = var_14_8

	local var_14_9
	local var_14_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_14_1
	})

	var_14_10.id = "NewIcon"

	var_14_10:SetAlpha(0, 0)
	var_14_10:SetPixelGridEnabled(true)
	var_14_10:SetPixelGridContrast(0.8, 0)
	var_14_10:SetPixelGridBlockWidth(2, 0)
	var_14_10:SetPixelGridBlockHeight(2, 0)
	var_14_10:SetPixelGridGutterWidth(1, 0)
	var_14_10:SetPixelGridGutterHeight(1, 0)
	var_14_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -15, _1080p * -4, _1080p * 4)
	var_14_0:addElement(var_14_10)

	var_14_0.NewIcon = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "Glint"

	var_14_12:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_14_12:SetAlpha(0, 0)
	var_14_12:SetZRotation(-45, 0)
	var_14_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_14_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -36, 0, _1080p * -27, _1080p * 75)
	var_14_0:addElement(var_14_12)

	var_14_0.Glint = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIImage.new()

	var_14_14.id = "Mask"

	var_14_14:SetAlpha(0, 0)
	var_14_14:setImage(RegisterMaterial("stencil_mask"), 0)
	var_14_0:addElement(var_14_14)

	var_14_0.Mask = var_14_14

	local var_14_15
	local var_14_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_14_1
	})

	var_14_16.id = "HighlightTop"

	var_14_16:SetAlpha(0, 0)
	var_14_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_14_0:addElement(var_14_16)

	var_14_0.HighlightTop = var_14_16

	local var_14_17
	local var_14_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_14_1
	})

	var_14_18.id = "HighlightBottom"

	var_14_18:SetAlpha(0, 0)
	var_14_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_14_0:addElement(var_14_18)

	var_14_0.HighlightBottom = var_14_18

	local var_14_19
	local var_14_20 = MenuBuilder.BuildRegisteredType("InstallProgressBar", {
		controllerIndex = var_14_1
	})

	var_14_20.id = "InstallProgressBar"

	var_14_20:SetAlpha(0, 0)
	var_14_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 6, _1080p * 11)
	var_14_0:addElement(var_14_20)

	var_14_0.InstallProgressBar = var_14_20

	local var_14_21
	local var_14_22 = LUI.UIImage.new()

	var_14_22.id = "Spinner"

	var_14_22:SetAlpha(0, 0)
	var_14_22:setImage(RegisterMaterial("spinner_loading"), 0)
	var_14_22:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 6, _1080p * 11)
	var_14_0:addElement(var_14_22)

	var_14_0.Spinner = var_14_22

	local var_14_23
	local var_14_24 = LUI.UIImage.new()

	var_14_24.id = "Gradient"

	var_14_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_14_24:SetAlpha(0, 0)
	var_14_24:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_14_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 50)
	var_14_0:addElement(var_14_24)

	var_14_0.Gradient = var_14_24

	local var_14_25
	local var_14_26 = LUI.UIImage.new()

	var_14_26.id = "LineTop"

	var_14_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_14_26:SetAlpha(0, 0)
	var_14_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_14_0:addElement(var_14_26)

	var_14_0.LineTop = var_14_26

	local var_14_27
	local var_14_28 = LUI.UIImage.new()

	var_14_28.id = "LineBottom"

	var_14_28:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_14_28:SetAlpha(0, 0)
	var_14_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 48, _1080p * 50)
	var_14_0:addElement(var_14_28)

	var_14_0.LineBottom = var_14_28

	local var_14_29
	local var_14_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		}
	}

	var_14_4:RegisterAnimationSequence("DefaultSequence", var_14_30)

	local var_14_31 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		}
	}

	var_14_6:RegisterAnimationSequence("DefaultSequence", var_14_31)

	local var_14_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("DefaultSequence", var_14_32)

	local var_14_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("DefaultSequence", var_14_33)

	local var_14_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("DefaultSequence", var_14_34)

	local var_14_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("DefaultSequence", var_14_35)

	local var_14_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("DefaultSequence", var_14_36)

	local var_14_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("DefaultSequence", var_14_37)

	local var_14_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_14_0.InstallProgressBar.Fill
		}
	}

	var_14_20:RegisterAnimationSequence("DefaultSequence", var_14_38)

	local var_14_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("DefaultSequence", var_14_39)

	local var_14_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("DefaultSequence", var_14_40)

	local var_14_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("DefaultSequence", var_14_41)

	local var_14_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("DefaultSequence", var_14_42)

	local function var_14_43()
		var_14_4:AnimateSequence("DefaultSequence")
		var_14_6:AnimateSequence("DefaultSequence")
		var_14_8:AnimateSequence("DefaultSequence")
		var_14_10:AnimateSequence("DefaultSequence")
		var_14_12:AnimateSequence("DefaultSequence")
		var_14_14:AnimateSequence("DefaultSequence")
		var_14_16:AnimateSequence("DefaultSequence")
		var_14_18:AnimateSequence("DefaultSequence")
		var_14_20:AnimateSequence("DefaultSequence")
		var_14_22:AnimateSequence("DefaultSequence")
		var_14_24:AnimateSequence("DefaultSequence")
		var_14_26:AnimateSequence("DefaultSequence")
		var_14_28:AnimateSequence("DefaultSequence")
	end

	var_14_0._sequences.DefaultSequence = var_14_43

	local var_14_44
	local var_14_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		},
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		}
	}

	var_14_4:RegisterAnimationSequence("Blocked", var_14_45)

	local var_14_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		}
	}

	var_14_6:RegisterAnimationSequence("Blocked", var_14_46)

	local var_14_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("Blocked", var_14_47)

	local function var_14_48()
		var_14_4:AnimateSequence("Blocked")
		var_14_6:AnimateSequence("Blocked")
		var_14_8:AnimateSequence("Blocked")
	end

	var_14_0._sequences.Blocked = var_14_48

	local var_14_49
	local var_14_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		}
	}

	var_14_4:RegisterAnimationSequence("New", var_14_50)

	local var_14_51 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		}
	}

	var_14_6:RegisterAnimationSequence("New", var_14_51)

	local var_14_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
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
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 234,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 374,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0.2,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -44,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 1990,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -54
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1990,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 401
		},
		{
			duration = 1990,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 304
		},
		{
			duration = 1990,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 133
		},
		{
			value = 0,
			duration = 1970,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("New", var_14_52)

	local var_14_53 = {
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("New", var_14_53)

	local var_14_54 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			value = 1,
			duration = 2500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.7,
			duration = 2500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_16:RegisterAnimationSequence("New", var_14_54)

	local var_14_55 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 1,
			duration = 2500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.7,
			duration = 2500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_18:RegisterAnimationSequence("New", var_14_55)

	local var_14_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("New", var_14_56)

	local var_14_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("New", var_14_57)

	local var_14_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
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
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("New", var_14_58)

	local var_14_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
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
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("New", var_14_59)

	local function var_14_60()
		var_14_4:AnimateLoop("New")
		var_14_6:AnimateLoop("New")
		var_14_12:AnimateLoop("New")
		var_14_14:AnimateLoop("New")
		var_14_16:AnimateLoop("New")
		var_14_18:AnimateLoop("New")
		var_14_20:AnimateLoop("New")
		var_14_22:AnimateLoop("New")
		var_14_26:AnimateLoop("New")
		var_14_28:AnimateLoop("New")
	end

	var_14_0._sequences.New = var_14_60

	local var_14_61
	local var_14_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("InstallingProgress", var_14_62)

	local function var_14_63()
		var_14_20:AnimateSequence("InstallingProgress")
	end

	var_14_0._sequences.InstallingProgress = var_14_63

	local var_14_64
	local var_14_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 110,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("OnNew", var_14_65)

	local var_14_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 110,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("OnNew", var_14_66)

	local var_14_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 200,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 468,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -268,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_14_24:RegisterAnimationSequence("OnNew", var_14_67)

	local var_14_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 110,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("OnNew", var_14_68)

	local var_14_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 110,
			property = TWEEN_PROPERTY.Alpha,
			onComplete = NewDone
		}
	}

	var_14_28:RegisterAnimationSequence("OnNew", var_14_69)

	local function var_14_70()
		var_14_16:AnimateSequence("OnNew")
		var_14_18:AnimateSequence("OnNew")
		var_14_24:AnimateSequence("OnNew")
		var_14_26:AnimateSequence("OnNew")
		var_14_28:AnimateSequence("OnNew")
	end

	var_14_0._sequences.OnNew = var_14_70

	local var_14_71
	local var_14_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("Installing", var_14_72)

	local function var_14_73()
		var_14_22:AnimateSequence("Installing")
	end

	var_14_0._sequences.Installing = var_14_73

	local var_14_74
	local var_14_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.barEmpty,
			child = var_14_0.InstallProgressBar.Fill
		}
	}

	var_14_20:RegisterAnimationSequence("InstallingSuspended", var_14_75)

	local function var_14_76()
		var_14_20:AnimateSequence("InstallingSuspended")
	end

	var_14_0._sequences.InstallingSuspended = var_14_76

	var_0_6(var_14_0, var_14_1, arg_14_1)
	ACTIONS.AnimateSequence(var_14_0, "DefaultSequence")

	return var_14_0
end

MenuBuilder.registerType("MainMenuButton", MainMenuButton)
LockTable(_M)
