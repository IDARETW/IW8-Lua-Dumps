module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2 = arg_3_2 or SEASON.GetCurrentSeasonDisplayNum()

	arg_3_0.SeasonMasterContainer:UpdateContentForSeason(arg_3_1, arg_3_2)
	arg_3_0.PrestigeProgress:UpdateContentForSeason(arg_3_1, arg_3_2)
	arg_3_0.ProgressionChallengeContainer:UpdateContentForSeason(arg_3_1, arg_3_2)

	if SEASON.GetCurrentSeasonDisplayNum() == arg_3_2 then
		arg_3_0.PrestigeRewards:UpdateContainerForPrestigeLevel(arg_3_1, arg_3_2)
	else
		arg_3_0.PrestigeRewards:UpdateContainerForPastSeason(arg_3_1, arg_3_2)
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._seasonNum = arg_4_2.season or SEASON.GetCurrentSeasonDisplayNum()
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.UpdateContentForSeason = var_0_1

	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SEASONAL_PROGRESSION"))
	var_0_0(arg_5_0, arg_5_1, arg_5_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	local var_5_0 = {}
	local var_5_1 = SEASON.GetCurrentSeasonDisplayNum()

	for iter_5_0 = 1, var_5_1 do
		local var_5_2 = {
			name = SEASON.GetLocalizedName({
				seasonDataNumToUse = iter_5_0
			}),
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2)
				DebugPrint("Tab focused on season " .. tostring(iter_5_0))
				arg_5_0:UpdateContentForSeason(arg_6_1, iter_5_0)
			end
		}

		table.insert(var_5_0, var_5_2)
	end

	arg_5_0.tabsData = var_5_0

	arg_5_0.Tabs:SetTabs(var_5_0)
	arg_5_0.Tabs:SetAlignment(LUI.Alignment.Left)

	local var_5_3 = arg_5_2.season - 1

	LUI.TabManager.FocusTab(arg_5_0.Tabs, arg_5_1, var_5_3, FocusType.MouseOver)
	LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
	arg_5_0.ProgressionChallengeContainer.ChallengeLoadoutBackground:SetFocusable(false)
	arg_5_0.ProgressionChallengeContainer.ChallengeLoadoutBackground:SetMouseFocusBlocker(true)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_5_0)
	end

	ACTIONS.ScaleFullscreen(arg_5_0.Vignette)
	ACTIONS.ScaleFullscreen(arg_5_0.Darken)

	local function var_5_4(arg_7_0, arg_7_1)
		local var_7_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_7_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_5_0:addAndCallEventHandler("onVideoChange", var_5_4)
end

