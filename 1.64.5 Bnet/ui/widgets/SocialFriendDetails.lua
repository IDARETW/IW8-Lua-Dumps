module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1.valid then
		if arg_1_1.background ~= nil then
			local var_1_0 = CallingCardUtils.GetCardTexture(arg_1_1.background)

			if var_1_0 ~= nil and type(var_1_0) == "string" and var_1_0 ~= "" then
				arg_1_0.Background:setImage(RegisterMaterial(var_1_0))
				arg_1_0.Background:SetAlpha(1)
			else
				arg_1_0.Background:SetAlpha(0)
			end
		else
			arg_1_0.Background:SetAlpha(0)
		end

		if arg_1_1.frame ~= nil then
			local var_1_1 = CallingCardFramesUtils.GetFrameTexture(arg_1_1.frame)

			if var_1_1 ~= nil and type(var_1_1) == "string" and var_1_1 ~= "" then
				arg_1_0.Frame:setImage(RegisterMaterial(var_1_1))
				arg_1_0.Frame:SetAlpha(1)
			else
				arg_1_0.Frame:SetAlpha(0)
			end
		else
			arg_1_0.Frame:SetAlpha(0)
		end

		if arg_1_1.title ~= nil then
			local var_1_2 = PlayerTitleUtils.GetTitleNameFromID(arg_1_1.title)

			if var_1_2 == PlayerTitleUtils.GetTitleNameFromID(PlayerTitleUtils.DefaultTitleID) then
				arg_1_0.PlayerTitle:SetAlpha(0)
				arg_1_0.TitleBacker:SetAlpha(0)
			else
				arg_1_0.PlayerTitle:SetAlpha(1)
				arg_1_0.TitleBacker:SetAlpha(0.5)
				arg_1_0.PlayerTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_1_2)))
			end
		else
			arg_1_0.PlayerTitle:SetAlpha(0)
			arg_1_0.TitleBacker:SetAlpha(0)
		end

		if arg_1_1.emblemIndex ~= nil then
			local var_1_3 = EmblemEditorUtils.GetEmblemImageFromID(arg_1_1.emblemIndex)

			arg_1_0.Emblem:setImage(RegisterMaterial(var_1_3))
		end
	end

	local var_1_4 = arg_1_1.fullName

	if CONDITIONS.IsDisplayNameTag() and Engine.DDHAAEGIEI(arg_1_0._controllerIndex) and arg_1_1.fullNameWithHash and #arg_1_1.fullNameWithHash > 0 then
		var_1_4 = arg_1_1.fullNameWithHash
	end

	if var_1_4 ~= nil then
		if CONDITIONS.IsBattleNet() and arg_1_1.friendsListType == FRIENDS.FriendsListType.FIRST_PARTY and not arg_1_1.isAtviFriend then
			if arg_1_1.crossplayGamertag ~= nil and arg_1_1.crossplayGamertag ~= "" then
				var_1_4 = arg_1_1.crossplayGamertag
			else
				var_1_4 = FRIENDS.TryAppendRealIdToBattleTag(arg_1_1.platformId, var_1_4)
			end
		end

		arg_1_0.FullName:setText(var_1_4)
	end

	if arg_1_1.baseRank and arg_1_1.prestige then
		local var_1_5 = arg_1_1.baseRank
		local var_1_6 = PROGRESSION.ValidatePrestigeLevel(arg_1_1.prestige, {
			_isBackendPrestigeLevel = true
		})
		local var_1_7 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = var_1_5,
			_prestigeLevel = var_1_6
		})

		arg_1_0.RankIcon:SetAlpha(1)
		arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_7._rankIcon))
		arg_1_0.RankNumber:SetAlpha(1)
		arg_1_0.RankNumber:setText(CONDITIONS.IsFifthWheelActive() and Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_1_7._rankDisplay)) or var_1_7._rankDisplay)
		arg_1_0.RankNumber:SetRGBFromTable(var_1_7._prestigeMasterColor)

		if CONDITIONS.IsFifthWheelActive() then
			if var_1_7._isUsingSeasonalRank then
				arg_1_0.PrestigeNumber:SetAlpha(1)
				arg_1_0.PrestigeNumber:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/PRESTIGE_VALUE", var_1_7._prestige)))
			else
				arg_1_0.PrestigeNumber:SetAlpha(0)
			end

			local var_1_8 = PROGRESSION.GetPlayerProgressionData({
				_controllerIndex = arg_1_0._controllerIndex
			})
			local var_1_9 = arg_1_1.isMyPlayer and var_1_8._prestigeMasterLevel or PROGRESSION.MASTER_LEVEL.INVALID_LEVEL

			if var_1_9 and var_1_9 ~= PROGRESSION.MASTER_LEVEL.INVALID_LEVEL then
				arg_1_0.PrestigeMaster:SetAlpha(1)
				arg_1_0.PrestigeMasterRibbon:SetAlpha(1)
				arg_1_0.PrestigeMaster:SetRGBFromTable(var_1_8._prestigeMasterColor)
				arg_1_0.PrestigeMasterRibbon:setImage(RegisterMaterial(var_1_8._prestigeMasterRibbon))
				arg_1_0.CareerPrestigeEarned:SetAlpha(1)

				local var_1_10 = PROGRESSION.GetPlayerCareerPrestigeLevel(arg_1_0._controllerIndex)
				local var_1_11 = Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CAREER_EARNED", var_1_10)

				arg_1_0.CareerPrestigeEarned:setText(var_1_11)
			else
				arg_1_0.PrestigeMaster:SetAlpha(0)
				arg_1_0.PrestigeMasterRibbon:SetAlpha(0)
				arg_1_0.PrestigeMaster:SetRGBFromTable(SWATCHES.genericButton.description)
				arg_1_0.CareerPrestigeEarned:SetAlpha(0)
			end
		end
	else
		arg_1_0.RankIcon:SetAlpha(0)
		arg_1_0.RankNumber:SetAlpha(0)
	end

	local var_1_12 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")

	if arg_1_1.presence ~= nil and #arg_1_1.presence > 0 and arg_1_1.onlineStatus ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
		var_1_12 = Engine.JCBDICCAH(arg_1_1.presence)
	end

	local var_1_13 = arg_1_1.joinable and Engine.CBBHFCGDIC("MENU/JOINABLE") or Engine.CBBHFCGDIC("MENU/NOT_JOINABLE")

	if CONDITIONS.IsFifthWheelActive() then
		if not arg_1_1.isOnline then
			ACTIONS.AnimateSequence(arg_1_0, "OfflinePlayer")
		else
			ACTIONS.AnimateSequence(arg_1_0, "OnlinePlayer")

			if var_1_12 ~= arg_1_0.GamemodeLabel:getText() then
				arg_1_0.GamemodeLabel:setText(var_1_12)
			end

			arg_1_0.JoinableText:setText(var_1_13)

			local var_1_14

			if PresenceTitle.MODERN_WARFARE == arg_1_1.presenceTitle then
				var_1_14 = LUI.GAME_SOURCE_ID.MODERN_WARFARE
			elseif PresenceTitle.MODERN_WARFARE_WARZONE == arg_1_1.presenceTitle then
				var_1_14 = LUI.GAME_SOURCE_ID.WARZONE
			elseif PresenceTitle.BLACK_OPS_5 == arg_1_1.presenceTitle then
				var_1_14 = LUI.GAME_SOURCE_ID.COLD_WAR
			elseif PresenceTitle.VANGUARD == arg_1_1.presenceTitle then
				var_1_14 = LUI.GAME_SOURCE_ID.VANGUARD
			end

			if var_1_14 and arg_1_1.onlineStatus ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
				arg_1_0.WZSnipeIcon:UpdateSnipeIcon({
					selected = true,
					gameSourceID = var_1_14,
					alignment = LUI.Alignment.Left
				})

				local var_1_15

				if LUI.GAME_SOURCE_ID.COLD_WAR == var_1_14 then
					var_1_15 = FRIENDS.BattleNetGameInfo.ZEUS
				elseif LUI.GAME_SOURCE_ID.MODERN_WARFARE == var_1_14 then
					var_1_15 = FRIENDS.BattleNetGameInfo.ODIN
				elseif LUI.GAME_SOURCE_ID.WARZONE == var_1_14 then
					var_1_15 = FRIENDS.BattleNetGameInfo.ODIN
				elseif LUI.GAME_SOURCE_ID.VANGUARD == var_1_14 then
					var_1_15 = FRIENDS.BattleNetGameInfo.FORE
				end

				if var_1_15 then
					arg_1_0.GameLabel:setText(Engine.CBBHFCGDIC(var_1_15.name))
				else
					arg_1_0.GameLabel:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GAME_NAME"))
				end
			else
				arg_1_0.GameLabel:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GAME_NAME"))
			end

			if arg_1_1.timeInGame then
				arg_1_0.GameDetailsHeader:SetAlpha(1)
				arg_1_0.GameDetails:SetAlpha(1)

				local var_1_16 = Engine.BJCFFHAIFA(arg_1_1.timeInGame)

				arg_1_0.GameDetails:setText(var_1_16)
			else
				arg_1_0.GameDetailsHeader:SetAlpha(0)
				arg_1_0.GameDetails:SetAlpha(0)
			end
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "CompactLayout")

		if arg_1_2 == FRIENDS.TabIDs.FRIENDS or arg_1_2 == FRIENDS.TabIDs.RECENT_PLAYERS or arg_1_2 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
			local var_1_17 = Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_12, var_1_13)

			if var_1_17 ~= arg_1_0.GamemodeLabel:getText() then
				arg_1_0.GamemodeLabel:setText(var_1_17)
			end
		else
			arg_1_0.GamemodeLabel:setText("")
		end
	end

	if CONDITIONS.IsClanUIEnabled() then
		if arg_1_1.clanDetails then
			local var_1_18 = Clans2.CFDHGBFICH(arg_1_0._controllerIndex, arg_1_1.clanDetails.clanId, arg_1_1.xuid)
			local var_1_19 = CLANS.GetClanMemberRoleIconByRole(var_1_18)

			if var_1_19 and var_1_19.roleText then
				arg_1_0.ClanStatus:setText(Engine.CBBHFCGDIC(var_1_19.roleText, Engine.JCBDICCAH("[" .. arg_1_1.clanDetails.clanTag .. "]")))
				arg_1_0.ClanStatus:SetAlpha(1)
			else
				arg_1_0.ClanStatus:SetAlpha(0)
			end

			if var_1_19 and var_1_19.icon and var_1_19.icon ~= "" then
				arg_1_0.ClanStatusIcon:setImage(RegisterMaterial(var_1_19.icon))
				arg_1_0.ClanStatusIcon:SetAlpha(1)
			else
				arg_1_0.ClanStatusIcon:SetAlpha(0)
			end
		else
			local var_1_20 = CLANS.CLAN_DATA.GetXUIDClanData(arg_1_0._controllerIndex, arg_1_1.xuid, arg_1_0)

			if var_1_20 then
				arg_1_0:SetClanMemberStatus(var_1_20)
			else
				arg_1_0:ClearClanMemberStatus(var_1_20)
			end
		end
	end

	if CONDITIONS.IsLaze() then
		if arg_1_1.presencePlatform == PresencePlatform.STEAM then
			var_1_13 = arg_1_1.joinable and Engine.CBBHFCGDIC("MENU/OTHER_GAME") or Engine.CBBHFCGDIC("MENU/NOT_JOINABLE")

			if arg_1_1.presence == nil or #arg_1_1.presence == 0 or arg_1_1.onlineStatus == BattleNetOnlineStatus.APPEAR_OFFLINE then
				var_1_13 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")
			end
		end

		arg_1_0.InOtherGameText:setText(var_1_13)
	end

	ACTIONS.AnimateSequence(arg_1_0, arg_1_1.ownsVG and "ShowVanguardOwner" or "NotVanguardOwner")
