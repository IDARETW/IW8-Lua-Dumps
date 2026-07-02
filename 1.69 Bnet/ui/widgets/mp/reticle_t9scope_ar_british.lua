module(..., package.seeall)

function reticle_t9scope_ar_british(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p)

	var_1_0.id = "reticle_t9scope_ar_british"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "MeterCross"

	var_1_4:SetRGBFromInt(3222058, 0)
	var_1_4:SetAlpha(0.9, 0)
	var_1_4:setImage(RegisterMaterial("t9_hud_reticle_ar_british_meter"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -224, _1080p * 224, _1080p * -224, _1080p * 224)
	var_1_0:addElement(var_1_4)

	var_1_0.MeterCross = var_1_4

	return var_1_0
end

MenuBuilder.registerType("reticle_t9scope_ar_british", reticle_t9scope_ar_british)
LockTable(_M)
