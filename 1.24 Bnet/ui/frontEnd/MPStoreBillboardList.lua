module(..., package.seeall)

local var_0_0 = 600
local var_0_1 = 400 * _1080p
local var_0_2 = 328 * _1080p
local var_0_3 = 256 * _1080p
local var_0_4 = 20 * _1080p
local var_0_5 = 70 * _1080p
local var_0_6 = 3000

local function var_0_7(arg_1_0, arg_1_1)
	arg_1_0.BillboardArrows:SetAlpha(arg_1_1)
end

local function var_0_8(arg_2_0, arg_2_1)
	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)
	local var_2_1 = var_2_0._selectedColumn or 1

	if var_2_0.previewBundleID then
		if Loot.DEBEIFJEEG(arg_2_0._controllerIndex, tonumber(var_2_0.previewBundleID)) > 0 then
			var_2_1 = arg_2_1
		end

		var_2_0.previewBundleID = nil
	end

	arg_2_0.BillboardGrid:SetNumColumns(arg_2_1 + 2)
	arg_2_0.BillboardGrid:RefreshContent()
	arg_2_0.BillboardGrid:SetTargetColumn(var_2_1, false, true)

	local var_2_2 = LUI.IsLastInputKeyboardMouse(arg_2_0._controllerIndex)

	if arg_2_1 > 1 then
		arg_2_0.PipsWithNavigation.Pips:Resize(arg_2_1)
		arg_2_0.PipsWithNavigation.Pips:UpdateChildren(var_2_1 - 1, 0)
		arg_2_0.PipsWithNavigation:SetAlpha(1)
		arg_2_0.BillboardFocusArea:SetArrowsState(var_2_2)

		if not var_2_2 then
			var_0_7(arg_2_0, 1)
		end
	else
		arg_2_0.PipsWithNavigation:SetAlpha(0)
		arg_2_0.BillboardFocusArea:SetArrowsState(false)

		if not var_2_2 then
			var_0_7(arg_2_0, 0)
		end
	end

	arg_2_0.BillboardGrid._selectedColumn = var_2_1
end

local function var_0_9(arg_3_0)
	if arg_3_0._storeEmpty then
		if arg_3_0._lowestAvailableTime ~= "9999999999" and arg_3_0._lowestTimeDvar ~= "" then
			local var_3_0, var_3_1, var_3_2 = STORE.GetCategoryTimeLeft(arg_3_0._lowestTimeDvar)
			local var_3_3 = Engine.CBBHFCGDIC("LUA_MENU/STORE_EMPTY", var_3_1)

			ACTIONS.AnimateSequence(arg_3_0.StoreEmpty, "Big")
			arg_3_0.StoreEmpty:SetupEventBanner(var_3_3, 15)
		end
	else
		arg_3_0.StoreEmpty:SetAlpha(0)
	end
end

local function var_0_10(arg_4_0)
	arg_4_0._storeEmpty = true
	arg_4_0._lowestAvailableTime = "9999999999"
	arg_4_0._lowestTimeDvar = ""

	for iter_4_0 = 1, #arg_4_0._allCategoryData do
		local var_4_0 = arg_4_0._allCategoryData[iter_4_0]

		if var_4_0.timerPubVar then
			local var_4_1 = Dvar.DHEEJCCJBH(var_4_0.timerPubVar)

			var_4_1 = var_4_1 and #var_4_1 > 0 and var_4_1 or Engine.DEIDGHDBHD()

			if Engine.CCEJJCCDEG(tostring(var_4_1)) > 0 and var_4_1 < arg_4_0._lowestAvailableTime then
				arg_4_0._lowestAvailableTime = var_4_1
				arg_4_0._lowestTimeDvar = var_4_0.timerPubVar
			end
		end

		if not var_4_0.items[1].emptyCategory and not var_4_0.items[1].usesFirstPartyStore then
			arg_4_0._storeEmpty = false
		end
	end

	var_0_9(arg_4_0)
end

local function var_0_11(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {}
	local var_5_1 = arg_5_2.items[1] or {}

	if arg_5_2.idPubVar and var_5_1.layoutOnlyItem then
		local var_5_2 = Dvar.DHEEJCCJBH(arg_5_2.idPubVar) or ""

		if arg_5_2.justForYou and arg_5_0._recommendations then
			local var_5_3 = {
				items = arg_5_0._recommendations
			}

			var_5_3.isEnabled = true
			arg_5_0.recommendationData = var_5_3
			var_5_2 = STORE.FormatRecommendationItems(arg_5_0._recommendations .. "," .. var_5_2)
		end

		local var_5_4 = split(var_5_2, ",")
		local var_5_5 = 0

		for iter_5_0 = 1, #var_5_4 do
			local var_5_6 = tonumber(var_5_4[iter_5_0])

			if STORE.BundleAvailable(arg_5_1, var_5_6) then
				local var_5_7 = LUI.DeepCopy(var_5_1)

				var_5_7.emptyCategory = false
				var_5_7.id = var_5_6

				local var_5_8 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_5_9 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_5_4[iter_5_0])
				local var_5_10 = CSV.ReadRow(var_5_8, var_5_9)

				var_5_7.name = var_5_10.name
				var_5_7.asset = var_5_10.image
				var_5_7.description = STORE.GetBundleDescription(var_5_7.id)
				var_5_7.rarity = var_5_10.rarity
				var_5_7.bundleType = var_5_10.bundleType
				var_5_7.titleImage = var_5_10.titleImage
				var_5_7.currencyID = tonumber(var_5_10.currencyID)
				var_5_7.currencyAmount = tonumber(var_5_10.currencyAmount)
				var_5_7.firstPartyProductID = #var_5_10.firstPartyProductID > 0 and var_5_10.firstPartyProductID or nil

				table.insert(var_5_0, var_5_7)

				var_5_5 = var_5_5 + 1
			end

			if var_5_5 == arg_5_2.numItemsShown then
				break
			end
		end
	end

	if #var_5_0 == 0 then
		local var_5_11 = LUI.DeepCopy(var_5_1)

		if not var_5_11.usesFirstPartyStore then
			var_5_11.emptyCategory = true
			var_5_11.titleImage = nil
			var_5_11.asset = "mw_store_billboard_placeholder"
		end

		table.insert(var_5_0, var_5_11)
	end

	arg_5_2.items = var_5_0
end

