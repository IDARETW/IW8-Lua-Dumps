module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.Tabs:GetCurrentTab()

	local function var_1_1(arg_2_0, arg_2_1)
		if arg_2_0.bindEquipOperatorButton then
			arg_2_0:RemoveButtonPrompt({
				helper_text = "",
				button_ref = "button_alt2"
			})
			arg_2_0.bindEquipOperatorButton:closeTree()
		end
	end

	if var_1_0._tabData.index == OPERATOR.OPERATOR_INFO_TAB_DATA.MISSION.index then
		local var_1_2 = LUI.FlowManager.GetScopedData(arg_1_0._menuRef)

		assert(var_1_2, "The current operator scoped data could not be found.")

		local var_1_3 = var_1_2.operatorData.operatorInfo
		local var_1_4 = OPERATOR.IsUnlocked(arg_1_1, var_1_3.ref)

		if not var_1_3.isSelected and var_1_4 then
			arg_1_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt2",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR")
			})

			arg_1_0.bindEquipOperatorButton = LUI.UIBindButton.new()
			arg_1_0.bindEquipOperatorButton.id = "bindEquipOperatorButton"

			arg_1_0:addElement(arg_1_0.bindEquipOperatorButton)

			arg_1_0.bindEquipOperatorButton.data = var_1_3

			arg_1_0.bindEquipOperatorButton:addEventHandler("button_alt2", function(arg_3_0, arg_3_1)
				local var_3_0 = LUI.FlowManager.GetScopedData(arg_1_0:getParent())

				var_3_0.operatorData.operatorInfo.isSelected = false
				var_3_0.operatorData.operatorInfo = var_1_3
				var_3_0.operatorData.useEquippedOperatorFocusIndex = true
				var_3_0.operatorData.useSelectedOperatorIndexForFocus = false

				LUI.FlowManager.ClearSavedMenuStatesByControllerIndex(arg_1_1, "BRMainMenu")
				OPERATOR.EquipOperator(arg_1_0, arg_1_1, {
					selectedOutsideOfGrid = true,
					operatorInfo = var_1_3
				})
				var_1_1(arg_1_0, arg_1_1)
			end)
		end
	else
		var_1_1(arg_1_0, arg_1_1)
	end
end

