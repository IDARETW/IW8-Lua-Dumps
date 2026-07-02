module(..., package.seeall)
LUI.FlowManager.RequestSetStack("LobbyWarzoneTutorial", {
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

local var_0_0 = {
	{
		"gametype",
		"br"
	},
	{
		"commonOption",
		"codcasterEnabled",
		false
	},
	{
		"commonOption",
		"timeLimit",
		0
	},
	{
		"commonOption",
		"teamSize",
		1
	},
	{
		"commonOption",
		"teamCount",
		50
	}
}
local var_0_1 = {
	{
		mission = "LUA_MENU/WZ_ORIENTATION",
		leavingToBRMainMenuRequiresCompletion = true,
		cfgFile = "br_tutorial.cfg",
		canAutoLoad = true,
		mapName = "mp_br_tut",
		lootId = Dvar.CFHDGABACF("LPKRQLLLNQ") or 30080,
		rewardId = BRLOOT.rewardsTypes.TRAINING_REWARD,
		onboardingTutorialInitiationType = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED,
		onboardingTutorialCompletionType = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED
	},
	{
		mission = "LUA_MENU/WZ_PRACTICE",
		cfgFile = "br_practice_tutorial.cfg",
		canAutoLoad = false,
		mapName = "mp_br_quarry",
		animationSequence = "Practice",
		lootId = Dvar.CFHDGABACF("NOMPNRSPRL") or 128,
		rewardId = BRLOOT.rewardsTypes.PRACTICE_REWARD,
		onboardingTutorialCompletionType = Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED,
		extraMatchRules = {
			{
				"brData",
				"gulag",
				true
			}
		}
	},
	{
		mapName = "mp_bm_tut",
		cfgFile = "bm_tutorial.cfg",
		mission = "LUA_MENU/BM_ORIENTATION",
		animationSequence = "BloodMoney",
		canAutoLoad = false,
		lootId = Dvar.CFHDGABACF("LNKPLSSRQ") or 170696,
		rewardId = BRLOOT.rewardsTypes.BLOOD_MONEY_TRAINING_REWARD,
		extraMatchRules = {
			{
				"commonOption",
				"teamSize",
				2
			},
			{
				"commonOption",
				"scoreLimit",
				0
			}
		}
	}
}

local function var_0_2()
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	MatchRules.BCECADEHDA("war")
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = var_0_1[arg_2_2.tutorialType]

	assert(var_2_0)

	if var_2_0 == nil then
		var_2_0 = {
			mapName = "mp_bm_tut"
		}
	end

	Dvar.DFIJDJFIFD("OOTQKOTRM", 24)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", true)
	Dvar.BDEHAEGHAF("NSQLTTMRMP", var_2_0.mapName)
	Dvar.BDEHAEGHAF("OKPMLLKRP", var_2_0.mapName)
	Dvar.BDEHAEGHAF("NSMSQOMSLO", "")
end

local function var_0_4(arg_3_0)
	if arg_3_0 then
		for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
			MatchRules.CIGFFEAEFD(unpack(iter_3_1))
		end
	end
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = var_0_1[arg_4_2]
	local var_4_1, var_4_2 = Lobby.BGIBDIBHH()

	if var_4_1 < Lobby.PartyState.STARTING_SOON then
		Lobby.LeaveCustomGameLobby()

		if not var_4_0.leavingToBRMainMenuRequiresCompletion or var_4_0.onboardingTutorialInitiationType.WasCompleted(arg_4_0, arg_4_1) then
			LUI.FlowManager.RequestLeaveMenu(arg_4_0, true, true)
		else
			LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, nil)
		end
	end

	return true
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = var_0_1[arg_5_2]

	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_5_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU)

	arg_5_0._isLoading = true
	arg_5_0.isQuickAccessShortcutsDisabled = true

	MatchRules.BCECADEHDA()

	if var_5_0.cfgFile then
		Engine.DAGFFDGFII("exec " .. var_5_0.cfgFile)
	end

	var_0_4(var_0_0)
	var_0_4(var_5_0.extraMatchRules)
	Dvar.DHEGHJJJHI("NNPMRQSQN", false)
	Engine.DAGFFDGFII("xpartygo 1")
end

