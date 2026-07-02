module(..., package.seeall)

local var_0_0 = 150
local var_0_1 = var_0_0 + 50
local var_0_2 = 0

local function var_0_3(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in pairs(arg_1_0.upgrades) do
		if iter_1_1.ref == arg_1_1 then
			return iter_1_1.isActive
		end
	end

	return false
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0 = false
	local var_2_1 = false

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.upgrades) do
		if arg_2_1 == iter_2_1.ref then
			var_2_0 = true

			if iter_2_1.isActive then
				var_2_1 = true
			end

			break
		end
	end

	return var_2_0, var_2_1
end

local function var_0_5(arg_3_0, arg_3_1, arg_3_2)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.upgrades) do
		if arg_3_1 == iter_3_1.ref then
			iter_3_1.isActive = arg_3_2

			break
		end
	end
end

local function var_0_6(arg_4_0)
	if not arg_4_0.upgrades[SUPER.Slot.LEFT].isActive then
		return SUPER.Slot.LEFT
	elseif not arg_4_0.upgrades[SUPER.Slot.RIGHT].isActive then
		return SUPER.Slot.RIGHT
	end
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.EquippedWidget:SetAlpha(arg_5_2 and 1 or 0)

	if arg_5_2 then
		ACTIONS.AnimateSequence(arg_5_0.EquippedWidget, "TurnOn")
	end
end

