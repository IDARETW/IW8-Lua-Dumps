module(..., package.seeall)
LUI.FlowManager.RequestSetStack("LobbyWarzonePractice", {
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
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	MatchRules.BCECADEHDA("war")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	Dvar.DFIJDJFIFD("OOTQKOTRM", 24)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", true)
	Dvar.BDEHAEGHAF("NSQLTTMRMP", "mp_br_quarry")
	Dvar.BDEHAEGHAF("OKPMLLKRP", "mp_br_quarry")
	Dvar.BDEHAEGHAF("NSMSQOMSLO", "")
end

local function var_0_2(arg_3_0, arg_3_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_3_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU)

	arg_3_0._isLoading = true
	arg_3_0.isQuickAccessShortcutsDisabled = true

	MatchRules.BCECADEHDA()
	Engine.DAGFFDGFII("exec br_practice_tutorial.cfg")
	MatchRules.CIGFFEAEFD("gametype", "br")
	MatchRules.CIGFFEAEFD("commonOption", "codcasterEnabled", false)
	MatchRules.CIGFFEAEFD("commonOption", "timeLimit", 0)
	MatchRules.CIGFFEAEFD("commonOption", "teamSize", 1)
	MatchRules.CIGFFEAEFD("commonOption", "teamCount", 50)
	MatchRules.CIGFFEAEFD("brData", "gulag", true)
	Engine.DAGFFDGFII("xpartygo 1")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.StartPractice = var_0_2
	arg_4_0._showSpinner = false

	local var_4_0
	local var_4_1 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_4_1
	})

	var_4_1.id = "ButtonHelperBar"

	var_4_1:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	arg_4_0:addElement(var_4_1)

	arg_4_0.ButtonHelperBar = var_4_1

	arg_4_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	if OnlineProgression.DFBEBDGCHJ(arg_4_1, BRLOOT.rewardsTypes.PRACTICE_REWARD) then
		ACTIONS.AnimateSequence(arg_4_0.GenericCheckBox, "Enabled")
	end

	local var_4_2 = Dvar.CFHDGABACF("NOMPNRSPRL") or 128
	local var_4_3 = LOOT.GetLootCardData(arg_4_1, var_4_2)

	arg_4_0.Reward:UpdateCardConfig(var_4_3)

	arg_4_0.bindButton = LUI.UIBindButton.new()

	arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		local var_5_0, var_5_1 = Lobby.BGIBDIBHH()

		if var_5_0 < Lobby.PartyState.STARTING_SOON then
			Lobby.LeaveCustomGameLobby()
			LUI.FlowManager.RequestLeaveMenu(arg_4_0, true, true)
		end

		return true
	end)
	arg_4_0:addElement(arg_4_0.bindButton)
	LUI.AddUIHoldButtonLogic(arg_4_0.StartButton, arg_4_1, {
		clickKeyboardAndMouse = true,
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_4_0.StartButton.GenericProgressBar,
		onFill = function()
			arg_4_0:StartPractice(arg_4_1)

			arg_4_0._showSpinner = true

			arg_4_0.LobbyStatus:SetAlpha(1)
			arg_4_0.StartButton:SetAlpha(0)
			arg_4_0.StartButton:ElementDisable()
			arg_4_0.ButtonHelperBar.ButtonHelperText:RemoveButtonPrompt("button_primary")
		end
	})
	arg_4_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_4_0.LobbyStatus:HideHorizontalSpinner()
	ACTIONS.AnimateSequence(arg_4_0.LobbyStatus, "LoadingSpinner")

	if arg_4_0._showSpinner then
		arg_4_0.LobbyStatus:SetAlpha(1)
		arg_4_0.StartButton:SetAlpha(0)
	else
		arg_4_0.LobbyStatus:SetAlpha(0)
		arg_4_0.StartButton:SetAlpha(1)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_4_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_4_0, arg_4_1)
	ACTIONS.ScaleFullscreen(arg_4_0.Background)
end

