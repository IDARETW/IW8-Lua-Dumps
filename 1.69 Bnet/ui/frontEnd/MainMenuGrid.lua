module(..., package.seeall)

function MainMenuGrid(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "MainMenuGrid"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "TopLeft"

	var_1_4:setImage(RegisterMaterial("mm_splash_detailbits"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 512)
	var_1_0:addElement(var_1_4)

	var_1_0.TopLeft = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "BottomLeft"

	var_1_6:setImage(RegisterMaterial("mm_splash_detailbits"), 0)
	var_1_6:SetVMin(1, 0)
	var_1_6:SetVMax(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1024, _1080p * -512, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.BottomLeft = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TopRight"

	var_1_8:setImage(RegisterMaterial("mm_splash_detailbits"), 0)
	var_1_8:SetUMin(1, 0)
	var_1_8:SetUMax(0, 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1024, 0, 0, _1080p * 512)
	var_1_0:addElement(var_1_8)

	var_1_0.TopRight = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "BottomRight"

	var_1_10:setImage(RegisterMaterial("mm_splash_detailbits"), 0)
	var_1_10:SetUMin(1, 0)
	var_1_10:SetUMax(0, 0)
	var_1_10:SetVMin(1, 0)
	var_1_10:SetVMax(0, 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -1024, 0, _1080p * -512, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.BottomRight = var_1_10

	return var_1_0
end

MenuBuilder.registerType("MainMenuGrid", MainMenuGrid)
LockTable(_M)
