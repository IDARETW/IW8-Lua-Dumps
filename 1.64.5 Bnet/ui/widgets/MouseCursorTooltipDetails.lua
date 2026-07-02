module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = arg_1_0.TooltipCrosshair:getWidth() / 2
	local var_1_1 = arg_1_0.TooltipCrosshair:getHeight() / 2

	arg_1_0.TooltipCrosshair:SetAnchorsAndPosition(0, 1, 0, 1, arg_1_1 - var_1_0, arg_1_1 + var_1_0, arg_1_2 - var_1_1, arg_1_2 + var_1_1)
	arg_1_0.TooltipCrosshair:SetZRotation(arg_1_3, 0)
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0.SetCrosshairPosition = var_0_0

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function MouseCursorTooltipDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 240 * _1080p)

	var_3_0.id = "MouseCursorTooltipDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "TooltipCrosshair"

	var_3_4:SetRGBFromTable(SWATCHES.HUD.ammoFill, 0)
	var_3_4:setImage(RegisterMaterial("tooltip_crosshair"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_4)

	var_3_0.TooltipCrosshair = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6
	local var_3_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_3_4:RegisterAnimationSequence("WZWipSetup", var_3_7)

	local function var_3_8()
		var_3_4:AnimateSequence("WZWipSetup")
	end

	var_3_0._sequences.WZWipSetup = var_3_8

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MouseCursorTooltipDetails", MouseCursorTooltipDetails)
LockTable(_M)
