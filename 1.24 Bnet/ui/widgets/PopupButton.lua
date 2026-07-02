module(..., package.seeall)

function PostLoadFunc(arg_1_0)
	assert(arg_1_0.Label)

	function arg_1_0.SetText(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0._doNotForceUpperCase and arg_2_1 or ToUpperCase(arg_2_1)

		arg_2_0.Label:setText(var_2_0)
	end

	local var_1_0 = LUI.Alignment.Center

	arg_1_0:SetNotifyOnLayoutInit(true)
	arg_1_0:addEventHandler("layout_initialized", function(arg_3_0, arg_3_1)
		if arg_3_0.Label then
			var_1_0 = arg_3_0.Label:getHorizontalAlignment()
		end
	end)
	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		arg_1_0.Background:SetupButton(arg_1_0.Label, arg_1_0.Label:getText(), var_1_0)
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		arg_1_0.Background:SetupButton(arg_1_0.Label, arg_1_0.Label:getText(), var_1_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function PopupButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 40 * _1080p)

	var_6_0.id = "PopupButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Backer"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_4:SetAlpha(0.6, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Backer = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Background"

	var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Background = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "Label"

	var_6_8:SetRGBFromInt(8421504, 0)
	var_6_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 40, _1080p * -40, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_8)

	var_6_0.Label = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "Lock"

	var_6_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_6_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -26, _1080p * -10, _1080p * -8, _1080p * 8)
	var_6_0:addElement(var_6_10)

	var_6_0.Lock = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("Focused", var_6_13)

	local var_6_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Focused", var_6_14)

	local function var_6_15()
		var_6_8:AnimateSequence("Focused")
		var_6_10:AnimateSequence("Focused")
	end

	var_6_0._sequences.Focused = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("NotFocused", var_6_17)

	local var_6_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("NotFocused", var_6_18)

	local function var_6_19()
		var_6_8:AnimateSequence("NotFocused")
		var_6_10:AnimateSequence("NotFocused")
	end

	var_6_0._sequences.NotFocused = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_6_8:RegisterAnimationSequence("NotFocusedDisabled", var_6_21)

	local var_6_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("NotFocusedDisabled", var_6_22)

	local function var_6_23()
		var_6_8:AnimateSequence("NotFocusedDisabled")
		var_6_10:AnimateSequence("NotFocusedDisabled")
	end

	var_6_0._sequences.NotFocusedDisabled = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_6_8:RegisterAnimationSequence("FocusedDisabled", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("FocusedDisabled", var_6_26)

	local function var_6_27()
		var_6_8:AnimateSequence("FocusedDisabled")
		var_6_10:AnimateSequence("FocusedDisabled")
	end

	var_6_0._sequences.FocusedDisabled = var_6_27

	local var_6_28
	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_6_8:RegisterAnimationSequence("AR", var_6_29)

	local function var_6_30()
		var_6_8:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_30

	var_6_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Focused")
	end)
	var_6_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "NotFocused")
	end)
	var_6_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "FocusedDisabled")
	end)
	var_6_0:addEventHandler("button_disable", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "NotFocusedDisabled")
	end)
	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PopupButton", PopupButton)
LockTable(_M)
