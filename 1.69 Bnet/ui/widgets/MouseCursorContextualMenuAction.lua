module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function MouseCursorContextualMenuAction(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -150 * _1080p, 150 * _1080p, -15 * _1080p, 15 * _1080p)

	var_4_0.id = "MouseCursorContextualMenuAction"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.objectiveComplete, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericFooterButtonBackground0"

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 30)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericFooterButtonBackground0 = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "ActionName"

	var_4_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 16, _1080p * -16, _1080p * -24, _1080p * -6)
	var_4_0:addElement(var_4_8)

	var_4_0.ActionName = var_4_8

	local var_4_9
	local var_4_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_13)

	local var_4_14 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_17)

	local var_4_18 = {
		{
			duration = 50,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipSetup", var_4_21)

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("WZWipSetup")
		var_4_8:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_23

	local var_4_24
	local var_4_25 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipButtonOver", var_4_25)

	local function var_4_26()
		var_4_8:AnimateSequence("WZWipButtonOver")
	end

	var_4_0._sequences.WZWipButtonOver = var_4_26

	local var_4_27
	local var_4_28 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipButtonUp", var_4_28)

	local function var_4_29()
		var_4_8:AnimateSequence("WZWipButtonUp")
	end

	var_4_0._sequences.WZWipButtonUp = var_4_29

	var_0_0(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("MouseCursorContextualMenuAction", MouseCursorContextualMenuAction)
LockTable(_M)
