module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._isEquipped = arg_1_1

	assert(arg_1_0.Equipped)
	ACTIONS.AnimateSequence(arg_1_0.Equipped, arg_1_1 and "On" or "Off")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:GetDataSource()

		Engine.CBCIHEGADA(var_3_0.ref:GetValue(arg_2_1), arg_2_1, CONDITIONS.IsBRGameType())
		ACTIONS.LeaveMenu(arg_3_0)
	end)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_0:GetDataSource().name:GetValue(arg_2_1)
		local var_4_1 = arg_4_0:GetCurrentMenu()

		if var_4_1 then
			var_4_1:processEvent({
				name = "update_layout_title",
				titleName = var_4_0
			})
		end
	end)

	if CONDITIONS.IsSplitscreen(arg_2_0) then
		arg_2_0:registerEventHandler("grid_anim", function(arg_5_0, arg_5_1)
			arg_5_0:SetAlpha(arg_5_1.value)
		end)
	end

	arg_2_0.SetEquipped = var_0_0
end

function ButtonLayoutButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 40 * _1080p)

	var_6_0.id = "ButtonLayoutButton"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "GenericButton"

	var_6_4.Text:SetLeft(_1080p * 20, 0)
	var_6_4.Text:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_6_5()
		local var_7_0 = var_6_0:GetDataSource().name:GetValue(var_6_1)

		if var_7_0 ~= nil then
			var_6_4.Text:setText(var_7_0, 0)
		end
	end

	var_6_4:SubscribeToModelThroughElement(var_6_0, "name", var_6_5)
	var_6_0:addElement(var_6_4)

	var_6_0.GenericButton = var_6_4

	local var_6_6
	local var_6_7 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_6_1
	})

	var_6_7.id = "Equipped"

	var_6_7:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -12, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_7)

	var_6_0.Equipped = var_6_7

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ButtonLayoutButton", ButtonLayoutButton)
LockTable(_M)
