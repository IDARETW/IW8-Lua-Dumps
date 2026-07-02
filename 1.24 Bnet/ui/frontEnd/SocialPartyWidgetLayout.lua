module(..., package.seeall)

local var_0_0 = 1000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.partyMemberSettings = Friends.BJDEIGDDCD()[arg_1_2]

	local function var_1_0(arg_2_0, arg_2_1)
		return function()
			local var_3_0 = arg_2_0.partyMemberSettings

			return {
				platformId = "0",
				isContextualMenu = true,
				xuid = Friends.CAIJHBHGGC(var_3_0.xuidString),
				xuidString = var_3_0.xuidString,
				selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS,
				controllerIndex = arg_2_1,
				presencePlatform = ClientPlatformToPresencePlatform[var_3_0.clientPlatform],
				gamertag = var_3_0.gamertag,
				getButtonsCallback = function(arg_4_0)
					local var_4_0 = FRIENDS.GetFriendActions(arg_4_0)
					local var_4_1 = FRIENDS.GetLobbyMemberActions(arg_4_0)

					LUI.ConcatenateToTable(var_4_0, var_4_1)

					return var_4_0
				end
			}
		end
	end

	FRIENDS.SetupPlayerContextualMenuOptions(arg_1_0, arg_1_1, var_1_0(arg_1_0, arg_1_1))
end

local function var_0_2(arg_5_0)
	local var_5_0 = #arg_5_0._emblems

	if var_5_0 <= 0 then
		return
	end

	arg_5_0._emblems[var_5_0]:closeTree()

	arg_5_0._emblems[var_5_0] = nil

	local var_5_1 = var_5_0 - 1
end

local function var_0_3(arg_6_0, arg_6_1)
	local var_6_0 = #arg_6_0._emblems

	if var_6_0 >= arg_6_0._maxEmblems then
		return
	end

	local var_6_1 = var_6_0 + 1

	arg_6_0._emblems[var_6_1] = LUI.UIImage.new()
	arg_6_0._emblems[var_6_1].id = "Emblem" .. var_6_1

	arg_6_0._emblems[var_6_1]:SetAnchorsAndPosition(0, 1, 0, 1, 0, arg_6_0._emblemSize, 0, arg_6_0._emblemSize)
	arg_6_0._emblems[var_6_1]:SetAlpha(0)

	if var_6_1 == 1 then
		arg_6_0._emblems[var_6_1]:addElementAfter(arg_6_0.FriendsButton)
	else
		arg_6_0._emblems[var_6_1]:addElementAfter(arg_6_0._emblems[var_6_1 - 1])
	end

	arg_6_0._emblems[var_6_1]:SetHandleMouse(true)
	var_0_1(arg_6_0._emblems[var_6_1], arg_6_1, var_6_1)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 < 0 then
		for iter_7_0 = arg_7_2 + 1, 0 do
			var_0_2(arg_7_0)
		end
	elseif arg_7_2 > 0 then
		for iter_7_1 = arg_7_2 - 1, 0, -1 do
			var_0_3(arg_7_0, arg_7_1)
		end
	end

	local var_7_0 = Friends.BJDEIGDDCD()

	for iter_7_2, iter_7_3 in ipairs(arg_7_0._emblems) do
		if var_7_0[iter_7_2] and iter_7_3.index ~= var_7_0[iter_7_2].emblemIndex then
			iter_7_3.index = var_7_0[iter_7_2].emblemIndex

			local var_7_1 = EmblemEditorUtils.GetEmblemImageFromID(iter_7_3.index)

			iter_7_3:setImage(RegisterMaterial(var_7_1))
			iter_7_3:SetAlpha(1)
		end
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0

	local function var_8_1()
		local var_9_0 = 0

		var_0_4(arg_8_0, arg_8_1, var_9_0)

		arg_8_0:Wait(var_0_0).onComplete = var_8_1
	end

	var_8_1()
end