local function var_0_8(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = PROGRESSION.IsUnlocked(arg_6_1, LOOT.itemTypes.ROLE, arg_6_2)
	local var_6_1 = ""

	if not var_6_0 then
		var_6_1 = PROGRESSION.GetUnlockText(arg_6_1, LOOT.itemTypes.ROLE, arg_6_2)
	end

	arg_6_0.UnlockCriteria:SetAlpha(var_6_0 and 0 or 1)
	arg_6_0.UnlockCriteria.UnlockDesc:setText(var_6_1)
end

local function var_0_9(arg_7_0)
	arg_7_0.UpgradesEquipped:Update({
		proMode = arg_7_0.proMode,
		upgrades = arg_7_0.upgrades
	})
end

local function var_0_10(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0._currentRef

	if var_0_3(arg_8_0, var_8_0) then
		arg_8_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	else
		arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end
end

local function var_0_11(arg_9_0)
	var_0_10(arg_9_0)
	var_0_9(arg_9_0)

	local var_9_0 = arg_9_0._currentRef

	var_0_8(arg_9_0, arg_9_0._controllerIndex, var_9_0)
	var_0_7(arg_9_0, arg_9_0._controllerIndex, var_0_3(arg_9_0, var_9_0))
	arg_9_0.Grid:RefreshContent()

	if CONDITIONS.InFrontend() and not Onboarding.CPRoles.WasCompleted(arg_9_0, arg_9_0._controllerIndex) then
		LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingpopup", true, arg_9_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingRoleData())
		Onboarding.CPRoles.MarkCompleted(arg_9_0, arg_9_0._controllerIndex)
	end
end

local function var_0_12(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = {
		displayTime = 2000,
		icon = arg_10_2,
		header = arg_10_3,
		description = arg_10_4 and Engine.CBBHFCGDIC(arg_10_4) or nil,
		type = LUI.ToastManager.NotificationType.RoleEquipped,
		controllerIndex = arg_10_1
	}

	arg_10_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_10_0
	})
end

local function var_0_13(arg_11_0, arg_11_1)
	if arg_11_0.upgrades[SUPER.Slot.LEFT].ref == Cac.superNoneValue then
		Swap(arg_11_0)
	end

	assert(arg_11_0.upgrades[SUPER.Slot.LEFT].ref ~= Cac.superNoneValue)
	arg_11_0._playerData.cpFieldUpgrade:set(arg_11_0.upgrades[SUPER.Slot.LEFT].ref)
	ACTIONS.UploadStats(arg_11_0, arg_11_1)

	if not Engine.DDJFBBJAIG() then
		Engine.EBHIFJCGBH("update_super", 1)
	end
end

local function var_0_14(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0._currentRef
	local var_12_1, var_12_2 = var_0_4(arg_12_0, var_12_0)

	;(function(arg_13_0)
		arg_12_0.upgrades[arg_13_0].ref = var_12_0
		arg_12_0.upgrades[arg_13_0].isActive = true

		var_0_12(arg_12_0, arg_12_1, MUNITION.GetRoleImage(var_12_0), Engine.CBBHFCGDIC("LUA_MENU/ROLE_EQUIPPED"), MUNITION.GetRoleName(var_12_0))
	end)(SUPER.Slot.LEFT)
	var_0_11(arg_12_0)
	var_0_13(arg_12_0, arg_12_1)
end

local function var_0_15(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0._currentRef

	arg_14_0.RoleName:setText(ToUpperCase(Engine.CBBHFCGDIC(MUNITION.GetRoleName(var_14_0))))
	arg_14_0.FieldUpgradeName:setText(Engine.CBBHFCGDIC(MUNITION.GetFieldUpgradeName(var_14_0)))
	arg_14_0.FieldUpgradeDescription:setText(Engine.CBBHFCGDIC(MUNITION.GetFieldUpgradeDesc(var_14_0)))
	arg_14_0.PassiveName:setText(Engine.CBBHFCGDIC(MUNITION.GetPassiveName(var_14_0)))
	arg_14_0.PassiveDescription:setText(Engine.CBBHFCGDIC(MUNITION.GetPassiveDesc(var_14_0)))
	arg_14_0.PassiveIcon:setImage(RegisterMaterial(MUNITION.GetPassiveImage(var_14_0)), 0)
	arg_14_0.FieldOrderIcon:setImage(RegisterMaterial(MUNITION.GetFieldUpgradeImage(var_14_0)), 0)
	arg_14_0.FieldUpgradeRechargeRate:setText(MUNITION.GetRechargeLabel(var_14_0))
	arg_14_0.FieldUpgradeRechargeRate:SetRGBFromTable(MUNITION.GetRechargeColor(var_14_0))

	if Engine.DDJFBBJAIG() then
		assert(arg_14_0.FadeCover)

		local var_14_1 = arg_14_0._upgradeSelectionComplete and var_0_0 or 10

		if not arg_14_0._prevImage then
			var_14_1 = 0
		end

		arg_14_0.FadeCover:SetAlpha(1, var_14_1, LUI.EASING.inQuadratic)

		arg_14_0.FadeCover:Wait(var_0_0, true).onComplete = function()
			if arg_14_0._upgradeSelectionComplete then
				assert(arg_14_0.Showcase)
				arg_14_0.Showcase:setImage(RegisterMaterial(MUNITION.GetShowcaseImage(var_14_0)))
				arg_14_0.FadeCover:SetAlpha(0, var_0_1, LUI.EASING.outQuadratic)
				arg_14_0.Showcase:SetScale(arg_14_0.scaleAdjust, 0)
				arg_14_0.Showcase:SetScale(arg_14_0.scaleAdjust + 0.015, 2500, LUI.EASING.outQuadratic)

				arg_14_0._prevImage = MUNITION.GetShowcaseImage(var_14_0)
			end
		end
		arg_14_0._upgradeSelectionComplete = false
		arg_14_0:Wait(var_0_0 - 10, true).onComplete = function()
			arg_14_0._upgradeSelectionComplete = true
		end
	end

	var_0_11(arg_14_0)
end

local function var_0_16(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = arg_18_1 + arg_18_2 * arg_17_0.Grid:GetNumColumns()

		arg_18_0.ref = arg_17_0._allRefs[var_18_0 + 1]

		function arg_18_0.MenuButtonOver(arg_19_0, arg_19_1)
			arg_17_0._currentRef = arg_19_0.ref

			var_0_15(arg_17_0, arg_17_1)
		end

		function arg_18_0.MenuButtonAction(arg_20_0, arg_20_1)
			var_0_14(arg_17_0, arg_17_1)
		end

		local var_18_1 = PROGRESSION.IsUnlocked(arg_17_1, LOOT.itemTypes.ROLE, arg_18_0.ref)
		local var_18_2 = var_0_3(arg_17_0, arg_18_0.ref)

		arg_18_0:RefreshData(MUNITION.GetRoleImageLarge(arg_18_0.ref), var_18_1, var_18_2, false, arg_18_0.ref)
	end

	local function var_17_1()
		local var_21_0 = 1

		for iter_21_0, iter_21_1 in ipairs(arg_17_0._allRefs) do
			if iter_21_1 == arg_17_0.upgrades[SUPER.Slot.LEFT].ref then
				var_21_0 = iter_21_0

				break
			end
		end

		return arg_17_0.Grid:GetPositionForIndex(var_21_0 - 1, {
			relativePosition = false
		})
	end

	local var_17_2 = math.min(#arg_17_0._allRefs, arg_17_0._defaultMaxVisibleColumns)

	arg_17_0.Grid:SetMaxVisibleColumns(var_17_2)
	arg_17_0.Grid:SetNumChildren(#arg_17_0._allRefs)
	arg_17_0.Grid:SetDefaultFocus(var_17_1)
	arg_17_0.Grid:SetRefreshChild(var_17_0)
	arg_17_0:addEventHandler("menu_create", function()
		arg_17_0.Grid:RefreshContent()
	end)
end

local function var_0_17(arg_23_0, arg_23_1)
	local function var_23_0()
		arg_23_0.upgrades[SUPER.Slot.LEFT].isActive = false
		arg_23_0.upgrades[SUPER.Slot.RIGHT].isActive = false

		var_0_11(arg_23_0)
	end

	local var_23_1 = Engine.CBBHFCGDIC("LUA_MENU/DESELECT_ALL")

	if arg_23_1 then
		arg_23_0.bindButton:registerEventHandler("button_alt1", function(arg_25_0, arg_25_1)
			var_23_0()
		end)
	else
		arg_23_0.bindButton:registerEventHandler("button_alt1", nil)

		var_23_1 = ""
	end

	arg_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		priority = 3,
		helper_text = var_23_1
	})
end

local function var_0_18(arg_26_0)
	local var_26_0 = arg_26_0.upgrades[SUPER.Slot.LEFT]

	arg_26_0.upgrades[SUPER.Slot.LEFT] = arg_26_0.upgrades[SUPER.Slot.RIGHT]
	arg_26_0.upgrades[SUPER.Slot.RIGHT] = var_26_0
end

local function var_0_19(arg_27_0, arg_27_1)
	local var_27_0 = "button_right_trigger"
	local var_27_1 = Engine.CBBHFCGDIC("LUA_MENU/SWAP")

	if arg_27_1 then
		arg_27_0.bindButton:registerEventHandler(var_27_0, function(arg_28_0, arg_28_1)
			var_0_18(arg_27_0)
			var_0_11(arg_27_0)
		end)
	else
		arg_27_0.bindButton:registerEventHandler(var_27_0, nil)

		var_27_1 = ""
	end

	arg_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		helper_text = var_27_1,
		button_ref = var_27_0,
		container = arg_27_0.UpgradesEquipped:GetSwapContainer()
	})
end

local function var_0_20(arg_29_0, arg_29_1)
	local var_29_0 = Engine.CBBHFCGDIC("LUA_MENU/PRO_HELP")
	local var_29_1 = "button_alt2"

	if arg_29_1 then
		arg_29_0.bindButton:registerEventHandler(var_29_1, function(arg_30_0, arg_30_1)
			local var_30_0 = arg_29_0._currentRef
			local var_30_1 = Engine.CBBHFCGDIC("LUA_MENU/PRO_HELP")

			Engine.EBCGADABJ()

			arg_29_0:Wait(64).onComplete = function()
				Engine.DFCGFCGBFD(SUPER.GetTutorialVideo(var_30_0), VideoPlaybackFlags.LOOP + VideoPlaybackFlags.MUTE)
				LUI.FlowManager.RequestPopupMenu(nil, "TutorialVideoMaximized", true, controllerIndex, false, {
					title = var_30_1,
					videoRef = var_30_0,
					videoFlags = VideoPlaybackFlags.LOOP + VideoPlaybackFlags.MUTE
				})
			end
		end)
	else
		arg_29_0.bindButton:registerEventHandler(var_29_1, nil)

		var_29_0 = ""
	end

	arg_29_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 4,
		helper_text = var_29_0,
		button_ref = var_29_1
	})
