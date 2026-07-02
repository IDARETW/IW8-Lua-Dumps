module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = false
	local var_1_1 = InGameStore.GetCategories(arg_1_1)

	if var_1_1 and #var_1_1 > 0 then
		for iter_1_0 = 1, #var_1_1 do
			local var_1_2 = var_1_1[iter_1_0].categoryId

			if var_1_2 == STORE.CODPointsCategory then
				local var_1_3 = InGameStore.GetCategoryProducts(arg_1_1, var_1_2)

				if var_1_3 and #var_1_3 > 0 then
					for iter_1_1 = 1, #var_1_3 do
						local var_1_4 = var_1_3[iter_1_1]

						var_1_4.itemIndex = iter_1_1 - 1
						var_1_4.owned = false
						var_1_4.isFirstParty = true
						var_1_4.image = var_1_4.image == "" and "placeholder_x" or var_1_4.image .. "_small"
					end

					local function var_1_5(arg_2_0, arg_2_1, arg_2_2)
						local var_2_0 = arg_1_0.Grid:GetContentIndex(arg_2_1, arg_2_2)

						arg_2_0:SetButtonData(var_1_3[var_2_0 + 1])
					end

					arg_1_0.Grid:SetRefreshChild(var_1_5)
					arg_1_0.Grid:SetNumChildren(#var_1_3)
					arg_1_0.Grid:RefreshContent()
					arg_1_0:processEvent({
						name = "gain_focus"
					})

					var_1_0 = true
				end
			end
		end
	end

	if var_1_0 then
		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.RIGHT)
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "NoItems")
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	InGameStore.FetchCatalog(arg_3_1, true, false)
	ACTIONS.AnimateSequence(arg_3_0, "ShowFetching")

	local var_3_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "update_fetching_store",
			controllerIndex = arg_3_1
		}
	})

	var_3_0.id = "fetchingTimer"

	arg_3_0:addElement(var_3_0)

	arg_3_0._fetchingTimer = var_3_0

	arg_3_0:registerEventHandler("update_fetching_store", function(arg_4_0, arg_4_1)
		local var_4_0 = InGameStore.GetCatalogStatus(arg_3_1)
		local var_4_1 = false

		if var_4_0 == InGameStoreCatalogStatus.READY then
			var_0_0(arg_3_0, arg_3_1)

			var_4_1 = true
		elseif var_4_0 == InGameStoreCatalogStatus.ERROR then
			var_4_1 = true

			local var_4_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_4_3 = Engine.BIAFEJHHDD()

				if var_4_3 ~= nil then
					local var_4_4 = Engine.JCBDICCAH(var_4_3)

					var_4_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_4_4)

					Engine.DCFIDJGACA()
				else
					var_4_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_4_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_4_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_4_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_4_2, nil, false, true)
			Engine.DHCGHHBHCH()
		end

		if var_4_1 then
			ACTIONS.AnimateSequence(arg_4_0, "HideFetching")
			arg_4_0._fetchingTimer:closeTree()

			arg_4_0._fetchingTimer = nil
		end
	end)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseCODPointsPopup)

	if arg_5_2.showBalance then
		local var_5_0 = Commerce.CEDDCGHIGA(arg_5_1, arg_5_2.currencyID)
		local var_5_1 = arg_5_2.currencyAmount
		local var_5_2 = var_5_1 - var_5_0
		local var_5_3 = {
			currentBalance = var_5_0,
			bundleCost = var_5_1,
			requiredAmount = var_5_2
		}

		arg_5_0.RequiredCPAmount:UpdateBalanceInfo(var_5_3)
		ACTIONS.AnimateSequence(arg_5_0, "ShowBalance")

		if var_5_2 > 0 then
			ACTIONS.AnimateSequence(arg_5_0.RequiredCPAmount, "RequiredAmountShow")
			arg_5_0.MessageText:setText(Engine.CBBHFCGDIC("LUA_MENU/NOT_ENOUGH_COD_POINTS"))
		else
			ACTIONS.AnimateSequence(arg_5_0.RequiredCPAmount, "RequiredAmountHide")
			arg_5_0.MessageText:setText(Engine.CBBHFCGDIC("STORE/REVIEW_COD_POINT_OPTIONS"))
		end
	end

	arg_5_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/COD_POINTS")))
	arg_5_0.Grid:SetNumChildren(0)
	var_0_1(arg_5_0, arg_5_1)
	arg_5_0:addEventHandler("menu_close", function(arg_6_0, arg_6_1)
		Engine.BGIAICIDDI(arg_5_1)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

function PurchaseCPPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -413 * _1080p, 413 * _1080p, -540 * _1080p, 540 * _1080p)

	var_7_0.id = "PurchaseCPPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "MenuTitle"

	var_7_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/COD_POINTS")), 0)
	var_7_4.Line:SetLeft(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_7_0:addElement(var_7_4)

	var_7_0.MenuTitle = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIText.new()

	var_7_6.id = "NoItemsLabel"

	var_7_6:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_7_6:SetAlpha(0, 0)
	var_7_6:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_STORE_ITEMS"), 0)
	var_7_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_6:SetAlignment(LUI.Alignment.Center)
	var_7_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * 20, _1080p * 50)
	var_7_0:addElement(var_7_6)

	var_7_0.NoItemsLabel = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "FetchingStoreLabel"

	var_7_8:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_7_8:SetAlpha(0, 0)
	var_7_8:setText(Engine.CBBHFCGDIC("MENU/FETCHING_STORE_DATA"), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * 20, _1080p * 50)
	var_7_0:addElement(var_7_8)

	var_7_0.FetchingStoreLabel = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Spinner"

	var_7_10:SetAlpha(0, 0)
	var_7_10:setImage(RegisterMaterial("spinner_loading"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170.5, _1080p * 169.5, _1080p * 55, _1080p * 65)
	var_7_0:addElement(var_7_10)

	var_7_0.Spinner = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "VerticalScrollbar"

	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 76, _1080p * 87, _1080p * 300, _1080p * 920)
	var_7_0:addElement(var_7_12)

	var_7_0.VerticalScrollbar = var_7_12

	local var_7_13
	local var_7_14 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 7,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 10,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PurchaseCPButton", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 640,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_15 = LUI.UIGrid.new(var_7_14)

	var_7_15.id = "Grid"

	var_7_15:setUseStencil(false)
	var_7_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -320, _1080p * 320, _1080p * 300, _1080p * 920)
	var_7_0:addElement(var_7_15)

	var_7_0.Grid = var_7_15

	local var_7_16
	local var_7_17 = LUI.UIText.new()

	var_7_17.id = "MessageText"

	var_7_17:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_7_17:setText(Engine.CBBHFCGDIC("LUA_MENU/NOT_ENOUGH_COD_POINTS"), 0)
	var_7_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_17:SetAlignment(LUI.Alignment.Left)
	var_7_17:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -320, _1080p * -28, _1080p * 150, _1080p * 174)
	var_7_0:addElement(var_7_17)

	var_7_0.MessageText = var_7_17

	local var_7_18
	local var_7_19 = MenuBuilder.BuildRegisteredType("RequiredCPAmount", {
		controllerIndex = var_7_1
	})

	var_7_19.id = "RequiredCPAmount"

	var_7_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 20, _1080p * 320, _1080p * 150, _1080p * 250)
	var_7_0:addElement(var_7_19)

	var_7_0.RequiredCPAmount = var_7_19

	local function var_7_20()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_20

	local var_7_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("NoItems", var_7_21)

	local var_7_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("NoItems", var_7_22)

	local var_7_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("NoItems", var_7_23)

	local function var_7_24()
		var_7_6:AnimateSequence("NoItems")
		var_7_12:AnimateSequence("NoItems")
		var_7_15:AnimateSequence("NoItems")
	end

	var_7_0._sequences.NoItems = var_7_24

	local var_7_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ShowFetching", var_7_25)

	local var_7_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ShowFetching", var_7_26)

	local function var_7_27()
		var_7_8:AnimateSequence("ShowFetching")
		var_7_10:AnimateSequence("ShowFetching")
	end

	var_7_0._sequences.ShowFetching = var_7_27

	local var_7_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("HideFetching", var_7_28)

	local var_7_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("HideFetching", var_7_29)

	local function var_7_30()
		var_7_8:AnimateSequence("HideFetching")
		var_7_10:AnimateSequence("HideFetching")
	end

	var_7_0._sequences.HideFetching = var_7_30

	local var_7_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("ShowBalance", var_7_31)

	local var_7_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("ShowBalance", var_7_32)

	local function var_7_33()
		var_7_17:AnimateSequence("ShowBalance")
		var_7_19:AnimateSequence("ShowBalance")
	end

	var_7_0._sequences.ShowBalance = var_7_33

	local var_7_34 = {}

	var_7_17:RegisterAnimationSequence("AR", var_7_34)

	local function var_7_35()
		var_7_17:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_35

	local var_7_36 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_7_12,
		startCap = var_7_12.startCap,
		endCap = var_7_12.endCap,
		sliderArea = var_7_12.sliderArea,
		slider = var_7_12.sliderArea and var_7_12.sliderArea.slider,
		fixedSizeSlider = var_7_12.sliderArea and var_7_12.sliderArea.fixedSizeSlider
	})

	var_7_15:AddScrollbar(var_7_36)

	local var_7_37 = LUI.UIBindButton.new()

	var_7_37.id = "selfBindButton"

	var_7_0:addElement(var_7_37)

	var_7_0.bindButton = var_7_37

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_7_1
		end

		if CONDITIONS.IsGamepadEnabled(var_7_0) then
			ACTIONS.LeaveMenu(var_7_0)
		end
	end)
	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("PurchaseCPPopup", PurchaseCPPopup)
LockTable(_M)
