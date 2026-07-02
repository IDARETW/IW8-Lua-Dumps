module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		for iter_1_0, iter_1_1 in ipairs(arg_1_0._hornTable) do
			if iter_1_1.ref == arg_1_1 then
				return iter_1_0 - 1
			end
		end
	end

	return 0
end

local function var_0_1(arg_2_0, arg_2_1)
	return function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_2_0._hornTable[arg_3_2 + 1]

		var_3_0.isSelected = var_3_0.ref == arg_2_0._equippedHornRef
		var_3_0.isChallenge = LOOT.GetTypeForID(var_3_0.lootID) == LOOT.unlockTypes.CHALLENGE

		if not CONDITIONS.IsPostSeason() and not var_3_0.isUnlocked then
			local var_3_1 = BATTLEPASS.GetLootTierMap()
			local var_3_2 = var_3_1 and var_3_1[var_3_0.lootID] or nil

			if var_3_2 then
				var_3_0.unlockText = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_3_2)
			end
		end

		arg_3_0:UpdateLootButton(arg_2_1, var_3_0)
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	table.sort(arg_4_0._hornTable, function(arg_5_0, arg_5_1)
		if arg_5_0.ref == "veh_horn_default" or arg_5_1.ref == "veh_horn_default" then
			return arg_5_0.lootID < arg_5_1.lootID
		end

		if arg_5_0.isRandom or arg_5_1.isRandom then
			return arg_5_0.isRandom and not arg_5_1.isRandom
		end

		if arg_5_0.isUnlocked ~= arg_5_1.isUnlocked then
			return arg_5_0.isUnlocked and not arg_5_1.isUnlocked
		end

		if arg_5_0.rarity ~= arg_5_1.rarity then
			return arg_5_0.rarity < arg_5_1.rarity
		end

		local var_5_0 = Engine.CBBHFCGDIC(arg_5_0.name)
		local var_5_1 = Engine.CBBHFCGDIC(arg_5_1.name)

		if var_5_0 ~= var_5_1 then
			return var_5_0 < var_5_1
		end

		return false
	end)
end

function PostLoadFunc(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_2.vehicleInfo)
	assert(arg_6_2.lootType)

	local var_6_0 = arg_6_2.vehicleInfo.ref

	arg_6_0.VehicleLootPanel:SetAlpha(0)

	arg_6_0._hornPanelTop = arg_6_0.VehicleLootPanel:GetCurrentAnchorsAndPositions().top
	arg_6_0._hornTable = VEHICLE.GetVehicleHorns(arg_6_1)

	var_0_2(arg_6_0, arg_6_1)

	arg_6_0._vehiclePlayerData = VEHICLE.GetPlayerData(arg_6_1, var_6_0)

	if RANDOM.IsEnabled(arg_6_1, LOOT.itemTypes.VEHICLE_HORN, {
		vehicleRef = var_6_0
	}) then
		arg_6_0._equippedHornRef = RANDOM.ref
	else
		local var_6_1 = arg_6_0._vehiclePlayerData.horn:get()

		arg_6_0._equippedHornRef = VEHICLE.GetHornData(var_6_1).ref
	end

	local var_6_2 = VEHICLE.GetEquippedCamo(arg_6_1, var_6_0)

	arg_6_0.FullImage:setImage(RegisterMaterial(var_6_2.showcaseImage))

	local var_6_3 = arg_6_0._hornTable and #arg_6_0._hornTable or 0

	arg_6_0.HornGrid:SetNumChildren(var_6_3)
	arg_6_0.HornGrid:SetRefreshChild(var_0_1(arg_6_0, arg_6_1))
	arg_6_0.HornGrid:RefreshContent()
	arg_6_0:addEventHandler("loot_button_over", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_6_0.VehicleLootPanel:SetupDetails(arg_7_1.itemData) + 10

		arg_6_0.VehicleLootPanel:SetAlpha(1)

		arg_6_0._currentHornRef = arg_7_1.itemData.ref

		if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") and not arg_7_1.itemData.isUnlocked then
			arg_6_0.BundleUpsellButton:SetupUpsellButtonWithKey(arg_6_1, arg_6_0._currentHornRef)
			arg_6_0.BundleUpsellButton:SetTop(arg_6_0._hornPanelTop + var_7_0)
		else
			arg_6_0.BundleUpsellButton:HideButton()
		end
	end)

	if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_6_0.BundleUpsellButton:CacheBundleItems(arg_6_1, {
			byRef = true,
			itemType = LOOT.itemTypes.VEHICLE_HORN
		})
	end

	local var_6_4 = var_0_0(arg_6_0, arg_6_0._equippedHornRef)
	local var_6_5 = arg_6_0.HornGrid:GetPositionForIndex(var_6_4)

	arg_6_0.HornGrid:SetFocusedPosition(var_6_5, true)
	arg_6_0:addEventHandler("loot_button_action", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.itemData

		RANDOM.SetEnabled(arg_6_1, LOOT.itemTypes.VEHICLE_HORN, var_8_0.isRandom, {
			vehicleRef = var_6_0
		})

		if not var_8_0.isRandom then
			arg_6_0._vehiclePlayerData.horn:set(var_8_0.index)
		end

		local var_8_1 = {
			iconScale = -0.3,
			displayTime = 1500,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_VEH_HORN"),
			description = Engine.CBBHFCGDIC(var_8_0.name),
			controllerIndex = arg_6_1
		}

		arg_6_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_8_1
		})

		arg_6_0._equippedHornRef = var_8_0.ref

		arg_6_0.HornGrid:RefreshContent()
		arg_6_0.VehicleLootPanel:ShowEquippedAnim(var_8_0.isSelected)
		arg_6_0.VehicleLootPanel:SetupDetails(var_8_0)
	end)

	arg_6_0._bindButton = LUI.UIBindButton.new()

	arg_6_0:addElement(arg_6_0._bindButton)
	arg_6_0._bindButton:addEventHandler("button_right_stick", function(arg_9_0, arg_9_1)
		local var_9_0 = VEHICLE.GetLootAlias(LOOT.itemTypes.VEHICLE_HORN, arg_6_0._currentHornRef, var_6_0)

		arg_6_0.VehicleLootPanel:PreviewHorn(var_9_0)
	end)

	if not Onboarding.VehicleHorn.WasCompleted(arg_6_0, arg_6_1) then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "onboardingpopup", true, arg_6_1, false, ONBOARDING_DATA.GetOnboardingVehicleHornData())
		Onboarding.VehicleHorn.MarkCompleted(arg_6_0, arg_6_1)
	end

	local var_6_6 = Engine.DCJHCAFIIA()
	local var_6_7 = arg_6_0._equippedHornRef

	arg_6_0:addEventHandler("menu_close", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_6_0._equippedHornRef

		METRICS.LootUsageSendDLogEvent(arg_6_0, {
			controllerIndex = arg_6_1,
			startTime = var_6_6,
			previousItemIDs = var_6_7,
			newItemIDs = var_10_0
		})
	end)

	if arg_6_0.BundleUpsellButton then
		arg_6_0.BundleUpsellButton:SetUpsellMenu("VehicleHornSelect")
	end
