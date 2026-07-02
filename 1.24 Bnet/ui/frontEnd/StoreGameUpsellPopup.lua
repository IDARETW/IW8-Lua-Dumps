module(..., package.seeall)

local var_0_0 = {
	[STORE.GameUpsellStandardID] = "magma_upsell_billboard_standard",
	[STORE.GameUpsellStandardIDSIEE] = "magma_upsell_billboard_standard",
	[STORE.GameUpsellEnhancedID] = "magma_upsell_billboard_battlepass"
}

local function var_0_1()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = false
	local var_2_1 = STORE.GetGameUpsellProducts(arg_2_1)

	if var_2_1 and #var_2_1 > 0 then
		for iter_2_0, iter_2_1 in ipairs(var_2_1) do
			iter_2_1.itemIndex = iter_2_0
			iter_2_1.owned = false
			iter_2_1.isFirstParty = true
			iter_2_1.image = iter_2_1.image == "" and "placeholder_x" or iter_2_1.image
			iter_2_1.leavePartyAndLobbyOnPurchase = arg_2_0._leavePartyAndLobbyOnPurchase
		end

		local function var_2_2(arg_3_0, arg_3_1, arg_3_2)
			local var_3_0 = arg_2_0.Grid:GetContentIndex(arg_3_1, arg_3_2)

			arg_3_0:SetButtonData(var_2_1[var_3_0 + 1])

			if not arg_3_0.handlersAdded then
				arg_3_0:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
					if arg_4_0._buttonData then
						arg_2_0:SetupPopupData(arg_4_0._buttonData)
					end
				end)
				arg_3_0:addEventHandler("button_action", function(arg_5_0, arg_5_1)
					if Engine.CIEGIACHAE() then
						InGameStore.ShowStoreIcon(false)
					end
				end)

				arg_3_0.handlersAdded = true
			end
		end

		arg_2_0.Grid:SetRefreshChild(var_2_2)
		arg_2_0.Grid:SetNumChildren(#var_2_1)
		arg_2_0.Grid:RefreshContent()

		local function var_2_3()
			for iter_6_0, iter_6_1 in ipairs(var_2_1) do
				if iter_6_1.productId == arg_2_0._defaultProductId then
					return {
						y = 0,
						x = iter_6_0 - 1
					}
				end
			end
		end

		arg_2_0.Grid:SetDefaultFocus(var_2_3)
		arg_2_0:processEvent({
			name = "lose_focus"
		})
		arg_2_0:processEvent({
			name = "gain_focus"
		})

		var_2_0 = true
	end

	if var_2_0 then
		arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_CONTENT")
		})

		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end
	else
		ACTIONS.AnimateSequence(arg_2_0, "NoItems")
	end
end

local function var_0_3(arg_7_0, arg_7_1)
	InGameStore.FetchCatalog(arg_7_1, true, false)
	ACTIONS.AnimateSequence(arg_7_0, "ShowFetching")

	local var_7_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "update_fetching_store",
			controllerIndex = arg_7_1
		}
	})

	var_7_0.id = "fetchingTimer"

	arg_7_0:addElement(var_7_0)

	arg_7_0._fetchingTimer = var_7_0

	arg_7_0:registerEventHandler("update_fetching_store", function(arg_8_0, arg_8_1)
		local var_8_0 = InGameStore.GetCatalogStatus(arg_7_1)
		local var_8_1 = false

		if var_8_0 == InGameStoreCatalogStatus.READY then
			var_0_2(arg_7_0, arg_7_1)

			var_8_1 = true
		elseif var_8_0 == InGameStoreCatalogStatus.ERROR then
			var_8_1 = true

			local var_8_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_8_3 = Engine.BIAFEJHHDD()

				if var_8_3 ~= nil then
					local var_8_4 = Engine.JCBDICCAH(var_8_3)

					var_8_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_8_4)

					Engine.DCFIDJGACA()
				else
					var_8_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_8_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_8_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_8_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_8_2, nil, false, true)
			Engine.DHCGHHBHCH()
			LUI.FlowManager.RequestLeaveMenu(arg_8_0)
		end

		if var_8_1 then
			ACTIONS.AnimateSequence(arg_8_0, "HideFetching")

			if arg_7_0._leavePartyAndLobbyOnPurchase then
				arg_7_0.DisbandDisclaimer:SetAlpha(1)
			end

			arg_8_0._fetchingTimer:closeTree()

			arg_8_0._fetchingTimer = nil
		end
	end)
