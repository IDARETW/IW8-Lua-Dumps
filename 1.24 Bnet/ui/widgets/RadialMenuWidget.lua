module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Icon)

	function arg_1_0.widgetAction()
		if arg_1_0._itemIndex ~= -1 then
			if arg_1_0._lootType == LOOT.itemTypes.GESTURES then
				Engine.EBHIFJCGBH("radial_menu_selection_gesture", arg_1_0._itemIndex)
			elseif arg_1_0._lootType == LOOT.itemTypes.SPRAYS then
				Engine.EBHIFJCGBH("radial_menu_selection_spray", arg_1_0._itemIndex)
			end
		end
	end
end

function RadialMenuWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "RadialMenuWidget"
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
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Equip", var_3_6)

	local function var_3_7()
		var_3_4:AnimateSequence("Equip")
	end

	var_3_0._sequences.Equip = var_3_7

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RadialMenuWidget", RadialMenuWidget)
LockTable(_M)
