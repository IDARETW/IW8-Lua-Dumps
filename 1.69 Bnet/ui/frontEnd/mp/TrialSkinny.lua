module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = {
		popupTitle = Engine.CBBHFCGDIC("MPUI/TRIAL_REWARD_TITLE")
	}
	local var_1_1 = tonumber(arg_1_0)
	local var_1_2 = LOOT.GetTypeForID(var_1_1)
	local var_1_3 = LOOT.GetItemRef(var_1_2, var_1_1)

	var_1_0.itemImage = LOOT.GetItemImage(var_1_2, var_1_3)
	var_1_0.itemName = LOOT.GetItemName(var_1_2, var_1_3)
	var_1_0.itemCount = 1

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.StartTrialButton:SetButtonDisabled(arg_2_1)
	arg_2_0.StartTrialHoldButton:SetButtonDisabled(arg_2_1)

	arg_2_0._preventLeavingMenu = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.isQuickAccessShortcutsDisabled = true
	arg_3_0._isTrialAttemptStarted = true

	var_0_1(arg_3_0, true)

	local var_3_0 = WEAPON.StreamTrialWeapons(arg_3_2)
	local var_3_1 = false
	local var_3_2 = 10
	local var_3_3 = 0
	local var_3_4 = "poll_weapons"
	local var_3_5 = LUI.UITimer.new({
		interval = 500,
		event = var_3_4
	})

	var_3_5.id = "pollWeaponsTimer"

	arg_3_0:addElement(var_3_5)
	arg_3_0:registerEventHandler(var_3_4, function(arg_4_0, arg_4_1)
		local var_4_0 = Streaming.BJHEBDBACF(var_3_0)

		if not var_3_1 and (var_4_0 or var_3_3 >= var_3_2) then
			Trials.DCEJEBIAFF(arg_3_1, arg_3_2, TRIALS.TicketID)

			var_3_1 = true

			Dvar.DFIJDJFIFD("MRNSMSRQMO", 0)

			arg_4_0._isTrialAttemptStarted = false
		end

		var_3_3 = var_3_3 + 1
	end)
end

local function var_0_3(arg_5_0, arg_5_1)
	local var_5_0 = Loot.DEBEIFJEEG(arg_5_1, TRIALS.TicketID)

	arg_5_0.AvailableTickets:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_AVAILABLE_TICKETS", var_5_0), 0)
	arg_5_0.StartTrialHoldButton.Text:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_ENTER", var_5_0), 0)
	arg_5_0.StartTrialButton.Text:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_ENTER", var_5_0), 0)
end

