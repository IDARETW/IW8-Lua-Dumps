module(..., package.seeall)

local var_0_0 = SWATCHES.CAC.attachmentEmpty

local function var_0_1(arg_1_0)
	return arg_1_0._imageWidth
end

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_1 == "menu_default_slot" then
		arg_2_0.Image:SetRGBFromTable(var_0_0)
		arg_2_0.Image:SetAlpha(0.5)
	end

	arg_2_0.Image:setImage(RegisterMaterial(arg_2_1))
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.GetImageWidth = var_0_1
	arg_3_0.SetupImage = var_0_2

	local var_3_0 = 5 * _1080p

	arg_3_0._imageWidth = LAYOUT.GetElementWidth(arg_3_0.Image) + var_3_0
end

function ModCustomizationItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 56 * _1080p)

	var_4_0.id = "ModCustomizationItem"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Image"

	var_4_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -56, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Image = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Category"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 14, _1080p * -67, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_6)

	var_4_0.Category = var_4_6

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ModCustomizationItem", ModCustomizationItem)
LockTable(_M)