end

local function var_0_4(arg_9_0, arg_9_1)
	arg_9_0.Price.Amount:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_PRICE", Engine.JCBDICCAH(arg_9_1.price)), 0)
	arg_9_0.Description:setText(arg_9_1.contentLong, 0)

	arg_9_0.currentButtonData = arg_9_1

	local var_9_0 = var_0_0[arg_9_1.productId]

	if var_9_0 and #var_9_0 > 0 then
		arg_9_0.BG:SetAlpha(1)
		arg_9_0.BG:setImage(RegisterMaterial(var_9_0))
	else
		assert(false, "Invalid BG Image for productID, " .. arg_9_1.productId)
		arg_9_0.BG:SetAlpha(0)
	end
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.currentButtonData = nil
	arg_10_0._leavePartyAndLobbyOnPurchase = arg_10_2.leavePartyAndLobbyOnPurchase
	arg_10_0._defaultProductId = arg_10_2.defaultProductId
	arg_10_0.SetupPopupData = var_0_4

	arg_10_0.Grid:SetNumChildren(0)
	arg_10_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_0_3(arg_10_0, arg_10_1)
	arg_10_0:addEventHandler("exchanged_item", function(arg_11_0, arg_11_1)
		LUI.FlowManager.RequestLeaveMenu(arg_11_0)
	end)
	ACTIONS.ScaleFullscreen(arg_10_0.Darkener)
	arg_10_0.bindButton:addEventHandler("button_alt1", function(arg_12_0, arg_12_1)
		if arg_10_0.currentButtonData then
			local var_12_0 = arg_12_1.controller or arg_10_1
			local var_12_1 = STORE.GetTitleIDsForCurrentPlatform()

			LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangePopup", false, var_12_0, false, {
				itemID = var_12_1[arg_10_0.currentButtonData.itemIndex],
				purchaseData = arg_10_0.currentButtonData,
				leavePartyAndLobbyOnPurchase = arg_10_0._leavePartyAndLobbyOnPurchase
			})
		end
	end)
	arg_10_0:addEventHandler("restore_focus", function(arg_13_0, arg_13_1)
		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end
	end)
end

