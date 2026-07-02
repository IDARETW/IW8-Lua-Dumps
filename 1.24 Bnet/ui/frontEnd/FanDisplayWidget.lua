module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.widget)
	assert(arg_1_2.numWidgets)

	if not arg_1_2.width then
		local var_1_0 = 0
	end

	if not arg_1_2.height then
		local var_1_1 = 0
	end

	if not arg_1_2.maxHorizontalOffset then
		local var_1_2 = 0
	end

	if not arg_1_2.minVerticalOffset then
		local var_1_3 = 0
	end

	if not arg_1_2.maxVerticalOffset then
		local var_1_4 = 0
	end

	if not arg_1_2.startRotation then
		local var_1_5 = 0
	end

	if not arg_1_2.finalRotation then
		local var_1_6 = 0
	end

	arg_1_0.widgets = {}

	for iter_1_0 = 0, arg_1_2.numWidgets - 1 do
		local var_1_7 = (iter_1_0 + 1) / arg_1_2.numWidgets
		local var_1_8 = var_1_7 * var_1_7
		local var_1_9 = LUI.Lerp(0, arg_1_2.maxHorizontalOffset, var_1_8)
		local var_1_10 = LUI.Lerp(0, arg_1_2.maxVerticalOffset - arg_1_2.minVerticalOffset, var_1_8)

		if var_1_10 > math.abs(arg_1_2.minVerticalOffset) then
			var_1_10 = arg_1_2.minVerticalOffset + (var_1_10 - math.abs(arg_1_2.minVerticalOffset))
		else
			var_1_10 = var_1_10 * -1
		end

		local var_1_11
		local var_1_12 = MenuBuilder.BuildRegisteredType(arg_1_2.widget, {
			controllerIndex = arg_1_1
		})

		var_1_12.id = "Widget" .. iter_1_0

		var_1_12:SetZRotation(LUI.Lerp(arg_1_2.startRotation, arg_1_2.finalRotation, var_1_8))
		var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_1_9, _1080p * (arg_1_2.width + var_1_9), _1080p * var_1_10, _1080p * (arg_1_2.height + var_1_10))
		arg_1_0:addElement(var_1_12)

		arg_1_0["Widget" .. iter_1_0] = var_1_12

		table.insert(arg_1_0.widgets, arg_1_0["Widget" .. iter_1_0])
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.BuildWidgets = var_0_0
end

function FanDisplayWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_3_0.id = "FanDisplayWidget"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "PlacementBG"

	var_3_4:SetRGBFromTable(SWATCHES.Scoreboard.grayText, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 200)
	var_3_0:addElement(var_3_4)

	var_3_0.PlacementBG = var_3_4

	local var_3_5 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_5)

	local function var_3_6()
		var_3_4:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("FanDisplayWidget", FanDisplayWidget)
LockTable(_M)
