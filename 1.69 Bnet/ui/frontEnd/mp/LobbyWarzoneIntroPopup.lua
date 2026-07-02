module(..., package.seeall)
LUI.FlowManager.RequestSetStack("LobbyWarzoneIntroPopup", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "BRMainMenu"
	}
})

local function var_0_0()
	Lobby.DeactivateBRTutorialInit()
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	Lobby.ActivateBRTutorialInit(Lobby.BRTutorialLobbyType.TUTORIAL)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PlayButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = true

		Lobby.AttemptOpenBRTutorial(arg_3_1, Lobby.BRTutorialLobbyType.TUTORIAL, true, var_4_0)
		arg_3_0.LobbyStatus:HideHorizontalSpinner()
		ACTIONS.AnimateSequence(arg_3_0.LobbyStatus, "LoadingSpinner")
		arg_3_0.LobbyStatus:SetAlpha(1)
		arg_3_0.PlayButton:SetAlpha(0)
		arg_3_0.PlayButton:SetFocusable(false)
		arg_3_0.PlayButton:SetHandleMouse(false)
		arg_3_0.NotNowButton:SetAlpha(0)
		arg_3_0.NotNowButton:SetFocusable(false)
		arg_3_0.NotNowButton:SetHandleMouse(false)
		Engine.CEJJDJJHIJ(arg_3_1, "dlog_event_tutorial_skip", {
			tutorial_action = "Play Tutorial",
			premium_user = Engine.CFHBIHABCB(arg_3_1)
		})

		return true
	end)

	if arg_3_2.isMainMenu then
		arg_3_0.NotNowButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			LUI.FlowManager.RequestAddMenu("BRMainMenu", false, arg_3_1, false, arg_3_2.brMainMenuOptions)
			ACTIONS.LeaveMenu(arg_3_0)

			return true
		end)
		ACTIONS.AnimateSequence(arg_3_0, "Show2Buttons")
	elseif CONDITIONS.CanSkipWZTutorial(arg_3_0) or Engine.BHICADFIHA() then
		arg_3_0.Description:setText(Engine.CBBHFCGDIC("ONBOARDING/WZ_INTRO_POPUP_DESC_1_ALT"), 0)
		arg_3_0.NotNowButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			LUI.FlowManager.RequestAddMenu("BRMainMenu", false, arg_3_1, false, arg_3_2.brMainMenuOptions)
			ACTIONS.LeaveMenu(arg_3_0)
			Onboarding.WARZONE_INTRODUCTION.MarkCompleted(arg_3_0, arg_3_1)
			Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.MarkCompleted(arg_3_0, arg_3_1)
			Engine.CEJJDJJHIJ(arg_3_1, "dlog_event_tutorial_skip", {
				tutorial_action = "Skip Tutorial",
				premium_user = Engine.CFHBIHABCB(arg_3_1)
			})

			return true
		end)
		ACTIONS.AnimateSequence(arg_3_0, "Show2Buttons")
	else
		ACTIONS.AnimateSequence(arg_3_0, "Show1Button")
		arg_3_0.NotNowButton:SetAlpha(0)
		arg_3_0.NotNowButton:SetFocusable(false)
		arg_3_0.NotNowButton:SetHandleMouse(false)
	end

	arg_3_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or arg_3_1
		local var_7_1, var_7_2 = Lobby.BGIBDIBHH()

		if var_7_1 < Lobby.PartyState.STARTING_SOON then
			Lobby.LeaveCustomGameLobby()
			LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, nil)
			Engine.CEJJDJJHIJ(var_7_0, "dlog_event_tutorial_skip", {
				tutorial_action = "No Choice / Exit to Main Menu",
				premium_user = Engine.CFHBIHABCB(var_7_0)
			})
		end
	end)
	arg_3_0.Rewards.LootItemFront:SetFocusable(false)
	arg_3_0.Rewards.LootItemBack:SetFocusable(false)
	ACTIONS.ScaleFullscreen(arg_3_0.Darkener)
	arg_3_0.LobbyStatus:SetAlpha(0)