end

local function var_0_1(arg_2_0, arg_2_1)
	CLANS.DisplayClanMemberStatus(arg_2_0.ClanStatus, arg_2_0.ClanStatusIcon, arg_2_0._controllerIndex, arg_2_1)
end

local function var_0_2(arg_3_0)
	CLANS.DisplayClanMemberStatus(arg_3_0.ClanStatus, arg_3_0.ClanStatusIcon, arg_3_0._controllerIndex, nil)
end

local function var_0_3(arg_4_0, arg_4_1)
	ACTIONS.AnimateSequence(arg_4_0, "ShowOnlineStatus")
	arg_4_0.OnlineStatusText:setText(Engine.CBBHFCGDIC(FRIENDS.onlineStatusToString[arg_4_1.onlineStatus]))
	arg_4_0.PlayerStatus:SetOnlineStatus(arg_4_1.onlineStatus)

	local var_4_0 = 8 * _1080p
	local var_4_1 = LAYOUT.GetTextWidth(arg_4_0.OnlineStatusText)
	local var_4_2 = arg_4_0.OnlineStatusText:GetCurrentAnchorsAndPositions().right
	local var_4_3 = LAYOUT.GetElementWidth(arg_4_0.PlayerStatus)

	arg_4_0.PlayerStatus:SetRight(var_4_2 - var_4_1 - var_4_0)
	arg_4_0.PlayerStatus:SetLeft(var_4_2 - var_4_1 - var_4_0 - var_4_3)