local function var_0_7(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.StartTutorial = StartTutorial

	local var_6_0 = var_0_1[arg_6_2.tutorialType]
	local var_6_1 = arg_6_2.forceLoad and var_6_0.canAutoLoad and not Dvar.IBEGCHEFE("LSPSKLPNQT")

	arg_6_0._showSpinner = var_6_1

	local var_6_2
	local var_6_3 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_6_1
	})

	var_6_3.id = "ButtonHelperBar"

	var_6_3:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	arg_6_0:addElement(var_6_3)

	arg_6_0.ButtonHelperBar = var_6_3

	local var_6_4 = OnlineProgression.DFBEBDGCHJ(arg_6_1, var_6_0.rewardId)

	if var_6_4 then
		ACTIONS.AnimateSequence(arg_6_0.GenericCheckBox, "Enabled")
	end

	local var_6_5 = LOOT.GetLootCardData(arg_6_1, var_6_0.lootId)

	arg_6_0.Reward:UpdateCardConfig(var_6_5)

	local var_6_6 = var_6_0.mission

	arg_6_0.TutorialMapName:setText(Engine.CBBHFCGDIC(var_6_0.mission))
	arg_6_0.LobbyStatus:HideHorizontalSpinner()
	ACTIONS.AnimateSequence(arg_6_0.LobbyStatus, "LoadingSpinner")

	if arg_6_0._showSpinner then
		arg_6_0.LobbyStatus:SetAlpha(1)
		arg_6_0.StartButton:SetAlpha(0)
		arg_6_0.StartButton:ElementDisable()
	else
		arg_6_0.LobbyStatus:SetAlpha(0)
		arg_6_0.StartButton:SetAlpha(1)
	end

	if not var_6_1 then
		arg_6_0.bindButton = LUI.UIBindButton.new()

		arg_6_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
			var_0_5(arg_6_0, arg_6_1, arg_6_2.tutorialType)

			return true
		end)
		arg_6_0:addElement(arg_6_0.bindButton)

		if arg_6_2.needContinue and var_6_4 then
			ACTIONS.AnimateSequence(arg_6_0, "ContinueButton")
			arg_6_0.StartButton:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
				var_0_5(arg_6_0, arg_6_1, arg_6_2.tutorialType)

				return true
			end)
		else
			LUI.AddUIHoldButtonLogic(arg_6_0.StartButton, arg_6_1, {
				clickKeyboardAndMouse = true,
				requireFocus = true,
				duration = 1000,
				buttons = {
					primary = true
				},
				fill = arg_6_0.StartButton.GenericProgressBar,
				onFill = function()
					var_0_6(arg_6_0, arg_6_1, arg_6_2.tutorialType)

					arg_6_0._showSpinner = true

					arg_6_0.LobbyStatus:SetAlpha(1)
					arg_6_0.StartButton:SetAlpha(0)
					arg_6_0.StartButton:ElementDisable()
					arg_6_0.ButtonHelperBar.ButtonHelperText:RemoveButtonPrompt("button_primary")
				end
			})
		end

		arg_6_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_6_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	else
		arg_6_0.StartButton:closeTree()
		var_0_6(arg_6_0, arg_6_1, arg_6_2.tutorialType)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_6_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
	ACTIONS.ScaleFullscreen(arg_6_0.Background)

	if var_6_0.animationSequence then
		ACTIONS.AnimateSequence(arg_6_0, var_6_0.animationSequence)
	end
end

