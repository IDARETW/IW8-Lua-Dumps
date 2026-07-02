module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("RegimentsSwitch", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0
	})

	var_1_1.id = "RegimentsSwitchPopup"

	return var_1_1
end

MenuBuilder.registerType("RegimentsSwitchPopup", var_0_0)

local var_0_1

local function var_0_2(arg_2_0)
	arg_2_0:Wait(1000, true).onComplete = function()
		return var_0_2(arg_2_0)
	end

	if arg_2_0._clanID ~= -1 then
		local var_2_0 = arg_2_0._clanMembers == nil and 0 or #arg_2_0._clanMembers

		arg_2_0._clanMembers = FRIENDS.GetGroupMembers(arg_2_0._controllerIndex, arg_2_0._clanID) or {}

		local var_2_1 = #arg_2_0._clanMembers

		if var_2_0 ~= var_2_1 then
			arg_2_0.ClanMembersGrid:SetNumChildren(var_2_1)
		end

		if #arg_2_0._clanMembers > 0 then
			local var_2_2 = Clans.DGGFBEFIBC(arg_2_0._controllerIndex, arg_2_0._clanID)
			local var_2_3 = Clans.HAHBJIIFJ(arg_2_0._controllerIndex, arg_2_0._clanID)

			arg_2_0.ClanSlotStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_ONLINE_MEMBERS", Engine.JCBDICCAH(var_2_3), Engine.JCBDICCAH(var_2_2)))
		end

		local var_2_4 = Clans.EBDFICHCEJ(arg_2_0._controllerIndex)

		arg_2_0.RegimentsInviteButton:SetInvites(#var_2_4)
		arg_2_0.ClanMembersGrid:RefreshContent()
	end
end

local function var_0_3(arg_4_0)
	local var_4_0 = arg_4_0.ActiveTag:SetupEventBanner(Engine.CBBHFCGDIC("LUA_MENU/ACTIVE"), 10 * _1080p)
	local var_4_1 = arg_4_0.HappyHourBacker:GetCurrentAnchorsAndPositions().right
	local var_4_2 = 8 * _1080p

	arg_4_0.ActiveTag:SetLeft(var_4_1 - (var_4_0 + var_4_2))
	arg_4_0.ActiveTag:SetAlpha(0)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = 8 * _1080p
	local var_5_1 = 20 * _1080p
	local var_5_2 = arg_5_0.HappyHourTimerInfo:GetCurrentAnchorsAndPositions().top
	local var_5_3 = arg_5_0.HappyHourBacker:GetCurrentAnchorsAndPositions().top

	arg_5_0.HappyHourTimerInfo:setText(arg_5_1)
	arg_5_0.HappyHourTimer:setText(arg_5_2)

	local var_5_4 = LAYOUT.GetTextHeightWithWrapping(arg_5_0.HappyHourTimerInfo, arg_5_1)
	local var_5_5 = LAYOUT.GetTextHeightWithWrapping(arg_5_0.HappyHourTimer, arg_5_2)
	local var_5_6 = LAYOUT.GetElementHeight(arg_5_0.HappyHourTimer)

	arg_5_0.HappyHourTimer:SetTop(var_5_2 + var_5_4 + var_5_0)
	arg_5_0.HappyHourTimer:SetBottom(var_5_2 + var_5_4 + var_5_0 + var_5_6)

	local var_5_7 = var_5_4 + var_5_5 + var_5_0 + var_5_1

	arg_5_0.HappyHourBacker:SetBottom(var_5_3 + (var_5_2 - var_5_3) + var_5_7)
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1

	assert(arg_6_2.clanID)

	arg_6_0._clanID = arg_6_2.clanID
	arg_6_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_6_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")

	var_0_3(arg_6_0)

	local function var_6_0(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_6_0.ClanMembersGrid:GetContentIndex(arg_7_1, arg_7_2)
		local var_7_1 = arg_6_0._clanMembers[var_7_0 + 1]

		if arg_7_0.data and arg_7_0.data.isMyPlayer == true and var_7_1.isMyPlayer == false then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonReset")
		end

		arg_7_0.data = var_7_1

		arg_7_0.FullName:setText(var_7_1.name)
		arg_7_0.LeaderIcon:SetAlpha(var_7_1.role == OnlineClanRole.OWNER and 1 or 0)

		if var_7_1.platform ~= nil then
			arg_7_0.PlatformPresence:SetPlatformPresence(var_7_1.platform)
		else
			arg_7_0.PlatformPresence:SetAlpha(0)
		end

		if var_7_1.isMyPlayer then
			ACTIONS.AnimateSequence(arg_7_0, "IsPlayer")
		end

		if not arg_7_0._hasButtonEvents then
			arg_7_0:addEventHandler("gain_focus", function(arg_8_0, arg_8_1)
				local var_8_0 = arg_8_0.data

				arg_6_0.FullName:setText(var_8_0.name)

				if var_8_0.platform ~= nil then
					arg_6_0.PlatformPresence:SetPlatformPresence(var_8_0.platform)
					arg_6_0.PlatformPresence:SetAlpha(1)
					ACTIONS.AnimateSequence(arg_7_0, "ButtonOverPresence")
				else
					arg_6_0.PlatformPresence:SetAlpha(0)
					arg_7_0.PlatformPresence:SetAlpha(0)
				end

				if var_8_0.inputType then
					if var_8_0.inputType == LUI.INPUT_TYPE.gamepad then
						arg_6_0.InputImage:setImage(arg_6_0._GPDImg)
						arg_6_0.InputText:setText(Engine.CBBHFCGDIC("PLATFORM_UI/PLAYING_WITH_CONTROLLER"))
					else
						arg_6_0.InputImage:setImage(arg_6_0._KBMImg)
						arg_6_0.InputText:setText(Engine.CBBHFCGDIC("MPUI/PLAY_WITH_KBM"))
					end

					arg_6_0.InputImage:SetAlpha(1)
				else
					arg_6_0.InputText:setText("")
					arg_6_0.InputImage:SetAlpha(0)
				end

				local var_8_1 = IsLanguageArabic()

				if var_8_0.role == OnlineClanRole.OWNER then
					ACTIONS.AnimateSequence(arg_6_0, var_8_1 and "ARIsOwner" or "IsOwner")
				elseif var_8_0.role == OnlineClanRole.OFFICER then
					ACTIONS.AnimateSequence(arg_6_0, var_8_1 and "ARIsOfficer" or "IsOfficer")
				else
					ACTIONS.AnimateSequence(arg_6_0, var_8_1 and "ARIsMember" or "IsMember")
				end

				if var_8_0.isMyPlayer then
					ACTIONS.AnimateSequence(arg_7_0, "IsPlayer")
				else
					ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")
				end
			end)
			arg_7_0:addEventHandler("lose_focus", function(arg_9_0, arg_9_1)
				local var_9_0 = arg_9_0.data

				if var_9_0.isMyPlayer then
					ACTIONS.AnimateSequence(arg_7_0, "IsPlayer")
				else
					ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")
				end

				if var_9_0.platform ~= nil then
					ACTIONS.AnimateSequence(arg_7_0, "ButtonUpPresence")
				end
			end)
			arg_7_0:addEventHandler("button_action", function(arg_10_0, arg_10_1)
				if arg_10_0.data.isMyPlayer then
					return
				end

				local var_10_0 = {
					isRegiments = true,
					xuid = arg_10_0.data.xuid,
					platformId = arg_10_0.data.platformId,
					selectedTab = FRIENDS.TabIDs.REGIMENTS,
					controllerIndex = arg_6_1,
					presencePlatform = arg_10_0.data.platform,
					gamertag = arg_10_0.data.name,
					regimentsData = arg_10_0.data
				}
				local var_10_1 = MenuBuilder.BuildRegisteredType("SocialPlayerPopup", var_10_0)
				local var_10_2 = FRIENDS.GetFriendActions(var_10_0)

				FRIENDS.AddFriendActions(var_10_0, var_10_2, var_10_1.PlayerActions)
				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_6_1, false, {
					widget = var_10_1
				})
			end)

			arg_7_0._hasButtonEvents = true
		end
	end

	arg_6_0.ClanMembersGrid:SetRefreshChild(var_6_0)
	arg_6_0.ClanMembersGrid:SetNumChildren(0)

	local var_6_1 = {}

	if IsLanguageEnglish() then
		local var_6_2 = "LUA_MENU/TIME_HOUR_AM"
		local var_6_3 = "LUA_MENU/TIME_HOUR_PM"

		var_6_1 = {
			{
				"12",
				var_6_2
			},
			{
				"1",
				var_6_2
			},
			{
				"2",
				var_6_2
			},
			{
				"3",
				var_6_2
			},
			{
				"4",
				var_6_2
			},
			{
				"5",
				var_6_2
			},
			{
				"6",
				var_6_2
			},
			{
				"7",
				var_6_2
			},
			{
				"8",
				var_6_2
			},
			{
				"9",
				var_6_2
			},
			{
				"10",
				var_6_2
			},
			{
				"11",
				var_6_2
			},
			{
				"12",
				var_6_3
			},
			{
				"1",
				var_6_3
			},
			{
				"2",
				var_6_3
			},
			{
				"3",
				var_6_3
			},
			{
				"4",
				var_6_3
			},
			{
				"5",
				var_6_3
			},
			{
				"6",
				var_6_3
			},
			{
				"7",
				var_6_3
			},
			{
				"8",
				var_6_3
			},
			{
				"9",
				var_6_3
			},
			{
				"10",
				var_6_3
			},
			{
				"11",
				var_6_3
			}
		}
	else
		for iter_6_0 = 0, 23 do
			table.insert(var_6_1, string.format("%02d", iter_6_0))
		end
	end

	arg_6_0:addAndCallEventHandler("change_active_clan", function(arg_11_0, arg_11_1)
		if arg_11_1.newActiveClanID then
			arg_6_0._clanID = arg_11_1.newActiveClanID
		end

		if arg_6_0._clanID == -1 then
			arg_6_0:dispatchEventToRoot({
				name = "show_clan_init_menu"
			})
		else
			local var_11_0 = Clans.GFFJCJFIJ(arg_6_1, arg_6_0._clanID)

			if var_11_0.clanTag and var_11_0.clanTag ~= "" then
				arg_6_0.ClanNameAndTag:setText("[" .. var_11_0.clanTag .. "] " .. var_11_0.name)
			else
				arg_6_0.ClanNameAndTag:setText(var_11_0.name)
			end

			var_0_2(arg_6_0)

			if #arg_6_0._clanMembers > 0 then
				arg_6_0._localClientRole = Clans.CFDHGBFICH(arg_6_1, arg_6_0._clanID, Engine.EAGGAEGHHA(arg_6_1))

				arg_6_0.ClanMembersGrid:processEvent({
					name = "gain_focus"
				})
			end
		end

		return true
	end)
	arg_6_0:registerEventHandler("clans_notification", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.options

		if var_12_0.genEventName == "clans_activated_clan" and var_12_0.success then
			arg_6_0:dispatchEventToRoot({
				name = "change_active_clan",
				newActiveClanID = var_12_0.clanId
			})
		end
	end)

	local var_6_4 = LUI.UIBindButton.new()

	var_6_4.id = "bindButton"

	arg_6_0:addElement(var_6_4)

	arg_6_0.bindButton = var_6_4

	local function var_6_5()
		if arg_6_0._localClientRole == OnlineClanRole.MEMBER then
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsManagementPopup", true, arg_6_1, false, {
				noFence = true,
				init = true,
				controllerIndex = arg_6_1,
				clanID = arg_6_0._clanID,
				localClientRole = arg_6_0._localClientRole
			})
		else
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsManagementPopup", true, arg_6_1, false, {
				controllerIndex = arg_6_1,
				clanID = arg_6_0._clanID,
				localClientRole = arg_6_0._localClientRole
			})
		end
	end

	arg_6_0.bindButton:addEventHandler("button_alt2", var_6_5)
	arg_6_0.RegimentsInviteButton:SetAction(var_6_5)
	arg_6_0.bindButton:addEventHandler("button_alt1", function(arg_14_0, arg_14_1)
		if arg_6_0._localClientRole == OnlineClanRole.MEMBER then
			local var_14_0 = Clans.CEACCICGB(arg_6_1) or {}
			local var_14_1 = -1

			for iter_14_0 = 1, #var_14_0 do
				if var_14_0[iter_14_0] ~= arg_6_0._clanID then
					var_14_1 = var_14_0[iter_14_0]

					break
				end
			end

			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_6_1, false, {
				controllerIndex = arg_6_1,
				clanID = arg_6_0._clanID,
				switchToID = var_14_1,
				action = FRIENDS.RegimentPopupActions.LEAVE
			})
		else
			LUI.FlowManager.RequestAddMenu("ManageRegimentMenu", true, arg_6_1, false, {
				clanID = arg_6_0._clanID,
				localClientRole = arg_6_0._localClientRole
			})
		end
	end)
	arg_6_0.bindButton:addEventHandler("button_right_stick", function(arg_15_0, arg_15_1)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsSwitchPopup", true, arg_6_1, false, {
			controllerIndex = arg_6_1
		})
	end)

	arg_6_0.RegimentsInviteButton.navigation = {}
	arg_6_0.RegimentsInviteButton.navigation.up = arg_6_0.ClanMembersGrid
	arg_6_0.RegimentsInviteButton.navigation.down = arg_6_0.ClanMembersGrid

	local function var_6_6(arg_16_0, arg_16_1)
		if not LUI.IsLastInputKeyboardMouse(arg_16_1.controllerIndex) then
			ACTIONS.LoseFocus(arg_16_0, "RegimentsInviteButton", arg_6_1)
			ACTIONS.GainFocus(arg_16_0, "ClanMembersGrid", arg_6_1)
		end
	end

	arg_6_0:registerAndCallEventHandler("update_input_type", var_6_6, {
		controllerIndex = arg_6_1
	})

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_6_0, "RU")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_6_0, "JP")
	end

	if not Onboarding.Regiments.WasCompleted(arg_6_0, arg_6_1) then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "onboardingpopup", true, arg_6_1, false, ONBOARDING_DATA.GetOnboardingRegimentData())
		Onboarding.Regiments.MarkCompleted(arg_6_0, arg_6_1)
	end

	function arg_6_0.SetLocalClientRole(arg_17_0, arg_17_1)
		arg_17_0._localClientRole = arg_17_1
	end
