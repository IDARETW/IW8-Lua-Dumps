module(..., package.seeall)

local var_0_0 = {
	{
		class = Engine.CBBHFCGDIC("MENU/CAMPAIGN"),
		name = Engine.CBBHFCGDIC("MENU/CAMPAIGN_DESC")
	},
	{
		class = Engine.CBBHFCGDIC("MENU/MULTIPLAYER"),
		name = Engine.CBBHFCGDIC("MENU/MULTIPLAYER_DESC")
	},
	{
		class = Engine.CBBHFCGDIC("MENU/COOP"),
		name = Engine.CBBHFCGDIC("LUA_MENU/COOP_DESC")
	}
}

local function var_0_1(arg_1_0)
	arg_1_0.TitleIDItemGrid._scrollbars[1]:SetKBMStyle(true)
	arg_1_0:registerEventHandler("gamepad_sticks", function(arg_2_0, arg_2_1)
		arg_1_0._lastRightStickPitch = arg_2_1.rightStickPitch

		return true
	end)
	arg_1_0:registerEventHandler("update_grid_scroll", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0._lastRightStickPitch or 0
		local var_3_1 = 10

		arg_3_0.TitleIDItemGrid:ScrollAmount(var_3_0 > 0 and "up" or "down", math.abs(var_3_0 * var_3_1 * 0.016))

		return true
	end)

	arg_1_0._pitchUpdateTimer = LUI.UITimer.new({
		interval = 16,
		event = {
			name = "update_grid_scroll"
		}
	})
	arg_1_0._pitchUpdateTimer.id = "_pitchUpdateTimer"

	arg_1_0:addElement(arg_1_0._pitchUpdateTimer)
	arg_1_0:AddButtonHelperTextToElement(arg_1_0.ButtonHelperBar, {
		priority = 2,
		side = "left",
		gamepad_only = true,
		button_ref = "button_right_stick",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SCROLL"),
		container = arg_1_0.GridScrollPrompt
	})
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	for iter_4_0 = CSV.dlcIDs.cols.itemStart, CSV.dlcIDs.cols.itemEnd do
		local var_4_0 = StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_4_1, iter_4_0)

		if #var_4_0 > 0 then
			local var_4_1 = tonumber(var_4_0)
			local var_4_2 = LOOT.GetTypeForID(var_4_1)

			if var_4_2 and var_4_2 ~= LOOT.itemTypes.INVALID and var_4_2 ~= LOOT.itemTypes.FIRST_PARTY_LICENCE then
				local var_4_3 = LOOT.GetItemRef(var_4_2, var_4_1)
				local var_4_4 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_4_1, CSV.bundleIDs.cols.isCollection)) == 1

				table.insert(arg_4_0._additionalItems, {
					name = LOOT.GetItemName(var_4_2, var_4_3, var_4_1),
					class = LOOT.GetItemClassName(var_4_2, var_4_3, var_4_1),
					image = LOOT.GetItemImage(var_4_2, var_4_3, var_4_1),
					isCollection = var_4_4
				})
			end
		end
	end

	if #arg_4_2.CPAmount > 0 then
		table.insert(arg_4_0._additionalItems, {
			image = "icon_currency_codpoints_large",
			name = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", arg_4_2.CPAmount),
			class = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS_CLASS")
		})
	end

	if arg_4_3 then
		arg_4_0.TitleIDItemGrid:SetNumChildren(#arg_4_0._additionalItems)
		arg_4_0.TitleIDItemGrid:RefreshContent()
		arg_4_0.TitleIDItemGrid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
			local var_5_0 = arg_5_1 + arg_5_2 * arg_4_0.TitleIDItemGrid:GetNumColumns()
			local var_5_1 = arg_4_0._additionalItems[var_5_0 + 1]

			arg_5_0.Name:setText(var_5_1.name)
			arg_5_0.Class:setText(var_5_1.class)
		end)
	else
		arg_4_0.ItemGrid:SetNumChildren(#arg_4_0._additionalItems)
		arg_4_0.ItemGrid:RefreshContent()
		arg_4_0.ItemGrid:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
			local var_6_0 = arg_6_1 + arg_6_2 * arg_4_0.ItemGrid:GetNumColumns()
			local var_6_1 = arg_4_0._additionalItems[var_6_0 + 1]

			arg_6_0.Name:setText(var_6_1.name)
			arg_6_0.Class:setText(var_6_1.class)
			arg_6_0.Name:SetAlpha(var_6_1.isCollection and 0 or 1)
		end)
	end