local function var_0_4(arg_6_0, arg_6_1)
	Dvar.BDEHAEGHAF("NSQLTTMRMP", arg_6_1)
	Dvar.BDEHAEGHAF("OKPMLLKRP", arg_6_1)
	Dvar.BDEHAEGHAF("NSMSQOMSLO", "")
	Dvar.DFIJDJFIFD("LTTRKNNKTQ", arg_6_0)
	Dvar.DHEGHJJJHI("LOQKLRKQMO", false)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_2.trialData

	arg_7_0._currentTrialId = 1452
	arg_7_0._preventLeavingMenu = false

	arg_7_0.TrialSkinnyDetails:SetupTrialDetails(var_7_0)
	arg_7_0.TrialSkinnyRewards:SetupTrialReward(var_7_0)
	var_0_4(var_7_0.id, var_7_0.zone)
	var_0_3(arg_7_0, arg_7_1)
	arg_7_0.StartTrialButton:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
		arg_7_0.Warning:SetAlpha(0)

		if Loot.DEBEIFJEEG(arg_7_1, TRIALS.TicketID) > 0 then
			local var_8_0 = {}

			var_8_0.warningMessage = "MPUI/TRIAL_BEGIN_POPUP_CONFIRMATION"

			function var_8_0.yesAction(arg_9_0)
				var_0_2(arg_7_0, arg_7_1, arg_7_0._currentTrialId)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "ModularWarningPopup", true, arg_7_1, false, var_8_0)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "NoTrialTicket", true, arg_7_1, false)
		end
	end)
	arg_7_0.StartTrialHoldButton:SetHandleMouse(false)
	LUI.AddUIHoldButtonLogic(arg_7_0.StartTrialHoldButton, arg_7_1, {
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_7_0.StartTrialHoldButton.GenericProgressBar,
		onFill = function()
			if Loot.DEBEIFJEEG(arg_7_1, TRIALS.TicketID) > 0 then
				var_0_2(arg_7_0, arg_7_1, arg_7_0._currentTrialId)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "NoTrialTicket", true, arg_7_1, false)
			end

			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	})
	arg_7_0:addAndCallEventHandler("update_input_type", function(arg_11_0, arg_11_1)
		if LUI.IsLastInputGamepad(arg_11_1.controllerIndex) then
			arg_11_0.StartTrialButton:SetAlpha(0)
			arg_11_0.StartTrialButton:SetFocusable(false)
			arg_11_0.StartTrialButton:processEvent({
				name = "lose_focus"
			})
			arg_11_0.StartTrialHoldButton:SetAlpha(1)
			arg_11_0.StartTrialHoldButton:SetFocusable(true)
			arg_11_0.StartTrialHoldButton:processEvent({
				name = "gain_focus"
			})
		else
			arg_11_0.StartTrialHoldButton:SetAlpha(0)
			arg_11_0.StartTrialHoldButton:SetFocusable(false)
			arg_11_0.StartTrialHoldButton:processEvent({
				name = "lose_focus"
			})
			arg_11_0.StartTrialButton:SetAlpha(1)
			arg_11_0.StartTrialButton:SetFocusable(true)
			arg_11_0.StartTrialButton:processEvent({
				name = "gain_focus"
			})
		end
	end, {
		controllerIndex = arg_7_1
	})
	arg_7_0:addEventHandler("trial_activated", function(arg_12_0, arg_12_1)
		var_0_3(arg_7_0, arg_7_1)
	end)
	arg_7_0:addEventHandler("trial_activation_failed", function(arg_13_0, arg_13_1)
		arg_13_0.Warning:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_CANNOT_START"))
		arg_13_0.Warning:SetAlpha(1)
		var_0_1(arg_13_0, false)
	end)

	local var_7_1 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_7_1.id = "lobbyStatusTimer"

	arg_7_0:addElement(var_7_1)
	arg_7_0:registerEventHandler("update_lobby_status", function(arg_14_0, arg_14_1)
		local var_14_0, var_14_1, var_14_2 = Lobby.GetStatusString(arg_7_1)

		if var_14_0 then
			if TRIALS.IsLobbyStatePreventedInTrials(var_14_2) then
				arg_7_0.Spinner:SetAlpha(0)
				arg_7_0.Status:SetAlpha(0)
			elseif arg_7_0._isTrialAttemptStarted then
				arg_7_0.Status:SetAlpha(1)
				arg_7_0.Status:setText(var_14_0)

				local var_14_3 = #var_14_0 > 0 and not CONDITIONS.IsLaunchChunk()

				arg_7_0.Spinner:SetAlpha(var_14_3 and 1 or 0)
			end
		end
	end)

	local var_7_2 = LUI.UIBindButton.new()

	var_7_2.id = "selfBindButton"

	arg_7_0:addElement(var_7_2)

	arg_7_0.bindButton = var_7_2

	arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_7_0._preventLeavingMenu then
			LUI.FlowManager.RequestLeaveMenu(arg_7_0, true)
		end
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_7_0, arg_7_1)
	ACTIONS.ScaleFullscreen(arg_7_0.Background)
	ACTIONS.ScaleFullscreen(arg_7_0.Blur)
	arg_7_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
end

