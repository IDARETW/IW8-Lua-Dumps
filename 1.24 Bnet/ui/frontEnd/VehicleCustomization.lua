module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.CustomizationTabs:GetTabAtIndex(arg_1_1)

	if not var_1_0:IsEnabled() then
		return
	end

	local var_1_1 = arg_1_0._tabsData[arg_1_1].lootType
	local var_1_2 = VEHICLE.IsNewLootByVehicle(arg_1_0._controllerIndex, arg_1_0._vehicleInfo.ref, var_1_1)

	if var_1_0.NewItemSmallIcon then
		var_1_0.NewItemSmallIcon:UpdateAlpha(var_1_2 and 1 or 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._tabsData = {}
	arg_2_0._tabsData[#arg_2_0._tabsData + 1] = {
		hasDefaultFocus = true,
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SKINS")),
		lootType = LOOT.itemTypes.VEHICLE_CAMO
	}

	local var_2_0 = arg_2_0._vehicleInfo.hideHornTab and arg_2_0._vehicleInfo.hideHornTab == 0

	if CONDITIONS.IsVehicleHornsEnabled() and var_2_0 then
		arg_2_0._tabsData[#arg_2_0._tabsData + 1] = {
			hasDefaultFocus = false,
			name = ToUpperCase(Engine.CBBHFCGDIC("VEHICLES/HORNS")),
			lootType = LOOT.itemTypes.VEHICLE_HORN
		}
	end

	local var_2_1 = arg_2_0._vehicleInfo.hideTrackTab and arg_2_0._vehicleInfo.hideTrackTab == 0

	if CONDITIONS.IsBattleTracksEnabled() and var_2_1 then
		arg_2_0._tabsData[#arg_2_0._tabsData + 1] = {
			hasDefaultFocus = false,
			name = ToUpperCase(Engine.CBBHFCGDIC("VEHICLES/BATTLE_TRACKS")),
			lootType = LOOT.itemTypes.VEHICLE_TRACK
		}
	end

	if #arg_2_0._tabsData > 1 then
		local var_2_2 = {}

		for iter_2_0, iter_2_1 in pairs(arg_2_0._tabsData) do
			local var_2_3 = {
				name = iter_2_1.name,
				hasDefaultFocus = iter_2_1.hasDefaultFocus,
				focusFunction = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
					if arg_2_0.activeTabWidget then
						if arg_2_0.activeTabWidget.VehicleLootPanel then
							arg_2_0.activeTabWidget.VehicleLootPanel:StopSound()
						end

						arg_2_0.activeTabWidget:closeTree()

						arg_2_0.activeTabWidget = nil
					end

					local var_3_0 = {
						controllerIndex = arg_3_1,
						vehicleInfo = arg_2_0._vehicleInfo,
						lootType = iter_2_1.lootType
					}

					if iter_2_1.lootType == LOOT.itemTypes.VEHICLE_CAMO then
						arg_2_0.activeTabWidget = MenuBuilder.BuildRegisteredType("VehicleCamoSelect", var_3_0)

						arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
							gamepad_only = true,
							button_ref = "button_r3",
							side = "left",
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_CAMO")
						})
						arg_2_0.HelperBar:AddButtonHelperTextToElement(arg_2_0, {
							kbm_only = true,
							priority = 4,
							side = "left",
							button_ref = "button_alt2",
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
						})
					elseif iter_2_1.lootType == LOOT.itemTypes.VEHICLE_HORN then
						arg_2_0.activeTabWidget = MenuBuilder.BuildRegisteredType("VehicleHornSelect", var_3_0)

						arg_2_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_r3"
						})
						arg_2_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_alt2"
						})
					elseif iter_2_1.lootType == LOOT.itemTypes.VEHICLE_TRACK then
						arg_2_0.activeTabWidget = MenuBuilder.BuildRegisteredType("VehicleTrackSelect", var_3_0)

						arg_2_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_r3"
						})
						arg_2_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_alt2"
						})
					else
						assert(false)
					end

					arg_2_0:addElement(arg_2_0.activeTabWidget)

					if arg_3_3 ~= FocusType.MouseOver and arg_3_3 ~= FocusType.MenuFlow then
						arg_2_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end
				end
			}

			table.insert(var_2_2, var_2_3)
		end

		arg_2_0.CustomizationTabs:SetTabs(var_2_2)
		arg_2_0.CustomizationTabs:SizeTabsToFit()

		local var_2_4 = #arg_2_0._tabsData

		for iter_2_2 = 1, var_2_4 do
			var_0_0(arg_2_0, iter_2_2)
		end

		arg_2_0:addEventHandler("loot_button_up", function(arg_4_0, arg_4_1)
			local var_4_0 = #arg_2_0._tabsData

			for iter_4_0 = 1, var_4_0 do
				if arg_4_1.itemData and arg_4_1.itemData.lootType == arg_2_0._tabsData[iter_4_0].lootType then
					var_0_0(arg_2_0, iter_4_0)
				end
			end
		end)
	else
		if arg_2_0.CustomizationTabs then
			arg_2_0.CustomizationTabs:closeTree()

			arg_2_0.CustomizationTabs = nil
		end

		local var_2_5 = {
			controllerIndex = arg_2_1,
			vehicleInfo = arg_2_0._vehicleInfo,
			lootType = LOOT.itemTypes.VEHICLE_CAMO
		}
		local var_2_6 = MenuBuilder.BuildRegisteredType("VehicleCamoSelect", var_2_5)

		arg_2_0:addElement(var_2_6)
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			gamepad_only = true,
			button_ref = "button_r3",
			side = "left",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_CAMO")
		})
		arg_2_0.HelperBar:AddButtonHelperTextToElement(arg_2_0, {
			kbm_only = true,
			priority = 4,
			side = "left",
			button_ref = "button_alt2",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
		})
	end
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_2.vehicleInfo)

	local var_5_0 = Engine.CBBHFCGDIC("VEHICLES/CUSTOMIZE_NAME", arg_5_2.vehicleInfo.name)

	arg_5_0.MenuTitle:SetTitle(var_5_0)

	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._vehicleInfo = arg_5_2.vehicleInfo

	var_0_1(arg_5_0, arg_5_1)
	LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.Background)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.TabBacker)
