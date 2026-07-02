module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 ~= nil then
		if type(arg_1_0) == "function" then
			return arg_1_0(arg_1_2)
		else
			return arg_1_0
		end
	else
		return arg_1_1
	end
end

local function var_0_1(arg_2_0)
	return string.format("Blade%s", arg_2_0)
end

local function var_0_2(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0._bladesOrder) do
		local var_3_0 = var_0_1(iter_3_0)

		if arg_3_0[var_3_0] then
			arg_3_0[var_3_0]:closeTree()

			arg_3_0[var_3_0] = nil
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0._bladesOrder) do
		if iter_4_1 == arg_4_1 then
			return iter_4_0
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	return arg_5_0._bladesOrder[arg_5_1]
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = var_0_1(arg_6_1)

	if arg_6_0[var_6_0] then
		arg_6_0:RemoveElement(arg_6_0[var_6_0])
		arg_6_0:addElement(arg_6_0[var_6_0])
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	if not arg_7_0._selectedIndex or arg_7_0._selectedIndex > #arg_7_0._bladesOrder then
		arg_7_0._selectedIndex = 1
	end

	if arg_7_2 or arg_7_0._lastSelectedIndex ~= arg_7_0._selectedIndex then
		local var_7_0 = var_0_4(arg_7_0, arg_7_0._selectedIndex)

		LUI.FlowManager.GetScopedData(arg_7_0).selectedKey = var_7_0

		local var_7_1

		if arg_7_0._selectedIndex and var_7_0 then
			local var_7_2 = arg_7_0._bladesData[var_7_0]

			var_7_1 = var_0_0(var_7_2.expandedRatio, nil, arg_7_1)
		end

		arg_7_0:dispatchEventToChildren({
			name = "selection_state_updated",
			selectedIndex = arg_7_0._selectedIndex,
			wrapped = arg_7_0._wrapped,
			snap = arg_7_2,
			expandedRatio = var_7_1
		})

		arg_7_0._wrapped = false
		arg_7_0._lastSelectedIndex = arg_7_0._selectedIndex
	end
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._selectedIndex = 1

	for iter_8_0, iter_8_1 in ipairs(arg_8_0._bladesOrder) do
		if arg_8_1 == iter_8_0 then
			arg_8_0._selectedIndex = iter_8_0

			break
		end
	end

	var_0_6(arg_8_0, arg_8_2)
end

local function var_0_8(arg_9_0, arg_9_1)
	if arg_9_0._selectedIndex then
		arg_9_0._selectedIndex = arg_9_0._selectedIndex + 1

		if arg_9_0._selectedIndex > #arg_9_0._bladesOrder then
			arg_9_0._selectedIndex = 1
			arg_9_0._wrapped = true
		end
	else
		arg_9_0._selectedIndex = 1
	end

	var_0_6(arg_9_0, arg_9_1)
end