function LobbyWarzoneTutorial(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalNavigator.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "LobbyWarzoneTutorial"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)
	var_0_3(var_10_0, var_10_1, arg_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.95, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "GenericPopupWindow"

	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -429, _1080p * 427)
	var_10_0:addElement(var_10_6)

	var_10_0.GenericPopupWindow = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "IconGameMode"

	var_10_8:setImage(RegisterMaterial("icon_br_mode_tut"), 0)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -819, _1080p * -619, _1080p * 95, _1080p * 295)
	var_10_0:addElement(var_10_8)

	var_10_0.IconGameMode = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "WarzoneTitle"

	var_10_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAPNAME_BR_TUT")), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -596, _1080p * 169, _1080p * 654, _1080p * 704)
	var_10_0:addElement(var_10_10)

	var_10_0.WarzoneTitle = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIText.new()

	var_10_12.id = "RewardsLabel"

	var_10_12:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_PLURAL"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 371, _1080p * 819, _1080p * 629, _1080p * 665)
	var_10_0:addElement(var_10_12)

	var_10_0.RewardsLabel = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIText.new()

	var_10_14.id = "RewardDesc"

	var_10_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_10_14:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_REWARD_DESC"), 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_14:SetAlignment(LUI.Alignment.Left)
	var_10_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 338, _1080p * 747, _1080p * 666, _1080p * 686)
	var_10_0:addElement(var_10_14)

	var_10_0.RewardDesc = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "Reward"

	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1129, _1080p * 1279, _1080p * 637, _1080p * 837)
	var_10_0:addElement(var_10_16)

	var_10_0.Reward = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIText.new()

	var_10_18.id = "TutorialMapName"

	var_10_18:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_10_18:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_ORIENTATION"), 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_18:SetAlignment(LUI.Alignment.Left)
	var_10_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -595, _1080p * -95, _1080p * 779, _1080p * 807)
	var_10_0:addElement(var_10_18)

	var_10_0.TutorialMapName = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "GenericCheckBox"

	var_10_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1298, _1080p * 1320, _1080p * 637, _1080p * 659)
	var_10_0:addElement(var_10_20)

	var_10_0.GenericCheckBox = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "StartButton"

	var_10_22.GenericProgressBar.DialogueBackground:SetAlpha(0, 0)
	var_10_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_TUTORIAL")), 0)
	var_10_22.Text:SetAlignment(LUI.Alignment.Center)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 906, _1080p * 946)
	var_10_0:addElement(var_10_22)

	var_10_0.StartButton = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "LobbyStatus"

	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 845, _1080p * 995)
	var_10_0:addElement(var_10_24)

	var_10_0.LobbyStatus = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIImage.new()

	var_10_26.id = "LineGlow"

	var_10_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_10_26:SetAlpha(0.6, 0)
	var_10_26:SetPixelGridEnabled(true)
	var_10_26:SetPixelGridContrast(0.5, 0)
	var_10_26:SetPixelGridBlockWidth(2, 0)
	var_10_26:SetPixelGridBlockHeight(2, 0)
	var_10_26:SetPixelGridGutterWidth(1, 0)
	var_10_26:SetPixelGridGutterHeight(1, 0)
	var_10_26:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_10_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 562, _1080p * 608)
	var_10_0:addElement(var_10_26)

	var_10_0.LineGlow = var_10_26

	local var_10_27
	local var_10_28 = LUI.UIImage.new()

	var_10_28.id = "Image"

	var_10_28:setImage(RegisterMaterial("warzone_tutorial_lobby"), 0)
	var_10_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1025, _1080p * 1021, _1080p * -749, _1080p * 275)
	var_10_0:addElement(var_10_28)

	var_10_0.Image = var_10_28

	local var_10_29
	local var_10_30 = LUI.UIImage.new()

	var_10_30.id = "Line"

	var_10_30:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_10_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 584, _1080p * 585)
	var_10_0:addElement(var_10_30)

	var_10_0.Line = var_10_30

	local var_10_31
	local var_10_32 = LUI.UIText.new()

	var_10_32.id = "OperationTitle"

	var_10_32:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_10_32:setText(Engine.CBBHFCGDIC("GAME/OPERATION"), 0)
	var_10_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_32:SetAlignment(LUI.Alignment.Left)
	var_10_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -596, _1080p * -148, _1080p * 629, _1080p * 657)
	var_10_0:addElement(var_10_32)

	var_10_0.OperationTitle = var_10_32

	local var_10_33
	local var_10_34 = LUI.UIText.new()

	var_10_34.id = "MissionTitle"

	var_10_34:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_10_34:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSIONS"), 0)
	var_10_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_34:SetAlignment(LUI.Alignment.Left)
	var_10_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -596, _1080p * -148, _1080p * 752, _1080p * 780)
	var_10_0:addElement(var_10_34)

	var_10_0.MissionTitle = var_10_34

	local function var_10_35()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_35

	local var_10_36
	local var_10_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 411
		}
	}

	var_10_10:RegisterAnimationSequence("AR", var_10_37)

	local var_10_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 411
		}
	}

	var_10_12:RegisterAnimationSequence("AR", var_10_38)

	local function var_10_39()
		var_10_10:AnimateSequence("AR")
		var_10_12:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_39

	local var_10_40
	local var_10_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_br_mode_plunder_training")
		}
	}

	var_10_8:RegisterAnimationSequence("BloodMoney", var_10_41)

	local var_10_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("plunder_practice_lobby")
		}
	}

	var_10_28:RegisterAnimationSequence("BloodMoney", var_10_42)

	local function var_10_43()
		var_10_8:AnimateSequence("BloodMoney")
		var_10_28:AnimateSequence("BloodMoney")
	end

	var_10_0._sequences.BloodMoney = var_10_43

	local var_10_44
	local var_10_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_br_mode_practice")
		}
	}

	var_10_8:RegisterAnimationSequence("Practice", var_10_45)

	local var_10_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAPNAME_BR_QUARRY"))
		}
	}

	var_10_10:RegisterAnimationSequence("Practice", var_10_46)

	local var_10_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE")
		}
	}

	var_10_18:RegisterAnimationSequence("Practice", var_10_47)

	local var_10_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("warzone_practice_lobby")
		}
	}

	var_10_28:RegisterAnimationSequence("Practice", var_10_48)

	local function var_10_49()
		var_10_8:AnimateSequence("Practice")
		var_10_10:AnimateSequence("Practice")
		var_10_18:AnimateSequence("Practice")
		var_10_28:AnimateSequence("Practice")
	end

	var_10_0._sequences.Practice = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE")),
			child = var_10_0.StartButton.Text
		}
	}

	var_10_22:RegisterAnimationSequence("ContinueButton", var_10_51)

	local function var_10_52()
		var_10_22:AnimateSequence("ContinueButton")
	end

	var_10_0._sequences.ContinueButton = var_10_52

	var_0_7(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("LobbyWarzoneTutorial", LobbyWarzoneTutorial)
LUI.FlowManager.RegisterStackPopBehaviour("LobbyWarzoneTutorial", var_0_2)
LockTable(_M)
