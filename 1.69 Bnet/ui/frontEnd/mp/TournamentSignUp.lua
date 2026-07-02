module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if Tournament.DFHHDFDDFJ(arg_1_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "TournamentWarningPopup", true, arg_1_1, false)
	end

	local var_1_0 = Tournament.BBAFFAGGHC(arg_1_1)

	arg_1_0.SignUpButtonHold:SetButtonDisabled(var_1_0)
	arg_1_0.SignUpButton:SetButtonDisabled(var_1_0)

	local var_1_1 = Tournament.DGCIDGIIHE()

	arg_1_0.SignUpButtonHold.Text:setText(Engine.CBBHFCGDIC("Tournament/SIGN_UP", var_1_1))
	arg_1_0.SignUpButton.Text:setText(Engine.CBBHFCGDIC("Tournament/SIGN_UP", var_1_1))

	local function var_1_2()
		local var_2_0 = Lobby.GFFECBCCF()
		local var_2_1 = Lobby.BGIADHIHAG()
		local var_2_2 = var_2_0 and not var_2_1

		arg_1_0.SignUpButtonHold:SetButtonDisabled(var_2_2)
		arg_1_0.SignUpButton:SetButtonDisabled(var_2_2)

		if var_2_2 then
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, nil)
		end
	end

	local var_1_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_1_4 = DataSources.frontEnd.lobby.memberCount

	arg_1_0:SubscribeToModel(var_1_3:GetModel(arg_1_1), var_1_2)
	arg_1_0:SubscribeToModel(var_1_4:GetModel(arg_1_1), var_1_2)

	local function var_1_5()
		if not Tournament.BHAEFIFBBA() then
			LUI.FlowManager.RequestPopupMenu(nil, "dc_qos_failed_warning", false, arg_1_1, false, {})

			return
		end

		if not Tournament.BBAFFAGGHC(arg_1_1) and TOURNAMENT.DoEntranceCheck(arg_1_1) then
			Tournament.CFABIDCGC(arg_1_1)
		end
	end

	arg_1_0.SignUpButton:registerEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = {}

		var_4_0.warningMessage = "MPUI/TOURNAMENT_BEGIN_POPUP_CONFIRMATION"
		var_4_0.yesAction = var_1_5

		LUI.FlowManager.RequestPopupMenu(nil, "ModularWarningPopup", true, arg_1_1, false, var_4_0)
	end)
	LUI.AddUIHoldButtonLogic(arg_1_0.SignUpButtonHold, arg_1_1, {
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_1_0.SignUpButtonHold.GenericProgressBar,
		onFill = var_1_5
	})
	arg_1_0:addAndCallEventHandler("update_input_type", function(arg_5_0, arg_5_1)
		if LUI.IsLastInputGamepad(arg_5_1.controllerIndex) then
			arg_5_0.SignUpButton:SetAlpha(0)
			arg_5_0.SignUpButton:SetHandleMouse(false)
			arg_5_0.SignUpButton:SetFocusable(false)
			arg_5_0.SignUpButtonHold:SetAlpha(1)
			arg_5_0.SignUpButtonHold:SetHandleMouse(true)
			arg_5_0.SignUpButtonHold:SetFocusable(true)
		else
			arg_5_0.SignUpButtonHold:SetAlpha(0)
			arg_5_0.SignUpButtonHold:SetHandleMouse(false)
			arg_5_0.SignUpButtonHold:SetFocusable(false)
			arg_5_0.SignUpButton:SetAlpha(1)
			arg_5_0.SignUpButton:SetHandleMouse(true)
			arg_5_0.SignUpButton:SetFocusable(true)
		end
	end, {
		controllerIndex = arg_1_1
	})

	local var_1_6 = Commerce.CEDDCGHIGA(arg_1_1, LOOT.CurrencyIDs.COD_POINTS)

	arg_1_0.YourWallet:setText(Engine.CBBHFCGDIC("Tournament/YOUR_WALLET", tonumber(var_1_6)))

	local function var_1_7()
		if Tournament.BBAFFAGGHC(arg_1_1) then
			LUI.FlowManager.RequestAddMenu("TournamentLoadingScreen", false, arg_1_1, true, {}, true)
		end
	end

	local var_1_8 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_1_8.id = "lobbyStatusTimer"

	arg_1_0:addElement(var_1_8)
	arg_1_0:registerEventHandler("update_lobby_status", var_1_7)
	var_1_7()
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.Background)
end