local function var_0_6(arg_10_0, arg_10_1)
	arg_10_0.BindButton = LUI.UIBindButton.new()
	arg_10_0.BindButton.id = "BindButton"

	arg_10_0.BindButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
	arg_10_0:addElement(arg_10_0.BindButton)

	local var_10_0 = "button_alt2"

	arg_10_0.BindButton:addEventHandler(var_10_0, function(arg_11_0, arg_11_1)
		if arg_10_0._socialMenuEnabled then
			FRIENDS.OpenFriendsList(arg_11_1.controller)
		end
	end)

	arg_10_0._buttonAdded = true

	local var_10_1 = {
		promptsData = {
			{
				keyprompt_text = "[{quick_social}]",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/FOOTER_TOOLTIP_SOCIAL"),
				button_ref = var_10_0
			}
		}
	}

	arg_10_0.FriendsButton.SocialPlayerButtonBackground:AddTooltipData(arg_10_1, var_10_1)
	arg_10_0.FriendsButton.SocialPlayerButtonBackground:registerEventHandler("button_action", function(arg_12_0, arg_12_1)
		if arg_10_0._socialMenuEnabled then
			FRIENDS.OpenFriendsList(arg_12_1.controller)
		end
	end)

	local function var_10_2(arg_13_0, arg_13_1)
		arg_13_0._isGamepad = LUI.IsLastInputGamepad(arg_13_1.controllerIndex)

		if arg_13_0._isGamepad then
			arg_13_0.FriendsButton.SocialPlayerButtonBackground:SetAlpha(0)
			arg_13_0.FriendsButton.SocialPlayerButtonBackground:SetFocusable(false)

			if not arg_13_0._buttonAdded then
				arg_13_0.PromptText:SetAlpha(1)
				arg_13_0.PromptIcon:SetAlpha(1)
				arg_13_0:addElement(arg_13_0.BindButton)

				arg_13_0._buttonAdded = true
			end
		else
			arg_13_0.FriendsButton.SocialPlayerButtonBackground:SetAlpha(1)
			arg_13_0.FriendsButton.SocialPlayerButtonBackground:SetFocusable(true)
			arg_13_0.FriendsButton.SocialPlayerButtonBackground:SetHandleMouse(true)

			if arg_13_0._buttonAdded then
				arg_13_0.PromptText:SetAlpha(0)
				arg_13_0.PromptIcon:SetAlpha(0)
				arg_13_0:RemoveElement(arg_13_0.BindButton)

				arg_13_0._buttonAdded = false
			end
		end
	end

	arg_10_0:addEventHandler("menu_create", function(arg_14_0, arg_14_1)
		arg_14_0:addAndCallEventHandler("update_input_type", var_10_2, {
			controllerIndex = arg_14_1.controller
		})
	end)
end

local function var_0_7(arg_15_0, arg_15_1)
	arg_15_0._socialMenuEnabled = arg_15_1

	if not arg_15_0._isGamepad then
		arg_15_0.FriendsButton.SocialPlayerButtonBackground:SetFocusable(arg_15_1)
		arg_15_0.FriendsButton.SocialPlayerButtonBackground:SetHandleMouse(arg_15_1)
	end
end

local function var_0_8(arg_16_0)
	local function var_16_0()
		local var_17_0 = DataSources.frontEnd.social.allRequestCount:GetValue(arg_16_0._controllerIndex)
		local var_17_1 = var_17_0 and var_17_0 > 0

		arg_16_0.SocialNotification:SetAlpha(var_17_1 and 1 or 0)
	end

	arg_16_0:SubscribeToModel(DataSources.frontEnd.social.allRequestCount:GetModel(arg_16_0._controllerIndex), var_16_0)
end

local function var_0_9(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_0.Emblem)
	assert(arg_18_0.PromptText)

	arg_18_0.EnableSocialMenu = var_0_7
	arg_18_0._isGamepad = LUI.IsLastInputGamepad(arg_18_1)
	arg_18_0._socialMenuEnabled = true

	arg_18_0:SetAlignment(LUI.Alignment.Right)

	local var_18_0, var_18_1, var_18_2, var_18_3 = arg_18_0.Emblem:getLocalRect()

	arg_18_0._emblemSize = var_18_2 - var_18_0
	arg_18_0._maxEmblems = Dvar.CFHDGABACF("NPOPOROTQM")
	arg_18_0._partyCount = 0
	arg_18_0._emblems = {
		arg_18_0.Emblem
	}

	var_0_2(arg_18_0)
	var_0_5(arg_18_0, arg_18_1)
	var_0_6(arg_18_0, arg_18_1)

	local var_18_4 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_18_0:SubscribeToModel(var_18_4:GetModel(arg_18_1), function()
		arg_18_0._maxEmblems = Dvar.CFHDGABACF("NPOPOROTQM")

		local var_19_0 = var_18_4:GetValue(arg_18_1)

		if var_19_0 and var_19_0 > 0 then
			local var_19_1 = var_19_0 - arg_18_0._partyCount

			arg_18_0._partyCount = var_19_0

			var_0_4(arg_18_0, arg_18_1, var_19_1)
		end
	end)

	local var_18_5 = DataSources.frontEnd.lobby.isDedi

	local function var_18_6()
		local var_20_0 = var_18_5:GetValue(arg_18_1)

		if not Lobby.BBDICGHE() or var_20_0 then
			arg_18_0.IsDediMarker:SetAlpha(0)
		else
			arg_18_0.IsDediMarker:SetAlpha(0.25)
		end
	end

	arg_18_0:SubscribeToModel(var_18_5:GetModel(arg_18_1), var_18_6)
	var_0_8(arg_18_0)

	local var_18_7

	local function var_18_8()
		arg_18_0:Wait(500).onComplete = function()
			return var_18_8()
		end

		var_18_6()
	end

	var_18_8()
