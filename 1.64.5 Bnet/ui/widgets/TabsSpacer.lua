module(..., package.seeall)

function TabsSpacer(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 2 * _1080p, 0, 76 * _1080p)

	var_1_0.id = "TabsSpacer"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "SpacerImage"

	var_1_4:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_1_4:SetAlpha(0.15, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 11, _1080p * -11)
	var_1_0:addElement(var_1_4)

	var_1_0.SpacerImage = var_1_4

	return var_1_0
end

MenuBuilder.registerType("TabsSpacer", TabsSpacer)
LockTable(_M)