end

function RegimentsMembersView(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_18_0.id = "RegimentsMembersView"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "HappyHourBacker"

	var_18_4:SetAlpha(0.5, 0)
	var_18_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1379, _1080p * 1824, _1080p * 216, _1080p * 358)
	var_18_0:addElement(var_18_4)

	var_18_0.HappyHourBacker = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "HappyHourTitle"

	var_18_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR"), 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1379, _1080p * 1824, _1080p * 215, _1080p * 261)
	var_18_0:addElement(var_18_6)

	var_18_0.HappyHourTitle = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "ClanMemberInfoBacker"

	var_18_8:SetAlpha(0.5, 0)
	var_18_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 823, _1080p * 1341, _1080p * 216, _1080p * 423)
	var_18_0:addElement(var_18_8)

	var_18_0.ClanMemberInfoBacker = var_18_8

	local var_18_9
	local var_18_10 = LUI.UIImage.new()

	var_18_10.id = "InputImage"

	var_18_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 850, _1080p * 882, _1080p * 365, _1080p * 397)
	var_18_0:addElement(var_18_10)

	var_18_0.InputImage = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIStyledText.new()

	var_18_12.id = "InputText"

	var_18_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_12:setText(Engine.CBBHFCGDIC("PLATFORM_UI/PLAYING_WITH_CONTROLLER"), 0)
	var_18_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_12:SetAlignment(LUI.Alignment.Left)
	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 887, _1080p * 1301, _1080p * 369, _1080p * 393)
	var_18_0:addElement(var_18_12)

	var_18_0.InputText = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "PlatformPresence"

	var_18_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1271, _1080p * 1301, _1080p * 278, _1080p * 308)
	var_18_0:addElement(var_18_14)

	var_18_0.PlatformPresence = var_18_14

	local var_18_15
	local var_18_16 = LUI.UIStyledText.new()

	var_18_16.id = "FullName"

	var_18_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_18_16:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_18_16:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
	var_18_16:SetWordWrap(false)
	var_18_16:SetAlignment(LUI.Alignment.Left)
	var_18_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 850, _1080p * 1259, _1080p * 282, _1080p * 304)
	var_18_0:addElement(var_18_16)

	var_18_0.FullName = var_18_16

	local var_18_17
	local var_18_18 = LUI.UIStyledText.new()

	var_18_18.id = "ClanLeaderText"

	var_18_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_18:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER"), 0)
	var_18_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_18:SetAlignment(LUI.Alignment.Left)
	var_18_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 887, _1080p * 1301, _1080p * 331, _1080p * 355)
	var_18_0:addElement(var_18_18)

	var_18_0.ClanLeaderText = var_18_18

	local var_18_19
	local var_18_20 = LUI.UIImage.new()

	var_18_20.id = "ClanLeaderImage"

	var_18_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_20:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_18_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 850, _1080p * 882, _1080p * 327, _1080p * 359)
	var_18_0:addElement(var_18_20)

	var_18_0.ClanLeaderImage = var_18_20

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "PlayerDetailsTitle"

	var_18_22.Text:setText(Engine.CBBHFCGDIC("MENU/PLAYER_DETAILS"), 0)
	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 823, _1080p * 1318, _1080p * 216, _1080p * 262)
	var_18_0:addElement(var_18_22)

	var_18_0.PlayerDetailsTitle = var_18_22

	local var_18_23
	local var_18_24 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 11,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RegimentsMember", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_18_25 = LUI.UIGrid.new(var_18_24)

	var_18_25.id = "ClanMembersGrid"

	var_18_25:setUseStencil(true)
	var_18_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 304, _1080p * 954)
	var_18_0:addElement(var_18_25)

	var_18_0.ClanMembersGrid = var_18_25

	local var_18_26
	local var_18_27 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_18_1
	})

	var_18_27.id = "VerticalScrollbar"

	var_18_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 114, _1080p * 304, _1080p * 926)
	var_18_0:addElement(var_18_27)

	var_18_0.VerticalScrollbar = var_18_27

	local var_18_28
	local var_18_29 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_18_1
	})

	var_18_29.id = "ManageClanContainer"

	if CONDITIONS.AlwaysFalse(var_18_0) then
		var_18_29.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_REGIMENT"), 0)
	end

	var_18_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 299, _1080p * 269, _1080p * 300)
	var_18_0:addElement(var_18_29)

	var_18_0.ManageClanContainer = var_18_29

	local var_18_30
	local var_18_31 = LUI.UIText.new()

	var_18_31.id = "ClanSlotStatus"

	var_18_31:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_18_31:setText("", 0)
	var_18_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_31:SetWordWrap(false)
	var_18_31:SetAlignment(LUI.Alignment.Right)
	var_18_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 630, _1080p * 276, _1080p * 296)
	var_18_0:addElement(var_18_31)

	var_18_0.ClanSlotStatus = var_18_31

	local var_18_32
	local var_18_33 = LUI.UIStyledText.new()

	var_18_33.id = "ClanNameAndTag"

	var_18_33:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_18_33:setText("", 0)
	var_18_33:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_33:SetWordWrap(false)
	var_18_33:SetAlignment(LUI.Alignment.Left)
	var_18_33:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_33:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_33:SetStartupDelay(1000)
	var_18_33:SetLineHoldTime(400)
	var_18_33:SetAnimMoveTime(1000)
	var_18_33:SetAnimMoveSpeed(150)
	var_18_33:SetEndDelay(1000)
	var_18_33:SetCrossfadeTime(1000)
	var_18_33:SetFadeInTime(300)
	var_18_33:SetFadeOutTime(300)
	var_18_33:SetMaxVisibleLines(1)
	var_18_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 744, _1080p * 211, _1080p * 261)
	var_18_0:addElement(var_18_33)

	var_18_0.ClanNameAndTag = var_18_33

	local var_18_34
	local var_18_35 = LUI.UIStyledText.new()

	var_18_35.id = "HappyHourTimerInfo"

	var_18_35:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_18_35:setText("", 0)
	var_18_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_35:SetAlignment(LUI.Alignment.Left)
	var_18_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1406, _1080p * 1797, _1080p * 273, _1080p * 301)
	var_18_0:addElement(var_18_35)

	var_18_0.HappyHourTimerInfo = var_18_35

	local var_18_36
	local var_18_37 = LUI.UIStyledText.new()

	var_18_37.id = "HappyHourTimer"

	var_18_37:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_37:setText("", 0)
	var_18_37:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_18_37:SetAlignment(LUI.Alignment.Left)
	var_18_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1406, _1080p * 1797, _1080p * 304, _1080p * 326)
	var_18_0:addElement(var_18_37)

	var_18_0.HappyHourTimer = var_18_37

	local var_18_38
	local var_18_39 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_18_1
	})

	var_18_39.id = "ActiveTag"

	var_18_39.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_18_39.Backer:SetAlpha(0.3, 0)
	var_18_39.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_18_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1665, _1080p * 1815, _1080p * 224, _1080p * 254)
	var_18_0:addElement(var_18_39)

	var_18_0.ActiveTag = var_18_39

	local var_18_40
	local var_18_41 = MenuBuilder.BuildRegisteredType("RegimentsInviteButton", {
		controllerIndex = var_18_1
	})

	var_18_41.id = "RegimentsInviteButton"

	var_18_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 311, _1080p * 461, _1080p * 269, _1080p * 300)
	var_18_0:addElement(var_18_41)

	var_18_0.RegimentsInviteButton = var_18_41

	local function var_18_42()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_42

	local var_18_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1269
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1301
		}
	}

	var_18_10:RegisterAnimationSequence("AR", var_18_43)

	local var_18_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1259
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		}
	}

	var_18_12:RegisterAnimationSequence("AR", var_18_44)

	local var_18_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1259
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 358
		}
	}

	var_18_18:RegisterAnimationSequence("AR", var_18_45)

	local var_18_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1269
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1301
		}
	}

	var_18_20:RegisterAnimationSequence("AR", var_18_46)

	local var_18_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 301
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 271
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_18_31:RegisterAnimationSequence("AR", var_18_47)

	local var_18_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		}
	}

	var_18_33:RegisterAnimationSequence("AR", var_18_48)

	local var_18_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 309
		}
	}

	var_18_35:RegisterAnimationSequence("AR", var_18_49)

	local var_18_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 309
		}
	}

	var_18_37:RegisterAnimationSequence("AR", var_18_50)

	local var_18_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 264
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 414
		}
	}

	var_18_41:RegisterAnimationSequence("AR", var_18_51)

	local function var_18_52()
		var_18_10:AnimateSequence("AR")
		var_18_12:AnimateSequence("AR")
		var_18_18:AnimateSequence("AR")
		var_18_20:AnimateSequence("AR")
		var_18_31:AnimateSequence("AR")
		var_18_33:AnimateSequence("AR")
		var_18_35:AnimateSequence("AR")
		var_18_37:AnimateSequence("AR")
		var_18_41:AnimateSequence("AR")
	end

	var_18_0._sequences.AR = var_18_52

	local var_18_53 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_18_8:RegisterAnimationSequence("IsOwner", var_18_53)

	local var_18_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		}
	}

	var_18_10:RegisterAnimationSequence("IsOwner", var_18_54)

	local var_18_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 368
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_18_12:RegisterAnimationSequence("IsOwner", var_18_55)

	local var_18_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER")
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 887
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_18:RegisterAnimationSequence("IsOwner", var_18_56)

	local var_18_57 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("IsOwner", var_18_57)

	local function var_18_58()
		var_18_8:AnimateSequence("IsOwner")
		var_18_10:AnimateSequence("IsOwner")
		var_18_12:AnimateSequence("IsOwner")
		var_18_18:AnimateSequence("IsOwner")
		var_18_20:AnimateSequence("IsOwner")
	end

	var_18_0._sequences.IsOwner = var_18_58

	local var_18_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_18_8:RegisterAnimationSequence("IsOfficer", var_18_59)

	local var_18_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		}
	}

	var_18_10:RegisterAnimationSequence("IsOfficer", var_18_60)

	local var_18_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 368
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_18_12:RegisterAnimationSequence("IsOfficer", var_18_61)

	local var_18_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_OFFICER")
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_18:RegisterAnimationSequence("IsOfficer", var_18_62)

	local var_18_63 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("IsOfficer", var_18_63)

	local function var_18_64()
		var_18_8:AnimateSequence("IsOfficer")
		var_18_10:AnimateSequence("IsOfficer")
		var_18_12:AnimateSequence("IsOfficer")
		var_18_18:AnimateSequence("IsOfficer")
		var_18_20:AnimateSequence("IsOfficer")
	end

	var_18_0._sequences.IsOfficer = var_18_64

	local var_18_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		}
	}

	var_18_8:RegisterAnimationSequence("IsMember", var_18_65)

	local var_18_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 326
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 358
		}
	}

	var_18_10:RegisterAnimationSequence("IsMember", var_18_66)

	local var_18_67 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 330
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 354
		}
	}

	var_18_12:RegisterAnimationSequence("IsMember", var_18_67)

	local var_18_68 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		}
	}

	var_18_18:RegisterAnimationSequence("IsMember", var_18_68)

	local var_18_69 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("IsMember", var_18_69)

	local function var_18_70()
		var_18_8:AnimateSequence("IsMember")
		var_18_10:AnimateSequence("IsMember")
		var_18_12:AnimateSequence("IsMember")
		var_18_18:AnimateSequence("IsMember")
		var_18_20:AnimateSequence("IsMember")
	end

	var_18_0._sequences.IsMember = var_18_70

	local var_18_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 337
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 487
		}
	}

	var_18_41:RegisterAnimationSequence("RU", var_18_71)

	local function var_18_72()
		var_18_41:AnimateSequence("RU")
	end

	var_18_0._sequences.RU = var_18_72

	local var_18_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 438
		}
	}

	var_18_41:RegisterAnimationSequence("JP", var_18_73)

	local function var_18_74()
		var_18_41:AnimateSequence("JP")
	end

	var_18_0._sequences.JP = var_18_74

	local var_18_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		}
	}

	var_18_8:RegisterAnimationSequence("ARIsMember", var_18_75)

	local var_18_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 326
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 358
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1269
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1301
		}
	}

	var_18_10:RegisterAnimationSequence("ARIsMember", var_18_76)

	local var_18_77 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 326
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 358
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		}
	}

	var_18_12:RegisterAnimationSequence("ARIsMember", var_18_77)

	local var_18_78 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1263
		}
	}

	var_18_18:RegisterAnimationSequence("ARIsMember", var_18_78)

	local var_18_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("ARIsMember", var_18_79)

	local function var_18_80()
		var_18_8:AnimateSequence("ARIsMember")
		var_18_10:AnimateSequence("ARIsMember")
		var_18_12:AnimateSequence("ARIsMember")
		var_18_18:AnimateSequence("ARIsMember")
		var_18_20:AnimateSequence("ARIsMember")
	end

	var_18_0._sequences.ARIsMember = var_18_80

	local var_18_81 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_18_8:RegisterAnimationSequence("ARIsOfficer", var_18_81)

	local var_18_82 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		}
	}

	var_18_10:RegisterAnimationSequence("ARIsOfficer", var_18_82)

	local var_18_83 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1259
		}
	}

	var_18_12:RegisterAnimationSequence("ARIsOfficer", var_18_83)

	local var_18_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_OFFICER")
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1301
		}
	}

	var_18_18:RegisterAnimationSequence("ARIsOfficer", var_18_84)

	local var_18_85 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1269
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1301
		}
	}

	var_18_20:RegisterAnimationSequence("ARIsOfficer", var_18_85)

	local function var_18_86()
		var_18_8:AnimateSequence("ARIsOfficer")
		var_18_10:AnimateSequence("ARIsOfficer")
		var_18_12:AnimateSequence("ARIsOfficer")
		var_18_18:AnimateSequence("ARIsOfficer")
		var_18_20:AnimateSequence("ARIsOfficer")
	end

	var_18_0._sequences.ARIsOfficer = var_18_86

	local var_18_87 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_18_8:RegisterAnimationSequence("ARIsOwner", var_18_87)

	local var_18_88 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		}
	}

	var_18_10:RegisterAnimationSequence("ARIsOwner", var_18_88)

	local var_18_89 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1259
		}
	}

	var_18_12:RegisterAnimationSequence("ARIsOwner", var_18_89)

	local var_18_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER")
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 850
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1259
		}
	}

	var_18_18:RegisterAnimationSequence("ARIsOwner", var_18_90)

	local var_18_91 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("ARIsOwner", var_18_91)

	local function var_18_92()
		var_18_8:AnimateSequence("ARIsOwner")
		var_18_10:AnimateSequence("ARIsOwner")
		var_18_12:AnimateSequence("ARIsOwner")
		var_18_18:AnimateSequence("ARIsOwner")
		var_18_20:AnimateSequence("ARIsOwner")
	end

	var_18_0._sequences.ARIsOwner = var_18_92

	local var_18_93 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_18_27,
		startCap = var_18_27.startCap,
		endCap = var_18_27.endCap,
		sliderArea = var_18_27.sliderArea,
		slider = var_18_27.sliderArea and var_18_27.sliderArea.slider,
		fixedSizeSlider = var_18_27.sliderArea and var_18_27.sliderArea.fixedSizeSlider
	})

	var_18_25:AddScrollbar(var_18_93)
	var_0_5(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("RegimentsMembersView", RegimentsMembersView)
LockTable(_M)