function TrialSkinny(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_16_0.id = "TrialSkinny"

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIBlur.new()

	var_16_4.id = "Blur"

	var_16_4:SetBlurStrength(0.75, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.Blur = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "Background"

	var_16_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_16_6:SetAlpha(0.9, 0)
	var_16_0:addElement(var_16_6)

	var_16_0.Background = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "GenericPopupWindow"

	var_16_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -375, _1080p * 375)
	var_16_0:addElement(var_16_8)

	var_16_0.GenericPopupWindow = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIStyledText.new()

	var_16_10.id = "Title"

	var_16_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_16_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRIAL")), 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_16_10:SetWordWrap(false)
	var_16_10:SetAlignment(LUI.Alignment.Center)
	var_16_10:SetDecodeLetterLength(50)
	var_16_10:SetDecodeMaxRandChars(2)
	var_16_10:SetDecodeUpdatesPerLetter(10)
	var_16_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -335, _1080p * -275)
	var_16_0:addElement(var_16_10)

	var_16_0.Title = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("TrialSkinnyDetails", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "TrialSkinnyDetails"

	var_16_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -627, _1080p * 33, _1080p * -225, _1080p * 246)
	var_16_0:addElement(var_16_12)

	var_16_0.TrialSkinnyDetails = var_16_12

	local var_16_13
	local var_16_14 = MenuBuilder.BuildRegisteredType("TrialSkinnyReward", {
		controllerIndex = var_16_1
	})

	var_16_14.id = "TrialSkinnyRewards"

	var_16_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 79, _1080p * 729, _1080p * -225, _1080p * 225)
	var_16_0:addElement(var_16_14)

	var_16_0.TrialSkinnyRewards = var_16_14

	local var_16_15
	local var_16_16 = LUI.UIText.new()

	var_16_16.id = "AvailableTickets"

	var_16_16:setText("", 0)
	var_16_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_16:SetAlignment(LUI.Alignment.Center)
	var_16_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -255, _1080p * 245, _1080p * 322, _1080p * 346)
	var_16_0:addElement(var_16_16)

	var_16_0.AvailableTickets = var_16_16

	local var_16_17
	local var_16_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_18.id = "StartTrialButton"

	var_16_18.Text:SetLeft(_1080p * 20, 0)
	var_16_18.Text:setText(ToUpperCase(""), 0)
	var_16_18.Text:SetAlignment(LUI.Alignment.Center)
	var_16_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 270, _1080p * 308)
	var_16_0:addElement(var_16_18)

	var_16_0.StartTrialButton = var_16_18

	local var_16_19
	local var_16_20 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_16_1
	})

	var_16_20.id = "StartTrialHoldButton"

	var_16_20.Text:setText(ToUpperCase(""), 0)
	var_16_20.Text:SetAlignment(LUI.Alignment.Center)
	var_16_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 270, _1080p * 308)
	var_16_0:addElement(var_16_20)

	var_16_0.StartTrialHoldButton = var_16_20

	local var_16_21
	local var_16_22 = LUI.UIText.new()

	var_16_22.id = "Status"

	var_16_22:setText("", 0)
	var_16_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_22:SetAlignment(LUI.Alignment.Center)
	var_16_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -245, _1080p * 255, _1080p * -267, _1080p * -247)
	var_16_0:addElement(var_16_22)

	var_16_0.Status = var_16_22

	local var_16_23
	local var_16_24 = LUI.UIImage.new()

	var_16_24.id = "Spinner"

	var_16_24:SetAlpha(0, 0)
	var_16_24:setImage(RegisterMaterial("spinner_loading"), 0)
	var_16_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -165, _1080p * 175, _1080p * -247, _1080p * -237)
	var_16_0:addElement(var_16_24)

	var_16_0.Spinner = var_16_24

	local var_16_25
	local var_16_26 = LUI.UIText.new()

	var_16_26.id = "Warning"

	var_16_26:setText("", 0)
	var_16_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_26:SetAlignment(LUI.Alignment.Center)
	var_16_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -965, _1080p * 955, _1080p * 245, _1080p * 265)
	var_16_0:addElement(var_16_26)

	var_16_0.Warning = var_16_26

	local var_16_27
	local var_16_28 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})

	var_16_28.id = "ButtonHelperBar"

	var_16_28.Background:SetAlpha(0.2, 0)
	var_16_28:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * 2)
	var_16_0:addElement(var_16_28)

	var_16_0.ButtonHelperBar = var_16_28

	function var_16_0.addButtonHelperFunction(arg_17_0, arg_17_1)
		arg_17_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_17_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_16_0:addEventHandler("menu_create", var_16_0.addButtonHelperFunction)

	local var_16_29 = LUI.UIBindButton.new()

	var_16_29.id = "selfBindButton"

	var_16_0:addElement(var_16_29)

	var_16_0.bindButton = var_16_29

	var_0_5(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("TrialSkinny", TrialSkinny)
LockTable(_M)