function SeasonalProgressionMenu(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIHorizontalNavigator.new()

	var_8_0.id = "SeasonalProgressionMenu"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)
	var_0_2(var_8_0, var_8_1, arg_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = {
		worldBlur = 1,
		controllerIndex = var_8_1
	}
	local var_8_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_8_4)

	var_8_5.id = "WorldBlur"

	var_8_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_8_0:addElement(var_8_5)

	var_8_0.WorldBlur = var_8_5

	local var_8_6
	local var_8_7 = LUI.UIImage.new()

	var_8_7.id = "Darken"

	var_8_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_7:SetAlpha(0.8, 0)
	var_8_0:addElement(var_8_7)

	var_8_0.Darken = var_8_7

	local var_8_8
	local var_8_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_8_1
	})

	var_8_9.id = "Vignette"

	var_8_9:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_9)

	var_8_0.Vignette = var_8_9

	local var_8_10

	if CONDITIONS.InGame() then
		local var_8_11 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_8_1
		})

		var_8_11.id = "InGameMenuBackground"

		var_8_11:SetAlpha(0, 0)
		var_8_11:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * 10, _1080p * -22, _1080p * -22)
		var_8_0:addElement(var_8_11)

		var_8_0.InGameMenuBackground = var_8_11
	end

	local var_8_12
	local var_8_13 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_8_1
	})

	var_8_13.id = "TabBacker"

	var_8_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_8_0:addElement(var_8_13)

	var_8_0.TabBacker = var_8_13

	local var_8_14
	local var_8_15 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_15.id = "MenuTitle"

	var_8_15.MenuTitle:setText("", 0)
	var_8_15.Line:SetLeft(0, 0)
	var_8_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_8_0:addElement(var_8_15)

	var_8_0.MenuTitle = var_8_15

	local var_8_16

	if not Engine.DDJFBBJAIG() then
		local var_8_17 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_8_1
		})

		var_8_17.id = "InGameMenuTimerStatus"

		var_8_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_8_0:addElement(var_8_17)

		var_8_0.InGameMenuTimerStatus = var_8_17
	end

	local var_8_18

	if CONDITIONS.InFrontendPublicMP() then
		local var_8_19 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_8_1
		})

		var_8_19.id = "MPPlayerDetails"

		var_8_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_8_0:addElement(var_8_19)

		var_8_0.MPPlayerDetails = var_8_19
	end

	local var_8_20
	local var_8_21 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_8_1
			})
		end,
		controllerIndex = var_8_1
	}
	local var_8_22 = LUI.TabManager.new(var_8_21)

	var_8_22.id = "Tabs"

	var_8_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 996, _1080p * 108, _1080p * 160)
	var_8_0:addElement(var_8_22)

	var_8_0.Tabs = var_8_22

	local var_8_23

	if CONDITIONS.InFrontend() then
		local var_8_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_8_1
		})

		var_8_24.id = "LobbyMembersFooter"

		var_8_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_8_0:addElement(var_8_24)

		var_8_0.LobbyMembersFooter = var_8_24
	end

	local var_8_25
	local var_8_26 = MenuBuilder.BuildRegisteredType("ProgressionChallengeContainer", {
		controllerIndex = var_8_1
	})

	var_8_26.id = "ProgressionChallengeContainer"

	var_8_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1220, _1080p * 335, _1080p * 1021)
	var_8_0:addElement(var_8_26)

	var_8_0.ProgressionChallengeContainer = var_8_26

	local var_8_27
	local var_8_28 = MenuBuilder.BuildRegisteredType("PrestigeRewardContainer", {
		controllerIndex = var_8_1
	})

	var_8_28.id = "PrestigeRewards"

	var_8_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -664, _1080p * -300, _1080p * 335, _1080p * 584)
	var_8_0:addElement(var_8_28)

	var_8_0.PrestigeRewards = var_8_28

	local var_8_29
	local var_8_30 = MenuBuilder.BuildRegisteredType("SeasonMasterContainer", {
		controllerIndex = var_8_1
	})

	var_8_30.id = "SeasonMasterContainer"

	var_8_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -664, _1080p * -300, _1080p * 593, _1080p * 917)
	var_8_0:addElement(var_8_30)

	var_8_0.SeasonMasterContainer = var_8_30

	local var_8_31
	local var_8_32 = MenuBuilder.BuildRegisteredType("PrestigeProgressBar", {
		controllerIndex = var_8_1
	})

	var_8_32.id = "PrestigeProgress"

	var_8_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1210, _1080p * 206, _1080p * 318)
	var_8_0:addElement(var_8_32)

	var_8_0.PrestigeProgress = var_8_32

	local function var_8_33()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 574
		}
	}

	var_8_28:RegisterAnimationSequence("SetDisplayPrestigeProgress", var_8_35)

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 784
		}
	}

	var_8_30:RegisterAnimationSequence("SetDisplayPrestigeProgress", var_8_36)

	local function var_8_37()
		var_8_28:AnimateSequence("SetDisplayPrestigeProgress")
		var_8_30:AnimateSequence("SetDisplayPrestigeProgress")
	end

	var_8_0._sequences.SetDisplayPrestigeProgress = var_8_37

	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_8_38 = LUI.UIBindButton.new()

	var_8_38.id = "selfBindButton"

	var_8_0:addElement(var_8_38)

	var_8_0.bindButton = var_8_38

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SeasonalProgressionMenu", SeasonalProgressionMenu)
LockTable(_M)