end

local function var_0_3(arg_7_0)
	arg_7_0.TitleIDGrid:SetNumChildren(#var_0_0)

	for iter_7_0, iter_7_1 in ipairs(var_0_0) do
		local var_7_0 = arg_7_0.TitleIDGrid:GetElementAtPosition(0, iter_7_0 - 1)

		var_7_0.Name:setText(iter_7_1.name)
		var_7_0.Class:setText(iter_7_1.class)
	end
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_8_2)
	local var_8_1 = CSV.ReadRow(CSV.dlcIDs, var_8_0)

	arg_8_0.Image:setImage(RegisterMaterial(var_8_1.image))

	if tonumber(StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_8_2, CSV.dlcIDs.cols.isCODPoints)) == 1 then
		ACTIONS.AnimateSequence(arg_8_0, "CODPoints")
		arg_8_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_COMPLETED", var_8_1.title)))

		local var_8_2 = StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_8_2, CSV.dlcIDs.cols.CPAmount)

		LUI.FlowManager.RequestLeaveMenuByName("PurchaseCODPointsPopup")
		LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
		assert(arg_8_0.Price)
		arg_8_0.Price.Amount:setText(var_8_2)
		ACTIONS.AnimateSequence(arg_8_0.Price, "HideBacker")
	else
		arg_8_0._additionalItems = {}

		local var_8_3 = false

		if arg_8_0._purchaseData then
			ACTIONS.AnimateSequence(arg_8_0, IsLanguageArabic() and "PreviewAR" or "Preview")

			if STORE.IsBattlePassTitleID(arg_8_2) then
				var_0_1(arg_8_0)
			end

			arg_8_0:FillGameModesGrid()
			arg_8_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_TITLE", var_8_1.title)))
			arg_8_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_secondary",
				priority = 0,
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
			arg_8_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
				if not arg_9_1.controller then
					local var_9_0 = arg_8_1
				end

				ACTIONS.LeaveMenu(arg_8_0)
			end)

			var_8_3 = true

			arg_8_0.PurchaseButton:SetHandleMouse(true)
			arg_8_0.PurchaseButton:SetFocusable(true)
			arg_8_0.ConfirmButtonGamepad:SetHandleMouse(false)
			arg_8_0.ConfirmButtonGamepad:SetFocusable(false)
			arg_8_0.ConfirmButtonKBM:SetHandleMouse(false)
			arg_8_0.ConfirmButtonKBM:SetFocusable(false)
		elseif STORE.IsTitleID(arg_8_2) then
			ACTIONS.AnimateSequence(arg_8_0, "TitleID")

			if STORE.IsBattlePassTitleID(arg_8_2) then
				var_0_1(arg_8_0)
			end

			arg_8_0:FillGameModesGrid()
			arg_8_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PURCHASED_TITLE", var_8_1.title)))

			var_8_3 = true
		else
			ACTIONS.AnimateSequence(arg_8_0, "ItemList")

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_8_0, "AR")
			end

			arg_8_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(var_8_1.title)))
		end

		var_0_2(arg_8_0, arg_8_2, var_8_1, var_8_3)

		if Engine.DBFCJBDJEC() then
			if arg_8_2 == 340021 or arg_8_2 == STORE.TitleIDs.BNET_BATTLE_PASS then
				local var_8_4 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, STORE.TitleIDs.BNET_STANDARD)

				if var_8_4 >= 0 then
					local var_8_5 = CSV.ReadRow(CSV.dlcIDs, var_8_4)

					if var_8_5 ~= nil then
						var_0_2(arg_8_0, STORE.TitleIDs.BNET_STANDARD, var_8_5, var_8_3)
					end
				end
			end

			if arg_8_2 == STORE.TitleIDs.BNET_BATTLE_PASS then
				local var_8_6 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, 340021)

				if var_8_6 > 0 then
					local var_8_7 = CSV.ReadRow(CSV.dlcIDs, var_8_6)

					if var_8_7 ~= nil then
						var_0_2(arg_8_0, 340021, var_8_7, var_8_3)
					end
				end

				local var_8_8 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, 340024)

				if var_8_8 > 0 then
					local var_8_9 = CSV.ReadRow(CSV.dlcIDs, var_8_8)

					if var_8_9 ~= nil then
						var_0_2(arg_8_0, 340024, var_8_9, var_8_3)
					end
				end
			end
		end

		if arg_8_2 == 340033 then
			local var_8_10 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, 340007)

			if var_8_10 > 0 then
				local var_8_11 = CSV.ReadRow(CSV.dlcIDs, var_8_10)

				if var_8_11 ~= nil then
					var_0_2(arg_8_0, 340007, var_8_11, var_8_3)
				end
			end
		end

		local var_8_12 = LOOT.GetItemID(LOOT.itemTypes.FEATURE, LOOT.createAClassRef)
		local var_8_13 = PROGRESSION.GetUnlockRank(var_8_12)

		arg_8_0.AlertMessage:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED_ITEMS_CAC_MSG", PROGRESSION.GetRankDisplay(var_8_13)))
	end
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_2.itemID)

	arg_10_0.FillGameModesGrid = var_0_3
	arg_10_0.currentItemID = arg_10_2.itemID
	arg_10_0._purchaseData = arg_10_2.purchaseData

	local var_10_0 = LUI.UIBindButton.new()

	var_10_0.id = "selfBindButton"

	arg_10_0:addElement(var_10_0)

	arg_10_0.bindButton = var_10_0

	local var_10_1 = LUI.FlowManager.GetScopedData("ItemExchangePopup")

	if not var_10_1.itemQueue then
		var_10_1.itemQueue = LUI.CreateQueue()
	end

	arg_10_0.PurchaseButton:SetHandleMouse(false)
	arg_10_0.PurchaseButton:SetFocusable(false)
	arg_10_0.TitleIDItemGrid:SetNumChildren(0)
	arg_10_0.TitleIDGrid:SetNumChildren(0)
	arg_10_0.ItemGrid:SetNumChildren(0)
	var_0_4(arg_10_0, arg_10_1, arg_10_2.itemID)

	if arg_10_2.leavePartyAndLobbyOnPurchase then
		arg_10_0.DisbandDisclaimer:SetAlpha(1)
	end

	local function var_10_2()
		local var_11_0 = var_10_1.itemQueue:Pop()

		if var_11_0 and var_11_0 ~= arg_10_0.currentItemID then
			var_0_4(arg_10_0, arg_10_1, var_11_0)

			arg_10_0.currentItemID = var_11_0
		else
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(arg_10_0, "restart_upsell_popmenu", true, arg_10_1, false, {
					controllerIndex = arg_10_1
				})
			end

			LUI.FlowManager.RequestLeaveMenu(arg_10_0, true)
		end
	end

	LUI.AddUIHoldButtonLogic(arg_10_0.ConfirmButtonGamepad, arg_10_1, {
		clickKeyboardAndMouse = true,
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_10_0.ConfirmButtonGamepad.GenericProgressBar,
		onFill = var_10_2
	})
	arg_10_0.ConfirmButtonKBM:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		var_10_2()
	end)

	local function var_10_3(arg_13_0, arg_13_1)
		if arg_10_0.ConfirmButtonKBM.Alpha == 1 or arg_10_0.ConfirmButtonGamepad.Alpha == 1 then
			if LUI.IsLastInputGamepad(arg_10_1) then
				arg_10_0.ConfirmButtonKBM:SetHandleMouse(false)
				arg_10_0.ConfirmButtonKBM:SetFocusable(false)
				arg_10_0.ConfirmButtonKBM:SetAlpha(0)
				arg_10_0.ConfirmButtonGamepad:SetHandleMouse(true)
				arg_10_0.ConfirmButtonGamepad:SetFocusable(true)
				arg_10_0.ConfirmButtonGamepad:SetAlpha(1)
			else
				arg_10_0.ConfirmButtonGamepad:SetHandleMouse(false)
				arg_10_0.ConfirmButtonGamepad:SetFocusable(false)
				arg_10_0.ConfirmButtonGamepad:SetAlpha(0)
				arg_10_0.ConfirmButtonKBM:SetHandleMouse(true)
				arg_10_0.ConfirmButtonKBM:SetFocusable(true)
				arg_10_0.ConfirmButtonKBM:SetAlpha(1)
			end
		end
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_10_0, arg_10_1)
	ACTIONS.ScaleFullscreen(arg_10_0.Background)
	arg_10_0.PurchaseButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if not arg_10_0._purchaseData or arg_10_0._purchaseData.owned then
			return true
		end

		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(false)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "MagmaUpsellFullScreenPopup", true, arg_14_1.controller, false, {
			controllerIndex = arg_10_1
		})
		InGameStore.SelectProduct(arg_10_1, arg_10_0._purchaseData.productId, InGameStorePurchaseType.BROWSE)
		LUI.FlowManager.RequestLeaveMenu(arg_14_0)

		if arg_10_2.leavePartyAndLobbyOnPurchase and Lobby.BBDICGHE() then
			Lobby.LeavePublicLobby()

			if LUI.FlowManager.IsInStack("BRPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("BRPublicLobby", true, true)
			elseif LUI.FlowManager.IsInStack("MPPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("MPPublicLobby", true, true)
			end
		end
	end)
end

function ItemExchangePopup(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "ItemExchangePopup"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Background"

	var_15_4:SetRGBFromInt(0, 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.Background = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "GenericPopupWindow"

	var_15_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * 860, _1080p * -486, _1080p * 456)
	var_15_0:addElement(var_15_6)

	var_15_0.GenericPopupWindow = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "Image"

	var_15_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * 768, _1080p * -386, _1080p * 78)
	var_15_0:addElement(var_15_8)

	var_15_0.Image = var_15_8

	local var_15_9
	local var_15_10 = MenuBuilder.BuildRegisteredType("GenericContentPanel", {
		controllerIndex = var_15_1
	})

	var_15_10.id = "ItemGridBackground"

	var_15_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/NEW_REWARDS"), 0)
	var_15_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * 768, _1080p * 100, _1080p * 380)
	var_15_0:addElement(var_15_10)

	var_15_0.ItemGridBackground = var_15_10

	local var_15_11
	local var_15_12 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 4,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemExchangeLabel", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 265,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_15_13 = LUI.UIGrid.new(var_15_12)

	var_15_13.id = "ItemGrid"

	var_15_13:setUseStencil(true)
	var_15_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -715, _1080p * 715, _1080p * 158, _1080p * 370)
	var_15_0:addElement(var_15_13)

	var_15_0.ItemGrid = var_15_13

	local var_15_14
	local var_15_15 = LUI.UIStyledText.new()

	var_15_15.id = "AlertMessage"

	var_15_15:SetRGBFromTable(SWATCHES.HUDWarnings.warning, 0)
	var_15_15:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED_ITEMS_CAC_MSG"), 0)
	var_15_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_15:SetAlignment(LUI.Alignment.Right)
	var_15_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_15:SetStartupDelay(2000)
	var_15_15:SetLineHoldTime(400)
	var_15_15:SetAnimMoveTime(2000)
	var_15_15:SetAnimMoveSpeed(150)
	var_15_15:SetEndDelay(2000)
	var_15_15:SetCrossfadeTime(250)
	var_15_15:SetFadeInTime(300)
	var_15_15:SetFadeOutTime(300)
	var_15_15:SetMaxVisibleLines(1)
	var_15_15:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 956, _1080p * -205, _1080p * 654, _1080p * 674)
	var_15_0:addElement(var_15_15)

	var_15_0.AlertMessage = var_15_15

	local var_15_16
	local var_15_17 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_15_1
	})

	var_15_17.id = "Price"

	var_15_17:SetAlpha(0, 0)
	var_15_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 515, _1080p * 715, 0, _1080p * 50)
	var_15_0:addElement(var_15_17)

	var_15_0.Price = var_15_17

	local var_15_18
	local var_15_19 = LUI.UIText.new()

	var_15_19.id = "Title"

	var_15_19:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_15_19:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_COMPLETED")), 0)
	var_15_19:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_15_19:SetAlignment(LUI.Alignment.Left)
	var_15_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -466, _1080p * -406)
	var_15_0:addElement(var_15_19)

	var_15_0.Title = var_15_19

	local var_15_20
	local var_15_21 = MenuBuilder.BuildRegisteredType("GenericContentPanel", {
		controllerIndex = var_15_1
	})

	var_15_21.id = "TitleIDGridBackground"

	var_15_21:SetAlpha(0, 0)
	var_15_21.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ALL_MODES_UNLOCKED"), 0)
	var_15_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * -294, _1080p * 33, _1080p * 313)
	var_15_0:addElement(var_15_21)

	var_15_0.TitleIDGridBackground = var_15_21

	local var_15_22
	local var_15_23 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemExchangeLabel", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 265,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_15_24 = LUI.UIGrid.new(var_15_23)

	var_15_24.id = "TitleIDGrid"

	var_15_24:SetAlpha(0, 0)
	var_15_24:setUseStencil(true)
	var_15_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -736, _1080p * -330, _1080p * 101, _1080p * 292)
	var_15_0:addElement(var_15_24)

	var_15_0.TitleIDGrid = var_15_24

	local var_15_25
	local var_15_26 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemExchangeLabel", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_21_0, arg_21_1, arg_21_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 265,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_15_27 = LUI.UIGrid.new(var_15_26)

	var_15_27.id = "TitleIDItemGrid"

	var_15_27:SetAlpha(0, 0)
	var_15_27:setUseStencil(true)
	var_15_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -221, _1080p * 730, _1080p * 101, _1080p * 292)
	var_15_0:addElement(var_15_27)

	var_15_0.TitleIDItemGrid = var_15_27

	local var_15_28
	local var_15_29 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_15_1
	})

	var_15_29.id = "TitleIDGridScrollbar"

	var_15_29:SetAlpha(0, 0)
	var_15_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 730, _1080p * 741, _1080p * 101, _1080p * 292)
	var_15_0:addElement(var_15_29)

	var_15_0.TitleIDGridScrollbar = var_15_29

	local var_15_30
	local var_15_31 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_15_1
	})

	var_15_31.id = "ButtonHelperBar"

	var_15_31.Background:SetAlpha(0, 0)
	var_15_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 966, _1080p * 1026)
	var_15_0:addElement(var_15_31)

	var_15_0.ButtonHelperBar = var_15_31

	local var_15_32
	local var_15_33 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_15_1
	})

	var_15_33.id = "PurchaseButton"

	var_15_33:SetAlpha(0, 0)
	var_15_33.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_15_33.Text:SetAlignment(LUI.Alignment.Center)
	var_15_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 749, _1080p * 1171, _1080p * 902, _1080p * 952)
	var_15_0:addElement(var_15_33)

	var_15_0.PurchaseButton = var_15_33

	local var_15_34
	local var_15_35 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_15_1
	})

	var_15_35.id = "ConfirmButtonGamepad"

	var_15_35.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OK")), 0)
	var_15_35.Text:SetAlignment(LUI.Alignment.Center)
	var_15_35:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 401, _1080p * 439)
	var_15_0:addElement(var_15_35)

	var_15_0.ConfirmButtonGamepad = var_15_35

	local var_15_36
	local var_15_37 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_15_1
	})

	var_15_37.id = "ConfirmButtonKBM"

	var_15_37.Text:SetLeft(_1080p * 20, 0)
	var_15_37.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OK")), 0)
	var_15_37.Text:SetAlignment(LUI.Alignment.Center)
	var_15_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 401, _1080p * 439)
	var_15_0:addElement(var_15_37)

	var_15_0.ConfirmButtonKBM = var_15_37

	local var_15_38
	local var_15_39 = LUI.UIText.new()

	var_15_39.id = "DisbandDisclaimer"

	var_15_39:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_15_39:SetAlpha(0, 0)
	var_15_39:setText(Engine.CBBHFCGDIC("LUA_MENU/UPSELL_PURCHASE_DISBAND_DISCLAIMER"), 0)
	var_15_39:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_39:SetAlignment(LUI.Alignment.Center)
	var_15_39:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * 768, _1080p * 335, _1080p * 359)
	var_15_0:addElement(var_15_39)

	var_15_0.DisbandDisclaimer = var_15_39

	local var_15_40
	local var_15_41 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_15_1
	})

	var_15_41.id = "GridScrollPrompt"

	var_15_41:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		var_15_41.Label:setText("ButtonPrompt", 0)
	end

	var_15_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 630, _1080p * 730, _1080p * 399, _1080p * 439)
	var_15_0:addElement(var_15_41)

	var_15_0.GridScrollPrompt = var_15_41

	local function var_15_42()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_42

	local var_15_43
	local var_15_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 643
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 679
		},
		{
			value = false,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_15_15:RegisterAnimationSequence("AR", var_15_44)

	local function var_15_45()
		var_15_15:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_45

	local var_15_46
	local var_15_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_15_0.GenericPopupWindow.PopupBackground
		}
	}

	var_15_6:RegisterAnimationSequence("TitleID", var_15_47)

	local var_15_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 512
		}
	}

	var_15_8:RegisterAnimationSequence("TitleID", var_15_48)

	local var_15_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BONUS_REWARDS"),
			child = var_15_0.ItemGridBackground.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_15_10:RegisterAnimationSequence("TitleID", var_15_49)

	local var_15_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("TitleID", var_15_50)

	local var_15_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 587
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 607
		}
	}

	var_15_15:RegisterAnimationSequence("TitleID", var_15_51)

	local var_15_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_17:RegisterAnimationSequence("TitleID", var_15_52)

	local var_15_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("TitleID", var_15_53)

	local var_15_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("TitleID", var_15_54)

	local var_15_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_27:RegisterAnimationSequence("TitleID", var_15_55)

	local var_15_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_29:RegisterAnimationSequence("TitleID", var_15_56)

	local var_15_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_41:RegisterAnimationSequence("TitleID", var_15_57)

	local function var_15_58()
		var_15_6:AnimateSequence("TitleID")
		var_15_8:AnimateSequence("TitleID")
		var_15_10:AnimateSequence("TitleID")
		var_15_13:AnimateSequence("TitleID")
		var_15_15:AnimateSequence("TitleID")
		var_15_17:AnimateSequence("TitleID")
		var_15_21:AnimateSequence("TitleID")
		var_15_24:AnimateSequence("TitleID")
		var_15_27:AnimateSequence("TitleID")
		var_15_29:AnimateSequence("TitleID")
		var_15_41:AnimateSequence("TitleID")
	end

	var_15_0._sequences.TitleID = var_15_58

	local var_15_59
	local var_15_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -719
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 719
		}
	}

	var_15_6:RegisterAnimationSequence("CODPoints", var_15_60)

	local var_15_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -717
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -149
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 149
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cod_purchase_complete_image")
		}
	}

	var_15_8:RegisterAnimationSequence("CODPoints", var_15_61)

	local var_15_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("CODPoints", var_15_62)

	local var_15_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("CODPoints", var_15_63)

	local var_15_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_15:RegisterAnimationSequence("CODPoints", var_15_64)

	local var_15_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 135
		}
	}

	var_15_17:RegisterAnimationSequence("CODPoints", var_15_65)

	local var_15_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		}
	}

	var_15_19:RegisterAnimationSequence("CODPoints", var_15_66)

	local var_15_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("CODPoints", var_15_67)

	local var_15_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("CODPoints", var_15_68)

	local var_15_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		}
	}

	var_15_35:RegisterAnimationSequence("CODPoints", var_15_69)

	local var_15_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		}
	}

	var_15_37:RegisterAnimationSequence("CODPoints", var_15_70)

	local function var_15_71()
		var_15_6:AnimateSequence("CODPoints")
		var_15_8:AnimateSequence("CODPoints")
		var_15_10:AnimateSequence("CODPoints")
		var_15_13:AnimateSequence("CODPoints")
		var_15_15:AnimateSequence("CODPoints")
		var_15_17:AnimateSequence("CODPoints")
		var_15_19:AnimateSequence("CODPoints")
		var_15_21:AnimateSequence("CODPoints")
		var_15_24:AnimateSequence("CODPoints")
		var_15_35:AnimateSequence("CODPoints")
		var_15_37:AnimateSequence("CODPoints")
	end

	var_15_0._sequences.CODPoints = var_15_71

	local var_15_72
	local var_15_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -486
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 456
		}
	}

	var_15_6:RegisterAnimationSequence("ItemList", var_15_73)

	local var_15_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("ItemList", var_15_74)

	local var_15_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/NEW_REWARDS"),
			child = var_15_0.ItemGridBackground.Text
		}
	}

	var_15_10:RegisterAnimationSequence("ItemList", var_15_75)

	local var_15_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -715
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 715
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 158
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 370
		}
	}

	var_15_13:RegisterAnimationSequence("ItemList", var_15_76)

	local var_15_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_15:RegisterAnimationSequence("ItemList", var_15_77)

	local var_15_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_17:RegisterAnimationSequence("ItemList", var_15_78)

	local var_15_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -466
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -406
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_15_19:RegisterAnimationSequence("ItemList", var_15_79)

	local var_15_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("ItemList", var_15_80)

	local var_15_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -682
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 682
		}
	}

	var_15_24:RegisterAnimationSequence("ItemList", var_15_81)

	local var_15_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_15_35:RegisterAnimationSequence("ItemList", var_15_82)

	local var_15_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 399
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 437
		}
	}

	var_15_37:RegisterAnimationSequence("ItemList", var_15_83)

	local function var_15_84()
		var_15_6:AnimateSequence("ItemList")
		var_15_8:AnimateSequence("ItemList")
		var_15_10:AnimateSequence("ItemList")
		var_15_13:AnimateSequence("ItemList")
		var_15_15:AnimateSequence("ItemList")
		var_15_17:AnimateSequence("ItemList")
		var_15_19:AnimateSequence("ItemList")
		var_15_21:AnimateSequence("ItemList")
		var_15_24:AnimateSequence("ItemList")
		var_15_35:AnimateSequence("ItemList")
		var_15_37:AnimateSequence("ItemList")
	end

	var_15_0._sequences.ItemList = var_15_84

	local var_15_85
	local var_15_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -230
		}
	}

	var_15_6:RegisterAnimationSequence("SingleItem", var_15_86)

	local var_15_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -122
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 134
		}
	}

	var_15_8:RegisterAnimationSequence("SingleItem", var_15_87)

	local var_15_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("SingleItem", var_15_88)

	local var_15_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("SingleItem", var_15_89)

	local var_15_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_15:RegisterAnimationSequence("SingleItem", var_15_90)

	local var_15_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		}
	}

	var_15_17:RegisterAnimationSequence("SingleItem", var_15_91)

	local var_15_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -135
		}
	}

	var_15_19:RegisterAnimationSequence("SingleItem", var_15_92)

	local var_15_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("SingleItem", var_15_93)

	local var_15_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("SingleItem", var_15_94)

	local var_15_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 186
		}
	}

	var_15_35:RegisterAnimationSequence("SingleItem", var_15_95)

	local var_15_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 186
		}
	}

	var_15_37:RegisterAnimationSequence("SingleItem", var_15_96)

	local function var_15_97()
		var_15_6:AnimateSequence("SingleItem")
		var_15_8:AnimateSequence("SingleItem")
		var_15_10:AnimateSequence("SingleItem")
		var_15_13:AnimateSequence("SingleItem")
		var_15_15:AnimateSequence("SingleItem")
		var_15_17:AnimateSequence("SingleItem")
		var_15_19:AnimateSequence("SingleItem")
		var_15_21:AnimateSequence("SingleItem")
		var_15_24:AnimateSequence("SingleItem")
		var_15_35:AnimateSequence("SingleItem")
		var_15_37:AnimateSequence("SingleItem")
	end

	var_15_0._sequences.SingleItem = var_15_97

	local var_15_98
	local var_15_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 864
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -867
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -410
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_15_0.GenericPopupWindow.PopupBackground
		}
	}

	var_15_6:RegisterAnimationSequence("Preview", var_15_99)

	local var_15_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 479
		}
	}

	var_15_8:RegisterAnimationSequence("Preview", var_15_100)

	local var_15_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BONUS_REWARDS"),
			child = var_15_0.ItemGridBackground.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_15_10:RegisterAnimationSequence("Preview", var_15_101)

	local var_15_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("Preview", var_15_102)

	local var_15_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 590
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 610
		}
	}

	var_15_15:RegisterAnimationSequence("Preview", var_15_103)

	local var_15_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_17:RegisterAnimationSequence("Preview", var_15_104)

	local var_15_105 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("Preview", var_15_105)

	local var_15_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("Preview", var_15_106)

	local var_15_107 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_27:RegisterAnimationSequence("Preview", var_15_107)

	local var_15_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 738
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 730
		}
	}

	var_15_29:RegisterAnimationSequence("Preview", var_15_108)

	local var_15_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_33:RegisterAnimationSequence("Preview", var_15_109)

	local var_15_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_35:RegisterAnimationSequence("Preview", var_15_110)

	local var_15_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_37:RegisterAnimationSequence("Preview", var_15_111)

	local var_15_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_41:RegisterAnimationSequence("Preview", var_15_112)

	local function var_15_113()
		var_15_6:AnimateSequence("Preview")
		var_15_8:AnimateSequence("Preview")
		var_15_10:AnimateSequence("Preview")
		var_15_13:AnimateSequence("Preview")
		var_15_15:AnimateSequence("Preview")
		var_15_17:AnimateSequence("Preview")
		var_15_21:AnimateSequence("Preview")
		var_15_24:AnimateSequence("Preview")
		var_15_27:AnimateSequence("Preview")
		var_15_29:AnimateSequence("Preview")
		var_15_33:AnimateSequence("Preview")
		var_15_35:AnimateSequence("Preview")
		var_15_37:AnimateSequence("Preview")
		var_15_41:AnimateSequence("Preview")
	end

	var_15_0._sequences.Preview = var_15_113

	local var_15_114
	local var_15_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 864
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -867
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -410
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_15_0.GenericPopupWindow.PopupBackground
		}
	}

	var_15_6:RegisterAnimationSequence("PreviewAR", var_15_115)

	local var_15_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 479
		}
	}

	var_15_8:RegisterAnimationSequence("PreviewAR", var_15_116)

	local var_15_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BONUS_REWARDS"),
			child = var_15_0.ItemGridBackground.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_15_10:RegisterAnimationSequence("PreviewAR", var_15_117)

	local var_15_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("PreviewAR", var_15_118)

	local var_15_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 585
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 615
		}
	}

	var_15_15:RegisterAnimationSequence("PreviewAR", var_15_119)

	local var_15_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_17:RegisterAnimationSequence("PreviewAR", var_15_120)

	local var_15_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("PreviewAR", var_15_121)

	local var_15_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("PreviewAR", var_15_122)

	local var_15_123 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_27:RegisterAnimationSequence("PreviewAR", var_15_123)

	local var_15_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 738
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 730
		}
	}

	var_15_29:RegisterAnimationSequence("PreviewAR", var_15_124)

	local var_15_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_33:RegisterAnimationSequence("PreviewAR", var_15_125)

	local var_15_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_35:RegisterAnimationSequence("PreviewAR", var_15_126)

	local var_15_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_37:RegisterAnimationSequence("PreviewAR", var_15_127)

	local function var_15_128()
		var_15_6:AnimateSequence("PreviewAR")
		var_15_8:AnimateSequence("PreviewAR")
		var_15_10:AnimateSequence("PreviewAR")
		var_15_13:AnimateSequence("PreviewAR")
		var_15_15:AnimateSequence("PreviewAR")
		var_15_17:AnimateSequence("PreviewAR")
		var_15_21:AnimateSequence("PreviewAR")
		var_15_24:AnimateSequence("PreviewAR")
		var_15_27:AnimateSequence("PreviewAR")
		var_15_29:AnimateSequence("PreviewAR")
		var_15_33:AnimateSequence("PreviewAR")
		var_15_35:AnimateSequence("PreviewAR")
		var_15_37:AnimateSequence("PreviewAR")
	end

	var_15_0._sequences.PreviewAR = var_15_128

	var_15_33:addEventHandler("button_action", function(arg_30_0, arg_30_1)
		local var_30_0 = arg_30_1.controller or var_15_1

		ACTIONS.OpenPopupMenu(var_15_0, "StoreGameUpsellPopup", true, var_30_0)
		ACTIONS.LeaveMenu(var_15_0)
	end)

	local var_15_129 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_15_29,
		startCap = var_15_29.startCap,
		endCap = var_15_29.endCap,
		sliderArea = var_15_29.sliderArea,
		slider = var_15_29.sliderArea and var_15_29.sliderArea.slider,
		fixedSizeSlider = var_15_29.sliderArea and var_15_29.sliderArea.fixedSizeSlider
	})

	var_15_27:AddScrollbar(var_15_129)
	var_0_5(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("ItemExchangePopup", ItemExchangePopup)
LockTable(_M)
