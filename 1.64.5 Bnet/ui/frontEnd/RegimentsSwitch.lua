module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT"))

	local var_1_0 = Clans.CEACCICGB(arg_1_1) or {}
	local var_1_1 = Engine.EAGGAEGHHA(arg_1_1)
	local var_1_2 = Clans.CFGBBBHFHB(arg_1_1)
	local var_1_3 = false
	local var_1_4 = 0

	for iter_1_0 = 1, #var_1_0 do
		if Clans.BFCDHGIGGC(arg_1_1, var_1_0[iter_1_0]) == var_1_1 then
			var_1_3 = true
		end

		if var_1_0[iter_1_0] == var_1_2 then
			var_1_4 = iter_1_0 - 1
		end
	end

	arg_1_0.RegimentsCount:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENTS_COUNT", #var_1_0, FRIENDS.CLANS_MAX_JOINED_CLANS))

	local var_1_5

	local function var_1_6(arg_2_0)
		local var_2_0

		if arg_2_0 == var_1_5 then
			for iter_2_0, iter_2_1 in ipairs(var_1_0) do
				if iter_2_1 ~= arg_2_0.clanID then
					var_2_0 = iter_2_1

					break
				end
			end
		end

		local var_2_1 = FRIENDS.RegimentPopupActions.LEAVE

		if arg_2_0.isLocalClientOwner then
			var_2_1 = FRIENDS.RegimentPopupActions.DELETE

			if Clans.DGGFBEFIBC(arg_1_1, arg_2_0.clanID) > 1 then
				var_2_1 = FRIENDS.RegimentPopupActions.CANNOT_DELETE
			end
		end

		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_1_1, false, {
			controllerIndex = arg_1_1,
			clanID = arg_2_0.clanID,
			switchToID = var_2_0,
			action = var_2_1
		})
	end

	local function var_1_7(arg_3_0, arg_3_1, arg_3_2)
		arg_3_0.isCreateButton = arg_3_2 + 1 > #var_1_0

		local var_3_0

		if arg_3_0.isCreateButton then
			arg_3_0.ClanInfo:setText(Engine.CBBHFCGDIC("LUA_MENU/CREATE_GROUP_BUTTON_LABEL", Engine.JCBDICCAH(arg_3_2 + 1)))

			arg_3_0.IsCreateGroup = true
		else
			var_3_0 = Clans.GFFJCJFIJ(arg_1_1, var_1_0[arg_3_2 + 1])
			arg_3_0.clanID = var_1_0[arg_3_2 + 1]
			arg_3_0.isLocalClientOwner = Clans.BFCDHGIGGC(arg_1_1, arg_3_0.clanID) == var_1_1

			if arg_3_0.isLocalClientOwner then
				arg_3_0.Owner:SetAlpha(1)
			else
				arg_3_0.Owner:SetAlpha(0)
			end

			local var_3_1 = Clans.DGGFBEFIBC(arg_1_1, arg_3_0.clanID)

			arg_3_0.numMembers = var_3_1

			local var_3_2 = Clans.HAHBJIIFJ(arg_1_1, arg_3_0.clanID)

			arg_3_0.ClanInfo:setText(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT_INFO", Engine.JCBDICCAH(var_3_0.name), Engine.JCBDICCAH(var_3_2), Engine.JCBDICCAH(var_3_1)))

			if Clans.DFEAHHEHGJ(arg_1_1, var_1_0[arg_3_2 + 1]) then
				arg_3_0.ActiveClan:SetAlpha(1)

				var_1_5 = arg_3_0
			end
		end

		if not arg_3_0._hasButtonHandlers then
			local var_3_3 = LUI.UIBindButton.new()

			var_3_3.id = "childBindButton"

			arg_3_0:addElement(var_3_3)

			arg_3_0.bindButton = var_3_3

			arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
				if arg_4_0.isCreateButton then
					arg_4_0:RemoveButtonHelperText("button_alt1", "left")
				elseif arg_4_0.isLocalClientOwner and arg_4_0.numMembers > 1 then
					arg_4_0:AddButtonHelperText({
						side = "left",
						button_ref = "button_alt1",
						helper_text = ""
					})
				elseif arg_4_0.isLocalClientOwner then
					arg_4_0:AddButtonHelperText({
						side = "left",
						priority = 10,
						gamepad_only = true,
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DELETE_REGIMENT")
					})
				else
					arg_4_0:AddButtonHelperText({
						side = "left",
						priority = 10,
						gamepad_only = true,
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT")
					})
				end
			end)
			arg_3_0.bindButton:addEventHandler("button_alt1", function(arg_5_0, arg_5_1)
				local var_5_0 = arg_5_0:getParent()

				if not var_5_0:isInFocus() then
					return
				elseif var_5_0.isLocalClientOwner and var_5_0.numMembers > 1 then
					return
				elseif var_5_0.isCreateButton then
					return
				end

				if LUI.IsLastInputGamepad(arg_1_1) then
					var_1_6(arg_3_0)
				end

				return true
			end)
			arg_3_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
				if arg_6_0.isCreateButton then
					ACTIONS.LeaveMenu(arg_1_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RegimentsCreationPopup", true, arg_1_1, false, {
						init = true,
						controllerIndex = arg_1_1
					})
				elseif arg_6_0 ~= var_1_5 then
					LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_6_1.controller, false, {
						controllerIndex = arg_1_1,
						message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
					})

					if Clans.FAFJFADBJ(arg_1_1, arg_6_0.clanID) then
						if var_1_5 then
							var_1_5.ActiveClan:SetAlpha(0)
						end

						arg_6_0.ActiveClan:SetAlpha(1)

						var_1_5 = arg_6_0
					else
						LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
						LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
							title = Engine.CBBHFCGDIC("MENU/ERROR"),
							message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
						})
					end
				end
			end)

			if (arg_3_0.isLocalClientOwner and arg_3_0.numMembers < 2 or not arg_3_0.isLocalClientOwner) and not arg_3_0.isCreateButton then
				arg_3_0:SetupContextualMenu({
					title = var_3_0.name
				})

				local var_3_4

				if arg_3_0.isLocalClientOwner then
					var_3_4 = Engine.CBBHFCGDIC("LUA_MENU/DELETE_REGIMENT")
				else
					var_3_4 = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT")
				end

				local var_3_5 = {
					id = "switchRegiment",
					actionName = var_3_4,
					actionFunction = function()
						var_1_6(arg_3_0)
					end
				}

				arg_3_0:AddContextualMenuAction(var_3_5)
			end

			arg_3_0._hasButtonHandlers = true
		end
	end

	arg_1_0.RegimentsGrid:SetRefreshChild(var_1_7)
	arg_1_0.RegimentsGrid:SetDefaultFocus({
		x = 0,
		y = var_1_4
	})
	arg_1_0.RegimentsGrid:SetNumChildren(FRIENDS.CLANS_MAX_JOINED_CLANS)
	arg_1_0.RegimentsGrid:RefreshContent()
	arg_1_0:registerEventHandler("clans_notification", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.options

		if var_8_0.genEventName == "clans_activated_clan" then
			if var_8_0.success then
				arg_1_0:dispatchEventToRoot({
					name = "change_active_clan",
					newActiveClanID = var_8_0.clanId
				})
				ACTIONS.LeaveMenu(arg_1_0)
			else
				local var_8_1 = var_8_0.error
				local var_8_2 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_8_3 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = var_8_2,
					message = var_8_3
				})
			end

			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
		elseif var_8_0.genEventName == "clans_left_clan_inactive" or var_8_0.genEventName == "clans_kicked_from_clan" then
			if var_8_0.success then
				var_1_0 = Clans.CEACCICGB(arg_1_1) or {}

				arg_1_0.RegimentsGrid:RefreshContent()
			else
				local var_8_4 = var_8_0.error
				local var_8_5 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_8_6 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = var_8_5,
					message = var_8_6
				})
			end
		elseif var_8_0.genEventName == "clans_left_clan_active" then
			if var_8_0.success then
				arg_1_0:dispatchEventToRoot({
					newActiveClanID = -1,
					name = "change_active_clan"
				})
				ACTIONS.LeaveMenu(arg_1_0)
			else
				local var_8_7 = var_8_0.error
				local var_8_8 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_8_9 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = var_8_8,
					message = var_8_9
				})
			end
		end
	end)

	local function var_1_8(arg_9_0, arg_9_1)
		if not var_1_3 then
			arg_9_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt2",
				priority = 20,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATE")
			})
		end
	end

	arg_1_0:addEventHandler("menu_create", var_1_8)
	arg_1_0.bindButton:addEventHandler("button_alt2", function(arg_10_0, arg_10_1)
		if not var_1_3 then
			ACTIONS.LeaveMenu(arg_1_0)
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsCreationPopup", true, arg_1_1, false, {
				init = false,
				controllerIndex = arg_1_1
			})
		end
	end)
