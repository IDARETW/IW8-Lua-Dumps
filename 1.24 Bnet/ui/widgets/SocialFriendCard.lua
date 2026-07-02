module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function()
		if Lobby.CHBBHFHJEH(Friends.CAIJHBHGGC(arg_1_0._playerData.xuid)) then
			arg_1_0:SetupContextualMenu()

			return nil
		end

		local var_2_0 = arg_1_0:GetCurrentMenu()
		local var_2_1 = arg_1_0._tabID or FRIENDS.TabIDs.ONLINE_FRIENDS
		local var_2_2 = arg_1_0._subTabID

		if var_2_1 == FRIENDS.TabIDs.FRIENDS and not var_2_2 then
			var_2_1 = arg_1_0._playerData.friendsType
		end

		if var_2_2 then
			return {
				isContextualMenu = true,
				xuid = arg_1_0._playerData.xuid,
				platformId = arg_1_0._playerData.platformId,
				selectedTab = var_2_1,
				controllerIndex = arg_1_0._controllerIndex,
				presencePlatform = arg_1_0._playerData.presencePlatform,
				gamertag = arg_1_0._playerData.fullName,
				crossplayGamertag = arg_1_0._playerData.crossplayGamertag,
				showBattlenetData = Engine.CGABICJHAI() or nil,
				getButtonsCallback = function(arg_3_0)
					return (FRIENDS.GetPlayerSubTabContextualMenu(arg_1_0._playerData, arg_3_0.controllerIndex, var_2_1, var_2_2))
				end
			}
		else
			if not Friends.CCBABDAGGJ(arg_1_0._controllerIndex, arg_1_0._playerData.xuid, arg_1_0._playerData.platformId or "0", var_2_1).isValidEntry then
				return nil
			end

			return {
				isContextualMenu = true,
				xuid = arg_1_0._playerData.xuid,
				platformId = arg_1_0._playerData.platformId or "0",
				selectedTab = var_2_1,
				controllerIndex = arg_1_0._controllerIndex,
				presencePlatform = arg_1_0._playerData.presencePlatform,
				gamertag = arg_1_0._playerData.fullName,
				crossplayGamertag = arg_1_0._playerData.crossplayGamertag,
				showBattlenetData = Engine.CGABICJHAI() or nil,
				getButtonsCallback = function(arg_4_0)
					return (FRIENDS.GetFriendActions(arg_4_0))
				end
			}
		end
	end
end

local function var_0_1(arg_5_0)
	if not arg_5_0._contextualMenuIsAdded and arg_5_0._tabID and arg_5_0._playerData.xuid then
		local var_5_0 = Friends.CAIJHBHGGC(arg_5_0._playerData.xuid)

		if arg_5_0._playerData.xuid then
			FRIENDS.SetupPlayerContextualMenuOptions(arg_5_0, arg_5_0._controllerIndex, var_0_0(arg_5_0))

			arg_5_0._contextualMenuIsAdded = true
		end
	end
end

local function var_0_2(arg_6_0)
	if arg_6_0._playerData then
		if arg_6_0.UpdatePlayerDetailsContent then
			arg_6_0:UpdatePlayerDetailsContent(arg_6_0._playerData)
		end

		arg_6_0:dispatchEventToCurrentMenu({
			name = "friend_card_gain_focus"
		})

		arg_6_0._updatedForFocus = true
	end
end

local function var_0_3(arg_7_0, arg_7_1)
	local var_7_0

	if arg_7_0._tabID == FRIENDS.TabIDs.FRIENDS and arg_7_0._subTabID == nil or arg_7_0._tabID == FRIENDS.TabIDs.PRIVATE_PARTY and arg_7_0._subTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS or arg_7_0._tabID == FRIENDS.TabIDs.REGIMENTS and arg_7_0._subTabID == nil then
		local var_7_1 = CONDITIONS.IsBattleNet() and arg_7_1.friendsListType == FRIENDS.FriendsListType.FIRST_PARTY

		if arg_7_1.isMyPlayer then
			var_7_0 = arg_7_1.onlineStatus
		elseif var_7_1 then
			var_7_0 = Social.BCACHCIEIA(arg_7_1.platformId)
		else
			var_7_0 = arg_7_1.isOnline and BattleNetOnlineStatus.ONLINE or BattleNetOnlineStatus.APPEAR_OFFLINE
		end
	end

	return var_7_0
