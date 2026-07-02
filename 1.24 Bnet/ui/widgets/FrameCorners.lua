module(..., package.seeall)

function FrameCorners(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "FrameCorners"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_5 = LUI.UIBorder.new(var_1_4)

	var_1_5.id = "UpperLeft"

	var_1_5:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_1_5:SetBorderThicknessRight(_1080p * 0, 0)
	var_1_5:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 7, 0, _1080p * 7)
	var_1_0:addElement(var_1_5)

	var_1_0.UpperLeft = var_1_5

	local var_1_6
	local var_1_7 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_8 = LUI.UIBorder.new(var_1_7)

	var_1_8.id = "UpperRight"

	var_1_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_1_8:SetBorderThicknessLeft(_1080p * 0, 0)
	var_1_8:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -7, 0, 0, _1080p * 7)
	var_1_0:addElement(var_1_8)

	var_1_0.UpperRight = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "LowerLeft"

	var_1_11:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_1_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_1_11:SetBorderThicknessTop(_1080p * 0, 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 7, _1080p * -7, 0)
	var_1_0:addElement(var_1_11)

	var_1_0.LowerLeft = var_1_11

	local var_1_12
	local var_1_13 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_14 = LUI.UIBorder.new(var_1_13)

	var_1_14.id = "LoweRight"

	var_1_14:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_1_14:SetBorderThicknessLeft(_1080p * 0, 0)
	var_1_14:SetBorderThicknessTop(_1080p * 0, 0)
	var_1_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -7, 0, _1080p * -7, 0)
	var_1_0:addElement(var_1_14)

	var_1_0.LoweRight = var_1_14

	return var_1_0
end

MenuBuilder.registerType("FrameCorners", FrameCorners)
LockTable(_M)
