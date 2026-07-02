module(..., package.seeall)

function ConfirmJoinBlockedUser(arg_1_0, arg_1_1)
	assert(arg_1_1.controllerIndex)
	assert(arg_1_1.xuid)

	local var_1_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/JOIN_ON_BLOCKED_USER_CONFIRM"),
		yesAction = function(arg_2_0, arg_2_1)
			local function var_2_0()
				Friends.JoinRecentPlayer(arg_1_1.controllerIndex, arg_1_1.xuid)

				local var_3_0, var_3_1 = Engine.CBBGBGBFJF(arg_2_1)

				if not var_3_0 and var_3_1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
					Engine.DBHBIHJDEC(arg_2_1)
				end
			end

			FRIENDS.TryJoinUserParty(var_2_0)
		end,
		noAction = function()
			return
		end
	}
	local var_1_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_1_0)

	var_1_1.id = "ConfirmJoinBlockedUser"

	return var_1_1
end

MenuBuilder.registerType("ConfirmJoinBlockedUser", ConfirmJoinBlockedUser)

local function var_0_0(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = FRIENDS.TabIDs.ONLINE_FRIENDS

	if arg_5_0 then
		local var_5_1 = arg_5_0.Tabs:GetCurrentTabIndex()

		var_5_0 = arg_5_0.tabNamesAndIDs[var_5_1 + 1].id
	end

	if var_5_0 == FRIENDS.TabIDs.ONLINE_FRIENDS or var_5_0 == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
		if arg_5_1._expanderID == FRIENDS.ExpanderIDs.FAVORITE then
			var_5_0 = FRIENDS.TabIDs.FAVORITE_FRIENDS
		elseif arg_5_1._expanderID == FRIENDS.ExpanderIDs.ACTIVISION then
			var_5_0 = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
		elseif arg_5_1._expanderID == FRIENDS.ExpanderIDs.CLAN then
			-- block empty
		end
	end

	return var_5_0, arg_5_1._playerData.xuid, arg_5_1._playerData.platformId
end

local function var_0_1(arg_6_0)
	return function()
		local var_7_0 = arg_6_0:GetCurrentMenu()
		local var_7_1, var_7_2, var_7_3 = var_0_0(var_7_0, arg_6_0, arg_6_0._controllerIndex)

		if not Friends.CCBABDAGGJ(arg_6_0._controllerIndex, var_7_2, var_7_3, var_7_1).isValidEntry then
			return nil
		end

		return {
			isContextualMenu = true,
			xuid = var_7_2,
			platformId = var_7_3,
			selectedTab = var_7_1,
			controllerIndex = arg_6_0._controllerIndex,
			presencePlatform = arg_6_0._playerData.presencePlatform,
			gamertag = arg_6_0._playerData.fullName,
			crossplayGamertag = arg_6_0._playerData.crossplayGamertag,
			showBattlenetData = Engine.DBFCJBDJEC() or nil,
			getButtonsCallback = function(arg_8_0)
				return (FRIENDS.GetFriendActions(arg_8_0))
			end
		}
	end
end

local function var_0_2(arg_9_0)
	if not arg_9_0._contextualMenuIsAdded then
		local var_9_0 = arg_9_0:GetCurrentMenu()

		if var_9_0 and var_9_0.usesPlayerGrid then
			FRIENDS.SetupPlayerContextualMenuOptions(arg_9_0, arg_9_0._controllerIndex, var_0_1(arg_9_0))

			arg_9_0._contextualMenuIsAdded = true
		end
	end
end

local function var_0_3(arg_10_0, arg_10_1)
	local var_10_0 = FRIENDS.BnetStatusToColorMap[arg_10_1]

	assert(var_10_0)

	local var_10_1 = FRIENDS.BnetStatusToIconNameMap[arg_10_1]

	assert(var_10_1)
	arg_10_0.PlayerStatus:SetRGBFromTable(var_10_0)
	arg_10_0.PlayerStatus:setImage(RegisterMaterial(var_10_1))
end

local function var_0_4(arg_11_0)
	local var_11_0 = arg_11_0:GetCurrentMenu()
	local var_11_1 = var_11_0 and var_11_0.widget

	if (Engine.HDGDBCJFG() or Engine.EAABDHIDFJ()) and var_11_1 then
		local var_11_2 = Engine.FHHBECDJA() and arg_11_0._playerData.presencePlatform == arg_11_0._currentPlatform
		local var_11_3 = (Engine.EAABDHIDFJ() or Engine.FJCIBEDII()) and Friends.DJGEFEAJCI(PresencePlatformToClientPlatform[arg_11_0._playerData.presencePlatform], PresencePlatformToClientPlatform[arg_11_0._currentPlatform])

		if var_11_2 or var_11_3 then
			var_11_1:AddButtonHelperText({
				side = "left",
				priority = 2,
				gamepad_only = true,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
			})
		else
			var_11_1:RemoveButtonHelperText("button_alt2", "left")
		end
	end
end

local function var_0_5(arg_12_0)
	if arg_12_0._playerData then
		if arg_12_0.UpdatePlayerDetailsContent then
			arg_12_0:UpdatePlayerDetailsContent(arg_12_0._playerData, arg_12_0._expanderID)
		end

		if arg_12_0.UpdatePlayerDetailsAlpha then
			arg_12_0:UpdatePlayerDetailsAlpha(true)
		end

		if arg_12_0._showPlatform then
			arg_12_0.PlatformPresence:SetAlpha(1, 150)
		else
			arg_12_0.PlatformPresence:SetAlpha(0)
		end

		var_0_4(arg_12_0)

		arg_12_0._updatedForFocus = true
	end
end

local function var_0_6(arg_13_0, arg_13_1)
	if not arg_13_1 and not Engine.BHICADFIHA() then
		return
	end

	local var_13_0 = arg_13_0.Presence:getText()
	local var_13_1 = var_13_0
	local var_13_2 = CONDITIONS.IsBattleNet() and arg_13_0._expanderID == FRIENDS.ExpanderIDs.FIRST_PARTY
	local var_13_3 = Social.ECDAFHBHGC(arg_13_0._controllerIndex, arg_13_1.xuid, var_13_2)

	if var_13_2 and arg_13_1.xuid == "0" then
		var_13_3 = Social.BCACHCIEIA(arg_13_1.platformId)
	end

	arg_13_0:SetOnlineStatusColorMarker(var_13_3)

	if arg_13_1.presence ~= nil and arg_13_1.presence ~= "" and var_13_3 ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
		var_13_1 = arg_13_1.presence
	else
		var_13_1 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")
	end

	if arg_13_1.lastMetInfo ~= nil then
		arg_13_0.LastMetInfo:setText(arg_13_1.lastMetInfo)
	end

	local var_13_4 = arg_13_1.fullName

	if var_13_4 ~= nil then
		if var_13_2 then
			local var_13_5 = Social.CFEIHAADEI(arg_13_1.platformId)
			local var_13_6 = Engine.BECCFCBIAA("displayRealID")

			if var_13_5 and var_13_6 == 1 then
				local var_13_7 = var_13_5.fullName

				if var_13_7 ~= nil and #var_13_7 > 0 then
					var_13_4 = var_13_4 .. " (" .. var_13_7 .. ")"
				end
			end
		end

		arg_13_0.FullName:setText(var_13_4)
	end

	if arg_13_0.CrossplayName ~= nil then
		if arg_13_1.crossplayGamertag ~= nil and arg_13_1.crossplayGamertag ~= "" then
			arg_13_0.CrossplayName:setText(arg_13_1.crossplayGamertag)
			ACTIONS.AnimateSequence(arg_13_0, "ShowCrossplayName")
		else
			arg_13_0.CrossplayName:setText("")
		end
	end

	if arg_13_1.joinable ~= nil then
		arg_13_0.Joinability:setText(arg_13_1.joinable and Engine.CBBHFCGDIC("MENU/JOINABLE") or Engine.CBBHFCGDIC("MENU/NOT_JOINABLE"))
	end

	if arg_13_1.presencePlatform ~= nil then
		arg_13_0.PlatformPresence:SetPlatformPresence(arg_13_1.presencePlatform)

		local var_13_8 = 0

		arg_13_0._showPlatform = arg_13_0.PlatformPresence:WillShowIcon(arg_13_1.presencePlatform)

		if arg_13_0._showPlatform then
			local var_13_9 = 7 * _1080p

			var_13_8 = arg_13_0.PlatformPresence:GetCurrentAnchorsAndPositions().right + var_13_9
		else
			var_13_8 = arg_13_0.PlatformPresence:GetCurrentAnchorsAndPositions().left
		end

		arg_13_0.LastMetInfo:SetLeft(var_13_8)

		if arg_13_0.CrossplayName then
			arg_13_0.CrossplayName:SetLeft(var_13_8)
		end
	end

	if arg_13_1.emblemIndex then
		ACTIONS.AnimateSequence(arg_13_0, "ShowEmblem")

		local var_13_10 = EmblemEditorUtils.GetEmblemImageFromID(arg_13_1.emblemIndex)

		arg_13_0.Emblem:setImage(RegisterMaterial(var_13_10))
	end

	if var_13_2 then
		arg_13_0.BnetGameIcon:SetAlpha(0)

		local var_13_11 = Social.CFEIHAADEI(arg_13_1.platformId)

		if var_13_11 and var_13_3 ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
			var_13_1 = var_13_11.clientRichPresence

			local var_13_12 = FRIENDS.BattleNetGameInfo[var_13_11.clientProgramID]

			if var_13_12 then
				arg_13_0.BnetGameIcon:setImage(RegisterMaterial(var_13_12.icon))
				arg_13_0.BnetGameIcon:SetAlpha(1)
			end
		end
	end

	arg_13_0._playerData = arg_13_1

	var_0_2(arg_13_0)

	if arg_13_0:isInFocus() and arg_13_0.UpdatePlayerDetailsContent then
		if not arg_13_0._updatedForFocus then
			var_0_5(arg_13_0)
		else
			arg_13_0:UpdatePlayerDetailsContent(arg_13_0._playerData, arg_13_0._expanderID)
		end
	end

	if var_13_1 ~= var_13_0 then
		arg_13_0.Presence:setText(var_13_1)
	end
end

local function var_0_7(arg_14_0, arg_14_1)
	assert(arg_14_0.Presence)
	assert(arg_14_0.LastMetInfo)
	assert(arg_14_0.FullName)

	arg_14_0.SetupPlayerData = var_0_6
	arg_14_0.SetOnlineStatusColorMarker = var_0_3
	arg_14_0._controllerIndex = arg_14_1
	arg_14_0._showPlatform = false

	if CONDITIONS.IsBattleNet() then
		ACTIONS.AnimateSequence(arg_14_0, "PC")
	end

	arg_14_0._currentPlatform = Engine.CBBFHGEDGJ()

	if not arg_14_0.bindButton then
		local var_14_0 = LUI.UIBindButton.new()

		var_14_0.id = "bindButton"

		arg_14_0:addElement(var_14_0)

		arg_14_0.bindButton = var_14_0
	end

	arg_14_0.bindButton:addEventHandler("button_alt2", function(arg_15_0, arg_15_1)
		local var_15_0 = arg_14_0:GetCurrentMenu().widget

		if var_15_0 then
			local var_15_1 = LUI.FlowManager.IsMenuOnTop("ManagePartyPopup") and var_15_0.activeTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS
			local var_15_2 = LUI.FlowManager.IsMenuOnTop("ManageFriendsPopup") and var_15_0.activeTabID == FRIENDS.ManageFriendsTabIDs.ADD_FRIENDS
			local var_15_3 = LUI.FlowManager.IsMenuOnTop("RegimentsManagementPopup") and var_15_0.activeTabID == FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS

			if (var_15_1 or var_15_2 or var_15_3) and var_15_0.activeTabWidget and arg_15_0:getParent():isInFocus() then
				local var_15_4 = arg_14_0._playerData.presencePlatform == arg_14_0._currentPlatform

				if var_15_1 or var_15_3 then
					if arg_14_0._expanderID == FRIENDS.ExpanderIDs.FAVORITE then
						-- block empty
					elseif arg_14_0._expanderID == FRIENDS.ExpanderIDs.ACTIVISION then
						if Engine.HDGDBCJFG() and var_15_4 and Friends.CCBABDAGGJ(arg_14_1, arg_14_0._playerData.xuid, arg_14_0._playerData.platformId, FRIENDS.TabIDs.CROSSPLAY_FRIENDS).isValidEntry and Friends.GGDCJJGBI(arg_14_1) and not Social.BFEBABDDDE(arg_14_1, arg_14_0._playerData.xuid, "PlatformIdForViewProfile") then
							local var_15_5 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

							LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_14_1, false, {
								message = var_15_5
							})
						end
					elseif arg_14_0._expanderID == FRIENDS.ExpanderIDs.FIRST_PARTY and (Engine.HDGDBCJFG() or Engine.BEFACAIFDD()) and Friends.CCBABDAGGJ(arg_14_1, arg_14_0._playerData.xuid, arg_14_0._playerData.platformId, FRIENDS.TabIDs.ONLINE_FRIENDS).isValidEntry and Friends.GGDCJJGBI(arg_14_1) then
						Friends.CFBFGBECEB(arg_14_1, arg_14_0._playerData.platformId)
					end

					return true
				elseif var_15_2 then
					if (Engine.HDGDBCJFG() or Engine.BEFACAIFDD()) and Friends.CCBABDAGGJ(arg_14_1, arg_14_0._playerData.xuid, arg_14_0._playerData.platformId, FRIENDS.TabIDs.RECENT_PLAYERS).isValidEntry and var_15_4 then
						local var_15_6 = Friends.CAIJHBHGGC(arg_14_0._playerData.xuid)

						Friends.CCDGAGCFGE(arg_14_1, var_15_6)
					end

					return true
				end
			end
		end
	end)
	arg_14_0:addEventHandler("button_action", function(arg_16_0, arg_16_1)
		if not arg_16_0._playerData then
			return
		end

		local var_16_0 = arg_16_0:GetCurrentMenu()

		if LUI.FlowManager.IsMenuOnTop("ManagePartyPopup") then
			local var_16_1 = LUI.FlowManager.GetVisibleMenu().widget

			if var_16_1 and var_16_1.activeTabWidget and var_16_1.activeTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
				local var_16_2, var_16_3, var_16_4 = var_0_0(var_16_1, arg_16_0, arg_16_0._controllerIndex)
				local var_16_5 = Friends.CAIJHBHGGC(arg_16_0._playerData.xuid)
				local var_16_6 = Invitation.DCDABCADAF(arg_16_0._controllerIndex, var_16_5, var_16_4, var_16_2)

				if var_16_6 and not var_16_6.disabled then
					Invitation.DIDIHAJHGA(arg_14_1, var_16_5, var_16_4)
				end
			end
		elseif LUI.FlowManager.IsMenuOnTop("RegimentsManagementPopup") then
			local var_16_7 = LUI.FlowManager.GetVisibleMenu().widget

			if var_16_7 and var_16_7.activeTabWidget and var_16_7.activeTabID == FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS then
				Clans.DIEAGEDBCC(arg_14_1, var_16_7._clanID, arg_16_0._playerData.xuid)

				local var_16_8 = {
					icon = "hud_info_alert",
					displayTime = 3000,
					description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_SENT")
				}

				arg_16_0:dispatchEventToRoot({
					name = "send_toast_notification",
					immediate = true,
					options = var_16_8
				})
			end
		elseif var_16_0.usesPlayerGrid then
			local var_16_9, var_16_10, var_16_11 = var_0_0(var_16_0, arg_16_0, arg_14_1)

			if not Friends.CCBABDAGGJ(arg_14_1, var_16_10, var_16_11, var_16_9).isValidEntry then
				return
			end

			local var_16_12 = {
				isRegiments = false,
				xuid = var_16_10,
				platformId = var_16_11,
				selectedTab = var_16_9,
				controllerIndex = arg_14_1,
				presencePlatform = arg_16_0._playerData.presencePlatform,
				gamertag = arg_16_0._playerData.fullName,
				expanderID = arg_16_0._expanderID
			}
			local var_16_13 = MenuBuilder.BuildRegisteredType("SocialPlayerPopup", var_16_12)

			var_16_13:SetupPlayerData(arg_16_0._playerData)

			local var_16_14 = FRIENDS.GetFriendActions(var_16_12)

			FRIENDS.AddFriendActions(var_16_12, var_16_14, var_16_13.PlayerActions)
			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_14_1, false, {
				widget = var_16_13
			})
		end
	end)
	arg_14_0:addEventHandler("lose_focus", function()
		if arg_14_0.UpdatePlayerDetailsAlpha then
			arg_14_0:UpdatePlayerDetailsAlpha(false)
		end

		if arg_14_0._showPlatform then
			arg_14_0.PlatformPresence:SetAlpha(0.75, 150)
		else
			arg_14_0.PlatformPresence:SetAlpha(0)
		end

		local var_17_0 = arg_14_0:GetCurrentMenu().widget

		if Engine.HDGDBCJFG() and var_17_0 then
			var_17_0:RemoveButtonHelperText("button_alt2", "left")
		end
	end)
	arg_14_0:addEventHandler("gain_focus", function()
		arg_14_0._updatedForFocus = false

		var_0_5(arg_14_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_14_0, "AR")

		if CONDITIONS.IsBattleNet() then
			arg_14_0.PlayerStatus:SetAlpha(1)
		else
			arg_14_0.PlayerStatus:SetAlpha(0)
		end
	end
end

function SocialPlayer(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIButton.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 510 * _1080p, 0, 100 * _1080p)

	var_19_0.id = "SocialPlayer"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "Background"

	var_19_4.TextGlow:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_19_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_19_0:addElement(var_19_4)

	var_19_0.Background = var_19_4

	local var_19_5
	local var_19_6 = LUI.UIImage.new()

	var_19_6.id = "Emblem"

	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 89, _1080p * 10, _1080p * 90)
	var_19_0:addElement(var_19_6)

	var_19_0.Emblem = var_19_6

	local var_19_7
	local var_19_8 = LUI.UIStyledText.new()

	var_19_8.id = "Presence"

	var_19_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_19_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_8:SetWordWrap(false)
	var_19_8:SetAlignment(LUI.Alignment.Left)
	var_19_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_8:SetStartupDelay(1000)
	var_19_8:SetLineHoldTime(400)
	var_19_8:SetAnimMoveTime(1000)
	var_19_8:SetAnimMoveSpeed(50)
	var_19_8:SetEndDelay(1000)
	var_19_8:SetCrossfadeTime(400)
	var_19_8:SetFadeInTime(300)
	var_19_8:SetFadeOutTime(300)
	var_19_8:SetMaxVisibleLines(1)
	var_19_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 94, _1080p * -87, _1080p * -63, _1080p * -45)

	local function var_19_9()
		local var_20_0 = var_19_0:GetDataSource().presence:GetValue(var_19_1)

		if var_20_0 ~= nil then
			var_19_8:setText(var_20_0, 0)
		end
	end

	var_19_8:SubscribeToModelThroughElement(var_19_0, "presence", var_19_9)
	var_19_0:addElement(var_19_8)

	var_19_0.Presence = var_19_8

	local var_19_10
	local var_19_11 = LUI.UIStyledText.new()

	var_19_11.id = "LastMetInfo"

	var_19_11:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_19_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_11:SetWordWrap(false)
	var_19_11:SetAlignment(LUI.Alignment.Left)
	var_19_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_11:SetUseEllipses(ELLIPSES.enabled_default)
	var_19_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 356, _1080p * 71, _1080p * 89)

	local function var_19_12()
		local var_21_0 = var_19_0:GetDataSource().lastMetInfo:GetValue(var_19_1)

		if var_21_0 ~= nil then
			var_19_11:setText(var_21_0, 0)
		end
	end

	var_19_11:SubscribeToModelThroughElement(var_19_0, "lastMetInfo", var_19_12)
	var_19_0:addElement(var_19_11)

	var_19_0.LastMetInfo = var_19_11

	local var_19_13

	if not Engine.HDGDBCJFG() then
		var_19_13 = LUI.UIStyledText.new()
		var_19_13.id = "CrossplayName"

		var_19_13:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
		var_19_13:SetAlpha(0, 0)
		var_19_13:setText("CrossplayName", 0)
		var_19_13:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		var_19_13:SetWordWrap(false)
		var_19_13:SetAlignment(LUI.Alignment.Left)
		var_19_13:SetOptOutRightToLeftAlignmentFlip(true)
		var_19_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_19_13:SetUseEllipses(ELLIPSES.enabled_default)
		var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 356, _1080p * 71, _1080p * 87)
		var_19_0:addElement(var_19_13)

		var_19_0.CrossplayName = var_19_13
	end

	local var_19_14
	local var_19_15 = LUI.UIStyledText.new()

	var_19_15.id = "FullName"

	var_19_15:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_19_15:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_19_15:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_19_15:SetWordWrap(false)
	var_19_15:SetAlignment(LUI.Alignment.Left)
	var_19_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_15:SetUseEllipses(ELLIPSES.enabled_default)
	var_19_15:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 94, _1080p * -8, _1080p * 7, _1080p * 29)
	var_19_0:addElement(var_19_15)

	var_19_0.FullName = var_19_15

	local var_19_16
	local var_19_17 = LUI.UIStyledText.new()

	var_19_17.id = "Joinability"

	var_19_17:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_19_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_17:SetWordWrap(false)
	var_19_17:SetAlignment(LUI.Alignment.Right)
	var_19_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_17:SetUseEllipses(ELLIPSES.enabled_default)
	var_19_17:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 340, _1080p * -13, _1080p * -29, _1080p * -11)

	local function var_19_18()
		local var_22_0 = var_19_0:GetDataSource().joinable:GetValue(var_19_1)

		if var_22_0 ~= nil then
			var_19_17:setText(var_22_0, 0)
		end
	end

	var_19_17:SubscribeToModelThroughElement(var_19_0, "joinable", var_19_18)
	var_19_0:addElement(var_19_17)

	var_19_0.Joinability = var_19_17

	local var_19_19
	local var_19_20 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_19_1
	})

	var_19_20.id = "PlatformPresence"

	var_19_20:SetAlpha(0.75, 0)
	var_19_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 124, _1080p * 60, _1080p * 90)
	var_19_0:addElement(var_19_20)

	var_19_0.PlatformPresence = var_19_20

	local var_19_21
	local var_19_22 = LUI.UIImage.new()

	var_19_22.id = "MuteIcon"

	var_19_22:SetAlpha(0, 0)
	var_19_22:setImage(RegisterMaterial("icon_mic_muted"), 0)
	var_19_22:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -80, _1080p * -58, _1080p * -67, _1080p * -45)
	var_19_0:addElement(var_19_22)

	var_19_0.MuteIcon = var_19_22

	local var_19_23
	local var_19_24 = LUI.UIImage.new()

	var_19_24.id = "PlayerStatus"

	var_19_24:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusAvailable, 0)
	var_19_24:SetAlpha(0, 0)
	var_19_24:setImage(RegisterMaterial("icon_bnet_available"), 0)
	var_19_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 32, _1080p * 8, _1080p * 32)
	var_19_0:addElement(var_19_24)

	var_19_0.PlayerStatus = var_19_24

	local var_19_25

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_19_0) then
		var_19_25 = LUI.UIImage.new()
		var_19_25.id = "BnetGameIcon"

		var_19_25:SetAlpha(0, 0)
		var_19_25:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -54, _1080p * -9, _1080p * -27, _1080p * 18)
		var_19_0:addElement(var_19_25)

		var_19_0.BnetGameIcon = var_19_25
	end

	local var_19_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("DefaultSequence", var_19_26)

	local var_19_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		}
	}

	var_19_15:RegisterAnimationSequence("DefaultSequence", var_19_27)

	local var_19_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 291
		}
	}

	var_19_17:RegisterAnimationSequence("DefaultSequence", var_19_28)

	local function var_19_29()
		var_19_6:AnimateSequence("DefaultSequence")
		var_19_15:AnimateSequence("DefaultSequence")
		var_19_17:AnimateSequence("DefaultSequence")
	end

	var_19_0._sequences.DefaultSequence = var_19_29

	local var_19_30 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_19_8:RegisterAnimationSequence("ButtonOver", var_19_30)

	local var_19_31 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_19_11:RegisterAnimationSequence("ButtonOver", var_19_31)

	local var_19_32 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_19_15:RegisterAnimationSequence("ButtonOver", var_19_32)

	local var_19_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_19_17:RegisterAnimationSequence("ButtonOver", var_19_33)

	local function var_19_34()
		var_19_8:AnimateSequence("ButtonOver")
		var_19_11:AnimateSequence("ButtonOver")
		var_19_15:AnimateSequence("ButtonOver")
		var_19_17:AnimateSequence("ButtonOver")
	end

	var_19_0._sequences.ButtonOver = var_19_34

	local var_19_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_19_8:RegisterAnimationSequence("ButtonUp", var_19_35)

	local var_19_36 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_19_11:RegisterAnimationSequence("ButtonUp", var_19_36)

	local var_19_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_19_15:RegisterAnimationSequence("ButtonUp", var_19_37)

	local var_19_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_19_17:RegisterAnimationSequence("ButtonUp", var_19_38)

	local function var_19_39()
		var_19_8:AnimateSequence("ButtonUp")
		var_19_11:AnimateSequence("ButtonUp")
		var_19_15:AnimateSequence("ButtonUp")
		var_19_17:AnimateSequence("ButtonUp")
	end

	var_19_0._sequences.ButtonUp = var_19_39

	local var_19_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_19_8:RegisterAnimationSequence("AR", var_19_40)

	local var_19_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 386
		}
	}

	var_19_11:RegisterAnimationSequence("AR", var_19_41)

	if not Engine.HDGDBCJFG() then
		local var_19_42 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 90
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 129
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 391
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 60
			}
		}

		var_19_13:RegisterAnimationSequence("AR", var_19_42)
	end

	local var_19_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		}
	}

	var_19_15:RegisterAnimationSequence("AR", var_19_43)

	local var_19_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 331
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		}
	}

	var_19_17:RegisterAnimationSequence("AR", var_19_44)

	local var_19_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		}
	}

	var_19_20:RegisterAnimationSequence("AR", var_19_45)

	local var_19_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -416
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -394
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -39
		}
	}

	var_19_22:RegisterAnimationSequence("AR", var_19_46)

	local var_19_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 121
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_19_24:RegisterAnimationSequence("AR", var_19_47)

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_19_0) then
		local var_19_48 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -416
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -371
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -25
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 19
			}
		}

		var_19_25:RegisterAnimationSequence("AR", var_19_48)
	end

	local function var_19_49()
		var_19_8:AnimateSequence("AR")
		var_19_11:AnimateSequence("AR")

		if not Engine.HDGDBCJFG() then
			var_19_13:AnimateSequence("AR")
		end

		var_19_15:AnimateSequence("AR")
		var_19_17:AnimateSequence("AR")
		var_19_20:AnimateSequence("AR")
		var_19_22:AnimateSequence("AR")
		var_19_24:AnimateSequence("AR")

		if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_19_0) then
			var_19_25:AnimateSequence("AR")
		end
	end

	var_19_0._sequences.AR = var_19_49

	local var_19_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -39
		}
	}

	var_19_8:RegisterAnimationSequence("PC", var_19_50)

	local var_19_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 344
		}
	}

	var_19_11:RegisterAnimationSequence("PC", var_19_51)

	if not Engine.HDGDBCJFG() then
		local var_19_52 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 128
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 344
			}
		}

		var_19_13:RegisterAnimationSequence("PC", var_19_52)
	end

	local var_19_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -39
		}
	}

	var_19_15:RegisterAnimationSequence("PC", var_19_53)

	local var_19_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 365
		}
	}

	var_19_17:RegisterAnimationSequence("PC", var_19_54)

	local var_19_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 124
		}
	}

	var_19_20:RegisterAnimationSequence("PC", var_19_55)

	local var_19_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		}
	}

	var_19_24:RegisterAnimationSequence("PC", var_19_56)

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_19_0) then
		local var_19_57 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -17
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 23
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -54
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -14
			}
		}

		var_19_25:RegisterAnimationSequence("PC", var_19_57)
	end

	local function var_19_58()
		var_19_8:AnimateSequence("PC")
		var_19_11:AnimateSequence("PC")

		if not Engine.HDGDBCJFG() then
			var_19_13:AnimateSequence("PC")
		end

		var_19_15:AnimateSequence("PC")
		var_19_17:AnimateSequence("PC")
		var_19_20:AnimateSequence("PC")
		var_19_24:AnimateSequence("PC")

		if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_19_0) then
			var_19_25:AnimateSequence("PC")
		end
	end

	var_19_0._sequences.PC = var_19_58

	local var_19_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		}
	}

	var_19_6:RegisterAnimationSequence("ShowEmblem", var_19_59)

	local var_19_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		}
	}

	var_19_15:RegisterAnimationSequence("ShowEmblem", var_19_60)

	local function var_19_61()
		var_19_6:AnimateSequence("ShowEmblem")
		var_19_15:AnimateSequence("ShowEmblem")
	end

	var_19_0._sequences.ShowEmblem = var_19_61

	local var_19_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_17:RegisterAnimationSequence("HideJoinableStatus", var_19_62)

	local function var_19_63()
		var_19_17:AnimateSequence("HideJoinableStatus")
	end

	var_19_0._sequences.HideJoinableStatus = var_19_63

	local var_19_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_17:RegisterAnimationSequence("ShowJoinableStatus", var_19_64)

	local function var_19_65()
		var_19_17:AnimateSequence("ShowJoinableStatus")
	end

	var_19_0._sequences.ShowJoinableStatus = var_19_65

	local var_19_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_11:RegisterAnimationSequence("ShowCrossplayName", var_19_66)

	if not Engine.HDGDBCJFG() then
		local var_19_67 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_19_13:RegisterAnimationSequence("ShowCrossplayName", var_19_67)
	end

	local function var_19_68()
		var_19_11:AnimateSequence("ShowCrossplayName")

		if not Engine.HDGDBCJFG() then
			var_19_13:AnimateSequence("ShowCrossplayName")
		end
	end

	var_19_0._sequences.ShowCrossplayName = var_19_68

	var_19_0:addEventHandler("button_over", function(arg_32_0, arg_32_1)
		if not arg_32_1.controller then
			local var_32_0 = var_19_1
		end

		ACTIONS.AnimateSequence(var_19_0, "ButtonOver")
	end)
	var_19_0:addEventHandler("button_up", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_19_1
		end

		ACTIONS.AnimateSequence(var_19_0, "ButtonUp")
	end)
	var_0_7(var_19_0, var_19_1, arg_19_1)
	ACTIONS.AnimateSequence(var_19_0, "DefaultSequence")

	return var_19_0
end

MenuBuilder.registerType("SocialPlayer", SocialPlayer)
LockTable(_M)
