module(..., package.seeall)

local var_0_0 = 17

local function var_0_1(arg_1_0, arg_1_1)
	return function()
		local var_2_0 = arg_1_0._tabID or FRIENDS.TabIDs.ONLINE_FRIENDS
		local var_2_1 = arg_1_0._subTabID
		local var_2_2 = arg_1_1 and arg_1_1._clanCallbacks
		local var_2_3 = var_2_0 == FRIENDS.TabIDs.CLANS
		local var_2_4 = var_2_0 == FRIENDS.TabIDs.INBOX

		local function var_2_5(arg_3_0)
			return (FRIENDS.GetPlayerSubTabContextualMenu(arg_1_0._playerData, arg_3_0.controllerIndex, var_2_0, var_2_1))
		end

		local function var_2_6(arg_4_0)
			local var_4_0 = FRIENDS.GetFriendActions(arg_4_0)

			if not var_2_4 and arg_1_1 and arg_1_1._clanCallbacks then
				for iter_4_0, iter_4_1 in ipairs(arg_1_1._clanCallbacks) do
					table.insert(var_4_0, iter_4_1)
				end
			end

			return var_4_0
		end

		if var_2_4 then
			return {
				isContextualMenu = true,
				platformId = "0",
				invitationData = arg_1_0._invitationData,
				selectedTab = var_2_0,
				controllerIndex = arg_1_0._controllerIndex,
				showBattlenetData = Engine.DBFCJBDJEC() or nil,
				getButtonsCallback = var_2_6
			}
		end

		if Lobby.CHBBHFHJEH(Friends.CAIJHBHGGC(arg_1_0._playerData.xuid)) then
			arg_1_0:SetupContextualMenu()

			return nil
		end

		if not var_2_1 then
			if var_2_0 == FRIENDS.TabIDs.FRIENDS then
				var_2_0 = arg_1_0._playerData.friendsType
			end

			if not var_2_2 and not Friends.CCBABDAGGJ(arg_1_0._controllerIndex, arg_1_0._playerData.xuid, arg_1_0._playerData.platformId or "0", var_2_0).isValidEntry then
				return nil
			end
		end

		return {
			isContextualMenu = true,
			xuid = arg_1_0._playerData.xuid,
			isOnline = arg_1_0._playerData.isOnline,
			platformId = arg_1_0._playerData.platformId,
			selectedTab = var_2_0,
			controllerIndex = arg_1_0._controllerIndex,
			presencePlatform = arg_1_0._playerData.presencePlatform,
			gamertag = arg_1_0._playerData.fullName,
			crossplayGamertag = arg_1_0._playerData.crossplayGamertag,
			showBattlenetData = Engine.DBFCJBDJEC() or nil,
			getButtonsCallback = var_2_1 and not var_2_3 and var_2_5 or var_2_6
		}
	end
end