end

local function var_0_4(arg_5_0, arg_5_1)
	ACTIONS.AnimateSequence(arg_5_0, arg_5_1 and "ShowLeaderInfo" or "HideLeaderInfo")
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_3 and arg_6_3.textColor or SWATCHES.WZGlobalSwatches.WZDescription
	local var_6_1 = arg_6_3 and arg_6_3.isLocalized or false

	arg_6_0.LeaderImage:setImage(RegisterMaterial(arg_6_1))
	arg_6_0.LeaderImage:SetRGBFromTable(var_6_0)
	arg_6_0.LeaderText:setText(var_6_1 and arg_6_2 or Engine.CBBHFCGDIC(arg_6_2))
end

local function var_0_6(arg_7_0, arg_7_1)
	local var_7_0 = true

	if arg_7_1.isPartyHost then
		var_0_5(arg_7_0, "icon_party_leader_crown", "MPUI/PARTY_LEADER")
	elseif arg_7_1.role == OnlineClanRole.OWNER then
		var_0_5(arg_7_0, "icon_regiments_leader", "LUA_MENU/REGIMENT_LEADER")
	elseif arg_7_1.role == OnlineClanRole.OFFICER then
		var_0_5(arg_7_0, "icon_regiments_officer", "LUA_MENU/REGIMENT_OFFICER")
	elseif arg_7_1.showPlatformIcon and arg_7_1.isAtviFriend then
		var_0_5(arg_7_0, "icon_social_friend_atvi", "LUA_MENU/ACTIVISION_FRIEND")
	elseif arg_7_1.showPlatformIcon then
		local var_7_1 = FRIENDS.GetFriendPlatformId(arg_7_1)

		var_7_0 = var_7_1 > 0

		if var_7_0 then
			local var_7_2 = FRIENDS.PlatformIcon[var_7_1]
			local var_7_3 = FRIENDS.PlatformFriendText[var_7_1]

			var_0_5(arg_7_0, var_7_2, var_7_3, {
				isLocalized = true,
				textColor = COLORS.white
			})
		end
	else
		var_7_0 = false
	end

	var_0_4(arg_7_0, var_7_0)
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0.SetupPlayerDetails = var_0_0
	arg_8_0.SetClanMemberStatus = var_0_1
	arg_8_0.ClearClanMemberStatus = var_0_2
	arg_8_0.UpdateOnlineStatus = var_0_3
	arg_8_0.SetLeaderIconAndLabelEnabled = var_0_4
	arg_8_0.SetLeaderIconAndLabel = var_0_5
	arg_8_0.UpdateLeaderIconAndText = var_0_6