end

function LobbyWarzoneIntroPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "LobbyWarzoneIntroPopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)
	var_0_1(var_8_0, var_8_1, arg_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_4:SetAlpha(0.95, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -400, _1080p * 400)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "WarzoneImage"

	var_8_8:setImage(RegisterMaterial("warzone_tutorial_image"), 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 863, _1080p * -399, _1080p * 399)
	var_8_0:addElement(var_8_8)

	var_8_0.WarzoneImage = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Gradient"

	var_8_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -863, _1080p * 863, _1080p * -413, _1080p * -141)
	var_8_0:addElement(var_8_10)

	var_8_0.Gradient = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("BRPlayTutorialButton", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "PlayButton"

	var_8_12.PlayTutorial:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_TUTORIAL")), 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 223, _1080p * 338)
	var_8_0:addElement(var_8_12)

	var_8_0.PlayButton = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "NotNowButton"

	var_8_14:SetAlpha(0, 0)
	var_8_14.Text:SetLeft(_1080p * 20, 0)
	var_8_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/NOT_NOW"), 0)
	var_8_14.Text:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 883, _1080p * 921)
	var_8_0:addElement(var_8_14)

	var_8_0.NotNowButton = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "ButtonHelperBar"

	var_8_16.Background:SetAlpha(0, 0)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 400, _1080p * 460)
	var_8_0:addElement(var_8_16)

	var_8_0.ButtonHelperBar = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIText.new()

	var_8_18.id = "Description"

	var_8_18:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_8_18:setText(Engine.CBBHFCGDIC("ONBOARDING/WZ_INTRO_POPUP_DESC_1"), 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Center)
	var_8_18:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -396, _1080p * 396, _1080p * 376, _1080p * 399)
	var_8_0:addElement(var_8_18)

	var_8_0.Description = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("LobbyWarzoneIntroRewardsPopup", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "Rewards"

	var_8_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -534, _1080p * -154, _1080p * 37, _1080p * 343)
	var_8_0:addElement(var_8_20)

	var_8_0.Rewards = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "LobbyStatus"

	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 718, _1080p * 868)
	var_8_0:addElement(var_8_22)

	var_8_0.LobbyStatus = var_8_22

	local function var_8_23()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 147
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 261
		}
	}

	var_8_12:RegisterAnimationSequence("Show2Buttons", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 815
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 853
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
			child = var_8_0.NotNowButton.BackgroundDarkener
		}
	}

	var_8_14:RegisterAnimationSequence("Show2Buttons", var_8_26)

	local function var_8_27()
		var_8_12:AnimateSequence("Show2Buttons")
		var_8_14:AnimateSequence("Show2Buttons")
	end

	var_8_0._sequences.Show2Buttons = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_8_12:RegisterAnimationSequence("Show1Button", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_8_0.NotNowButton.Text
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

	var_8_14:RegisterAnimationSequence("Show1Button", var_8_30)

	local function var_8_31()
		var_8_12:AnimateSequence("Show1Button")
		var_8_14:AnimateSequence("Show1Button")
	end

	var_8_0._sequences.Show1Button = var_8_31

	var_8_14:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)

	function var_8_0.addButtonHelperFunction(arg_13_0, arg_13_1)
		arg_13_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
		})
	end

	var_8_0:addEventHandler("menu_create", var_8_0.addButtonHelperFunction)

	local var_8_32 = LUI.UIBindButton.new()

	var_8_32.id = "selfBindButton"

	var_8_0:addElement(var_8_32)

	var_8_0.bindButton = var_8_32

	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("LobbyWarzoneIntroPopup", LobbyWarzoneIntroPopup)
LUI.FlowManager.RegisterStackPopBehaviour("LobbyWarzoneIntroPopup", var_0_0)
LockTable(_M)
