module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		local var_1_1 = math.random(1, #var_1_0 + 1)

		table.insert(var_1_0, var_1_1, iter_1_1)
	end

	arg_1_1.tracks[0]:set(VEHICLE.RANDOM_TRACK_INDEX)

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

		if not CONDITIONS.IsPostSeason() and not var_4_0.isUnlocked then
			local var_4_1 = BATTLEPASS.GetLootTierMap()
			local var_4_2 = var_4_1 and var_4_1[var_4_0.lootID] or nil

			if var_4_2 then
				var_4_0.unlockText = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_4_2)
			end
		end

		arg_4_0:UpdateLootButton(arg_3_1, var_4_0)
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	if arg_5_0._currentPack.name == arg_5_1 then
		ACTIONS.AnimateSequence(arg_5_0.VehicleLootPanel.VehicleTrackList, "FadeOut")

		if arg_5_0._currentTrackShownIndex and arg_5_0._currentTrackShownIndex < #arg_5_0._currentPack.tracks then
			arg_5_0._currentTrackShownIndex = arg_5_0._currentTrackShownIndex + 1
		else
			arg_5_0._currentTrackShownIndex = 1
		end

		local var_5_0 = {
			index = arg_5_0._currentTrackShownIndex,
			total = #arg_5_0._currentPack.tracks,
			songName = VEHICLE.GetTrackName(arg_5_0._currentPack.tracks[arg_5_0._currentTrackShownIndex]),
			packName = arg_5_0._currentPack.name,
			menu = arg_5_0
		}

		arg_5_0:Wait(500).onComplete = function()
			if var_5_0 and arg_5_0._currentPack.name == arg_5_1 then
				arg_5_0.VehicleLootPanel.VehicleTrackList:SetData(var_5_0)
			end
		end
	end
end

local function var_0_4(arg_7_0, arg_7_1)
	table.sort(arg_7_0._trackTable, function(arg_8_0, arg_8_1)
		local var_8_0 = tonumber(arg_8_0.index)
		local var_8_1 = tonumber(arg_8_1.index)

		if var_8_0 == 0 or var_8_1 == 0 or var_8_0 == 1 or var_8_1 == 1 then
			return var_8_0 < var_8_1
		end

		if arg_8_0.isUnlocked ~= arg_8_1.isUnlocked then
			return arg_8_0.isUnlocked and not arg_8_1.isUnlocked
		end

		if arg_8_0.rarity ~= arg_8_1.rarity then
			if arg_8_0.rarity and arg_8_1.rarity then
				return arg_8_0.rarity < arg_8_1.rarity
			else
				return false
			end
		end

		local var_8_2 = Engine.CBBHFCGDIC(arg_8_0.name)
		local var_8_3 = Engine.CBBHFCGDIC(arg_8_1.name)

		if var_8_2 ~= var_8_3 then
			return var_8_2 < var_8_3
		end

		return false
	end)
end

local function var_0_5(arg_9_0)
	local var_9_0 = arg_9_0._currentPack.tracks[1]

	if var_9_0 == "veh_track_none" or var_9_0 == "veh_track_random" then
		return
	end

	local var_9_1 = {
		isVehicleTrackMenu = true,
		lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_TRACK, var_9_0),
		lootType = LOOT.itemTypes.VEHICLE_TRACK,
		menu = arg_9_0
	}

	LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, arg_9_0._controllerIndex, false, var_9_1, nil, false, false)
	Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
end

