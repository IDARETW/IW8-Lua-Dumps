module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._availableItems = {}
	arg_1_0._allItems = {}
	arg_1_0._wzItems = {}
	arg_1_0._cwItems = {}
	arg_1_0._vgItems = {}
	arg_1_0._itemIdMaps = {}
	arg_1_0._currentFilterType = nil

	local var_1_0 = LOOT.GetPlayerBundleLockerFilterPreference(arg_1_1)

	if var_1_0 then
		arg_1_0._currentFilterType = var_1_0:get()
	end

	local var_1_1 = Dvar.DHEEJCCJBH("OLROPPQNM") or ""
	local var_1_2 = split(var_1_1, ",")
	local var_1_3 = {}

	for iter_1_0 = 1, #var_1_2 do
		var_1_3[tonumber(var_1_2[iter_1_0])] = 1
	end

	local var_1_4 = StringTable.BFHCAIIDA(CSV.bundleIDs.file)

	for iter_1_1 = 0, var_1_4 - 1 do
		local var_1_5 = CSV.ReadRow(CSV.bundleIDs, iter_1_1)
		local var_1_6 = tonumber(var_1_5.id)
		local var_1_7 = false

		if var_1_5.showInBundleLocker ~= "1" then
			var_1_7 = true
		end

		if var_1_3[var_1_6] ~= nil then
			var_1_7 = true
		end

		if STORE.IsBundleBlacklisted(var_1_6) then
			var_1_7 = true
		end

		if var_1_5.firstPartyProductID:sub(-3) == "_pc" and not Engine.CGABICJHAI() then
			var_1_7 = true
		elseif var_1_5.firstPartyProductID:sub(-4) == "_ps4" and not Engine.CIEGIACHAE() then
			var_1_7 = true
		elseif var_1_5.firstPartyProductID:sub(-4) == "_xb3" and not Engine.BAHIIBFDDG() then
			var_1_7 = true
		end

		if var_1_5.image == "" then
			var_1_7 = true
		end

		if var_1_5.firstPartyProductID and #var_1_5.firstPartyProductID > 0 and not InGameStore.GetProduct(arg_1_1, STORE.StripPlatformSuffix(var_1_5.firstPartyProductID)) then
			var_1_7 = true

			DebugPrint("BundleLockerMenu - No product data available for firstPartyProductID - " .. tostring(var_1_5.firstPartyProductID) .. ", skipping bundleID - " .. tostring(var_1_6))
		end

		if not var_1_7 and STORE.IsBundleOwned(arg_1_1, var_1_6) and not arg_1_0._itemIdMaps[tostring(var_1_6)] then
			local var_1_8 = {}

			var_1_8.emptyCategory = false
			var_1_8.id = var_1_6
			var_1_8.name = var_1_5.name
			var_1_8.asset = var_1_5.image
			var_1_8.rarity = var_1_5.rarity
			var_1_8.bundleType = var_1_5.bundleType
			var_1_8.titleImage = var_1_5.titleImage
			var_1_8.currencyID = tonumber(var_1_5.currencyID)
			var_1_8.currencyAmount = tonumber(var_1_5.currencyAmount)
			var_1_8.firstPartyProductID = #var_1_5.firstPartyProductID > 0 and var_1_5.firstPartyProductID or nil
			var_1_8.gameSourceID = var_1_5.game

			table.insert(arg_1_0._allItems, var_1_8)

			if var_1_8.gameSourceID == LUI.GAME_SOURCE_ID.MODERN_WARFARE then
				table.insert(arg_1_0._wzItems, var_1_8)
			elseif var_1_8.gameSourceID == LUI.GAME_SOURCE_ID.COLD_WAR then
				table.insert(arg_1_0._cwItems, var_1_8)
			elseif var_1_8.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
				table.insert(arg_1_0._vgItems, var_1_8)
			end

			arg_1_0._itemIdMaps[tostring(var_1_8.id)] = var_1_8.id
		end
	end

	local function var_1_9(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + arg_2_2 * arg_1_0.BundleGrid:GetNumColumns() + 1
		local var_2_1 = arg_1_0._availableItems[var_2_0]

		arg_2_0:UpdateButton(var_2_1)
		arg_2_0:UpdateWZSnipeBar(var_2_1.gameSourceID)
		arg_2_0:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
			local var_3_0 = STORE.GetNumItemsInBundle(var_2_1.id)

			if var_3_0 == 1 and StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, tostring(var_2_1.id), CSV.bundleIDs.cols.item1) == LOOT.T9_PLACEHOLDER_ITEM_ID then
				var_3_0 = 0
			end

			if var_3_0 > 0 then
				local var_3_1 = {
					bundleID = var_2_1.id,
					rarity = var_2_1.rarity,
					bundleType = var_2_1.bundleType,
					titleImage = var_2_1.titleImage,
					currencyID = var_2_1.currencyID,
					currencyAmount = var_2_1.currencyAmount,
					timerValue = var_2_1.purchaseEnd,
					bundleIndex = var_2_0
				}

				if var_2_1.firstPartyProductID ~= nil then
					var_3_1 = STORE.GetFirstPartyBundleData(arg_1_1, var_2_1.id, var_2_1.firstPartyProductID)
				end

				LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_1_1, false, var_3_1)
			end
		end)
	end

	local function var_1_10(arg_4_0)
		local var_4_0 = arg_4_0.BundleGrid:GetFocusPositionIndex()

		if var_4_0 == nil then
			return
		end

		local var_4_1 = var_4_0 + 1
		local var_4_2 = Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_4_1, #arg_4_0._availableItems)

		arg_4_0.ItemCount:setText(var_4_2)

		local var_4_3 = arg_4_0._availableItems[var_4_1]

		arg_4_0._isBundleGiftable = GIFT.IsItemGiftable(var_4_3.id)
		arg_4_0._useKBMControls = LUI.IsLastInputKeyboardMouse(arg_1_1)

		if arg_4_0._isBundleGiftable and CONDITIONS.IsGiftingEnabled() then
			if arg_4_0._useKBMControls then
				ACTIONS.AnimateSequence(arg_4_0, "ShowGiftingPrompt")
				arg_4_0.HelperBar.ButtonHelperText:PopButtonPrompt({
					side = "left",
					button_ref = "button_alt2"
				})
			else
				ACTIONS.AnimateSequence(arg_4_0, "HideGiftingPrompt")
				arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_alt2",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_BUNDLE")
				})
			end
		else
			ACTIONS.AnimateSequence(arg_4_0, "HideGiftingPrompt")
			arg_4_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_alt2"
			})
		end
	end

	local function var_1_11()
		if arg_1_0._currentFilterType == LOOT.bundleLockerFilterOptions.MODERN_WARFARE_ONLY then
			arg_1_0._availableItems = arg_1_0._wzItems
		elseif arg_1_0._currentFilterType == LOOT.bundleLockerFilterOptions.COLD_WAR_ONLY then
			arg_1_0._availableItems = arg_1_0._cwItems
		elseif arg_1_0._currentFilterType == LOOT.bundleLockerFilterOptions.VANGUARD_ONLY then
			arg_1_0._availableItems = arg_1_0._vgItems
		else
			arg_1_0._availableItems = arg_1_0._allItems
		end

		local var_5_0 = "HidePurchaseMessage"

		if #arg_1_0._availableItems > 0 then
			arg_1_0.ItemCount:SetAlpha(1)
		else
			arg_1_0.ItemCount:SetAlpha(0)

			var_5_0 = "ShowPurchaseMessage"
		end

		ACTIONS.AnimateSequence(arg_1_0, var_5_0)
	end

	local function var_1_12(arg_6_0)
		assert(arg_6_0)

		local var_6_0 = {
			bundleGiftInfo = arg_1_0._selectedBundleGiftInfo,
			recipientXuidString = arg_6_0
		}

		LUI.FlowManager.RequestPopupMenu(nil, "GiftBundlePurchaseConfirmationPopup", true, arg_1_1, false, var_6_0)
	end

	local function var_1_13()
		local var_7_0 = arg_1_0.BundleGrid:GetFocusPositionIndex()

		if var_7_0 == nil then
			return
		end

		local var_7_1 = var_7_0 + 1
		local var_7_2 = arg_1_0._availableItems[var_7_1]

		if var_7_2 == nil then
			return
		end

		local var_7_3 = var_7_2.id

		arg_1_0._selectedBundleGiftInfo = var_7_2

		local var_7_4 = {
			controllerIndex = arg_1_1,
			bundleSKU = var_7_3,
			selectedGifteeCallback = var_1_12
		}

		local function var_7_5()
			local var_8_0 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_7_4)

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_1_1, false, {
				flyInLeftNarrow = true,
				widget = var_8_0
			})
		end

		arg_1_0._controllerIndex = arg_1_1

		GIFT.StartFTUEFlow(arg_1_0, var_7_5)
	end

	var_1_11()
	arg_1_0.BundleGrid:SetNewTargetOnFocusHandler(arg_1_0, var_1_10)
	arg_1_0.BundleGrid:SetRefreshChild(var_1_9)
	arg_1_0.BundleGrid:SetNumChildren(#arg_1_0._availableItems)
	arg_1_0.BundleGrid:GainFocus({
		controllerIndex = arg_1_1
	})

	local function var_1_14(arg_9_0, arg_9_1)
		if arg_9_1.down and arg_9_1.qualifier == "mousewheel" then
			return arg_1_0.BundleGrid:processEvent(arg_9_1)
		end
	end

	arg_1_0.MouseScrollCatcher:SetHandleMouse(true)
	arg_1_0.MouseScrollCatcher:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_1_0.MouseScrollCatcher:addEventHandler("gamepad_button", var_1_14)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		LUI.FlowManager.RequestLeaveMenu(arg_10_0)
	end)
	arg_1_0:addAndCallEventHandler("update_input_type", var_1_10)
	arg_1_0.HelperBar:AddButtonHelperTextToElement(arg_1_0, {
		side = "left",
		button_ref = "button_left_trigger",
		priority = 4,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_1_0.bindButton:addEventHandler("button_left_trigger", function(arg_11_0, arg_11_1)
		local var_11_0 = MenuBuilder.BuildRegisteredType("BundleLockerFilteringSortingPopup", {
			controllerIndex = arg_1_1
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_1_1, false, {
			flyInLeftNarrow = true,
			disableQuickAccessShortcuts = false,
			widget = var_11_0
		})
		var_11_0:addEventHandler("menu_close", function(arg_12_0, arg_12_1)
			local var_12_0 = LOOT.GetPlayerBundleLockerFilterPreference(arg_12_1.controller)

			if var_12_0 then
				arg_1_0._currentFilterType = var_12_0:get()

				var_1_11()
				arg_1_0.BundleGrid:SetNumChildren(#arg_1_0._availableItems)
				arg_1_0.BundleGrid:RefreshContent()
			end
		end)
	end)

	if CONDITIONS.IsGiftingEnabled() then
		local var_1_15 = LUI.UIBindButton.new()

		var_1_15.id = "bindButton"

		arg_1_0:addElement(var_1_15)

		arg_1_0.bindButton = var_1_15

		arg_1_0.bindButton:addEventHandler("button_alt2", function(arg_13_0, arg_13_1)
			if arg_1_0._isBundleGiftable then
				var_1_13()
			end
		end)

		if arg_1_2.bundleIdForGifting ~= nil then
			for iter_1_2, iter_1_3 in ipairs(arg_1_0._allItems) do
				if arg_1_2.bundleIdForGifting == iter_1_3.id then
					if STORE.GetNumItemsInBundle(iter_1_3.id) > 0 then
						local var_1_16 = {
							openGiftingPopup = true,
							bundleID = iter_1_3.id,
							rarity = iter_1_3.rarity,
							bundleType = iter_1_3.bundleType,
							titleImage = iter_1_3.titleImage,
							currencyID = iter_1_3.currencyID,
							currencyAmount = iter_1_3.currencyAmount,
							timerValue = iter_1_3.purchaseEnd
						}

						LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_1_1, false, var_1_16)
					end

					break
				end
			end

			arg_1_2.bundleIdForGifting = nil
		end
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.TabBacker)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_1_0)
	end
end

function BundleLockerMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "BundleLockerMenu"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	var_14_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})
	var_14_0.HelperBar.id = "HelperBar"

	var_14_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_14_0.HelperBar:setPriority(10)
	var_14_0:addElement(var_14_0.HelperBar)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = {
		worldBlur = 1,
		controllerIndex = var_14_1
	}
	local var_14_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_14_4)

	var_14_5.id = "WorldBlur"

	var_14_0:addElement(var_14_5)

	var_14_0.WorldBlur = var_14_5

	local var_14_6
	local var_14_7 = LUI.UIImage.new()

	var_14_7.id = "Darken"

	var_14_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_7:SetAlpha(0.5, 0)
	var_14_0:addElement(var_14_7)

	var_14_0.Darken = var_14_7

	local var_14_8
	local var_14_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_14_1
	})

	var_14_9.id = "Vignette"

	var_14_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_14_0:addElement(var_14_9)

	var_14_0.Vignette = var_14_9

	local var_14_10
	local var_14_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_14_1
	})

	var_14_11.id = "TabBacker"

	var_14_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_14_0:addElement(var_14_11)

	var_14_0.TabBacker = var_14_11

	local var_14_12
	local var_14_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_14_1
	})

	var_14_13.id = "MenuTitle"

	var_14_13.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/BUNDLE_LOCKER")), 0)
	var_14_13.Line:SetLeft(0, 0)
	var_14_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 562, 0, _1080p * 100)
	var_14_0:addElement(var_14_13)

	var_14_0.MenuTitle = var_14_13

	local var_14_14
	local var_14_15 = LUI.UIImage.new()

	var_14_15.id = "MouseScrollCatcher"

	var_14_15:SetRGBFromInt(0, 0)
	var_14_15:SetAlpha(0, 0)
	var_14_15:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_14_15:SetVMin(0.5, 0)
	var_14_15:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 154, _1080p * -85)
	var_14_0:addElement(var_14_15)

	var_14_0.MouseScrollCatcher = var_14_15

	local var_14_16
	local var_14_17 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 5,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_14_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MPStoreBillboardButton", {
				controllerIndex = var_14_1
			})
		end,
		refreshChild = function(arg_16_0, arg_16_1, arg_16_2)
			return
		end,
		spacingX = _1080p * 27,
		spacingY = _1080p * 27,
		columnWidth = _1080p * 320,
		rowHeight = _1080p * 120,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_14_18 = LUI.UIPeekingGrid.new(var_14_17)

	var_14_18.id = "BundleGrid"

	var_14_18:setUseStencil(true)
	var_14_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 1803, _1080p * 244, _1080p * 812)
	var_14_0:addElement(var_14_18)

	var_14_0.BundleGrid = var_14_18

	local var_14_19
	local var_14_20 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_14_1
	})

	var_14_20.id = "VerticalScrollbar"

	var_14_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -119, _1080p * -96, _1080p * 244, _1080p * 952)
	var_14_0:addElement(var_14_20)

	var_14_0.VerticalScrollbar = var_14_20

	local var_14_21
	local var_14_22 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_14_1
	})

	var_14_22.id = "ArrowDown"

	var_14_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -135, _1080p * -85)
	var_14_0:addElement(var_14_22)

	var_14_0.ArrowDown = var_14_22

	local var_14_23
	local var_14_24 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_14_1
	})

	var_14_24.id = "ArrowUp"

	var_14_24:SetZRotation(180, 0)
	var_14_24.FreeBundleText:SetZRotation(180, 0)
	var_14_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -930, _1080p * -880)
	var_14_0:addElement(var_14_24)

	var_14_0.ArrowUp = var_14_24

	local var_14_25

	if CONDITIONS.InFrontendPublicMP() then
		local var_14_26 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_14_1
		})

		var_14_26.id = "MPPlayerDetails"

		var_14_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_14_0:addElement(var_14_26)

		var_14_0.MPPlayerDetails = var_14_26
	end

	local var_14_27
	local var_14_28 = LUI.UIStyledText.new()

	var_14_28.id = "ItemCount"

	var_14_28:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_14_28:setText("", 0)
	var_14_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_28:SetAlignment(LUI.Alignment.Left)
	var_14_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 201, _1080p * 223)
	var_14_0:addElement(var_14_28)

	var_14_0.ItemCount = var_14_28

	local var_14_29
	local var_14_30 = LUI.UIStyledText.new()

	var_14_30.id = "PurchaseMessage"

	var_14_30:SetRGBFromTable(SWATCHES.CH2.WZGenericTabText, 0)
	var_14_30:SetAlpha(0, 0)
	var_14_30:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_BUNDLES_IN_STORE")), 0)
	var_14_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_30:SetAlignment(LUI.Alignment.Center)
	var_14_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -628, _1080p * 628, _1080p * 430, _1080p * 478)
	var_14_0:addElement(var_14_30)

	var_14_0.PurchaseMessage = var_14_30

	local var_14_31
	local var_14_32 = LUI.UIImage.new()

	var_14_32.id = "GridDivider"

	var_14_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_32:SetAlpha(0.6, 0)
	var_14_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1803, _1080p * 230, _1080p * 231)
	var_14_0:addElement(var_14_32)

	var_14_0.GridDivider = var_14_32

	local var_14_33

	if CONDITIONS.IsGiftingEnabled() then
		var_14_33 = LUI.UIText.new()
		var_14_33.id = "GiftPrompt"

		var_14_33:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GIFT_BUNDLE_PROMPT"), 0)
		var_14_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_14_33:SetAlignment(LUI.Alignment.Left)
		var_14_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 304, _1080p * 804, _1080p * 201, _1080p * 219)
		var_14_0:addElement(var_14_33)

		var_14_0.GiftPrompt = var_14_33
	end

	local function var_14_34()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_34

	local var_14_35
	local var_14_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 233
		}
	}

	var_14_28:RegisterAnimationSequence("ShowPurchaseMessage", var_14_36)

	local var_14_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_30:RegisterAnimationSequence("ShowPurchaseMessage", var_14_37)

	local var_14_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_32:RegisterAnimationSequence("ShowPurchaseMessage", var_14_38)

	if CONDITIONS.IsGiftingEnabled() then
		local var_14_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 233
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 201
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 710
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 223
			}
		}

		var_14_33:RegisterAnimationSequence("ShowPurchaseMessage", var_14_39)
	end

	local function var_14_40()
		var_14_28:AnimateSequence("ShowPurchaseMessage")
		var_14_30:AnimateSequence("ShowPurchaseMessage")
		var_14_32:AnimateSequence("ShowPurchaseMessage")

		if CONDITIONS.IsGiftingEnabled() then
			var_14_33:AnimateSequence("ShowPurchaseMessage")
		end
	end

	var_14_0._sequences.ShowPurchaseMessage = var_14_40

	local var_14_41
	local var_14_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_30:RegisterAnimationSequence("HidePurchaseMessage", var_14_42)

	local var_14_43 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_32:RegisterAnimationSequence("HidePurchaseMessage", var_14_43)

	local function var_14_44()
		var_14_30:AnimateSequence("HidePurchaseMessage")
		var_14_32:AnimateSequence("HidePurchaseMessage")
	end

	var_14_0._sequences.HidePurchaseMessage = var_14_44

	local var_14_45

	if CONDITIONS.IsGiftingEnabled() then
		local var_14_46 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_33:RegisterAnimationSequence("ShowGiftingPrompt", var_14_46)
	end

	local function var_14_47()
		if CONDITIONS.IsGiftingEnabled() then
			var_14_33:AnimateSequence("ShowGiftingPrompt")
		end
	end

	var_14_0._sequences.ShowGiftingPrompt = var_14_47

	local var_14_48

	if CONDITIONS.IsGiftingEnabled() then
		local var_14_49 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_33:RegisterAnimationSequence("HideGiftingPrompt", var_14_49)
	end

	local function var_14_50()
		if CONDITIONS.IsGiftingEnabled() then
			var_14_33:AnimateSequence("HideGiftingPrompt")
		end
	end

	var_14_0._sequences.HideGiftingPrompt = var_14_50

	local var_14_51 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_14_20,
		startCap = var_14_20.startCap,
		endCap = var_14_20.endCap,
		sliderArea = var_14_20.sliderArea,
		slider = var_14_20.sliderArea and var_14_20.sliderArea.slider,
		fixedSizeSlider = var_14_20.sliderArea and var_14_20.sliderArea.fixedSizeSlider
	})

	var_14_18:AddScrollbar(var_14_51)
	var_14_18:AddArrow(var_14_24)
	var_14_18:AddArrow(var_14_22)
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_14_52 = LUI.UIBindButton.new()

	var_14_52.id = "selfBindButton"

	var_14_0:addElement(var_14_52)

	var_14_0.bindButton = var_14_52

	var_0_0(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("BundleLockerMenu", BundleLockerMenu)
LockTable(_M)