local function var_0_12(arg_6_0)
	return function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = {
			LEFT = 1,
			RIGHT = 2
		}

		arg_6_0._scrollDirection = var_7_0

		local var_7_1 = {
			{
				columnChange = -1,
				resetScrollTimer = arg_6_0._gridRightScrollTimerHolder,
				scrollTimerHolder = arg_6_0._gridLeftScrollTimerHolder
			},
			{
				columnChange = 1,
				resetScrollTimer = arg_6_0._gridLeftScrollTimerHolder,
				scrollTimerHolder = arg_6_0._gridRightScrollTimerHolder
			}
		}

		local function var_7_2(arg_8_0, arg_8_1)
			Engine.BJDBIAGIDA(SOUND_SETS.storefront.triggerNavigation)

			if arg_8_1 and arg_6_0.DisableAutoScrollTimer then
				arg_6_0.DisableAutoScrollTimer()
			end

			if not arg_6_0._selectedCategory or not arg_7_0 or not arg_7_0[arg_6_0._selectedCategory] or not arg_7_0[arg_6_0._selectedCategory].items then
				return
			end

			local var_8_0 = #arg_7_0[arg_6_0._selectedCategory].items

			if var_8_0 > 1 then
				arg_6_0.PipsWithNavigation.Pips:Resize(var_8_0)

				local var_8_1 = var_7_1[arg_8_0]
				local var_8_2 = 0
				local var_8_3 = var_8_0

				if arg_8_0 == var_7_0.RIGHT then
					var_8_2 = var_8_0 + 1
					var_8_3 = 1
				end

				var_8_1.resetScrollTimer:Wait(1, true)

				if arg_8_0 == var_7_0.LEFT then
					arg_6_0._gridRightWaitTweenActive = false
				else
					arg_6_0._gridLeftWaitTweenActive = false
				end

				if arg_8_0 == var_7_0.LEFT and arg_6_0._gridLeftWaitTweenActive or arg_8_0 == var_7_0.RIGHT and arg_6_0._gridRightWaitTweenActive then
					var_8_1.scrollTimerHolder:Wait(1, true)
					arg_6_0.BillboardGrid:SetTargetColumn(var_8_3, false, true)

					arg_6_0.BillboardGrid._selectedColumn = var_8_3

					if arg_8_0 == var_7_0.LEFT then
						arg_6_0._gridLeftWaitTweenActive = false
					else
						arg_6_0._gridRightWaitTweenActive = false
					end
				end

				local var_8_4 = arg_6_0.BillboardGrid._selectedColumn + var_8_1.columnChange

				arg_6_0.BillboardGrid._selectedColumn = var_8_4

				arg_6_0.BillboardGrid:SetTargetColumn(var_8_4, false, false)

				if var_8_4 == var_8_2 then
					var_8_4 = var_8_3

					if arg_8_0 == var_7_0.LEFT then
						arg_6_0._gridLeftWaitTweenActive = true
					else
						arg_6_0._gridRightWaitTweenActive = true
					end

					var_8_1.scrollTimerHolder:Wait(var_0_0).onComplete = function()
						arg_6_0.BillboardGrid:SetTargetColumn(var_8_3, false, true)

						arg_6_0.BillboardGrid._selectedColumn = var_8_3

						if arg_8_0 == var_7_0.LEFT then
							arg_6_0._gridLeftWaitTweenActive = false
						else
							arg_6_0._gridRightWaitTweenActive = false
						end
					end
				end

				local var_8_5 = var_8_4 - 1

				arg_6_0.PipsWithNavigation.Pips:UpdateChildren(var_8_5, 0)
			end
		end

		arg_6_0.ChangeSelection = var_7_2

		local function var_7_3()
			local var_10_0 = #arg_7_0[arg_6_0._selectedCategory].items
			local var_10_1 = arg_6_0.BillboardGrid._selectedColumn

			if var_10_1 == 0 then
				var_10_1 = var_10_0
			elseif var_10_0 < var_10_1 then
				var_10_1 = 1
			end

			local var_10_2 = arg_7_0[arg_6_0._selectedCategory]
			local var_10_3 = var_10_2.items[var_10_1]

			if QUARTERMASTER.itemData.sessionId ~= nil then
				QUARTERMASTER.RecordMenuBrowseEvent(arg_6_0._controllerIndex, false)
			end

			QUARTERMASTER.BeginMenuBrowseEvent(var_10_2, var_10_3)
		end

		local function var_7_4(arg_11_0, arg_11_1)
			var_7_2(var_7_0.LEFT, true)

			if #arg_7_0[arg_6_0._selectedCategory].items > 1 then
				var_7_3()
			end

			return true
		end

		local function var_7_5(arg_12_0, arg_12_1)
			var_7_2(var_7_0.RIGHT, true)

			if #arg_7_0[arg_6_0._selectedCategory].items > 1 then
				var_7_3()
			end

			return true
		end

		local function var_7_6(arg_13_0, arg_13_1)
			if arg_13_1.down and arg_13_1.qualifier == "mousewheel" then
				if arg_13_1.button == "up" then
					var_7_4(arg_13_0, arg_13_1)
				else
					var_7_5(arg_13_0, arg_13_1)
				end
			end
		end

		arg_6_0.bindButton:addEventHandler("button_left_trigger", var_7_4)
		arg_6_0.bindButton:addEventHandler("button_right_trigger", var_7_5)
		arg_6_0.BillboardFocusArea:SetLeftNavigationHandler(var_7_4)
		arg_6_0.BillboardFocusArea:SetRightNavigationHandler(var_7_5)
		arg_6_0.BillboardFocusArea:SetGamepadButtonHandler(var_7_6)
	end
end

local function var_0_13(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0, var_14_1 = STORE.GetIndexForBundle(arg_14_1, arg_14_0._controllerIndex)

	if var_14_0 and var_14_1 then
		local var_14_2 = arg_14_0.categoryButtonsContainer:GetElementAtIndex(var_14_0)

		if var_14_2 then
			arg_14_0.categoryButtonsContainer:processEvent({
				name = "lose_focus"
			})
			var_14_2:processEvent({
				name = "gain_focus"
			})

			arg_14_0.BillboardGrid._selectedColumn = var_14_1

			arg_14_0.BillboardGrid:SetTargetColumn(var_14_1, false, true)

			if arg_14_2 then
				var_14_2:processEvent({
					name = "button_action"
				})
			end
		end
	else
		LUI.FlowManager.RequestPopupMenu(arg_14_0, "PopupOK", true, controllerIndex, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_NOT_AVAILABLE")
		})
	end
end

local function var_0_14(arg_15_0, arg_15_1)
	local var_15_0 = STORE.GetCategoryIndex(arg_15_1)

	if var_15_0 and arg_15_0.categoryButtonsContainer then
		local var_15_1 = arg_15_0.categoryButtonsContainer:GetElementAtIndex(var_15_0)

		if var_15_1 then
			arg_15_0.categoryButtonsContainer:processEvent({
				name = "lose_focus"
			})
			var_15_1:processEvent({
				name = "gain_focus"
			})

			return
		end
	end
end

