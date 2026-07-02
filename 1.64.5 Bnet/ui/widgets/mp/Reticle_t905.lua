module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:ReceivePostFXLite()
end

function Reticle_t905(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p)

	var_2_0.id = "Reticle_t905"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "MeterCross"

	var_2_4:setImage(RegisterMaterial("t9_hud_reticle_t905_cross"), 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 144, _1080p * -140, _1080p * 140)
	var_2_0:addElement(var_2_4)

	var_2_0.MeterCross = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("Reticle_t905", Reticle_t905)
LockTable(_M)