end

local function var_0_4(arg_8_0, arg_8_1)
	if arg_8_0._playerData == nil then
		if arg_8_1.usingGamepad then
			arg_8_0.InputImage:SetAlpha(0.75, 0)
		else
			arg_8_0.InputImage:SetAlpha(0, 0)
		end

		if arg_8_1.isPartyHost or arg_8_1.role == OnlineClanRole.OWNER or arg_8_1.role == OnlineClanRole.OFFICER then
			arg_8_0.PartyLeaderIcon:SetAlpha(0.75, 0)
		else
			arg_8_0.PartyLeaderIcon:SetAlpha(0, 0)
		end
	else
		if arg_8_1.usingGamepad ~= arg_8_0._playerData.usingGamepad then
			arg_8_0.InputImage:SetAlpha(arg_8_1.usingGamepad and 0.75 or 0, 0)
		end

		if arg_8_1.isPartyHost ~= arg_8_0._playerData.isPartyHost or arg_8_1.role ~= arg_8_0._playerData.role then
			local var_8_0 = arg_8_1.isPartyHost or arg_8_1.role == OnlineClanRole.OWNER or arg_8_1.role == OnlineClanRole.OFFICER

			arg_8_0.PartyLeaderIcon:SetAlpha(var_8_0 and 0.75 or 0, 0)
		end
	end
end

local function var_0_5(arg_9_0, arg_9_1)
	arg_9_0.ActionLabel:SetAlpha(1)
	arg_9_0.ActionLabel:setText(arg_9_1)

	if IsLanguageArabic() then
		local var_9_0 = LAYOUT.GetTextWidth(arg_9_0.ActionLabel)
		local var_9_1 = arg_9_0.FullName:GetCurrentAnchorsAndPositions().left
		local var_9_2 = 8 * _1080p

		arg_9_0.ActionLabel:SetLeft(var_9_1)
		arg_9_0.StatusText:SetLeft(var_9_1 + var_9_0 + var_9_2)
	else
		local var_9_3 = LAYOUT.GetTextWidth(arg_9_0.StatusText)
		local var_9_4 = arg_9_0.StatusText:GetCurrentAnchorsAndPositions().left
		local var_9_5 = 8 * _1080p

		arg_9_0.ActionLabel:SetLeft(var_9_4 + var_9_3 + var_9_5)
	end
end