local function var_0_6(arg_10_0, arg_10_1)
	for iter_10_0 = 0, 9 do
		arg_10_0._vehiclePlayerData.tracks[iter_10_0]:set(0)
	end

	local var_10_0 = arg_10_1

	if var_10_0.isRandom then
		if Dvar.IBEGCHEFE("TQRNTTMSL") then
			RANDOM.SetEnabled(arg_10_0._controllerIndex, LOOT.itemTypes.VEHICLE_TRACK, true, {
				vehicleRef = arg_10_0._vehicleRef
			})
		else
			arg_10_0._vehiclePlayerData.tracks[0]:set(VEHICLE.RANDOM_TRACK_INDEX)
			RANDOM.RollVehicleTrack(arg_10_0._controllerIndex, arg_10_0._vehicleRef)
		end
	else
		if Dvar.IBEGCHEFE("TQRNTTMSL") then
			RANDOM.SetEnabled(arg_10_0._controllerIndex, LOOT.itemTypes.VEHICLE_TRACK, false, {
				vehicleRef = arg_10_0._vehicleRef
			})
		end

		for iter_10_1 = 1, #var_10_0.tracks do
			local var_10_1 = VEHICLE.GetTrackIndex(var_10_0.tracks[iter_10_1])

			arg_10_0._vehiclePlayerData.tracks[iter_10_1 - 1]:set(var_10_1)
		end
	end

	local var_10_2 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = "cac_equip_fill",
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_VEH_TRACK"),
		description = Engine.CBBHFCGDIC(arg_10_1.name),
		controllerIndex = controllerIndex
	}

	arg_10_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_10_2
	})

	arg_10_0._equippedTrackRef = arg_10_1.ref

	arg_10_0.TrackGrid:RefreshContent()
	arg_10_0.VehicleLootPanel:ShowEquippedAnim(arg_10_1.isSelected)
	arg_10_0.VehicleLootPanel:SetupDetails(arg_10_1)
end

local function var_0_7(arg_11_0)
	var_0_6(arg_11_0, arg_11_0._currentPack)
end

function PostLoadFunc(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_2.vehicleInfo)
	assert(arg_12_2.lootType)

	arg_12_0.EquipFocusedPack = var_0_7
	arg_12_0.ShowNextTrack = var_0_3

	local var_12_0 = arg_12_2.vehicleInfo.ref

	arg_12_0._vehicleRef = var_12_0
	arg_12_0._controllerIndex = arg_12_1

	arg_12_0.VehicleLootPanel:SetAlpha(0)

	arg_12_0._panelTop = arg_12_0.VehicleLootPanel:GetCurrentAnchorsAndPositions().top
	arg_12_0._trackTable = VEHICLE.GetVehiclePacks(arg_12_1)

	var_0_4(arg_12_0, arg_12_1)

	arg_12_0._vehiclePlayerData = VEHICLE.GetPlayerData(arg_12_1, var_12_0)

	local var_12_1 = VEHICLE.GetEquippedCamo(arg_12_1, var_12_0)

	arg_12_0.FullImage:setImage(RegisterMaterial(var_12_1.showcaseImage))

	arg_12_0._equippedTrackRef = VEHICLE.GetEquippedTrack(arg_12_1, var_12_0)

	local var_12_2 = arg_12_0._trackTable and #arg_12_0._trackTable or 0

	arg_12_0.TrackGrid:SetNumChildren(var_12_2)
	arg_12_0.TrackGrid:SetRefreshChild(var_0_2(arg_12_0, arg_12_1))
	arg_12_0.TrackGrid:RefreshContent()
	arg_12_0:addEventHandler("loot_button_over", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_12_0.VehicleLootPanel:SetupDetails(arg_13_1.itemData) + 10

		arg_12_0.VehicleLootPanel:SetAlpha(1)

		local var_13_1 = arg_12_0._currentPack

		arg_12_0._currentPack = arg_13_1.itemData
		arg_12_0._currentTrackRef = arg_13_1.itemData.ref

		if var_13_1 ~= arg_13_1.itemData then
			if tonumber(arg_13_1.itemData.index) > 1 then
				arg_12_0._currentTrackShownIndex = nil

				var_0_3(arg_12_0, arg_13_1.itemData.name)
			else
				ACTIONS.AnimateSequence(arg_12_0.VehicleLootPanel.VehicleTrackList, "FadeOut")
			end
		end

		if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") and not arg_13_1.itemData.isUnlocked then
			arg_12_0.BundleUpsellButton:SetupUpsellButtonWithKey(arg_12_1, arg_12_0._currentPack.tracks[1])
			arg_12_0.BundleUpsellButton:SetTop(arg_12_0._panelTop + var_13_0)
		else
			arg_12_0.BundleUpsellButton:HideButton()
		end
	end)
	arg_12_0:addEventHandler("loot_button_up", function(arg_14_0, arg_14_1)
		arg_12_0.VehicleLootPanel:StopSound()

		local var_14_0 = arg_14_1.itemData

		if not var_14_0 then
			return
		end

		for iter_14_0, iter_14_1 in ipairs(var_14_0.tracks) do
			local var_14_1 = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_TRACK, iter_14_1)

			Loot.BCAACADBEA(arg_12_1, var_14_1)
		end
	end)

	if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_12_0.BundleUpsellButton:CacheBundleItems(arg_12_1, {
			byRef = true,
			itemType = LOOT.itemTypes.VEHICLE_TRACK
		})
	end

	local var_12_3 = var_0_1(arg_12_0, arg_12_0._equippedTrackRef)
	local var_12_4 = arg_12_0.TrackGrid:GetPositionForIndex(var_12_3)

	arg_12_0.TrackGrid:SetFocusedPosition(var_12_4, true)
	arg_12_0:addEventHandler("loot_button_action", function(arg_15_0, arg_15_1)
		var_0_6(arg_12_0, arg_15_1.itemData)
	end)

	arg_12_0._bindButton = LUI.UIBindButton.new()

	arg_12_0:addElement(arg_12_0._bindButton)
	arg_12_0._bindButton:addEventHandler("button_right_stick", function(arg_16_0, arg_16_1)
		var_0_5(arg_12_0)
	end)

	if arg_12_0.BundleUpsellButton then
		arg_12_0.BundleUpsellButton:SetUpsellMenu("VehicleTrackSelect")
	end

	if not Onboarding.BattleTracks.WasCompleted then
		LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingBattleTracksData())
		Onboarding.BattleTracks.MarkCompleted(arg_12_0, arg_12_1)
	end

	local var_12_5 = Engine.DCJHCAFIIA()
	local var_12_6 = arg_12_0._equippedTrackRef

	arg_12_0:addEventHandler("menu_close", function(arg_17_0, arg_17_1)
		local var_17_0 = arg_12_0._equippedTrackRef

		METRICS.LootUsageSendDLogEvent(arg_12_0, {
			controllerIndex = arg_12_1,
			startTime = var_12_5,
			previousItemIDs = var_12_6,
			newItemIDs = var_17_0
		})
	end)