local function var_0_9(arg_10_0, arg_10_1)
	if arg_10_0._selectedIndex then
		arg_10_0._selectedIndex = arg_10_0._selectedIndex - 1

		if arg_10_0._selectedIndex < 1 then
			arg_10_0._selectedIndex = #arg_10_0._bladesOrder
			arg_10_0._wrapped = true
		end
	else
		arg_10_0._selectedIndex = 1
	end

	var_0_6(arg_10_0, arg_10_1)
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7)
	local var_11_0 = arg_11_0._bladesData[arg_11_5]
	local var_11_1 = MenuBuilder.BuildRegisteredType("MainMenuBlade", {
		index = arg_11_6,
		bladeCount = #arg_11_0._bladesOrder,
		layoutWidth = arg_11_2,
		layoutHeight = arg_11_3,
		bladeType = arg_11_4,
		name = var_11_0.name,
		bladeKey = arg_11_5,
		description = var_11_0.description,
		videoName = var_11_0.videoName,
		isVideoEncrypted = var_11_0.isVideoEncrypted,
		imageName = var_11_0.imageName,
		keepAspect = var_11_0.keepAspect,
		playByDefault = var_11_0.playByDefault,
		backgroundImageName = var_11_0.backgroundImageName,
		titleLogo = var_11_0.titleLogo,
		expandedratio = var_11_0.expandedratio,
		bladeThemeAnim = var_11_0.bladeThemeAnim,
		transitionSwatch = var_11_0.transitionSwatch,
		gainFocusLeftSFX = var_11_0.gainFocusLeftSFX,
		gainFocusRightSFX = var_11_0.gainFocusRightSFX,
		verticalButtonOffset = var_11_0.verticalButtonOffset,
		timerLabel = var_11_0.timerLabel,
		timerEnd = var_11_0.timerEnd,
		friendsCountUpdate = var_11_0.friendsCountUpdate,
		prompt = var_11_0.prompt,
		secondaryPrompt = var_11_0.secondaryPrompt,
		tertiaryPrompt = var_11_0.tertiaryPrompt,
		blockedPrompt = var_11_0.blockedPrompt,
		installingPrompt = var_11_0.installingPrompt,
		action = var_11_0.action,
		actionName = var_11_0.actionName,
		preOrderLabelText = var_11_0.preOrderLabelText,
		secondaryAction = var_11_0.secondaryAction,
		tertiaryAction = var_11_0.tertiaryAction,
		isBlocked = var_11_0.isBlocked,
		blockedAction = var_11_0.blockedAction,
		isInstalling = var_11_0.isInstalling,
		installingAction = var_11_0.installingAction,
		isNew = var_11_0.isNew,
		classified = var_11_0.classified,
		showUpsellOverlay = var_11_0.showUpsellOverlay,
		showNGOverlay = var_11_0.showNGOverlay,
		showStoreOverlay = var_11_0.showStoreOverlay,
		getButtonOverAnimation = var_11_0.getButtonOverAnimation,
		controllerIndex = arg_11_1,
		isOnSale = var_11_0.isOnSale,
		isNGBlade = var_11_0.isNGBlade,
		isWZBlade = var_11_0.isWZBlade,
		liveEventLocation = var_11_0.liveEventLocation,
		useSmallerBlades = arg_11_7,
		smallButtonAnimation = var_11_0.smallButtonAnimation,
		buttonListData = var_11_0.buttonListData,
		baseVideoWidth = var_11_0.baseVideoWidth,
		baseVideoHeight = var_11_0.baseVideoHeight
	})
	local var_11_2 = var_0_1(arg_11_6)

	var_11_1.id = var_11_2

	var_11_1:SetAnchorsAndPosition(0.5, 0.5, 0, 0, 0, 0, 0, 0)
	arg_11_0:addElement(var_11_1)

	arg_11_0[var_11_2] = var_11_1
end

local function var_0_11(arg_12_0, arg_12_1)
	local var_12_0 = LUI.FlowManager.GetScopedData(arg_12_0)

	if arg_12_0._bladesData[MAIN_MENU.BladeKeys.BuyNG] then
		arg_12_0._selectedIndex = var_0_3(arg_12_0, MAIN_MENU.BladeKeys.BuyNG)
	elseif arg_12_0._bladesData[MAIN_MENU.BladeKeys.NG] then
		arg_12_0._selectedIndex = var_0_3(arg_12_0, MAIN_MENU.BladeKeys.NG)
	elseif arg_12_0._bladesData[MAIN_MENU.BladeKeys.BuyHQ] then
		arg_12_0._selectedIndex = var_0_3(arg_12_0, MAIN_MENU.BladeKeys.BuyHQ)
	elseif arg_12_0._bladesData[MAIN_MENU.BladeKeys.HQ] then
		arg_12_0._selectedIndex = var_0_3(arg_12_0, MAIN_MENU.BladeKeys.HQ)
	elseif var_12_0 and var_12_0.selectedKey and arg_12_0._bladesData[var_12_0.selectedKey] then
		arg_12_0._selectedIndex = var_0_3(arg_12_0, var_12_0.selectedKey)
	else
		arg_12_0._selectedIndex = 1
	end

	var_0_6(arg_12_0, arg_12_1, true)
