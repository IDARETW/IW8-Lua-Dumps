module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.PlayButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		Lobby.AttemptOpenBRTutorial(arg_1_1, Lobby.BRTutorialLobbyType.BLOODMONEY, true)
		ACTIONS.LeaveMenu(arg_1_0)

		return true
	end)
	arg_1_0.BRPlayPlunder:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		ACTIONS.LeaveMenu(arg_1_0)

		return true
	end)
	arg_1_0:addEventHandler("menu_create", addButtonHelperFunction)

	if arg_1_0.Rewards.PlunderRewards then
		arg_1_0.Rewards:PlunderRewards()
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function LobbyPlunderIntroPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "LobbyPlunderIntroPopup"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.95, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -400, _1080p * 400)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "WarzoneImage"

	var_4_8:setImage(RegisterMaterial("plunder_tutorial_image"), 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 863, _1080p * -399, _1080p * 399)
	var_4_0:addElement(var_4_8)

	var_4_0.WarzoneImage = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Gradient"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -863, _1080p * 863, _1080p * -699, _1080p * -141)
	var_4_0:addElement(var_4_10)

	var_4_0.Gradient = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("BRPlayTutorialButton", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "PlayButton"

	var_4_12.PlayTutorial:setText(ToUpperCase(Engine.CBBHFCGDIC("ONBOARDING/PLUNDER_INTRO_BUTTON_1")), 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 209, _1080p * 305)
	var_4_0:addElement(var_4_12)

	var_4_0.PlayButton = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ButtonHelperBar"

	var_4_14.Background:SetAlpha(0, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 403, _1080p * 463)
	var_4_0:addElement(var_4_14)

	var_4_0.ButtonHelperBar = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIText.new()

	var_4_16.id = "Description"

	var_4_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_16:setText(Engine.CBBHFCGDIC("ONBOARDING/PLUNDER_INTRO_POPUP_DESC_1"), 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -396, _1080p * 396, _1080p * 146, _1080p * 170)
	var_4_0:addElement(var_4_16)

	var_4_0.Description = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("LobbyWarzoneIntroRewardsPopup", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "Rewards"

	var_4_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -534, _1080p * -154, _1080p * 58, _1080p * 364)
	var_4_0:addElement(var_4_18)

	var_4_0.Rewards = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("BRPlayTutorialButton", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "BRPlayPlunder"

	var_4_20.PlayTutorial:setText(ToUpperCase(Engine.CBBHFCGDIC("ONBOARDING/PLUNDER_INTRO_BUTTON_2")), 0)
	var_4_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 319, _1080p * 362)
	var_4_0:addElement(var_4_20)

	var_4_0.BRPlayPlunder = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIText.new()

	var_4_22.id = "Title"

	var_4_22:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BLOOD_MONEY")), 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_22:SetTracking(-5 * _1080p, 0)
	var_4_22:SetAlignment(LUI.Alignment.Center)
	var_4_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -812, _1080p * 812, _1080p * -374, _1080p * -246)
	var_4_0:addElement(var_4_22)

	var_4_0.Title = var_4_22

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LobbyPlunderIntroPopup", LobbyPlunderIntroPopup)
LockTable(_M)
