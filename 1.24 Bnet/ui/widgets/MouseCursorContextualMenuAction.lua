module(..., package.seeall)

function MouseCursorContextualMenuAction(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -150 * _1080p, 150 * _1080p, -15 * _1080p, 15 * _1080p)

	var_1_0.id = "MouseCursorContextualMenuAction"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.objectiveComplete, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "GenericFooterButtonBackground0"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 30)
	var_1_0:addElement(var_1_6)

	var_1_0.GenericFooterButtonBackground0 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "ActionName"

	var_1_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 16, _1080p * -16, _1080p * -24, _1080p * -6)
	var_1_0:addElement(var_1_8)

	var_1_0.ActionName = var_1_8

	local var_1_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_10

	local var_1_11 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_11)

	local var_1_12 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_14)

	local var_1_15 = {
		{
			duration = 50,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_16

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("MouseCursorContextualMenuAction", MouseCursorContextualMenuAction)
LockTable(_M)
