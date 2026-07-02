module(..., package.seeall)

local var_0_0 = {
	Engine.CBBHFCGDIC("TOURNAMENT/CHAMP"),
	Engine.CBBHFCGDIC("TOURNAMENT/RUNNER_UP_LOWER_CASE"),
	Engine.CBBHFCGDIC("TOURNAMENT/SEMI_FINALISTS"),
	Engine.CBBHFCGDIC("TOURNAMENT/QUARTER_FINALISTS")
}
local var_0_1 = 4

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	if Tournament.DFHHDFDDFJ(arg_1_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "TournamentWarningPopup", true, arg_1_1, false)
	end

	local var_1_0 = Lobby.GFFECBCCF()
	local var_1_1 = Lobby.BGIADHIHAG()
	local var_1_2 = var_1_0 and not var_1_1

	arg_1_0.SignUpButton:SetButtonDisabled(var_1_2)

	local var_1_3 = Tournament.BBAFFAGGHC(arg_1_1)

	arg_1_0.SignUpButton:SetButtonDisabled(var_1_3)
	arg_1_0.SignUpButtonHold.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/SIGN_UP_NO_COST"))
	arg_1_0.SignUpButton.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/SIGN_UP_NO_COST"))

	local function var_1_4()
		local var_2_0 = Lobby.GFFECBCCF()
		local var_2_1 = Lobby.BGIADHIHAG()
		local var_2_2 = var_2_0 and not var_2_1

		arg_1_0.SignUpButtonHold:SetButtonDisabled(var_2_2)
		arg_1_0.SignUpButton:SetButtonDisabled(var_2_2)

		if var_2_2 then
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, nil)
		end
	end

	local var_1_5 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_1_6 = DataSources.frontEnd.lobby.memberCount

	arg_1_0:SubscribeToModel(var_1_5:GetModel(arg_1_1), var_1_4)
	arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), var_1_4)

	local function var_1_7()
		local function var_3_0(arg_4_0)
			if arg_4_0 == false then
				return
			end

			if not Tournament.BHAEFIFBBA() then
				LUI.FlowManager.RequestPopupMenu(nil, "dc_qos_failed_warning", false, arg_1_1, false, {})

				return
			end

			if not Tournament.BBAFFAGGHC(arg_1_1) and not arg_1_0.SignUpButton:IsDisabled() and TOURNAMENT.DoEntranceCheck(arg_1_1) then
				Tournament.CFABIDCGC(arg_1_1)
			end
		end

		if Engine.JACCCCEDI() and not TOURNAMENT.IsF2PTournamentAllowed() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_1_1, false, {
				premium = true,
				invalidPlaylists = {},
				leavePartyAction = var_3_0
			})

			return
		elseif not Engine.HBIAGEFCC() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_1_1, false, {
				subscription = true,
				invalidPlaylists = {},
				leavePartyAction = var_3_0
			})

			return
		end

		var_3_0(true)
	end

	if not arg_1_2.inBracket then
		arg_1_0.SignUpButton:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
			local var_5_0 = {}

			var_5_0.warningMessage = "MPUI/TOURNAMENT_BEGIN_POPUP_CONFIRMATION"
			var_5_0.yesAction = var_1_7

			local function var_5_1()
				LUI.FlowManager.RequestPopupMenu(nil, "ModularWarningPopup", true, arg_1_1, false, var_5_0)
			end

			Lobby.TryNavigateToLobby(var_5_1)
		end)
		LUI.AddUIHoldButtonLogic(arg_1_0.SignUpButtonHold, arg_1_1, {
			requireFocus = true,
			duration = 1000,
			buttons = {
				primary = true
			},
			fill = arg_1_0.SignUpButtonHold.GenericProgressBar,
			onFill = var_1_7
		})
	else
		arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/DETAILS")))
		arg_1_0.SignUpButton:SetText(Engine.CBBHFCGDIC("LUA_MENU/CLOSE"))
		arg_1_0.SignUpButtonHold.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CLOSE"))
		arg_1_0.SelectText:SetAlpha(0)
		arg_1_0.BackText:SetAlpha(0)
		arg_1_0.LeavePopupButton:SetAlpha(0)
		arg_1_0.LeavePopupButton:SetHandleMouse(false)
		arg_1_0.SignUpButton:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
			ACTIONS.LeaveMenu(arg_1_0)
		end)
		arg_1_0.SignUpButtonHold:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
			ACTIONS.LeaveMenu(arg_1_0)
		end)
	end

	local function var_1_8()
		if Tournament.BBAFFAGGHC(arg_1_1) then
			LUI.FlowManager.RequestAddMenu(TOURNAMENT.GetMenuName("loading"), false, arg_1_1, true, {}, true)
		end
	end

	local var_1_9 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_1_9.id = "lobbyStatusTimer"

	arg_1_0:addElement(var_1_9)
	arg_1_0:registerEventHandler("update_lobby_status", var_1_8)
	var_1_8()

	local var_1_10 = Tournament.BJDIDJCEAA()
	local var_1_11 = Tournament.EHBJJEAJH()

	arg_1_0.PartySizeCount:setText(Engine.CBBHFCGDIC("TOURNAMENT/MAX_PARTY", var_1_10))
	arg_1_0.TeamCount:setText(Engine.CBBHFCGDIC("TOURNAMENT/TEAM_COUNT", var_1_11, var_1_10))
	arg_1_0.LeavePopupButton:SetHandleMouse(true)
	arg_1_0:addAndCallEventHandler("update_input_type", function(arg_10_0, arg_10_1)
		if LUI.IsLastInputGamepad(arg_10_1.controllerIndex) then
			if not arg_1_2.inBracket then
				arg_10_0.SelectText:SetAlpha(1)
				arg_10_0.BackText:SetAlpha(1)
				arg_10_0.LeavePopupButton:SetAlpha(0)
			end

			arg_10_0.LeavePopupButton:SetFocusable(false)
			arg_10_0.SignUpButton:SetAlpha(0)
			arg_10_0.SignUpButton:SetHandleMouse(false)
			arg_10_0.SignUpButton:SetFocusable(false)
			arg_10_0.SignUpButtonHold:SetAlpha(1)
			arg_10_0.SignUpButtonHold:SetHandleMouse(true)
			arg_10_0.SignUpButtonHold:SetFocusable(true)
			arg_10_0.SignUpButtonHold:processEvent({
				name = "gain_focus"
			})
		else
			if not arg_1_2.inBracket then
				arg_10_0.SelectText:SetAlpha(0)
				arg_10_0.BackText:SetAlpha(0)
				arg_10_0.LeavePopupButton:SetAlpha(1)
			end

			arg_10_0.LeavePopupButton:SetHandleMouse(not arg_1_2.inBracket)
			arg_10_0.LeavePopupButton:SetFocusable(true)
			arg_10_0.SignUpButtonHold:SetAlpha(0)
			arg_10_0.SignUpButtonHold:SetHandleMouse(false)
			arg_10_0.SignUpButtonHold:SetFocusable(false)
			arg_10_0.SignUpButton:SetAlpha(1)
			arg_10_0.SignUpButton:SetHandleMouse(true)
			arg_10_0.SignUpButton:SetFocusable(true)
		end
	end, {
		controllerIndex = arg_1_1
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.Background)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	local var_1_12 = TOURNAMENT.GetAllRewards(arg_1_1)

	for iter_1_0 = 1, var_0_1 do
		local var_1_13 = arg_1_0["Rewards" .. iter_1_0]

		assert(var_1_13)

		local var_1_14 = var_1_12[Mirror(iter_1_0, 1, var_0_1)]

		if var_1_13 and var_1_14 then
			var_1_13:SetupRewards(var_1_14)
			var_1_13.Title:setText(var_0_0[iter_1_0])
		end
	end

	local var_1_15 = TOURNAMENT.GetMapPoolData()
	local var_1_16 = 3
	local var_1_17 = 3
	local var_1_18
	local var_1_19 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		maxVisibleColumns = var_1_16,
		maxVisibleRows = var_1_17,
		controllerIndex = arg_1_1,
		buildChild = function()
			return LUI.UIStyledText.new()
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			local var_12_0 = var_1_15[var_1_16 * arg_12_2 + arg_12_1 + 1]

			if var_12_0 then
				arg_12_0:setText(var_12_0.name)
				arg_12_0:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
				arg_12_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
				arg_12_0:SetWordWrap(false)
				arg_12_0:SetAlignment(LUI.Alignment.Left)
				arg_12_0:SetOptOutRightToLeftAlignmentFlip(true)
				arg_12_0:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 0, _1080p * 0, _1080p * 0, _1080p * 24)
			else
				arg_12_0:SetAlpha(0)
			end
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 24,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_20 = LUI.UIGrid.new(var_1_19)

	var_1_20.id = "Maps"

	var_1_20:setUseStencil(true)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 495, _1080p * 960, _1080p * 673, _1080p * 767)
	arg_1_0:addElement(var_1_20)

	arg_1_0.Maps = var_1_20
