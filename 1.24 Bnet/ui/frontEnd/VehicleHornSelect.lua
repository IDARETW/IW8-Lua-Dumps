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
		var_3_0.isUnlocked = LOOT.IsUnlockedWithID(arg_2_1, var_3_0.lootID)
		var_3_0.isChallenge = LOOT.GetTypeForID(var_3_0.lootID) == LOOT.unlockTypes.CHALLENGE

		if not var_3_0.isUnlocked then
			local var_3_1 = BATTLEPASS.GetLootTierMap()[var_3_0.lootID]

			if var_3_1 then
				var_3_0.unlockText = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_3_1)
			end
		end

		arg_3_0:UpdateLootButton(arg_2_1, var_3_0)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2.vehicleInfo)
	assert(arg_4_2.lootType)

	local var_4_0 = arg_4_2.vehicleInfo.ref

	arg_4_0.VehicleLootPanel:SetAlpha(0)

	arg_4_0._hornPanelTop = arg_4_0.VehicleLootPanel:GetCurrentAnchorsAndPositions().top
	arg_4_0._hornTable = VEHICLE.GetVehicleHorns()
	arg_4_0._vehiclePlayerData = VEHICLE.GetPlayerData(arg_4_1, var_4_0)

	local var_4_1 = arg_4_0._vehiclePlayerData.horn:get()

	arg_4_0._equippedHornRef = VEHICLE.GetHornData(var_4_1).ref

	local var_4_2 = VEHICLE.GetEquippedCamo(arg_4_1, var_4_0)

	arg_4_0.FullImage:setImage(RegisterMaterial(var_4_2.showcaseImage))

	local var_4_3 = arg_4_0._hornTable and #arg_4_0._hornTable or 0

	arg_4_0.HornGrid:SetNumChildren(var_4_3)
	arg_4_0.HornGrid:SetRefreshChild(var_0_1(arg_4_0, arg_4_1))
	arg_4_0.HornGrid:RefreshContent()
	arg_4_0:addEventHandler("loot_button_over", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_4_0.VehicleLootPanel:SetupDetails(arg_5_1.itemData) + 10

		arg_4_0.VehicleLootPanel:SetAlpha(1)

		arg_4_0._currentHornRef = arg_5_1.itemData.ref

		if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") and not arg_5_1.itemData.isUnlocked then
			arg_4_0.BundleUpsellButton:SetupUpsellButtonWithKey(arg_4_1, arg_4_0._currentHornRef)
			arg_4_0.BundleUpsellButton:SetTop(arg_4_0._hornPanelTop + var_5_0)
		else
			arg_4_0.BundleUpsellButton:HideButton()
		end
	end)

	if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_4_0.BundleUpsellButton:CacheBundleItems(arg_4_1, {
			byRef = true,
			itemType = LOOT.itemTypes.VEHICLE_HORN
		})
	end

	local var_4_4 = var_0_0(arg_4_0, arg_4_0._equippedHornRef)
	local var_4_5 = arg_4_0.HornGrid:GetPositionForIndex(var_4_4)

	arg_4_0.HornGrid:SetFocusedPosition(var_4_5, true)
	arg_4_0:addEventHandler("loot_button_action", function(arg_6_0, arg_6_1)
		arg_4_0._vehiclePlayerData.horn:set(arg_6_1.itemData.index)

		arg_4_0._equippedHornRef = arg_6_1.itemData.ref

		arg_4_0.HornGrid:RefreshContent()
		arg_4_0.VehicleLootPanel:ShowEquippedAnim(arg_6_1.itemData.isSelected)
		arg_4_0.VehicleLootPanel:SetupDetails(arg_6_1.itemData)
	end)

	arg_4_0._bindButton = LUI.UIBindButton.new()

	arg_4_0:addElement(arg_4_0._bindButton)
	arg_4_0._bindButton:addEventHandler("button_right_stick", function(arg_7_0, arg_7_1)
		local var_7_0 = VEHICLE.GetLootAlias(LOOT.itemTypes.VEHICLE_HORN, arg_4_0._currentHornRef, var_4_0)

		arg_4_0.VehicleLootPanel:PreviewHorn(var_7_0)
	end)

	if not Onboarding.VehicleHorn.WasCompleted(arg_4_0, arg_4_1) then
		LUI.FlowManager.RequestPopupMenu(arg_4_0, "onboardingpopup", true, arg_4_1, false, ONBOARDING_DATA.GetOnboardingVehicleHornData())
		Onboarding.VehicleHorn.MarkCompleted(arg_4_0, arg_4_1)
	end

	if arg_4_0.BundleUpsellButton then
		arg_4_0.BundleUpsellButton:SetUpsellMenu("VehicleHornSelect")
	end
end

function VehicleHornSelect(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0.id = "VehicleHornSelect"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "VerticalMinimalScrollbar"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 604, _1080p * 216, _1080p * 784)
	var_8_0:addElement(var_8_4)

	var_8_0.VerticalMinimalScrollbar = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "FullImage"

	var_8_6:SetScale(0.4, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1366, _1080p * 2390, _1080p * 301, _1080p * 881)
	var_8_0:addElement(var_8_6)

	var_8_0.FullImage = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "BundleUpsellButton"

	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1084, _1080p * 747, _1080p * 953)
	var_8_0:addElement(var_8_8)

	var_8_0.BundleUpsellButton = var_8_8

	local var_8_9
	local var_8_10 = {
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
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("VehicleLootButton", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 48,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_11 = LUI.UIGrid.new(var_8_10)

	var_8_11.id = "HornGrid"

	var_8_11:setUseStencil(true)
	var_8_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 590, _1080p * 216, _1080p * 784)
	var_8_0:addElement(var_8_11)

	var_8_0.HornGrid = var_8_11

	local var_8_12
	local var_8_13 = MenuBuilder.BuildRegisteredType("VehicleLootPanel", {
		controllerIndex = var_8_1
	})

	var_8_13.id = "VehicleLootPanel"

	if CONDITIONS.InFrontend(var_8_0) then
		var_8_13.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SOUND_PREVIEW"), 0)
	end

	var_8_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1161, _1080p * 216, _1080p * 726)
	var_8_0:addElement(var_8_13)

	var_8_0.VehicleLootPanel = var_8_13

	var_8_8:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_8_1
		end

		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_8_8:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_8_1
		end

		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)

	local var_8_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_8_4,
		startCap = var_8_4.startCap,
		endCap = var_8_4.endCap,
		sliderArea = var_8_4.sliderArea,
		slider = var_8_4.sliderArea and var_8_4.sliderArea.slider,
		fixedSizeSlider = var_8_4.sliderArea and var_8_4.sliderArea.fixedSizeSlider
	})

	var_8_11:AddScrollbar(var_8_14)
	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("VehicleHornSelect", VehicleHornSelect)
LockTable(_M)
