module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.PlayersGrid:GetBuiltChildren()

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		iter_1_1:SetButtonDisabled(not arg_1_1)
	end

	arg_1_0.Spinner:SetAlpha(arg_1_1 and 0 or 1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1)

	arg_2_0._offset = arg_2_2 or 0

	local var_2_0 = arg_2_1.count or #arg_2_1

	if var_2_0 > 0 then
		ACTIONS.AnimateSequence(arg_2_0, "ShowGrid")

		if CONDITIONS.IsSplitscreen() then
			ACTIONS.AnimateSequence(arg_2_0, "Splitscreen")
		end

		arg_2_0._playersData = arg_2_1
	else
		ACTIONS.AnimateSequence(arg_2_0, "NoPlayer")
	end

	if arg_2_0.PlayersGrid:GetNumChildren() ~= var_2_0 then
		arg_2_0.PlayersGrid:SetNumChildren(var_2_0)
	end

	arg_2_0.PlayersGrid:RefreshContent()
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._tabID = arg_3_1
	arg_3_0._subTabID = arg_3_2
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1 and #arg_4_1 > 0 then
		arg_4_0.MenuTitle:SetAlpha(1)
		arg_4_0.MenuTitle:SetTitle(arg_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION")
	})

	local var_5_0 = {
		id = "RegimentInvitationAccepted",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
		actionFunction = function()
			FRIENDS.TryAndAcceptClanInvite(arg_5_2, arg_5_1.clanId)
		end,
		conditionFunction = function()
			return true
		end
	}

	arg_5_0:AddContextualMenuAction(var_5_0)

	local var_5_1 = {
		id = "RegimentInvitationDeclined",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
		actionFunction = function()
			Clans.DJIFJAAFAI(arg_5_2, arg_5_1.clanId)

			local var_8_0 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
			}

			arg_5_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_8_0
			})
		end,
		conditionFunction = function()
			return true
		end
	}

	arg_5_0:AddContextualMenuAction(var_5_1)
end

function PostLoadFunc(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._tabID = arg_10_2.tabID
	arg_10_0._subTabID = arg_10_2.subTabID
	arg_10_0._offset = 0
	arg_10_0.SetupPlayerGrid = var_0_1
	arg_10_0.SetMenuLocation = var_0_2
	arg_10_0.SetMenuTitle = var_0_3
	arg_10_0.SetGridButtonEnabled = var_0_0

	arg_10_0.PlayersGrid:SetNumChildren(0)
	arg_10_0.PlayersGrid:SetRefreshChild(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_10_0._playersData then
			local var_11_0 = arg_10_0._playersData[arg_11_2 + 1 + arg_10_0._offset]

			arg_11_0:SetCurrentLocation(arg_10_0._tabID, arg_10_0._subTabID)
			arg_11_0:SetupPlayerData(FRIENDS.UnifyPlayerDataFormat(var_11_0))

			local var_11_1 = LUI.FlowManager.GetVisibleMenu()

			if var_11_1 and var_11_1.id == "RegimentInvitationPopup" then
				var_0_4(arg_11_0, var_11_0, arg_10_1)
			end
		end
	end)

	if arg_10_2.noPlayerText then
		arg_10_0.NoPlayersLabel:setText(arg_10_2.noPlayerText)
	end

	var_0_3(arg_10_2.title)
end

function SocialPopupLayout(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "SocialPopupLayout"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(9, 4),
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_5 = LUI.UIGrid.new(var_12_4)

	var_12_5.id = "PlayersGrid"

	var_12_5:setUseStencil(true)
	var_12_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 143, _1080p * 653, _1080p * 207, _1080p * 963)
	var_12_0:addElement(var_12_5)

	var_12_0.PlayersGrid = var_12_5

	local var_12_6
	local var_12_7 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_12_1
	})

	var_12_7.id = "Scrollbar"

	var_12_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 671, _1080p * 684, _1080p * 209, _1080p * 959)
	var_12_0:addElement(var_12_7)

	var_12_0.Scrollbar = var_12_7

	local var_12_8
	local var_12_9 = LUI.UIText.new()

	var_12_9.id = "NoPlayersLabel"

	var_12_9:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_12_9:SetAlpha(0, 0)
	var_12_9:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_BLOCKED_PLAYERS"), 0)
	var_12_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_9:SetAlignment(LUI.Alignment.Center)
	var_12_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -16, _1080p * 16)
	var_12_0:addElement(var_12_9)

	var_12_0.NoPlayersLabel = var_12_9

	local var_12_10
	local var_12_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_12_1
	})

	var_12_11.id = "MenuTitle"

	var_12_11:SetAlpha(0, 0)
	var_12_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_PARTY")), 0)
	var_12_11.Line:SetLeft(0, 0)
	var_12_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_12_0:addElement(var_12_11)

	var_12_0.MenuTitle = var_12_11

	local var_12_12
	local var_12_13 = LUI.UIImage.new()

	var_12_13.id = "Spinner"

	var_12_13:SetAlpha(0, 0)
	var_12_13:setImage(RegisterMaterial("spinner_loading"), 0)
	var_12_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 622, _1080p * 193, _1080p * 203)
	var_12_0:addElement(var_12_13)

	var_12_0.Spinner = var_12_13

	local function var_12_14()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_14

	local var_12_15
	local var_12_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_5:RegisterAnimationSequence("NoPlayer", var_12_16)

	local var_12_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("NoPlayer", var_12_17)

	local function var_12_18()
		var_12_5:AnimateSequence("NoPlayer")
		var_12_9:AnimateSequence("NoPlayer")
	end

	var_12_0._sequences.NoPlayer = var_12_18

	local var_12_19
	local var_12_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_5:RegisterAnimationSequence("ShowGrid", var_12_20)

	local var_12_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("ShowGrid", var_12_21)

	local function var_12_22()
		var_12_5:AnimateSequence("ShowGrid")
		var_12_9:AnimateSequence("ShowGrid")
	end

	var_12_0._sequences.ShowGrid = var_12_22

	local var_12_23
	local var_12_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 578
		}
	}

	var_12_5:RegisterAnimationSequence("Splitscreen", var_12_24)

	local var_12_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 574
		}
	}

	var_12_7:RegisterAnimationSequence("Splitscreen", var_12_25)

	local function var_12_26()
		var_12_5:AnimateSequence("Splitscreen")
		var_12_7:AnimateSequence("Splitscreen")
	end

	var_12_0._sequences.Splitscreen = var_12_26

	local var_12_27 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_12_7,
		startCap = var_12_7.startCap,
		endCap = var_12_7.endCap,
		sliderArea = var_12_7.sliderArea,
		slider = var_12_7.sliderArea and var_12_7.sliderArea.slider,
		fixedSizeSlider = var_12_7.sliderArea and var_12_7.sliderArea.fixedSizeSlider
	})

	var_12_5:AddScrollbar(var_12_27)
	PostLoadFunc(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("SocialPopupLayout", SocialPopupLayout)
LockTable(_M)
