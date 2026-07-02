module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2.image then
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.image))
	end

	if arg_1_2.desc then
		arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_2.desc))
	end

	if arg_1_2.imageHeading then
		arg_1_0.ImageHeading:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.imageHeading)))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function PrestigeDetailPanel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 510 * _1080p, 0, 380 * _1080p)

	var_3_0.id = "PrestigeDetailPanel"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Image"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -190, _1080p * 190)
	var_3_0:addElement(var_3_4)

	var_3_0.Image = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TextBacker"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * -121, _1080p * -2)
	var_3_0:addElement(var_3_6)

	var_3_0.TextBacker = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Description"

	var_3_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 488, _1080p * 304, _1080p * 324)
	var_3_0:addElement(var_3_8)

	var_3_0.Description = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "ImageHeading"

	var_3_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 488, _1080p * 270, _1080p * 300)
	var_3_0:addElement(var_3_10)

	var_3_0.ImageHeading = var_3_10

	local var_3_11
	local var_3_12 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_3_13 = LUI.UIBorder.new(var_3_12)

	var_3_13.id = "ZombiesImgBorder"

	var_3_13:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_3_13:SetAlpha(0.25, 0)
	var_3_13:SetBorderThicknessLeft(_1080p * 2, 0)
	var_3_13:SetBorderThicknessRight(_1080p * 2, 0)
	var_3_13:SetBorderThicknessTop(_1080p * 2, 0)
	var_3_13:SetBorderThicknessBottom(_1080p * 2, 0)
	var_3_0:addElement(var_3_13)

	var_3_0.ZombiesImgBorder = var_3_13

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PrestigeDetailPanel", PrestigeDetailPanel)
LockTable(_M)
