module(..., package.seeall)

function WZInfoBacking(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 246 * _1080p, 0, 76 * _1080p)

	var_1_0.id = "WZInfoBacking"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "WZWipBackground"

	var_1_4:setImage(RegisterMaterial("ui_mp_br_frontend_iis_button_background_ch2"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -20, _1080p * 21, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_4)

	var_1_0.WZWipBackground = var_1_4

	return var_1_0
end

MenuBuilder.registerType("WZInfoBacking", WZInfoBacking)
LockTable(_M)
