module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Mask)
	arg_1_0.Mask:SetAlpha(1)
	arg_1_0.Bar:SetMask(arg_1_0.Mask)
	arg_1_0.Backer:SetMask(arg_1_0.Mask)
end

function AARProgressBarFillAlt(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1500 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "AARProgressBarFillAlt"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "BG"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_4:SetAlpha(0.5, 0)
	var_2_4:setImage(RegisterMaterial("aar_progress_bg"), 0)
	var_2_4:SetUMax(9, 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -750, _1080p * 750, _1080p * -24, _1080p * 24)
	var_2_0:addElement(var_2_4)

	var_2_0.BG = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Backer"

	var_2_6:SetRGBFromInt(0, 0)
	var_2_6:SetAlpha(0.9, 0)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -750, _1080p * 750, _1080p * -15, _1080p * 15)
	var_2_0:addElement(var_2_6)

	var_2_0.Backer = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Bar"

	var_2_8:setImage(RegisterMaterial("aar_progress_fill"), 0)
	var_2_8:SetUMax(9, 0)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -750, _1080p * 750, _1080p * -34, _1080p * 34)
	var_2_0:addElement(var_2_8)

	var_2_0.Bar = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Mask"

	var_2_10:SetAlpha(0, 0)
	var_2_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -32, _1080p * 32)
	var_2_0:addElement(var_2_10)

	var_2_0.Mask = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("AARProgressBarFillAlt", AARProgressBarFillAlt)
LockTable(_M)
