module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0

	if Engine.CFHBIHABCB(arg_1_0) then
		var_1_0 = WZ_MAIN_MENU.BladeData
	else
		var_1_0 = WZ_MAIN_MENU.BladeDataMagma
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1

	local var_2_0 = var_0_0(arg_2_1)
	local var_2_1 = #var_2_0

	for iter_2_0 = 1, var_2_1 do
		arg_2_0["Blade" .. tostring(iter_2_0)]:SetData(var_2_0[iter_2_0])
	end

	arg_2_0:registerEventHandler("blade_button_focused", function(arg_3_0, arg_3_1)
		return
	end)
	arg_2_0:registerEventHandler("blade_button_unfocused", function(arg_4_0, arg_4_1)
		return
	end)
end

function WZMainMenuBladeLayout(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "WZMainMenuBladeLayout"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("WZMainMenuBlade", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Blade1"

	var_5_4.Text:setText("", 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 640, 0, _1080p * 1080)
	var_5_0:addElement(var_5_4)

	var_5_0.Blade1 = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("WZMainMenuBlade", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Blade2"

	var_5_6.Text:setText("", 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 640, _1080p * 1280, 0, _1080p * 1080)
	var_5_0:addElement(var_5_6)

	var_5_0.Blade2 = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("WZMainMenuBlade", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Blade3"

	var_5_8.Text:setText("", 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1280, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_8)

	var_5_0.Blade3 = var_5_8
	var_5_4.navigation = {
		right = var_5_6
	}
	var_5_6.navigation = {
		left = var_5_4,
		right = var_5_8
	}
	var_5_8.navigation = {
		left = var_5_6
	}

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WZMainMenuBladeLayout", WZMainMenuBladeLayout)
LockTable(_M)