local function var_0_1(arg_4_0)
	if not arg_4_0._isVanguardOperator then
		return
	end

	local var_4_0 = arg_4_0.Tabs

	if not var_4_0._tabs then
		return
	end

	local var_4_1 = LUI.FlowManager.GetScopedData(arg_4_0).activeTabIndex
	local var_4_2 = var_4_0._tabs[var_4_1 + 1].name

	arg_4_0.WZWipOperatorProgress._cannotPreview = var_4_2 == OPERATOR.OPERATOR_INFO_TAB_DATA.MISSION.name

	ACTIONS.AnimateSequence(arg_4_0, arg_4_0.WZWipOperatorProgress._cannotPreview and "HideProgressionInfo" or "ShowProgressionInfo")
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0._tabs[arg_5_2 + 1]
	local var_5_1 = arg_5_0:getParent()
	local var_5_2 = LUI.FlowManager.GetScopedData(var_5_1)
	local var_5_3 = var_5_0.insertOperator and Engine.CBBHFCGDIC(var_5_1._operatorNameForTitle) or ""

	var_5_1.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_5_0.title, var_5_3))
	TAB.UpdateBuiltWidgetOnTabChange(var_5_1, var_5_2.activeTabIndex, "activeTabWidget", arg_5_2, arg_5_3, var_5_0.menuName, {
		buildPriority = 2,
		controllerIndex = arg_5_1,
		callback = var_5_0.callback,
		scopedData = var_5_2
	})

	var_5_2.activeTabIndex = arg_5_2

	var_0_0(var_5_1, arg_5_1)
	var_0_1(var_5_1)
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_2.operatorInfo)

	local var_6_0 = arg_6_2.operatorInfo
	local var_6_1 = OPERATOR.IsT9Operator(var_6_0.ref) or OPERATOR.IsMWOperator(var_6_0.ref)
	local var_6_2 = false

	if var_6_1 then
		local var_6_3 = var_6_0.outfitMissionQuests

		var_6_2 = OPERATOR.IsUnlocked(arg_6_1, var_6_0.ref) and var_6_3 and #var_6_3 > 0 or false
	end

	if OPERATOR.IsS4Operator(var_6_0.ref) then
		local var_6_4 = var_6_0.challenges

		var_6_2 = OPERATOR.IsUnlocked(arg_6_1, var_6_0.ref) and var_6_4 and #var_6_4 > 0 or false
	end

	return var_6_2
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}
	local var_7_1 = LUI.ShallowCopy(OPERATOR.OPERATOR_INFO_TAB_DATA)
	local var_7_2 = arg_7_2.startTabIndex
	local var_7_3 = 1

	if not arg_7_2.showProgressionTab then
		var_7_1.PROGRESSION = nil

		if not arg_7_2.showMissions then
			var_7_1.MISSION = nil
		end
	end

	if not arg_7_2.showBio then
		var_7_1.BIO = nil
	end

	for iter_7_0, iter_7_1 in pairs(var_7_1) do
		var_7_0[var_7_3] = {
			id = iter_7_1.id,
			menuName = iter_7_1.asset,
			index = iter_7_1.index,
			callback = arg_7_2.operatorSelectCallback,
			name = iter_7_1.name,
			title = iter_7_1.title,
			insertOperator = iter_7_1.insertOperator,
			hasDefaultFocus = iter_7_0 == 1,
			focusFunction = var_0_2
		}
		var_7_3 = var_7_3 + 1
	end

	table.sort(var_7_0, function(arg_8_0, arg_8_1)
		return arg_8_0.index < arg_8_1.index
	end)

	local var_7_4 = 0

	for iter_7_2, iter_7_3 in ipairs(var_7_0) do
		if iter_7_3.index == arg_7_2.startTabIndex then
			var_7_2 = var_7_4

			break
		else
			var_7_4 = var_7_4 + 1
		end
	end

	LUI.FlowManager.GetScopedData(arg_7_0).activeTabIndex = var_7_2

	arg_7_0.Tabs:SetTabs(var_7_0)
	arg_7_0.Tabs:FocusTab(arg_7_1, var_7_2)
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_2.operatorInfo)

	local var_9_0 = var_0_3(arg_9_0, arg_9_1, arg_9_2)
	local var_9_1 = arg_9_0:getParent()
	local var_9_2 = var_9_1.Tabs

	LUI.FlowManager.GetScopedData(var_9_1).operatorData.operatorInfo = arg_9_2.operatorInfo
	var_9_1._operatorNameForTitle = arg_9_2.operatorInfo.name

	local var_9_3 = #var_9_2._tabs

	if not var_9_0 then
		for iter_9_0, iter_9_1 in pairs(var_9_2._tabElements) do
			if iter_9_1._tabData.index == OPERATOR.OPERATOR_INFO_TAB_DATA.MISSION.index then
				LUI.TabManager.RemoveTabAtIndex(var_9_2, iter_9_0)
				LUI.TabManager.UpdateButtonHelperVisibility(var_9_2, arg_9_1, {
					isSingleTab = #var_9_2._tabElements == 1
				})

				break
			end
		end
	end

	local var_9_4 = #var_9_2._tabs

	if var_9_0 and var_9_4 == 1 then
		local var_9_5 = LUI.ShallowCopy(OPERATOR.OPERATOR_INFO_TAB_DATA.MISSION)
		local var_9_6 = {
			hasDefaultFocus = false,
			id = var_9_5.id,
			menuName = var_9_5.asset,
			index = var_9_5.index,
			callback = arg_9_2.operatorSelectCallback,
			name = var_9_5.name,
			title = var_9_5.title,
			insertOperator = var_9_5.insertOperator,
			focusFunction = var_0_2
		}

		table.insert(var_9_2._tabs, var_9_6)

		local var_9_7 = #var_9_2._tabs
		local var_9_8 = LUI.TabManager.AddNewTab(var_9_2, var_9_7 - 1)

		if var_9_8.Setup then
			var_9_8:Setup(var_9_2._tabs[var_9_7])
		end

		LUI.TabManager.UpdateButtonHelperVisibility(var_9_2, arg_9_1)
	end

	var_9_1.activeTabWidget.Grid:RefreshContent()

	if OPERATOR.IsS4Operator(arg_9_2.operatorInfo.ref) then
		var_9_1.WZWipOperatorProgress:SetupProgression(arg_9_2.operatorInfo.ref)
	end
end