end

function TournamentSignUpAlpha(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_13_0.id = "TournamentSignUpAlpha"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:SetRGBFromInt(0, 0)
	var_13_4:SetAlpha(0.8, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "GenericPopupWindow"

	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -362, _1080p * 362)
	var_13_0:addElement(var_13_6)

	var_13_0.GenericPopupWindow = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIText.new()

	var_13_8.id = "Title"

	var_13_8:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_13_8:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/WELCOME")), 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_13_8:SetAlignment(LUI.Alignment.Center)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -716, _1080p * 716, _1080p * -324, _1080p * -264)
	var_13_0:addElement(var_13_8)

	var_13_0.Title = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIImage.new()

	var_13_10.id = "IconGameMode"

	var_13_10:setImage(RegisterMaterial("icon_mp_mode_arena"), 0)
	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -584, _1080p * -484, _1080p * -174, _1080p * -74)
	var_13_0:addElement(var_13_10)

	var_13_0.IconGameMode = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "LeavePopupButton"

	var_13_12.Text:SetLeft(_1080p * 20, 0)
	var_13_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BACK"), 0)
	var_13_12.Text:SetAlignment(LUI.Alignment.Center)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 910, _1080p * 948)
	var_13_0:addElement(var_13_12)

	var_13_0.LeavePopupButton = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "SignUpButtonHold"

	var_13_14.Text:setText(ToUpperCase(""), 0)
	var_13_14.Text:SetAlignment(LUI.Alignment.Center)
	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 832, _1080p * 870)
	var_13_0:addElement(var_13_14)

	var_13_0.SignUpButtonHold = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "SignUpButton"

	var_13_16.Text:SetLeft(_1080p * 20, 0)
	var_13_16.Text:setText(ToUpperCase(""), 0)
	var_13_16.Text:SetAlignment(LUI.Alignment.Center)
	var_13_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 750, _1080p * -750, _1080p * 832, _1080p * 870)
	var_13_0:addElement(var_13_16)

	var_13_0.SignUpButton = var_13_16

	local var_13_17
	local var_13_18 = LUI.UIStyledText.new()

	var_13_18.id = "BackText"

	var_13_18:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_18:SetAlpha(0, 0)
	var_13_18:setText(Engine.CBBHFCGDIC("PLATFORM/BACK"), 0)
	var_13_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_18:SetWordWrap(false)
	var_13_18:SetAlignment(LUI.Alignment.Center)
	var_13_18:SetTintFontIcons(true)
	var_13_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 198, _1080p * 378, _1080p * 400)
	var_13_0:addElement(var_13_18)

	var_13_0.BackText = var_13_18

	local var_13_19
	local var_13_20 = LUI.UIStyledText.new()

	var_13_20.id = "SelectText"

	var_13_20:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_20:SetAlpha(0, 0)
	var_13_20:setText(Engine.CBBHFCGDIC("PLATFORM/SELECT"), 0)
	var_13_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_20:SetWordWrap(false)
	var_13_20:SetAlignment(LUI.Alignment.Center)
	var_13_20:SetTintFontIcons(true)
	var_13_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * -5, _1080p * 378, _1080p * 400)
	var_13_0:addElement(var_13_20)

	var_13_0.SelectText = var_13_20

	local var_13_21
	local var_13_22 = LUI.UIText.new()

	var_13_22.id = "YouPlaced"

	var_13_22:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_13_22:setText(Engine.CBBHFCGDIC("TOURNAMENT/HOW_TO_PLAY"), 0)
	var_13_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_22:SetAlignment(LUI.Alignment.Left)
	var_13_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -465, _1080p * 35, _1080p * 375, _1080p * 403)
	var_13_0:addElement(var_13_22)

	var_13_0.YouPlaced = var_13_22

	local var_13_23
	local var_13_24 = LUI.UIText.new()

	var_13_24.id = "Place"

	var_13_24:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_13_24:setText(Engine.CBBHFCGDIC("TOURNAMENT/HOW_TO_PLAY_DESC"), 0)
	var_13_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_24:SetAlignment(LUI.Alignment.Left)
	var_13_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -465, _1080p * 35, _1080p * 411, _1080p * 431)
	var_13_0:addElement(var_13_24)

	var_13_0.Place = var_13_24

	local var_13_25
	local var_13_26 = LUI.UIImage.new()

	var_13_26.id = "PartySizeIcon"

	var_13_26:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_26:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_13_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -539, _1080p * -491, _1080p * -53, _1080p * -5)
	var_13_0:addElement(var_13_26)

	var_13_0.PartySizeIcon = var_13_26

	local var_13_27
	local var_13_28 = LUI.UIImage.new()

	var_13_28.id = "NumTeamsIconsRight"

	var_13_28:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_13_28:SetScale(-0.2, 0)
	var_13_28:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_13_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -558, _1080p * -510, _1080p * 21, _1080p * 69)
	var_13_0:addElement(var_13_28)

	var_13_0.NumTeamsIconsRight = var_13_28

	local var_13_29
	local var_13_30 = LUI.UIImage.new()

	var_13_30.id = "NumTeamsIconsLeft"

	var_13_30:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_13_30:SetScale(-0.2, 0)
	var_13_30:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_13_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -520, _1080p * -472, _1080p * 21, _1080p * 69)
	var_13_0:addElement(var_13_30)

	var_13_0.NumTeamsIconsLeft = var_13_30

	local var_13_31
	local var_13_32 = LUI.UIImage.new()

	var_13_32.id = "NumTeamsIcons"

	var_13_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_32:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_13_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -539, _1080p * -491, _1080p * 33, _1080p * 81)
	var_13_0:addElement(var_13_32)

	var_13_0.NumTeamsIcons = var_13_32

	local var_13_33
	local var_13_34 = LUI.UIText.new()

	var_13_34.id = "PartySizeHeader"

	var_13_34:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_34:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PARTYSIZE"), 0)
	var_13_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_34:SetWordWrap(false)
	var_13_34:SetAlignment(LUI.Alignment.Left)
	var_13_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -465, _1080p * -323, _1080p * -55, _1080p * -31)
	var_13_0:addElement(var_13_34)

	var_13_0.PartySizeHeader = var_13_34

	local var_13_35
	local var_13_36 = LUI.UIText.new()

	var_13_36.id = "NumTeamsHeader"

	var_13_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_36:setText(Engine.CBBHFCGDIC("TOURNAMENT/NUMBER_OF_TEAMS"), 0)
	var_13_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_36:SetWordWrap(false)
	var_13_36:SetAlignment(LUI.Alignment.Left)
	var_13_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -465, _1080p * -203, _1080p * 21, _1080p * 49)
	var_13_0:addElement(var_13_36)

	var_13_0.NumTeamsHeader = var_13_36

	local var_13_37
	local var_13_38 = LUI.UIText.new()

	var_13_38.id = "TeamCount"

	var_13_38:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_13_38:setText("", 0)
	var_13_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_38:SetWordWrap(false)
	var_13_38:SetAlignment(LUI.Alignment.Left)
	var_13_38:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -465, _1080p * -203, _1080p * 51, _1080p * 75)
	var_13_0:addElement(var_13_38)

	var_13_0.TeamCount = var_13_38

	local var_13_39
	local var_13_40 = LUI.UIText.new()

	var_13_40.id = "PartySizeCount"

	var_13_40:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_13_40:setText("", 0)
	var_13_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_40:SetWordWrap(false)
	var_13_40:SetAlignment(LUI.Alignment.Left)
	var_13_40:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_40:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -465, _1080p * -175, _1080p * -29, _1080p * -5)
	var_13_0:addElement(var_13_40)

	var_13_0.PartySizeCount = var_13_40

	local var_13_41
	local var_13_42 = MenuBuilder.BuildRegisteredType("TournamentRewardPreview", {
		controllerIndex = var_13_1
	})

	var_13_42.id = "Rewards1"

	var_13_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1110, _1080p * 1290, _1080p * 439, _1080p * 549)
	var_13_0:addElement(var_13_42)

	var_13_0.Rewards1 = var_13_42

	local var_13_43
	local var_13_44 = MenuBuilder.BuildRegisteredType("TournamentRewardPreview", {
		controllerIndex = var_13_1
	})

	var_13_44.id = "Rewards2"

	var_13_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1378, _1080p * 1558, _1080p * 437, _1080p * 547)
	var_13_0:addElement(var_13_44)

	var_13_0.Rewards2 = var_13_44

	local var_13_45
	local var_13_46 = MenuBuilder.BuildRegisteredType("TournamentRewardPreview", {
		controllerIndex = var_13_1
	})

	var_13_46.id = "Rewards3"

	var_13_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1110, _1080p * 1290, _1080p * 633, _1080p * 743)
	var_13_0:addElement(var_13_46)

	var_13_0.Rewards3 = var_13_46

	local var_13_47
	local var_13_48 = MenuBuilder.BuildRegisteredType("TournamentRewardPreview", {
		controllerIndex = var_13_1
	})

	var_13_48.id = "Rewards4"

	var_13_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1378, _1080p * 1558, _1080p * 635, _1080p * 743)
	var_13_0:addElement(var_13_48)

	var_13_0.Rewards4 = var_13_48

	local var_13_49
	local var_13_50 = LUI.UIText.new()

	var_13_50.id = "RewardsLabel"

	var_13_50:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_13_50:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_PLURAL"), 0)
	var_13_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_50:SetAlignment(LUI.Alignment.Left)
	var_13_50:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_50:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 150, _1080p * 598, _1080p * 375, _1080p * 411)
	var_13_0:addElement(var_13_50)

	var_13_0.RewardsLabel = var_13_50

	local var_13_51
	local var_13_52 = LUI.UIText.new()

	var_13_52.id = "MapsLabel"

	var_13_52:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_52:setText(Engine.CBBHFCGDIC("MENU/MAPS"), 0)
	var_13_52:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_52:SetWordWrap(false)
	var_13_52:SetAlignment(LUI.Alignment.Left)
	var_13_52:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_52:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -465, _1080p * -203, _1080p * 101, _1080p * 125)
	var_13_0:addElement(var_13_52)

	var_13_0.MapsLabel = var_13_52

	local function var_13_53()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_53

	local var_13_54
	local var_13_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 411
		}
	}

	var_13_22:RegisterAnimationSequence("AR", var_13_55)

	local var_13_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_13_24:RegisterAnimationSequence("AR", var_13_56)

	local var_13_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_13_26:RegisterAnimationSequence("AR", var_13_57)

	local var_13_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_13_28:RegisterAnimationSequence("AR", var_13_58)

	local var_13_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_13_30:RegisterAnimationSequence("AR", var_13_59)

	local var_13_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 99
		}
	}

	var_13_32:RegisterAnimationSequence("AR", var_13_60)

	local var_13_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -13
		}
	}

	var_13_34:RegisterAnimationSequence("AR", var_13_61)

	local var_13_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 67
		}
	}

	var_13_36:RegisterAnimationSequence("AR", var_13_62)

	local var_13_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		}
	}

	var_13_38:RegisterAnimationSequence("AR", var_13_63)

	local var_13_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_13_40:RegisterAnimationSequence("AR", var_13_64)

	local var_13_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 411
		}
	}

	var_13_50:RegisterAnimationSequence("AR", var_13_65)

	local var_13_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		}
	}

	var_13_52:RegisterAnimationSequence("AR", var_13_66)

	local function var_13_67()
		var_13_22:AnimateSequence("AR")
		var_13_24:AnimateSequence("AR")
		var_13_26:AnimateSequence("AR")
		var_13_28:AnimateSequence("AR")
		var_13_30:AnimateSequence("AR")
		var_13_32:AnimateSequence("AR")
		var_13_34:AnimateSequence("AR")
		var_13_36:AnimateSequence("AR")
		var_13_38:AnimateSequence("AR")
		var_13_40:AnimateSequence("AR")
		var_13_50:AnimateSequence("AR")
		var_13_52:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_67

	var_13_12:addEventHandler("button_action", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)

	function var_13_0.addButtonHelperFunction(arg_17_0, arg_17_1)
		arg_17_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_13_0:addEventHandler("menu_create", var_13_0.addButtonHelperFunction)

	local var_13_68 = LUI.UIBindButton.new()

	var_13_68.id = "selfBindButton"

	var_13_0:addElement(var_13_68)

	var_13_0.bindButton = var_13_68

	var_13_0.bindButton:addEventHandler("button_secondary", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)
	var_0_2(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("TournamentSignUpAlpha", TournamentSignUpAlpha)
LockTable(_M)
