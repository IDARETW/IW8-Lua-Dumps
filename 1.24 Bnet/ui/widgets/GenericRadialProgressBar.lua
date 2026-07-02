module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.Progress:SetProgressInC(arg_1_1, arg_1_2 and arg_1_2 or 0, arg_1_3 and arg_1_3 or 0)

	local var_1_0 = ""

	arg_1_1 = arg_1_1 * 100

	if arg_1_1 == math.floor(arg_1_1) then
		var_1_0 = Engine.CBBHFCGDIC("CAS/PERCENT", arg_1_1)
	else
		var_1_0 = Engine.CBBHFCGDIC("CAS/PERCENT", string.format("%.1f", arg_1_1))
	end

	if arg_1_4 then
		arg_1_0.Percent:setText("")
	else
		arg_1_0.Percent:setText(var_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Progress)
	assert(arg_2_0.Percent)

	arg_2_0.SetProgress = var_0_0
end

function GenericRadialProgressBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 120 * _1080p, 0, 122 * _1080p)

	var_3_0.id = "GenericRadialProgressBar"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_3_1
	}
	local var_3_7 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_3_6)

	var_3_7.id = "Progress"

	var_3_7:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_7:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_3_7:SetProgress(0.9)
	var_3_0:addElement(var_3_7)

	var_3_0.Progress = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIText.new()

	var_3_9.id = "Percent"

	var_3_9:setText("", 0)
	var_3_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_9:SetAlignment(LUI.Alignment.Center)
	var_3_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -14, _1080p * -19, _1080p * 17)
	var_3_0:addElement(var_3_9)

	var_3_0.Percent = var_3_9

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GenericRadialProgressBar", GenericRadialProgressBar)
LockTable(_M)
