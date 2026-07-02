module(..., package.seeall)
module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.RadialMenu)
	arg_1_0.RadialMenu:SetKeepSelectionWhileInDeadZone(false)
	arg_1_0.RadialMenu:SetAllowNavigation(false)
	arg_1_0.RadialMenu:SetActive(true)
	arg_1_0.RadialMenu:SetAlpha(1)
	arg_1_0.RadialMenu:SetDisableInfiniteOuterRadius(true)
	arg_1_0.RadialMenu:SetHandleMouse(false)

	if Engine.BGGJFFFAFG(arg_1_1) then
		ACTIONS.AnimateSequence(arg_1_0.RadialMenu, "ShowHintInCenter")
	end

	ACTIONS.AnimateSequence(arg_1_0.RadialMenu, "HidePrompts")

	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = Engine.BGGJFFFAFG(arg_2_1.controllerIndex)

		arg_2_0.Hint:setText(var_2_0 and Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT") or Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT_KBM"))
	end

	arg_1_0.RadialMenu:addAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})
end

function GestureAndSprayPanel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 700 * _1080p)

	var_3_0.id = "GestureAndSprayPanel"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "RadialBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1000, 0, _1080p * 700)
	var_3_0:addElement(var_3_4)

	var_3_0.RadialBacker = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("RadialMenu", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "RadialMenu"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 244, _1080p * 756, _1080p * 94, _1080p * 606)
	var_3_0:addElement(var_3_6)

	var_3_0.RadialMenu = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "SpraysAndGesturesTitle"

	var_3_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1000, _1080p * 1, _1080p * 48)
	var_3_0:addElement(var_3_8)

	var_3_0.SpraysAndGesturesTitle = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "EquippedWidget"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 852, _1080p * 988, _1080p * 10, _1080p * 40)
	var_3_0:addElement(var_3_10)

	var_3_0.EquippedWidget = var_3_10

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GestureAndSprayPanel", GestureAndSprayPanel)
LockTable(_M)