function LobbyWarzonePractice(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "LobbyWarzonePractice"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)
	var_0_1(var_7_0, var_7_1, arg_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0.95, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -429, _1080p * 427)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "IconGameMode"

	var_7_8:setImage(RegisterMaterial("icon_mp_mode_arena"), 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -819, _1080p * -619, _1080p * 70, _1080p * 270)
	var_7_0:addElement(var_7_8)

	var_7_0.IconGameMode = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIText.new()

	var_7_10.id = "WarzoneTitle"

	var_7_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAPNAME_BR_QUARRY")), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_7_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -596, _1080p * 169, _1080p * 654, _1080p * 704)
	var_7_0:addElement(var_7_10)

	var_7_0.WarzoneTitle = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIText.new()

	var_7_12.id = "RewardsLabel"

	var_7_12:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_7_12:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_PLURAL"), 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_12:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 371, _1080p * 819, _1080p * 629, _1080p * 665)
	var_7_0:addElement(var_7_12)

	var_7_0.RewardsLabel = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIText.new()

	var_7_14.id = "RewardDesc"

	var_7_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_7_14:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_REWARD_DESC"), 0)
	var_7_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_14:SetAlignment(LUI.Alignment.Left)
	var_7_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 338, _1080p * 747, _1080p * 666, _1080p * 686)
	var_7_0:addElement(var_7_14)

	var_7_0.RewardDesc = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "Reward"

	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1129, _1080p * 1279, _1080p * 637, _1080p * 837)
	var_7_0:addElement(var_7_16)

	var_7_0.Reward = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIText.new()

	var_7_18.id = "PracticeMapName"

	var_7_18:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_7_18:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE"), 0)
	var_7_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_18:SetAlignment(LUI.Alignment.Left)
	var_7_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -595, _1080p * -95, _1080p * 756, _1080p * 784)
	var_7_0:addElement(var_7_18)

	var_7_0.PracticeMapName = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "GenericCheckBox"

	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1298, _1080p * 1320, _1080p * 637, _1080p * 659)
	var_7_0:addElement(var_7_20)

	var_7_0.GenericCheckBox = var_7_20

	local var_7_21
	local var_7_22 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_7_1
	})

	var_7_22.id = "StartButton"

	var_7_22.GenericProgressBar.DialogueBackground:SetAlpha(0, 0)
	var_7_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_TUTORIAL")), 0)
	var_7_22.Text:SetAlignment(LUI.Alignment.Center)
	var_7_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 906, _1080p * 946)
	var_7_0:addElement(var_7_22)

	var_7_0.StartButton = var_7_22

	local var_7_23
	local var_7_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_7_1
	})

	var_7_24.id = "LobbyStatus"

	var_7_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 845, _1080p * 995)
	var_7_0:addElement(var_7_24)

	var_7_0.LobbyStatus = var_7_24

	local var_7_25
	local var_7_26 = LUI.UIImage.new()

	var_7_26.id = "LineGlow"

	var_7_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_26:SetAlpha(0.6, 0)
	var_7_26:SetPixelGridEnabled(true)
	var_7_26:SetPixelGridContrast(0.5, 0)
	var_7_26:SetPixelGridBlockWidth(2, 0)
	var_7_26:SetPixelGridBlockHeight(2, 0)
	var_7_26:SetPixelGridGutterWidth(1, 0)
	var_7_26:SetPixelGridGutterHeight(1, 0)
	var_7_26:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_7_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 562, _1080p * 608)
	var_7_0:addElement(var_7_26)

	var_7_0.LineGlow = var_7_26

	local var_7_27
	local var_7_28 = LUI.UIImage.new()

	var_7_28.id = "Image"

	var_7_28:setImage(RegisterMaterial("warzone_tutorial_lobby"), 0)
	var_7_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1025, _1080p * 1021, _1080p * -749, _1080p * 275)
	var_7_0:addElement(var_7_28)

	var_7_0.Image = var_7_28

	local var_7_29
	local var_7_30 = LUI.UIImage.new()

	var_7_30.id = "Line"

	var_7_30:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 584, _1080p * 585)
	var_7_0:addElement(var_7_30)

	var_7_0.Line = var_7_30

	local var_7_31
	local var_7_32 = LUI.UIText.new()

	var_7_32.id = "OperationTitle"

	var_7_32:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_7_32:setText(Engine.CBBHFCGDIC("GAME/OPERATION"), 0)
	var_7_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_32:SetAlignment(LUI.Alignment.Left)
	var_7_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -596, _1080p * -148, _1080p * 629, _1080p * 657)
	var_7_0:addElement(var_7_32)

	var_7_0.OperationTitle = var_7_32

	local var_7_33
	local var_7_34 = LUI.UIText.new()

	var_7_34.id = "MissionTitle"

	var_7_34:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_7_34:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSIONS"), 0)
	var_7_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_34:SetAlignment(LUI.Alignment.Left)
	var_7_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -596, _1080p * -148, _1080p * 732, _1080p * 760)
	var_7_0:addElement(var_7_34)

	var_7_0.MissionTitle = var_7_34

	local function var_7_35()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_35

	local var_7_36
	local var_7_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 63
		}
	}

	var_7_10:RegisterAnimationSequence("AR", var_7_37)

	local function var_7_38()
		var_7_10:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_38

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LobbyWarzonePractice", LobbyWarzonePractice)
LUI.FlowManager.RegisterStackPopBehaviour("LobbyWarzonePractice", var_0_0)
LockTable(_M)