end

local function var_0_12(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._bladesData = {}
	arg_13_0._bladesOrder = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_1) do
		if var_0_0(iter_13_1.buildCondition, true, arg_13_0._controllerIndex) then
			arg_13_0._bladesData[iter_13_0] = iter_13_1

			table.insert(arg_13_0._bladesOrder, iter_13_0)
		end
	end

	if arg_13_2 ~= nil then
		local function var_13_0(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_0
			local var_14_1 = arg_14_1

			for iter_14_0, iter_14_1 in pairs(arg_13_2) do
				if iter_14_1.key == var_14_0 then
					var_14_0 = iter_14_1.keyOverride
				end

				if iter_14_1.key == var_14_1 then
					var_14_1 = iter_14_1.keyOverride
				end
			end

			return var_14_0 < var_14_1
		end

		table.sort(arg_13_0._bladesOrder, var_13_0)
	else
		table.sort(arg_13_0._bladesOrder)
	end
end

local function var_0_13(arg_15_0)
	if not arg_15_0._setupDone then
		return
	end

	var_0_2(arg_15_0)

	arg_15_0._layoutHeight = 1920 / (CoD.AspectRatioCompare() ~= LUI.COMPARE.higher and Engine.CEGEEHGGBA() or 1.7777777777777777)

	local var_15_0 = #arg_15_0._bladesOrder
	local var_15_1 = var_15_0 > 3 and arg_15_0._bladeType == MAIN_MENU.BladeType.Accordion

	for iter_15_0 = 1, var_15_0 do
		var_0_10(arg_15_0, arg_15_0._controllerIndex, arg_15_0._layoutWidth, arg_15_0._layoutHeight, arg_15_0._bladeType, arg_15_0._bladesOrder[iter_15_0], iter_15_0, var_15_1)
	end

	var_0_11(arg_15_0, arg_15_0._controllerIndex)

	arg_15_0:Wait(1).onComplete = function()
		var_0_11(arg_15_0, arg_15_0._controllerIndex)
	end
end

local function var_0_14(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5)
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._bladeType = arg_17_2
	arg_17_0._layoutWidth = arg_17_3
	arg_17_0._setupDone = true

	var_0_2(arg_17_0)
	var_0_12(arg_17_0, arg_17_4, arg_17_5)
	var_0_13(arg_17_0)
end

local function var_0_15(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0._bladesData = {}
	arg_18_0._bladesOrder = {}
	arg_18_0.PushBladeToTopByIndex = var_0_5
	arg_18_0.HoverBladeByIndex = var_0_7
	arg_18_0.SetupBlades = var_0_14
	arg_18_0.RefreshBlades = var_0_13
	arg_18_0._setupDone = false

	MatchRules.CJGCIGEBB(0)

	local function var_18_0(arg_19_0)
		arg_18_0:addEventHandler(arg_19_0, function()
			var_0_13(arg_18_0)
		end)
	end

	var_18_0("restore_focus")
	var_18_0("onVideoChange")
	var_18_0("menu_create")
	var_18_0("Inventory_DownloadComplete")
	var_18_0("Inventory_DeleteItem")
	var_18_0("Inventory_UpdateItem")
	var_18_0("Inventory_AddItem")
	arg_18_0:addEventHandler("gamepad_button", function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_1.controller or arg_18_1

		if arg_21_1.down then
			if arg_21_1.button == "left" then
				var_0_9(arg_21_0, var_21_0)
			elseif arg_21_1.button == "right" then
				var_0_8(arg_21_0, var_21_0)
			end
		end
	end)
	LUI.UIMouseCursor.ForceCursorVisibility(true)
end

function MainMenuBladeLayout(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIElement.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_22_0.id = "MainMenuBladeLayout"

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0

	var_0_15(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("MainMenuBladeLayout", MainMenuBladeLayout)
LockTable(_M)
