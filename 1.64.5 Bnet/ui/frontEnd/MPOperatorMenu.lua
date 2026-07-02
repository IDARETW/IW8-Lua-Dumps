module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		{
			characterID = FrontEndScene.ClientCharacters.MainMenuWest,
			superFaction = OPERATOR.SuperFaction.WEST
		},
		{
			characterID = FrontEndScene.ClientCharacters.MainMenuEast,
			superFaction = OPERATOR.SuperFaction.EAST
		}
	}
	local var_1_1 = OPERATOR.GetWeaponPosesTable()
	local var_1_2 = {}
	local var_1_3 = PlayerData.BFFBGAJGD(arg_1_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[0].weaponSetups[0].weapon:get()
	local var_1_4 = WEAPON.GetWeaponClass(var_1_3)

	if var_1_1[var_1_4] == nil then
		var_1_3 = LOADOUT.GetDefaultLoadouts(arg_1_1)[5].weapons[1].ref
		var_1_4 = WEAPON.GetWeaponClass(var_1_3)

		assert(var_1_1[var_1_4] ~= nil)
	end

	local var_1_5 = {}
	local var_1_6 = {}
	local var_1_7 = {}
	local var_1_8 = {}

	for iter_1_0 = 1, #var_1_0 do
		local var_1_9 = var_1_0[iter_1_0].characterID
		local var_1_10 = var_1_0[iter_1_0].superFaction
		local var_1_11 = {}
		local var_1_12 = {
			operatorFaction = var_1_10
		}
		local var_1_13 = RANDOM.IsEnabled(arg_1_1, LOOT.itemTypes.OPERATOR, var_1_12)

		if var_1_13 then
			var_1_11 = RANDOM.GetItemData(arg_1_1)
			var_1_11.superfaction = tostring(var_1_10)
			var_1_11.gender = tostring(var_1_11.gender)
		else
			var_1_11 = OPERATOR.GetEquippedOperatorData(arg_1_1, var_1_10)
		end

		var_1_8[var_1_11.ref] = var_1_10

		local var_1_14 = WEAPON.GetWeaponModelNameFromRef(var_1_3, {
			useOperatorOverride = true,
			includeCamos = false,
			includeAttachments = false,
			includeStickers = false
		})

		table.insert(var_1_2, var_1_14)

		local var_1_15 = var_1_1[var_1_4][var_1_11.superfaction][var_1_11.gender]

		if var_1_15 then
			assert(#var_1_15 > 0)

			local var_1_16 = var_1_15[math.random(1, #var_1_15)] or var_1_11.defaultPose

			table.insert(var_1_7, var_1_16)
		else
			table.insert(var_1_7, var_1_11.defaultPose)
		end

		local var_1_17 = arg_1_0.OperatorNametagWest

		if var_1_10 == OPERATOR.SuperFaction.EAST then
			var_1_17 = arg_1_0.OperatorNametagEast
		end

		local var_1_18 = Engine.CBBHFCGDIC(var_1_11.name)

		if var_1_17.Name:getText() ~= var_1_18 then
			var_1_17.Name:setText(ToUpperCase(var_1_18))
		end

		local var_1_19 = 275 * _1080p
		local var_1_20 = LAYOUT.GetTextWidth(var_1_17.Name)
		local var_1_21 = 80 * _1080p

		var_1_19 = var_1_19 > var_1_21 + var_1_20 and var_1_19 or var_1_21 + var_1_20

		if var_1_10 == OPERATOR.SuperFaction.EAST then
			var_1_17:SetRight(var_1_17:GetCurrentAnchorsAndPositions().left + var_1_19)
		else
			var_1_17:SetLeft(var_1_17:GetCurrentAnchorsAndPositions().right - var_1_19)
		end

		local var_1_22
		local var_1_23

		if not var_1_13 then
			var_1_22, var_1_23 = OPERATOR.GetEquippedOperatorSkin(arg_1_1, var_1_10)
		else
			var_1_22 = OPERATOR.proxyBody
			var_1_23 = OPERATOR.proxyHead
		end

		if var_1_22 and var_1_23 and var_1_22 ~= "" and var_1_23 ~= "" then
			table.insert(var_1_5, var_1_22)
			table.insert(var_1_6, var_1_23)
		end
	end

	local var_1_24 = OPERATOR.GetOutfitMissionQuestsForOperators(var_1_8, arg_1_1)

	for iter_1_1, iter_1_2 in pairs(var_1_8) do
		local var_1_25 = var_1_24[iter_1_1] or {}

		table.sort(var_1_25, OPERATOR.OutfitMissionSortFn)

		local var_1_26 = arg_1_0.NearestCompletedWest

		if iter_1_2 == OPERATOR.SuperFaction.EAST then
			var_1_26 = arg_1_0.NearestCompletedEast
		end

		var_1_26:SetMission(var_1_25[1])
	end

	FrontEndScene.RequestHeadModels(var_1_6)
	FrontEndScene.RequestBodyModels(var_1_5)

	local var_1_27, var_1_28 = OPERATOR.GetWeaponDataFromLoadout(arg_1_1)
	local var_1_29 = WEAPON.GetWeaponDetailsFromModel(var_1_28).weaponClass

	if var_1_29 == WEAPON.LAUNCHERClass or var_1_29 == WEAPON.MELEEClass then
		var_1_28 = nil
	end

	local var_1_30 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_1_1)
	local var_1_31 = {
		var_1_30,
		var_1_30
	}

	var_1_31[1] = OPERATOR.ValidateAccessoryModel(var_1_31[1], var_1_5[1])
	var_1_31[2] = OPERATOR.ValidateAccessoryModel(var_1_31[2], var_1_5[2])

	FrontEndScene.RequestWeaponWorldModels({
		var_1_27,
		var_1_28,
		var_1_31[1],
		var_1_31[2]
	})

	for iter_1_3 = 1, #var_1_0 do
		local var_1_32 = var_1_0[iter_1_3].characterID
		local var_1_33 = var_1_5[iter_1_3]
		local var_1_34 = var_1_6[iter_1_3]
		local var_1_35 = var_1_7[iter_1_3]
		local var_1_36 = var_1_31[iter_1_3]

		if var_1_33 and var_1_34 and #var_1_33 > 0 and #var_1_34 > 0 then
			local var_1_37 = {
				showCharacter = true,
				operatorPose = var_1_35,
				element = arg_1_0._operatorNametags[iter_1_3],
				weaponModel = var_1_27,
				secondaryModel = var_1_28,
				accessoryModel = var_1_36
			}

			OPERATOR.UpdateClientCharacter(var_1_32, var_1_33, var_1_34, var_1_37)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("character_tango")
	Engine.EBCGADABJ()

	arg_2_0._operatorNametags = {
		arg_2_0.OperatorNametagEast,
		arg_2_0.OperatorNametagWest
	}

	arg_2_0.OperatorNametagEast:SetNametagAlignmentLeft(true)
	arg_2_0.OperatorNametagWest:SetNametagAlignmentLeft(false)

	local var_2_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_2_1
	})

	var_2_0:SetLimits(-2, 2, -2, 2)
	var_2_0:SetSwayValues(2000, 0.06, 0.1)
	arg_2_0:addElement(var_2_0)
	arg_2_0.NearestCompletedWest:SetMission()
	arg_2_0.NearestCompletedEast:SetMission()
	var_0_0(arg_2_0, arg_2_1)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	arg_2_0.OperatorNametagWest:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller or arg_2_1

		LUI.FlowManager.RequestAddMenu("OperatorSelect", true, var_3_0, false, {
			faction = OPERATOR.SuperFaction.WEST
		})
	end)
	arg_2_0.OperatorNametagEast:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.controller or arg_2_1

		LUI.FlowManager.RequestAddMenu("OperatorSelect", true, var_4_0, false, {
			faction = OPERATOR.SuperFaction.EAST
		})
	end)
	arg_2_0.OperatorNametagWest:SetSuperfactionIndex(OPERATOR.SuperFaction.WEST, arg_2_1)
	arg_2_0.OperatorNametagEast:SetSuperfactionIndex(OPERATOR.SuperFaction.EAST, arg_2_1)

	local function var_2_1(arg_5_0, arg_5_1)
		return arg_5_1 == OPERATOR.GetSelectedOperatorIndex(arg_5_0)
	end

	local function var_2_2(arg_6_0)
		local var_6_0 = 0

		if Engine.JEDFGECDJ() > 1 then
			return LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex"):GetValue(arg_2_1) == arg_6_0
		end

		return true
	end

	local function var_2_3(arg_7_0, arg_7_1)
		local var_7_0
		local var_7_1
		local var_7_2 = arg_7_0

		if Engine.JEDFGECDJ() > 1 then
			var_7_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex"):GetValue(arg_2_1)
		end

		if (arg_7_1 or OPERATOR.GetSelectedOperatorIndex(var_7_2)) == OPERATOR.SuperFaction.WEST then
			var_7_1 = "LUA_MENU/THE_EAST"
			var_7_0 = OPERATOR.SuperFaction.EAST
		else
			var_7_1 = "LUA_MENU/THE_WEST"
			var_7_0 = OPERATOR.SuperFaction.WEST
		end

		OPERATOR.SetSelectedOperatorIndex(var_7_2, var_7_0)
		Lobby.PreloadViewHandsForLocalPlayer(arg_2_1)
		arg_2_0.OperatorNametagEast:UpdateForFavoriteSuperfaction(var_7_0)
		arg_2_0.OperatorNametagWest:UpdateForFavoriteSuperfaction(var_7_0)
		Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

		local var_7_3 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/FAVORITE_SUPERFACTION_SELECTED"),
			description = Engine.CBBHFCGDIC(var_7_1),
			controllerIndex = arg_2_1,
			type = LUI.ToastManager.NotificationType.FavoriteSuperfactionEquipped
		}

		arg_2_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_7_3
		})
	end

	local function var_2_4()
		arg_2_0.OperatorNametagEast:SetupContextualMenu({
			title = Engine.CBBHFCGDIC("LUA_MENU/THE_EAST")
		})
		arg_2_0.OperatorNametagWest:SetupContextualMenu({
			title = Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")
		})

		local var_8_0 = {
			id = "favoriteFaction",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/SET_FAVORITE_OPERATOR_NO_PROMPT"),
			conditionFunction = function(arg_9_0, arg_9_1)
				local var_9_0 = var_2_2(nil, arg_9_1)
				local var_9_1 = var_2_1(arg_9_1, OPERATOR.SuperFaction.EAST)

				return var_9_0 and not var_9_1
			end,
			actionFunction = function()
				var_2_3(arg_2_1, OPERATOR.SuperFaction.WEST)
			end
		}

		arg_2_0.OperatorNametagEast:AddContextualMenuAction(var_8_0)

		local var_8_1 = {
			id = "favoriteFaction",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/SET_FAVORITE_OPERATOR_NO_PROMPT"),
			conditionFunction = function(arg_11_0, arg_11_1)
				local var_11_0 = var_2_2(nil, arg_11_1)
				local var_11_1 = var_2_1(arg_11_1, OPERATOR.SuperFaction.WEST)

				return var_11_0 and not var_11_1
			end,
			actionFunction = function()
				var_2_3(arg_2_1, OPERATOR.SuperFaction.EAST)
			end
		}

		arg_2_0.OperatorNametagWest:AddContextualMenuAction(var_8_1)
	end

	arg_2_0.bindButton = LUI.UIBindButton.new()
	arg_2_0.bindButton.id = "selfBindButton"

	arg_2_0:addElement(arg_2_0.bindButton)
	arg_2_0.bindButton:addEventHandler("button_alt1", function(arg_13_0, arg_13_1)
		if var_2_2(arg_13_1.controller) then
			var_2_3(arg_13_1.controller)
		end
	end)
	arg_2_0.bindButton:addEventHandler("button_left_stick", function(arg_14_0, arg_14_1)
		if Dvar.IBEGCHEFE("MOSNKSLTKM") then
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
			OPERATOR.ClearOperatorBreadcrumbs(arg_14_1.controller)
			arg_2_0.OperatorNametagWest.NewItemSmallIcon:UpdateAlpha(0, 0, true)
			arg_2_0.OperatorNametagEast.NewItemSmallIcon:UpdateAlpha(0, 0, true)
			LOOT.ClearTabBreadcrumb(arg_2_0)
		end
	end)
	arg_2_0:registerEventHandler("setup_operator_characters", function(arg_15_0, arg_15_1)
		var_0_0(arg_15_0, arg_15_1.controller)

		return true
	end)

	local var_2_5 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_2_6()
		local var_16_0 = var_2_5:GetValue(arg_2_1) or Engine.IJEBHJIJF()

		if Engine.JEDFGECDJ() > 1 then
			var_0_0(arg_2_0, var_16_0)
			arg_2_0.OperatorNametagWest:SetSuperfactionIndex(OPERATOR.SuperFaction.WEST, var_16_0)
			arg_2_0.OperatorNametagEast:SetSuperfactionIndex(OPERATOR.SuperFaction.EAST, var_16_0)
		end
	end

	arg_2_0:SubscribeToModel(var_2_5:GetModel(arg_2_1), var_2_6)
	var_2_4(arg_2_0)

	local var_2_7 = OPERATOR.FactionHasNewLoots(arg_2_1, OPERATOR.SuperFaction.WEST)

	arg_2_0.OperatorNametagWest.NewItemSmallIcon:UpdateAlpha(var_2_7 and 1 or 0, 0, true)

	local var_2_8 = OPERATOR.FactionHasNewLoots(arg_2_1, OPERATOR.SuperFaction.EAST)

	arg_2_0.OperatorNametagEast.NewItemSmallIcon:UpdateAlpha(var_2_8 and 1 or 0, 0, true)

	local var_2_9 = LAYOUT.GetElementWidth(arg_2_0.NearestCompletedEast)
	local var_2_10 = arg_2_0.OperatorNametagEast:GetCurrentAnchorsAndPositions().right
	local var_2_11 = arg_2_0.OperatorNametagWest:GetCurrentAnchorsAndPositions().left
	local var_2_12 = 60 * _1080p

	arg_2_0.NearestCompletedEast:SetLeft(var_2_10 + var_2_12)
	arg_2_0.NearestCompletedEast:SetRight(var_2_10 + var_2_9 + var_2_12)
	arg_2_0.NearestCompletedWest:SetRight(var_2_11 - var_2_12)
	arg_2_0.NearestCompletedWest:SetLeft(var_2_11 - var_2_9 - var_2_12)
