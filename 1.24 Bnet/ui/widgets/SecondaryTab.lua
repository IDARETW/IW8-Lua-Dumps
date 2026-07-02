module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Text)
	arg_1_0.Text:setText(arg_1_1)
end

function RefreshAnimation(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		if arg_2_2 then
			assert(arg_2_0._sequences and arg_2_0._sequences[arg_2_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
		end
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = LUI.Alignment.Left

	arg_3_0:SetNotifyOnLayoutInit(true)
	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		RefreshAnimation(arg_4_0, "ButtonOver")
	end)
	arg_3_0:addEventHandler("active", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, "ButtonActive")
	end)
	arg_3_0:addEventHandler("button_active", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonUpActive")
	end)
	arg_3_0:addEventHandler("button_over_active", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonOverActive")
	end)
	arg_3_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, "ButtonUp")
	end)
	arg_3_0:addEventHandler("button_disable_active", function(arg_9_0, arg_9_1)
		RefreshAnimation(arg_9_0, "ButtonDisabledActive")
	end)
	arg_3_0:addEventHandler("button_over_disable_active", function(arg_10_0, arg_10_1)
		RefreshAnimation(arg_10_0, "ButtonOverDisabledActive")
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_11_0, arg_11_1)
		RefreshAnimation(arg_11_0, "ButtonOverDisabled")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		RefreshAnimation(arg_12_0, "ButtonUpDisabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	arg_3_0.SetText = var_0_0
end

function SecondaryTab(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 99 * _1080p, 0, 50 * _1080p)

	var_13_0.id = "SecondaryTab"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "BackerGradient"

	var_13_4:SetRGBFromInt(10405602, 0)
	var_13_4:SetAlpha(0, 0)
	var_13_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_13_0:addElement(var_13_4)

	var_13_0.BackerGradient = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "Highlight"

	var_13_6:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_13_6:SetAlpha(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_13_0:addElement(var_13_6)

	var_13_0.Highlight = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIStyledText.new()

	var_13_8.id = "Text"

	var_13_8:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_8:SetWordWrap(false)
	var_13_8:SetAlignment(LUI.Alignment.Center)
	var_13_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_13_8:SetShadowRGBFromTable(SWATCHES.tabManager.tabTextFocused, 0)
	var_13_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -7, _1080p * 11)
	var_13_0:addElement(var_13_8)

	var_13_0.Text = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIImage.new()

	var_13_10.id = "Lock"

	var_13_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_13_10:SetAlpha(0, 0)
	var_13_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13)
	var_13_0:addElement(var_13_10)

	var_13_0.Lock = var_13_10

	local var_13_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("DefaultSequence", var_13_11)

	local function var_13_12()
		var_13_10:AnimateSequence("DefaultSequence")
	end

	var_13_0._sequences.DefaultSequence = var_13_12

	local var_13_13 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonOver", var_13_13)

	local var_13_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOver", var_13_14)

	local var_13_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOver", var_13_15)

	local function var_13_16()
		var_13_4:AnimateSequence("ButtonOver")
		var_13_8:AnimateSequence("ButtonOver")
		var_13_10:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_16

	local var_13_17 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonUp", var_13_17)

	local var_13_18 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUp", var_13_18)

	local var_13_19 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUp", var_13_19)

	local var_13_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUp", var_13_20)

	local function var_13_21()
		var_13_4:AnimateSequence("ButtonUp")
		var_13_6:AnimateSequence("ButtonUp")
		var_13_8:AnimateSequence("ButtonUp")
		var_13_10:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_21

	local function var_13_22()
		return
	end

	var_13_0._sequences.Locked = var_13_22

	local function var_13_23()
		return
	end

	var_13_0._sequences.NewNotification = var_13_23

	local var_13_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverDisabled", var_13_24)

	local function var_13_25()
		var_13_10:AnimateSequence("ButtonOverDisabled")
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_25

	local var_13_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpDisabled", var_13_26)

	local function var_13_27()
		var_13_10:AnimateSequence("ButtonUpDisabled")
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_27

	local function var_13_28()
		return
	end

	var_13_0._sequences.ButtonUpSnap = var_13_28

	local var_13_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_13_29)

	local function var_13_30()
		var_13_10:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_13_0._sequences.ButtonUpDisabledSnap = var_13_30

	local var_13_31 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonActive", var_13_31)

	local var_13_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonActive", var_13_32)

	local var_13_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonActive", var_13_33)

	local var_13_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonActive", var_13_34)

	local function var_13_35()
		var_13_4:AnimateSequence("ButtonActive")
		var_13_6:AnimateSequence("ButtonActive")
		var_13_8:AnimateSequence("ButtonActive")
		var_13_10:AnimateSequence("ButtonActive")
	end

	var_13_0._sequences.ButtonActive = var_13_35

	local var_13_36 = {
		{
			value = 0.35,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonOverActive", var_13_36)

	local var_13_37 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverActive", var_13_37)

	local var_13_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverActive", var_13_38)

	local var_13_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverActive", var_13_39)

	local function var_13_40()
		var_13_4:AnimateSequence("ButtonOverActive")
		var_13_6:AnimateSequence("ButtonOverActive")
		var_13_8:AnimateSequence("ButtonOverActive")
		var_13_10:AnimateSequence("ButtonOverActive")
	end

	var_13_0._sequences.ButtonOverActive = var_13_40

	local var_13_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonDisabledActive", var_13_41)

	local function var_13_42()
		var_13_10:AnimateSequence("ButtonDisabledActive")
	end

	var_13_0._sequences.ButtonDisabledActive = var_13_42

	local var_13_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverDisabledActive", var_13_43)

	local function var_13_44()
		var_13_10:AnimateSequence("ButtonOverDisabledActive")
	end

	var_13_0._sequences.ButtonOverDisabledActive = var_13_44

	local var_13_45 = {
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonUpActive", var_13_45)

	local var_13_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpActive", var_13_46)

	local var_13_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpActive", var_13_47)

	local var_13_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpActive", var_13_48)

	local function var_13_49()
		var_13_4:AnimateSequence("ButtonUpActive")
		var_13_6:AnimateSequence("ButtonUpActive")
		var_13_8:AnimateSequence("ButtonUpActive")
		var_13_10:AnimateSequence("ButtonUpActive")
	end

	var_13_0._sequences.ButtonUpActive = var_13_49

	local var_13_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_13_8:RegisterAnimationSequence("AR", var_13_50)

	local function var_13_51()
		var_13_8:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_51

	PostLoadFunc(var_13_0, var_13_1, arg_13_1)
	ACTIONS.AnimateSequence(var_13_0, "DefaultSequence")

	return var_13_0
end

MenuBuilder.registerType("SecondaryTab", SecondaryTab)
LockTable(_M)
