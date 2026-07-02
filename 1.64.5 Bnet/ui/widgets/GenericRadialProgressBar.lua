module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_1 = arg_1_1 * 100

	local var_1_0 = arg_1_1 == math.floor(arg_1_1) and arg_1_1 or string.format("%.1f", arg_1_1)
	local var_1_1 = Engine.CBBHFCGDIC("CAS/PERCENT", var_1_0)

	arg_1_0.Percent:setText(arg_1_2 and "" or var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.Progress:SetProgressInC(arg_2_1, arg_2_2 and arg_2_2 or 0, arg_2_3 and arg_2_3 or 0)
	var_0_0(arg_2_0, arg_2_1, arg_2_4)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Progress)
	assert(arg_3_0.Percent)

	arg_3_0.SetProgress = var_0_1
end

function GenericRadialProgressBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 120 * _1080p, 0, 122 * _1080p)

	var_4_0.id = "GenericRadialProgressBar"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_4:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_4_1
	}
	local var_4_7 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_4_6)

	var_4_7.id = "Progress"

	var_4_7:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_7:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_4_7:SetProgress(0.9)
	var_4_0:addElement(var_4_7)

	var_4_0.Progress = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIText.new()

	var_4_9.id = "Percent"

	var_4_9:setText("", 0)
	var_4_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_9:SetAlignment(LUI.Alignment.Center)
	var_4_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -14, _1080p * -19, _1080p * 17)
	var_4_0:addElement(var_4_9)

	var_4_0.Percent = var_4_9

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericRadialProgressBar", GenericRadialProgressBar)
LockTable(_M)