end

function MPOperatorMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIHorizontalNavigator.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "MPOperatorMenu"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("OperatorNametag", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "OperatorNametagWest"

	var_17_4.Faction:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")), 0)
	var_17_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1374, _1080p * -1059, _1080p * 816, _1080p * 918)
	var_17_0:addElement(var_17_4)

	var_17_0.OperatorNametagWest = var_17_4

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("NearestCompletedOperatorMission", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "NearestCompletedWest"

	var_17_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1824, _1080p * -1384, _1080p * 767, _1080p * 967)
	var_17_0:addElement(var_17_6)

	var_17_0.NearestCompletedWest = var_17_6

	local var_17_7
	local var_17_8 = MenuBuilder.BuildRegisteredType("OperatorNametag", {
		controllerIndex = var_17_1
	})

	var_17_8.id = "OperatorNametagEast"

	var_17_8.Faction:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_EAST")), 0)
	var_17_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1059, _1080p * 1374, _1080p * 816, _1080p * 918)
	var_17_0:addElement(var_17_8)

	var_17_0.OperatorNametagEast = var_17_8

	local var_17_9
	local var_17_10 = MenuBuilder.BuildRegisteredType("NearestCompletedOperatorMission", {
		controllerIndex = var_17_1
	})

	var_17_10.id = "NearestCompletedEast"

	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1384, _1080p * 1824, _1080p * 767, _1080p * 967)
	var_17_0:addElement(var_17_10)

	var_17_0.NearestCompletedEast = var_17_10

	local function var_17_11()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_11

	local var_17_12
	local var_17_13 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_4:RegisterAnimationSequence("MenuOpen", var_17_13)

	local var_17_14 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_8:RegisterAnimationSequence("MenuOpen", var_17_14)

	local function var_17_15()
		var_17_4:AnimateSequence("MenuOpen")
		var_17_8:AnimateSequence("MenuOpen")
	end

	var_17_0._sequences.MenuOpen = var_17_15

	var_0_1(var_17_0, var_17_1, arg_17_1)
	ACTIONS.AnimateSequence(var_17_0, "MenuOpen")

	return var_17_0
end

MenuBuilder.registerType("MPOperatorMenu", MPOperatorMenu)
LockTable(_M)
