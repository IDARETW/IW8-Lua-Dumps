module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._controllerIndex = arg_1_1

	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		arg_1_0.WZMainMenuBladeLayout:processEvent(arg_2_1)
	end)
end

function WZMainMenu(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "WZMainMenu"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:setImage(RegisterMaterial("frontend_main_menu"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WZMainMenuBladeLayout", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "WZMainMenuBladeLayout"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_3_0:addElement(var_3_6)

	var_3_0.WZMainMenuBladeLayout = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Copyright"

	var_3_8:SetRGBFromInt(14277081, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -79, _1080p * -55)
	var_3_0:addElement(var_3_8)

	var_3_0.Copyright = var_3_8

	local var_3_9

	if CONDITIONS.IsXboxLive(var_3_0) then
		local var_3_10 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_3_1
		})

		var_3_10.id = "Gamertag"

		var_3_10:SetRGBFromTable(SWATCHES.MainMenu.ButtonMain, 0)
		var_3_10.TextLabel:SetAlignment(LUI.Alignment.Left)
		var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 86, _1080p * 116)
		var_3_0:addElement(var_3_10)

		var_3_0.Gamertag = var_3_10
	end

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "HelperBar"

	var_3_12.Background:SetAlpha(0.2, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.HelperBar = var_3_12

	local var_3_13

	if CONDITIONS.IsUserSignedInDemonware(var_3_1) then
		local var_3_14 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_3_1
		})

		var_3_14.id = "MPPlayerDetails"

		var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_3_0:addElement(var_3_14)

		var_3_0.MPPlayerDetails = var_3_14
	end

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "MenuTitle"

	var_3_16.MenuTitle:setText("WIP - Warzone Test Blade", 0)
	var_3_16.Line:SetLeft(0, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1154, _1080p * 80, _1080p * 185)
	var_3_0:addElement(var_3_16)

	var_3_0.MenuTitle = var_3_16

	local var_3_17

	if CONDITIONS.IsSocialEnabledInMainMenu(var_3_0) then
		local var_3_18 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
			controllerIndex = var_3_1
		})

		var_3_18.id = "PartyWidget"

		var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
		var_3_0:addElement(var_3_18)

		var_3_0.PartyWidget = var_3_18
	end

	function var_3_0.addButtonHelperFunction(arg_4_0, arg_4_1)
		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_19 = LUI.UIBindButton.new()

	var_3_19.id = "selfBindButton"

	var_3_0:addElement(var_3_19)

	var_3_0.bindButton = var_3_19

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZMainMenu", WZMainMenu)
LockTable(_M)
