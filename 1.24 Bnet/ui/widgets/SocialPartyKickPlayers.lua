module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0)
	arg_1_0:Wait(1000).onComplete = function()
		return var_0_1(arg_1_0)
	end
	arg_1_0._privatePartyMembers = Friends.BJDEIGDDCD(true)

	arg_1_0.PlayersGrid:SetNumChildren(#arg_1_0._privatePartyMembers)
	arg_1_0.PlayersGrid:RefreshContent()

	if #arg_1_0._privatePartyMembers == 0 then
		arg_1_0.NoPlayersLabel:SetAlpha(1)
	else
		arg_1_0.NoPlayersLabel:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local function var_3_0(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_3_0._privatePartyMembers[arg_4_2 + 1]

		arg_4_0.FullName:setText(var_4_0.gamertag)
		arg_4_0.MuteIcon:SetAlpha(var_4_0.isMuted and 1 or 0)
		arg_4_0.LeaderIcon:SetAlpha(var_4_0.isPartyHost and 1 or 0)

		if var_4_0.clientPlatform ~= nil then
			arg_4_0.PlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_4_0.clientPlatform])
		end

		local var_4_1 = EmblemEditorUtils.GetEmblemImageFromID(var_4_0.emblemIndex)

		arg_4_0.Emblem:setImage(RegisterMaterial(var_4_1))
		arg_4_0:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
			local var_5_0 = Friends.CAIJHBHGGC(var_4_0.xuidString)

			Lobby.DFFAEAIHGG(var_5_0)
		end)

		if not arg_4_0.bindButton then
			local var_4_2 = LUI.UIBindButton.new()

			var_4_2.id = "bindButton"

			arg_4_0:addElement(var_4_2)

			arg_4_0.bindButton = var_4_2
		end

		arg_4_0.bindButton:registerEventHandler("button_alt2", function(arg_6_0, arg_6_1)
			if arg_6_0:getParent():isInFocus() and Engine.HDGDBCJFG() and not var_4_0.isCrossplayPlayer and Friends.GGDCJJGBI(arg_3_1) then
				Friends.CFBFGBECEB(arg_3_1, var_4_0.platformId)
			end
		end)
	end

	arg_3_0.PlayersGrid:SetRefreshChild(var_3_0)
	arg_3_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS")))
	var_0_1(arg_3_0)

	if #arg_3_0._privatePartyMembers == 0 then
		Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
	end

	if arg_3_0.KickSplitScreenPlayerButton then
		if not (Engine.JEDFGECDJ() > 1) then
			arg_3_0.KickSplitScreenPlayerButton:closeTree()

			arg_3_0.KickSplitScreenPlayerButton = nil
		else
			arg_3_0.KickSplitScreenPlayerButton:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
				local var_7_0 = Engine.CAGFAECIIG(1)

				if Engine.BGDHBAFGCG() then
					local var_7_1 = Engine.IJEBHJIJF()

					Engine.CDGCBCBAJ("Kicked splitscreen player", var_7_1)
					arg_3_0.KickSplitScreenPlayerButton:SetButtonDisabled(true)

					if arg_7_1.controller == var_7_0 then
						LUI.FlowManager.RequestPopupMenu(arg_3_0, "RemoveSelfSplitscreenPlayerPopup", false, var_7_1, false, {})
					end
				end
			end)
			arg_3_0.KickSplitScreenPlayerButton:registerEventHandler("button_over", function(arg_8_0, arg_8_1)
				arg_3_0.PlayersGrid:clearSavedState()
			end)
		end
	end
end

function SocialPartyKickPlayers(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalNavigator.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "SocialPartyKickPlayers"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "MenuTitle"

	var_9_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MPUI/REMOVE_PLAYERS")), 0)
	var_9_4.Line:SetLeft(0, 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 555, 0, _1080p * 100)
	var_9_0:addElement(var_9_4)

	var_9_0.MenuTitle = var_9_4

	local var_9_5
	local var_9_6 = {
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
		maxVisibleRows = SubtractForSplitscreen(15, 4),
		controllerIndex = var_9_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialPartyMember", {
				controllerIndex = var_9_1
			})
		end,
		refreshChild = function(arg_11_0, arg_11_1, arg_11_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 550,
		rowHeight = _1080p * 85,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_9_7 = LUI.UIGrid.new(var_9_6)

	var_9_7.id = "PlayersGrid"

	var_9_7:setUseStencil(true)
	var_9_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 680, _1080p * 226, _1080p * 950)
	var_9_0:addElement(var_9_7)

	var_9_0.PlayersGrid = var_9_7

	local var_9_8
	local var_9_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_9_1
	})

	var_9_9.id = "VerticalScrollbar"

	var_9_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107, _1080p * 120, _1080p * 226, _1080p * 950)
	var_9_0:addElement(var_9_9)

	var_9_0.VerticalScrollbar = var_9_9

	local var_9_10
	local var_9_11 = LUI.UIText.new()

	var_9_11.id = "NoPlayersLabel"

	var_9_11:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_9_11:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_PLAYERS_TO_KICK"), 0)
	var_9_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_11:SetAlignment(LUI.Alignment.Center)
	var_9_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 478, _1080p * 510)
	var_9_0:addElement(var_9_11)

	var_9_0.NoPlayersLabel = var_9_11

	local var_9_12

	if Engine.DDJFBBJAIG() and Engine.HDGDBCJFG() then
		local var_9_13 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_9_1
		})

		var_9_13.id = "KickSplitScreenPlayerButton"

		if Engine.DDJFBBJAIG() and Engine.HDGDBCJFG() then
			-- block empty
		end

		var_9_13.Text:SetLeft(_1080p * 20, 0)
		var_9_13.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_SPLITSCREEN_PLAYER"), 0)
		var_9_13.Text:SetAlignment(LUI.Alignment.Left)
		var_9_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 680, _1080p * 169, _1080p * 205)
		var_9_0:addElement(var_9_13)

		var_9_0.KickSplitScreenPlayerButton = var_9_13
	end

	local var_9_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_9_9,
		startCap = var_9_9.startCap,
		endCap = var_9_9.endCap,
		sliderArea = var_9_9.sliderArea,
		slider = var_9_9.sliderArea and var_9_9.sliderArea.slider,
		fixedSizeSlider = var_9_9.sliderArea and var_9_9.sliderArea.fixedSizeSlider
	})

	var_9_7:AddScrollbar(var_9_14)
	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SocialPartyKickPlayers", SocialPartyKickPlayers)
LockTable(_M)
