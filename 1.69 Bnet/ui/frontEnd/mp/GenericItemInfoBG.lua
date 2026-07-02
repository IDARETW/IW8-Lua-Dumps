module(..., package.seeall)

function GenericItemInfoBG(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p)

	var_1_0.id = "GenericItemInfoBG"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3

	if Engine.DDJFBBJAIG() then
		local var_1_4 = LUI.UIImage.new()

		var_1_4.id = "DropShadow"

		var_1_4:SetRGBFromInt(0, 0)
		var_1_4:SetAlpha(0.3, 0)
		var_1_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
		var_1_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
		var_1_0:addElement(var_1_4)

		var_1_0.DropShadow = var_1_4
	end

	local var_1_5

	if Engine.DDJFBBJAIG() then
		local var_1_6 = LUI.UIBlur.new()

		var_1_6.id = "Blur"

		var_1_6:SetRGBFromInt(6710886, 0)
		var_1_6:SetBlurStrength(2.75, 0)
		var_1_0:addElement(var_1_6)

		var_1_0.Blur = var_1_6
	end

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "WhiteOverlay"

	var_1_8:SetAlpha(0.5, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, 0, _1080p * 66, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.WhiteOverlay = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "DarkOverlay"

	var_1_10:SetRGBFromInt(0, 0)
	var_1_10:SetAlpha(0.6, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 6, 0, 0, _1080p * 66)
	var_1_0:addElement(var_1_10)

	var_1_0.DarkOverlay = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "DarkTab"

	var_1_12:SetRGBFromInt(0, 0)
	var_1_12:SetAlpha(0.6, 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_1_0:addElement(var_1_12)

	var_1_0.DarkTab = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "Node"

	var_1_14:SetRGBFromInt(14277081, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 15, 0, _1080p * 4)
	var_1_0:addElement(var_1_14)

	var_1_0.Node = var_1_14

	return var_1_0
end

MenuBuilder.registerType("GenericItemInfoBG", GenericItemInfoBG)
LockTable(_M)