local function var_0_2(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0._tabID

	if not arg_5_0._contextualMenuIsAdded and var_5_0 and arg_5_0._playerData.xuid then
		local var_5_1 = Friends.CAIJHBHGGC(arg_5_0._playerData.xuid)

		if arg_5_0._playerData.xuid then
			local var_5_2 = {
				_hasClanActions = arg_5_1 and arg_5_1._clanCallbacks and true or false
			}

			FRIENDS.SetupPlayerContextualMenuOptions(arg_5_0, arg_5_0._controllerIndex, var_0_1(arg_5_0, arg_5_1), var_5_2)

			arg_5_0._contextualMenuIsAdded = true
		end
	end
end

local function var_0_3(arg_6_0)
	if not arg_6_0._contextualMenuIsAdded and arg_6_0._tabID and arg_6_0._invitationData then
		FRIENDS.SetupPlayerContextualMenuOptions(arg_6_0, arg_6_0._controllerIndex, var_0_1(arg_6_0))

		arg_6_0._contextualMenuIsAdded = true
	end
end

local function var_0_4(arg_7_0)
	if arg_7_0._playerData and arg_7_0.UpdatePlayerDetailsContent then
		arg_7_0:UpdatePlayerDetailsContent(arg_7_0._playerData)
	elseif arg_7_0._invitationData and arg_7_0.UpdateInvitationDetailsContent then
		arg_7_0:UpdatePlayerDetailsContent(arg_7_0._invitationData)
	end

	if arg_7_0._playerData or arg_7_0._invitationData then
		arg_7_0:dispatchEventToCurrentMenu({
			name = "friend_card_gain_focus"
		})

		arg_7_0._updatedForFocus = true
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0

	if arg_8_0._tabID == FRIENDS.TabIDs.FRIENDS and arg_8_0._subTabID == nil or arg_8_0._tabID == FRIENDS.TabIDs.PRIVATE_PARTY and arg_8_0._subTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS or arg_8_0._tabID == FRIENDS.TabIDs.REGIMENTS and arg_8_0._subTabID == nil then
		local var_8_1 = CONDITIONS.IsBattleNet() and arg_8_1.friendsListType == FRIENDS.FriendsListType.FIRST_PARTY

		if arg_8_1.isMyPlayer then
			var_8_0 = arg_8_1.onlineStatus
		elseif var_8_1 then
			var_8_0 = Social.BCACHCIEIA(arg_8_1.platformId)
		else
			var_8_0 = arg_8_1.isOnline and BattleNetOnlineStatus.ONLINE or BattleNetOnlineStatus.APPEAR_OFFLINE
		end
	end

	return var_8_0
end

local function var_0_6(arg_9_0, arg_9_1)
	if arg_9_0._playerData == nil then
		if arg_9_1.usingGamepad then
			arg_9_0.InputImage:SetAlpha(0.75, 0)
		else
			arg_9_0.InputImage:SetAlpha(0, 0)
		end

		if arg_9_1.isPartyHost or arg_9_1.role == OnlineClanRole.OWNER or arg_9_1.role == OnlineClanRole.OFFICER then
			arg_9_0.PartyLeaderIcon:SetAlpha(0.75, 0)
		else
			arg_9_0.PartyLeaderIcon:SetAlpha(0, 0)
		end
	else
		if arg_9_1.usingGamepad ~= arg_9_0._playerData.usingGamepad then
			arg_9_0.InputImage:SetAlpha(arg_9_1.usingGamepad and 0.75 or 0, 0)
		end

		if arg_9_1.isPartyHost ~= arg_9_0._playerData.isPartyHost or arg_9_1.role ~= arg_9_0._playerData.role then
			local var_9_0 = arg_9_1.isPartyHost or arg_9_1.role == OnlineClanRole.OWNER or arg_9_1.role == OnlineClanRole.OFFICER

			arg_9_0.PartyLeaderIcon:SetAlpha(var_9_0 and 0.75 or 0, 0)
		end
	end
end

local function var_0_7(arg_10_0, arg_10_1)
	arg_10_0.ActionLabel:SetAlpha(1)
	arg_10_0.ActionLabel:setText(arg_10_1)

	if IsLanguageArabic() then
		local var_10_0 = LAYOUT.GetTextWidth(arg_10_0.ActionLabel)
		local var_10_1 = arg_10_0.FullName:GetCurrentAnchorsAndPositions().left
		local var_10_2 = 8 * _1080p

		arg_10_0.ActionLabel:SetLeft(var_10_1)
		arg_10_0.StatusText:SetLeft(var_10_1 + var_10_0 + var_10_2)
	else
		local var_10_3 = LAYOUT.GetTextWidth(arg_10_0.StatusText)
		local var_10_4 = arg_10_0.StatusText:GetCurrentAnchorsAndPositions().left
		local var_10_5 = 8 * _1080p

		arg_10_0.ActionLabel:SetLeft(var_10_4 + var_10_3 + var_10_5)
	end
end

local function var_0_8(arg_11_0, arg_11_1)
	ACTIONS.AnimateSequence(arg_11_0, "ClanInvite")

	arg_11_0._invitationData = arg_11_1

	arg_11_0.FullName:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(arg_11_1.clanTag), Engine.JCBDICCAH(arg_11_1.clanName)))
	arg_11_0.Emblem:setImage(RegisterMaterial(arg_11_1.clanIcon or "icon_currency_codpoints"))
	arg_11_0.BNetFriendName:setText(arg_11_1.inviterName)
	arg_11_0.BNetFriendName:SetAlpha(1)
	var_0_3(arg_11_0)

	if arg_11_0:isInFocus() and arg_11_0.UpdateInvitationDetailsContent then
		if not arg_11_0._updatedForFocus then
			var_0_4(arg_11_0)
		else
			arg_11_0:UpdateInvitationDetailsContent(arg_11_0._invitationData)
		end
	end
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2)
	if not arg_12_1 then
		return
	end

	local var_12_0 = var_0_5(arg_12_0, arg_12_1)
	local var_12_1 = Engine.CGABICJHAI() and arg_12_1.friendsListType == FRIENDS.FriendsListType.FIRST_PARTY

	arg_12_0.PlayerStatus:SetOnlineStatus(var_12_0)

	if var_12_0 then
		ACTIONS.AnimateSequence(arg_12_0, WZWIP.CheckForApplyPrependWZWipPrefix("Bnet"))
		arg_12_0.PlayerStatus:SetAlpha(1)
	end

	arg_12_1.onlineStatus = var_12_0

	local var_12_2 = arg_12_1.fullName or arg_12_1.name

	if CONDITIONS.IsDisplayNameTag() and Engine.DDHAAEGIEI(arg_12_0._controllerIndex) and arg_12_1.fullNameWithHash and #arg_12_1.fullNameWithHash > 0 then
		var_12_2 = arg_12_1.fullNameWithHash

		if (CONDITIONS.IsLaze() or CONDITIONS.IsPCMSStore()) and arg_12_1.friendsType == FRIENDS.TabIDs.ONLINE_FRIENDS then
			var_12_2 = arg_12_1.crossplayGamertag
		end
	end

	if var_12_2 ~= nil then
		if var_12_1 and not arg_12_1.isAtviFriend then
			if arg_12_1.crossplayGamertag ~= nil and arg_12_1.crossplayGamertag ~= "" then
				var_12_2 = arg_12_1.crossplayGamertag
			elseif CONDITIONS.IsBattleNet() then
				var_12_2 = FRIENDS.TryAppendRealIdToBattleTag(arg_12_1.platformId, var_12_2)
			end
		end

		arg_12_0.FullName:setText(var_12_2)
	end

	arg_12_0.ActionLabel:SetAlpha(0)

	if arg_12_1.lastMetInfo then
		arg_12_0.StatusText:setText(arg_12_1.lastMetInfo)
	elseif arg_12_1.timeInfo then
		arg_12_0.StatusText:setText(arg_12_1.timeInfo)
	elseif arg_12_1.joinable ~= nil then
		local var_12_3 = arg_12_1.joinable and Engine.CBBHFCGDIC("MENU/JOINABLE") or Engine.CBBHFCGDIC("MENU/NOT_JOINABLE")

		if arg_12_1.presence == nil or #arg_12_1.presence == 0 or arg_12_1.onlineStatus == BattleNetOnlineStatus.APPEAR_OFFLINE then
			var_12_3 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")
		end

		if Engine.CHDGBEFDHB() then
			var_12_3 = ""
		end

		arg_12_0.StatusText:setText(var_12_3)

		if not Engine.HDGDBCJFG() then
			if arg_12_1.crossplayGamertag ~= nil and arg_12_1.crossplayGamertag ~= "" then
				arg_12_0.BNetFriendName:SetAlpha(1)
				arg_12_0.BNetFriendIcon:SetAlpha(1)

				local var_12_4 = FRIENDS.GetFriendPlatformId(arg_12_1)

				if var_12_4 and var_12_4 >= PresencePlatform.NONE and var_12_4 <= PresencePlatform.CROSSPLAY_PC then
					if var_12_4 == PresencePlatform.NONE then
						if CONDITIONS.IsPCMSStore() then
							arg_12_0.BNetFriendIcon:SetAlpha(0)
						else
							local var_12_5 = Engine.CBBFHGEDGJ()

							arg_12_0.BNetFriendIcon:setImage(RegisterMaterial(FRIENDS.PlatformIcon[var_12_5]))
						end
					else
						local var_12_6 = Engine.CBBFHGEDGJ()

						arg_12_0.BNetFriendIcon:setImage(RegisterMaterial(FRIENDS.PlatformIcon[var_12_6]))
					end
				end

				if Engine.CHDGBEFDHB() or Engine.EAABDHIDFJ() then
					arg_12_0.BNetFriendName:setText(arg_12_1.fullName)
				else
					Engine.DBFCJBDJEC()
					arg_12_0.BNetFriendName:setText(FRIENDS.TryAppendRealIdToBattleTag(arg_12_1.platformId, arg_12_1.fullName))
				end
			elseif arg_12_0._clanStatusUpdateRequestTime ~= 0 then
				-- block empty
			else
				arg_12_0.BNetFriendName:SetAlpha(0)
				arg_12_0.BNetFriendIcon:SetAlpha(0)
			end
		else
			arg_12_0.BNetFriendName:SetAlpha(0)
			arg_12_0.BNetFriendIcon:SetAlpha(0)
		end
	else
		arg_12_0.StatusText:SetAlpha(0)
		arg_12_0.BNetFriendName:SetAlpha(0)
		arg_12_0.BNetFriendIcon:SetAlpha(0)
	end

	local function var_12_7(arg_13_0)
		local var_13_0 = FRIENDS.GetFriendPlatformId(arg_13_0)

		if not CONDITIONS.IsPCMSStore() and not CONDITIONS.IsXbox() and arg_13_0.isPlatformFriend and var_13_0 == 0 then
			var_13_0 = Engine.CBBFHGEDGJ()
		end

		if var_13_0 <= 0 then
			arg_12_0.PlatformIcon:setImage(RegisterMaterial(FRIENDS.PlatformIcon[PresencePlatform.NONE]))
		else
			local var_13_1 = FRIENDS.PlatformIcon[var_13_0]

			arg_12_0.PlatformIcon:setImage(RegisterMaterial(var_13_1))
		end
	end

	local var_12_8 = arg_12_0._tabID == FRIENDS.TabIDs.PRIVATE_PARTY and arg_12_0._subTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS and CONDITIONS.InFrontend()

	arg_12_1.showPlatformIcon = false

	local var_12_9 = arg_12_1.presence == nil or #arg_12_1.presence == 0 or string.lower(arg_12_1.presence) == "offline"
	local var_12_10 = arg_12_1.isAtviFriend or arg_12_1.isPlatformFriend

	if (CONDITIONS.IsPCMSStore() or CONDITIONS.IsXbox()) and var_12_9 and (arg_12_1.isPlatformFriend or not var_12_10) then
		arg_12_1.showPlatformIcon = false
	elseif arg_12_0._tabID == FRIENDS.TabIDs.REGIMENTS then
		arg_12_1.showPlatformIcon = arg_12_1.presencePlatform ~= nil
	else
		arg_12_1.showPlatformIcon = (arg_12_0._tabID == FRIENDS.TabIDs.FRIENDS or var_12_8) and arg_12_1.isAtviFriend ~= nil
	end

	if arg_12_1.showPlatformIcon or arg_12_0._subTabID == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
		var_12_7(arg_12_1)

		if CONDITIONS.IsPCMSStore() or CONDITIONS.IsXbox() then
			arg_12_0.PlatformIcon:SetAlpha(1)
		end
	else
		arg_12_0.PlatformIcon:SetAlpha(0)
	end

	if arg_12_1.emblemIndex and arg_12_1.valid then
		local var_12_11 = EmblemEditorUtils.GetEmblemImageFromID(arg_12_1.emblemIndex)

		arg_12_0.Emblem:setImage(RegisterMaterial(var_12_11))
		arg_12_0.Emblem:SetAlpha(1)
	else
		arg_12_0.Emblem:SetAlpha(0)
	end

	if arg_12_1.usingGamepad ~= nil then
		arg_12_0.InputImage:setImage(RegisterMaterial(arg_12_1.usingGamepad and "icon_platform_controller" or "icon_platform_mousekeyboard"))
	end

	if arg_12_1.isPartyHost then
		-- block empty
	elseif arg_12_1.role == OnlineClanRole.OWNER then
		arg_12_0.PartyLeaderIcon:setImage(RegisterMaterial("icon_regiments_leader"))
	elseif arg_12_1.role == OnlineClanRole.OFFICER then
		arg_12_0.PartyLeaderIcon:setImage(RegisterMaterial("icon_regiments_officer"))
	end

	if isBnet then
		arg_12_0.BnetGameIcon:SetAlpha(0)

		local var_12_12 = Social.CFEIHAADEI(arg_12_1.platformId)

		if var_12_12 and var_12_0 ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
			local var_12_13 = FRIENDS.BattleNetGameInfo[var_12_12.clientProgramID]

			if var_12_13 then
				arg_12_0.BnetGameIcon:setImage(RegisterMaterial(var_12_13.icon))
				arg_12_0.BnetGameIcon:SetAlpha(1)
			end
		end

		if not arg_12_1.isAtviFriend and not arg_12_1.crossplayGamertag then
			arg_12_0.Emblem:setImage(RegisterMaterial("icon_platform_pc"))
		end
	end

	if arg_12_0._tabID == FRIENDS.TabIDs.PRIVATE_PARTY and not arg_12_1.isMyPlayer then
		arg_12_0.MuteStatusIcon:SetAlpha(1)
		arg_12_0.MuteStatusIcon:setImage(RegisterMaterial(arg_12_1.isMuted and "icon_mic_muted" or "icon_mic_on"))
	else
		arg_12_0.MuteStatusIcon:SetAlpha(0)
	end

	arg_12_0:SetButtonDisabled(arg_12_1.locked)
	var_0_6(arg_12_0, arg_12_1)

	arg_12_0._playerData = arg_12_1

	if CONDITIONS.IsClanUIEnabled() then
		local var_12_14 = Engine.EAGGAEGHHA(arg_12_0._controllerIndex)

		if arg_12_0._tabID == FRIENDS.TabIDs.CLANS then
			if var_12_14 ~= arg_12_1.xuid then
				local var_12_15 = CLANS.GetClanMembersScreenActions(arg_12_0._subTabID, arg_12_1.viewerMemberRole, arg_12_1)

				var_0_2(arg_12_0, {
					_clanCallbacks = var_12_15
				})
			end
		else
			local var_12_16 = CLANS.GetSocialMenuScreenActions({
				controllerIndex = arg_12_0._controllerIndex,
				clanDetails = arg_12_0._clanDetails,
				xuid = arg_12_1.xuid,
				playerData = arg_12_1
			})

			arg_12_0._contextualMenuIsAdded = false
			arg_12_0._contextualMenuHandlerAdded = false

			var_0_2(arg_12_0, {
				_clanCallbacks = var_12_16
			})
		end
	else
		var_0_2(arg_12_0)
	end

	if arg_12_0:isInFocus() and arg_12_0.UpdatePlayerDetailsContent then
		if not arg_12_0._updatedForFocus then
			var_0_4(arg_12_0)
		else
			arg_12_0:UpdatePlayerDetailsContent(arg_12_0._playerData)
		end
	end

	if CONDITIONS.IsClanUIEnabled() then
		if arg_12_0._tabID == FRIENDS.TabIDs.CLANS and arg_12_0._subTabID == CLANS.CLAN_TAB_IDs.MEMBERS then
			local var_12_17 = Clans2.CFDHGBFICH(arg_12_0._controllerIndex, arg_12_1.clanId, arg_12_1.xuid)
			local var_12_18 = CLANS.GetClanMemberRoleIconByRole(var_12_17)

			if var_12_18 and var_12_18.icon and var_12_18.icon ~= "" then
				arg_12_0.ClanStatusIcon:setImage(RegisterMaterial(var_12_18.icon))
				arg_12_0.ClanStatusIcon:SetAlpha(1)
			else
				arg_12_0.ClanStatusIcon:SetAlpha(0)
			end
		else
			local var_12_19 = arg_12_1.xuid or arg_12_1.inviterXuid
			local var_12_20 = tonumber(Engine.DEIDGHDBHD())
			local var_12_21 = var_12_20 - arg_12_0._clanStatusUpdateRequestTime

			if arg_12_0._playerXuid ~= var_12_19 or var_12_21 > var_0_0 then
				local var_12_22 = CLANS.CLAN_DATA.GetXUIDClanData(arg_12_0._controllerIndex, var_12_19, arg_12_0)

				if var_12_22 ~= arg_12_0._clanDetails then
					arg_12_0._contextualMenuIsAdded = false
					arg_12_0._contextualMenuHandlerAdded = false
				end

				arg_12_0._clanDetails = var_12_22

				if var_12_22 then
					arg_12_0:SetClanMemberStatus(var_12_22)
				else
					arg_12_0:ClearClanMemberStatus(var_12_22)
				end

				arg_12_0._clanStatusUpdateRequestTime = var_12_20
				arg_12_0._playerXuid = var_12_19
			end
		end

		arg_12_0._activeClanId = Clans2.CFGBBBHFHB(arg_12_0._controllerIndex)
	end
