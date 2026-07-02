module(..., package.seeall)

function WatchGeigerMeter(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "WatchGeigerMeter"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Fill"

	var_1_4:setImage(RegisterMaterial("hud_weapon_info_mask"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("stencil_mask")
		}
	}

	var_1_4:RegisterAnimationSequence("StencilMask", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("StencilMask")
	end

	var_1_0._sequences.StencilMask = var_1_7

	return var_1_0
end

MenuBuilder.registerType("WatchGeigerMeter", WatchGeigerMeter)
LockTable(_M)