local function var_0_6(arg_10_0, arg_10_1)
	if not arg_10_1 then
		return
	end

	local var_10_0 = var_0_3(arg_10_0, arg_10_1)
	local var_10_1 = CONDITIONS.IsBattleNet() and arg_10_1.friendsListType == FRIENDS.FriendsListType.FIRST_PARTY

	arg_10_0.PlayerStatus:SetOnlineStatus(var_10_0)

	arg_10_1.onlineStatus = var_10_0

	local var_10_2 = arg_10_1.fullName

	if Engine.DDHAAEGIEI(arg_10_0._controllerIndex) and arg_10_1.fullNameWithHash and #arg_10_1.fullNameWithHash > 0 then
		var_10_2 = arg_10_1.fullNameWithHash
	end

	if var_10_2 ~= nil then
		if var_10_1 then
			if arg_10_1.crossplayGamertag ~= nil and arg_10_1.crossplayGamertag ~= "" then
				var_10_2 = arg_10_1.crossplayGamertag
			else
				arg_10_0.PlatformIcon:SetAlpha(0)

				var_10_2 = FRIENDS.TryAppendRealIdToBattleTag(arg_10_1.platformId, var_10_2)
			end
		end

		arg_10_0.FullName:setText(var_10_2)
	end

	arg_10_0.ActionLabel:SetAlpha(0)

	if arg_10_1.lastMetInfo then
		arg_10_0.StatusText:setText(arg_10_1.lastMetInfo)
	elseif arg_10_1.timeInfo then
		arg_10_0.StatusText:setText(arg_10_1.timeInfo)
	elseif arg_10_1.joinable ~= nil then
		local var_10_3 = arg_10_1.joinable and Engine.CBBHFCGDIC("MENU/JOINABLE") or Engine.CBBHFCGDIC("MENU/NOT_JOINABLE")

		if arg_10_1.presence == nil or #arg_10_1.presence == 0 or arg_10_1.onlineStatus == BattleNetOnlineStatus.APPEAR_OFFLINE then
			var_10_3 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")
		end

		arg_10_0.StatusText:setText(var_10_3)

		if not Engine.HDGDBCJFG() then
			if arg_10_1.crossplayGamertag ~= nil and arg_10_1.crossplayGamertag ~= "" then
				arg_10_0.BNetFriendName:setText(FRIENDS.TryAppendRealIdToBattleTag(arg_10_1.platformId, arg_10_1.fullName))
				arg_10_0.BNetFriendName:SetAlpha(1)
				arg_10_0.BNetFriendIcon:SetAlpha(1)
			else
				arg_10_0.BNetFriendName:SetAlpha(0)
				arg_10_0.BNetFriendIcon:SetAlpha(0)
			end
		end
	else
		arg_10_0.StatusText:SetAlpha(0)
	end

	local var_10_4 = arg_10_0._tabID == FRIENDS.TabIDs.PRIVATE_PARTY and arg_10_0._subTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS and CONDITIONS.InFrontend()

	arg_10_1.showPlatformIcon = (arg_10_0._tabID == FRIENDS.TabIDs.FRIENDS or var_10_4) and arg_10_1.isAtviFriend ~= nil

	if arg_10_1.showPlatformIcon then
		arg_10_0.PlatformIcon:SetAlpha(0.75)

		if arg_10_1.isAtviFriend then
			arg_10_0.PlatformIcon:setImage(RegisterMaterial("icon_social_friend_atvi"))
		else
			local var_10_5 = Engine.CBBFHGEDGJ()
			local var_10_6 = FRIENDS.PlatformIcon[var_10_5]

			arg_10_0.PlatformIcon:setImage(RegisterMaterial(var_10_6))
		end
	else
		arg_10_0.PlatformIcon:SetAlpha(0)
	end

	if arg_10_1.emblemIndex then
		local var_10_7 = EmblemEditorUtils.GetEmblemImageFromID(arg_10_1.emblemIndex)

		arg_10_0.Emblem:setImage(RegisterMaterial(var_10_7))
		arg_10_0.Emblem:SetAlpha(1)
	else
		arg_10_0.Emblem:SetAlpha(0)
	end

	if arg_10_1.usingGamepad ~= nil then
		arg_10_0.InputImage:setImage(RegisterMaterial(arg_10_1.usingGamepad and "icon_platform_controller" or "icon_platform_mousekeyboard"))
	end

	if arg_10_1.isPartyHost then
		-- block empty
	elseif arg_10_1.role == OnlineClanRole.OWNER then
		arg_10_0.PartyLeaderIcon:setImage(RegisterMaterial("icon_regiments_leader"))
	elseif arg_10_1.role == OnlineClanRole.OFFICER then
		arg_10_0.PartyLeaderIcon:setImage(RegisterMaterial("icon_regiments_officer"))
	end

	if var_10_1 then
		arg_10_0.BnetGameIcon:SetAlpha(0)

		local var_10_8 = Social.CFEIHAADEI(arg_10_1.platformId)

		if var_10_8 and var_10_0 ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
			local var_10_9 = FRIENDS.BattleNetGameInfo[var_10_8.clientProgramID]

			if var_10_9 then
				arg_10_0.BnetGameIcon:setImage(RegisterMaterial(var_10_9.icon))
				arg_10_0.BnetGameIcon:SetAlpha(1)
			end
		end

		if not arg_10_1.isAtviFriend and not arg_10_1.crossplayGamertag then
			arg_10_0.Emblem:setImage(RegisterMaterial("icon_platform_pc"))
		end
	end

	arg_10_0:SetButtonDisabled(arg_10_1.locked)
	var_0_4(arg_10_0, arg_10_1)

	arg_10_0._playerData = arg_10_1

	var_0_1(arg_10_0)

	if arg_10_0:isInFocus() and arg_10_0.UpdatePlayerDetailsContent then
		if not arg_10_0._updatedForFocus then
			var_0_2(arg_10_0)
		else
			arg_10_0:UpdatePlayerDetailsContent(arg_10_0._playerData)
		end
	end
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_1)

	if not arg_11_0._tabID then
		arg_11_0._tabID = arg_11_1
		arg_11_0._subTabID = arg_11_2

		if arg_11_0._subTabID == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
			arg_11_0.StatusText:SetAlpha(0)
		else
			arg_11_0.StatusText:SetAlpha(1)
		end
	end
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.FullName)

	arg_12_0.SetupPlayerData = var_0_6
	arg_12_0.SetCurrentLocation = var_0_7
	arg_12_0._controllerIndex = arg_12_1
	arg_12_0._showPlatform = false

	if CONDITIONS.IsBattleNet() then
		ACTIONS.AnimateSequence(arg_12_0, "PC")
		arg_12_0.BNetFriendName:SetAlpha(0)
		arg_12_0.BNetFriendIcon:SetAlpha(0)
	end

	arg_12_0._currentPlatform = Engine.CBBFHGEDGJ()

	if not arg_12_0.bindButton then
		local var_12_0 = LUI.UIBindButton.new()

		var_12_0.id = "bindButton"

		arg_12_0:addElement(var_12_0)

		arg_12_0.bindButton = var_12_0
	end

	arg_12_0:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		if arg_12_0._playerData then
			FRIENDS.GetPlayerButtonAction(arg_12_0._playerData, arg_12_0._tabID, arg_12_0._subTabID)(arg_13_0, arg_13_1)
		end
	end)
	arg_12_0:addEventHandler("lose_focus", function()
		arg_12_0:dispatchEventToCurrentMenu({
			name = "friend_card_lose_focus"
		})
	end)
	arg_12_0:addEventHandler("gain_focus", function()
		arg_12_0._updatedForFocus = false

		var_0_2(arg_12_0)
	end)
	arg_12_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if arg_12_0._showPlatform then
			arg_12_0.PlatformPresence:SetAlpha(1, 150)
		end

		if arg_12_0._playerData then
			if arg_12_0._playerData.usingGamepad then
				arg_12_0.InputImage:SetAlpha(1, 150)
			end

			if arg_12_0._playerData.showPlatformIcon then
				arg_12_0.PlatformIcon:SetAlpha(1, 150)
			end

			if arg_12_0._playerData.isPartyHost or arg_12_0._playerData.role == OnlineClanRole.OWNER or arg_12_0._playerData.role == OnlineClanRole.OFFICER then
				arg_12_0.PartyLeaderIcon:SetAlpha(1, 150)
			end
		end
	end)
	arg_12_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if arg_12_0._showPlatform then
			arg_12_0.PlatformPresence:SetAlpha(0.75, 150)
		end

		if arg_12_0._playerData then
			if arg_12_0._playerData.usingGamepad then
				arg_12_0.InputImage:SetAlpha(0.75, 150)
			end

			if arg_12_0._playerData.showPlatformIcon then
				arg_12_0.PlatformIcon:SetAlpha(0.75, 150)
			end

			if arg_12_0._playerData.isPartyHost or arg_12_0._playerData.role == OnlineClanRole.OWNER or arg_12_0._playerData.role == OnlineClanRole.OFFICER then
				arg_12_0.PartyLeaderIcon:SetAlpha(0.75, 150)
			end
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_12_0, "AR")
	end
