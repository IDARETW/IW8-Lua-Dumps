module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1 = arg_1_2 == 0 and 0 or arg_1_1 / arg_1_2

	arg_1_0.Progress:SetLeftAnchor(0)
	arg_1_0.Progress:SetRightAnchor(1 - var_1_1, 1000)
	arg_1_0.Progress:SetLeft(0)
	arg_1_0.Progress:SetRight(0)
end

local function var_0_1(arg_2_0)
	arg_2_0.Progress:SetLeftAnchor(0)
	arg_2_0.Progress:SetRightAnchor(1)
	arg_2_0.Progress:SetLeft(0)
	arg_2_0.Progress:SetRight(0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateProgress = var_0_0
	arg_3_0.ResetProgress = var_0_1
end

function CODTvProgressBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 15 * _1080p)

	var_4_0.id = "CODTvProgressBar"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(7039851, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Progress"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.highlight, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.Progress = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "TimeLabel"

	var_4_8:SetRGBFromInt(196608, 0)
	var_4_8:setText("1:20 / 2:30", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Right)
	var_4_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -513, _1080p * -13, _1080p * -0.75, _1080p * 15.75)
	var_4_0:addElement(var_4_8)

	var_4_0.TimeLabel = var_4_8

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CODTvProgressBar", CODTvProgressBar)
LockTable(_M)
