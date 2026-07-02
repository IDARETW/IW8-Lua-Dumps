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

	if CONDITIONS.IsMagmaGameMode() then
		arg_2_0.VehicleButtonGrid = arg_2_0.WZVehicleButtonGrid
	end

	arg_2_0._vehicleTable = VEHICLE.GetAllVehicles(arg_2_1)

	arg_2_0.VehicleButtonGrid:SetNumChildren(#arg_2_0._vehicleTable)

	local var_2_0 = arg_2_0.VehicleButtonGrid:GetNumColumns()

	arg_2_0.VehicleButtonGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_2 * var_2_0 + arg_3_1 + 1
		local var_3_1 = arg_2_0._vehicleTable[var_3_0]
		local var_3_2 = VEHICLE.GetEquippedCamo(arg_2_1, var_3_1.ref)

		var_3_1.previewImage = var_3_2.showcaseImage

		local var_3_3 = VEHICLE.IsNewLootByVehicle(arg_2_1, var_3_1.ref, LOOT.itemTypes.VEHICLE_CAMO)
		local var_3_4 = tonumber(var_3_1.hideHornTab) == 0 and VEHICLE.IsNewLootByVehicle(arg_2_1, var_3_1.ref, LOOT.itemTypes.VEHICLE_HORN)
		local var_3_5 = tonumber(var_3_1.hideTrackTab) == 0 and VEHICLE.IsNewLootByVehicle(arg_2_1, var_3_1.ref, LOOT.itemTypes.VEHICLE_TRACK)

		var_3_1.isNew = var_3_3 or var_3_4 or var_3_5

		arg_3_0:SetupVehicleInfo(var_3_1, var_3_2)
	end)
	arg_2_0.VehicleButtonGrid:RefreshContent()

	local var_2_1 = not CONDITIONS.IsMagmaGameMode()
	local var_2_2 = 200
	local var_2_3 = 30 * _1080p
	local var_2_4 = arg_2_0.ItemDesc:GetCurrentAnchorsAndPositions()

	local function var_2_5(arg_4_0)
		local var_4_0 = VEHICLE.GetCategoryName(arg_4_0)
		local var_4_1 = VEHICLE.GetCategoryDesc(arg_4_0)

		arg_2_0.Name:setText(Engine.CBBHFCGDIC(var_4_0))

		if not var_4_1 or var_4_1 == "" then
			ACTIONS.AnimateSequence(arg_2_0, "HideContents")

			return
		end

		ACTIONS.AnimateSequence(arg_2_0, "ShowContents")
		arg_2_0.ItemDesc:setText(Engine.CBBHFCGDIC(var_4_1))

		if not var_2_1 then
			return
		end

		local var_4_2 = LAYOUT.GetTextHeightWithWrapping(arg_2_0.ItemDesc, arg_2_0.ItemDesc:getText())
		local var_4_3 = var_2_4.top + var_4_2 + var_2_3

		arg_2_0.DoubleNotchedBacker:SetBottom(var_4_3, var_2_2)

		if CONDITIONS.IsBattleTracksEnabled() then
			arg_2_0.VehicleEquippedItems:SetTop(var_4_3 + var_2_3, var_2_2)
		end
	end

	arg_2_0:addEventHandler("vehicle_button_over", function(arg_5_0, arg_5_1)
		var_2_5(arg_5_1.vehicleInfo.ref)
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

	local var_2_6 = LUI.FlowManager.GetScopedData(arg_2_0)
	local var_2_7 = var_0_0(arg_2_0, var_2_6.currentVehicleRef)
	local var_2_8 = arg_2_0.VehicleButtonGrid:GetPositionForIndex(var_2_7)

	arg_2_0.VehicleButtonGrid:SetFocusedPosition(var_2_8, true)

	if not Onboarding.VehicleCamos.WasCompleted(arg_2_0, arg_2_1) then
		if CONDITIONS.IsMagmaGameMode() then
			LUI.FlowManager.RequestPopupMenu(arg_2_0, "onboardingpopup", true, arg_2_1, false, ONBOARDING_DATA.GetOnboardingVehicleCamosWZData())
		else
			LUI.FlowManager.RequestPopupMenu(arg_2_0, "onboardingpopup", true, arg_2_1, false, ONBOARDING_DATA.GetOnboardingVehicleCamosData())
		end

		Onboarding.VehicleCamos.MarkCompleted(arg_2_0, arg_2_1)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.Background)
	LAYOUT.SetupScalingBackgroundVignette(arg_2_0)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_2_0, "WZSetup")
	end