end

function SocialFriendCard(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIButton.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 510 * _1080p, 0, 80 * _1080p)

	var_18_0.id = "SocialFriendCard"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "Background"

	var_18_4.TextGlow:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_18_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, 0, _1080p * 3, _1080p * -3)
	var_18_0:addElement(var_18_4)

	var_18_0.Background = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "Emblem"

	var_18_6:setImage(RegisterMaterial("ui_emblem_207"), 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 74, _1080p * 8, _1080p * 72)
	var_18_0:addElement(var_18_6)

	var_18_0.Emblem = var_18_6

	local var_18_7

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		var_18_7 = LUI.UIImage.new()
		var_18_7.id = "BNetFriendIcon"

		var_18_7:setImage(RegisterMaterial("icon_platform_pc"), 0)
		var_18_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 96, _1080p * 56, _1080p * 72)
		var_18_0:addElement(var_18_7)

		var_18_0.BNetFriendIcon = var_18_7
	end

	local var_18_8

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		var_18_8 = LUI.UIText.new()
		var_18_8.id = "BNetFriendName"

		var_18_8:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
		var_18_8:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
		var_18_8:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		var_18_8:SetWordWrap(false)
		var_18_8:SetAlignment(LUI.Alignment.Left)
		var_18_8:SetOptOutRightToLeftAlignmentFlip(true)
		var_18_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 102, _1080p * 218, _1080p * -25, _1080p * -9)
		var_18_0:addElement(var_18_8)

		var_18_0.BNetFriendName = var_18_8
	end

	local var_18_9
	local var_18_10 = LUI.UIStyledText.new()

	var_18_10.id = "FullName"

	var_18_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_18_10:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_18_10:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_18_10:SetWordWrap(false)
	var_18_10:SetAlignment(LUI.Alignment.Left)
	var_18_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_10:SetUseEllipses(ELLIPSES.enabled_default)
	var_18_10:SetShadowRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_18_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 80, _1080p * -38, _1080p * 10, _1080p * 32)
	var_18_0:addElement(var_18_10)

	var_18_0.FullName = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIStyledText.new()

	var_18_12.id = "StatusText"

	var_18_12:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_18_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_12:SetWordWrap(false)
	var_18_12:SetAlignment(LUI.Alignment.Left)
	var_18_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_12:SetUseEllipses(ELLIPSES.enabled_default)
	var_18_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 80, _1080p * 385, _1080p * -46, _1080p * -28)

	local function var_18_13()
		local var_19_0 = var_18_0:GetDataSource().joinable:GetValue(var_18_1)

		if var_19_0 ~= nil then
			var_18_12:setText(var_19_0, 0)
		end
	end

	var_18_12:SubscribeToModelThroughElement(var_18_0, "joinable", var_18_13)
	var_18_0:addElement(var_18_12)

	var_18_0.StatusText = var_18_12

	local var_18_14
	local var_18_15 = MenuBuilder.BuildRegisteredType("SocialPlayerStatus", {
		controllerIndex = var_18_1
	})

	var_18_15.id = "PlayerStatus"

	var_18_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -33, _1080p * -13, _1080p * 10, _1080p * 30)
	var_18_0:addElement(var_18_15)

	var_18_0.PlayerStatus = var_18_15

	local var_18_16

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		local var_18_17 = LUI.UIImage.new()

		var_18_17.id = "BnetGameIcon"

		var_18_17:SetAlpha(0, 0)
		var_18_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -90, _1080p * -46, _1080p * -22, _1080p * 22)
		var_18_0:addElement(var_18_17)

		var_18_0.BnetGameIcon = var_18_17
	end

	local var_18_18
	local var_18_19 = LUI.UIImage.new()

	var_18_19.id = "PlatformIcon"

	var_18_19:SetAlpha(0, 0)
	var_18_19:setImage(RegisterMaterial("icon_social_friend_atvi"), 0)
	var_18_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -38, _1080p * -8, _1080p * 40, _1080p * 70)
	var_18_0:addElement(var_18_19)

	var_18_0.PlatformIcon = var_18_19

	local var_18_20
	local var_18_21 = LUI.UIImage.new()

	var_18_21.id = "InputImage"

	var_18_21:SetAlpha(0, 0)
	var_18_21:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_18_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 112, _1080p * 40, _1080p * 72)
	var_18_0:addElement(var_18_21)

	var_18_0.InputImage = var_18_21

	local var_18_22
	local var_18_23 = LUI.UIImage.new()

	var_18_23.id = "PartyLeaderIcon"

	var_18_23:SetAlpha(0, 0)
	var_18_23:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_18_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -39, _1080p * -7, _1080p * 38, _1080p * 70)
	var_18_0:addElement(var_18_23)

	var_18_0.PartyLeaderIcon = var_18_23

	local var_18_24
	local var_18_25 = LUI.UIText.new()

	var_18_25.id = "ActionLabel"

	var_18_25:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_18_25:setText(Engine.CBBHFCGDIC("MENU/ACCEPT"), 0)
	var_18_25:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_18_25:SetWordWrap(false)
	var_18_25:SetAlignment(LUI.Alignment.Left)
	var_18_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_25:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 218, _1080p * 334, _1080p * -45, _1080p * -29)
	var_18_0:addElement(var_18_25)

	var_18_0.ActionLabel = var_18_25

	local var_18_26

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		local var_18_27 = {}

		var_18_7:RegisterAnimationSequence("DefaultSequence", var_18_27)
	end

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		local var_18_28 = {}

		var_18_8:RegisterAnimationSequence("DefaultSequence", var_18_28)
	end

	local function var_18_29()
		if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
			var_18_7:AnimateSequence("DefaultSequence")
		end

		if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
			var_18_8:AnimateSequence("DefaultSequence")
		end
	end

	var_18_0._sequences.DefaultSequence = var_18_29

	local var_18_30

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		local var_18_31 = {
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			}
		}

		var_18_8:RegisterAnimationSequence("ButtonOver", var_18_31)
	end

	local var_18_32 = {
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

	var_18_10:RegisterAnimationSequence("ButtonOver", var_18_32)

	local var_18_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonOver", var_18_33)

	local var_18_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_18_25:RegisterAnimationSequence("ButtonOver", var_18_34)

	local function var_18_35()
		if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
			var_18_8:AnimateSequence("ButtonOver")
		end

		var_18_10:AnimateSequence("ButtonOver")
		var_18_12:AnimateSequence("ButtonOver")
		var_18_25:AnimateSequence("ButtonOver")
	end

	var_18_0._sequences.ButtonOver = var_18_35

	local var_18_36

	if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
		local var_18_37 = {
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.AAR.AARdescription
			}
		}

		var_18_8:RegisterAnimationSequence("ButtonUp", var_18_37)
	end

	local var_18_38 = {
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

	var_18_10:RegisterAnimationSequence("ButtonUp", var_18_38)

	local var_18_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUp", var_18_39)

	local var_18_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_18_25:RegisterAnimationSequence("ButtonUp", var_18_40)

	local function var_18_41()
		if not Engine.HDGDBCJFG() and CONDITIONS.IsBattleNet(var_18_0) then
			var_18_8:AnimateSequence("ButtonUp")
		end

		var_18_10:AnimateSequence("ButtonUp")
		var_18_12:AnimateSequence("ButtonUp")
		var_18_25:AnimateSequence("ButtonUp")
	end

	var_18_0._sequences.ButtonUp = var_18_41

	local var_18_42
	local var_18_43 = {
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

	var_18_10:RegisterAnimationSequence("AR", var_18_43)

	local var_18_44 = {
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

	var_18_12:RegisterAnimationSequence("AR", var_18_44)

	local var_18_45 = {
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

	var_18_25:RegisterAnimationSequence("AR", var_18_45)

	local function var_18_46()
		var_18_10:AnimateSequence("AR")
		var_18_12:AnimateSequence("AR")
		var_18_25:AnimateSequence("AR")
	end

	var_18_0._sequences.AR = var_18_46

	var_18_0:addEventHandler("button_over", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_18_1
		end

		ACTIONS.AnimateSequence(var_18_0, "ButtonOver")
	end)
	var_18_0:addEventHandler("button_up", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_18_1
		end

		ACTIONS.AnimateSequence(var_18_0, "ButtonUp")
	end)
	var_0_8(var_18_0, var_18_1, arg_18_1)
	ACTIONS.AnimateSequence(var_18_0, "DefaultSequence")

	return var_18_0
end

MenuBuilder.registerType("SocialFriendCard", SocialFriendCard)
LockTable(_M)
