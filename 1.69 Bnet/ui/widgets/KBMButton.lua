module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0.KeyString)

	local var_1_0 = 24
	local var_1_1 = 2
	local var_1_2 = arg_1_0:GetCurrentAnchorsAndPositions()
	local var_1_3 = math.max(LAYOUT.GetTextWidth(arg_1_0.KeyString) + var_1_1, var_1_0) - math.abs(var_1_2.right - var_1_2.left)
	local var_1_4 = var_1_2.left - var_1_3 * var_1_2.leftAnchor
	local var_1_5 = var_1_2.right + var_1_3 * var_1_2.rightAnchor

	arg_1_0:SetAnchorsAndPosition(var_1_2.leftAnchor, var_1_2.rightAnchor, var_1_2.topAnchor, var_1_2.bottomAnchor, var_1_4, var_1_5, var_1_2.top, var_1_2.bottom, 0.1)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.KeyString)

	if Engine.ECDECFCHJA(arg_2_1, arg_2_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_2_0, "KBMUnbound")
	else
		ACTIONS.AnimateSequence(arg_2_0, "KBMBound")
	end

	arg_2_0.KeyString:setText(arg_2_1)
	arg_2_0:FitWidgetToContent()
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.SetPromptText = var_0_1
	arg_3_0.FitWidgetToContent = var_0_0
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0:Wait(1).onComplete = function()
		arg_3_0:FitWidgetToContent()
	end
end

function KBMButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 24 * _1080p, 0, 24 * _1080p)

	var_5_0.id = "KBMButton"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Foreground"

	var_5_4:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_4:setImage(RegisterMaterial("ui_keybind_backing"), 0)
	var_5_4:Setup9SliceImage(_1080p * 10, _1080p * 10, 0.3, 0.3)
	var_5_0:addElement(var_5_4)

	var_5_0.Foreground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "KeyString"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.backgroundDisabled, 0)
	var_5_6:setText("F2", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:setTextStyle(CoD.TextStyle.Shadowed)
	var_5_6:SetWordWrap(false)
	var_5_6:SetAlignment(LUI.Alignment.Center)
	var_5_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 3, _1080p * -3, _1080p * -9, _1080p * 9)
	var_5_0:addElement(var_5_6)

	var_5_0.KeyString = var_5_6

	local function var_5_7()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_7

	local var_5_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing_unbound")
		}
	}

	var_5_4:RegisterAnimationSequence("KBMUnbound", var_5_8)

	local var_5_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_6:RegisterAnimationSequence("KBMUnbound", var_5_9)

	local function var_5_10()
		var_5_4:AnimateSequence("KBMUnbound")
		var_5_6:AnimateSequence("KBMUnbound")
	end

	var_5_0._sequences.KBMUnbound = var_5_10

	local var_5_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing")
		}
	}

	var_5_4:RegisterAnimationSequence("KBMBound", var_5_11)

	local var_5_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_5_6:RegisterAnimationSequence("KBMBound", var_5_12)

	local function var_5_13()
		var_5_4:AnimateSequence("KBMBound")
		var_5_6:AnimateSequence("KBMBound")
	end

	var_5_0._sequences.KBMBound = var_5_13

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("KBMButton", KBMButton)
LockTable(_M)
