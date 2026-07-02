module(..., package.seeall)

function WeaponStatsProgressBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p)

	var_1_0.id = "WeaponStatsProgressBar"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "BaseFill"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_1_0:addElement(var_1_4)

	var_1_0.BaseFill = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "AttachmentsFill"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.greenLight, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_1_0:addElement(var_1_6)

	var_1_0.AttachmentsFill = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Frame"

	var_1_9:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_1_0:addElement(var_1_9)

	var_1_0.Frame = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIImage.new()

	var_1_11.id = "ArrowStub"

	var_1_11:setImage(RegisterMaterial("hud_arrow"), 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -5, _1080p * 5, _1080p * -6, _1080p * 4)
	var_1_0:addElement(var_1_11)

	var_1_0.ArrowStub = var_1_11

	return var_1_0
end

MenuBuilder.registerType("WeaponStatsProgressBar", WeaponStatsProgressBar)
LockTable(_M)