end

function VehicleSelect(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "VehicleSelect"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

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

	if CONDITIONS.InFrontend() then
		local var_6_4 = LUI.UIImage.new()

		var_6_4.id = "Background"

		var_6_4:setImage(RegisterMaterial("frontend_vehicle_customization_bg"), 0)
		var_6_0:addElement(var_6_4)

		var_6_0.Background = var_6_4
	end

	local var_6_5

	if CONDITIONS.InGame() then
		local var_6_6 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_6_1
		})

		var_6_6.id = "InGameMenuBackground"

		var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_6_0:addElement(var_6_6)

		var_6_0.InGameMenuBackground = var_6_6
	end

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Vignette"

	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_6_0:addElement(var_6_8)

	var_6_0.Vignette = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "MenuTitle"

	var_6_10.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_SELECT")), 0)
	var_6_10.Line:SetLeft(0, 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_10)

	var_6_0.MenuTitle = var_6_10

	local var_6_11

	if not CONDITIONS.IsMagmaGameMode() then
		local var_6_12 = {
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

		var_6_11 = LUI.UIGrid.new(var_6_12)
		var_6_11.id = "VehicleButtonGrid"

		var_6_11:setUseStencil(true)
		var_6_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1706, _1080p * -268, _1080p * -54)
		var_6_0:addElement(var_6_11)

		var_6_0.VehicleButtonGrid = var_6_11
	end

	local var_6_13

	if CONDITIONS.IsMagmaGameMode() then
		local var_6_14 = {
			scrollingThresholdX = 0,
			buildArrowsLabel = true,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 0,
			wrapX = true,
			maxVisibleColumns = 5,
			maxVisibleRows = 2,
			wrapY = true,
			arrowsVerticalOffset = 0,
			springCoefficient = 400,
			controllerIndex = var_6_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("WZVehicleButton", {
					controllerIndex = var_6_1
				})
			end,
			refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
				return
			end,
			spacingX = _1080p * 5,
			spacingY = _1080p * 5,
			columnWidth = _1080p * 340,
			rowHeight = _1080p * 90,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_6_13 = LUI.UIGrid.new(var_6_14)
		var_6_13.id = "WZVehicleButtonGrid"

		var_6_13:setUseStencil(true)
		var_6_13:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1824, _1080p * -268, _1080p * -54)
		var_6_0:addElement(var_6_13)

		var_6_0.WZVehicleButtonGrid = var_6_13
	end

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "LobbyStatus"

	var_6_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_6_0:addElement(var_6_16)

	var_6_0.LobbyStatus = var_6_16

	local var_6_17
	local var_6_18 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_6_1
	})

	var_6_18.id = "VerticalMinimalScrollbar"

	var_6_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1706, _1080p * 1717, _1080p * -268, _1080p * -96)
	var_6_0:addElement(var_6_18)

	var_6_0.VerticalMinimalScrollbar = var_6_18

	local var_6_19
	local var_6_20 = MenuBuilder.BuildRegisteredType("BattlePassCountDown", {
		controllerIndex = var_6_1
	})

	var_6_20.id = "BattlePassCountDown"

	var_6_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1490, _1080p * 1790, _1080p * 54, _1080p * 134)
	var_6_0:addElement(var_6_20)

	var_6_0.BattlePassCountDown = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIImage.new()

	var_6_22.id = "FullImage"

	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 717, _1080p * 1741, _1080p * 189, _1080p * 769)
	var_6_0:addElement(var_6_22)

	var_6_0.FullImage = var_6_22

	local var_6_23

	if not CONDITIONS.IsMagmaGameMode() then
		var_6_23 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
			controllerIndex = var_6_1
		})
		var_6_23.id = "DoubleNotchedBacker"

		var_6_23:SetAlpha(0.75, 0)
		var_6_23.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
		var_6_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 636, _1080p * 200, _1080p * 310)
		var_6_0:addElement(var_6_23)

		var_6_0.DoubleNotchedBacker = var_6_23
	end

	local var_6_24
	local var_6_25 = LUI.UIText.new()

	var_6_25.id = "Name"

	var_6_25:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_25:setText("", 0)
	var_6_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_25:SetWordWrap(false)
	var_6_25:SetAlignment(LUI.Alignment.Left)
	var_6_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 610, _1080p * 209, _1080p * 259)
	var_6_0:addElement(var_6_25)

	var_6_0.Name = var_6_25

	local var_6_26
	local var_6_27 = LUI.UIStyledText.new()

	var_6_27.id = "ItemDesc"

	var_6_27:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_27:setText("", 0)
	var_6_27:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_27:SetAlignment(LUI.Alignment.Left)
	var_6_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 605, _1080p * 259, _1080p * 281)
	var_6_0:addElement(var_6_27)

	var_6_0.ItemDesc = var_6_27

	local var_6_28

	if CONDITIONS.IsBattleTracksEnabled() then
		var_6_28 = MenuBuilder.BuildRegisteredType("VehicleEquippedItems", {
			controllerIndex = var_6_1
		})
		var_6_28.id = "VehicleEquippedItems"

		var_6_28.EquippedText:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
		var_6_28.Line:SetLeft(0, 0)
		var_6_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 628, _1080p * 369, _1080p * 769)
		var_6_0:addElement(var_6_28)

		var_6_0.VehicleEquippedItems = var_6_28
	end

	local function var_6_29()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_29

	local var_6_30

	if not CONDITIONS.IsMagmaGameMode() then
		local var_6_31 = {}

		var_6_11:RegisterAnimationSequence("WZSetup", var_6_31)
	end

	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 219
		}
	}

	var_6_25:RegisterAnimationSequence("WZSetup", var_6_32)

	local var_6_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 219
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 241
		}
	}

	var_6_27:RegisterAnimationSequence("WZSetup", var_6_33)

	if CONDITIONS.IsBattleTracksEnabled() then
		local var_6_34 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 329
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 729
			}
		}

		var_6_28:RegisterAnimationSequence("WZSetup", var_6_34)
	end

	local function var_6_35()
		if not CONDITIONS.IsMagmaGameMode() then
			var_6_11:AnimateSequence("WZSetup")
		end

		var_6_25:AnimateSequence("WZSetup")
		var_6_27:AnimateSequence("WZSetup")

		if CONDITIONS.IsBattleTracksEnabled() then
			var_6_28:AnimateSequence("WZSetup")
		end
	end

	var_6_0._sequences.WZSetup = var_6_35

	local var_6_36

	if not CONDITIONS.IsMagmaGameMode() then
		local var_6_37 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_23:RegisterAnimationSequence("ShowBacker", var_6_37)
	end

	local function var_6_38()
		if not CONDITIONS.IsMagmaGameMode() then
			var_6_23:AnimateSequence("ShowBacker")
		end
	end

	var_6_0._sequences.ShowBacker = var_6_38

	local var_6_39

	if not CONDITIONS.IsMagmaGameMode() then
		local var_6_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_23:RegisterAnimationSequence("HideBacker", var_6_40)
	end

	local function var_6_41()
		if not CONDITIONS.IsMagmaGameMode() then
			var_6_23:AnimateSequence("HideBacker")
		end
	end

	var_6_0._sequences.HideBacker = var_6_41

	if not CONDITIONS.IsMagmaGameMode() then
		local var_6_42 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_6_18,
			startCap = var_6_18.startCap,
			endCap = var_6_18.endCap,
			sliderArea = var_6_18.sliderArea,
			slider = var_6_18.sliderArea and var_6_18.sliderArea.slider,
			fixedSizeSlider = var_6_18.sliderArea and var_6_18.sliderArea.fixedSizeSlider
		})

		var_6_11:AddScrollbar(var_6_42)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_6_43 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_6_18,
			startCap = var_6_18.startCap,
			endCap = var_6_18.endCap,
			sliderArea = var_6_18.sliderArea,
			slider = var_6_18.sliderArea and var_6_18.sliderArea.slider,
			fixedSizeSlider = var_6_18.sliderArea and var_6_18.sliderArea.fixedSizeSlider
		})

		var_6_13:AddScrollbar(var_6_43)
	end

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

	local var_6_44 = LUI.UIBindButton.new()

	var_6_44.id = "selfBindButton"

	var_6_0:addElement(var_6_44)

	var_6_0.bindButton = var_6_44

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("VehicleSelect", VehicleSelect)
LockTable(_M)
