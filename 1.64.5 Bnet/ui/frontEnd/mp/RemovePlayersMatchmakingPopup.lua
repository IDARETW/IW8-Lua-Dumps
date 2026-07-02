module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0
	local var_1_1 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 6,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = arg_1_1,
		buildChild = function()
			local var_2_0 = LUI.UIStyledText.new()

			var_2_0:setText("", 0)
			var_2_0:SetRGBFromTable(SWATCHES.genericMenu.failed, 0)
			var_2_0:SetFont(FONTS.GetFont(FONTS.MainBold.File))
			var_2_0:SetWordWrap(false)
			var_2_0:SetAlignment(LUI.Alignment.Left)
			var_2_0:SetOptOutRightToLeftAlignmentFlip(true)
			var_2_0:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
			var_2_0:SetStartupDelay(1000)
			var_2_0:SetLineHoldTime(400)
			var_2_0:SetAnimMoveTime(150)
			var_2_0:SetAnimMoveSpeed(50)
			var_2_0:SetEndDelay(1000)
			var_2_0:SetCrossfadeTime(400)
			var_2_0:SetFadeInTime(300)
			var_2_0:SetFadeOutTime(300)
			var_2_0:SetMaxVisibleLines(1)
			var_2_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 569, _1080p * 593)

			return var_2_0
		end,
		refreshChild = function(arg_3_0, arg_3_1, arg_3_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 25,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_2 = LUI.UIGrid.new(var_1_1)

	var_1_2.id = "InvalidGamemodes"

	var_1_2:setUseStencil(true)
	var_1_2:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 150, _1080p * 34, _1080p * 240)
	arg_1_0:addElement(var_1_2)

	arg_1_0.InvalidGamemodes = var_1_2
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2.invalidPlaylists)
	assert(arg_4_0.MenuTitle)
	arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS"))

	local var_4_0 = -1
	local var_4_1

	arg_4_0.invalidPlaylistNames = {}

	local var_4_2 = arg_4_2.invalidPlaylists

	for iter_4_0 = 1, #var_4_2 do
		local var_4_3 = var_4_2[iter_4_0]
		local var_4_4 = var_4_3.maxPartySize:GetValue(arg_4_1)
		local var_4_5 = var_4_3.name:GetValue(arg_4_1)

		table.insert(arg_4_0.invalidPlaylistNames, var_4_5)

		if var_4_0 < 0 or var_4_4 < var_4_0 then
			var_4_0 = var_4_4
			var_4_1 = var_4_5
		end
	end

	if arg_4_2.playlistName then
		var_4_1 = arg_4_2.playlistName
	end

	if arg_4_2.minMaxPlayersAllowed then
		var_4_0 = arg_4_2.minMaxPlayersAllowed
	end

	if #arg_4_0.invalidPlaylistNames > 0 and not arg_4_2.premium and not arg_4_2.subscription then
		var_0_0(arg_4_0, arg_4_1)
		arg_4_0.InvalidGamemodes:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
			local var_5_0 = arg_5_2 + arg_5_1 * arg_4_0.InvalidGamemodes:GetNumRows()
			local var_5_1 = arg_4_0.invalidPlaylistNames[var_5_0 + 1]

			arg_5_0:setText(var_5_1)
		end)
		arg_4_0.InvalidGamemodes:SetNumChildren(#arg_4_0.invalidPlaylistNames)
	end

	local var_4_6 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count"):GetValue(arg_4_1)

	if arg_4_2.premium then
		arg_4_0.Message:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_NON_PREMIUM_PLAYER"))
		arg_4_0.LeavePartyButton.Text:setText(Engine.CBBHFCGDIC("MPUI/LEAVE_PARTY_AND_PLAY_PROMOTED"))
	elseif arg_4_2.subscription then
		arg_4_0.Message:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_NON_SUBSCRIPTION_PLAYERS"))
		arg_4_0.LeavePartyButton.Text:setText(Engine.CBBHFCGDIC("MPUI/LEAVE_PARTY_AND_PLAY_PROMOTED"))
	elseif arg_4_2.filtered and not arg_4_2.promoted then
		arg_4_0.Message:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS_FILTERED_DESC", var_4_6 - var_4_0))
		arg_4_0.LeavePartyButton.Text:setText(Engine.CBBHFCGDIC("MPUI/LEAVE_PARTY_AND_PLAY"))
	elseif arg_4_2.promoted then
		arg_4_0.Message:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS_PROMOTED_DESC", var_4_6 - var_4_0))
		arg_4_0.LeavePartyButton.Text:setText(Engine.CBBHFCGDIC("MPUI/LEAVE_PARTY_AND_PLAY_PROMOTED"))
	else
		arg_4_0.Message:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS_DESC", var_4_6 - var_4_0, Engine.JCBDICCAH(var_4_1)))

		if arg_4_2.hideLeaveParty then
			ACTIONS.AnimateSequence(arg_4_0, "HideLeaveParty")
			arg_4_0.LeavePartyButton:closeTree()

			arg_4_0.LeavePartyButton = nil
		else
			arg_4_0.LeavePartyButton.Text:setText(Engine.CBBHFCGDIC("MPUI/LEAVE_PARTY_AND_PLAY_GAMEMODE", Engine.JCBDICCAH(var_4_1)))
		end
	end

	arg_4_0.CancelButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		ACTIONS.LeaveMenu(arg_4_0)
	end)

	if arg_4_2.premium or arg_4_2.subscription then
		arg_4_0.RemovePlayersButton:closeTree()

		arg_4_0.RemovePlayersButton = nil
	else
		arg_4_0.RemovePlayersButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			local var_7_0 = MenuBuilder.BuildRegisteredType("SocialPartyKickPlayers", arg_4_2)

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", false, arg_4_1, true, {
				widget = var_7_0
			})
		end)
	end

	if arg_4_2.leavePartyAction and arg_4_0.LeavePartyButton then
		arg_4_0.LeavePartyButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			local var_8_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_8_1.controller, true)

			ACTIONS.LeaveMenu(arg_4_0)
			arg_4_2.leavePartyAction(var_8_0 >= 0)
		end)
	elseif arg_4_0.LeavePartyButton then
		arg_4_0.LeavePartyButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			local var_9_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_9_1.controller, true)

			if var_9_0 < 0 then
				return
			end

			local function var_9_1()
				if #var_4_2 >= 1 then
					if arg_4_2.filtered then
						local var_10_0 = var_4_2[#var_4_2].categoryIndex:GetValue(var_9_0)

						if Playlist.CDBBECIGIG(var_10_0, PlaylistUtils.USE_FILTERED_PLAYLIST_ID) then
							if CONDITIONS.IsBRGameType(arg_4_0) then
								LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, var_9_0, false, {
									openFromPlaylist = true
								})
							else
								LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, var_9_0, false, {
									openFromPlaylist = true
								})
							end
						end
					else
						local var_10_1 = var_4_2[#var_4_2]
						local var_10_2 = var_10_1.playlistIndex:GetValue(var_9_0)
						local var_10_3 = var_10_1.categoryIndex:GetValue(var_9_0)

						if Playlist.CDBBECIGIG(var_10_3, var_10_2) then
							if CONDITIONS.IsBRGameType(arg_4_0) then
								LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, var_9_0, false, {
									openFromPlaylist = true
								})
							else
								LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, var_9_0, false, {
									openFromPlaylist = true
								})
							end
						end
					end
				end
			end

			Lobby.TryNavigateToLobby(var_9_1)
		end)
	end