function TournamentSignUp(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "TournamentSignUp"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromTable(SWATCHES.CAC.attachShade, 0)
	var_7_4:SetAlpha(0.8, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "PopupBackground"

	var_7_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_7_6:SetAlpha(0.4, 0)
	var_7_6:SetPixelGridEnabled(true)
	var_7_6:SetPixelGridContrast(0.5, 0)
	var_7_6:SetPixelGridBlockWidth(2, 0)
	var_7_6:SetPixelGridBlockHeight(2, 0)
	var_7_6:SetPixelGridGutterWidth(1, 0)
	var_7_6:SetPixelGridGutterHeight(1, 0)
	var_7_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -486, _1080p * 470)
	var_7_0:addElement(var_7_6)

	var_7_0.PopupBackground = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIStyledText.new()

	var_7_8.id = "Title"

	var_7_8:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_7_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MPUI/ARENA")), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_8:SetWordWrap(false)
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetDecodeLetterLength(50)
	var_7_8:SetDecodeMaxRandChars(2)
	var_7_8:SetDecodeUpdatesPerLetter(10)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 265, _1080p * 726, _1080p * 72, _1080p * 200)
	var_7_0:addElement(var_7_8)

	var_7_0.Title = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "IconGameMode"

	var_7_10:setImage(RegisterMaterial("icon_mp_mode_arena"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -707, _1080p * -463, _1080p * -340)
	var_7_0:addElement(var_7_10)

	var_7_0.IconGameMode = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("TournamentDetails", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "TournamentDetails"

	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 929, _1080p * 223, _1080p * 873)
	var_7_0:addElement(var_7_12)

	var_7_0.TournamentDetails = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "SignUpButton"

	var_7_14.Text:setText(ToUpperCase(""), 0)
	var_7_14.Text:SetAlignment(LUI.Alignment.Center)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 905, _1080p * 943)
	var_7_0:addElement(var_7_14)

	var_7_0.SignUpButton = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "SignUpButtonHold"

	var_7_16.Text:setText(ToUpperCase(""), 0)
	var_7_16.Text:SetAlignment(LUI.Alignment.Center)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 905, _1080p * 943)
	var_7_0:addElement(var_7_16)

	var_7_0.SignUpButtonHold = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("TournamentRewards", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "TournamentRewards"

	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 990, _1080p * 1790, _1080p * 223, _1080p * 873)
	var_7_0:addElement(var_7_18)

	var_7_0.TournamentRewards = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIStyledText.new()

	var_7_20.id = "BackText"

	var_7_20:setText(Engine.CBBHFCGDIC("PLATFORM/BACK"), 0)
	var_7_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_20:SetWordWrap(false)
	var_7_20:SetAlignment(LUI.Alignment.Center)
	var_7_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 201, _1080p * 494, _1080p * 514)
	var_7_0:addElement(var_7_20)

	var_7_0.BackText = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIStyledText.new()

	var_7_22.id = "SelectText"

	var_7_22:setText(Engine.CBBHFCGDIC("PLATFORM/SELECT"), 0)
	var_7_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_22:SetWordWrap(false)
	var_7_22:SetAlignment(LUI.Alignment.Center)
	var_7_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 2, _1080p * 494, _1080p * 514)
	var_7_0:addElement(var_7_22)

	var_7_0.SelectText = var_7_22

	local var_7_23
	local var_7_24 = LUI.UIText.new()

	var_7_24.id = "YourWallet"

	var_7_24:setText("", 0)
	var_7_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_24:SetAlignment(LUI.Alignment.Center)
	var_7_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 768, _1080p * 1152, _1080p * 957, _1080p * 979)
	var_7_0:addElement(var_7_24)

	var_7_0.YourWallet = var_7_24

	function var_7_0.addButtonHelperFunction(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_7_0:addEventHandler("menu_create", var_7_0.addButtonHelperFunction)

	local var_7_25 = LUI.UIBindButton.new()

	var_7_25.id = "selfBindButton"

	var_7_0:addElement(var_7_25)

	var_7_0.bindButton = var_7_25

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("TournamentSignUp", TournamentSignUp)
LockTable(_M)
