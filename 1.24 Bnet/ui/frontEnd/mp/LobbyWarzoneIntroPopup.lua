module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.PlayButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		Lobby.AttemptOpenBRTutorial(arg_1_1, Lobby.BRTutorialLobbyType.TUTORIAL, true)
		ACTIONS.LeaveMenu(arg_1_0)

		return true
	end)

	if arg_1_2.isMainMenu then
		arg_1_0.NotNowButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			ACTIONS.LeaveMenu(arg_1_0)

			return true
		end)
		ACTIONS.AnimateSequence(arg_1_0, "Show2Buttons")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Show1Button")
		arg_1_0.NotNowButton:SetAlpha(0)
		arg_1_0.NotNowButton:SetFocusable(false)
		arg_1_0.NotNowButton:SetHandleMouse(false)

		local function var_1_0(arg_4_0, arg_4_1)
			arg_4_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_secondary",
				priority = 0,
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
			arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
				ACTIONS.LeaveMenu(arg_1_0)

				return true
			end)
		end

		arg_1_0:addEventHandler("menu_create", var_1_0)
	end

	if arg_1_0.SkipButton and CONDITIONS.CanSkipWZTutorial() then
		if arg_1_0.SkipButton.PlayTutorial then
			arg_1_0.SkipButton.PlayTutorial:setText(Engine.JCBDICCAH("[DEV_ONLY] Skip"))
		end

		arg_1_0.SkipButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			LUI.FlowManager.RequestAddMenu("BRMainMenu", false, arg_1_1, false, arg_1_2.brMainMenuOptions)
			ACTIONS.LeaveMenu(arg_1_0)

			return true
		end)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function LobbyWarzoneIntroPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIHorizontalNavigator.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "LobbyWarzoneIntroPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Darkener"

	var_7_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_4:SetAlpha(0.95, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Darkener = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -400, _1080p * 400)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "WarzoneImage"

	var_7_8:setImage(RegisterMaterial("warzone_tutorial_image"), 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 863, _1080p * -399, _1080p * 399)
	var_7_0:addElement(var_7_8)

	var_7_0.WarzoneImage = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Gradient"

	var_7_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -863, _1080p * 863, _1080p * -699, _1080p * -141)
	var_7_0:addElement(var_7_10)

	var_7_0.Gradient = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("BRPlayTutorialButton", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "PlayButton"

	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 248, _1080p * 363)
	var_7_0:addElement(var_7_12)

	var_7_0.PlayButton = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "NotNowButton"

	var_7_14:SetAlpha(0, 0)
	var_7_14.Text:SetLeft(_1080p * 20, 0)
	var_7_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/NOT_NOW"), 0)
	var_7_14.Text:SetAlignment(LUI.Alignment.Center)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 883, _1080p * 921)
	var_7_0:addElement(var_7_14)

	var_7_0.NotNowButton = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "ButtonHelperBar"

	var_7_16.Background:SetAlpha(0, 0)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 400, _1080p * 460)
	var_7_0:addElement(var_7_16)

	var_7_0.ButtonHelperBar = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIText.new()

	var_7_18.id = "Description"

	var_7_18:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_7_18:setText(Engine.CBBHFCGDIC("ONBOARDING/WZ_INTRO_POPUP_DESC_1"), 0)
	var_7_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_18:SetAlignment(LUI.Alignment.Center)
	var_7_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -391, _1080p * 401, _1080p * 159, _1080p * 183)
	var_7_0:addElement(var_7_18)

	var_7_0.Description = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("LobbyWarzoneIntroRewardsPopup", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "Rewards"

	var_7_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -534, _1080p * -154, _1080p * 58, _1080p * 364)
	var_7_0:addElement(var_7_20)

	var_7_0.Rewards = var_7_20

	local var_7_21

	if CONDITIONS.CanSkipWZTutorial(var_7_0) then
		local var_7_22 = MenuBuilder.BuildRegisteredType("BRPlayTutorialButton", {
			controllerIndex = var_7_1
		})

		var_7_22.id = "SkipButton"

		var_7_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -555, _1080p * -306, _1080p * 294, _1080p * 362)
		var_7_0:addElement(var_7_22)

		var_7_0.SkipButton = var_7_22
	end

	local function var_7_23()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_23

	local var_7_24
	local var_7_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 882
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 920
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 750
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1170
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_7_0.NotNowButton.BackgroundDarkener
		}
	}

	var_7_14:RegisterAnimationSequence("Show2Buttons", var_7_25)

	local function var_7_26()
		var_7_14:AnimateSequence("Show2Buttons")
	end

	var_7_0._sequences.Show2Buttons = var_7_26

	local var_7_27
	local var_7_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_7_0.NotNowButton.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 919
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("Show1Button", var_7_28)

	local function var_7_29()
		var_7_14:AnimateSequence("Show1Button")
	end

	var_7_0._sequences.Show1Button = var_7_29

	var_7_14:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)

	function var_7_0.addButtonHelperFunction(arg_12_0, arg_12_1)
		arg_12_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_7_0:addEventHandler("menu_create", var_7_0.addButtonHelperFunction)

	local var_7_30 = LUI.UIBindButton.new()

	var_7_30.id = "selfBindButton"

	var_7_0:addElement(var_7_30)

	var_7_0.bindButton = var_7_30

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LobbyWarzoneIntroPopup", LobbyWarzoneIntroPopup)
LockTable(_M)
