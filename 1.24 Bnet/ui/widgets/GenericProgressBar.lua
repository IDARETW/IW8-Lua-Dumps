module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._progress
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._progress = LUI.clamp(arg_2_1, 0, 1)

	arg_2_0.Cap:SetAnchors(0, 1 - arg_2_0._progress, 0, 0)
	arg_2_0.Fill:SetAnchors(0, 1 - arg_2_0._progress, 0, 0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	assert(type(arg_3_1) == "number")
	assert(type(arg_3_2) == "number")

	arg_3_0._progress = LUI.clamp(arg_3_1, 0, 1)

	if arg_3_3 == nil then
		arg_3_3 = LUI.EASING.linear
	end

	if arg_3_4 then
		arg_3_0.Fill:SetRGBFromTable(arg_3_4, arg_3_2, arg_3_3)
	end

	if arg_3_5 == nil then
		arg_3_5 = 0
	end

	if arg_3_0.PreFill then
		local var_3_0 = arg_3_1 - arg_3_5

		arg_3_0.PreFill:SetAnchors(var_3_0, 1 - arg_3_0._progress, 0, 0)

		arg_3_0:Wait(300).onComplete = function()
			arg_3_0.PreFill:SetAnchors(arg_3_0._progress, 1 - arg_3_0._progress, 0, 0, arg_3_2, arg_3_3)

			return arg_3_0.Fill:SetAnchors(0, 1 - arg_3_0._progress, 0, 0, arg_3_2, arg_3_3), arg_3_0.Cap:SetAnchors(arg_3_0._progress, 1 - arg_3_0._progress, 0, 0, arg_3_2, arg_3_3)
		end
	else
		return arg_3_0.Fill:SetAnchors(0, 1 - arg_3_0._progress, 0, 0, arg_3_2, arg_3_3), arg_3_0.Cap:SetAnchors(arg_3_0._progress, 1 - arg_3_0._progress, 0, 0, arg_3_2, arg_3_3)
	end
end

local function var_0_3(arg_5_0)
	local var_5_0 = LUI.UIImage.new()

	var_5_0.id = "PreFill"

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	arg_5_0:addElement(var_5_0)

	arg_5_0.PreFill = var_5_0
end

local function var_0_4(arg_6_0, arg_6_1)
	arg_6_0.GetProgress = var_0_0
	arg_6_0.SetProgress = var_0_2
	arg_6_0.SetImmediateProgress = var_0_1
	arg_6_0.AddPreFill = var_0_3
	arg_6_0._progress = 0

	local function var_6_0()
		local var_7_0 = arg_6_0:GetDataSource()

		assert(var_7_0)

		local var_7_1 = var_7_0:GetValue(arg_6_1)

		if var_7_1 then
			arg_6_0:SetProgress(var_7_1, 250)
		end
	end

	arg_6_0:SubscribeToModelThroughElement(arg_6_0, nil, var_6_0)
end

function GenericProgressBar(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p)

	var_8_0.id = "GenericProgressBar"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "DialogueBackground"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.2, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.DialogueBackground = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Fill"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.Fill = var_8_6

	local var_8_7
	local var_8_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_9 = LUI.UIBorder.new(var_8_8)

	var_8_9.id = "Frame"

	var_8_0:addElement(var_8_9)

	var_8_0.Frame = var_8_9

	local var_8_10
	local var_8_11 = LUI.UIImage.new()

	var_8_11.id = "Cap"

	var_8_11:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1, _1080p * -3, _1080p * 3)
	var_8_0:addElement(var_8_11)

	var_8_0.Cap = var_8_11

	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("GenericProgressBar", GenericProgressBar)
LockTable(_M)
