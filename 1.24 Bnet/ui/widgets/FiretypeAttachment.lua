module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetAlpha(1)

	local var_1_0 = arg_1_2.fireType
	local var_1_1 = DYN_ATTACHMENT.GetFireTypeIcon(var_1_0)

	arg_1_0.Icon:setImage(RegisterMaterial(var_1_1))
end

function PostLoadFunc(arg_2_0, arg_2_1)
	assert(arg_2_0.Icon)

	arg_2_0.OverrideApplyAttachmentsData = var_0_0
end

function FiretypeAttachment(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "FiretypeAttachment"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Icon"

	var_3_4:SetAlpha(0, 0)
	var_3_4:setImage(RegisterMaterial("ui_firetype_fullauto"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local var_3_5 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_5)

	local function var_3_6()
		var_3_4:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_6

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("FiretypeAttachment", FiretypeAttachment)
LockTable(_M)
