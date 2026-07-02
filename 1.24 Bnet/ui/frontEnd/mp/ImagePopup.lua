module(..., package.seeall)

function ImagePopup(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "ImagePopup"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Darkener"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetScale(1, 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -960, _1080p * 960)
	var_1_0:addElement(var_1_4)

	var_1_0.Darkener = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "OuterBorder"

	var_1_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -600, _1080p * 600, _1080p * -254, _1080p * 258)
	var_1_0:addElement(var_1_7)

	var_1_0.OuterBorder = var_1_7

	local var_1_8
	local var_1_9 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_10 = LUI.UIBorder.new(var_1_9)

	var_1_10.id = "ImageBorder"

	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 343, _1080p * 768, _1080p * 286, _1080p * 798)
	var_1_0:addElement(var_1_10)

	var_1_0.ImageBorder = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Image"

	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 364, _1080p * 746, _1080p * 305, _1080p * 775)
	var_1_0:addElement(var_1_12)

	var_1_0.Image = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "Title"

	var_1_14:setText("", 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 815, _1080p * 1315, _1080p * 305, _1080p * 340)
	var_1_0:addElement(var_1_14)

	var_1_0.Title = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIText.new()

	var_1_16.id = "Text"

	var_1_16:setText("", 0)
	var_1_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_16:SetAlignment(LUI.Alignment.Left)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 815, _1080p * 1674, _1080p * 427, _1080p * 451)
	var_1_0:addElement(var_1_16)

	var_1_0.Text = var_1_16

	return var_1_0
end

MenuBuilder.registerType("ImagePopup", ImagePopup)
LockTable(_M)
