module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0._vehicleTable) do
		if iter_1_1.ref == arg_1_1 then
			return iter_1_0 - 1
		end
	end

	return 0
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION"))

	arg_2_0._vehicleTable = VEHICLE.GetAllVehicles(arg_2_1)

	arg_2_0.VehicleButtonGrid:SetNumChildren(#arg_2_0._vehicleTable)

	local var_2_0 = arg_2_0.VehicleButtonGrid:GetNumColumns()

	arg_2_0.VehicleButtonGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_2 * var_2_0 + arg_3_1 + 1
		local var_3_1 = arg_2_0._vehicleTable[var_3_0]
		local var_3_2 = VEHICLE.GetEquippedCamo(arg_2_1, var_3_1.ref)

		if var_3_2.ref ~= VEHICLE.DEFAULT_REF then
			var_3_1.icon = var_3_2.icon
		end

		var_3_1.previewImage = var_3_2.showcaseImage

		local var_3_3 = VEHICLE.IsNewLootByVehicle(arg_2_1, var_3_1.ref, LOOT.itemTypes.VEHICLE_CAMO)
		local var_3_4 = var_3_1.hideHornTab == 0 and VEHICLE.IsNewLootByVehicle(arg_2_1, var_3_1.ref, LOOT.itemTypes.VEHICLE_HORN)
		local var_3_5 = var_3_1.hideTrackTab == 0 and VEHICLE.IsNewLootByVehicle(arg_2_1, var_3_1.ref, LOOT.itemTypes.VEHICLE_TRACK)

		var_3_1.isNew = var_3_3 or var_3_4 or var_3_5

		arg_3_0:SetupVehicleInfo(var_3_1, var_3_2)
	end)
	arg_2_0.VehicleButtonGrid:RefreshContent()

	local var_2_1 = arg_2_0.DoubleNotchedBacker:GetCurrentAnchorsAndPositions()

	local function var_2_2(arg_4_0)
		local var_4_0 = VEHICLE.GetCategoryName(arg_4_0)

		arg_2_0.Name:setText(Engine.CBBHFCGDIC(var_4_0))

		local var_4_1 = VEHICLE.GetCategoryDesc(arg_4_0)

		arg_2_0.ItemDesc:setText(Engine.CBBHFCGDIC(var_4_1))

		local var_4_2 = LAYOUT.GetTextHeightWithWrapping(arg_2_0.ItemDesc, arg_2_0.ItemDesc:getText())

		arg_2_0.DoubleNotchedBacker:SetBottom(var_2_1.bottom + var_4_2, 200)

		if CONDITIONS.IsBattleTracksEnabled() then
			arg_2_0.VehicleEquippedItems:SetTop(var_2_1.bottom + var_4_2 + 10, 200)
		end
	end

	arg_2_0:addEventHandler("vehicle_button_over", function(arg_5_0, arg_5_1)
		var_2_2(arg_5_1.vehicleInfo.ref)
		arg_2_0.FullImage:setImage(RegisterMaterial(arg_5_1.equippedCamoInfo.showcaseImage))

		if CONDITIONS.IsBattleTracksEnabled() then
			if arg_5_1.vehicleInfo.isLocked then
				arg_2_0.VehicleEquippedItems:SetAlpha(0)
			else
				arg_2_0.VehicleEquippedItems:SetAlpha(1)
				arg_2_0.VehicleEquippedItems:SetupEquippedItems(arg_2_1, arg_5_1.vehicleInfo)
			end
		end
	end)

	local var_2_3 = LUI.FlowManager.GetScopedData(arg_2_0)
	local var_2_4 = var_0_0(arg_2_0, var_2_3.currentVehicleRef)
	local var_2_5 = arg_2_0.VehicleButtonGrid:GetPositionForIndex(var_2_4)

	arg_2_0.VehicleButtonGrid:SetFocusedPosition(var_2_5, true)

	if not Onboarding.VehicleCamos.WasCompleted(arg_2_0, arg_2_1) then
		LUI.FlowManager.RequestPopupMenu(arg_2_0, "onboardingpopup", true, arg_2_1, false, ONBOARDING_DATA.GetOnboardingVehicleCamosData())
		Onboarding.VehicleCamos.MarkCompleted(arg_2_0, arg_2_1)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.Background)
end

