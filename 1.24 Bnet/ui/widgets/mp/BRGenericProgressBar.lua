module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._progress
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(type(arg_2_1.progress) == "number")
	assert(type(arg_2_1.duration) == "number")

	if arg_2_1.easing == nil then
		arg_2_1.easing = LUI.EASING.linear
	end

	arg_2_0._progress = LUI.clamp(arg_2_1.progress, 0, 1)

	if not arg_2_1.shouldUseAltFill then
		arg_2_0.FillAlt:SetAnchors(arg_2_0._progress, 1 - arg_2_0._progress, 0, 0, arg_2_1.duration, arg_2_1.easing)
	end

	arg_2_0.FillAlt:SetAnchors(0, 1 - arg_2_0._progress, 0, 0, arg_2_1.duration, arg_2_1.easing)

	if not arg_2_1.shouldUseAltFill then
		arg_2_0.Fill:SetAnchors(0, 1 - arg_2_0._progress, 0, 0, arg_2_1.duration, arg_2_1.easing)
	end

	arg_2_0.Cap:SetAnchors(arg_2_0._progress, 1 - arg_2_0._progress, 0, 0, arg_2_1.duration, arg_2_1.easing)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.GetProgress = var_0_0
	arg_3_0.SetProgress = var_0_1
	arg_3_0._progress = 0

	local function var_3_0()
		local var_4_0 = arg_3_0:GetDataSource()

		assert(var_4_0)

		local var_4_1 = var_4_0:GetValue(arg_3_1)

		if var_4_1 then
			arg_3_0:SetProgress(var_4_1, 250)
		end
	end

	arg_3_0:SubscribeToModelThroughElement(arg_3_0, nil, var_3_0)
end

function BRGenericProgressBar(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p)

	var_5_0.id = "BRGenericProgressBar"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "FillAlt"

	var_5_4:SetRGBFromTable(SWATCHES.CAC.weaponMeterMain, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.FillAlt = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Fill"

	var_5_6:SetRGBFromTable(SWATCHES.CAC.weaponMeterMain, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Fill = var_5_6

	local var_5_7
	local var_5_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_9 = LUI.UIBorder.new(var_5_8)

	var_5_9.id = "Frame"

	var_5_0:addElement(var_5_9)

	var_5_0.Frame = var_5_9

	local var_5_10
	local var_5_11 = LUI.UIImage.new()

	var_5_11.id = "Cap"

	var_5_11:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 2, 0, 0)
	var_5_0:addElement(var_5_11)

	var_5_0.Cap = var_5_11

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BRGenericProgressBar", BRGenericProgressBar)
LockTable(_M)