end

function VehicleCustomization(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "VehicleCustomization"

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

	if CONDITIONS.InGame(var_6_0) then
		local var_6_6 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_6_1
		})

		var_6_6.id = "InGameMenuBackground"

		var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_6_0:addElement(var_6_6)

		var_6_0.InGameMenuBackground = var_6_6
	end

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "TabBacker"

	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_6_0:addElement(var_6_8)

	var_6_0.TabBacker = var_6_8

	local var_6_9
	local var_6_10 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_6_1
			})
		end,
		controllerIndex = var_6_1
	}
	local var_6_11 = LUI.TabManager.new(var_6_10)

	var_6_11.id = "CustomizationTabs"

	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 589, _1080p * 108, _1080p * 160)
	var_6_0:addElement(var_6_11)

	var_6_0.CustomizationTabs = var_6_11

	local var_6_12
	local var_6_13 = MenuBuilder.BuildRegisteredType("BattlePassCountDown", {
		controllerIndex = var_6_1
	})

	var_6_13.id = "BattlePassCountDown"

	var_6_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1490, _1080p * 1790, _1080p * 54, _1080p * 134)
	var_6_0:addElement(var_6_13)

	var_6_0.BattlePassCountDown = var_6_13

	local var_6_14

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_6_1
		})

		var_6_15.id = "LobbyMembersFooter"

		var_6_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_6_0:addElement(var_6_15)

		var_6_0.LobbyMembersFooter = var_6_15
	end

	local var_6_16
	local var_6_17 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_17.id = "MenuTitle"

	var_6_17.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CHARM_SELECT_TITLE"), 0)
	var_6_17.Line:SetLeft(0, 0)
	var_6_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_17)

	var_6_0.MenuTitle = var_6_17

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

	local var_6_18 = LUI.UIBindButton.new()

	var_6_18.id = "selfBindButton"

	var_6_0:addElement(var_6_18)

	var_6_0.bindButton = var_6_18

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("VehicleCustomization", VehicleCustomization)
LockTable(_M)
