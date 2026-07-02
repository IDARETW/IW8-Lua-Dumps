module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	ACTIONS.AnimateSequence(arg_1_0, "ShowTimer")

	if arg_1_1 and arg_1_1 - arg_1_3 > 0 then
		arg_1_0.TimerText:setText(Engine.JCBDICCAH(Engine.BJCFFHAIFA(arg_1_1 - arg_1_3)))
	elseif arg_1_2 and arg_1_2 - arg_1_3 > 0 then
		arg_1_0.TimerText:setText(Engine.JCBDICCAH(Engine.BJCFFHAIFA(arg_1_2 - arg_1_3)))
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideTimer")
	end
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "HideTimer")
	ACTIONS.AnimateSequence(arg_2_0, "SetAvailable")
end

local function var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "SetUnavailable")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupTimer = var_0_0
	arg_4_0.SetAvailable = var_0_1
	arg_4_0.SetUnavailable = var_0_2

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end

	if IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_4_0, "RU")
	end
end

function DoubleXPNotificationElement(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 108 * _1080p, 0, 92 * _1080p)

	var_5_0.id = "DoubleXPNotificationElement"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Image"

	var_5_4:setImage(RegisterMaterial("icon_xp_token_unavailable"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 1, _1080p * 65)
	var_5_0:addElement(var_5_4)

	var_5_0.Image = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "TimerText"

	var_5_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Center)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 64, _1080p * 82)
	var_5_0:addElement(var_5_6)

	var_5_0.TimerText = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "Available"

	var_5_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("MENU/UNAVAILABLE"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 65, _1080p * 83)
	var_5_0:addElement(var_5_8)

	var_5_0.Available = var_5_8

	local var_5_9

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_9 = LUI.UIStyledText.new()
		var_5_9.id = "Category"

		var_5_9:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
		var_5_9:setText("", 0)
		var_5_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_5_9:SetWordWrap(false)
		var_5_9:SetAlignment(LUI.Alignment.Center)
		var_5_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -19, _1080p * -3)
		var_5_0:addElement(var_5_9)

		var_5_0.Category = var_5_9
	end

	local function var_5_10()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_10

	local var_5_11
	local var_5_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("HideTimer", var_5_12)

	local function var_5_13()
		var_5_6:AnimateSequence("HideTimer")
	end

	var_5_0._sequences.HideTimer = var_5_13

	local var_5_14
	local var_5_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ShowTimer", var_5_15)

	local var_5_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ShowTimer", var_5_16)

	local var_5_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_5_8:RegisterAnimationSequence("ShowTimer", var_5_17)

	local function var_5_18()
		var_5_4:AnimateSequence("ShowTimer")
		var_5_6:AnimateSequence("ShowTimer")
		var_5_8:AnimateSequence("ShowTimer")
	end

	var_5_0._sequences.ShowTimer = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("SetAvailable", var_5_20)

	local var_5_21 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/AVAILABLE")
		}
	}

	var_5_8:RegisterAnimationSequence("SetAvailable", var_5_21)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_22 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_9:RegisterAnimationSequence("SetAvailable", var_5_22)
	end

	local function var_5_23()
		var_5_4:AnimateSequence("SetAvailable")
		var_5_8:AnimateSequence("SetAvailable")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_9:AnimateSequence("SetAvailable")
		end
	end

	var_5_0._sequences.SetAvailable = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_25)

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipSetup", var_5_26)

	local function var_5_27()
		var_5_6:AnimateSequence("WZWipSetup")
		var_5_8:AnimateSequence("WZWipSetup")
	end

	var_5_0._sequences.WZWipSetup = var_5_27

	local var_5_28

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_29 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_5_9:RegisterAnimationSequence("HighlightCategory", var_5_29)
	end

	local function var_5_30()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_9:AnimateSequence("HighlightCategory")
		end
	end

	var_5_0._sequences.HighlightCategory = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("SetUnavailable", var_5_32)

	local var_5_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("SetUnavailable", var_5_33)

	local var_5_34 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/UNAVAILABLE")
		}
	}

	var_5_8:RegisterAnimationSequence("SetUnavailable", var_5_34)

	local function var_5_35()
		var_5_4:AnimateSequence("SetUnavailable")
		var_5_6:AnimateSequence("SetUnavailable")
		var_5_8:AnimateSequence("SetUnavailable")
	end

	var_5_0._sequences.SetUnavailable = var_5_35

	local var_5_36
	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 65
		}
	}

	var_5_6:RegisterAnimationSequence("RU", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		}
	}

	var_5_8:RegisterAnimationSequence("RU", var_5_38)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -17
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -5
			}
		}

		var_5_9:RegisterAnimationSequence("RU", var_5_39)
	end

	local function var_5_40()
		var_5_6:AnimateSequence("RU")
		var_5_8:AnimateSequence("RU")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_9:AnimateSequence("RU")
		end
	end

	var_5_0._sequences.RU = var_5_40

	local var_5_41
	local var_5_42 = {
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 77
		}
	}

	var_5_4:RegisterAnimationSequence("SmallIcon", var_5_42)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_43 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 5
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 21
			}
		}

		var_5_9:RegisterAnimationSequence("SmallIcon", var_5_43)
	end

	local function var_5_44()
		var_5_4:AnimateSequence("SmallIcon")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_9:AnimateSequence("SmallIcon")
		end
	end

	var_5_0._sequences.SmallIcon = var_5_44

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("DoubleXPNotificationElement", DoubleXPNotificationElement)
LockTable(_M)