local function var_0_6(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_2.operatorInfo)

	local var_10_0 = arg_10_2.operatorInfo
	local var_10_1 = var_0_3(arg_10_0, arg_10_1, arg_10_2)
	local var_10_2 = OPERATOR.IsOperatorBioAvailable(arg_10_0, arg_10_1, {
		operatorRef = var_10_0.ref
	})

	var_0_4(arg_10_0, arg_10_1, {
		showBio = var_10_2,
		showMissions = var_10_1,
		startTabIndex = arg_10_2.startTabIndex or 0,
		operatorSelectCallback = arg_10_0.UpdateTabsIfAvailableMissions
	})
end

local function var_0_7(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:getParent()

	var_11_0.frontendCameraMover:ResetCamera()
	LUI.FlowManager.RequestLeaveMenu(var_11_0, true)
end

local function var_0_8(arg_12_0)
	arg_12_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_12_0 = LUI.UIBindButton.new()

	var_12_0.id = "bindButton"

	arg_12_0:addElement(var_12_0)

	arg_12_0.bindButton = var_12_0

	arg_12_0.bindButton:addEventHandler("button_secondary", var_0_7)
end

local function var_0_9(arg_13_0)
	local var_13_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		useMousePan = false,
		snapToCenter = true,
		enableZoom = true,
		enableHoldZoom = true,
		useLeftStick = false,
		enableWheelZoom = false,
		enableSway = false,
		controllerIndex = arg_13_0._controllerIndex
	})

	var_13_0:SetScreenOrigin(0, 100)
	var_13_0:SetMaxZoom(30)
	var_13_0:SetMinZoom(0)
	var_13_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 500, _1080p * -540, _1080p * 480)
	arg_13_0:addElement(var_13_0)

	arg_13_0.frontendCameraMover = var_13_0

	arg_13_0.frontendCameraMover:SetZoomWheel(30)
end

local function var_0_10(arg_14_0, arg_14_1, arg_14_2)
	if not arg_14_2 or type(arg_14_2) ~= "table" or not arg_14_2.operatorData then
		assert(false)
	end

	arg_14_0._controllerIndex = arg_14_1
	arg_14_0._menuRef = arg_14_2.menuRef

	local var_14_0 = arg_14_2.operatorData.operatorInfo

	arg_14_0._operatorNameForTitle = var_14_0.name
	arg_14_0.menuInitialized = false
	arg_14_0.UpdateTabsIfAvailableMissions = var_0_5

	arg_14_0:addEventHandler("menu_create", function(arg_15_0, arg_15_1)
		var_0_8(arg_15_0)
		var_0_9(arg_15_0)
		OPERATOR.SetupScene(arg_15_0, arg_14_1)
		var_0_6(arg_15_0, arg_14_1, {
			operatorInfo = var_14_0,
			startTabIndex = arg_14_2.operatorData.menuData.startTabIndex
		})

		arg_15_0._idleAnimationsTable, arg_15_0._equipAnimationsTable = OPERATOR.GetSceneCharacterModelAnimations()

		OPERATOR.SetSceneCharacterModel(arg_15_0, arg_14_1, {
			showARandomSkin = true,
			element = arg_15_0,
			operatorInfo = var_14_0,
			menuRef = arg_15_0._menuRef
		})
		OPERATOR.PlayEquippedAnimAndQueueIdle(arg_15_0, arg_14_1, {
			newEquipped = false,
			operatorInfo = var_14_0
		})

		local var_15_0 = "ShowBattlePassInfo"

		if OPERATOR.IsS4Operator(var_14_0.ref) then
			arg_15_0._isVanguardOperator = true
			var_15_0 = "ShowProgressionInfo"

			arg_15_0.WZWipOperatorProgress:SetupProgression(var_14_0.ref)
		end

		ACTIONS.AnimateSequence(arg_15_0, var_15_0)
		var_0_1(arg_15_0)
	end)
	LAYOUT.SetupCommonScaleableLayoutElements(arg_14_0, arg_14_1)

	if CONDITIONS.IsWZWipDvarEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_14_0)
	end
end