end

function RemovePlayersMatchmakingPopup(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "RemovePlayersMatchmakingPopup"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "GenericPopupFrame"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.GenericPopupFrame = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Image"

	var_11_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_11_6:SetAlpha(0.6, 0)
	var_11_6:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 79, _1080p * 843, _1080p * -218, _1080p * 218)
	var_11_0:addElement(var_11_6)

	var_11_0.Image = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIText.new()

	var_11_8.id = "Message"

	var_11_8:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_8:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS_DESC"), 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_8:SetAlignment(LUI.Alignment.Left)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -25, _1080p * -109, _1080p * -81)
	var_11_0:addElement(var_11_8)

	var_11_0.Message = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "MenuTitle"

	var_11_10.MenuTitle:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS"), 0)
	var_11_10.Line:SetLeft(_1080p * -150, 0)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -705, _1080p * 21, _1080p * -256, _1080p * -151)
	var_11_0:addElement(var_11_10)

	var_11_0.MenuTitle = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "RemovePlayersButton"

	var_11_12.Text:SetLeft(_1080p * 20, 0)
	var_11_12.Text:setText(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS"), 0)
	var_11_12.Text:SetAlignment(LUI.Alignment.Left)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -200, _1080p * 29, _1080p * 65)
	var_11_0:addElement(var_11_12)

	var_11_0.RemovePlayersButton = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "LeavePartyButton"

	var_11_14.Text:SetLeft(_1080p * 20, 0)
	var_11_14.Text:setText(Engine.CBBHFCGDIC("MPUI/LEAVE_PARTY_AND_PLAY"), 0)
	var_11_14.Text:SetAlignment(LUI.Alignment.Left)
	var_11_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -200, _1080p * 75, _1080p * 111)
	var_11_0:addElement(var_11_14)

	var_11_0.LeavePartyButton = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "CancelButton"

	var_11_16.Text:SetLeft(_1080p * 20, 0)
	var_11_16.Text:setText(Engine.CBBHFCGDIC("MPUI/CANCEL"), 0)
	var_11_16.Text:SetAlignment(LUI.Alignment.Left)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -200, _1080p * 121, _1080p * 157)
	var_11_0:addElement(var_11_16)

	var_11_0.CancelButton = var_11_16

	local function var_11_17()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_17

	local var_11_18
	local var_11_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("HideLeaveParty", var_11_19)

	local var_11_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		}
	}

	var_11_16:RegisterAnimationSequence("HideLeaveParty", var_11_20)

	local function var_11_21()
		var_11_14:AnimateSequence("HideLeaveParty")
		var_11_16:AnimateSequence("HideLeaveParty")
	end

	var_11_0._sequences.HideLeaveParty = var_11_21

	var_11_4:addEventHandler("menu_create", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		ACTIONS.ScaleFullscreen(var_11_0)
	end)
	var_0_1(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("RemovePlayersMatchmakingPopup", RemovePlayersMatchmakingPopup)
LockTable(_M)
