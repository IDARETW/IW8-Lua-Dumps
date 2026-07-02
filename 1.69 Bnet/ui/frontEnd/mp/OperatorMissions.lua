module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	return function(arg_2_0, arg_2_1)
		local var_2_0 = PlayerData.BFFBGAJGD(arg_1_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
		local var_2_1 = OPERATOR.GetSuperFactionIndexForPlayerData(arg_1_0._operatorRef)

		if var_2_0.operators[var_2_1]:get() ~= arg_1_0._operatorRef then
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			var_2_0.operators[var_2_1]:set(arg_1_0._operatorRef)

			local var_2_2 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
				description = Engine.CBBHFCGDIC(OPERATOR.GetName(arg_1_0._operatorRef)),
				type = LUI.ToastManager.NotificationType.OperatorEquipped,
				controllerIndex = arg_1_1
			}

			arg_2_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_2_2
			})
			arg_1_0:RemoveButtonHelperText("button_primary", "left")

			return true
		end

		return false
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = Challenge.GetInitialMissionID(arg_3_2.id)
	local var_3_1 = Challenge.GetMissionRarity(var_3_0)

	if not arg_3_0._hideBundleUpsellButton and not arg_3_2.isOwned and var_3_1 == LOOT.Rarity.OPERATOR_MISSION then
		local var_3_2 = Challenge.GetMissionItemID(var_3_0)

		arg_3_0.BundleUpsellButton:SetupUpsellButtonWithLootID(arg_3_1, var_3_2)
	else
		arg_3_0.BundleUpsellButton:HideButton()
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0._outfitMissionQuests and #arg_4_0._outfitMissionQuests >= 1)
	arg_4_0.Grid:SetNumChildren(#arg_4_0._outfitMissionQuests)
	arg_4_0.Grid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_5_2 + 1
		local var_5_1 = arg_4_0._outfitMissionQuests[var_5_0]

		arg_5_0:Setup(arg_4_0, var_5_1, var_5_0, arg_4_0._hideBattlePassTierReq)

		if var_5_1 == arg_4_0.Grid.lastMissionFocused then
			arg_5_0:processEvent({
				name = "gain_focus"
			})
		end
	end)

	local var_4_0 = 0
	local var_4_1

	if arg_4_2 then
		local var_4_2 = OPERATOR.GetOutfitChallengeDetailsFromObjective(arg_4_2, arg_4_0._outfitMissionQuests)

		var_4_0 = var_4_2.missionIndex - 1
		var_4_1 = var_4_2.objectiveIndex
	end

	arg_4_0:registerEventHandler("challenges_update_mission_details", function(arg_6_0, arg_6_1)
		local var_6_0 = LUI.FlowManager.GetScopedData("OperatorMissions")

		if var_6_0 then
			var_4_1 = var_6_0.focussedMissionIndex
		end

		if arg_6_1.index and arg_4_0._outfitMissionQuests[arg_6_1.index] then
			arg_6_0._buttonOverIndex = arg_6_1.index
			arg_4_0._outfitMissionQuests[arg_6_1.index].isActive = arg_4_0._isActive

			arg_6_0.MissionDetails:SetData(arg_4_0._outfitMissionQuests[arg_6_1.index], var_4_1, arg_4_0._hideBattlePassTierReq)
			var_0_1(arg_4_0, arg_4_1, arg_4_0._outfitMissionQuests[arg_6_1.index])
		end
	end)
	arg_4_0.Grid:addEventHandler("new_mission_focused", function(arg_7_0, arg_7_1)
		if arg_7_0.lastMissionElementFocused and arg_7_0.lastMissionElementFocused ~= arg_7_1.newFocusedElement then
			arg_7_0.lastMissionElementFocused:CustomLoseFocus()
		end

		arg_7_0.lastMissionElementFocused = arg_7_1.newFocusedElement
		arg_7_0.lastMissionFocused = arg_7_1.newFocusedElement._challenge
	end)
	arg_4_0.Grid:SetDefaultFocus({
		x = 0,
		y = var_4_0
	})
	arg_4_0.Grid:SetPosition({
		x = 0,
		y = var_4_0
	}, true)

	arg_4_0._outfitMissionQuests[var_4_0 + 1].isActive = arg_4_0._isActive

	arg_4_0.MissionDetails:SetData(arg_4_0._outfitMissionQuests[var_4_0 + 1], var_4_1, arg_4_0._hideBattlePassTierReq)
