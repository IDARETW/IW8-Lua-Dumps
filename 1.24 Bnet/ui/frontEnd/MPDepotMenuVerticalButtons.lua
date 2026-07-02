module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0:getFirstChild()

	while var_1_0 do
		var_1_0 = var_1_0:getNextSibling(), var_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
			if arg_1_0.storeMenu and arg_1_0.storeMenu.container then
				arg_1_0.storeMenu.container:closeTree()

				arg_1_0.storeMenu.container = nil
			end
		end)
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.storeMenu = arg_3_2.storeMenu

	var_0_0(arg_3_0)
	arg_3_0.StoreButton:AddTooltipData(arg_3_1, {
		tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC")
	})
	arg_3_0.StoreButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		STORE.GoToStore(arg_3_1, arg_4_0:GetCurrentMenu().id, arg_4_0.id)
	end)

	local function var_3_0(arg_5_0, arg_5_1)
		if LUI.IsLastInputKeyboardMouse(arg_5_1.controllerIndex) then
			arg_5_0.StoreButton.Description:setText("")
		else
			arg_5_0.StoreButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC"))
		end
	end

	arg_3_0:addAndCallEventHandler("update_input_type", var_3_0, {
		controllerIndex = arg_3_1
	})
end

function MPDepotMenuVerticalButtons(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalList.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 280 * _1080p)

	var_6_0.id = "MPDepotMenuVerticalButtons"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:SetSpacing(14 * _1080p)

	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "StoreButton"

	var_6_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE"), 0)
	var_6_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC"), 0)
	var_6_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_6_0:addElement(var_6_4)

	var_6_0.StoreButton = var_6_4

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MPDepotMenuVerticalButtons", MPDepotMenuVerticalButtons)
LockTable(_M)