local function var_0_15(arg_16_0, arg_16_1, arg_16_2)
	function arg_16_0.FocusBundleByID(arg_17_0, arg_17_1, arg_17_2)
		var_0_13(arg_16_0, arg_17_1, arg_17_2)
	end

	function arg_16_0.FocusButtonByName(arg_18_0, arg_18_1)
		var_0_14(arg_16_0, arg_18_1)
	end

	local var_16_0 = LUI.UIBindButton.new()

	var_16_0.id = "bindButton"

	arg_16_0:addElement(var_16_0)

	arg_16_0.bindButton = var_16_0

	ACTIONS.AnimateSequence(arg_16_0.BillboardArrows, "Intro")
	ACTIONS.ScaleFullscreen(arg_16_0.Background)
	Engine.DHFCHIIJCA("quartermaster")
	arg_16_0:addElement(LOOT.GetLootFlareMaterialStreamer())

	arg_16_0._controllerIndex = arg_16_1

	if QUARTERMASTER.itemData then
		QUARTERMASTER.itemData = {}
	end

	arg_16_0._itemsFocused = false

	function arg_16_0.BackButtonOverride(arg_19_0, arg_19_1)
		if LUI.FlowManager.GetScopedData(arg_19_0).useStandaloneStore then
			LUI.FlowManager.RequestLeaveMenu(arg_19_0)
		elseif arg_16_0._itemsFocused and arg_16_0.container then
			arg_16_0.container:processEvent({
				name = "lose_focus"
			})
			arg_16_0._categoryWidget:processEvent({
				name = "gain_focus"
			})

			arg_16_0._itemsFocused = false
		else
			local var_19_0 = arg_19_1.qualifier ~= "keyboard" and arg_19_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad
			local var_19_1 = arg_19_0:getParent()
			local var_19_2 = arg_19_1.controller or arg_16_1

			var_19_1.Tabs:FocusTab(var_19_2, 0, var_19_0)
		end

		return false
	end

	arg_16_0:addEventHandler("menu_create", function(arg_20_0, arg_20_1)
		local var_20_0 = LUI.FlowManager.GetScopedData(arg_20_0)

		if var_20_0._selectedCategory then
			local var_20_1 = arg_16_0.categoryButtonsContainer:GetElementAtIndex(var_20_0._selectedCategory)

			arg_16_0._categoryWidget = var_20_1
			arg_16_0._itemsFocused = true

			var_20_1:processEvent({
				name = "gain_focus"
			})
			arg_16_0.categoryButtonsContainer:processEvent({
				name = "lose_focus"
			})
		end
	end)

	local function var_16_1(arg_21_0)
		local var_21_0 = LUI.UIHorizontalList.new()

		var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 616, _1080p * 1790, _1080p * 216, _1080p * 800)
		var_21_0:SetSpacing(8 * _1080p)

		arg_21_0.container = var_21_0

		arg_21_0:addElement(var_21_0)
	end

	local function var_16_2()
		if arg_16_0.container then
			arg_16_0.container:closeTree()

			arg_16_0.container = nil
		end

		arg_16_0.ContainerBuilder = var_16_1

		var_16_1(arg_16_0)
	end

	arg_16_0._gridLeftScrollTimerHolder = LUI.UIElement.new()

	arg_16_0:addElement(arg_16_0._gridLeftScrollTimerHolder)

	arg_16_0._gridLeftWaitTweenActive = false
	arg_16_0._gridRightScrollTimerHolder = LUI.UIElement.new()

	arg_16_0:addElement(arg_16_0._gridRightScrollTimerHolder)

	arg_16_0._gridRightWaitTweenActive = false

	local var_16_3 = var_0_12(arg_16_0)

	local function var_16_4(arg_23_0, arg_23_1, arg_23_2)
		arg_16_0.BillboardGrid._disableMouseWheel = true

		if LUI.IsLastInputKeyboardMouse(arg_16_1) then
			arg_16_0.BillboardGrid:SetAlpha(1)
		end

		local function var_23_0(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_0._element
			local var_24_1 = arg_24_0._categoryData

			arg_16_0.BillboardCategoryButtonAction(var_24_0, arg_24_1, var_24_1, arg_23_1)

			return true
		end

		arg_16_0.BillboardFocusArea:SetBackgroundLeftMouseHandler(var_23_0)
	end

	local function var_16_5(arg_25_0, arg_25_1, arg_25_2)
		arg_16_0.categoryButtonsContainer:SetNotifyOnLayoutInit(true)

		local function var_25_0(arg_26_0, arg_26_1)
			if not arg_16_0._selectedCategory then
				arg_16_0:processEvent({
					name = "lose_focus"
				})
				arg_26_0:processEvent({
					name = "gain_focus"
				})
			end
		end

		arg_16_0.categoryButtonsContainer:registerEventHandler("layout_initialized", var_25_0)
	end

	local function var_16_6(arg_27_0, arg_27_1, arg_27_2)
		local function var_27_0(arg_28_0, arg_28_1)
			if arg_28_0.BillboardFocusArea:isInFocus() then
				arg_28_0:processEvent({
					name = "lose_focus"
				})
				arg_28_0.categoryButtonsContainer:processEvent({
					name = "gain_focus"
				})
			end

			local var_28_0 = LUI.IsLastInputKeyboardMouse(arg_28_1.controllerIndex) and 0 or 1

			var_0_7(arg_28_0, var_28_0)
		end

		arg_16_0:registerAndCallEventHandler("update_input_type", var_27_0, {
			controllerIndex = arg_16_1
		})
	end

	local var_16_7 = {
		default = {
			categoryButtonContainer = {
				widgetType = "MPDepotMenuVerticalButtons",
				anchors = {
					top = 0,
					bot = 1,
					left = 0,
					right = 1
				},
				positions = {
					left = _1080p * 130,
					right = _1080p * 590,
					top = _1080p * 216,
					bot = _1080p * 503
				}
			},
			categoryButton = {
				widgetType = "MPMenuButton",
				anchors = {
					top = 0,
					bot = 1,
					left = 0,
					right = 1
				},
				positions = {
					top = 0,
					left = 0,
					right = _1080p * 460,
					bot = _1080p * 40
				},
				events = {
					"button_over",
					"button_action"
				}
			},
			storeCustomizations = {
				pre = {
					var_16_2
				}
			}
		},
		[StoreItemLayout.BILLBOARD_LIST] = {
			categoryButtonContainer = {
				widgetType = "MPDepotMenuHorizontalButtons",
				anchors = {
					top = 0.5,
					bot = 0.5,
					left = 0,
					right = 0
				},
				positions = {
					left = var_0_5,
					right = -var_0_5,
					top = _1080p * 256,
					bot = _1080p * 440
				}
			},
			categoryButton = {
				widgetType = "MPBillboardMenuButton",
				anchors = {
					top = 0.5,
					bot = 0.5,
					left = 0.5,
					right = 0.5
				},
				positions = {
					left = _1080p * -164,
					right = _1080p * 164,
					top = _1080p * -92,
					bot = _1080p * 92
				},
				events = {
					"button_over",
					"button_action",
					"gain_focus"
				},
				buttonCustomizations = {}
			},
			storeCustomizations = {
				pre = {
					var_16_3,
					var_16_4
				},
				post = {
					var_16_5,
					var_16_6
				}
			}
		}
	}

	local function var_16_8(arg_29_0)
		return var_16_7[arg_29_0] or var_16_7.default
	end

	local function var_16_9(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
		if arg_30_0 then
			for iter_30_0, iter_30_1 in ipairs(arg_30_0) do
				iter_30_1(arg_30_1, arg_30_2, arg_30_3)
			end
		end
	end

	local function var_16_10(arg_31_0, arg_31_1)
		arg_31_0.Name:setText(Engine.CBBHFCGDIC(arg_31_1.name))

		if arg_31_0.Owned.Text then
			local var_31_0 = Loot.DEBEIFJEEG(arg_16_1, arg_31_1.id)

			if var_31_0 > 0 then
				arg_31_0.Owned.Text:setText(var_31_0)
				arg_31_0.Owned:SetAlpha(1)
			else
				arg_31_0.Owned.Text:setText("")
				arg_31_0.Owned:SetAlpha(0)
			end
		end

		arg_31_0:registerEventHandler("button_action", function(arg_32_0, arg_32_1)
			LUI.FlowManager.RequestAddMenu("PurchaseItemMenu", true, arg_16_1, false, {
				crateID = arg_31_1.id
			})
		end)
	end

	local function var_16_11()
		if arg_16_0.container then
			arg_16_0.container:closeTree()

			arg_16_0.container = nil
		end
	end

	local var_16_12 = {
		{
			"ItemAtom",
			"ItemTall"
		},
		{
			"Item2x1Wide",
			"Item2x2Square"
		},
		{
			"Item3x1Wide"
		}
	}
	local var_16_13 = {}

	local function var_16_14(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
		if not var_16_13[arg_34_4] then
			local var_34_0 = 1
			local var_34_1 = 1
			local var_34_2 = 1

			while arg_34_1[arg_34_3 + var_34_2] do
				if arg_34_1[arg_34_3 + var_34_2] == arg_34_4 then
					var_34_0 = var_34_0 + 1
				end

				var_34_2 = var_34_2 + 1
			end

			if arg_34_2 == 1 and arg_34_0[arg_34_2 + 1][arg_34_3] == arg_34_4 then
				var_34_1 = var_34_1 + 1
			end

			var_16_13[arg_34_4] = {
				width = var_34_0,
				height = var_34_1
			}
		end
	end

	local var_16_15 = {}

	local function var_16_16(arg_35_0, arg_35_1, arg_35_2)
		if not var_16_15[arg_35_2] then
			var_16_15[arg_35_2] = {
				row = arg_35_0,
				column = arg_35_1
			}
		end
	end

	local var_16_17 = _1080p * 10
	local var_16_18 = _1080p * 350
	local var_16_19 = var_16_18 + var_16_17
	local var_16_20 = {
		{
			{
				posL = 0,
				anchorL = 0,
				anchorT = 0,
				posB = 0,
				posT = 0,
				anchorB = 1,
				anchorR = 1,
				posR = 0
			},
			{
				anchorL = 0,
				anchorT = 0,
				posB = 0,
				posT = 0,
				anchorB = 1,
				anchorR = 1,
				posL = var_16_19,
				posR = var_16_19
			},
			{
				anchorL = 0,
				anchorT = 0,
				posB = 0,
				posT = 0,
				anchorB = 1,
				anchorR = 1,
				posL = 2 * var_16_19,
				posR = 2 * var_16_19
			}
		},
		{
			{
				posL = 0,
				anchorL = 0,
				anchorT = 0,
				anchorB = 1,
				anchorR = 1,
				posR = 0,
				posT = var_16_19,
				posB = var_16_19
			},
			{
				anchorL = 0,
				anchorT = 0,
				anchorB = 1,
				anchorR = 1,
				posL = var_16_19,
				posR = var_16_19,
				posT = var_16_19,
				posB = var_16_19
			},
			{
				anchorL = 0,
				anchorT = 0,
				anchorB = 1,
				anchorR = 1,
				posL = 2 * var_16_19,
				posR = 2 * var_16_19,
				posT = var_16_19,
				posB = var_16_19
			}
		}
	}
	local var_16_21 = {}

	local function var_16_22(arg_36_0)
		for iter_36_0 = 1, #arg_36_0.items do
			local var_36_0 = arg_36_0.items[iter_36_0]
			local var_36_1
			local var_36_2 = var_36_0.order
			local var_36_3 = var_16_13[var_36_2]
			local var_36_4 = var_16_12[var_36_3.width][var_36_3.height]
			local var_36_5 = var_16_15[var_36_2]
			local var_36_6 = var_16_20[var_36_5.row][var_36_5.column]
			local var_36_7 = MenuBuilder.BuildRegisteredType(var_36_4, {
				controllerIndex = arg_16_1
			})

			var_36_7.id = tostring(var_36_0.id)

			var_16_10(var_36_7, var_36_0)
			arg_16_0.container:addElement(var_36_7)

			local var_36_8 = 0
			local var_36_9 = 0

			if var_36_3.width > 1 then
				var_36_8 = var_16_17 * (var_36_3.width - 1)
			end

			if var_36_3.height > 1 then
				var_36_9 = var_16_17 * (var_36_3.height - 1)
			end

			var_36_7:SetAnchorsAndPosition(var_36_6.anchorL, var_36_6.anchorR, var_36_6.anchorT, var_36_6.anchorB, var_36_6.posL, var_36_6.posR + (var_36_3.width * var_16_18 + var_36_8), var_36_6.posT, var_36_6.posB + (var_36_3.height * var_16_18 + var_36_9))

			var_16_21[var_36_2] = var_36_7
		end
	end

	local var_16_23 = {}

	local function var_16_24(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
		local var_37_0
		local var_37_1
		local var_37_2
		local var_37_3

		if not var_16_23[arg_37_4] then
			var_16_23[arg_37_4] = {}

			if arg_37_1[arg_37_3 - 1] and arg_37_1[arg_37_3 - 1] ~= arg_37_4 then
				local var_37_4 = arg_37_1[arg_37_3 - 1]

				var_16_23[arg_37_4].left = var_37_4
			end

			if arg_37_2 == 1 then
				local var_37_5 = arg_37_0[arg_37_2 + 1]

				if var_37_5[arg_37_3] ~= arg_37_4 and not var_37_3 then
					local var_37_6 = var_37_5[arg_37_3]

					var_16_23[arg_37_4].down = var_37_6
				end
			elseif arg_37_2 == 2 then
				local var_37_7 = arg_37_0[arg_37_2 - 1]

				if var_37_7[arg_37_3] ~= arg_37_4 and not var_37_2 then
					local var_37_8 = var_37_7[arg_37_3]

					var_16_23[arg_37_4].up = var_37_8
				end
			end

			local var_37_9 = 1

			while arg_37_1[arg_37_3 + var_37_9] do
				if arg_37_1[arg_37_3 + var_37_9] ~= arg_37_4 and not var_37_1 then
					var_37_1 = arg_37_1[arg_37_3 + var_37_9]
					var_16_23[arg_37_4].right = var_37_1
				end

				var_37_9 = var_37_9 + 1
			end
		end
	end

	local function var_16_25()
		for iter_38_0 = 1, #var_16_21 do
			local var_38_0 = var_16_21[iter_38_0]
			local var_38_1 = var_16_23[iter_38_0]

			var_38_0.navigation = {}

			if var_38_1.left then
				var_38_0.navigation.left = var_16_21[var_38_1.left]
			end

			if var_38_1.right then
				var_38_0.navigation.right = var_16_21[var_38_1.right]
			end

			if var_38_1.up then
				var_38_0.navigation.up = var_16_21[var_38_1.up]
			end

			if var_38_1.down then
				var_38_0.navigation.down = var_16_21[var_38_1.down]
			end
		end
	end

	local function var_16_26(arg_39_0)
		var_16_13 = {}
		var_16_15 = {}
		var_16_23 = {}
		var_16_21 = {}

		for iter_39_0 = 1, #arg_39_0 do
			local var_39_0 = arg_39_0[iter_39_0]

			for iter_39_1, iter_39_2 in ipairs(var_39_0) do
				var_16_16(iter_39_0, iter_39_1, iter_39_2)
				var_16_14(arg_39_0, var_39_0, iter_39_0, iter_39_1, iter_39_2)
				var_16_24(arg_39_0, var_39_0, iter_39_0, iter_39_1, iter_39_2)
			end
		end
	end

	local var_16_27 = {
		button_over = {
			default = function(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
				var_16_11()

				local var_40_0 = LUI.UIHorizontalList.new()

				var_40_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 616, _1080p * 1790, _1080p * 253, _1080p * 800)
				var_40_0:SetSpacing(8 * _1080p)

				arg_16_0.container = var_40_0

				arg_16_0:addElement(var_40_0)

				for iter_40_0 = 1, #arg_40_2.items do
					local var_40_1 = arg_40_2.items[iter_40_0]
					local var_40_2

					if arg_40_2.layoutType == StoreItemLayout.COMPACT then
						var_40_2 = MenuBuilder.BuildRegisteredType("ItemCompact", {
							controllerIndex = arg_16_1
						})
					elseif arg_40_2.layoutType == StoreItemLayout.TALL then
						var_40_2 = MenuBuilder.BuildRegisteredType("ItemTall", {
							controllerIndex = arg_16_1
						})
					else
						assert(false, "Unknown item layout type!")
					end

					var_40_2.id = tostring(var_40_1.id)

					var_16_10(var_40_2, var_40_1)
					arg_16_0.container:addElement(var_40_2)
				end
			end,
			[StoreItemLayout.SQUARES] = function(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
				var_16_11()

				local var_41_0 = {
					scrollingThresholdX = 1,
					buildArrowsLabel = false,
					maxVelocity = 5000,
					wrapX = true,
					adjustSizeToContent = false,
					scrollingThresholdY = 1,
					maxVisibleColumns = 4,
					maxVisibleRows = 2,
					wrapY = true,
					springCoefficient = 400,
					controllerIndex = arg_16_1,
					buildChild = function()
						return MenuBuilder.BuildRegisteredType("ItemSquare", {
							controllerIndex = arg_16_1
						})
					end,
					refreshChild = function(arg_43_0, arg_43_1, arg_43_2)
						local var_43_0 = arg_43_1 + 1 + arg_43_2 * 4
						local var_43_1 = arg_41_2.items[var_43_0] or arg_41_2.items[2]

						if var_43_1 then
							var_16_10(arg_43_0, var_43_1)
						end
					end,
					spacingX = _1080p * 2,
					spacingY = _1080p * 2,
					columnWidth = _1080p * 300,
					rowHeight = _1080p * 300,
					horizontalAlignment = LUI.Alignment.Left,
					verticalAlignment = LUI.Alignment.Top
				}
				local var_41_1 = LUI.UIGrid.new(var_41_0)

				var_41_1.id = "container"

				var_41_1:setUseStencil(true)
				var_41_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 584, _1080p * 1790, _1080p * 239, _1080p * 841)

				arg_16_0.container = var_41_1

				arg_16_0:addElement(var_41_1)
				var_41_1:SetNumChildren(8)
			end,
			[StoreItemLayout.CUSTOM] = function(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
				var_16_11()

				local var_44_0 = arg_44_2.layoutName
				local var_44_1 = Engine.CIFIHAAJGD(var_44_0)

				var_16_26(var_44_1)

				local var_44_2 = LUI.UIElement.new()

				var_44_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 616, _1080p * 1790, _1080p * 216, _1080p * 800)
				var_44_2:SetSpacing(8 * _1080p)

				var_44_2.custom = true
				var_44_2.elements = var_16_21
				arg_16_0.container = var_44_2

				arg_16_0:addElement(var_44_2)
				var_16_22(arg_44_2)
				var_16_25()
			end,
			[StoreItemLayout.BILLBOARD_LIST] = function(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
				local var_45_0 = arg_45_2.items

				if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId ~= nil and QUARTERMASTER.itemData.category_index ~= arg_45_2.categoryIndex then
					QUARTERMASTER.RecordMenuBrowseEvent(arg_16_1, false)
				end

				QUARTERMASTER.BeginMenuBrowseEvent(arg_45_2, var_45_0[1])
				arg_16_0.BillboardFocusArea:SetCurrentCategoryData(arg_45_0, arg_45_2)

				local function var_45_1(arg_46_0, arg_46_1, arg_46_2)
					local var_46_0 = arg_46_1

					if arg_46_1 == 0 then
						var_46_0 = #arg_45_2.items
					elseif arg_46_1 == #arg_45_2.items + 1 then
						var_46_0 = 1
					end

					local var_46_1 = arg_45_2.items[var_46_0]

					if not var_46_1.usesFirstPartyStore then
						var_46_1.usesFirstPartyStore = false
					end

					arg_46_0:UpdateBillboard(var_46_1, var_46_1.usesFirstPartyStore)
				end

				arg_16_0.BillboardGrid:SetAlpha(1)
				arg_16_0.BillboardGrid:SetRefreshChild(var_45_1)
				arg_16_0.BillboardGrid:SetNumRows(1)

				local var_45_2 = arg_45_2.categoryIndex - 1
				local var_45_3 = var_45_2 * var_0_4
				local var_45_4 = var_45_2 * var_0_2
				local var_45_5 = (var_0_1 - var_0_3) / 2

				if arg_16_0.categoryButtonsContainer._currentActiveButton ~= arg_45_0 then
					var_0_8(arg_16_0, #var_45_0)
				end

				arg_16_0.BillboardFocusArea:SetCurrentCategoryData(arg_45_0, arg_45_2)

				LUI.FlowManager.GetScopedData(arg_16_0)._selectedColumn = 1
				arg_16_0._selectedCategory = arg_45_2.categoryIndex

				arg_16_0:dispatchEventToChildren({
					name = "categoryTimerUpdate"
				})

				if arg_16_0.DisableAutoScrollTimer then
					arg_16_0.DisableAutoScrollTimer()
				end
			end
		},
		button_action = {
			default = function(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
				arg_47_0:processEvent({
					name = "lose_focus"
				})
				arg_16_0.container:processEvent({
					name = "gain_focus"
				})

				arg_16_0._itemsFocused = true
				arg_16_0._categoryWidget = arg_47_0
				LUI.FlowManager.GetScopedData(arg_16_0)._selectedCategory = arg_16_0.categoryButtonsContainer:GetIndexForElement(arg_47_0)
			end,
			[StoreItemLayout.CUSTOM] = function(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
				arg_48_0:processEvent({
					name = "lose_focus"
				})
				arg_16_0.container.elements[1]:processEvent({
					name = "gain_focus"
				})

				arg_16_0._itemsFocused = true
				arg_16_0._categoryWidget = arg_48_0
				LUI.FlowManager.GetScopedData(arg_16_0)._selectedCategory = arg_16_0.categoryButtonsContainer:GetIndexForElement(arg_48_0)
			end,
			[StoreItemLayout.BILLBOARD_LIST] = function(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
				local var_49_0 = arg_16_0.BillboardGrid._selectedColumn or 1

				if var_49_0 == 0 then
					var_49_0 = #arg_49_2.items
				elseif var_49_0 == #arg_49_2.items + 1 then
					var_49_0 = 1
				end

				local var_49_1 = LUI.FlowManager.GetScopedData(arg_16_0)

				var_49_1._selectedColumn = var_49_0

				local var_49_2 = arg_49_2.items[var_49_0]

				var_49_1._selectedCategory = arg_49_2.categoryIndex

				if not var_49_2.usesFirstPartyStore then
					if var_49_2.emptyCategory then
						return
					end

					QUARTERMASTER.CoalesceBrowseData()
					QUARTERMASTER.RecordMenuBrowseEvent(arg_16_1, true)
					STORE.MarkItemSeen(arg_16_1, var_49_2.id)
					arg_16_0.BillboardGrid:RefreshContent()

					if var_49_2.firstPartyProductID then
						if STORE.IsGameUpsellBundle(var_49_2.id) then
							LUI.FlowManager.RequestPopupMenu(arg_16_0, "StoreGameUpsellPopup", true, arg_16_1, false, {
								defaultProductId = var_49_2.firstPartyProductID
							})
						else
							InGameStore.SelectProduct(arg_16_1, var_49_2.firstPartyProductID, InGameStorePurchaseType.BROWSE)
						end

						return
					end

					local var_49_3 = {
						bundleID = var_49_2.id,
						rarity = var_49_2.rarity,
						description = var_49_2.description,
						bundleType = var_49_2.bundleType,
						titleImage = var_49_2.titleImage,
						currencyID = var_49_2.currencyID,
						currencyAmount = var_49_2.currencyAmount,
						startPurchaseImmediately = arg_16_0._startPurchaseImmediately
					}

					if not arg_49_2.justForYou then
						var_49_3.timerPubVar = arg_49_2.timerPubVar
					end

					var_49_1.previewBundleID = var_49_2.id

					LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_16_1, false, var_49_3)
				else
					QUARTERMASTER.RecordMenuBrowseEvent(arg_16_1, true)
					STORE.GoToStore(arg_16_1, arg_16_0:GetCurrentMenu().id, arg_49_0.id)
				end
			end
		},
		gain_focus = {
			[StoreItemLayout.BILLBOARD_LIST] = function(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
				arg_50_0:ScaleButtonUp()

				if arg_16_0.categoryButtonsContainer then
					if arg_16_0.categoryButtonsContainer._currentActiveButton and arg_16_0.categoryButtonsContainer._currentActiveButton ~= arg_50_0 then
						ACTIONS.AnimateSequence(arg_16_0.categoryButtonsContainer._currentActiveButton, "ButtonUp")
						arg_16_0.categoryButtonsContainer._currentActiveButton:ScaleButtonDown()
					end

					arg_16_0.categoryButtonsContainer._currentActiveButton = arg_50_0
				end
			end
		}
	}

	arg_16_0.BillboardCategoryButtonAction = var_16_27.button_action[StoreItemLayout.BILLBOARD_LIST]

	local function var_16_28(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
		return function(arg_52_0, arg_52_1)
			assert(var_16_27[arg_51_0], string.format("No handlers for event %s", arg_51_0))

			local var_52_0 = var_16_27[arg_51_0][arg_51_1]

			if var_52_0 then
				var_52_0(arg_52_0, arg_52_1, arg_51_2, arg_51_3)
			elseif var_16_27[arg_51_0].default then
				local var_52_1 = var_16_27[arg_51_0].default(arg_52_0, arg_52_1, arg_51_2, arg_51_3)
			else
				return false
			end
		end
	end

	local function var_16_29(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
		local var_53_0 = arg_53_2.events

		if var_53_0 then
			for iter_53_0, iter_53_1 in ipairs(var_53_0) do
				local var_53_1 = var_16_28(iter_53_1, arg_53_1, arg_53_3, arg_53_2)

				if var_53_1 then
					arg_53_0:addEventHandler(iter_53_1, var_53_1)
				end
			end
		end
	end

	local function var_16_30(arg_54_0)
		local var_54_0 = var_16_8(arg_54_0).categoryButtonContainer
		local var_54_1 = MenuBuilder.BuildRegisteredType(var_54_0.widgetType, {
			controllerIndex = arg_16_1,
			storeMenu = arg_16_0
		})

		var_54_1.id = "categoryButtonsContainer"

		local var_54_2 = var_54_0.anchors
		local var_54_3 = var_54_0.positions

		var_54_1:SetAnchorsAndPosition(var_54_2.left, var_54_2.right, var_54_2.top, var_54_2.bot, var_54_3.left, var_54_3.right, var_54_3.top, var_54_3.bot)
		arg_16_0:addElement(var_54_1)

		arg_16_0.categoryButtonsContainer = var_54_1
	end

	local function var_16_31(arg_55_0, arg_55_1)
		local var_55_0 = var_16_8(arg_55_0).categoryButton
		local var_55_1 = MenuBuilder.BuildRegisteredType(var_55_0.widgetType, {
			controllerIndex = arg_16_1
		})
		local var_55_2 = Engine.CBBHFCGDIC(arg_55_1.name)

		var_55_1.id = var_55_2

		var_55_1.Text:setText(ToUpperCase(var_55_2))

		local var_55_3 = var_55_0.anchors
		local var_55_4 = var_55_0.positions

		var_55_1:SetAnchorsAndPosition(var_55_3.left, var_55_3.right, var_55_3.top, var_55_3.bot, var_55_4.left, var_55_4.right, var_55_4.top, var_55_4.bot)
		var_55_1:setPriority(arg_55_1.categoryIndex - #arg_55_1 - 1)

		if arg_55_1.asset then
			var_55_1.ItemImage:setImage(RegisterMaterial(arg_55_1.asset))
		end

		arg_16_0.categoryButtonsContainer:addElement(var_55_1)
		var_55_1:registerEventHandler("categoryTimerUpdate", function(arg_56_0, arg_56_1)
			local var_56_0 = arg_55_1.items[1]

			if not var_56_0.usesFirstPartyStore then
				if arg_55_1.justForYou then
					if arg_55_1.categoryIndex == arg_16_0._selectedCategory then
						if var_56_0.emptyCategory then
							ACTIONS.AnimateSequence(arg_16_0.NoMoreItemsMessage, "Message")
							arg_16_0.NoMoreItemsMessage.Title:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_BUY_THROUGH_MESSAGE"))
							arg_16_0.NoMoreItemsMessage:SetAlpha(1)
							ACTIONS.AnimateSequence(arg_56_0, "CategoryEmpty")
						else
							arg_16_0.NoMoreItemsMessage:SetAlpha(0)
							ACTIONS.AnimateSequence(arg_56_0, "CategoryNotEmpty")
						end
					end
				else
					local var_56_1, var_56_2, var_56_3 = STORE.GetCategoryTimeLeft(arg_55_1.timerPubVar)

					if not var_55_1._timerValue and var_56_3 ~= "" then
						var_55_1._timerValue = var_56_3
					end

					local var_56_4 = Dvar.DHEEJCCJBH(arg_55_1.idPubVar) or ""

					if not var_55_1._idPubVarString and var_56_4 ~= "" then
						var_55_1._idPubVarString = var_56_4
					end

					local var_56_5

					var_56_5 = var_56_1 <= 0

					if arg_55_1.categoryIndex == arg_16_0._selectedCategory then
						if var_56_0.emptyCategory then
							ACTIONS.AnimateSequence(arg_16_0.NoMoreItemsMessage, "Message")
							arg_16_0.NoMoreItemsMessage.Title:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_BUY_THROUGH_MESSAGE"))
							arg_16_0.NoMoreItemsMessage:SetAlpha(1)
						elseif var_56_0.emptyCategory then
							ACTIONS.AnimateSequence(arg_16_0.NoMoreItemsMessage, "Message")
							arg_16_0.NoMoreItemsMessage.Title:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_BUY_THROUGH_MESSAGE"))
							arg_16_0.NoMoreItemsMessage:SetAlpha(1)
						else
							arg_16_0.NoMoreItemsMessage:SetAlpha(0)
						end
					end

					if var_56_0.emptyCategory then
						ACTIONS.AnimateSequence(arg_56_0, "CategoryEmpty")
					else
						ACTIONS.AnimateSequence(arg_56_0, "CategoryNotEmpty")
					end

					if var_55_1._timerValue and var_55_1._timerValue ~= var_56_3 or var_55_1._idPubVarString and var_55_1._idPubVarString ~= var_56_4 then
						var_0_11(arg_16_0, arg_16_1, arg_55_1)
						var_0_10(arg_16_0)

						if arg_55_1.categoryIndex == arg_16_0._selectedCategory then
							var_0_8(arg_16_0, #arg_55_1.items)
						end

						var_55_1._timerValue = var_56_3
						var_55_1._idPubVarString = arg_55_1.idPubVarString
					end
				end
			elseif arg_55_1.categoryIndex == arg_16_0._selectedCategory then
				arg_16_0.NoMoreItemsMessage:SetAlpha(0)
			end

			if arg_56_0.NewItemNotification and STORE.CategoryHasNewItems(arg_16_1, arg_55_1) then
				arg_56_0.NewItemNotification:SetAlpha(1)
			else
				arg_56_0.NewItemNotification:SetAlpha(0)
			end
		end)

		return var_55_1
	end

	local var_16_32 = Store.EHGIGBJJC()
	local var_16_33 = Store.DBFHBBIDHD()
	local var_16_34 = Engine.EHGIGBJJC(var_16_32)
	local var_16_35 = Engine.DBFHBBIDHD(var_16_33)

	arg_16_0._allCategoryData = var_16_35
	arg_16_0._recommendations = STORE.CheckForPersonalRecommendations(arg_16_1)
	arg_16_0._categoryIndex = nil
	arg_16_0._currentButton = nil

	if not arg_16_0._recommendations then
		local var_16_36 = {}

		var_16_36.isEnabled = false
		arg_16_0.recommendationData = var_16_36
	end

	for iter_16_0 = 1, #var_16_35 do
		local var_16_37 = var_16_35[iter_16_0]

		var_16_37.items = var_16_37.items or {}

		var_0_11(arg_16_0, arg_16_1, var_16_37)
	end

	var_0_10(arg_16_0)
	arg_16_0.StoreEmpty:registerEventHandler("categoryTimerUpdate", function(arg_57_0, arg_57_1)
		var_0_9(arg_16_0)
	end)

	local var_16_38 = var_16_34.layoutType
	local var_16_39 = var_16_8(var_16_38)

	QUARTERMASTER.RecordStoreEnterEvent(arg_16_1, var_16_38, arg_16_0.recommendationData)
	var_16_30(var_16_38)

	if var_16_39.storeCustomizations then
		var_16_9(var_16_39.storeCustomizations.pre, var_16_35, var_16_39)
	end

	for iter_16_1 = 1, #var_16_35 do
		local var_16_40 = var_16_35[iter_16_1]

		var_16_40.categoryIndex = iter_16_1

		if var_16_40.name then
			local var_16_41 = var_16_31(var_16_40.layoutType or var_16_38, var_16_40)

			var_16_29(var_16_41, var_16_40.layoutType or var_16_38, var_16_39.categoryButton, var_16_40)
			var_16_9(var_16_39.categoryButton.buttonCustomizations, var_16_40, var_16_39, {
				categoryButton = var_16_41
			})
			var_16_41:addEventHandler("button_over", function(arg_58_0, arg_58_1)
				arg_16_0._currentButton = arg_58_0
				arg_16_0._categoryIndex = iter_16_1
			end)
		end
	end

	if var_16_39.storeCustomizations then
		var_16_9(var_16_39.storeCustomizations.post, var_16_35, var_16_39, {
			buttonToFocus = arg_16_2.buttonToFocus
		})
	end

	arg_16_0.BillboardGrid:SetNumRows(1)
	arg_16_0.BillboardGrid:SetNumColumns(0)

	local var_16_42 = LUI.UITimer.new({
		interval = 1000,
		event = "categoryTimerUpdate"
	})

	var_16_42.id = "timer"

	arg_16_0:addElement(var_16_42)

	local var_16_43 = LUI.UITimer.new({
		event = "autoScrollTimerUpdate",
		interval = var_0_6
	})

	var_16_43.id = "autoScrollTimer"

	arg_16_0:addElement(var_16_43)

	arg_16_0._autoScrollEnabled = true

	arg_16_0:registerEventHandler("autoScrollTimerUpdate", function(arg_59_0, arg_59_1)
		if arg_16_0.ChangeSelection and arg_16_0._autoScrollEnabled then
			arg_16_0.ChangeSelection(arg_16_0._scrollDirection.RIGHT, false)
		end
	end)

	arg_16_0._autoScrollEnabledTimerHolder = LUI.UIElement.new()

	arg_16_0:addElement(arg_16_0._autoScrollEnabledTimerHolder)

	function arg_16_0.DisableAutoScrollTimer()
		arg_16_0._autoScrollEnabled = false
		arg_16_0._autoScrollEnabledTimerHolder:Wait(Dvar.CFHDGABACF("NLONMPSRPP"), true).onComplete = function()
			arg_16_0._autoScrollEnabled = true
		end
	end

	arg_16_0.bindButton:addEventHandler("button_left_stick", function(arg_62_0, arg_62_1)
		if Dvar.IBEGCHEFE("OLNMSNSTKS") then
			LUI.FlowManager.RequestPopupMenu(arg_16_0, "CreatorCodePopup", true, arg_16_1, false)
		end
	end)
	arg_16_0.bindButton:addEventHandler("button_alt1", function(arg_63_0, arg_63_1)
		arg_16_0._startPurchaseImmediately = true

		arg_16_0.BillboardCategoryButtonAction(arg_16_0._currentButton, arg_63_1, arg_16_0._allCategoryData[arg_16_0._categoryIndex], var_16_39)
	end)
	arg_16_0:addEventHandler("gamepad_button", function(arg_64_0, arg_64_1)
		if arg_64_1.controller ~= arg_16_1 and (arg_64_1.button == "primary" or arg_64_1.button == "alt1" or arg_64_1.button == "left_trigger" or arg_64_1.button == "right_trigger" or arg_64_1.button == "left" or arg_64_1.button == "right") then
			return true
		end
	end)
end

function MPStoreBillboardList(arg_65_0, arg_65_1)
	local var_65_0 = LUI.UIElement.new()

	var_65_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_65_0.id = "MPStoreBillboardList"

	local var_65_1 = arg_65_1 and arg_65_1.controllerIndex

	if not var_65_1 and not Engine.DDJFBBJAIG() then
		var_65_1 = var_65_0:getRootController()
	end

	assert(var_65_1)

	local var_65_2 = var_65_0
	local var_65_3
	local var_65_4 = LUI.UIImage.new()

	var_65_4.id = "Background"

	var_65_4:SetRGBFromInt(0, 0)
	var_65_4:SetAlpha(0.9, 0)
	var_65_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_65_0:addElement(var_65_4)

	var_65_0.Background = var_65_4

	local var_65_5
	local var_65_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_65_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("StoreBillboardItem", {
				controllerIndex = var_65_1
			})
		end,
		refreshChild = function(arg_67_0, arg_67_1, arg_67_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1920,
		rowHeight = _1080p * 580,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_65_7 = LUI.UIGrid.new(var_65_6)

	var_65_7.id = "BillboardGrid"

	var_65_7:SetAlpha(0, 0)
	var_65_7:setUseStencil(true)
	var_65_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -290, _1080p * 290)
	var_65_0:addElement(var_65_7)

	var_65_0.BillboardGrid = var_65_7

	local var_65_8
	local var_65_9 = LUI.UIImage.new()

	var_65_9.id = "Overlay"

	var_65_9:SetRGBFromInt(0, 0)
	var_65_9:SetAlpha(0.8, 0)
	var_65_9:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_65_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 100, _1080p * 290)
	var_65_0:addElement(var_65_9)

	var_65_0.Overlay = var_65_9

	local var_65_10
	local var_65_11 = MenuBuilder.BuildRegisteredType("BillboardFocusArea", {
		controllerIndex = var_65_1
	})

	var_65_11.id = "BillboardFocusArea"

	var_65_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -290, _1080p * 290)
	var_65_0:addElement(var_65_11)

	var_65_0.BillboardFocusArea = var_65_11

	local var_65_12
	local var_65_13 = MenuBuilder.BuildRegisteredType("BillboardArrows", {
		controllerIndex = var_65_1
	})

	var_65_13.id = "BillboardArrows"

	var_65_13:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -290, _1080p * 290)
	var_65_0:addElement(var_65_13)

	var_65_0.BillboardArrows = var_65_13

	local var_65_14
	local var_65_15 = MenuBuilder.BuildRegisteredType("PipsWithNavigation", {
		controllerIndex = var_65_1
	})

	var_65_15.id = "PipsWithNavigation"

	var_65_15:SetAlpha(0, 0)
	var_65_15:SetScale(0.5, 0)
	var_65_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * 200, _1080p * 232)
	var_65_0:addElement(var_65_15)

	var_65_0.PipsWithNavigation = var_65_15

	local var_65_16
	local var_65_17 = MenuBuilder.BuildRegisteredType("NoMoreItemsMessage", {
		controllerIndex = var_65_1
	})

	var_65_17.id = "NoMoreItemsMessage"

	var_65_17:SetAlpha(0, 0)
	var_65_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -40, _1080p * 40)
	var_65_0:addElement(var_65_17)

	var_65_0.NoMoreItemsMessage = var_65_17

	local var_65_18
	local var_65_19 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_65_1
	})

	var_65_19.id = "StoreEmpty"

	var_65_19:SetAlpha(0, 0)
	var_65_19.Backer:SetRGBFromTable(SWATCHES.Store.NoItemBGAlt, 0)
	var_65_19.Node:SetRGBFromTable(SWATCHES.Store.NoItemTimer, 0)
	var_65_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 246, _1080p * 196, _1080p * 230)
	var_65_0:addElement(var_65_19)

	var_65_0.StoreEmpty = var_65_19

	local var_65_20
	local var_65_21 = LUI.UIImage.new()

	var_65_21.id = "CategoryLine"

	var_65_21:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_65_21:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_65_21:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -700, _1080p * 240, _1080p * 241)
	var_65_0:addElement(var_65_21)

	var_65_0.CategoryLine = var_65_21

	local var_65_22
	local var_65_23 = LUI.UIStyledText.new()

	var_65_23.id = "CategoryText"

	var_65_23:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_65_23:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CATEGORIES")), 0)
	var_65_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_65_23:SetWordWrap(false)
	var_65_23:SetAlignment(LUI.Alignment.Left)
	var_65_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_65_23:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 70, _1080p * 570, _1080p * 209, _1080p * 239)
	var_65_0:addElement(var_65_23)

	var_65_0.CategoryText = var_65_23

	local var_65_24
	local var_65_25 = MenuBuilder.BuildRegisteredType("SupportingCreatorCode", {
		controllerIndex = var_65_1
	})

	var_65_25.id = "SupportingCreatorCode"

	var_65_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1162, _1080p * 1522, _1080p * 172, _1080p * 196)
	var_65_0:addElement(var_65_25)

	var_65_0.SupportingCreatorCode = var_65_25

	var_0_15(var_65_0, var_65_1, arg_65_1)

	return var_65_0
end

MenuBuilder.registerType("MPStoreBillboardList", MPStoreBillboardList)
LockTable(_M)
