module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/DAILY"))
	arg_1_0.DailyActiveChallenges:SetHeaderText("CHALLENGE/DAILY_CHALLENGES_X_RESERVES_PARTIAL_CAPS")
	ACTIONS.AnimateSequence(arg_1_0, "Intro")

	if not Onboarding.WeaponMasteryChallengeReserves.WasCompleted(arg_1_0, arg_1_1) then
		LUI.FlowManager.RequestPopupMenu(arg_1_0, "onboardingpopup", true, arg_1_1, false, ONBOARDING_DATA.GetOnboardingCH2WZMasteryChallengesReservesData())
		Onboarding.WeaponMasteryChallengeReserves.MarkCompleted(arg_1_0, arg_1_1)
	end

	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_1_0, arg_1_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.TabBacker)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_1_0)
	end
end

function WZBarracksChallengesSelectionMenu(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "WZBarracksChallengesSelectionMenu"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	var_2_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})
	var_2_0.HelperBar.id = "HelperBar"

	var_2_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_2_0.HelperBar:setPriority(10)
	var_2_0:addElement(var_2_0.HelperBar)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Darken"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_2_4:SetAlpha(0.5, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Darken = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "Vignette"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_2_0:addElement(var_2_6)

	var_2_0.Vignette = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "TabBacker"

	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_2_0:addElement(var_2_8)

	var_2_0.TabBacker = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "MenuTitle"

	var_2_10.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY"), 0)
	var_2_10.Line:SetLeft(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_2_0:addElement(var_2_10)

	var_2_0.MenuTitle = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "LobbyMembersFooter"

	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_2_0:addElement(var_2_12)

	var_2_0.LobbyMembersFooter = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("WZChallengesDaily", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "DailyActiveChallenges"

	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1705, _1080p * 216, _1080p * 934)
	var_2_0:addElement(var_2_14)

	var_2_0.DailyActiveChallenges = var_2_14

	local function var_2_15()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_15

	local var_2_16
	local var_2_17 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1177
		}
	}

	var_2_14:RegisterAnimationSequence("Intro", var_2_17)

	local function var_2_18()
		var_2_14:AnimateSequence("Intro")
	end

	var_2_0._sequences.Intro = var_2_18

	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_2_19 = LUI.UIBindButton.new()

	var_2_19.id = "selfBindButton"

	var_2_0:addElement(var_2_19)

	var_2_0.bindButton = var_2_19

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WZBarracksChallengesSelectionMenu", WZBarracksChallengesSelectionMenu)
LockTable(_M)
