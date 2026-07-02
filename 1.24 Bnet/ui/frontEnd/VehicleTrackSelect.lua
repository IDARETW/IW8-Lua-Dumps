module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		local var_1_1 = math.random(1, #var_1_0 + 1)

		table.insert(var_1_0, var_1_1, iter_1_1)
	end

	local var_1_2 = 1

	for iter_1_2, iter_1_3 in ipairs(var_1_0) do
		if iter_1_3.lootID > 1 and iter_1_3.isUnlocked then
			arg_1_1.tracks[var_1_2]:set(iter_1_3.index)

			var_1_2 = var_1_2 + 1

			if var_1_2 > 9 then
				break
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 then
		for iter_2_0, iter_2_1 in ipairs(arg_2_0._trackTable) do
			if iter_2_1.ref == arg_2_1 then
				return iter_2_0 - 1
			end
		end
	end

	return 0
end

local function var_0_2(arg_3_0, arg_3_1)
	return function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_3_0._trackTable[arg_4_2 + 1]

		var_4_0.isSelected = var_4_0.ref == arg_3_0._equippedTrackRef
		var_4_0.isUnlocked = LOOT.IsUnlockedWithID(arg_3_1, var_4_0.lootID)
		var_4_0.isChallenge = LOOT.GetTypeForID(var_4_0.lootID) == LOOT.unlockTypes.CHALLENGE

		if not var_4_0.isUnlocked then
			local var_4_1 = BATTLEPASS.GetLootTierMap()[var_4_0.lootID]

			if var_4_1 then
				var_4_0.unlockText = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_4_1)
			end
		end

		arg_4_0:UpdateLootButton(arg_3_1, var_4_0)
	end
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_2.vehicleInfo)
	assert(arg_5_2.lootType)

	local var_5_0 = arg_5_2.vehicleInfo.ref

	arg_5_0.VehicleLootPanel:SetAlpha(0)

	arg_5_0._panelTop = arg_5_0.VehicleLootPanel:GetCurrentAnchorsAndPositions().top
	arg_5_0._trackTable = VEHICLE.GetVehicleTracks(arg_5_1, var_5_0)
	arg_5_0._vehiclePlayerData = VEHICLE.GetPlayerData(arg_5_1, var_5_0)

	local var_5_1 = VEHICLE.GetEquippedCamo(arg_5_1, var_5_0)

	arg_5_0.FullImage:setImage(RegisterMaterial(var_5_1.showcaseImage))

	local var_5_2 = VEHICLE.GetEquippedTrack(arg_5_1, var_5_0)

	arg_5_0._equippedTrackRef = StringTable.DIFCHIGDFB(CSV.vehicleTracks.file, CSV.vehicleTracks.cols.index, var_5_2, CSV.vehicleTracks.cols.ref)

	local var_5_3 = arg_5_0._trackTable and #arg_5_0._trackTable or 0

	arg_5_0.TrackGrid:SetNumChildren(var_5_3)
	arg_5_0.TrackGrid:SetRefreshChild(var_0_2(arg_5_0, arg_5_1))
	arg_5_0.TrackGrid:RefreshContent()
	arg_5_0:addEventHandler("loot_button_over", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_5_0.VehicleLootPanel:SetupDetails(arg_6_1.itemData) + 10

		arg_5_0.VehicleLootPanel:SetAlpha(1)

		arg_5_0._currentTrackRef = arg_6_1.itemData.ref

		if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") and not arg_6_1.itemData.isUnlocked then
			arg_5_0.BundleUpsellButton:SetupUpsellButtonWithKey(arg_5_1, arg_5_0._currentTrackRef)
			arg_5_0.BundleUpsellButton:SetTop(arg_5_0._panelTop + var_6_0)
		else
			arg_5_0.BundleUpsellButton:HideButton()
		end
	end)
	arg_5_0:addEventHandler("loot_button_up", function(arg_7_0, arg_7_1)
		arg_5_0.VehicleLootPanel:StopSound()
	end)

	if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_5_0.BundleUpsellButton:CacheBundleItems(arg_5_1, {
			byRef = true,
			itemType = LOOT.itemTypes.VEHICLE_TRACK
		})
	end

	local var_5_4 = var_0_1(arg_5_0, arg_5_0._equippedTrackRef)
	local var_5_5 = arg_5_0.TrackGrid:GetPositionForIndex(var_5_4)

	arg_5_0.TrackGrid:SetFocusedPosition(var_5_5, true)
	arg_5_0:addEventHandler("loot_button_action", function(arg_8_0, arg_8_1)
		arg_5_0._vehiclePlayerData.tracks[0]:set(arg_8_1.itemData.index)

		if arg_8_1.itemData.index == "1" then
			var_0_0(arg_5_0._trackTable, arg_5_0._vehiclePlayerData)
		elseif arg_8_1.itemData.index == "0" then
			for iter_8_0 = 1, 9 do
				arg_5_0._vehiclePlayerData.tracks[iter_8_0]:set(0)
			end
		end

		arg_5_0._equippedTrackRef = arg_8_1.itemData.ref

		arg_5_0.TrackGrid:RefreshContent()
		arg_5_0.VehicleLootPanel:ShowEquippedAnim(arg_8_1.itemData.isSelected)
		arg_5_0.VehicleLootPanel:SetupDetails(arg_8_1.itemData)
	end)

	arg_5_0._bindButton = LUI.UIBindButton.new()

	arg_5_0:addElement(arg_5_0._bindButton)
	arg_5_0._bindButton:addEventHandler("button_right_stick", function(arg_9_0, arg_9_1)
		local var_9_0 = VEHICLE.GetLootAlias(LOOT.itemTypes.VEHICLE_TRACK, arg_5_0._currentTrackRef)

		arg_5_0.VehicleLootPanel:PreviewHorn(var_9_0)
	end)

	if arg_5_0.BundleUpsellButton then
		arg_5_0.BundleUpsellButton:SetUpsellMenu("VehicleTrackSelect")
	end

	if not Onboarding.BattleTracks.WasCompleted then
		LUI.FlowManager.RequestPopupMenu(arg_5_0, "onboardingpopup", true, arg_5_1, false, ONBOARDING_DATA.GetOnboardingBattleTracksData())
		Onboarding.BattleTracks.MarkCompleted(arg_5_0, arg_5_1)
	end
