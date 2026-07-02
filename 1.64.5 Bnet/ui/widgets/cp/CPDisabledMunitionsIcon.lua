module(..., package.seeall)

function CPDisabledMunitionsIcon(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "CPDisabledMunitionsIcon"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Icon"

	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 50, 0, _1080p * 50)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	return var_1_0
end

MenuBuilder.registerType("CPDisabledMunitionsIcon", CPDisabledMunitionsIcon)
LockTable(_M)
