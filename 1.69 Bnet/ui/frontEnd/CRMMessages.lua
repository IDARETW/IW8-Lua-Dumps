module(..., package.seeall)

local var_0_0 = 3

local function var_0_1(arg_1_0)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		if iter_1_1.action and iter_1_1.action == "redeem" then
			table.insert(var_1_0, iter_1_1)
		end
	end

	return #var_1_0 > 0 and var_1_0 or arg_1_0
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0._currentMessageIndexDatasource:GetValue(arg_2_1) or 0
	local var_2_1 = arg_2_0._messageTable[var_2_0 + 1]
	local var_2_2 = var_2_1.lastTimeStamp
	local var_2_3 = Engine.DCJHCAFIIA()
	local var_2_4 = (var_2_1.timeSpent or 0) + Engine.BAHGDJFBEF(var_2_3, "-" .. var_2_2)

	var_2_1.timeSpent = var_2_4

	if var_2_4 >= var_0_0 and not var_2_1.messageRead and not var_2_1.actionFunction then
		var_2_1.messageRead = true

		CRM.ViewMessage(var_2_1, arg_2_1)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 > 1 then
		arg_3_0.Pips:Resize(arg_3_1)
		arg_3_0.Pips:UpdateChildren(arg_3_2, 0)
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0._currentMessageIndexDatasource:GetValue(arg_4_0._controllerIndex) or 0
	local var_4_1 = arg_4_0._messageTable[var_4_0 + 1]

	if not var_4_1 then
		return
	end

	if arg_4_0.CRMWindow then
		arg_4_0.CRMWindow:closeTree()
	end

	local var_4_2 = {
		messageIndex = var_4_1[CRM.keys.MESSAGE_INDEX],
		forceOpen = arg_4_2,
		locationIndex = var_4_1[CRM.keys.LOCATION_ID],
		layoutType = var_4_1[CRM.keys.LAYOUT_TYPE],
		controllerIndex = arg_4_1
	}
	local var_4_3 = CRM.InitPopupWindow(arg_4_0, var_4_1, var_4_2)

	var_0_3(arg_4_0, #arg_4_0._messageTable, var_4_0)
	var_4_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	arg_4_0:addElement(var_4_3)

	arg_4_0.CRMWindow = var_4_3
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_0.bindButton then
		local var_5_0 = LUI.UIBindButton.new()

		var_5_0.id = "selfBindButton"

		arg_5_0:addElement(var_5_0)

		arg_5_0.bindButton = var_5_0
	end

	if arg_5_2 and arg_5_2.MPTabsMenu then
		local var_5_1 = arg_5_0._currentMessageIndexDatasource:GetValue(arg_5_0._controllerIndex) or 0
		local var_5_2 = arg_5_0._messageTable[var_5_1 + 1]

		assert(var_5_2)

		local var_5_3 = var_5_2[CRM.keys.ACTION]

		if var_5_2.actionFunction then
			if var_5_3 == "goto_ingame" or var_5_3 == "battlepass_tier_gift" then
				arg_5_0.bindButton:registerEventHandler("button_primary", function(arg_6_0, arg_6_1)
					arg_5_0._lastButtonPressed = "button_primary"

					local var_6_0 = var_5_2.actionFunction(arg_5_0, arg_6_1)

					if var_6_0 then
						arg_5_2.MPTabsMenu:SetupOnRestoreFocusOverride(var_6_0)
						ACTIONS.LeaveMenu(arg_5_0)
					end

					return true
				end)
			else
				arg_5_0.bindButton:registerEventHandler("button_primary", function(arg_7_0, arg_7_1)
					var_5_2.actionFunction(arg_5_0, arg_7_1)
				end)
			end
		else
			arg_5_0.bindButton:registerEventHandler("button_primary", nil)
		end

		local var_5_4 = var_5_2[CRM.keys.LOCATION_ID] ~= CRM.locations.CS_NOTIFICATIONS and var_5_2[CRM.keys.LOCATION_ID] ~= CRM.locations.ENFORCEMENT_NOTIFICATIONS and var_5_3 ~= "redeem"

		if CONDITIONS.IsStoreAllowed() and var_5_4 then
			arg_5_1:AddButtonHelperTextToElement(arg_5_1.ButtonHelperBar, {
				side = "left",
				button_ref = "button_alt2",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/STORE")
			})
			arg_5_0.bindButton:registerEventHandler("button_alt2", function(arg_8_0, arg_8_1)
				arg_5_0._lastButtonPressed = "button_alt2"

				arg_5_2.MPTabsMenu:SetupOnRestoreFocusOverride({
					tabToFocus = "MPStoreMenu"
				})
				ACTIONS.LeaveMenu(arg_5_0)
			end)
		else
			arg_5_1:RemoveButtonHelperTextFromElement(arg_5_1.ButtonHelperBar, "button_alt2", "left")
			arg_5_0.bindButton:registerEventHandler("button_alt2", nil)
		end
	else
		arg_5_1:RemoveButtonHelperTextFromElement(arg_5_1.ButtonHelperBar, "button_alt2", "left")
		arg_5_0.bindButton:registerEventHandler("button_alt2", nil)
	end
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_2.popupContainer)
	assert(arg_9_2.messageTable)

	arg_9_0._currentMessageIndexDatasource = LUI.DataSourceInGlobalModel.new("frontEnd.CRM.currentMessageIndex")
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0._messageTable = arg_9_2.forceOpen and var_0_1(arg_9_2.messageTable) or arg_9_2.messageTable
	arg_9_0._promotedItems = STORE.ParsePromotedItems(arg_9_1)

	var_0_4(arg_9_0, arg_9_1, arg_9_2.forceOpen)

	local function var_9_0(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
		arg_10_2.Background:setImage(RegisterMaterial(arg_10_3[CRM.keys.IMAGE]))
		arg_10_2:SetLayoutType(arg_10_3[CRM.keys.LAYOUT_TYPE])

		if arg_10_3[CRM.keys.LAYOUT_TYPE] == 1 then
			arg_10_2.Vignette:SetAlpha(0)
		elseif arg_10_3[CRM.keys.LAYOUT_TYPE] == 3 then
			ACTIONS.AnimateSequence(arg_10_2, "BLM")
			arg_10_2.Title:SetAlpha(1)
			arg_10_2.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM_VERTICAL")))
		else
			arg_10_2.Title:setText(arg_10_3[CRM.keys.TITLE])
			ACTIONS.AnimateSequence(arg_10_2, "Preview")

			if arg_10_3[CRM.keys.LAYOUT_TYPE] == 2 then
				ACTIONS.AnimateSequence(arg_10_2, "BundleVer")
				ACTIONS.AnimateSequence(arg_10_2, "BundlePreview")

				local var_10_0 = arg_10_3[CRM.keys.STORE_ITEM]

				if var_10_0 then
					local var_10_1 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_10_0, CSV.bundleIDs.cols.image)

					if var_10_1 and #var_10_1 > 0 then
						arg_10_2.Background:setImage(RegisterMaterial(var_10_1))
						arg_10_2.Background:SetAlpha(1)
					end

					if arg_10_0._promotedItems[tostring(var_10_0)] then
						ACTIONS.AnimateSequence(arg_10_2, "ShowHotItem")
					end
				end
			else
				arg_10_2.Vignette:SetAlpha(0.5)
			end
		end

		if not arg_10_2._handlersAdded then
			arg_10_2._handlersAdded = true
			arg_10_0._messageTable[arg_10_4 + 1].timeSpent = 0
			arg_10_0._messageTable[arg_10_4 + 1].lastTimeStamp = Engine.DCJHCAFIIA()

			arg_10_2:SetupContextualMenu({
				title = arg_10_3[CRM.keys.TITLE]
			})

			local var_10_2 = {
				id = "MOTD",
				actionName = Engine.CBBHFCGDIC("LUA_MENU/MORE_DETAILS"),
				actionFunction = function()
					arg_10_0.CRMWindow:ToggleDescriptionLength(arg_10_3)
				end,
				conditionFunction = function()
					return arg_10_0.CRMWindow and arg_10_0.CRMWindow.ToggleDescriptionLength
				end
			}

			arg_10_2:AddContextualMenuAction(var_10_2)
			arg_10_2:addEventHandler("button_over", function(arg_13_0, arg_13_1)
				arg_10_0._messageTable[arg_10_4 + 1].lastTimeStamp = Engine.DCJHCAFIIA()

				arg_10_0._currentMessageIndexDatasource:SetValue(arg_10_1, arg_10_4)
				var_0_4(arg_10_0, arg_10_1, arg_9_2.forceOpen)
				var_0_5(arg_10_0, arg_9_2.popupContainer, arg_9_2.sourceMenu)
				ACTIONS.AnimateSequence(arg_10_0, "Transition")
			end)
			arg_10_2:addEventHandler("button_up", function(arg_14_0, arg_14_1)
				var_0_2(arg_10_0, arg_10_1)
			end)

			local var_10_3 = arg_9_2 and arg_9_2.sourceMenu

			if var_10_3 and var_10_3.MPTabsMenu then
				local var_10_4 = arg_10_0._messageTable[arg_10_4 + 1]

				assert(var_10_4)

				if var_10_4.actionFunction then
					if var_10_4[CRM.keys.ACTION] == "goto_ingame" then
						arg_10_2:registerEventHandler("leftmouseup", function(arg_15_0, arg_15_1)
							local var_15_0 = var_10_4.actionFunction(arg_10_0, arg_15_1)

							if var_15_0 then
								var_10_3.MPTabsMenu:SetupOnRestoreFocusOverride(var_15_0)
								ACTIONS.LeaveMenu(arg_10_0)
							end

							return true
						end)
					else
						arg_10_2:registerEventHandler("leftmouseup", function(arg_16_0, arg_16_1)
							var_10_4.actionFunction(arg_10_0, arg_16_1)
						end)
					end
				else
					arg_10_2:registerEventHandler("leftmouseup", nil)
				end
			end
		end
	end

	arg_9_0.CRMListGrid:SetRefreshChild(function(arg_17_0, arg_17_1, arg_17_2)
		local var_17_0 = arg_9_0.CRMListGrid:GetContentIndex(arg_17_1, arg_17_2)
		local var_17_1 = arg_9_0._messageTable[var_17_0 + 1]

		var_9_0(arg_9_0, arg_9_1, arg_17_0, var_17_1, var_17_0)
	end)
	arg_9_0.CRMListGrid:SetNumChildren(#arg_9_0._messageTable)
	arg_9_0.CRMListGrid:RefreshContent()

	local var_9_1 = arg_9_0._currentMessageIndexDatasource:GetValue(arg_9_1) or 0

	if var_9_1 > arg_9_0.CRMListGrid:GetNumChildren() then
		var_9_1 = 0

		arg_9_0._currentMessageIndexDatasource:SetValue(arg_9_1, 0)
	end

	arg_9_0.CRMListGrid:SetFocusedPosition({
		y = 0,
		x = var_9_1
	}, true)
	arg_9_0.ArrowLeft:SetupArrow(LUI.BEARING.left)
	arg_9_0.ArrowRight:SetupArrow(LUI.BEARING.right)
	arg_9_0:addEventHandler("menu_close", function(arg_18_0, arg_18_1)
		local var_18_0 = arg_9_0._currentMessageIndexDatasource:GetValue(arg_9_1) or 0

		var_0_2(arg_18_0, arg_9_1)
		METRICS.CRMSendDlogEvent(arg_9_0, arg_9_0._controllerIndex, arg_9_0._messageTable, var_18_0, arg_9_0._lastButtonPressed)
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_9_0, "WZWipSetup")
	end
end

function CRMMessages(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_19_0.id = "CRMMessages"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "BlackTransition"

	var_19_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_19_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -840, _1080p * 840, _1080p * 197, _1080p * 897)
	var_19_0:addElement(var_19_4)

	var_19_0.BlackTransition = var_19_4

	local var_19_5
	local var_19_6 = {
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
		controllerIndex = var_19_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CRMListItem", {
				controllerIndex = var_19_1
			})
		end,
		refreshChild = function(arg_21_0, arg_21_1, arg_21_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 432,
		rowHeight = _1080p * 240,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_19_7 = LUI.UIGrid.new(var_19_6)

	var_19_7.id = "CRMListGrid"

	var_19_7:SetScale(-0.4, 0)
	var_19_7:setUseStencil(true)
	var_19_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -1340, _1080p * 1340, _1080p * 687, _1080p * 927)
	var_19_0:addElement(var_19_7)

	var_19_0.CRMListGrid = var_19_7

	local var_19_8
	local var_19_9 = {
		spacing = _1080p * 8,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Left,
		buildPip = function()
			return MenuBuilder.BuildRegisteredType("Pip", {
				controllerIndex = var_19_1
			})
		end,
		controllerIndex = var_19_1
	}
	local var_19_10 = LUI.Pips.new(var_19_9)

	var_19_10.id = "Pips"

	var_19_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -804, _1080p * -696, _1080p * 884, _1080p * 888)
	var_19_0:addElement(var_19_10)

	var_19_0.Pips = var_19_10

	local var_19_11
	local var_19_12 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_19_1
	})

	var_19_12.id = "ArrowLeft"

	var_19_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_19_12.Arrow:SetZRotation(90, 0)
	var_19_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -834, _1080p * -802, _1080p * -289, _1080p * -257)
	var_19_0:addElement(var_19_12)

	var_19_0.ArrowLeft = var_19_12

	local var_19_13
	local var_19_14 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_19_1
	})

	var_19_14.id = "ArrowRight"

	var_19_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_19_14.Arrow:SetZRotation(-90, 0)
	var_19_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 802, _1080p * 834, _1080p * 791, _1080p * 823)
	var_19_0:addElement(var_19_14)

	var_19_0.ArrowRight = var_19_14

	local function var_19_15()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_15

	local var_19_16
	local var_19_17 = {
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

	var_19_4:RegisterAnimationSequence("Transition", var_19_17)

	local function var_19_18()
		var_19_4:AnimateSequence("Transition")
	end

	var_19_0._sequences.Transition = var_19_18

	local var_19_19
	local var_19_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2DarkHilite
		}
	}

	var_19_12:RegisterAnimationSequence("WZWipSetup", var_19_20)

	local var_19_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2DarkHilite
		}
	}

	var_19_14:RegisterAnimationSequence("WZWipSetup", var_19_21)

	local function var_19_22()
		var_19_12:AnimateSequence("WZWipSetup")
		var_19_14:AnimateSequence("WZWipSetup")
	end

	var_19_0._sequences.WZWipSetup = var_19_22

	var_19_7:AddArrow(var_19_12)
	var_19_7:AddArrow(var_19_14)
	var_0_6(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("CRMMessages", CRMMessages)
LockTable(_M)
