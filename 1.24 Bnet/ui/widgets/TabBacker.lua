module(..., package.seeall)

function TabBacker(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 160 * _1080p)

	var_1_0.id = "TabBacker"
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

	var_1_4.id = "TabBacker"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_1_0:addElement(var_1_4)

	var_1_0.TabBacker = var_1_4

	local var_1_5

	if CONDITIONS.IsMagmaGameMode(var_1_0) then
		local var_1_6 = LUI.UIImage.new()

		var_1_6.id = "WZBanner"

		var_1_6:SetAlpha(0.12, 0)
		var_1_6:setImage(RegisterMaterial("warzone_banner"), 0)
		var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -1024, _1080p * 1024, 0, _1080p * 160)
		var_1_0:addElement(var_1_6)

		var_1_0.WZBanner = var_1_6
	end

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZ", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("WZ")
	end

	var_1_0._sequences.WZ = var_1_10

	if CONDITIONS.IsMagmaGameMode(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "WZ")
	end

	return var_1_0
end

MenuBuilder.registerType("TabBacker", TabBacker)
LockTable(_M)
