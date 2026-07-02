module(..., package.seeall)

local var_0_0 = 3

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._currentMessageIndexDatasource:GetValue(arg_1_1) or 0
	local var_1_1 = arg_1_0._messageTable[var_1_0 + 1]
	local var_1_2 = var_1_1.lastTimeStamp
	local var_1_3 = Engine.DCJHCAFIIA()
	local var_1_4 = (var_1_1.timeSpent or 0) + Engine.BAHGDJFBEF(var_1_3, "-" .. var_1_2)

	var_1_1.timeSpent = var_1_4

	if var_1_4 >= var_0_0 and not var_1_1.messageRead and not var_1_1.actionFunction then
		var_1_1.messageRead = true

		CRM.ViewMessage(var_1_1, arg_1_1)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 > 1 then
		arg_2_0.Pips:Resize(arg_2_1)
		arg_2_0.Pips:UpdateChildren(arg_2_2, 0)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0._currentMessageIndexDatasource:GetValue(arg_3_0._controllerIndex) or 0
	local var_3_1 = arg_3_0._messageTable[var_3_0 + 1]

	if not var_3_1 then
		return
	end

	if arg_3_0.CRMWindow then
		arg_3_0.CRMWindow:closeTree()
	end

	local var_3_2 = {
		messageIndex = var_3_1[CRM.keys.MESSAGE_INDEX],
		forceOpen = arg_3_2,
		locationIndex = var_3_1[CRM.keys.LOCATION_ID],
		layoutType = var_3_1[CRM.keys.LAYOUT_TYPE],
		controllerIndex = arg_3_1
	}
	local var_3_3 = CRM.InitPopupWindow(arg_3_0, var_3_1, var_3_2)

	var_0_2(arg_3_0, #arg_3_0._messageTable, var_3_0)
	var_3_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	arg_3_0:addElement(var_3_3)

	arg_3_0.CRMWindow = var_3_3
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	if not arg_4_0.bindButton then
		local var_4_0 = LUI.UIBindButton.new()

		var_4_0.id = "selfBindButton"

		arg_4_0:addElement(var_4_0)

		arg_4_0.bindButton = var_4_0
	end

	if arg_4_2 and arg_4_2.MPTabsMenu then
		local var_4_1 = arg_4_0._currentMessageIndexDatasource:GetValue(arg_4_0._controllerIndex) or 0
		local var_4_2 = arg_4_0._messageTable[var_4_1 + 1]

		assert(var_4_2)

		if var_4_2.actionFunction then
			local var_4_3 = var_4_2[CRM.keys.ACTION]

			if var_4_3 == "goto_ingame" or var_4_3 == "battlepass_tier_gift" then
				arg_4_0.bindButton:registerEventHandler("button_primary", function(arg_5_0, arg_5_1)
					arg_4_0._lastButtonPressed = "button_primary"

					local var_5_0 = var_4_2.actionFunction(arg_4_0, arg_5_1)

					if var_5_0 then
						arg_4_2.MPTabsMenu:SetupOnRestoreFocusOverride(var_5_0)
						ACTIONS.LeaveMenu(arg_4_0)
					end

					return true
				end)
			else
				arg_4_0.bindButton:registerEventHandler("button_primary", function(arg_6_0, arg_6_1)
					var_4_2.actionFunction(arg_4_0, arg_6_1)
				end)
			end
		else
			arg_4_0.bindButton:registerEventHandler("button_primary", nil)
		end

		local var_4_4 = var_4_2[CRM.keys.LOCATION_ID] ~= CRM.locations.CS_NOTIFICATIONS and var_4_2[CRM.keys.LOCATION_ID] ~= CRM.locations.ENFORCEMENT_NOTIFICATIONS

		if CONDITIONS.IsStoreAllowed() and var_4_4 then
			arg_4_1:AddButtonHelperTextToElement(arg_4_1.ButtonHelperBar, {
				side = "left",
				button_ref = "button_alt2",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/STORE")
			})
			arg_4_0.bindButton:registerEventHandler("button_alt2", function(arg_7_0, arg_7_1)
				arg_4_0._lastButtonPressed = "button_alt2"

				arg_4_2.MPTabsMenu:SetupOnRestoreFocusOverride({
					tabToFocus = "MPStoreMenu"
				})
				ACTIONS.LeaveMenu(arg_4_0)
			end)
		else
			arg_4_1:RemoveButtonHelperTextFromElement(arg_4_1.ButtonHelperBar, "button_alt2", "left")
			arg_4_0.bindButton:registerEventHandler("button_alt2", nil)
		end
	else
		arg_4_1:RemoveButtonHelperTextFromElement(arg_4_1.ButtonHelperBar, "button_alt2", "left")
		arg_4_0.bindButton:registerEventHandler("button_alt2", nil)
	end
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_2.popupContainer)
	assert(arg_8_2.messageTable)

	arg_8_0._currentMessageIndexDatasource = LUI.DataSourceInGlobalModel.new("frontEnd.CRM.currentMessageIndex")
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0._messageTable = arg_8_2.messageTable
	arg_8_0._promotedItems = STORE.ParsePromotedItems(arg_8_1)

	var_0_3(arg_8_0, arg_8_1, arg_8_2.forceOpen)

	local function var_8_0(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
		arg_9_2.Background:setImage(RegisterMaterial(arg_9_3[CRM.keys.IMAGE]))
		arg_9_2:SetLayoutType(arg_9_3[CRM.keys.LAYOUT_TYPE])

		if arg_9_3[CRM.keys.LAYOUT_TYPE] == 1 then
			arg_9_2.Vignette:SetAlpha(0)
		elseif arg_9_3[CRM.keys.LAYOUT_TYPE] == 3 then
			ACTIONS.AnimateSequence(arg_9_2, "BLM")
			arg_9_2.Title:SetAlpha(1)
			arg_9_2.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM_VERTICAL")))
		else
			arg_9_2.Title:setText(arg_9_3[CRM.keys.TITLE])
			ACTIONS.AnimateSequence(arg_9_2, "Preview")

			if arg_9_3[CRM.keys.LAYOUT_TYPE] == 2 then
				ACTIONS.AnimateSequence(arg_9_2, "BundleVer")
				ACTIONS.AnimateSequence(arg_9_2, "BundlePreview")

				local var_9_0 = arg_9_3[CRM.keys.STORE_ITEM]

				if var_9_0 then
					local var_9_1 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_9_0, CSV.bundleIDs.cols.image)

					if var_9_1 and #var_9_1 > 0 then
						arg_9_2.Background:setImage(RegisterMaterial(var_9_1))
						arg_9_2.Background:SetAlpha(1)
					end

					if arg_9_0._promotedItems[tostring(var_9_0)] then
						ACTIONS.AnimateSequence(arg_9_2, "ShowHotItem")
					end
				end
			else
				arg_9_2.Vignette:SetAlpha(0.5)
			end
		end

		if not arg_9_2._handlersAdded then
			arg_9_2._handlersAdded = true
			arg_9_0._messageTable[arg_9_4 + 1].timeSpent = 0
			arg_9_0._messageTable[arg_9_4 + 1].lastTimeStamp = Engine.DCJHCAFIIA()

			arg_9_2:SetupContextualMenu({
				title = arg_9_3[CRM.keys.TITLE]
			})

			local var_9_2 = {
				id = "MOTD",
				actionName = Engine.CBBHFCGDIC("LUA_MENU/MORE_DETAILS"),
				actionFunction = function()
					arg_9_0.CRMWindow:ToggleDescriptionLength(arg_9_3)
				end,
				conditionFunction = function()
					return arg_9_0.CRMWindow and arg_9_0.CRMWindow.ToggleDescriptionLength
				end
			}

			arg_9_2:AddContextualMenuAction(var_9_2)
			arg_9_2:addEventHandler("button_over", function(arg_12_0, arg_12_1)
				arg_9_0._messageTable[arg_9_4 + 1].lastTimeStamp = Engine.DCJHCAFIIA()

				arg_9_0._currentMessageIndexDatasource:SetValue(arg_9_1, arg_9_4)
				var_0_3(arg_9_0, arg_9_1, arg_8_2.forceOpen)
				var_0_4(arg_9_0, arg_8_2.popupContainer, arg_8_2.sourceMenu)
				ACTIONS.AnimateSequence(arg_9_0, "Transition")
			end)
			arg_9_2:addEventHandler("button_up", function(arg_13_0, arg_13_1)
				var_0_1(arg_9_0, arg_9_1)
			end)

			local var_9_3 = arg_8_2 and arg_8_2.sourceMenu

			if var_9_3 and var_9_3.MPTabsMenu then
				local var_9_4 = arg_9_0._messageTable[arg_9_4 + 1]

				assert(var_9_4)

				if var_9_4.actionFunction then
					if var_9_4[CRM.keys.ACTION] == "goto_ingame" then
						arg_9_2:registerEventHandler("leftmouseup", function(arg_14_0, arg_14_1)
							local var_14_0 = var_9_4.actionFunction(arg_9_0, arg_14_1)

							if var_14_0 then
								var_9_3.MPTabsMenu:SetupOnRestoreFocusOverride(var_14_0)
								ACTIONS.LeaveMenu(arg_9_0)
							end

							return true
						end)
					else
						arg_9_2:registerEventHandler("leftmouseup", function(arg_15_0, arg_15_1)
							var_9_4.actionFunction(arg_9_0, arg_15_1)
						end)
					end
				else
					arg_9_2:registerEventHandler("leftmouseup", nil)
				end
			end
		end
	end

	arg_8_0.CRMListGrid:SetRefreshChild(function(arg_16_0, arg_16_1, arg_16_2)
		local var_16_0 = arg_8_0.CRMListGrid:GetContentIndex(arg_16_1, arg_16_2)
		local var_16_1 = arg_8_0._messageTable[var_16_0 + 1]

		var_8_0(arg_8_0, arg_8_1, arg_16_0, var_16_1, var_16_0)
	end)
	arg_8_0.CRMListGrid:SetNumChildren(#arg_8_0._messageTable)
	arg_8_0.CRMListGrid:RefreshContent()

	local var_8_1 = arg_8_0._currentMessageIndexDatasource:GetValue(arg_8_1) or 0

	if var_8_1 > arg_8_0.CRMListGrid:GetNumChildren() then
		var_8_1 = 0

		arg_8_0._currentMessageIndexDatasource:SetValue(arg_8_1, 0)
	end

	arg_8_0.CRMListGrid:SetFocusedPosition({
		y = 0,
		x = var_8_1
	}, true)
	arg_8_0.ArrowLeft:SetupArrow(LUI.BEARING.left)
	arg_8_0.ArrowRight:SetupArrow(LUI.BEARING.right)
	arg_8_0:addEventHandler("menu_close", function(arg_17_0, arg_17_1)
		local var_17_0 = arg_8_0._currentMessageIndexDatasource:GetValue(arg_8_1) or 0

		var_0_1(arg_17_0, arg_8_1)
		METRICS.CRMSendDlogEvent(arg_8_0, arg_8_0._controllerIndex, arg_8_0._messageTable, var_17_0, arg_8_0._lastButtonPressed)
	end)
end

function CRMMessages(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_18_0.id = "CRMMessages"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "BlackTransition"

	var_18_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_18_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -840, _1080p * 840, _1080p * 197, _1080p * 897)
	var_18_0:addElement(var_18_4)

	var_18_0.BlackTransition = var_18_4

	local var_18_5
	local var_18_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 6,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CRMListItem", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 432,
		rowHeight = _1080p * 240,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_18_7 = LUI.UIGrid.new(var_18_6)

	var_18_7.id = "CRMListGrid"

	var_18_7:SetScale(-0.4, 0)
	var_18_7:setUseStencil(true)
	var_18_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -1340, _1080p * 1340, _1080p * 687, _1080p * 927)
	var_18_0:addElement(var_18_7)

	var_18_0.CRMListGrid = var_18_7

	local var_18_8
	local var_18_9 = {
		spacing = _1080p * 8,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Left,
		buildPip = function()
			return MenuBuilder.BuildRegisteredType("Pip", {
				controllerIndex = var_18_1
			})
		end,
		controllerIndex = var_18_1
	}
	local var_18_10 = LUI.Pips.new(var_18_9)

	var_18_10.id = "Pips"

	var_18_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -804, _1080p * -696, _1080p * 884, _1080p * 888)
	var_18_0:addElement(var_18_10)

	var_18_0.Pips = var_18_10

	local var_18_11
	local var_18_12 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_18_1
	})

	var_18_12.id = "ArrowLeft"

	var_18_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_18_12.Arrow:SetZRotation(90, 0)
	var_18_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -834, _1080p * -802, _1080p * -289, _1080p * -257)
	var_18_0:addElement(var_18_12)

	var_18_0.ArrowLeft = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "ArrowRight"

	var_18_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_18_14.Arrow:SetZRotation(-90, 0)
	var_18_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 802, _1080p * 834, _1080p * 791, _1080p * 823)
	var_18_0:addElement(var_18_14)

	var_18_0.ArrowRight = var_18_14

	local function var_18_15()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_15

	local var_18_16
	local var_18_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_18_4:RegisterAnimationSequence("Transition", var_18_17)

	local function var_18_18()
		var_18_4:AnimateSequence("Transition")
	end

	var_18_0._sequences.Transition = var_18_18

	var_18_7:AddArrow(var_18_12)
	var_18_7:AddArrow(var_18_14)
	var_0_5(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("CRMMessages", CRMMessages)
LockTable(_M)