end

local function var_0_21(arg_32_0)
	local var_32_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_N", var_0_2)

	if arg_32_0._proModeAvailable then
		ACTIONS.AnimateSequence(arg_32_0.UpgradesEquipped, "ProAvailable")

		if arg_32_0.proMode == SUPER.ProMode.ENABLED then
			var_32_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_DEACTIVATE")
		else
			var_32_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_ACTIVATE")
		end

		arg_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			button_ref = "button_left_trigger",
			helper_text = var_32_0,
			container = arg_32_0.UpgradesEquipped:GetProModeContainer()
		})
	else
		ACTIONS.AnimateSequence(arg_32_0.UpgradesEquipped, "ProHidden")
	end
end

local function var_0_22(arg_33_0)
	if not arg_33_0._proModeAvailable then
		return false
	end

	local var_33_0 = false

	if arg_33_0.proMode == SUPER.ProMode.ENABLED then
		arg_33_0.proMode = SUPER.ProMode.DISABLED
	elseif arg_33_0.proMode == SUPER.ProMode.DISABLED then
		arg_33_0.proMode = SUPER.ProMode.ENABLED
		var_33_0 = true

		local var_33_1 = PROGRESSION.GetPlayerRankIcon(arg_33_0._controllerIndex)

		var_0_12(arg_33_0, controllerIndex, var_33_1, Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_ACTIVATED"))
	end

	var_0_17(arg_33_0, var_33_0)
	var_0_19(arg_33_0, var_33_0)
	var_0_21(arg_33_0)

	if arg_33_0.upgrades[SUPER.Slot.LEFT].ref == Cac.superNoneValue then
		var_0_18(arg_33_0)
	end

	arg_33_0.upgrades[SUPER.Slot.RIGHT].ref = Cac.superNoneValue
	arg_33_0.upgrades[SUPER.Slot.RIGHT].isActive = false

	return true
end

local function var_0_23(arg_34_0, arg_34_1)
	local var_34_0 = PROGRESSION.GetPlayerRank(arg_34_1)
	local var_34_1 = arg_34_0.upgrades[SUPER.Slot.RIGHT].ref ~= Cac.superNoneValue
	local var_34_2 = false

	arg_34_0.proMode = SUPER.ProMode.DISABLED
	arg_34_0._proModeAvailable = false

	if arg_34_0._proModeAvailable then
		if var_34_1 then
			arg_34_0.proMode = SUPER.ProMode.ENABLED
			var_34_2 = true
		end
	else
		arg_34_0.upgrades[SUPER.Slot.RIGHT].ref = Cac.superNoneValue
	end

	var_0_17(arg_34_0, var_34_2)
	var_0_19(arg_34_0, var_34_2)
	var_0_21(arg_34_0)
end

local function var_0_24(arg_35_0, arg_35_1, arg_35_2)
	arg_35_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/ROLE_SELECT"))

	arg_35_0.scaleAdjust = 0
	arg_35_0.ButtonAction = var_0_14
	arg_35_0.ButtonOver = var_0_15
	arg_35_0._allRefs = MUNITION.GetAllFieldUpgradeRefs()
	arg_35_0._currentRef = arg_35_0._allRefs[1]
	arg_35_0._controllerIndex = arg_35_1
	arg_35_0._defaultMaxVisibleColumns = arg_35_0.Grid:GetMaxVisibleColumns()
	arg_35_0._playerData = PlayerData.BFFBGAJGD(arg_35_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	arg_35_0._upgradeSelectionComplete = true
	arg_35_0._prevImage = nil
	arg_35_0.upgrades = {
		[SUPER.Slot.LEFT] = {
			isActive = true,
			ref = arg_35_0._playerData.cpFieldUpgrade:get()
		},
		[SUPER.Slot.RIGHT] = {
			isActive = true,
			ref = arg_35_0._playerData.cpFieldUpgrade:get()
		}
	}

	local function var_35_0()
		local var_36_0 = CoD.GetAspectRatioScaleAdjust(0.25)

		arg_35_0.BackgroundGradient:SetScale(var_36_0)
	end

	arg_35_0:addAndCallEventHandler("onVideoChange", var_35_0)
	arg_35_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	var_0_23(arg_35_0, arg_35_1)
	var_0_16(arg_35_0, arg_35_1)
	var_0_9(arg_35_0)
	;(function()
		local var_37_0 = LAYOUT.GetTextWidth(arg_35_0.RechargeRateText)
		local var_37_1 = arg_35_0.RechargeRateText:GetCurrentAnchorsAndPositions().left
		local var_37_2 = 4 * _1080p

		arg_35_0.FieldUpgradeRechargeRate:SetLeft(var_37_1 + var_37_0 + var_37_2)

		if IsLanguageArabic() then
			local var_37_3 = LAYOUT.GetTextWidth(arg_35_0.FieldUpgradeRechargeRate)
			local var_37_4 = arg_35_0.FieldUpgradeRechargeRate:GetCurrentAnchorsAndPositions().left

			arg_35_0.RechargeRateText:SetLeft(var_37_4 + var_37_3 + var_37_2)
		end
	end)()
	arg_35_0:addEventHandler("menu_close", function(arg_38_0, arg_38_1)
		var_0_13(arg_35_0, arg_35_1)
	end)

	if arg_35_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_35_0.InGameMenuBackground)
	elseif Engine.CGABICJHAI() then
		local function var_35_1()
			local var_39_0 = CoD.GetAspectRatioScaleAdjust(0.2)

			arg_35_0.scaleAdjust = var_39_0
		end

		ACTIONS.ScaleFullscreen(arg_35_0.BackgroundGradient)
		ACTIONS.ScaleFullscreen(arg_35_0.FadeCover)
		arg_35_0:addAndCallEventHandler("onVideoChange", var_35_1)
	end

	if not Engine.DDJFBBJAIG() then
		arg_35_0:addEventHandler("menu_create", function()
			arg_35_0:AddButtonHelperText({
				clickable = true,
				priority = 2,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_35_0.bindButton:addEventHandler("button_start", function(arg_41_0, arg_41_1)
			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_35_0)
	end

	arg_35_0.bindButton:addEventHandler("button_left_trigger", function(arg_42_0, arg_42_1)
		if var_0_22(arg_35_0) then
			var_0_11(arg_35_0)
		end
	end)

	if LUI.IsLastInputKeyboardMouse(arg_35_1) then
		arg_35_0.Grid:GainFocus()
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_35_0, arg_35_1)

	if not IsLanguageArabic() then
		arg_35_0.NewItemNotification:SetupLeftAlignment()
	end
end

function CPFieldUpgrades(arg_43_0, arg_43_1)
	local var_43_0 = LUI.UIElement.new()

	var_43_0.id = "CPFieldUpgrades"
	var_43_0._animationSets = var_43_0._animationSets or {}
	var_43_0._sequences = var_43_0._sequences or {}

	local var_43_1 = arg_43_1 and arg_43_1.controllerIndex

	if not var_43_1 and not Engine.DDJFBBJAIG() then
		var_43_1 = var_43_0:getRootController()
	end

	assert(var_43_1)

	var_43_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_43_1
	})
	var_43_0.HelperBar.id = "HelperBar"

	var_43_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_43_0.HelperBar:setPriority(10)
	var_43_0:addElement(var_43_0.HelperBar)

	local var_43_2 = var_43_0
	local var_43_3

	if CONDITIONS.InFrontend(var_43_0) then
		local var_43_4 = LUI.UIImage.new()

		var_43_4.id = "Background"

		var_43_4:setImage(RegisterMaterial("mp_killstreak_background"), 0)
		var_43_0:addElement(var_43_4)

		var_43_0.Background = var_43_4
	end

	local var_43_5
	local var_43_6 = {
		worldBlur = 5,
		controllerIndex = var_43_1
	}
	local var_43_7 = MenuBuilder.BuildRegisteredType("WorldBlur", var_43_6)

	var_43_7.id = "WorldBlur"

	var_43_0:addElement(var_43_7)

	var_43_0.WorldBlur = var_43_7

	local var_43_8

	if CONDITIONS.InGame(var_43_0) then
		local var_43_9 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_43_1
		})

		var_43_9.id = "InGameMenuBackground"

		var_43_9:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_43_0:addElement(var_43_9)

		var_43_0.InGameMenuBackground = var_43_9
	end

	local var_43_10

	if Engine.DDJFBBJAIG() then
		local var_43_11 = LUI.UIImage.new()

		var_43_11.id = "Showcase"

		var_43_0:addElement(var_43_11)

		var_43_0.Showcase = var_43_11
	end

	local var_43_12
	local var_43_13 = LUI.UIImage.new()

	var_43_13.id = "BackgroundGradient"

	var_43_13:SetRGBFromInt(0, 0)
	var_43_13:SetAlpha(0.75, 0)
	var_43_13:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_43_13:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1322, 0, 0)
	var_43_0:addElement(var_43_13)

	var_43_0.BackgroundGradient = var_43_13

	local var_43_14

	if Engine.DDJFBBJAIG() then
		local var_43_15 = LUI.UIImage.new()

		var_43_15.id = "FadeCover"

		var_43_15:SetRGBFromInt(0, 0)
		var_43_15:SetAlpha(0, 0)
		var_43_0:addElement(var_43_15)

		var_43_0.FadeCover = var_43_15
	end

	local var_43_16
	local var_43_17 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 16,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_43_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("FieldUpgradesButton", {
				controllerIndex = var_43_1
			})
		end,
		refreshChild = function(arg_45_0, arg_45_1, arg_45_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 84,
		rowHeight = _1080p * 116,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_43_18 = LUI.UIGrid.new(var_43_17)

	var_43_18.id = "Grid"

	var_43_18:setUseStencil(false)
	var_43_18:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 96, _1080p * -96, _1080p * -237, _1080p * -74)
	var_43_0:addElement(var_43_18)

	var_43_0.Grid = var_43_18

	local var_43_19
	local var_43_20 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_43_1
	})

	var_43_20.id = "UnlockCriteria"

	var_43_20.UnlockDesc:SetRight(_1080p * 340, 0)
	var_43_20.UnlockDesc:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_43_20.UnlockDesc:setText("LOCKED", 0)
	var_43_20.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_43_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 438, _1080p * 451, _1080p * 483)
	var_43_0:addElement(var_43_20)

	var_43_0.UnlockCriteria = var_43_20

	local var_43_21
	local var_43_22 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_43_1
	})

	var_43_22.id = "EquippedWidget"

	var_43_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 232, _1080p * 451, _1080p * 481)
	var_43_0:addElement(var_43_22)

	var_43_0.EquippedWidget = var_43_22

	local var_43_23
	local var_43_24 = LUI.UIText.new()

	var_43_24.id = "RoleName"

	var_43_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_43_24:setText("", 0)
	var_43_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_43_24:SetAlignment(LUI.Alignment.Left)
	var_43_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 97, _1080p * 950, _1080p * 388, _1080p * 438)
	var_43_0:addElement(var_43_24)

	var_43_0.RoleName = var_43_24

	local var_43_25
	local var_43_26 = LUI.UIStyledText.new()

	var_43_26.id = "FieldUpgradeDescription"

	var_43_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_43_26:setText("", 0)
	var_43_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_43_26:SetAlignment(LUI.Alignment.Left)
	var_43_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 171, _1080p * 536, _1080p * 601, _1080p * 621)
	var_43_0:addElement(var_43_26)

	var_43_0.FieldUpgradeDescription = var_43_26

	local var_43_27

	if CONDITIONS.InFrontendPublicMP(var_43_0) then
		local var_43_28 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_43_1
		})

		var_43_28.id = "MPPlayerDetails"

		var_43_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_43_0:addElement(var_43_28)

		var_43_0.MPPlayerDetails = var_43_28
	end

	local var_43_29
	local var_43_30 = MenuBuilder.BuildRegisteredType("FieldUpgradesEquipped", {
		controllerIndex = var_43_1
	})

	var_43_30.id = "UpgradesEquipped"

	var_43_30:SetAlpha(0, 0)
	var_43_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1387, _1080p * 1557, _1080p * 707, _1080p * 787)
	var_43_0:addElement(var_43_30)

	var_43_0.UpgradesEquipped = var_43_30

	local var_43_31
	local var_43_32 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_43_1
	})

	var_43_32.id = "MenuTitle"

	var_43_32.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/ROLE_SELECT"), 0)
	var_43_32.Line:SetLeft(0, 0)
	var_43_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_43_0:addElement(var_43_32)

	var_43_0.MenuTitle = var_43_32

	local var_43_33
	local var_43_34 = LUI.UIText.new()

	var_43_34.id = "FieldUpgradeName"

	var_43_34:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_43_34:setText("", 0)
	var_43_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_43_34:SetAlignment(LUI.Alignment.Left)
	var_43_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 171, _1080p * 536, _1080p * 573, _1080p * 601)
	var_43_0:addElement(var_43_34)

	var_43_0.FieldUpgradeName = var_43_34

	local var_43_35
	local var_43_36 = LUI.UIText.new()

	var_43_36.id = "PassiveName"

	var_43_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_43_36:setText("", 0)
	var_43_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_43_36:SetAlignment(LUI.Alignment.Left)
	var_43_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 171, _1080p * 499, _1080p * 757, _1080p * 785)
	var_43_0:addElement(var_43_36)

	var_43_0.PassiveName = var_43_36

	local var_43_37
	local var_43_38 = LUI.UIStyledText.new()

	var_43_38.id = "PassiveDescription"

	var_43_38:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_43_38:setText("", 0)
	var_43_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_43_38:SetAlignment(LUI.Alignment.Left)
	var_43_38:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 170, _1080p * 499, _1080p * 787, _1080p * 807)
	var_43_0:addElement(var_43_38)

	var_43_0.PassiveDescription = var_43_38

	local var_43_39
	local var_43_40 = LUI.UIStyledText.new()

	var_43_40.id = "FieldUpgradeText"

	var_43_40:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_43_40:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/FIELD_ORDER_HEADER"), 0)
	var_43_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_43_40:SetAlignment(LUI.Alignment.Left)
	var_43_40:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 539, _1080p * 563)
	var_43_0:addElement(var_43_40)

	var_43_0.FieldUpgradeText = var_43_40

	local var_43_41
	local var_43_42 = LUI.UIStyledText.new()

	var_43_42.id = "PassiveText"

	var_43_42:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_43_42:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/ROLE_ABILITY_HEADER"), 0)
	var_43_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_43_42:SetAlignment(LUI.Alignment.Left)
	var_43_42:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 97, _1080p * 597, _1080p * 723, _1080p * 747)
	var_43_0:addElement(var_43_42)

	var_43_0.PassiveText = var_43_42

	local var_43_43
	local var_43_44 = LUI.UIImage.new()

	var_43_44.id = "FieldOrderIcon"

	var_43_44:SetScale(-0.5, 0)
	var_43_44:setImage(RegisterMaterial("hud_icon_fieldupgrade_emp_drone"), 0)
	var_43_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 192, _1080p * 537, _1080p * 665)
	var_43_0:addElement(var_43_44)

	var_43_0.FieldOrderIcon = var_43_44

	local var_43_45
	local var_43_46 = LUI.UIImage.new()

	var_43_46.id = "PassiveIcon"

	var_43_46:SetScale(-0.5, 0)
	var_43_46:setImage(RegisterMaterial("hud_icon_fieldupgrade_emp_drone"), 0)
	var_43_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 193, _1080p * 725, _1080p * 853)
	var_43_0:addElement(var_43_46)

	var_43_0.PassiveIcon = var_43_46

	local var_43_47
	local var_43_48 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_43_1
	})

	var_43_48.id = "NewItemNotification"

	var_43_48:SetAlpha(0, 0)
	var_43_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 174, _1080p * 451, _1080p * 481)
	var_43_0:addElement(var_43_48)

	var_43_0.NewItemNotification = var_43_48

	local var_43_49
	local var_43_50 = LUI.UIStyledText.new()

	var_43_50.id = "FieldUpgradeRechargeRate"

	var_43_50:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_43_50:setText("", 0)
	var_43_50:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_43_50:SetAlignment(LUI.Alignment.Left)
	var_43_50:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 356, _1080p * 829, _1080p * 654, _1080p * 672)
	var_43_0:addElement(var_43_50)

	var_43_0.FieldUpgradeRechargeRate = var_43_50

	local var_43_51
	local var_43_52 = LUI.UIStyledText.new()

	var_43_52.id = "RechargeRateText"

	var_43_52:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_43_52:setText(Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_RATE"), 0)
	var_43_52:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_43_52:SetWordWrap(false)
	var_43_52:SetAlignment(LUI.Alignment.Left)
	var_43_52:SetOptOutRightToLeftAlignmentFlip(true)
	var_43_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 171, _1080p * 342, _1080p * 654, _1080p * 672)
	var_43_0:addElement(var_43_52)

	var_43_0.RechargeRateText = var_43_52

	local var_43_53
	local var_43_54 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_43_55 = LUI.UIBorder.new(var_43_54)

	var_43_55.id = "Line"

	var_43_55:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_43_55:SetAlpha(0.3, 0)
	var_43_55:SetBorderThicknessLeft(_1080p * 0, 0)
	var_43_55:SetBorderThicknessRight(_1080p * 0, 0)
	var_43_55:SetBorderThicknessTop(_1080p * 0, 0)
	var_43_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 97, _1080p * 522, _1080p * 701, _1080p * 701)
	var_43_0:addElement(var_43_55)

	var_43_0.Line = var_43_55

	local var_43_56

	if CONDITIONS.InFrontend(var_43_0) then
		local var_43_57 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_43_1
		})

		var_43_57.id = "LobbyMembersFooter"

		var_43_57:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_43_0:addElement(var_43_57)

		var_43_0.LobbyMembersFooter = var_43_57
	end

	local function var_43_58()
		return
	end

	var_43_0._sequences.DefaultSequence = var_43_58

	local var_43_59 = {}

	var_43_24:RegisterAnimationSequence("AR", var_43_59)

	local var_43_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 573
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 603
		}
	}

	var_43_26:RegisterAnimationSequence("AR", var_43_60)

	local var_43_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 575
		}
	}

	var_43_34:RegisterAnimationSequence("AR", var_43_61)

	local var_43_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 729
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 759
		}
	}

	var_43_36:RegisterAnimationSequence("AR", var_43_62)

	local var_43_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 759
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 789
		}
	}

	var_43_38:RegisterAnimationSequence("AR", var_43_63)

	local var_43_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 511
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 539
		}
	}

	var_43_40:RegisterAnimationSequence("AR", var_43_64)

	local var_43_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 695
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 723
		}
	}

	var_43_42:RegisterAnimationSequence("AR", var_43_65)

	local var_43_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 626
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 654
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 171
		}
	}

	var_43_50:RegisterAnimationSequence("AR", var_43_66)

	local var_43_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 626
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 654
		}
	}

	var_43_52:RegisterAnimationSequence("AR", var_43_67)

	local function var_43_68()
		var_43_24:AnimateSequence("AR")
		var_43_26:AnimateSequence("AR")
		var_43_34:AnimateSequence("AR")
		var_43_36:AnimateSequence("AR")
		var_43_38:AnimateSequence("AR")
		var_43_40:AnimateSequence("AR")
		var_43_42:AnimateSequence("AR")
		var_43_50:AnimateSequence("AR")
		var_43_52:AnimateSequence("AR")
	end

	var_43_0._sequences.AR = var_43_68

	var_43_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_43_69 = LUI.UIBindButton.new()

	var_43_69.id = "selfBindButton"

	var_43_0:addElement(var_43_69)

	var_43_0.bindButton = var_43_69

	var_43_0.bindButton:addEventHandler("button_secondary", function(arg_48_0, arg_48_1)
		if not arg_48_1.controller then
			local var_48_0 = var_43_1
		end

		ACTIONS.LeaveMenu(var_43_0)
	end)
	var_0_24(var_43_0, var_43_1, arg_43_1)

	if CONDITIONS.IsArabic(var_43_0) then
		ACTIONS.AnimateSequence(var_43_0, "AR")
	end

	return var_43_0
end

MenuBuilder.registerType("CPFieldUpgrades", CPFieldUpgrades)
LockTable(_M)
