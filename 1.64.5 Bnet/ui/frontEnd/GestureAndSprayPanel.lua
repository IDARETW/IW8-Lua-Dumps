module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.RadialMenu:GetCurrentAnchorsAndPositions()

	arg_1_0.RadialMenu:closeTree()

	arg_1_0.RadialMenu = MenuBuilder.BuildRegisteredType("RadialMenu", {
		controllerIndex = arg_1_1
	})
	arg_1_0.RadialMenu.id = "RadialMenu"

	arg_1_0.RadialMenu:SetAnchorsAndPosition(var_1_0.leftAnchor, var_1_0.rightAnchor, var_1_0.topAnchor, var_1_0.bottomAnchor, var_1_0.left, var_1_0.right, var_1_0.top, var_1_0.bottom)
	arg_1_0:addElement(arg_1_0.RadialMenu)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.RadialMenu:SetKeepSelectionWhileInDeadZone(false)
	arg_2_0.RadialMenu:SetAllowNavigation(false)
	arg_2_0.RadialMenu:SetActive(true)
	arg_2_0.RadialMenu:SetAlpha(1)
	arg_2_0.RadialMenu:SetDisableInfiniteOuterRadius(true)
	arg_2_0.RadialMenu:SetHandleMouse(false)
	ACTIONS.AnimateSequence(arg_2_0.RadialMenu, "ShowHintInCenter")
	ACTIONS.AnimateSequence(arg_2_0.RadialMenu, "HidePrompts")

	local function var_2_0(arg_3_0, arg_3_1)
		local var_3_0 = Engine.BGGJFFFAFG(arg_3_1.controllerIndex)

		arg_3_0.Hint:setText(var_3_0 and Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT") or Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT_KBM"))
	end

	arg_2_0.RadialMenu:addAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.RadialMenu)
	var_0_1(arg_4_0, arg_4_1)

	local var_4_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_4_1()
		if Engine.JEDFGECDJ() > 1 then
			local var_5_0 = var_4_0:GetValue(arg_4_1) or Engine.IJEBHJIJF()

			var_0_0(arg_4_0, var_5_0)
			var_0_1(arg_4_0, var_5_0)
		end
	end

	arg_4_0:SubscribeToModel(var_4_0:GetModel(arg_4_1), var_4_1)
end

function GestureAndSprayPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 700 * _1080p)

	var_6_0.id = "GestureAndSprayPanel"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "RadialBacker"

	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1000, 0, _1080p * 700)
	var_6_0:addElement(var_6_4)

	var_6_0.RadialBacker = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("RadialMenu", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "RadialMenu"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 244, _1080p * 756, _1080p * 94, _1080p * 606)
	var_6_0:addElement(var_6_6)

	var_6_0.RadialMenu = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "SpraysAndGesturesTitle"

	var_6_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1000, _1080p * 1, _1080p * 48)
	var_6_0:addElement(var_6_8)

	var_6_0.SpraysAndGesturesTitle = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "EquippedWidget"

	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 852, _1080p * 988, _1080p * 10, _1080p * 40)
	var_6_0:addElement(var_6_10)

	var_6_0.EquippedWidget = var_6_10

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GestureAndSprayPanel", GestureAndSprayPanel)
LockTable(_M)