end

function SocialFriendDetails(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 665 * _1080p)

	var_9_0.id = "SocialFriendDetails"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Background"

	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 121, _1080p * 500, _1080p * 82, _1080p * 182)

	local function var_9_5()
		local var_10_0 = var_9_0:GetDataSource().DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.background:GetValue(var_9_1)

		if var_10_0 ~= nil then
			var_9_4:setImage(RegisterMaterial(var_10_0), 0)
		end
	end

	var_9_4:SubscribeToModelThroughElement(var_9_0, "DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.background", var_9_5)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_6
	local var_9_7 = LUI.UIImage.new()

	var_9_7.id = "Frame"

	var_9_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 121, _1080p * 500, _1080p * 82, _1080p * 182)
	var_9_0:addElement(var_9_7)

	var_9_0.Frame = var_9_7

	local var_9_8
	local var_9_9 = LUI.UIImage.new()

	var_9_9.id = "TitleBacker"

	var_9_9:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_9:SetAlpha(0.5, 0)
	var_9_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 124, _1080p * 427, _1080p * 157, _1080p * 179)
	var_9_0:addElement(var_9_9)

	var_9_0.TitleBacker = var_9_9

	local var_9_10
	local var_9_11 = LUI.UIStyledText.new()

	var_9_11.id = "PlayerTitle"

	var_9_11:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_9_11:setText(ToUpperCase(""), 0)
	var_9_11:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_9_11:SetAlignment(LUI.Alignment.Left)
	var_9_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 129, _1080p * 427, _1080p * 154, _1080p * 176)
	var_9_0:addElement(var_9_11)

	var_9_0.PlayerTitle = var_9_11

	local var_9_12
	local var_9_13 = LUI.UIImage.new()

	var_9_13.id = "Emblem"

	var_9_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 110, _1080p * 82, _1080p * 182)

	local function var_9_14()
		local var_11_0 = var_9_0:GetDataSource().DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.emblem:GetValue(var_9_1)

		if var_11_0 ~= nil then
			var_9_13:setImage(RegisterMaterial(var_11_0), 0)
		end
	end

	var_9_13:SubscribeToModelThroughElement(var_9_0, "DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.emblem", var_9_14)
	var_9_0:addElement(var_9_13)

	var_9_0.Emblem = var_9_13

	local var_9_15
	local var_9_16 = LUI.UIStyledText.new()

	var_9_16.id = "FullName"

	var_9_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_16:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_9_16:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
	var_9_16:SetWordWrap(false)
	var_9_16:SetAlignment(LUI.Alignment.Left)
	var_9_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 500, _1080p * 26, _1080p * 48)
	var_9_0:addElement(var_9_16)

	var_9_0.FullName = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIText.new()

	var_9_18.id = "RankNumber"

	var_9_18:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_18:setText("80", 0)
	var_9_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_18:SetWordWrap(false)
	var_9_18:SetAlignment(LUI.Alignment.Left)
	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 238, _1080p * 510, _1080p * 332, _1080p * 368)
	var_9_0:addElement(var_9_18)

	var_9_0.RankNumber = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIImage.new()

	var_9_20.id = "RankIcon"

	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 129, _1080p * 219, _1080p * 336, _1080p * 418)
	var_9_0:addElement(var_9_20)

	var_9_0.RankIcon = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIImage.new()

	var_9_22.id = "Divider"

	var_9_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 510, _1080p * 312, _1080p * 311)
	var_9_0:addElement(var_9_22)

	var_9_0.Divider = var_9_22

	local var_9_23
	local var_9_24 = LUI.UIImage.new()

	var_9_24.id = "Divider2"

	var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 510, _1080p * 437, _1080p * 436)
	var_9_0:addElement(var_9_24)

	var_9_0.Divider2 = var_9_24

	local var_9_25
	local var_9_26 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_9_1
	})

	var_9_26.id = "WZSnipeIcon"

	var_9_26:SetScale(-0.5, 0)
	var_9_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -93, _1080p * 319, _1080p * 428, _1080p * 475)
	var_9_0:addElement(var_9_26)

	var_9_0.WZSnipeIcon = var_9_26

	local var_9_27
	local var_9_28 = LUI.UIStyledText.new()

	var_9_28.id = "CareerPrestigeEarned"

	var_9_28:SetRGBFromTable(SWATCHES.CH2.OperatorFilterEnabled, 0)
	var_9_28:SetAlpha(0.8, 0)
	var_9_28:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CAREER_EARNED"), 0)
	var_9_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_28:setTextStyle(CoD.TextStyle.Shadowed)
	var_9_28:SetWordWrap(false)
	var_9_28:SetAlignment(LUI.Alignment.Center)
	var_9_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_28:SetStartupDelay(1000)
	var_9_28:SetLineHoldTime(400)
	var_9_28:SetAnimMoveTime(1500)
	var_9_28:SetAnimMoveSpeed(1500)
	var_9_28:SetEndDelay(1000)
	var_9_28:SetCrossfadeTime(400)
	var_9_28:SetFadeInTime(300)
	var_9_28:SetFadeOutTime(300)
	var_9_28:SetMaxVisibleLines(1)
	var_9_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 118, _1080p * 548, _1080p * 79.5, _1080p * 103.5)
	var_9_0:addElement(var_9_28)

	var_9_0.CareerPrestigeEarned = var_9_28

	local var_9_29
	local var_9_30 = LUI.UIText.new()

	var_9_30.id = "PrestigeNumber"

	var_9_30:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_30:setText("PRESTIGE 99", 0)
	var_9_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_30:SetAlignment(LUI.Alignment.Left)
	var_9_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 238, _1080p * 510, _1080p * 320, _1080p * 336)
	var_9_0:addElement(var_9_30)

	var_9_0.PrestigeNumber = var_9_30

	local var_9_31
	local var_9_32 = LUI.UIImage.new()

	var_9_32.id = "PrestigeMasterRibbon"

	var_9_32:setImage(RegisterMaterial("ui_icon_prestige_master_01"), 0)
	var_9_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 238, _1080p * 366, _1080p * 386, _1080p * 418)
	var_9_0:addElement(var_9_32)

	var_9_0.PrestigeMasterRibbon = var_9_32

	local var_9_33
	local var_9_34 = LUI.UIText.new()

	var_9_34.id = "PrestigeMaster"

	var_9_34:SetRGBFromTable(SWATCHES.AAR.InfoHighlight, 0)
	var_9_34:setText(ToUpperCase(Engine.CBBHFCGDIC("PRESTIGE/PRESTIGE_MASTER")), 0)
	var_9_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_34:SetAlignment(LUI.Alignment.Left)
	var_9_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 238, _1080p * 510, _1080p * 368, _1080p * 386)
	var_9_0:addElement(var_9_34)

	var_9_0.PrestigeMaster = var_9_34

	local var_9_35
	local var_9_36 = LUI.UIText.new()

	var_9_36.id = "JoinableText"

	var_9_36:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_36:setText("Joinable", 0)
	var_9_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_36:SetAlignment(LUI.Alignment.Right)
	var_9_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 260, _1080p * 505, _1080p * 437, _1080p * 461)
	var_9_0:addElement(var_9_36)

	var_9_0.JoinableText = var_9_36

	local var_9_37
	local var_9_38 = LUI.UIText.new()

	var_9_38.id = "GameLabel"

	var_9_38:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_9_38:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GAME_NAME"), 0)
	var_9_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_38:SetAlignment(LUI.Alignment.Left)
	var_9_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 338, _1080p * 497, _1080p * 521)
	var_9_0:addElement(var_9_38)

	var_9_0.GameLabel = var_9_38

	local var_9_39
	local var_9_40 = LUI.UIStyledText.new()

	var_9_40.id = "GamemodeLabel"

	var_9_40:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_40:setText("Playing Gamemode on Mapname", 0)
	var_9_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_40:SetAlignment(LUI.Alignment.Left)
	var_9_40:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_40:SetStartupDelay(1000)
	var_9_40:SetLineHoldTime(500)
	var_9_40:SetAnimMoveTime(750)
	var_9_40:SetAnimMoveSpeed(50)
	var_9_40:SetEndDelay(1000)
	var_9_40:SetCrossfadeTime(400)
	var_9_40:SetFadeInTime(300)
	var_9_40:SetFadeOutTime(300)
	var_9_40:SetMaxVisibleLines(2)
	var_9_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 505, _1080p * 521, _1080p * 544)
	var_9_0:addElement(var_9_40)

	var_9_0.GamemodeLabel = var_9_40

	local var_9_41
	local var_9_42 = LUI.UIText.new()

	var_9_42.id = "PartyLabel"

	var_9_42:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_9_42:SetAlpha(0, 0)
	var_9_42:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_SIZE"), 0)
	var_9_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_42:SetAlignment(LUI.Alignment.Right)
	var_9_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 333, _1080p * 505, _1080p * 461, _1080p * 485)
	var_9_0:addElement(var_9_42)

	var_9_0.PartyLabel = var_9_42

	local var_9_43
	local var_9_44 = LUI.UIText.new()

	var_9_44.id = "PartySizeLabel"

	var_9_44:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_44:SetAlpha(0, 0)
	var_9_44:setText("1/4", 0)
	var_9_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_44:SetAlignment(LUI.Alignment.Right)
	var_9_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 505, _1080p * 485, _1080p * 509)
	var_9_0:addElement(var_9_44)

	var_9_0.PartySizeLabel = var_9_44

	local var_9_45
	local var_9_46 = LUI.UIText.new()

	var_9_46.id = "GameDetailsHeader"

	var_9_46:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_9_46:setText(Engine.CBBHFCGDIC("MENU/MATCH_TIME"), 0)
	var_9_46:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_46:SetAlignment(LUI.Alignment.Left)
	var_9_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 530, _1080p * 584, _1080p * 608)
	var_9_0:addElement(var_9_46)

	var_9_0.GameDetailsHeader = var_9_46

	local var_9_47
	local var_9_48 = LUI.UIText.new()

	var_9_48.id = "GameDetails"

	var_9_48:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_48:setText("00:01:23", 0)
	var_9_48:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_48:SetAlignment(LUI.Alignment.Left)
	var_9_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 530, _1080p * 608, _1080p * 632)
	var_9_0:addElement(var_9_48)

	var_9_0.GameDetails = var_9_48

	local var_9_49
	local var_9_50 = LUI.UIText.new()

	var_9_50.id = "ClanStatus"

	var_9_50:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_50:SetAlpha(0, 0)
	var_9_50:setText("", 0)
	var_9_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_50:SetAlignment(LUI.Alignment.Left)
	var_9_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 237, _1080p * 277, _1080p * 301)
	var_9_0:addElement(var_9_50)

	var_9_0.ClanStatus = var_9_50

	local var_9_51
	local var_9_52 = LUI.UIImage.new()

	var_9_52.id = "ClanStatusIcon"

	var_9_52:SetAlpha(0, 0)
	var_9_52:SetScale(0.5, 0)
	var_9_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 31, _1080p * 280, _1080p * 298)
	var_9_0:addElement(var_9_52)

	var_9_0.ClanStatusIcon = var_9_52

	local var_9_53
	local var_9_54 = LUI.UIImage.new()

	var_9_54.id = "VGOwner"

	var_9_54:SetAlpha(0.5, 0)
	var_9_54:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_9_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 42, _1080p * 194, _1080p * 226)
	var_9_0:addElement(var_9_54)

	var_9_0.VGOwner = var_9_54

	local var_9_55
	local var_9_56 = LUI.UIStyledText.new()

	var_9_56.id = "OnlineStatusText"

	var_9_56:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_9_56:SetAlpha(0, 0)
	var_9_56:setText(Engine.CBBHFCGDIC("LUA_MENU/OFFLINE"), 0)
	var_9_56:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_56:SetWordWrap(false)
	var_9_56:SetAlignment(LUI.Alignment.Right)
	var_9_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 432, _1080p * 497, _1080p * 198, _1080p * 222)
	var_9_0:addElement(var_9_56)

	var_9_0.OnlineStatusText = var_9_56

	local var_9_57
	local var_9_58 = MenuBuilder.BuildRegisteredType("SocialPlayerStatus", {
		controllerIndex = var_9_1
	})

	var_9_58.id = "PlayerStatus"

	var_9_58:SetAlpha(0, 0)
	var_9_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 402, _1080p * 426, _1080p * 198, _1080p * 222)
	var_9_0:addElement(var_9_58)

	var_9_0.PlayerStatus = var_9_58

	local var_9_59
	local var_9_60 = LUI.UIStyledText.new()

	var_9_60.id = "LeaderText"

	var_9_60:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_9_60:SetAlpha(0, 0)
	var_9_60:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER"), 0)
	var_9_60:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_60:SetAlignment(LUI.Alignment.Left)
	var_9_60:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 82, _1080p * 392, _1080p * 200, _1080p * 220)
	var_9_0:addElement(var_9_60)

	var_9_0.LeaderText = var_9_60

	local var_9_61
	local var_9_62 = LUI.UIImage.new()

	var_9_62.id = "LeaderImage"

	var_9_62:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_9_62:SetAlpha(0, 0)
	var_9_62:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_9_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 74, _1080p * 197, _1080p * 221)
	var_9_0:addElement(var_9_62)

	var_9_0.LeaderImage = var_9_62

	local var_9_63

	if CONDITIONS.IsLaze() then
		local var_9_64 = LUI.UIImage.new()

		var_9_64.id = "InOtherGameBackground"

		var_9_64:SetScale(0.5, 0)
		var_9_64:setImage(RegisterMaterial("wdg_InOtherGameBackground"), 0)
		var_9_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 46, _1080p * 192, _1080p * 232, _1080p * 253)
		var_9_0:addElement(var_9_64)

		var_9_0.InOtherGameBackground = var_9_64
	end

	local var_9_65

	if CONDITIONS.IsLaze() then
		local var_9_66 = LUI.UIText.new()

		var_9_66.id = "InOtherGameText"

		var_9_66:setText(Engine.CBBHFCGDIC("MENU/OTHER_GAME"), 0)
		var_9_66:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
		var_9_66:SetAlignment(LUI.Alignment.Center)
		var_9_66:SetVerticalAlignment(LUI.Alignment.Center)
		var_9_66:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 224, _1080p * 232, _1080p * 254)
		var_9_0:addElement(var_9_66)

		var_9_0.InOtherGameText = var_9_66
	end

	local function var_9_67()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_67

	local var_9_68
	local var_9_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("OfflinePlayer", var_9_69)

	local var_9_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("OfflinePlayer", var_9_70)

	local var_9_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("OfflinePlayer", var_9_71)

	local var_9_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_38:RegisterAnimationSequence("OfflinePlayer", var_9_72)

	local var_9_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_40:RegisterAnimationSequence("OfflinePlayer", var_9_73)

	local var_9_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_42:RegisterAnimationSequence("OfflinePlayer", var_9_74)

	local var_9_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_44:RegisterAnimationSequence("OfflinePlayer", var_9_75)

	local var_9_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_46:RegisterAnimationSequence("OfflinePlayer", var_9_76)

	local var_9_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_48:RegisterAnimationSequence("OfflinePlayer", var_9_77)

	local function var_9_78()
		var_9_24:AnimateSequence("OfflinePlayer")
		var_9_26:AnimateSequence("OfflinePlayer")
		var_9_36:AnimateSequence("OfflinePlayer")
		var_9_38:AnimateSequence("OfflinePlayer")
		var_9_40:AnimateSequence("OfflinePlayer")
		var_9_42:AnimateSequence("OfflinePlayer")
		var_9_44:AnimateSequence("OfflinePlayer")
		var_9_46:AnimateSequence("OfflinePlayer")
		var_9_48:AnimateSequence("OfflinePlayer")
	end

	var_9_0._sequences.OfflinePlayer = var_9_78

	local var_9_79
	local var_9_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("OnlinePlayer", var_9_80)

	local var_9_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("OnlinePlayer", var_9_81)

	local var_9_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("OnlinePlayer", var_9_82)

	local var_9_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_38:RegisterAnimationSequence("OnlinePlayer", var_9_83)

	local var_9_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_40:RegisterAnimationSequence("OnlinePlayer", var_9_84)

	local var_9_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_46:RegisterAnimationSequence("OnlinePlayer", var_9_85)

	local var_9_86 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_48:RegisterAnimationSequence("OnlinePlayer", var_9_86)

	local function var_9_87()
		var_9_24:AnimateSequence("OnlinePlayer")
		var_9_26:AnimateSequence("OnlinePlayer")
		var_9_36:AnimateSequence("OnlinePlayer")
		var_9_38:AnimateSequence("OnlinePlayer")
		var_9_40:AnimateSequence("OnlinePlayer")
		var_9_46:AnimateSequence("OnlinePlayer")
		var_9_48:AnimateSequence("OnlinePlayer")
	end

	var_9_0._sequences.OnlinePlayer = var_9_87

	local var_9_88
	local var_9_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 509
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		}
	}

	var_9_16:RegisterAnimationSequence("CompactLayout", var_9_89)

	local var_9_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -397
		},
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		}
	}

	var_9_18:RegisterAnimationSequence("CompactLayout", var_9_90)

	local var_9_91 = {
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
			value = _1080p * -510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		}
	}

	var_9_20:RegisterAnimationSequence("CompactLayout", var_9_91)

	local var_9_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("CompactLayout", var_9_92)

	local var_9_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("CompactLayout", var_9_93)

	local var_9_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("CompactLayout", var_9_94)

	local var_9_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_28:RegisterAnimationSequence("CompactLayout", var_9_95)

	local var_9_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_30:RegisterAnimationSequence("CompactLayout", var_9_96)

	local var_9_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_32:RegisterAnimationSequence("CompactLayout", var_9_97)

	local var_9_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_34:RegisterAnimationSequence("CompactLayout", var_9_98)

	local var_9_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("CompactLayout", var_9_99)

	local var_9_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_38:RegisterAnimationSequence("CompactLayout", var_9_100)

	local var_9_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		}
	}

	var_9_40:RegisterAnimationSequence("CompactLayout", var_9_101)

	local var_9_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_46:RegisterAnimationSequence("CompactLayout", var_9_102)

	local var_9_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_48:RegisterAnimationSequence("CompactLayout", var_9_103)

	local function var_9_104()
		var_9_16:AnimateSequence("CompactLayout")
		var_9_18:AnimateSequence("CompactLayout")
		var_9_20:AnimateSequence("CompactLayout")
		var_9_22:AnimateSequence("CompactLayout")
		var_9_24:AnimateSequence("CompactLayout")
		var_9_26:AnimateSequence("CompactLayout")
		var_9_28:AnimateSequence("CompactLayout")
		var_9_30:AnimateSequence("CompactLayout")
		var_9_32:AnimateSequence("CompactLayout")
		var_9_34:AnimateSequence("CompactLayout")
		var_9_36:AnimateSequence("CompactLayout")
		var_9_38:AnimateSequence("CompactLayout")
		var_9_40:AnimateSequence("CompactLayout")
		var_9_46:AnimateSequence("CompactLayout")
		var_9_48:AnimateSequence("CompactLayout")
	end

	var_9_0._sequences.CompactLayout = var_9_104

	local var_9_105
	local var_9_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ClanDetailsLayout", var_9_106)

	local var_9_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 509
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		}
	}

	var_9_16:RegisterAnimationSequence("ClanDetailsLayout", var_9_107)

	local var_9_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -397
		},
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("ClanDetailsLayout", var_9_108)

	local var_9_109 = {
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
			value = _1080p * -510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ClanDetailsLayout", var_9_109)

	local var_9_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("ClanDetailsLayout", var_9_110)

	local var_9_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("ClanDetailsLayout", var_9_111)

	local var_9_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("ClanDetailsLayout", var_9_112)

	local var_9_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_28:RegisterAnimationSequence("ClanDetailsLayout", var_9_113)

	local var_9_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_30:RegisterAnimationSequence("ClanDetailsLayout", var_9_114)

	local var_9_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_32:RegisterAnimationSequence("ClanDetailsLayout", var_9_115)

	local var_9_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_34:RegisterAnimationSequence("ClanDetailsLayout", var_9_116)

	local var_9_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("ClanDetailsLayout", var_9_117)

	local var_9_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_38:RegisterAnimationSequence("ClanDetailsLayout", var_9_118)

	local var_9_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 147
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		},
		{
			value = "",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 469
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123
		}
	}

	var_9_40:RegisterAnimationSequence("ClanDetailsLayout", var_9_119)

	local var_9_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_46:RegisterAnimationSequence("ClanDetailsLayout", var_9_120)

	local var_9_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_48:RegisterAnimationSequence("ClanDetailsLayout", var_9_121)

	local function var_9_122()
		var_9_4:AnimateSequence("ClanDetailsLayout")
		var_9_16:AnimateSequence("ClanDetailsLayout")
		var_9_18:AnimateSequence("ClanDetailsLayout")
		var_9_20:AnimateSequence("ClanDetailsLayout")
		var_9_22:AnimateSequence("ClanDetailsLayout")
		var_9_24:AnimateSequence("ClanDetailsLayout")
		var_9_26:AnimateSequence("ClanDetailsLayout")
		var_9_28:AnimateSequence("ClanDetailsLayout")
		var_9_30:AnimateSequence("ClanDetailsLayout")
		var_9_32:AnimateSequence("ClanDetailsLayout")
		var_9_34:AnimateSequence("ClanDetailsLayout")
		var_9_36:AnimateSequence("ClanDetailsLayout")
		var_9_38:AnimateSequence("ClanDetailsLayout")
		var_9_40:AnimateSequence("ClanDetailsLayout")
		var_9_46:AnimateSequence("ClanDetailsLayout")
		var_9_48:AnimateSequence("ClanDetailsLayout")
	end

	var_9_0._sequences.ClanDetailsLayout = var_9_122

	local var_9_123
	local var_9_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_50:RegisterAnimationSequence("DisplayClanStatus", var_9_124)

	local var_9_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_52:RegisterAnimationSequence("DisplayClanStatus", var_9_125)

	local function var_9_126()
		var_9_50:AnimateSequence("DisplayClanStatus")
		var_9_52:AnimateSequence("DisplayClanStatus")
	end

	var_9_0._sequences.DisplayClanStatus = var_9_126

	local var_9_127
	local var_9_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_50:RegisterAnimationSequence("HideClanStatus", var_9_128)

	local var_9_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_52:RegisterAnimationSequence("HideClanStatus", var_9_129)

	local function var_9_130()
		var_9_50:AnimateSequence("HideClanStatus")
		var_9_52:AnimateSequence("HideClanStatus")
	end

	var_9_0._sequences.HideClanStatus = var_9_130

	local var_9_131
	local var_9_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_54:RegisterAnimationSequence("ShowVanguardOwner", var_9_132)

	local function var_9_133()
		var_9_54:AnimateSequence("ShowVanguardOwner")
	end

	var_9_0._sequences.ShowVanguardOwner = var_9_133

	local var_9_134
	local var_9_135 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_54:RegisterAnimationSequence("NotVanguardOwner", var_9_135)

	local function var_9_136()
		var_9_54:AnimateSequence("NotVanguardOwner")
	end

	var_9_0._sequences.NotVanguardOwner = var_9_136

	local var_9_137
	local var_9_138 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_60:RegisterAnimationSequence("ShowLeaderInfo", var_9_138)

	local var_9_139 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_62:RegisterAnimationSequence("ShowLeaderInfo", var_9_139)

	local function var_9_140()
		var_9_60:AnimateSequence("ShowLeaderInfo")
		var_9_62:AnimateSequence("ShowLeaderInfo")
	end

	var_9_0._sequences.ShowLeaderInfo = var_9_140

	local var_9_141
	local var_9_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_60:RegisterAnimationSequence("HideLeaderInfo", var_9_142)

	local var_9_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_62:RegisterAnimationSequence("HideLeaderInfo", var_9_143)

	local function var_9_144()
		var_9_60:AnimateSequence("HideLeaderInfo")
		var_9_62:AnimateSequence("HideLeaderInfo")
	end

	var_9_0._sequences.HideLeaderInfo = var_9_144

	local var_9_145
	local var_9_146 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_56:RegisterAnimationSequence("ShowOnlineStatus", var_9_146)

	local var_9_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_58:RegisterAnimationSequence("ShowOnlineStatus", var_9_147)

	local function var_9_148()
		var_9_56:AnimateSequence("ShowOnlineStatus")
		var_9_58:AnimateSequence("ShowOnlineStatus")
	end

	var_9_0._sequences.ShowOnlineStatus = var_9_148

	var_0_7(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SocialFriendDetails", SocialFriendDetails)
LockTable(_M)
