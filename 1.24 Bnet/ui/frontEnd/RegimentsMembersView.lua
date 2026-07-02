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
		arg_2_0.SetHappyHourInfo()

		local var_2_0 = arg_2_0._clanMembers == nil and 0 or #arg_2_0._clanMembers

		arg_2_0._clanMembers = Clans.GIDGAGEAC(arg_2_0._controllerIndex, arg_2_0._clanID) or {}

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

	function arg_6_0.SetHappyHourInfo()
		local var_11_0 = Clans.CBJDIGCAED(arg_6_1, arg_6_0._clanID)

		if var_11_0 and var_11_0.happyHour then
			if var_11_0.secondsInHappyHour then
				local var_11_1 = var_11_0.secondsInHappyHour
				local var_11_2 = math.floor(var_11_1 / 60)
				local var_11_3 = var_11_1 - var_11_2 * 60

				var_0_4(arg_6_0, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_ENDS"), Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_ENDS_TIMER", var_11_2, var_11_3))
				arg_6_0.ActiveTag:SetAlpha(1)
			else
				local var_11_4 = var_11_0.timeToHappyHour
				local var_11_5 = math.floor(var_11_4 / 3600)
				local var_11_6 = var_11_4 - var_11_5 * 3600
				local var_11_7 = math.floor(var_11_6 / 60)
				local var_11_8 = var_11_6 - var_11_7 * 60
				local var_11_9 = var_6_1[var_11_0.happyHour + 1]
				local var_11_10 = string.format("%02d", var_11_0.happyMinutes)
				local var_11_11

				if IsLanguageEnglish() then
					var_11_11 = Engine.CBBHFCGDIC(var_11_9[2], var_11_9[1], var_11_10)
				else
					var_11_11 = Engine.CBBHFCGDIC("LUA_MENU/FORMATTED_TIME", var_11_9, var_11_10)
				end

				var_0_4(arg_6_0, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_AT", var_11_11), Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_STARTS_IN", var_11_5, var_11_7, var_11_8))
				arg_6_0.ActiveTag:SetAlpha(0)
			end
		else
			var_0_4(arg_6_0, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_NOT_SET"), Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_NOT_SET_DESC"))
		end
	end

	arg_6_0:addAndCallEventHandler("change_active_clan", function(arg_12_0, arg_12_1)
		if arg_12_1.newActiveClanID then
			arg_6_0._clanID = arg_12_1.newActiveClanID
		end

		if arg_6_0._clanID == -1 then
			arg_6_0:dispatchEventToRoot({
				name = "show_clan_init_menu"
			})
		else
			local var_12_0 = Clans.GFFJCJFIJ(arg_6_1, arg_6_0._clanID)

			arg_6_0.ClanNameAndTag:setText("[" .. var_12_0.clanTag .. "] " .. var_12_0.name)
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
	arg_6_0:registerEventHandler("clans_notification", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.options

		if var_13_0.genEventName == "clans_activated_clan" and var_13_0.success then
			arg_6_0:dispatchEventToRoot({
				name = "change_active_clan",
				newActiveClanID = var_13_0.clanId
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
	arg_6_0.bindButton:addEventHandler("button_alt1", function(arg_15_0, arg_15_1)
		if arg_6_0._localClientRole == OnlineClanRole.MEMBER then
			local var_15_0 = Clans.CEACCICGB(arg_6_1) or {}
			local var_15_1 = -1

			for iter_15_0 = 1, #var_15_0 do
				if var_15_0[iter_15_0] ~= arg_6_0._clanID then
					var_15_1 = var_15_0[iter_15_0]

					break
				end
			end

			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_6_1, false, {
				controllerIndex = arg_6_1,
				clanID = arg_6_0._clanID,
				switchToID = var_15_1,
				action = FRIENDS.RegimentPopupActions.LEAVE
			})
		else
			LUI.FlowManager.RequestAddMenu("ManageRegimentMenu", true, arg_6_1, false, {
				clanID = arg_6_0._clanID,
				localClientRole = arg_6_0._localClientRole
			})
		end
	end)
	arg_6_0.bindButton:addEventHandler("button_right_stick", function(arg_16_0, arg_16_1)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsSwitchPopup", true, arg_6_1, false, {
			controllerIndex = arg_6_1
		})
	end)

	arg_6_0.RegimentsInviteButton.navigation = {}
	arg_6_0.RegimentsInviteButton.navigation.up = arg_6_0.ClanMembersGrid
	arg_6_0.RegimentsInviteButton.navigation.down = arg_6_0.ClanMembersGrid

	local function var_6_6(arg_17_0, arg_17_1)
		if not LUI.IsLastInputKeyboardMouse(arg_17_1.controllerIndex) then
			ACTIONS.LoseFocus(arg_17_0, "RegimentsInviteButton", arg_6_1)
			ACTIONS.GainFocus(arg_17_0, "ClanMembersGrid", arg_6_1)
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

	function arg_6_0.SetLocalClientRole(arg_18_0, arg_18_1)
		arg_18_0._localClientRole = arg_18_1
	end
end

function RegimentsMembersView(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_19_0.id = "RegimentsMembersView"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "HappyHourBacker"

	var_19_4:SetAlpha(0.5, 0)
	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1379, _1080p * 1824, _1080p * 216, _1080p * 358)
	var_19_0:addElement(var_19_4)

	var_19_0.HappyHourBacker = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "HappyHourTitle"

	var_19_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR"), 0)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1379, _1080p * 1824, _1080p * 215, _1080p * 261)
	var_19_0:addElement(var_19_6)

	var_19_0.HappyHourTitle = var_19_6

	local var_19_7
	local var_19_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_19_1
	})

	var_19_8.id = "ClanMemberInfoBacker"

	var_19_8:SetAlpha(0.5, 0)
	var_19_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 823, _1080p * 1341, _1080p * 216, _1080p * 423)
	var_19_0:addElement(var_19_8)

	var_19_0.ClanMemberInfoBacker = var_19_8

	local var_19_9
	local var_19_10 = LUI.UIImage.new()

	var_19_10.id = "InputImage"

	var_19_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_19_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 850, _1080p * 882, _1080p * 365, _1080p * 397)
	var_19_0:addElement(var_19_10)

	var_19_0.InputImage = var_19_10

	local var_19_11
	local var_19_12 = LUI.UIStyledText.new()

	var_19_12.id = "InputText"

	var_19_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_19_12:setText(Engine.CBBHFCGDIC("PLATFORM_UI/PLAYING_WITH_CONTROLLER"), 0)
	var_19_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_12:SetAlignment(LUI.Alignment.Left)
	var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 887, _1080p * 1301, _1080p * 369, _1080p * 393)
	var_19_0:addElement(var_19_12)

	var_19_0.InputText = var_19_12

	local var_19_13
	local var_19_14 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_19_1
	})

	var_19_14.id = "PlatformPresence"

	var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1271, _1080p * 1301, _1080p * 278, _1080p * 308)
	var_19_0:addElement(var_19_14)

	var_19_0.PlatformPresence = var_19_14

	local var_19_15
	local var_19_16 = LUI.UIStyledText.new()

	var_19_16.id = "FullName"

	var_19_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_19_16:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_19_16:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
	var_19_16:SetWordWrap(false)
	var_19_16:SetAlignment(LUI.Alignment.Left)
	var_19_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 850, _1080p * 1259, _1080p * 282, _1080p * 304)
	var_19_0:addElement(var_19_16)

	var_19_0.FullName = var_19_16

	local var_19_17
	local var_19_18 = LUI.UIStyledText.new()

	var_19_18.id = "ClanLeaderText"

	var_19_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_19_18:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER"), 0)
	var_19_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_18:SetAlignment(LUI.Alignment.Left)
	var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 887, _1080p * 1301, _1080p * 331, _1080p * 355)
	var_19_0:addElement(var_19_18)

	var_19_0.ClanLeaderText = var_19_18

	local var_19_19
	local var_19_20 = LUI.UIImage.new()

	var_19_20.id = "ClanLeaderImage"

	var_19_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_19_20:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_19_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 850, _1080p * 882, _1080p * 327, _1080p * 359)
	var_19_0:addElement(var_19_20)

	var_19_0.ClanLeaderImage = var_19_20

	local var_19_21
	local var_19_22 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_19_1
	})

	var_19_22.id = "PlayerDetailsTitle"

	var_19_22.Text:setText(Engine.CBBHFCGDIC("MENU/PLAYER_DETAILS"), 0)
	var_19_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 823, _1080p * 1318, _1080p * 216, _1080p * 262)
	var_19_0:addElement(var_19_22)

	var_19_0.PlayerDetailsTitle = var_19_22

	local var_19_23
	local var_19_24 = {
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
		controllerIndex = var_19_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RegimentsMember", {
				controllerIndex = var_19_1
			})
		end,
		refreshChild = function(arg_21_0, arg_21_1, arg_21_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_19_25 = LUI.UIGrid.new(var_19_24)

	var_19_25.id = "ClanMembersGrid"

	var_19_25:setUseStencil(true)
	var_19_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 304, _1080p * 954)
	var_19_0:addElement(var_19_25)

	var_19_0.ClanMembersGrid = var_19_25

	local var_19_26
	local var_19_27 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_19_1
	})

	var_19_27.id = "VerticalScrollbar"

	var_19_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 114, _1080p * 304, _1080p * 926)
	var_19_0:addElement(var_19_27)

	var_19_0.VerticalScrollbar = var_19_27

	local var_19_28
	local var_19_29 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_19_1
	})

	var_19_29.id = "ManageClanContainer"

	if CONDITIONS.AlwaysFalse(var_19_0) then
		var_19_29.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_REGIMENT"), 0)
	end

	var_19_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 299, _1080p * 269, _1080p * 300)
	var_19_0:addElement(var_19_29)

	var_19_0.ManageClanContainer = var_19_29

	local var_19_30
	local var_19_31 = LUI.UIText.new()

	var_19_31.id = "ClanSlotStatus"

	var_19_31:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_19_31:setText("", 0)
	var_19_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_31:SetWordWrap(false)
	var_19_31:SetAlignment(LUI.Alignment.Right)
	var_19_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 630, _1080p * 276, _1080p * 296)
	var_19_0:addElement(var_19_31)

	var_19_0.ClanSlotStatus = var_19_31

	local var_19_32
	local var_19_33 = LUI.UIStyledText.new()

	var_19_33.id = "ClanNameAndTag"

	var_19_33:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_19_33:setText("", 0)
	var_19_33:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_19_33:SetWordWrap(false)
	var_19_33:SetAlignment(LUI.Alignment.Left)
	var_19_33:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_33:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_33:SetStartupDelay(1000)
	var_19_33:SetLineHoldTime(400)
	var_19_33:SetAnimMoveTime(1000)
	var_19_33:SetAnimMoveSpeed(150)
	var_19_33:SetEndDelay(1000)
	var_19_33:SetCrossfadeTime(1000)
	var_19_33:SetFadeInTime(300)
	var_19_33:SetFadeOutTime(300)
	var_19_33:SetMaxVisibleLines(1)
	var_19_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 744, _1080p * 211, _1080p * 261)
	var_19_0:addElement(var_19_33)

	var_19_0.ClanNameAndTag = var_19_33

	local var_19_34
	local var_19_35 = LUI.UIStyledText.new()

	var_19_35.id = "HappyHourTimerInfo"

	var_19_35:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_19_35:setText("", 0)
	var_19_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_35:SetAlignment(LUI.Alignment.Left)
	var_19_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1406, _1080p * 1797, _1080p * 273, _1080p * 301)
	var_19_0:addElement(var_19_35)

	var_19_0.HappyHourTimerInfo = var_19_35

	local var_19_36
	local var_19_37 = LUI.UIStyledText.new()

	var_19_37.id = "HappyHourTimer"

	var_19_37:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_19_37:setText("", 0)
	var_19_37:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_19_37:SetAlignment(LUI.Alignment.Left)
	var_19_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1406, _1080p * 1797, _1080p * 304, _1080p * 326)
	var_19_0:addElement(var_19_37)

	var_19_0.HappyHourTimer = var_19_37

	local var_19_38
	local var_19_39 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_19_1
	})

	var_19_39.id = "ActiveTag"

	var_19_39.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_19_39.Backer:SetAlpha(0.3, 0)
	var_19_39.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_19_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1665, _1080p * 1815, _1080p * 224, _1080p * 254)
	var_19_0:addElement(var_19_39)

	var_19_0.ActiveTag = var_19_39

	local var_19_40
	local var_19_41 = MenuBuilder.BuildRegisteredType("RegimentsInviteButton", {
		controllerIndex = var_19_1
	})

	var_19_41.id = "RegimentsInviteButton"

	var_19_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 311, _1080p * 461, _1080p * 269, _1080p * 300)
	var_19_0:addElement(var_19_41)

	var_19_0.RegimentsInviteButton = var_19_41

	local function var_19_42()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_42

	local var_19_43 = {
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

	var_19_10:RegisterAnimationSequence("AR", var_19_43)

	local var_19_44 = {
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

	var_19_12:RegisterAnimationSequence("AR", var_19_44)

	local var_19_45 = {
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

	var_19_18:RegisterAnimationSequence("AR", var_19_45)

	local var_19_46 = {
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

	var_19_20:RegisterAnimationSequence("AR", var_19_46)

	local var_19_47 = {
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

	var_19_31:RegisterAnimationSequence("AR", var_19_47)

	local var_19_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		}
	}

	var_19_33:RegisterAnimationSequence("AR", var_19_48)

	local var_19_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 309
		}
	}

	var_19_35:RegisterAnimationSequence("AR", var_19_49)

	local var_19_50 = {
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

	var_19_37:RegisterAnimationSequence("AR", var_19_50)

	local var_19_51 = {
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

	var_19_41:RegisterAnimationSequence("AR", var_19_51)

	local function var_19_52()
		var_19_10:AnimateSequence("AR")
		var_19_12:AnimateSequence("AR")
		var_19_18:AnimateSequence("AR")
		var_19_20:AnimateSequence("AR")
		var_19_31:AnimateSequence("AR")
		var_19_33:AnimateSequence("AR")
		var_19_35:AnimateSequence("AR")
		var_19_37:AnimateSequence("AR")
		var_19_41:AnimateSequence("AR")
	end

	var_19_0._sequences.AR = var_19_52

	local var_19_53 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_19_8:RegisterAnimationSequence("IsOwner", var_19_53)

	local var_19_54 = {
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

	var_19_10:RegisterAnimationSequence("IsOwner", var_19_54)

	local var_19_55 = {
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

	var_19_12:RegisterAnimationSequence("IsOwner", var_19_55)

	local var_19_56 = {
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

	var_19_18:RegisterAnimationSequence("IsOwner", var_19_56)

	local var_19_57 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("IsOwner", var_19_57)

	local function var_19_58()
		var_19_8:AnimateSequence("IsOwner")
		var_19_10:AnimateSequence("IsOwner")
		var_19_12:AnimateSequence("IsOwner")
		var_19_18:AnimateSequence("IsOwner")
		var_19_20:AnimateSequence("IsOwner")
	end

	var_19_0._sequences.IsOwner = var_19_58

	local var_19_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_19_8:RegisterAnimationSequence("IsOfficer", var_19_59)

	local var_19_60 = {
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

	var_19_10:RegisterAnimationSequence("IsOfficer", var_19_60)

	local var_19_61 = {
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

	var_19_12:RegisterAnimationSequence("IsOfficer", var_19_61)

	local var_19_62 = {
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

	var_19_18:RegisterAnimationSequence("IsOfficer", var_19_62)

	local var_19_63 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("IsOfficer", var_19_63)

	local function var_19_64()
		var_19_8:AnimateSequence("IsOfficer")
		var_19_10:AnimateSequence("IsOfficer")
		var_19_12:AnimateSequence("IsOfficer")
		var_19_18:AnimateSequence("IsOfficer")
		var_19_20:AnimateSequence("IsOfficer")
	end

	var_19_0._sequences.IsOfficer = var_19_64

	local var_19_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		}
	}

	var_19_8:RegisterAnimationSequence("IsMember", var_19_65)

	local var_19_66 = {
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

	var_19_10:RegisterAnimationSequence("IsMember", var_19_66)

	local var_19_67 = {
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

	var_19_12:RegisterAnimationSequence("IsMember", var_19_67)

	local var_19_68 = {
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

	var_19_18:RegisterAnimationSequence("IsMember", var_19_68)

	local var_19_69 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("IsMember", var_19_69)

	local function var_19_70()
		var_19_8:AnimateSequence("IsMember")
		var_19_10:AnimateSequence("IsMember")
		var_19_12:AnimateSequence("IsMember")
		var_19_18:AnimateSequence("IsMember")
		var_19_20:AnimateSequence("IsMember")
	end

	var_19_0._sequences.IsMember = var_19_70

	local var_19_71 = {
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

	var_19_41:RegisterAnimationSequence("RU", var_19_71)

	local function var_19_72()
		var_19_41:AnimateSequence("RU")
	end

	var_19_0._sequences.RU = var_19_72

	local var_19_73 = {
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

	var_19_41:RegisterAnimationSequence("JP", var_19_73)

	local function var_19_74()
		var_19_41:AnimateSequence("JP")
	end

	var_19_0._sequences.JP = var_19_74

	local var_19_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		}
	}

	var_19_8:RegisterAnimationSequence("ARIsMember", var_19_75)

	local var_19_76 = {
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

	var_19_10:RegisterAnimationSequence("ARIsMember", var_19_76)

	local var_19_77 = {
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

	var_19_12:RegisterAnimationSequence("ARIsMember", var_19_77)

	local var_19_78 = {
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

	var_19_18:RegisterAnimationSequence("ARIsMember", var_19_78)

	local var_19_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("ARIsMember", var_19_79)

	local function var_19_80()
		var_19_8:AnimateSequence("ARIsMember")
		var_19_10:AnimateSequence("ARIsMember")
		var_19_12:AnimateSequence("ARIsMember")
		var_19_18:AnimateSequence("ARIsMember")
		var_19_20:AnimateSequence("ARIsMember")
	end

	var_19_0._sequences.ARIsMember = var_19_80

	local var_19_81 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_19_8:RegisterAnimationSequence("ARIsOfficer", var_19_81)

	local var_19_82 = {
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

	var_19_10:RegisterAnimationSequence("ARIsOfficer", var_19_82)

	local var_19_83 = {
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

	var_19_12:RegisterAnimationSequence("ARIsOfficer", var_19_83)

	local var_19_84 = {
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

	var_19_18:RegisterAnimationSequence("ARIsOfficer", var_19_84)

	local var_19_85 = {
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

	var_19_20:RegisterAnimationSequence("ARIsOfficer", var_19_85)

	local function var_19_86()
		var_19_8:AnimateSequence("ARIsOfficer")
		var_19_10:AnimateSequence("ARIsOfficer")
		var_19_12:AnimateSequence("ARIsOfficer")
		var_19_18:AnimateSequence("ARIsOfficer")
		var_19_20:AnimateSequence("ARIsOfficer")
	end

	var_19_0._sequences.ARIsOfficer = var_19_86

	local var_19_87 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_19_8:RegisterAnimationSequence("ARIsOwner", var_19_87)

	local var_19_88 = {
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

	var_19_10:RegisterAnimationSequence("ARIsOwner", var_19_88)

	local var_19_89 = {
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

	var_19_12:RegisterAnimationSequence("ARIsOwner", var_19_89)

	local var_19_90 = {
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

	var_19_18:RegisterAnimationSequence("ARIsOwner", var_19_90)

	local var_19_91 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("ARIsOwner", var_19_91)

	local function var_19_92()
		var_19_8:AnimateSequence("ARIsOwner")
		var_19_10:AnimateSequence("ARIsOwner")
		var_19_12:AnimateSequence("ARIsOwner")
		var_19_18:AnimateSequence("ARIsOwner")
		var_19_20:AnimateSequence("ARIsOwner")
	end

	var_19_0._sequences.ARIsOwner = var_19_92

	local var_19_93 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_19_27,
		startCap = var_19_27.startCap,
		endCap = var_19_27.endCap,
		sliderArea = var_19_27.sliderArea,
		slider = var_19_27.sliderArea and var_19_27.sliderArea.slider,
		fixedSizeSlider = var_19_27.sliderArea and var_19_27.sliderArea.fixedSizeSlider
	})

	var_19_25:AddScrollbar(var_19_93)
	var_0_5(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("RegimentsMembersView", RegimentsMembersView)
LockTable(_M)