function StoreGameUpsellPopup(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "StoreGameUpsellPopup"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "Darkener"

	var_14_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_4:SetAlpha(0.9, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.Darkener = var_14_4

	local var_14_5
	local var_14_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_14_1
	})

	var_14_6.id = "GenericPopupWindow"

	var_14_6.PopupBackground:SetAlpha(1, 0)
	var_14_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -865, _1080p * 865, _1080p * -380, _1080p * 380)
	var_14_0:addElement(var_14_6)

	var_14_0.GenericPopupWindow = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "BG"

	var_14_8:SetAlpha(0, 0)
	var_14_8:setImage(RegisterMaterial("magma_upsell_billboard_standard"), 0)
	var_14_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1024, _1080p * 1024, _1080p * -532, _1080p * 492)
	var_14_0:addElement(var_14_8)

	var_14_0.BG = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIText.new()

	var_14_10.id = "FetchingStoreLabel"

	var_14_10:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_14_10:SetAlpha(0, 0)
	var_14_10:setText(Engine.CBBHFCGDIC("MENU/FETCHING_STORE_DATA"), 0)
	var_14_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_10:SetAlignment(LUI.Alignment.Center)
	var_14_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * 20, _1080p * 50)
	var_14_0:addElement(var_14_10)

	var_14_0.FetchingStoreLabel = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "Spinner"

	var_14_12:SetAlpha(0, 0)
	var_14_12:setImage(RegisterMaterial("spinner_loading"), 0)
	var_14_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170.5, _1080p * 169.5, _1080p * 55, _1080p * 65)
	var_14_0:addElement(var_14_12)

	var_14_0.Spinner = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIText.new()

	var_14_14.id = "NoItemsLabel"

	var_14_14:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_14_14:SetAlpha(0, 0)
	var_14_14:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_STORE_ITEMS"), 0)
	var_14_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_14:SetAlignment(LUI.Alignment.Center)
	var_14_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * 20, _1080p * 50)
	var_14_0:addElement(var_14_14)

	var_14_0.NoItemsLabel = var_14_14

	local var_14_15
	local var_14_16 = LUI.UIImage.new()

	var_14_16.id = "Smoke"

	var_14_16:SetAlpha(0, 0)
	var_14_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 867, _1080p * 1824, _1080p * 575, _1080p * 916)
	var_14_0:addElement(var_14_16)

	var_14_0.Smoke = var_14_16

	local var_14_17
	local var_14_18 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_14_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("TitleIDItemButton", {
				controllerIndex = var_14_1
			})
		end,
		refreshChild = function(arg_16_0, arg_16_1, arg_16_2)
			return
		end,
		spacingX = _1080p * 70,
		spacingY = _1080p * 70,
		columnWidth = _1080p * 384,
		rowHeight = _1080p * 192,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom
	}
	local var_14_19 = LUI.UIGrid.new(var_14_18)

	var_14_19.id = "Grid"

	var_14_19:SetAlpha(0, 0)
	var_14_19:setUseStencil(true)
	var_14_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 1727, _1080p * 706, _1080p * 916)
	var_14_0:addElement(var_14_19)

	var_14_0.Grid = var_14_19

	local var_14_20
	local var_14_21 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})

	var_14_21.id = "ButtonHelperBar"

	var_14_21.Background:SetAlpha(0, 0)
	var_14_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 921, _1080p * 981)
	var_14_0:addElement(var_14_21)

	var_14_0.ButtonHelperBar = var_14_21

	local var_14_22
	local var_14_23 = LUI.UIStyledText.new()

	var_14_23.id = "Description"

	var_14_23:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_14_23:SetAlpha(0, 0)
	var_14_23:setText(Engine.CBBHFCGDIC("LUA_MENU/UPSELL_OPERATOR_ENHANCED_DESC"), 0)
	var_14_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_23:SetAlignment(LUI.Alignment.Left)
	var_14_23:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_14_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_14_23:SetStartupDelay(2000)
	var_14_23:SetLineHoldTime(400)
	var_14_23:SetAnimMoveTime(2000)
	var_14_23:SetAnimMoveSpeed(150)
	var_14_23:SetEndDelay(2000)
	var_14_23:SetCrossfadeTime(250)
	var_14_23:SetFadeInTime(300)
	var_14_23:SetFadeOutTime(300)
	var_14_23:SetMaxVisibleLines(4)
	var_14_23:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 165, _1080p * 829, _1080p * 7, _1080p * 31)
	var_14_0:addElement(var_14_23)

	var_14_0.Description = var_14_23

	local var_14_24
	local var_14_25 = MenuBuilder.BuildRegisteredType("TitleIDPriceButton", {
		controllerIndex = var_14_1
	})

	var_14_25.id = "Price"

	var_14_25:SetAlpha(0, 0)
	var_14_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 515, _1080p * 645, _1080p * 695)
	var_14_0:addElement(var_14_25)

	var_14_0.Price = var_14_25

	local var_14_26
	local var_14_27 = LUI.UIText.new()

	var_14_27.id = "DisbandDisclaimer"

	var_14_27:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_14_27:SetAlpha(0, 0)
	var_14_27:setText(Engine.CBBHFCGDIC("LUA_MENU/UPSELL_PURCHASE_DISBAND_DISCLAIMER"), 0)
	var_14_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_27:SetAlignment(LUI.Alignment.Left)
	var_14_27:SetVerticalAlignment(LUI.Alignment.Center)
	var_14_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 946, _1080p * 671, _1080p * 699)
	var_14_0:addElement(var_14_27)

	var_14_0.DisbandDisclaimer = var_14_27

	local function var_14_28()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_28

	local var_14_29
	local var_14_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ShowFetching", var_14_30)

	local var_14_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ShowFetching", var_14_31)

	local var_14_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ShowFetching", var_14_32)

	local var_14_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_19:RegisterAnimationSequence("ShowFetching", var_14_33)

	local var_14_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_23:RegisterAnimationSequence("ShowFetching", var_14_34)

	local function var_14_35()
		var_14_8:AnimateSequence("ShowFetching")
		var_14_10:AnimateSequence("ShowFetching")
		var_14_12:AnimateSequence("ShowFetching")
		var_14_19:AnimateSequence("ShowFetching")
		var_14_23:AnimateSequence("ShowFetching")
	end

	var_14_0._sequences.ShowFetching = var_14_35

	local var_14_36
	local var_14_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_14_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -868
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 864
		}
	}

	var_14_6:RegisterAnimationSequence("HideFetching", var_14_37)

	local var_14_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_14_8:RegisterAnimationSequence("HideFetching", var_14_38)

	local var_14_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("HideFetching", var_14_39)

	local var_14_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("HideFetching", var_14_40)

	local var_14_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1823
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1573
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_14_16:RegisterAnimationSequence("HideFetching", var_14_41)

	local var_14_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1574
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 383
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_14_19:RegisterAnimationSequence("HideFetching", var_14_42)

	local var_14_43 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_14_21:RegisterAnimationSequence("HideFetching", var_14_43)

	local var_14_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		}
	}

	var_14_23:RegisterAnimationSequence("HideFetching", var_14_44)

	local var_14_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 518
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_14_25:RegisterAnimationSequence("HideFetching", var_14_45)

	local function var_14_46()
		var_14_6:AnimateSequence("HideFetching")
		var_14_8:AnimateSequence("HideFetching")
		var_14_10:AnimateSequence("HideFetching")
		var_14_12:AnimateSequence("HideFetching")
		var_14_16:AnimateSequence("HideFetching")
		var_14_19:AnimateSequence("HideFetching")
		var_14_21:AnimateSequence("HideFetching")
		var_14_23:AnimateSequence("HideFetching")
		var_14_25:AnimateSequence("HideFetching")
	end

	var_14_0._sequences.HideFetching = var_14_46

	local var_14_47
	local var_14_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("NoItems", var_14_48)

	local var_14_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_19:RegisterAnimationSequence("NoItems", var_14_49)

	local var_14_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_23:RegisterAnimationSequence("NoItems", var_14_50)

	local var_14_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_25:RegisterAnimationSequence("NoItems", var_14_51)

	local function var_14_52()
		var_14_14:AnimateSequence("NoItems")
		var_14_19:AnimateSequence("NoItems")
		var_14_23:AnimateSequence("NoItems")
		var_14_25:AnimateSequence("NoItems")
	end

	var_14_0._sequences.NoItems = var_14_52

	function var_14_0.addButtonHelperFunction(arg_21_0, arg_21_1)
		arg_21_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_14_0:addEventHandler("menu_create", var_14_0.addButtonHelperFunction)

	local var_14_53 = LUI.UIBindButton.new()

	var_14_53.id = "selfBindButton"

	var_14_0:addElement(var_14_53)

	var_14_0.bindButton = var_14_53

	var_14_0.bindButton:addEventHandler("button_secondary", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_14_1
		end

		ACTIONS.LeaveMenu(var_14_0)
	end)
	var_0_5(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("StoreGameUpsellPopup", StoreGameUpsellPopup)
LUI.FlowManager.RegisterStackPopBehaviour("StoreGameUpsellPopup", var_0_1)
LockTable(_M)