end

function VehicleHornSelect(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "VehicleHornSelect"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "VerticalMinimalScrollbar"

	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 604, _1080p * 216, _1080p * 784)
	var_11_0:addElement(var_11_4)

	var_11_0.VerticalMinimalScrollbar = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "FullImage"

	var_11_6:SetScale(0.4, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1366, _1080p * 2390, _1080p * 301, _1080p * 881)
	var_11_0:addElement(var_11_6)

	var_11_0.FullImage = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "BundleUpsellButton"

	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1084, _1080p * 747, _1080p * 953)
	var_11_0:addElement(var_11_8)

	var_11_0.BundleUpsellButton = var_11_8

	local var_11_9
	local var_11_10 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 11,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("VehicleLootButton", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 48,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_11 = LUI.UIGrid.new(var_11_10)

	var_11_11.id = "HornGrid"

	var_11_11:setUseStencil(true)
	var_11_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 590, _1080p * 216, _1080p * 784)
	var_11_0:addElement(var_11_11)

	var_11_0.HornGrid = var_11_11

	local var_11_12
	local var_11_13 = MenuBuilder.BuildRegisteredType("VehicleLootPanel", {
		controllerIndex = var_11_1
	})

	var_11_13.id = "VehicleLootPanel"

	if CONDITIONS.InFrontend(var_11_0) then
		var_11_13.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SOUND_PREVIEW"), 0)
	end

	var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1161, _1080p * 216, _1080p * 726)
	var_11_0:addElement(var_11_13)

	var_11_0.VehicleLootPanel = var_11_13

	var_11_8:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		ACTIONS.AnimateSequenceByElement(var_11_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_11_8:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_11_1
		end

		ACTIONS.AnimateSequenceByElement(var_11_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)

	local var_11_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_4,
		startCap = var_11_4.startCap,
		endCap = var_11_4.endCap,
		sliderArea = var_11_4.sliderArea,
		slider = var_11_4.sliderArea and var_11_4.sliderArea.slider,
		fixedSizeSlider = var_11_4.sliderArea and var_11_4.sliderArea.fixedSizeSlider
	})

	var_11_11:AddScrollbar(var_11_14)
	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("VehicleHornSelect", VehicleHornSelect)
LockTable(_M)
