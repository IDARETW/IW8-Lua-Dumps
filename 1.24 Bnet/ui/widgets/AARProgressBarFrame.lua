module(..., package.seeall)

function AARProgressBarFrame(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "AARProgressBarFrame"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "LeftCap"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_4:SetAlpha(0.8, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.LeftCap = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "RightCap"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_6:SetAlpha(0.8, 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -5, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.RightCap = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "HorzLine1"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_8:SetAlpha(0.4, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, 0, _1080p * 1)
	var_1_0:addElement(var_1_8)

	var_1_0.HorzLine1 = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "HorzLine2"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_10:SetAlpha(0.4, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 13, _1080p * 14)
	var_1_0:addElement(var_1_10)

	var_1_0.HorzLine2 = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "HorzLine3"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_12:SetAlpha(0.4, 0)
	var_1_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 15, _1080p * 16)
	var_1_0:addElement(var_1_12)

	var_1_0.HorzLine3 = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "NodeLeft"

	var_1_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_14:SetAlpha(0.8, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 12, _1080p * 14, _1080p * 17)
	var_1_0:addElement(var_1_14)

	var_1_0.NodeLeft = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "NodeRight"

	var_1_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_16:SetAlpha(0.8, 0)
	var_1_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -12, 0, _1080p * 14, _1080p * 17)
	var_1_0:addElement(var_1_16)

	var_1_0.NodeRight = var_1_16

	return var_1_0
end

MenuBuilder.registerType("AARProgressBarFrame", AARProgressBarFrame)
LockTable(_M)