end

function RegimentsSwitch(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_11_0.id = "RegimentsSwitch"

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

	var_11_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT")), 0)
	var_11_4.Line:SetLeft(0, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_4)

	var_11_0.MenuTitle = var_11_4

	local var_11_5
	local var_11_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RegimentGridInfo", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 550,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_7 = LUI.UIGrid.new(var_11_6)

	var_11_7.id = "RegimentsGrid"

	var_11_7:setUseStencil(true)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 138, _1080p * 688, _1080p * 270, _1080p * 815)
	var_11_0:addElement(var_11_7)

	var_11_0.RegimentsGrid = var_11_7

	local var_11_8
	local var_11_9 = LUI.UIText.new()

	var_11_9.id = "RegimentsCount"

	var_11_9:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_9:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENTS_COUNT"), 0)
	var_11_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_9:SetAlignment(LUI.Alignment.Left)
	var_11_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 138, _1080p * 638, _1080p * 222, _1080p * 246)
	var_11_0:addElement(var_11_9)

	var_11_0.RegimentsCount = var_11_9

	local var_11_10 = LUI.UIBindButton.new()

	var_11_10.id = "selfBindButton"

	var_11_0:addElement(var_11_10)

	var_11_0.bindButton = var_11_10

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		if CONDITIONS.IsGamepadEnabled(var_11_0) then
			ACTIONS.LeaveMenu(var_11_0)
		end
	end)
	var_0_0(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("RegimentsSwitch", RegimentsSwitch)
LockTable(_M)