function WZOperatorInformation(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0.id = "WZOperatorInformation"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	var_16_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})
	var_16_0.HelperBar.id = "HelperBar"

	var_16_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_16_0.HelperBar:setPriority(10)
	var_16_0:addElement(var_16_0.HelperBar)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "Vignette"

	var_16_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_16_0:addElement(var_16_4)

	var_16_0.Vignette = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "TabBacker"

	var_16_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_16_0:addElement(var_16_6)

	var_16_0.TabBacker = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "MenuTitle"

	var_16_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO_TITLE")), 0)
	var_16_8.Line:SetLeft(0, 0)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_16_0:addElement(var_16_8)

	var_16_0.MenuTitle = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "HelperBar"

	var_16_10.Background:SetAlpha(0.2, 0)
	var_16_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_16_0:addElement(var_16_10)

	var_16_0.HelperBar = var_16_10

	local var_16_11
	local var_16_12 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_16_1
			})
		end,
		controllerIndex = var_16_1
	}
	local var_16_13 = LUI.TabManager.new(var_16_12)

	var_16_13.id = "Tabs"

	var_16_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 997, _1080p * 108, _1080p * 160)
	var_16_0:addElement(var_16_13)

	var_16_0.Tabs = var_16_13

	local var_16_14
	local var_16_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_16_1
	})

	var_16_15.id = "LobbyMembersFooter"

	var_16_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_16_0:addElement(var_16_15)

	var_16_0.LobbyMembersFooter = var_16_15

	local var_16_16
	local var_16_17 = LUI.UIStyledText.new()

	var_16_17.id = "ItemsCollected"

	var_16_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_16_17:SetAlpha(0, 0)
	var_16_17:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_16_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_16_17:SetWordWrap(false)
	var_16_17:SetAlignment(LUI.Alignment.Left)
	var_16_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 315, _1080p * 178, _1080p * 200)
	var_16_0:addElement(var_16_17)

	var_16_0.ItemsCollected = var_16_17

	local var_16_18

	if CONDITIONS.IsBattlePassEnabled() then
		var_16_18 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			controllerIndex = var_16_1
		})
		var_16_18.id = "BattlePassSeasonResetStatus"

		var_16_18.ResetText:SetLeft(_1080p * 83, 0)
		var_16_18.ResetText:SetRight(_1080p * 375, 0)
		var_16_18.ResetText:SetTop(_1080p * 24, 0)
		var_16_18.ResetText:SetBottom(_1080p * 52, 0)
		var_16_18.ResetText:SetAlignment(LUI.Alignment.Left)
		var_16_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1449, _1080p * 1824, _1080p * 52, _1080p * 132)
		var_16_0:addElement(var_16_18)

		var_16_0.BattlePassSeasonResetStatus = var_16_18
	end

	local var_16_19

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_16_19 = MenuBuilder.BuildRegisteredType("WZOperatorProgress", {
			controllerIndex = var_16_1
		})
		var_16_19.id = "WZWipOperatorProgress"

		var_16_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 55, _1080p * 179)
		var_16_0:addElement(var_16_19)

		var_16_0.WZWipOperatorProgress = var_16_19
	end

	local function var_16_20()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_20

	local var_16_21

	if CONDITIONS.IsBattlePassEnabled() then
		local var_16_22 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_16_18:RegisterAnimationSequence("ShowBattlePassInfo", var_16_22)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_16_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_16_19:RegisterAnimationSequence("ShowBattlePassInfo", var_16_23)
	end

	local function var_16_24()
		if CONDITIONS.IsBattlePassEnabled() then
			var_16_18:AnimateSequence("ShowBattlePassInfo")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_16_19:AnimateSequence("ShowBattlePassInfo")
		end
	end

	var_16_0._sequences.ShowBattlePassInfo = var_16_24

	local var_16_25

	if CONDITIONS.IsBattlePassEnabled() then
		local var_16_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_16_18:RegisterAnimationSequence("ShowProgressionInfo", var_16_26)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_16_27 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_16_19:RegisterAnimationSequence("ShowProgressionInfo", var_16_27)
	end

	local function var_16_28()
		if CONDITIONS.IsBattlePassEnabled() then
			var_16_18:AnimateSequence("ShowProgressionInfo")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_16_19:AnimateSequence("ShowProgressionInfo")
		end
	end

	var_16_0._sequences.ShowProgressionInfo = var_16_28

	local var_16_29

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_16_30 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_16_19:RegisterAnimationSequence("HideProgressionInfo", var_16_30)
	end

	local function var_16_31()
		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_16_19:AnimateSequence("HideProgressionInfo")
		end
	end

	var_16_0._sequences.HideProgressionInfo = var_16_31

	var_0_10(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("WZOperatorInformation", WZOperatorInformation)
LockTable(_M)
