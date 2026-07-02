module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0._outfitMissionQuests and #arg_1_0._outfitMissionQuests >= 1)
	arg_1_0.Grid:SetNumChildren(#arg_1_0._outfitMissionQuests)
	arg_1_0.Grid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_2 + 1
		local var_2_1 = arg_1_0._outfitMissionQuests[var_2_0]

		arg_2_0:Setup(arg_1_0, var_2_1, var_2_0)

		if var_2_1 == arg_1_0.Grid.lastMissionFocused then
			arg_2_0:processEvent({
				name = "gain_focus"
			})
		end
	end)

	local var_1_0 = 0
	local var_1_1

	if arg_1_2 then
		local var_1_2 = OPERATOR.GetOutfitChallengeDetailsFromObjective(arg_1_2, arg_1_0._outfitMissionQuests)

		var_1_0 = var_1_2.missionIndex - 1
		var_1_1 = var_1_2.objectiveIndex
	end

	arg_1_0:registerEventHandler("challenges_update_mission_details", function(arg_3_0, arg_3_1)
		if arg_3_1.index and arg_1_0._outfitMissionQuests[arg_3_1.index] then
			arg_3_0._buttonOverIndex = arg_3_1.index
			arg_1_0._outfitMissionQuests[arg_3_1.index].isActive = arg_1_0._isActive

			arg_3_0.MissionDetails:SetData(arg_1_0._outfitMissionQuests[arg_3_1.index], var_1_1)
		end
	end)
	arg_1_0.Grid:addEventHandler("new_mission_focused", function(arg_4_0, arg_4_1)
		if arg_4_0.lastMissionElementFocused and arg_4_0.lastMissionElementFocused ~= arg_4_1.newFocusedElement then
			arg_4_0.lastMissionElementFocused:CustomLoseFocus()
		end

		arg_4_0.lastMissionElementFocused = arg_4_1.newFocusedElement
		arg_4_0.lastMissionFocused = arg_4_1.newFocusedElement._challenge
	end)
	arg_1_0.Grid:SetDefaultFocus({
		x = 0,
		y = var_1_0
	})
	arg_1_0.Grid:SetPosition({
		x = 0,
		y = var_1_0
	}, true)

	arg_1_0._outfitMissionQuests[var_1_0 + 1].isActive = arg_1_0._isActive

	arg_1_0.MissionDetails:SetData(arg_1_0._outfitMissionQuests[var_1_0 + 1], var_1_1)
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"))

	if Engine.DBAEJAHFGJ(arg_5_1) then
		ACTIONS.LeaveMenu(arg_5_0)
		LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_5_1, false)
	end

	arg_5_0._operatorRef = arg_5_2.operatorRef
	arg_5_0._outfitMissionQuests = arg_5_2.outfitMissionQuests
	arg_5_0._isActive = arg_5_2.isActive
	arg_5_0._menuHandlesChallengePress = true

	if not arg_5_0._operatorRef and arg_5_2.skinLootId then
		local var_5_0 = LOOT.GetItemRef(LOOT.itemTypes.OPERATOR_SKIN, arg_5_2.skinLootId)

		assert(var_5_0)

		arg_5_0._operatorRef = OPERATOR.GetSkinOwnerRef(var_5_0)
	end

	assert(arg_5_0._operatorRef)

	if not arg_5_0._outfitMissionQuests and arg_5_0._operatorRef then
		local var_5_1

		if arg_5_2.singleMissionOverride then
			var_5_1 = arg_5_2.challengeID
		end

		arg_5_0._outfitMissionQuests = OPERATOR.GetOutfitMissionQuestsForOperator(arg_5_0._operatorRef, arg_5_1, var_5_1)
	end

	if OPERATOR.IsUnlocked(arg_5_1, arg_5_0._operatorRef) then
		local function var_5_2(arg_6_0, arg_6_1)
			local var_6_0 = arg_5_0._operatorRef
			local var_6_1 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
			local var_6_2 = OPERATOR.GetOperatorSuperFactionRef(var_6_0)

			if var_6_1.operators[var_6_2]:get() ~= var_6_0 then
				Engine.BJDBIAGIDA(SOUND_SETS.default.action)
				var_6_1.operators[var_6_2]:set(var_6_0)

				local var_6_3 = {
					iconScale = -0.3,
					displayTime = 3000,
					icon = "cac_equip_fill",
					iconColor = SWATCHES.genericMenu.notificationHighlight,
					header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
					description = Engine.CBBHFCGDIC(OPERATOR.GetName(var_6_0)),
					type = LUI.ToastManager.NotificationType.OperatorEquipped,
					controllerIndex = arg_5_1
				}

				arg_6_0:dispatchEventToRoot({
					name = "send_toast_notification",
					immediate = true,
					options = var_6_3
				})

				return true
			end

			return false
		end

		arg_5_0:addEventHandler("menu_create", function(arg_7_0, arg_7_1)
			arg_7_0:AddButtonHelperText({
				force_display = true,
				priority = 2,
				side = "left",
				button_ref = "button_primary",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR")
			})
			arg_7_0.bindButton:addEventHandler("button_primary", var_5_2)
		end)
	end

	var_0_0(arg_5_0, arg_5_1, arg_5_2.challengeID)
	ACTIONS.ScaleFullscreen(arg_5_0.Vignette)
	ACTIONS.ScaleFullscreen(arg_5_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
end

function OperatorMissions(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0.id = "OperatorMissions"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Vignette"

	var_8_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_8_4:SetBlendMode(BLEND_MODE.multiply)
	var_8_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_8_0:addElement(var_8_4)

	var_8_0.Vignette = var_8_4

	local var_8_5
	local var_8_6 = {
		worldBlur = 1,
		controllerIndex = var_8_1
	}
	local var_8_7 = MenuBuilder.BuildRegisteredType("WorldBlur", var_8_6)

	var_8_7.id = "WorldBlur"

	var_8_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_8_0:addElement(var_8_7)

	var_8_0.WorldBlur = var_8_7

	local var_8_8
	local var_8_9 = LUI.UIImage.new()

	var_8_9.id = "Darken"

	var_8_9:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_9:SetAlpha(0.5, 0)
	var_8_0:addElement(var_8_9)

	var_8_0.Darken = var_8_9

	local var_8_10
	local var_8_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_8_1
	})

	var_8_11.id = "TabBacker"

	var_8_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_8_0:addElement(var_8_11)

	var_8_0.TabBacker = var_8_11

	local var_8_12
	local var_8_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_13.id = "MenuTitle"

	var_8_13.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"), 0)
	var_8_13.Line:SetLeft(0, 0)
	var_8_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_8_0:addElement(var_8_13)

	var_8_0.MenuTitle = var_8_13

	local var_8_14
	local var_8_15 = {
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
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorMissionItemCondensed", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 68,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_16 = LUI.UIGrid.new(var_8_15)

	var_8_16.id = "Grid"

	var_8_16:setUseStencil(true)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -64, _1080p * -324, _1080p * 406)
	var_8_0:addElement(var_8_16)

	var_8_0.Grid = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetails", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "MissionDetails"

	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -193, _1080p * 807, _1080p * -324, _1080p * 451)
	var_8_0:addElement(var_8_18)

	var_8_0.MissionDetails = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "VerticalMinimalScrollbar"

	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -258, _1080p * -247, _1080p * -324, _1080p * 356)
	var_8_0:addElement(var_8_20)

	var_8_0.VerticalMinimalScrollbar = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "BattlePassSeasonResetStatus"

	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 489, _1080p * 864, _1080p * 52, _1080p * 132)
	var_8_0:addElement(var_8_22)

	var_8_0.BattlePassSeasonResetStatus = var_8_22

	local var_8_23
	local var_8_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_8_1
	})

	var_8_24.id = "LobbyMembersFooter"

	var_8_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_8_0:addElement(var_8_24)

	var_8_0.LobbyMembersFooter = var_8_24

	local var_8_25 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_8_20,
		startCap = var_8_20.startCap,
		endCap = var_8_20.endCap,
		sliderArea = var_8_20.sliderArea,
		slider = var_8_20.sliderArea and var_8_20.sliderArea.slider,
		fixedSizeSlider = var_8_20.sliderArea and var_8_20.sliderArea.fixedSizeSlider
	})

	var_8_16:AddScrollbar(var_8_25)
	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_8_26 = LUI.UIBindButton.new()

	var_8_26.id = "selfBindButton"

	var_8_0:addElement(var_8_26)

	var_8_0.bindButton = var_8_26

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)
	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("OperatorMissions", OperatorMissions)
LockTable(_M)
