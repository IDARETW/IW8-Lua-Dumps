module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/DAILY"))
	ACTIONS.ScaleFullscreen(arg_1_0.Darken)

	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_2_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

function BarracksChallengesDailyContainer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "BarracksChallengesDailyContainer"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	var_3_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})
	var_3_0.HelperBar.id = "HelperBar"

	var_3_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0.HelperBar:setPriority(10)
	var_3_0:addElement(var_3_0.HelperBar)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = {
		worldBlur = 1,
		controllerIndex = var_3_1
	}
	local var_3_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_3_4)

	var_3_5.id = "WorldBlur"

	var_3_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_3_0:addElement(var_3_5)

	var_3_0.WorldBlur = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIImage.new()

	var_3_7.id = "Darken"

	var_3_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_7:SetAlpha(0.5, 0)
	var_3_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * 1, 0, 0)
	var_3_0:addElement(var_3_7)

	var_3_0.Darken = var_3_7

	local var_3_8
	local var_3_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_3_1
	})

	var_3_9.id = "TabBacker"

	var_3_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_3_0:addElement(var_3_9)

	var_3_0.TabBacker = var_3_9

	local var_3_10
	local var_3_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_11.id = "MenuTitle"

	var_3_11.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY"), 0)
	var_3_11.Line:SetLeft(0, 0)
	var_3_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_3_0:addElement(var_3_11)

	var_3_0.MenuTitle = var_3_11

	local var_3_12
	local var_3_13 = MenuBuilder.BuildRegisteredType("BarracksChallengesDaily", {
		controllerIndex = var_3_1
	})

	var_3_13.id = "BarracksChallengesDaily"

	var_3_13:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_13)

	var_3_0.BarracksChallengesDaily = var_3_13

	local var_3_14
	local var_3_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_3_1
	})

	var_3_15.id = "LobbyMembersFooter"

	var_3_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_3_0:addElement(var_3_15)

	var_3_0.LobbyMembersFooter = var_3_15

	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_3_16 = LUI.UIBindButton.new()

	var_3_16.id = "selfBindButton"

	var_3_0:addElement(var_3_16)

	var_3_0.bindButton = var_3_16

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BarracksChallengesDailyContainer", BarracksChallengesDailyContainer)
LockTable(_M)
