module(..., package.seeall)

function GenericPopupFrame(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "GenericPopupFrame"

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
	var_1_4:SetAlpha(0.8, 0)
	var_1_4:SetScale(1, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_1_0:addElement(var_1_4)

	var_1_0.Darkener = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "GenericPopupWindow"

	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -230, _1080p * 230)
	var_1_0:addElement(var_1_6)

	var_1_0.GenericPopupWindow = var_1_6

	var_1_4:addEventHandler("menu_create", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = var_1_1
		end

		ACTIONS.ScaleFullscreen(var_1_0)
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericPopupFrame", GenericPopupFrame)
LockTable(_M)
