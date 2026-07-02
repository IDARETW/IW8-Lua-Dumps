module(..., package.seeall)

function ReticleACOG2_t9(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_1_0.id = "ReticleACOG2_t9"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "MeterW"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.CH2Backer, 0)
	var_1_4:SetAlpha(0.95, 0)
	var_1_4:SetZRotation(90, 0)
	var_1_4:setImage(RegisterMaterial("t9_hud_reticle_acog2_meter_01"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_1_0:addElement(var_1_4)

	var_1_0.MeterW = var_1_4

	return var_1_0
end

MenuBuilder.registerType("ReticleACOG2_t9", ReticleACOG2_t9)
LockTable(_M)