end

local function var_0_3(arg_8_0, arg_8_1)
	local var_8_0 = OPERATOR.IsUnlocked(arg_8_1, arg_8_0._operatorRef)
	local var_8_1 = OPERATOR.GetSuperFactionIndexForPlayerData(arg_8_0._operatorRef)
	local var_8_2 = OPERATOR.GetEquippedOperatorRef(arg_8_1, var_8_1)
	local var_8_3 = not CONDITIONS.IsMagmaGameMode() and not OPERATOR.IsMWOperator(arg_8_0._operatorRef)
	local var_8_4 = var_8_2 ~= arg_8_0._operatorRef

	if not var_8_3 and var_8_0 and var_8_4 then
		arg_8_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
			if not arg_8_0._isActive then
				arg_9_0:AddButtonHelperText({
					force_display = true,
					priority = 2,
					side = "left",
					button_ref = "button_primary",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR")
				})
				arg_9_0.bindButton:addEventHandler("button_primary", var_0_0(arg_8_0, arg_8_1))
			end
		end)
	end
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"))

	if Engine.DBAEJAHFGJ(arg_10_1) then
		ACTIONS.LeaveMenu(arg_10_0)
		LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_10_1, false)
	end

	arg_10_0.menu = arg_10_2.menu
	arg_10_0._operatorRef = arg_10_2.operatorRef
	arg_10_0._outfitMissionQuests = arg_10_2.outfitMissionQuests
	arg_10_0._isActive = arg_10_2.isActive
	arg_10_0._menuHandlesChallengePress = true
	arg_10_0._hideBattlePassTierReq = arg_10_2.hideBattlePassTierReq
	arg_10_0._hideBundleUpsellButton = arg_10_2.hideBundleUpsellButton or false

	if not arg_10_0._operatorRef and arg_10_2.skinLootId then
		local var_10_0 = LOOT.GetItemRef(LOOT.itemTypes.OPERATOR_SKIN, arg_10_2.skinLootId)

		assert(var_10_0)

		arg_10_0._operatorRef = OPERATOR.GetSkinOwnerRef(var_10_0)
	end

	assert(arg_10_0._operatorRef)

	if (not arg_10_0._outfitMissionQuests or #arg_10_0._outfitMissionQuests == 0) and arg_10_0._operatorRef then
		local var_10_1

		if arg_10_2.singleMissionOverride then
			var_10_1 = arg_10_2.challengeID
		end

		arg_10_0._outfitMissionQuests = OPERATOR.GetOutfitMissionQuestsForOperator(arg_10_0._operatorRef, arg_10_1, var_10_1)
	end

	var_0_3(arg_10_0, arg_10_1)
	var_0_2(arg_10_0, arg_10_1, arg_10_2.challengeID)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_2 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_10_0._operatorRef)
		local var_10_3 = LOOT.GetGameSourceIDFromItemID(var_10_2)

		arg_10_0.WZWipSnipeProgressableMessage:UpdateMessage({
			gameSourceID = var_10_3
		})
		ACTIONS.AnimateSequence(arg_10_0.WZWipSnipeProgressableMessage, "Show")
	end

	ACTIONS.ScaleFullscreen(arg_10_0.Vignette)
	ACTIONS.ScaleFullscreen(arg_10_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_10_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_10_0, arg_10_1)
end

