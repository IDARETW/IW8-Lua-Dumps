module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Button:SetButtonDisabled(not arg_1_1)
	arg_1_0.Button:SetMouseFocusBlocker(not arg_1_1)
	arg_1_0.Button:SetFocusable(arg_1_1)
	arg_1_0.Button:SetAlpha(arg_1_1 and 1 or 0)
end

local function var_0_1(...)
	local var_2_0 = {
		...
	}

	var_2_0[1].Button.Text:setText(unpack(var_2_0, 2))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetButtonVisibility = var_0_0
	arg_3_0.setText = var_0_1

	arg_3_0.Button:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		arg_4_0:dispatchEventToCurrentMenu({
			dispatchChildren = true,
			name = "gamebattles_match_lobby_button_action",
			controller = arg_3_1
		})
	end)
end

function GameBattlesMatchLobbyButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalList.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "GameBattlesMatchLobbyButton"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetSpacing(10 * _1080p)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Button"

	var_5_4.Text:SetLeft(_1080p * 20, 0)
	var_5_4.Text:setText(ToUpperCase(""), 0)
	var_5_4.Text:SetAlignment(LUI.Alignment.Center)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 460, 0, _1080p * 50)
	var_5_0:addElement(var_5_4)

	var_5_0.Button = var_5_4

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("GameBattlesMatchLobbyButton", GameBattlesMatchLobbyButton)
LockTable(_M)
