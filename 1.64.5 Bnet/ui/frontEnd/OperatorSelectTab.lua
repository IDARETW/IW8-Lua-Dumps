module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	function arg_1_0.Enable(arg_2_0)
		arg_2_0._disabled = false

		ACTIONS.AnimateSequence(arg_2_0, "Selected")
	end

	function arg_1_0.Disable(arg_3_0)
		arg_3_0._disabled = true

		ACTIONS.AnimateSequence(arg_3_0, "NotSelected")
	end

	function arg_1_0.IsEnabled(arg_4_0)
		return not arg_4_0._disabled
	end

	arg_1_0:registerEventHandler("mouseenter", function(arg_5_0, arg_5_1)
		if not arg_5_0.focused and not arg_5_0._disabled then
			ACTIONS.AnimateSequence(arg_5_0, "Selected")

			arg_5_0.focused = true
		end
	end)
	arg_1_0:registerEventHandler("mouseleave", function(arg_6_0, arg_6_1)
		if arg_6_0.focused and not arg_6_0._disabled then
			ACTIONS.AnimateSequence(arg_6_0, "NotSelected")

			arg_6_0.focused = false
		end
	end)
	arg_1_0:registerEventHandler("focus_tab", function(arg_7_0, arg_7_1)
		if arg_7_1.index == arg_7_0.index then
			ACTIONS.AnimateSequence(arg_7_0, "Selected")

			arg_7_0.focused = true
		elseif arg_7_0.focused then
			ACTIONS.AnimateSequence(arg_7_0, "NotSelected")

			arg_7_0.focused = false
		end
	end)
end

function OperatorSelectTab(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_8_0.id = "OperatorSelectTab"
	var_8_0._animationSets = {}
	var_8_0._sequences = {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_5 = LUI.UIBorder.new(var_8_4)

	var_8_5.id = "Border"

	var_8_0:addElement(var_8_5)

	var_8_0.Border = var_8_5

	local var_8_6
	local var_8_7 = LUI.UIImage.new()

	var_8_7.id = "FillImage"

	var_8_7:SetRGBFromInt(0, 0)
	var_8_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_8_0:addElement(var_8_7)

	var_8_0.FillImage = var_8_7

	local function var_8_8()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_8

	local var_8_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_7:RegisterAnimationSequence("Selected", var_8_9)

	local function var_8_10()
		var_8_7:AnimateSequence("Selected")
	end

	var_8_0._sequences.Selected = var_8_10

	local var_8_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_7:RegisterAnimationSequence("NotSelected", var_8_11)

	local function var_8_12()
		var_8_7:AnimateSequence("NotSelected")
	end

	var_8_0._sequences.NotSelected = var_8_12

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("OperatorSelectTab", OperatorSelectTab)
LockTable(_M)