end

local function var_0_10(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_1)

	if not arg_14_0._tabID then
		arg_14_0._tabID = arg_14_1
		arg_14_0._subTabID = arg_14_2

		if arg_14_0._subTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
			arg_14_0.StatusText:SetAlpha(0)
		else
			arg_14_0.StatusText:SetAlpha(1)
		end
	end
end

local function var_0_11(arg_15_0, arg_15_1)
	arg_15_0._clanDetails = arg_15_1

	CLANS.DisplayClanMemberStatus(nil, arg_15_0.ClanStatusIcon, arg_15_0._controllerIndex, arg_15_1)
end

local function var_0_12(arg_16_0)
	CLANS.DisplayClanMemberStatus(nil, arg_16_0.ClanStatusIcon, arg_16_0._controllerIndex, nil)
end

local function var_0_13(arg_17_0, arg_17_1, arg_17_2)
	assert(arg_17_0.FullName)

	arg_17_0.SetupPlayerData = var_0_9
	arg_17_0.SetupInvitationData = var_0_8
	arg_17_0.SetCurrentLocation = var_0_10
	arg_17_0.SetClanMemberStatus = var_0_11
	arg_17_0.ClearClanMemberStatus = var_0_12
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._showPlatform = false
	arg_17_0._playerXuid = ""
	arg_17_0._clanStatusUpdateRequestTime = 0

	ACTIONS.AnimateSequence(arg_17_0, WZWIP.CheckForApplyPrependWZWipPrefix("Bnet"))
	arg_17_0.BNetFriendName:SetAlpha(0)
	arg_17_0.BNetFriendIcon:SetAlpha(0)

	arg_17_0._currentPlatform = Engine.CBBFHGEDGJ()

	if not arg_17_0.bindButton then
		local var_17_0 = LUI.UIBindButton.new()

		var_17_0.id = "bindButton"

		arg_17_0:addElement(var_17_0)

		arg_17_0.bindButton = var_17_0
	end

	arg_17_0:addEventHandler("button_action", function(arg_18_0, arg_18_1)
		if arg_17_0._playerData then
			if CONDITIONS.IsClanUIEnabled() and arg_17_0._tabID == FRIENDS.TabIDs.CLANS and Engine.EAGGAEGHHA(arg_17_0._controllerIndex) == arg_17_0._playerData.xuid then
				return
			end

			FRIENDS.GetPlayerButtonAction(arg_17_0._playerData, arg_17_0._tabID, arg_17_0._subTabID)(arg_18_0, arg_18_1)
		elseif arg_17_0._invitationData and CONDITIONS.IsClanUIEnabled() then
			FRIENDS.GetOpenInboxActionPopupFunc(arg_17_0._invitationData)(arg_18_0, arg_18_1)
		end
	end)
	arg_17_0:addEventHandler("lose_focus", function()
		arg_17_0:dispatchEventToCurrentMenu({
			name = "friend_card_lose_focus"
		})
	end)
	arg_17_0:addEventHandler("gain_focus", function()
		arg_17_0._updatedForFocus = false

		var_0_4(arg_17_0)
	end)
	arg_17_0:addEventHandler("button_over", function(arg_21_0, arg_21_1)
		if arg_17_0._showPlatform then
			arg_17_0.PlatformPresence:SetAlpha(1, 150)
		end

		if arg_17_0._playerData then
			if arg_17_0._playerData.usingGamepad then
				arg_17_0.InputImage:SetAlpha(1, 150)
			end

			if arg_17_0._playerData.showPlatformIcon then
				arg_17_0.PlatformIcon:SetAlpha(1, 150)
			end

			if arg_17_0._playerData.isPartyHost or arg_17_0._playerData.role == OnlineClanRole.OWNER or arg_17_0._playerData.role == OnlineClanRole.OFFICER then
				arg_17_0.PartyLeaderIcon:SetAlpha(1, 150)
			end
		end

		ACTIONS.AnimateSequence(arg_17_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_17_0:addEventHandler("button_up", function(arg_22_0, arg_22_1)
		if arg_17_0._showPlatform then
			arg_17_0.PlatformPresence:SetAlpha(0.75, 150)
		end

		if arg_17_0._playerData then
			if arg_17_0._playerData.usingGamepad then
				arg_17_0.InputImage:SetAlpha(0.75, 150)
			end

			if arg_17_0._playerData.showPlatformIcon then
				arg_17_0.PlatformIcon:SetAlpha(0.75, 150)
			end

			if arg_17_0._playerData.isPartyHost or arg_17_0._playerData.role == OnlineClanRole.OWNER or arg_17_0._playerData.role == OnlineClanRole.OFFICER then
				arg_17_0.PartyLeaderIcon:SetAlpha(0.75, 150)
			end
		end

		ACTIONS.AnimateSequence(arg_17_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_17_0, WZWIP.CheckForApplyPrependWZWipPrefix("AR"))
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_17_0, "WZWipSetup")
	end
end

function SocialFriendCard(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIButton.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 510 * _1080p, 0, 80 * _1080p)

	var_23_0.id = "SocialFriendCard"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "Background"

	var_23_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, 0, _1080p * 3, _1080p * -3)
	var_23_0:addElement(var_23_4)

	var_23_0.Background = var_23_4

	local var_23_5
	local var_23_6 = LUI.UIImage.new()

	var_23_6.id = "Emblem"

	var_23_6:setImage(RegisterMaterial("ui_emblem_207"), 0)
	var_23_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 74, _1080p * 8, _1080p * 72)
	var_23_0:addElement(var_23_6)

	var_23_0.Emblem = var_23_6

	local var_23_7
	local var_23_8 = LUI.UIImage.new()

	var_23_8.id = "BNetFriendIcon"

	var_23_8:setImage(RegisterMaterial("icon_platform_pc"), 0)
	var_23_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 74, _1080p * 90, _1080p * 52, _1080p * 68)
	var_23_0:addElement(var_23_8)

	var_23_0.BNetFriendIcon = var_23_8

	local var_23_9
	local var_23_10 = LUI.UIText.new()

	var_23_10.id = "BNetFriendName"

	var_23_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_23_10:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_23_10:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_23_10:SetWordWrap(false)
	var_23_10:SetAlignment(LUI.Alignment.Left)
	var_23_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 92, _1080p * 208, _1080p * -30, _1080p * -14)
	var_23_0:addElement(var_23_10)

	var_23_0.BNetFriendName = var_23_10

	local var_23_11
	local var_23_12 = LUI.UIStyledText.new()

	var_23_12.id = "FullName"

	var_23_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_23_12:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_23_12:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_23_12:SetWordWrap(false)
	var_23_12:SetAlignment(LUI.Alignment.Left)
	var_23_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_12:SetUseEllipses(ELLIPSES.enabled_default)
	var_23_12:SetShadowRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_23_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 80, _1080p * -117, _1080p * 10, _1080p * 32)
	var_23_0:addElement(var_23_12)

	var_23_0.FullName = var_23_12

	local var_23_13
	local var_23_14 = LUI.UIStyledText.new()

	var_23_14.id = "StatusText"

	var_23_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_23_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_14:SetWordWrap(false)
	var_23_14:SetAlignment(LUI.Alignment.Left)
	var_23_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_14:SetUseEllipses(ELLIPSES.enabled_default)
	var_23_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 80, _1080p * 385, _1080p * -46, _1080p * -28)

	local function var_23_15()
		local var_24_0 = var_23_0:GetDataSource().joinable:GetValue(var_23_1)

		if var_24_0 ~= nil then
			var_23_14:setText(var_24_0, 0)
		end
	end

	var_23_14:SubscribeToModelThroughElement(var_23_0, "joinable", var_23_15)
	var_23_0:addElement(var_23_14)

	var_23_0.StatusText = var_23_14

	local var_23_16
	local var_23_17 = MenuBuilder.BuildRegisteredType("SocialPlayerStatus", {
		controllerIndex = var_23_1
	})

	var_23_17.id = "PlayerStatus"

	var_23_17:SetAlpha(0, 0)
	var_23_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -33, _1080p * -13, _1080p * 10, _1080p * 30)
	var_23_0:addElement(var_23_17)

	var_23_0.PlayerStatus = var_23_17

	local var_23_18

	if Engine.CGABICJHAI() and CONDITIONS.IsBattleNet() then
		var_23_18 = LUI.UIImage.new()
		var_23_18.id = "BnetGameIcon"

		var_23_18:SetAlpha(0, 0)
		var_23_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -106, _1080p * -76, _1080p * -35, _1080p * -5)
		var_23_0:addElement(var_23_18)

		var_23_0.BnetGameIcon = var_23_18
	end

	local var_23_19
	local var_23_20 = LUI.UIImage.new()

	var_23_20.id = "PlatformIcon"

	var_23_20:SetAlpha(0.75, 0)
	var_23_20:setImage(RegisterMaterial("icon_social_friend_atvi"), 0)
	var_23_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -71, _1080p * -41, _1080p * 5, _1080p * 35)
	var_23_0:addElement(var_23_20)

	var_23_0.PlatformIcon = var_23_20

	local var_23_21
	local var_23_22 = LUI.UIImage.new()

	var_23_22.id = "InputImage"

	var_23_22:SetAlpha(0, 0)
	var_23_22:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_23_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 112, _1080p * 40, _1080p * 72)
	var_23_0:addElement(var_23_22)

	var_23_0.InputImage = var_23_22

	local var_23_23
	local var_23_24 = LUI.UIImage.new()

	var_23_24.id = "PartyLeaderIcon"

	var_23_24:SetAlpha(0, 0)
	var_23_24:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_23_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -38, _1080p * -8, _1080p * 43, _1080p * 73)
	var_23_0:addElement(var_23_24)

	var_23_0.PartyLeaderIcon = var_23_24

	local var_23_25
	local var_23_26 = LUI.UIText.new()

	var_23_26.id = "ActionLabel"

	var_23_26:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_23_26:setText(Engine.CBBHFCGDIC("MENU/ACCEPT"), 0)
	var_23_26:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_23_26:SetWordWrap(false)
	var_23_26:SetAlignment(LUI.Alignment.Left)
	var_23_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 218, _1080p * 334, _1080p * -45, _1080p * -29)
	var_23_0:addElement(var_23_26)

	var_23_0.ActionLabel = var_23_26

	local var_23_27
	local var_23_28 = LUI.UIImage.new()

	var_23_28.id = "MuteStatusIcon"

	var_23_28:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_23_28:SetAlpha(0, 0)
	var_23_28:setImage(RegisterMaterial("icon_mic_muted"), 0)
	var_23_28:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -38, _1080p * -8, _1080p * -35, _1080p * -5)
	var_23_0:addElement(var_23_28)

	var_23_0.MuteStatusIcon = var_23_28

	local var_23_29
	local var_23_30 = LUI.UIImage.new()

	var_23_30.id = "ClanStatusIcon"

	var_23_30:SetAlpha(0, 0)
	var_23_30:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -71, _1080p * -41, _1080p * 2, _1080p * 32)
	var_23_0:addElement(var_23_30)

	var_23_0.ClanStatusIcon = var_23_30

	local var_23_31
	local var_23_32 = {}

	var_23_8:RegisterAnimationSequence("DefaultSequence", var_23_32)

	local var_23_33 = {}

	var_23_10:RegisterAnimationSequence("DefaultSequence", var_23_33)

	local function var_23_34()
		var_23_8:AnimateSequence("DefaultSequence")
		var_23_10:AnimateSequence("DefaultSequence")
	end

	var_23_0._sequences.DefaultSequence = var_23_34

	local var_23_35
	local var_23_36 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_23_10:RegisterAnimationSequence("ButtonOver", var_23_36)

	local var_23_37 = {
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_12:RegisterAnimationSequence("ButtonOver", var_23_37)

	local var_23_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_23_14:RegisterAnimationSequence("ButtonOver", var_23_38)

	local var_23_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonOver", var_23_39)

	local function var_23_40()
		var_23_10:AnimateSequence("ButtonOver")
		var_23_12:AnimateSequence("ButtonOver")
		var_23_14:AnimateSequence("ButtonOver")
		var_23_26:AnimateSequence("ButtonOver")
	end

	var_23_0._sequences.ButtonOver = var_23_40

	local var_23_41
	local var_23_42 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_23_10:RegisterAnimationSequence("ButtonUp", var_23_42)

	local var_23_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_23_12:RegisterAnimationSequence("ButtonUp", var_23_43)

	local var_23_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_23_14:RegisterAnimationSequence("ButtonUp", var_23_44)

	local var_23_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonUp", var_23_45)

	local function var_23_46()
		var_23_10:AnimateSequence("ButtonUp")
		var_23_12:AnimateSequence("ButtonUp")
		var_23_14:AnimateSequence("ButtonUp")
		var_23_26:AnimateSequence("ButtonUp")
	end

	var_23_0._sequences.ButtonUp = var_23_46

	local var_23_47
	local var_23_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_23_12:RegisterAnimationSequence("AR", var_23_48)

	local var_23_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -30
		}
	}

	var_23_14:RegisterAnimationSequence("AR", var_23_49)

	local var_23_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -54
		}
	}

	var_23_26:RegisterAnimationSequence("AR", var_23_50)

	local function var_23_51()
		var_23_12:AnimateSequence("AR")
		var_23_14:AnimateSequence("AR")
		var_23_26:AnimateSequence("AR")
	end

	var_23_0._sequences.AR = var_23_51

	local var_23_52
	local var_23_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -38
		}
	}

	var_23_28:RegisterAnimationSequence("Bnet", var_23_53)

	local function var_23_54()
		var_23_28:AnimateSequence("Bnet")
	end

	var_23_0._sequences.Bnet = var_23_54

	local var_23_55
	local var_23_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_23_12:RegisterAnimationSequence("WZWipSetup", var_23_56)

	local function var_23_57()
		var_23_12:AnimateSequence("WZWipSetup")
	end

	var_23_0._sequences.WZWipSetup = var_23_57

	local var_23_58
	local var_23_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_23_12:RegisterAnimationSequence("WZWipAR", var_23_59)

	local var_23_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 385
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		}
	}

	var_23_14:RegisterAnimationSequence("WZWipAR", var_23_60)

	local var_23_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipAR", var_23_61)

	local function var_23_62()
		var_23_12:AnimateSequence("WZWipAR")
		var_23_14:AnimateSequence("WZWipAR")
		var_23_26:AnimateSequence("WZWipAR")
	end

	var_23_0._sequences.WZWipAR = var_23_62

	local var_23_63
	local var_23_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -38
		}
	}

	var_23_28:RegisterAnimationSequence("WZWipBnet", var_23_64)

	local function var_23_65()
		var_23_28:AnimateSequence("WZWipBnet")
	end

	var_23_0._sequences.WZWipBnet = var_23_65

	local var_23_66
	local var_23_67 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_23_10:RegisterAnimationSequence("WZWipButtonOver", var_23_67)

	local var_23_68 = {
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_23_12:RegisterAnimationSequence("WZWipButtonOver", var_23_68)

	local var_23_69 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_23_14:RegisterAnimationSequence("WZWipButtonOver", var_23_69)

	local var_23_70 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipButtonOver", var_23_70)

	local function var_23_71()
		var_23_10:AnimateSequence("WZWipButtonOver")
		var_23_12:AnimateSequence("WZWipButtonOver")
		var_23_14:AnimateSequence("WZWipButtonOver")
		var_23_26:AnimateSequence("WZWipButtonOver")
	end

	var_23_0._sequences.WZWipButtonOver = var_23_71

	local var_23_72
	local var_23_73 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_23_10:RegisterAnimationSequence("WZWipButtonUp", var_23_73)

	local var_23_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_23_12:RegisterAnimationSequence("WZWipButtonUp", var_23_74)

	local var_23_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_23_14:RegisterAnimationSequence("WZWipButtonUp", var_23_75)

	local var_23_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipButtonUp", var_23_76)

	local function var_23_77()
		var_23_10:AnimateSequence("WZWipButtonUp")
		var_23_12:AnimateSequence("WZWipButtonUp")
		var_23_14:AnimateSequence("WZWipButtonUp")
		var_23_26:AnimateSequence("WZWipButtonUp")
	end

	var_23_0._sequences.WZWipButtonUp = var_23_77

	local var_23_78
	local var_23_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("ClanInvite", var_23_79)

	local var_23_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_23_10:RegisterAnimationSequence("ClanInvite", var_23_80)

	local var_23_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		}
	}

	var_23_12:RegisterAnimationSequence("ClanInvite", var_23_81)

	local var_23_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("ClanInvite", var_23_82)

	if Engine.CGABICJHAI() and CONDITIONS.IsBattleNet() then
		local var_23_83 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_18:RegisterAnimationSequence("ClanInvite", var_23_83)
	end

	local var_23_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -30
		}
	}

	var_23_26:RegisterAnimationSequence("ClanInvite", var_23_84)

	local var_23_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ClanInvite", var_23_85)

	local function var_23_86()
		var_23_8:AnimateSequence("ClanInvite")
		var_23_10:AnimateSequence("ClanInvite")
		var_23_12:AnimateSequence("ClanInvite")
		var_23_14:AnimateSequence("ClanInvite")

		if Engine.CGABICJHAI() and CONDITIONS.IsBattleNet() then
			var_23_18:AnimateSequence("ClanInvite")
		end

		var_23_26:AnimateSequence("ClanInvite")
		var_23_28:AnimateSequence("ClanInvite")
	end

	var_23_0._sequences.ClanInvite = var_23_86

	var_23_0:addEventHandler("button_over", function(arg_36_0, arg_36_1)
		if not arg_36_1.controller then
			local var_36_0 = var_23_1
		end

		ACTIONS.AnimateSequence(var_23_0, "ButtonOver")
	end)
	var_23_0:addEventHandler("button_up", function(arg_37_0, arg_37_1)
		if not arg_37_1.controller then
			local var_37_0 = var_23_1
		end

		ACTIONS.AnimateSequence(var_23_0, "ButtonUp")
	end)
	var_0_13(var_23_0, var_23_1, arg_23_1)
	ACTIONS.AnimateSequence(var_23_0, "DefaultSequence")

	return var_23_0
end

MenuBuilder.registerType("SocialFriendCard", SocialFriendCard)
LockTable(_M)
