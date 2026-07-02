module(..., package.seeall)

function BannerGradient(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "BannerGradient"
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

	var_1_4.id = "BGAdd"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_1_4:SetAlpha(0.3, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_4:Setup3SliceHorizontalImage(_1080p * 57, 0.37)
	var_1_0:addElement(var_1_4)

	var_1_0.BGAdd = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "BGMult"

	var_1_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_1_6:SetAlpha(0.6, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_6:SetBlendMode(BLEND_MODE.multiply)
	var_1_6:Setup3SliceHorizontalImage(_1080p * 57, 0.37)
	var_1_0:addElement(var_1_6)

	var_1_0.BGMult = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.3,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Flash", var_1_8)

	local var_1_9 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.6,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Flash", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("Flash")
		var_1_6:AnimateSequence("Flash")
	end

	var_1_0._sequences.Flash = var_1_10

	return var_1_0
end

MenuBuilder.registerType("BannerGradient", BannerGradient)
LockTable(_M)