function OperatorMissions(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "OperatorMissions"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Vignette"

	var_11_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_11_4:SetBlendMode(BLEND_MODE.multiply)
	var_11_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_11_0:addElement(var_11_4)

	var_11_0.Vignette = var_11_4

	local var_11_5
	local var_11_6 = {
		worldBlur = 1,
		controllerIndex = var_11_1
	}
	local var_11_7 = MenuBuilder.BuildRegisteredType("WorldBlur", var_11_6)

	var_11_7.id = "WorldBlur"

	var_11_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_11_0:addElement(var_11_7)

	var_11_0.WorldBlur = var_11_7

	local var_11_8
	local var_11_9 = LUI.UIImage.new()

	var_11_9.id = "Darken"

	var_11_9:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_9:SetAlpha(0.5, 0)
	var_11_0:addElement(var_11_9)

	var_11_0.Darken = var_11_9

	local var_11_10
	local var_11_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_11_1
	})

	var_11_11.id = "TabBacker"

	var_11_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_11_0:addElement(var_11_11)

	var_11_0.TabBacker = var_11_11

	local var_11_12
	local var_11_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_13.id = "MenuTitle"

	var_11_13.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"), 0)
	var_11_13.Line:SetLeft(0, 0)
	var_11_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_11_0:addElement(var_11_13)

	var_11_0.MenuTitle = var_11_13

	local var_11_14
	local var_11_15 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorMissionItemCondensed", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 68,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_16 = LUI.UIGrid.new(var_11_15)

	var_11_16.id = "Grid"

	var_11_16:setUseStencil(true)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -64, _1080p * -324, _1080p * 403)
	var_11_0:addElement(var_11_16)

	var_11_0.Grid = var_11_16

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetails", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "MissionDetails"

	var_11_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -193, _1080p * 807, _1080p * -324, _1080p * 451)
	var_11_0:addElement(var_11_18)

	var_11_0.MissionDetails = var_11_18

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "VerticalMinimalScrollbar"

	var_11_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -258, _1080p * -247, _1080p * -324, _1080p * 356)
	var_11_0:addElement(var_11_20)

	var_11_0.VerticalMinimalScrollbar = var_11_20

	local var_11_21

	if CONDITIONS.IsBattlePassEnabled() then
		local var_11_22 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			controllerIndex = var_11_1
		})

		var_11_22.id = "BattlePassSeasonResetStatus"

		var_11_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 489, _1080p * 864, _1080p * 52, _1080p * 132)
		var_11_0:addElement(var_11_22)

		var_11_0.BattlePassSeasonResetStatus = var_11_22
	end

	local var_11_23
	local var_11_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_11_1
	})

	var_11_24.id = "LobbyMembersFooter"

	var_11_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_11_0:addElement(var_11_24)

	var_11_0.LobbyMembersFooter = var_11_24

	local var_11_25

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_26 = MenuBuilder.BuildRegisteredType("WZSnipeProgressableMessage", {
			controllerIndex = var_11_1
		})

		var_11_26.id = "WZWipSnipeProgressableMessage"

		var_11_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -193, _1080p * 286, _1080p * -369, _1080p * -340)
		var_11_0:addElement(var_11_26)

		var_11_0.WZWipSnipeProgressableMessage = var_11_26
	end

	local var_11_27
	local var_11_28 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_11_1
	})

	var_11_28.id = "BundleUpsellButton"

	var_11_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 822, _1080p * 1026)
	var_11_0:addElement(var_11_28)

	var_11_0.BundleUpsellButton = var_11_28

	local var_11_29 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_20,
		startCap = var_11_20.startCap,
		endCap = var_11_20.endCap,
		sliderArea = var_11_20.sliderArea,
		slider = var_11_20.sliderArea and var_11_20.sliderArea.slider,
		fixedSizeSlider = var_11_20.sliderArea and var_11_20.sliderArea.fixedSizeSlider
	})

	var_11_16:AddScrollbar(var_11_29)
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_11_30 = LUI.UIBindButton.new()

	var_11_30.id = "selfBindButton"

	var_11_0:addElement(var_11_30)

	var_11_0.bindButton = var_11_30

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("OperatorMissions", OperatorMissions)
LockTable(_M)