function VehicleSelect(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "VehicleSelect"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_4 = LUI.UIImage.new()

		var_6_4.id = "Background"

		var_6_4:setImage(RegisterMaterial("frontend_vehicle_customization_bg"), 0)
		var_6_0:addElement(var_6_4)

		var_6_0.Background = var_6_4
	end

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "MenuTitle"

	var_6_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_SELECT")), 0)
	var_6_6.Line:SetLeft(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_6)

	var_6_0.MenuTitle = var_6_6

	local var_6_7

	if CONDITIONS.InGame(var_6_0) then
		local var_6_8 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_6_1
		})

		var_6_8.id = "InGameMenuBackground"

		var_6_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_6_0:addElement(var_6_8)

		var_6_0.InGameMenuBackground = var_6_8
	end

	local var_6_9
	local var_6_10 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("VehicleButton", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 385,
		rowHeight = _1080p * 90,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_11 = LUI.UIGrid.new(var_6_10)

	var_6_11.id = "VehicleButtonGrid"

	var_6_11:setUseStencil(true)
	var_6_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1706, _1080p * -268, _1080p * -54)
	var_6_0:addElement(var_6_11)

	var_6_0.VehicleButtonGrid = var_6_11

	local var_6_12
	local var_6_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_13.id = "LobbyStatus"

	var_6_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_6_0:addElement(var_6_13)

	var_6_0.LobbyStatus = var_6_13

	local var_6_14
	local var_6_15 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_6_1
	})

	var_6_15.id = "VerticalMinimalScrollbar"

	var_6_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1706, _1080p * 1717, _1080p * -268, _1080p * -96)
	var_6_0:addElement(var_6_15)

	var_6_0.VerticalMinimalScrollbar = var_6_15

	local var_6_16
	local var_6_17 = MenuBuilder.BuildRegisteredType("BattlePassCountDown", {
		controllerIndex = var_6_1
	})

	var_6_17.id = "BattlePassCountDown"

	var_6_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1490, _1080p * 1790, _1080p * 54, _1080p * 134)
	var_6_0:addElement(var_6_17)

	var_6_0.BattlePassCountDown = var_6_17

	local var_6_18
	local var_6_19 = LUI.UIImage.new()

	var_6_19.id = "FullImage"

	var_6_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 717, _1080p * 1741, _1080p * 189, _1080p * 769)
	var_6_0:addElement(var_6_19)

	var_6_0.FullImage = var_6_19

	local var_6_20
	local var_6_21 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_21.id = "DoubleNotchedBacker"

	var_6_21:SetAlpha(0.75, 0)
	var_6_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 636, _1080p * 200, _1080p * 310)
	var_6_0:addElement(var_6_21)

	var_6_0.DoubleNotchedBacker = var_6_21

	local var_6_22
	local var_6_23 = LUI.UIText.new()

	var_6_23.id = "Name"

	var_6_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_23:setText("", 0)
	var_6_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_23:SetWordWrap(false)
	var_6_23:SetAlignment(LUI.Alignment.Left)
	var_6_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 610, _1080p * 209, _1080p * 259)
	var_6_0:addElement(var_6_23)

	var_6_0.Name = var_6_23

	local var_6_24
	local var_6_25 = LUI.UIStyledText.new()

	var_6_25.id = "ItemDesc"

	var_6_25:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_25:setText("", 0)
	var_6_25:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_25:SetAlignment(LUI.Alignment.Left)
	var_6_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 605, _1080p * 259, _1080p * 281)
	var_6_0:addElement(var_6_25)

	var_6_0.ItemDesc = var_6_25

	local var_6_26

	if CONDITIONS.IsBattleTracksEnabled(var_6_0) then
		local var_6_27 = MenuBuilder.BuildRegisteredType("VehicleEquippedItems", {
			controllerIndex = var_6_1
		})

		var_6_27.id = "VehicleEquippedItems"

		var_6_27.EquippedText:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
		var_6_27.Line:SetLeft(0, 0)
		var_6_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 628, _1080p * 369, _1080p * 769)
		var_6_0:addElement(var_6_27)

		var_6_0.VehicleEquippedItems = var_6_27
	end

	local var_6_28 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_6_15,
		startCap = var_6_15.startCap,
		endCap = var_6_15.endCap,
		sliderArea = var_6_15.sliderArea,
		slider = var_6_15.sliderArea and var_6_15.sliderArea.slider,
		fixedSizeSlider = var_6_15.sliderArea and var_6_15.sliderArea.fixedSizeSlider
	})

	var_6_11:AddScrollbar(var_6_28)
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_6_29 = LUI.UIBindButton.new()

	var_6_29.id = "selfBindButton"

	var_6_0:addElement(var_6_29)

	var_6_0.bindButton = var_6_29

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("VehicleSelect", VehicleSelect)
LockTable(_M)