end

function SocialPartyWidgetLayout(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIHorizontalStackedLayout.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 64 * _1080p)

	var_23_0.id = "SocialPartyWidgetLayout"

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0

	var_23_0:SetSpacing(2 * _1080p)

	local var_23_3
	local var_23_4 = LUI.UIStyledText.new()

	var_23_4.id = "PromptIcon"

	var_23_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_23_4:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT2_BUTTON"), 0)
	var_23_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_4:SetAlignment(LUI.Alignment.Left)
	var_23_4:SetTintFontIcons(true)
	var_23_4:SetShadowRGBFromInt(0, 0)
	var_23_4:SetOutlineRGBFromInt(0, 0)
	var_23_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 24, _1080p * 22, _1080p * -22)
	var_23_0:addElement(var_23_4)

	var_23_0.PromptIcon = var_23_4

	local var_23_5
	local var_23_6 = LUI.UIImage.new()

	var_23_6.id = "IconSpacer"

	var_23_6:SetAlpha(0, 0)
	var_23_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 26, _1080p * 28, 0, _1080p * 64)
	var_23_0:addElement(var_23_6)

	var_23_0.IconSpacer = var_23_6

	local var_23_7
	local var_23_8 = LUI.UIStyledText.new()

	var_23_8.id = "PromptText"

	var_23_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_23_8:setText(Engine.CBBHFCGDIC("LUA_MENU/SOCIAL_LOWERCASE"), 0)
	var_23_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_8:SetAlignment(LUI.Alignment.Left)
	var_23_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_8:SetTintFontIcons(true)
	var_23_8:SetShadowRGBFromInt(0, 0)
	var_23_8:SetOutlineRGBFromInt(0, 0)
	var_23_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 30, _1080p * 206, _1080p * 18, _1080p * -18)
	var_23_0:addElement(var_23_8)

	var_23_0.PromptText = var_23_8

	local var_23_9
	local var_23_10 = LUI.UIImage.new()

	var_23_10.id = "NotificationSpacer"

	var_23_10:SetAlpha(0, 0)
	var_23_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 208, _1080p * 218, 0, _1080p * 64)
	var_23_0:addElement(var_23_10)

	var_23_0.NotificationSpacer = var_23_10

	local var_23_11
	local var_23_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_23_1
	})

	var_23_12.id = "SocialNotification"

	var_23_12:SetAlpha(0, 0)
	var_23_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 220, _1080p * 228, _1080p * 28, _1080p * 36)
	var_23_0:addElement(var_23_12)

	var_23_0.SocialNotification = var_23_12

	local var_23_13
	local var_23_14 = LUI.UIImage.new()

	var_23_14.id = "Spacer"

	var_23_14:SetAlpha(0, 0)
	var_23_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 230, _1080p * 240, 0, _1080p * 64)
	var_23_0:addElement(var_23_14)

	var_23_0.Spacer = var_23_14

	local var_23_15
	local var_23_16 = LUI.UIImage.new()

	var_23_16.id = "Emblem"

	var_23_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 242, _1080p * 306, _1080p * -32, _1080p * 32)
	var_23_0:addElement(var_23_16)

	var_23_0.Emblem = var_23_16

	local var_23_17
	local var_23_18 = LUI.UIImage.new()

	var_23_18.id = "IsDediMarker"

	var_23_18:SetAlpha(0, 0)
	var_23_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 310, _1080p * 22, _1080p * 42)
	var_23_0:addElement(var_23_18)

	var_23_0.IsDediMarker = var_23_18

	local var_23_19
	local var_23_20 = MenuBuilder.BuildRegisteredType("FriendsButton", {
		controllerIndex = var_23_1
	})

	var_23_20.id = "FriendsButton"

	var_23_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 312, _1080p * 516, _1080p * 16, _1080p * 48)
	var_23_0:addElement(var_23_20)

	var_23_0.FriendsButton = var_23_20

	var_0_9(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("SocialPartyWidgetLayout", SocialPartyWidgetLayout)
LockTable(_M)
