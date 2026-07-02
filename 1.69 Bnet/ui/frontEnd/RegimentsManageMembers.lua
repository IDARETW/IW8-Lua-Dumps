module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("RegimentsManageMembers", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0
	})

	var_1_1.id = "RegimentsMemberManagementPopup"

	return var_1_1
end

MenuBuilder.registerType("RegimentsMemberManagementPopup", var_0_0)

local var_0_1

local function var_0_2(arg_2_0)
	arg_2_0:Wait(1000, true).onComplete = function()
		return var_0_2(arg_2_0)
	end

	local var_2_0 = arg_2_0._clanMembers == nil and 0 or #arg_2_0._clanMembers

	arg_2_0._clanMembers = FRIENDS.GetGroupMembers(arg_2_0._controllerIndex, arg_2_0._clanID, arg_2_0._memberFilter) or {}

	local var_2_1 = #arg_2_0._clanMembers

	if var_2_0 ~= var_2_1 then
		arg_2_0.MembersGrid:SetNumChildren(var_2_1)
	end

	arg_2_0.MembersGrid:RefreshContent()
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.MenuTitle)

	local var_4_0 = arg_4_2.transferOwnership

	arg_4_0.MenuTitle:SetMaxRightEdge(785 * _1080p)

	if var_4_0 then
		arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP"))
		ACTIONS.AnimateSequence(arg_4_0, "TransferOwnership")
	else
		arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_MEMBERS"))
	end

	arg_4_0._controllerIndex = arg_4_1
	arg_4_0._clanID = arg_4_2.clanID
	arg_4_0._localClientRole = arg_4_2.localClientRole

	assert(arg_4_0._localClientRole ~= OnlineClanRole.MEMBER)

	arg_4_0._currentPlatform = Engine.CBBFHGEDGJ()

	local function var_4_1(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_4_0.MembersGrid:GetContentIndex(arg_5_1, arg_5_2)
		local var_5_1 = arg_4_0._clanMembers[var_5_0 + 1]

		arg_5_0.FullName:setText(var_5_1.name)

		if CONDITIONS.IsDisplayNameTag() and Engine.DDHAAEGIEI(arg_4_0._controllerIndex) and var_5_1.fullNamWithHash and #var_5_1.fullNamWithHash > 0 then
			arg_5_0.FullName:setText(var_5_1.fullNamWithHash)
		end

		arg_5_0.LeaderIcon:SetAlpha(var_5_1.role == OnlineClanRole.OWNER and 1 or 0)

		if var_5_1.platform ~= nil then
			arg_5_0.PlatformPresence:SetPlatformPresence(var_5_1.platform)
		else
			arg_5_0.PlatformPresence:SetAlpha(0)
		end

		if var_4_0 then
			arg_5_0.Action:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER"))
		elseif arg_4_0.activeTabID == FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS then
			arg_5_0.Action:setText(Engine.CBBHFCGDIC("LUA_MENU/ADD"))
		elseif arg_4_0.activeTabID == FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS then
			arg_5_0.Action:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE"))
		elseif arg_4_0.activeTabID == FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS then
			arg_5_0.Action:setText(Engine.CBBHFCGDIC("LUA_MENU/KICK"))
		else
			assert(false)
		end

		arg_5_0.data = var_5_1
		arg_5_0.xuid = var_5_1.xuid

		if not arg_5_0._hasButtonAction then
			arg_5_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
				if var_4_0 then
					LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_4_1, false, {
						controllerIndex = arg_4_1,
						clanID = arg_4_0._clanID,
						transferToXUID = arg_6_0.xuid,
						action = FRIENDS.RegimentPopupActions.TRANSFER
					})
				else
					local var_6_0 = {
						displayTime = 3000,
						icon = "hud_info_alert"
					}

					if arg_4_0.activeTabID == FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS then
						Clans.DIHIDEGEA(arg_4_1, arg_4_0._clanID, arg_6_0.xuid)

						var_6_0.description = Engine.CBBHFCGDIC("REGIMENTS/OFFICER_ADDED")
					elseif arg_4_0.activeTabID == FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS then
						Clans.DBAJADFEG(arg_4_1, arg_4_0._clanID, arg_6_0.xuid)

						var_6_0.description = Engine.CBBHFCGDIC("REGIMENTS/OFFICER_REMOVED")
					elseif arg_4_0.activeTabID == FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS then
						Clans.BJFFGACEBD(arg_4_1, arg_4_0._clanID, arg_6_0.xuid)

						var_6_0.description = Engine.CBBHFCGDIC("REGIMENTS/MEMBER_KICKED")
					else
						assert(false)
					end

					arg_4_0:dispatchEventToRoot({
						name = "send_toast_notification",
						immediate = true,
						options = var_6_0
					})
					var_0_2(arg_4_0)
				end
			end)
			arg_5_0:addEventHandler("gain_focus", function(arg_7_0, arg_7_1)
				local var_7_0 = arg_7_0.data

				if var_7_0.platform ~= nil then
					ACTIONS.AnimateSequence(arg_5_0, "ButtonOverPresence")
				else
					arg_5_0.PlatformPresence:SetAlpha(0)
				end

				if var_7_0.isMyPlayer then
					ACTIONS.AnimateSequence(arg_5_0, "IsPlayer")
				else
					ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
				end

				if Engine.HDGDBCJFG() or Engine.EAABDHIDFJ() then
					if Engine.FHHBECDJA() and var_7_0.platform == arg_4_0._currentPlatform or var_7_0.platform ~= nil and (Engine.EAABDHIDFJ() or Engine.FJCIBEDII()) and Friends.DJGEFEAJCI(PresencePlatformToClientPlatform[arg_4_0._currentPlatform], PresencePlatformToClientPlatform[var_7_0.platform]) then
						arg_4_0:AddButtonHelperText({
							side = "left",
							priority = 2,
							gamepad_only = true,
							button_ref = "button_alt2",
							helper_text = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
						})
					else
						arg_4_0:RemoveButtonHelperText("button_alt2", "left")
					end
				end
			end)
			arg_5_0:addEventHandler("lose_focus", function(arg_8_0, arg_8_1)
				local var_8_0 = arg_8_0.data

				if var_8_0.isMyPlayer then
					ACTIONS.AnimateSequence(arg_5_0, "IsPlayer")
				else
					ACTIONS.AnimateSequence(arg_5_0, "ButtonUp")
				end

				if var_8_0.platform ~= nil then
					ACTIONS.AnimateSequence(arg_5_0, "ButtonUpPresence")
				end

				if Engine.HDGDBCJFG() then
					arg_4_0:RemoveButtonHelperText("button_alt2", "left")
				end
			end)

			if not arg_5_0.bindButton then
				local var_5_2 = LUI.UIBindButton.new()

				var_5_2.id = "bindButton"

				arg_5_0:addElement(var_5_2)

				arg_5_0.bindButton = var_5_2
			end

			arg_5_0.bindButton:addEventHandler("button_alt2", function(arg_9_0, arg_9_1)
				local var_9_0 = arg_9_0:getParent()

				if var_9_0:isInFocus() then
					local var_9_1 = var_9_0.data

					if (Engine.FHHBECDJA() and var_9_1.platform == arg_4_0._currentPlatform or var_9_1.platform ~= nil and (Engine.EAABDHIDFJ() or Engine.FJCIBEDII()) and Friends.DJGEFEAJCI(PresencePlatformToClientPlatform[arg_4_0._currentPlatform], PresencePlatformToClientPlatform[var_9_1.platform])) and Friends.CCBABDAGGJ(arg_4_1, var_9_0.xuid, var_9_1.platformId or "0", FRIENDS.TabIDs.REGIMENTS).isValidEntry and Friends.GGDCJJGBI(arg_4_1) then
						if var_9_1.platformId and var_9_1.platformId ~= "0" then
							Friends.CFBFGBECEB(arg_4_1, var_9_1.platformId)
						elseif not Social.BFEBABDDDE(arg_4_1, var_9_0.xuid, "PlatformIdForViewProfile") then
							local var_9_2 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

							LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_4_1, false, {
								message = var_9_2
							})
						end

						return true
					end
				end
			end)

			arg_5_0._hasButtonAction = true
		end
	end

	arg_4_0.MembersGrid:SetRefreshChild(var_4_1)
	arg_4_0.MembersGrid:SetNumChildren(0)

	if var_4_0 then
		arg_4_0.Tabs:closeTree()

		arg_4_0.Tabs = nil
		arg_4_0._memberFilter = FRIENDS.RegimentMembersFilter.ALL + FRIENDS.RegimentMembersFilter.EXCLUDE_OWNER

		var_0_2(arg_4_0)
	else
		local var_4_2 = arg_4_0._localClientRole == OnlineClanRole.OWNER
		local var_4_3 = {}

		var_4_3[#var_4_3 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ADD_OFFICERS")),
			id = FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS,
			hasDefaultFocus = arg_4_2.defaultTabFocus == FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS,
			disabled = not var_4_2
		}
		var_4_3[#var_4_3 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_OFFICERS")),
			id = FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS,
			hasDefaultFocus = arg_4_2.defaultTabFocus == FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS,
			disabled = not var_4_2
		}
		var_4_3[#var_4_3 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KICK_MEMBERS")),
			id = FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS,
			hasDefaultFocus = arg_4_2.defaultTabFocus == FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS
		}
		arg_4_0.tabNamesAndIDs = var_4_3

		local var_4_4 = {}

		for iter_4_0, iter_4_1 in ipairs(var_4_3) do
			table.insert(var_4_4, {
				name = iter_4_1.name,
				hasDefaultFocus = iter_4_1.hasDefaultFocus,
				disabled = iter_4_1.disabled,
				focusFunction = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
					local var_10_0 = arg_4_0.tabNamesAndIDs[arg_10_2 + 1].id

					if arg_4_0.activeTabID ~= var_10_0 then
						arg_4_0.activeTabID = var_10_0

						arg_4_0.MembersGrid:SetNumChildren(0)

						arg_4_0._clanMembers = nil

						if var_10_0 == FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS then
							arg_4_0._memberFilter = FRIENDS.RegimentMembersFilter.NO_OFFICERS + FRIENDS.RegimentMembersFilter.EXCLUDE_OWNER
						elseif var_10_0 == FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS then
							arg_4_0._memberFilter = FRIENDS.RegimentMembersFilter.OFFICERS_ONLY + FRIENDS.RegimentMembersFilter.EXCLUDE_OWNER
						elseif var_10_0 == FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS then
							if arg_4_0._localClientRole == OnlineClanRole.OWNER then
								arg_4_0._memberFilter = FRIENDS.RegimentMembersFilter.ALL + FRIENDS.RegimentMembersFilter.EXCLUDE_OWNER
							else
								arg_4_0._memberFilter = FRIENDS.RegimentMembersFilter.NO_OFFICERS + FRIENDS.RegimentMembersFilter.EXCLUDE_OWNER
							end
						else
							assert(false)
						end

						var_0_2(arg_4_0)

						if arg_10_3 ~= FocusType.MouseOver and arg_10_3 ~= FocusType.MenuFlow then
							arg_4_0.MembersGrid:processEvent({
								name = "gain_focus"
							})
						end
					end

					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end

		arg_4_0.Tabs:SetTabs(var_4_4)
	end

	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_4_0, arg_4_1)
end

function RegimentsManageMembers(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_11_0.id = "RegimentsManageMembers"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "MenuTitle"

	var_11_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_MEMBERS")), 0)
	var_11_4.Line:SetLeft(0, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_4)

	var_11_0.MenuTitle = var_11_4

	local var_11_5
	local var_11_6 = {
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
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RegimentsMember", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_7 = LUI.UIGrid.new(var_11_6)

	var_11_7.id = "MembersGrid"

	var_11_7:setUseStencil(true)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 133, _1080p * 633, _1080p * 229, _1080p * 879)
	var_11_0:addElement(var_11_7)

	var_11_0.MembersGrid = var_11_7

	local var_11_8
	local var_11_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_9.id = "VerticalScrollbar"

	var_11_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 646, _1080p * 658, _1080p * 229, _1080p * 879)
	var_11_0:addElement(var_11_9)

	var_11_0.VerticalScrollbar = var_11_9

	local var_11_10
	local var_11_11 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_11_1
			})
		end,
		controllerIndex = var_11_1
	}
	local var_11_12 = LUI.TabManager.new(var_11_11)

	var_11_12.id = "Tabs"

	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 677, _1080p * 108, _1080p * 160)
	var_11_0:addElement(var_11_12)

	var_11_0.Tabs = var_11_12

	local function var_11_13()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_13

	local var_11_14
	local var_11_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 810
		}
	}

	var_11_7:RegisterAnimationSequence("TransferOwnership", var_11_15)

	local var_11_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 810
		}
	}

	var_11_9:RegisterAnimationSequence("TransferOwnership", var_11_16)

	local function var_11_17()
		var_11_7:AnimateSequence("TransferOwnership")
		var_11_9:AnimateSequence("TransferOwnership")
	end

	var_11_0._sequences.TransferOwnership = var_11_17

	local var_11_18 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_9,
		startCap = var_11_9.startCap,
		endCap = var_11_9.endCap,
		sliderArea = var_11_9.sliderArea,
		slider = var_11_9.sliderArea and var_11_9.sliderArea.slider,
		fixedSizeSlider = var_11_9.sliderArea and var_11_9.sliderArea.fixedSizeSlider
	})

	var_11_7:AddScrollbar(var_11_18)

	local var_11_19 = LUI.UIBindButton.new()

	var_11_19.id = "selfBindButton"

	var_11_0:addElement(var_11_19)

	var_11_0.bindButton = var_11_19

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_11_1
		end

		if CONDITIONS.IsGamepadEnabled(var_11_0) then
			ACTIONS.LeaveMenu(var_11_0)
		end
	end)
	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("RegimentsManageMembers", RegimentsManageMembers)
LockTable(_M)
