module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	Dvar.BDEHAEGHAF("NSQLTTMRMP", arg_1_1)
	Dvar.BDEHAEGHAF("OKPMLLKRP", arg_1_1)
	Dvar.BDEHAEGHAF("NSMSQOMSLO", "")
	Dvar.DFIJDJFIFD("LTTRKNNKTQ", arg_1_0)
	Dvar.DHEGHJJJHI("LOQKLRKQMO", true)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.trialData)
	var_0_0(arg_2_2.trialData.id, arg_2_2.trialData.zone)

	local var_2_0 = {
		arg_2_0.TrialEventStartPopupMedalContainerBronze,
		arg_2_0.TrialEventStartPopupMedalContainerSilver,
		arg_2_0.TrialEventStartPopupMedalContainerGold
	}

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		iter_2_1:SetupData(iter_2_0, arg_2_2.trialData)
	end

	arg_2_0.TrialName:setText(Engine.CBBHFCGDIC(arg_2_2.trialData.ui_name))
	arg_2_0.TrialImage:setImage(RegisterMaterial(arg_2_2.trialData.ui_previewMapImage))
	arg_2_0.TrialDecsription:setText(Engine.CBBHFCGDIC(arg_2_2.trialData.ui_description))

	if arg_2_2.trialData.bestScore > 0 then
		if arg_2_2.trialData.scoreType == "time" then
			arg_2_0.PersonalBest:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_BEST_TIME", Engine.JCBDICCAH(TIME.FormatMilliseconds(arg_2_2.trialData.bestScore, TIME.Format.STOPWATCH))))
		else
			arg_2_0.PersonalBest:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_BEST_SCORE", arg_2_2.trialData.bestScore))
		end

		ACTIONS.AnimateSequence(arg_2_0, "HasRecordedTime")
	end

	local function var_2_1(arg_3_0, arg_3_1)
		arg_3_0.StartTrialButton:SetButtonDisabled(arg_3_1)
		arg_3_0.StartTrialHoldButton:SetButtonDisabled(arg_3_1)

		arg_3_0._preventLeavingMenu = arg_3_1
	end

	local function var_2_2(arg_4_0, arg_4_1)
		arg_2_0._isTrialStarted = true

		if Lobby.CAEJIEEEDF() == 0 then
			Lobby.CJBHJEAFGH(2)
		end

		Engine.EBIDFIDHIE("xpartygo 1")
		var_2_1(arg_2_0, true)
	end

	local function var_2_3(arg_5_0, arg_5_1)
		var_2_2(arg_2_0, arg_5_1.controllerIndex)
	end

	arg_2_0.StartTrialButton:registerEventHandler("button_action", var_2_3)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_2_0._preventLeavingMenu then
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
		end
	end)

	local var_2_4 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_2_4.id = "lobbyStatusTimer"

	arg_2_0:addElement(var_2_4)
	arg_2_0:registerEventHandler("update_lobby_status", function(arg_7_0, arg_7_1)
		local var_7_0, var_7_1, var_7_2 = Lobby.GetStatusString(arg_2_1)

		if var_7_0 then
			if TRIALS.IsLobbyStatePreventedInTrials(var_7_2) then
				arg_2_0.Spinner:SetAlpha(0)
				arg_2_0.Status:SetAlpha(0)
			elseif arg_2_0._isTrialStarted then
				arg_2_0.Status:SetAlpha(1)
				arg_2_0.Status:setText(var_7_0)

				local var_7_3 = #var_7_0 > 0 and not CONDITIONS.IsLaunchChunk()

				arg_2_0.Spinner:SetAlpha(var_7_3 and 1 or 0)
			end
		end
	end)
	arg_2_0.StartTrialHoldButton:SetHandleMouse(false)
	LUI.AddUIHoldButtonLogic(arg_2_0.StartTrialHoldButton, arg_2_1, {
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_2_0.StartTrialHoldButton.GenericProgressBar,
		onFill = function()
			var_2_2(arg_2_0, arg_2_1)
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	})
	arg_2_0:addAndCallEventHandler("update_input_type", function(arg_9_0, arg_9_1)
		if LUI.IsLastInputGamepad(arg_9_1.controllerIndex) then
			arg_9_0.StartTrialButton:SetAlpha(0)
			arg_9_0.StartTrialButton:SetFocusable(false)
			arg_9_0.StartTrialButton:processEvent({
				name = "lose_focus"
			})
			arg_9_0.StartTrialHoldButton:SetAlpha(1)
			arg_9_0.StartTrialHoldButton:SetFocusable(true)
			arg_9_0.StartTrialHoldButton:processEvent({
				name = "gain_focus"
			})
		else
			arg_9_0.StartTrialHoldButton:SetAlpha(0)
			arg_9_0.StartTrialHoldButton:SetFocusable(false)
			arg_9_0.StartTrialHoldButton:processEvent({
				name = "lose_focus"
			})
			arg_9_0.StartTrialButton:SetAlpha(1)
			arg_9_0.StartTrialButton:SetFocusable(true)
			arg_9_0.StartTrialButton:processEvent({
				name = "gain_focus"
			})
		end
	end, {
		controllerIndex = arg_2_1
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Background)
	ACTIONS.ScaleFullscreen(arg_2_0.Blur)
	arg_2_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
end

function TrialEventStartPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalNavigator.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "TrialEventStartPopup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIBlur.new()

	var_10_4.id = "Blur"

	var_10_4:SetBlurStrength(0.75, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Blur = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Background"

	var_10_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_6:SetAlpha(0.9, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.Background = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "GenericPopupWindow"

	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -375, _1080p * 375)
	var_10_0:addElement(var_10_8)

	var_10_0.GenericPopupWindow = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIStyledText.new()

	var_10_10.id = "Title"

	var_10_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_10:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/MODE_NAME")), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_10:SetWordWrap(false)
	var_10_10:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetDecodeLetterLength(50)
	var_10_10:SetDecodeMaxRandChars(2)
	var_10_10:SetDecodeUpdatesPerLetter(10)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -335, _1080p * -275)
	var_10_0:addElement(var_10_10)

	var_10_0.Title = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIText.new()

	var_10_12.id = "TrialName"

	var_10_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_12:setText("", 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -667, _1080p * -167, _1080p * -254, _1080p * -224)
	var_10_0:addElement(var_10_12)

	var_10_0.TrialName = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIText.new()

	var_10_14.id = "TrialDecsription"

	var_10_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_14:setText("", 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_14:SetAlignment(LUI.Alignment.Left)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -667, _1080p * -237, _1080p * -206, _1080p * -184)
	var_10_0:addElement(var_10_14)

	var_10_0.TrialDecsription = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIImage.new()

	var_10_16.id = "TrialImage"

	var_10_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -667, _1080p * -313, _1080p * -4, _1080p * 193)
	var_10_0:addElement(var_10_16)

	var_10_0.TrialImage = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "PersonalBestBackground"

	var_10_18:SetRGBFromInt(0, 0)
	var_10_18:SetAlpha(0, 0)
	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -667, _1080p * -313, _1080p * 155, _1080p * 193)
	var_10_0:addElement(var_10_18)

	var_10_0.PersonalBestBackground = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIText.new()

	var_10_20.id = "PersonalBest"

	var_10_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_20:SetAlpha(0, 0)
	var_10_20:setText("", 0)
	var_10_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_20:SetAlignment(LUI.Alignment.Left)
	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -659, _1080p * -320, _1080p * 162, _1080p * 186)
	var_10_0:addElement(var_10_20)

	var_10_0.PersonalBest = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("TrialEventStartPopupMedalContainer", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "TrialEventStartPopupMedalContainerGold"

	var_10_22.Medal:setImage(RegisterMaterial("trial_medal_gold"), 0)
	var_10_22.Name:SetRGBFromTable(SWATCHES.trialEvent.trialGold, 0)
	var_10_22.Name:setText(Engine.CBBHFCGDIC("TRIALEVENT/GOLD"), 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 452, _1080p * 667, _1080p * -257, _1080p * 243)
	var_10_0:addElement(var_10_22)

	var_10_0.TrialEventStartPopupMedalContainerGold = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("TrialEventStartPopupMedalContainer", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "TrialEventStartPopupMedalContainerSilver"

	var_10_24.Medal:setImage(RegisterMaterial("trial_medal_silver"), 0)
	var_10_24.Name:SetRGBFromTable(SWATCHES.trialEvent.trialSilver, 0)
	var_10_24.Name:setText(Engine.CBBHFCGDIC("TRIALEVENT/SILVER"), 0)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 175, _1080p * 390, _1080p * -260, _1080p * 240)
	var_10_0:addElement(var_10_24)

	var_10_0.TrialEventStartPopupMedalContainerSilver = var_10_24

	local var_10_25
	local var_10_26 = MenuBuilder.BuildRegisteredType("TrialEventStartPopupMedalContainer", {
		controllerIndex = var_10_1
	})

	var_10_26.id = "TrialEventStartPopupMedalContainerBronze"

	var_10_26.Medal:setImage(RegisterMaterial("trial_medal_bronze"), 0)
	var_10_26.Name:SetRGBFromTable(SWATCHES.trialEvent.trialBronze, 0)
	var_10_26.Name:setText(Engine.CBBHFCGDIC("TRIALEVENT/BRONZE"), 0)
	var_10_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -102, _1080p * 112, _1080p * -260, _1080p * 240)
	var_10_0:addElement(var_10_26)

	var_10_0.TrialEventStartPopupMedalContainerBronze = var_10_26

	local var_10_27
	local var_10_28 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_10_1
	})

	var_10_28.id = "StartTrialButton"

	var_10_28.Text:SetLeft(_1080p * 20, 0)
	var_10_28.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/START_TRIAL_BUTTON")), 0)
	var_10_28.Text:SetAlignment(LUI.Alignment.Center)
	var_10_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 290, _1080p * 328)
	var_10_0:addElement(var_10_28)

	var_10_0.StartTrialButton = var_10_28

	local var_10_29
	local var_10_30 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_10_1
	})

	var_10_30.id = "StartTrialHoldButton"

	var_10_30.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/START_TRIAL_BUTTON")), 0)
	var_10_30.Text:SetAlignment(LUI.Alignment.Center)
	var_10_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 290, _1080p * 328)
	var_10_0:addElement(var_10_30)

	var_10_0.StartTrialHoldButton = var_10_30

	local var_10_31
	local var_10_32 = LUI.UIText.new()

	var_10_32.id = "Status"

	var_10_32:setText("", 0)
	var_10_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_32:SetAlignment(LUI.Alignment.Center)
	var_10_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * 252, _1080p * 272)
	var_10_0:addElement(var_10_32)

	var_10_0.Status = var_10_32

	local var_10_33
	local var_10_34 = LUI.UIImage.new()

	var_10_34.id = "Spinner"

	var_10_34:SetAlpha(0, 0)
	var_10_34:setImage(RegisterMaterial("spinner_loading"), 0)
	var_10_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 272, _1080p * 282)
	var_10_0:addElement(var_10_34)

	var_10_0.Spinner = var_10_34

	local var_10_35
	local var_10_36 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})

	var_10_36.id = "ButtonHelperBar"

	var_10_36.Background:SetAlpha(0.2, 0)
	var_10_36:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * 2)
	var_10_0:addElement(var_10_36)

	var_10_0.ButtonHelperBar = var_10_36

	local var_10_37
	local var_10_38 = LUI.UIText.new()

	var_10_38.id = "RewardLabel"

	var_10_38:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_38:setText(Engine.CBBHFCGDIC("TOURNAMENT/REWARDS"), 0)
	var_10_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_38:SetAlignment(LUI.Alignment.Left)
	var_10_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -102, _1080p * 398, _1080p * -254, _1080p * -234)
	var_10_0:addElement(var_10_38)

	var_10_0.RewardLabel = var_10_38

	local function var_10_39()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_39

	local var_10_40
	local var_10_41 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("HasRecordedTime", var_10_41)

	local var_10_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("HasRecordedTime", var_10_42)

	local function var_10_43()
		var_10_18:AnimateSequence("HasRecordedTime")
		var_10_20:AnimateSequence("HasRecordedTime")
	end

	var_10_0._sequences.HasRecordedTime = var_10_43

	function var_10_0.addButtonHelperFunction(arg_13_0, arg_13_1)
		arg_13_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_13_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_10_0:addEventHandler("menu_create", var_10_0.addButtonHelperFunction)

	local var_10_44 = LUI.UIBindButton.new()

	var_10_44.id = "selfBindButton"

	var_10_0:addElement(var_10_44)

	var_10_0.bindButton = var_10_44

	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("TrialEventStartPopup", TrialEventStartPopup)
LockTable(_M)