end

function VehicleTrackSelect(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "VehicleTrackSelect"

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "VerticalMinimalScrollbar"

	var_18_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 604, _1080p * 216, _1080p * 784)
	var_18_0:addElement(var_18_4)

	var_18_0.VerticalMinimalScrollbar = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "FullImage"

	var_18_6:SetScale(0.4, 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1366, _1080p * 2390, _1080p * 301, _1080p * 881)
	var_18_0:addElement(var_18_6)

	var_18_0.FullImage = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "BundleUpsellButton"

	var_18_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1084, _1080p * 747, _1080p * 953)
	var_18_0:addElement(var_18_8)

	var_18_0.BundleUpsellButton = var_18_8

	local var_18_9
	local var_18_10 = {
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
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("VehicleLootButton", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 48,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_18_11 = LUI.UIGrid.new(var_18_10)

	var_18_11.id = "TrackGrid"

	var_18_11:setUseStencil(true)
	var_18_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 590, _1080p * 216, _1080p * 784)
	var_18_0:addElement(var_18_11)

	var_18_0.TrackGrid = var_18_11

	local var_18_12
	local var_18_13 = MenuBuilder.BuildRegisteredType("VehicleLootPanel", {
		controllerIndex = var_18_1
	})

	var_18_13.id = "VehicleLootPanel"

	if CONDITIONS.InFrontend(var_18_0) then
		var_18_13.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_QUIP_PREVIEW"), 0)
	end

	var_18_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1161, _1080p * 216, _1080p * 726)
	var_18_0:addElement(var_18_13)

	var_18_0.VehicleLootPanel = var_18_13

	var_18_8:addEventHandler("button_over", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_18_1
		end

		ACTIONS.AnimateSequenceByElement(var_18_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_18_8:addEventHandler("button_up", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_18_1
		end

		ACTIONS.AnimateSequenceByElement(var_18_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)

	local var_18_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_18_4,
		startCap = var_18_4.startCap,
		endCap = var_18_4.endCap,
		sliderArea = var_18_4.sliderArea,
		slider = var_18_4.sliderArea and var_18_4.sliderArea.slider,
		fixedSizeSlider = var_18_4.sliderArea and var_18_4.sliderArea.fixedSizeSlider
	})

	var_18_11:AddScrollbar(var_18_14)
	PostLoadFunc(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("VehicleTrackSelect", VehicleTrackSelect)
LockTable(_M)
