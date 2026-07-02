module(..., package.seeall)

function OperatorIntroVideo(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 456 * _1080p, 0, 256 * _1080p)

	var_1_0.id = "OperatorIntroVideo"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("DiagonalCorners", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "DiagonalCorners"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -6, _1080p * 462, _1080p * -6, _1080p * 262)
	var_1_0:addElement(var_1_4)

	var_1_0.DiagonalCorners = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Cinematic"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 456, 0, _1080p * 256)
	var_1_0:addElement(var_1_6)

	var_1_0.Cinematic = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "FadeCover"

	var_1_8:SetRGBFromInt(0, 0)
	var_1_8:SetAlpha(0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.FadeCover = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "ClipBorder"

	var_1_11:SetRGBFromInt(8684676, 0)
	var_1_11:SetAlpha(0.7, 0)
	var_1_0:addElement(var_1_11)

	var_1_0.ClipBorder = var_1_11

	return var_1_0
end

MenuBuilder.registerType("OperatorIntroVideo", OperatorIntroVideo)
LockTable(_M)
