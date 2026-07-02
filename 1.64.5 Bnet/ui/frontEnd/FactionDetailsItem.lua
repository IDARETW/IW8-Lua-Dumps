module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	assert(arg_1_0.Image)
	assert(arg_1_0.Title)
	assert(arg_1_0.IconHeading)
	assert(arg_1_0.Description)
	arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.image))
	arg_1_0.Title:setText(arg_1_1.name)
	arg_1_0.IconHeading:setText(arg_1_1.imageHeading)
	arg_1_0.Description:setText(arg_1_1.description)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupDetails = var_0_0
end

function FactionDetailsItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "FactionDetailsItem"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "IconHeading"

	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 156, 0, _1080p * 18)
	var_3_0:addElement(var_3_4)

	var_3_0.IconHeading = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Title"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 121, _1080p * 441, _1080p * 29, _1080p * 51)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Image"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 110, _1080p * 29, _1080p * 139)
	var_3_0:addElement(var_3_8)

	var_3_0.Image = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Description"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 121, _1080p * 441, _1080p * 59, _1080p * 77)
	var_3_0:addElement(var_3_10)

	var_3_0.Description = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("FactionDetailsItem", FactionDetailsItem)
LockTable(_M)