end

function VehicleTrackSelect(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "VehicleTrackSelect"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "VerticalMinimalScrollbar"

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 604, _1080p * 216, _1080p * 784)
	var_10_0:addElement(var_10_4)

	var_10_0.VerticalMinimalScrollbar = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "FullImage"

	var_10_6:SetScale(0.4, 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1366, _1080p * 2390, _1080p * 301, _1080p * 881)
	var_10_0:addElement(var_10_6)

	var_10_0.FullImage = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "BundleUpsellButton"

	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1084, _1080p * 747, _1080p * 953)
	var_10_0:addElement(var_10_8)

	var_10_0.BundleUpsellButton = var_10_8

	local var_10_9
	local var_10_10 = {
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
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("VehicleLootButton", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 48,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_11 = LUI.UIGrid.new(var_10_10)

	var_10_11.id = "TrackGrid"

	var_10_11:setUseStencil(true)
	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 590, _1080p * 216, _1080p * 784)
	var_10_0:addElement(var_10_11)

	var_10_0.TrackGrid = var_10_11

	local var_10_12
	local var_10_13 = MenuBuilder.BuildRegisteredType("VehicleLootPanel", {
		controllerIndex = var_10_1
	})

	var_10_13.id = "VehicleLootPanel"

	if CONDITIONS.InFrontend(var_10_0) then
		var_10_13.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_QUIP_PREVIEW"), 0)
	end

	var_10_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1161, _1080p * 216, _1080p * 726)
	var_10_0:addElement(var_10_13)

	var_10_0.VehicleLootPanel = var_10_13

	var_10_8:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_10_1
		end

		ACTIONS.AnimateSequenceByElement(var_10_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_10_8:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_10_1
		end

		ACTIONS.AnimateSequenceByElement(var_10_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)

	local var_10_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_10_4,
		startCap = var_10_4.startCap,
		endCap = var_10_4.endCap,
		sliderArea = var_10_4.sliderArea,
		slider = var_10_4.sliderArea and var_10_4.sliderArea.slider,
		fixedSizeSlider = var_10_4.sliderArea and var_10_4.sliderArea.fixedSizeSlider
	})

	var_10_11:AddScrollbar(var_10_14)
	PostLoadFunc(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("VehicleTrackSelect", VehicleTrackSelect)
LockTable(_M)
