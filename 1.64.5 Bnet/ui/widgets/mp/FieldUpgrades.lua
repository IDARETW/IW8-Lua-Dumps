module(..., package.seeall)

if Engine.DDJFBBJAIG() then
	LUI.FlowManager.RegisterFenceGroup("FieldUpgrades", {
		"StatsGroup"
	})
end

local var_0_0 = 150
local var_0_1 = var_0_0 + 50
local var_0_2 = 64

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
	arg_5_0.EquippedSlot:SetAlpha(arg_5_2 and arg_5_0.proMode == SUPER.ProMode.ENABLED and 1 or 0)

	if arg_5_2 then
		ACTIONS.AnimateSequence(arg_5_0.EquippedWidget, "TurnOn")

		local var_5_0 = ""
		local var_5_1 = arg_5_0._currentRef

		if var_5_1 == arg_5_0.upgrades[SUPER.Slot.LEFT].ref then
			var_5_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_INSTRUCTION", Engine.CBBHFCGDIC("LUA_MENU/PAD_LEFT_SHOULDER_BUTTON"))
		elseif var_5_1 == arg_5_0.upgrades[SUPER.Slot.RIGHT].ref then
			var_5_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_INSTRUCTION", Engine.CBBHFCGDIC("LUA_MENU/PAD_RIGHT_SHOULDER_BUTTON"))
		end

		if LUI.IsLastInputGamepad(arg_5_1) then
			arg_5_0.EquippedSlot:setText(var_5_0)
		end
	end
end

local function var_0_8(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = PROGRESSION.IsUnlocked(arg_6_1, LOOT.itemTypes.SUPER, arg_6_2)
	local var_6_1 = ""

	if not var_6_0 then
		var_6_1 = PROGRESSION.GetUnlockText(arg_6_1, LOOT.itemTypes.SUPER, arg_6_2)
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
	local var_8_1 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

	if var_0_3(arg_8_0, var_8_0) then
		var_8_1 = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
	end

	arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = var_8_1
	})
end

local function var_0_11(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = ONBOARDING_DATA.GetOnboardingProFieldUpgradeData()

	var_9_0.waitTime = arg_9_2 and 0 or var_9_0.waitTime

	LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingfeaturepopup", true, arg_9_1, false, var_9_0)
end

local function var_0_12(arg_10_0)
	var_0_10(arg_10_0)
	var_0_9(arg_10_0)

	local var_10_0 = arg_10_0._currentRef

	var_0_8(arg_10_0, arg_10_0._controllerIndex, var_10_0)
	var_0_7(arg_10_0, arg_10_0._controllerIndex, var_0_3(arg_10_0, var_10_0))
	arg_10_0.Grid:RefreshContent()
end

local function var_0_13(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = {
		displayTime = 2000,
		icon = arg_11_2,
		header = arg_11_3,
		description = arg_11_4 and Engine.CBBHFCGDIC(arg_11_4) or nil,
		type = LUI.ToastManager.NotificationType.FieldUpgradeMenu,
		controllerIndex = arg_11_1
	}

	arg_11_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_11_0
	})
end

local function var_0_14(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0._currentRef
	local var_12_1, var_12_2 = var_0_4(arg_12_0, var_12_0)

	local function var_12_3(arg_13_0)
		arg_12_0.upgrades[arg_13_0].ref = var_12_0
		arg_12_0.upgrades[arg_13_0].isActive = true

		var_0_13(arg_12_0, arg_12_1, SUPER.GetImage(var_12_0), Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_EQUIPPED"), SUPER.GetName(var_12_0))
	end

	if var_12_1 then
		if var_12_2 then
			var_0_5(arg_12_0, var_12_0, false)
		else
			var_0_5(arg_12_0, var_12_0, true)
			var_0_13(arg_12_0, arg_12_1, SUPER.GetImage(var_12_0), Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_EQUIPPED"), SUPER.GetName(var_12_0))
		end
	elseif arg_12_0.proMode == SUPER.ProMode.DISABLED then
		var_12_3(SUPER.Slot.LEFT)
	elseif arg_12_0.proMode == SUPER.ProMode.ENABLED then
		local var_12_4 = var_0_6(arg_12_0)

		if var_12_4 then
			var_12_3(var_12_4)
		else
			local var_12_5 = {
				refLeft = arg_12_0.upgrades[SUPER.Slot.LEFT].ref,
				refRight = arg_12_0.upgrades[SUPER.Slot.RIGHT].ref,
				refSelection = var_12_0,
				replaceSlot = function(arg_14_0)
					var_12_3(arg_14_0)
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "FieldUpgradesReplacePopup", true, arg_12_1, false, var_12_5, nil, true, false)
		end
	end

	if CONDITIONS.InGame() then
		Engine.EBHIFJCGBH("equip_item_ingame", 1)
	end

	var_0_12(arg_12_0)
end

local function var_0_15(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0._currentRef

	arg_15_0.FieldUpgradeName:setText(ToUpperCase(Engine.CBBHFCGDIC(SUPER.GetName(var_15_0))))
	arg_15_0.FieldUpgradeDescription:setText(Cac.GetSuperDesc(var_15_0))
	arg_15_0.RechargeRate:setText(SUPER.GetRechargeLabel(var_15_0))
	arg_15_0.RechargeRate:SetRGBFromTable(SUPER.GetRechargeColor(var_15_0))

	local var_15_1 = LOOT.GetItemID(LOOT.itemTypes.SUPER, var_15_0)
	local var_15_2 = Loot.HDJCADADF(arg_15_1, var_15_1)
	local var_15_3, var_15_4 = var_0_4(arg_15_0, var_15_0)

	if MLG.IsCDLActive(arg_15_1) and MatchRules.DFIIFBCIH(var_15_0) then
		arg_15_0.CDLRestricted:SetAlpha(1)
	else
		arg_15_0.CDLRestricted:SetAlpha(0)
	end

	arg_15_0.NewItemNotification:UpdateAlpha(var_15_2 and not var_15_3 and 1 or 0, 0, true)

	if var_15_0 == "super_tac_insert" then
		ACTIONS.AnimateSequence(arg_15_0, "ShowInfoMessage")
	else
		ACTIONS.AnimateSequence(arg_15_0, "HideInfoMessage")
	end

	if Engine.DDJFBBJAIG() then
		assert(arg_15_0.FadeCover)

		local var_15_5 = arg_15_0._upgradeSelectionComplete and var_0_0 or 10

		if not arg_15_0._prevImage then
			var_15_5 = 0
		end

		arg_15_0.FadeCover:SetAlpha(1, var_15_5, LUI.EASING.inQuadratic)

		arg_15_0.FadeCover:Wait(var_0_0, true).onComplete = function()
			if arg_15_0._upgradeSelectionComplete then
				assert(arg_15_0.Showcase)
				arg_15_0.Showcase:setImage(RegisterMaterial(Cac.GetSuperFullImage(var_15_0)))
				arg_15_0.FadeCover:SetAlpha(0, var_0_1, LUI.EASING.outQuadratic)
				arg_15_0.Showcase:SetScale(arg_15_0.scaleAdjust, 0)
				arg_15_0.Showcase:SetScale(arg_15_0.scaleAdjust + 0.015, 2500, LUI.EASING.outQuadratic)

				arg_15_0._prevImage = Cac.GetSuperFullImage(var_15_0)
			end
		end
		arg_15_0._upgradeSelectionComplete = false
		arg_15_0:Wait(var_0_0 - 10, true).onComplete = function()
			arg_15_0._upgradeSelectionComplete = true
		end
	end

	var_0_12(arg_15_0)
end

local function var_0_16(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0._currentRef
	local var_18_1 = Engine.CBBHFCGDIC(SUPER.GetName(var_18_0))

	Engine.DFCGFCGBFD(SUPER.GetTutorialVideo(var_18_0), VideoPlaybackFlags.LOOP + VideoPlaybackFlags.MUTE)
	LUI.FlowManager.RequestPopupMenu(nil, "TutorialVideoMaximized", true, arg_18_1, false, {
		title = var_18_1,
		videoRef = SUPER.GetTutorialVideo(var_18_0),
		videoFlags = VideoPlaybackFlags.LOOP + VideoPlaybackFlags.MUTE
	})
end

local function var_0_17(arg_19_0, arg_19_1)
	local function var_19_0(arg_20_0, arg_20_1, arg_20_2)
		local var_20_0 = arg_20_1 + arg_20_2 * arg_19_0.Grid:GetNumColumns()

		arg_20_0.ref = arg_19_0._allRefs[var_20_0 + 1]

		function arg_20_0.MenuButtonOver(arg_21_0, arg_21_1)
			arg_19_0._currentRef = arg_21_0.ref

			var_0_15(arg_19_0, arg_19_1)
		end

		function arg_20_0.MenuButtonAction(arg_22_0, arg_22_1)
			var_0_14(arg_19_0, arg_19_1)
		end

		local var_20_1 = MatchRules.DFIIFBCIH(arg_20_0.ref) and not CONDITIONS.IsMagmaGameMode()
		local var_20_2 = PROGRESSION.IsUnlocked(arg_19_1, LOOT.itemTypes.SUPER, arg_20_0.ref) and not var_20_1
		local var_20_3 = var_0_3(arg_19_0, arg_20_0.ref)

		arg_20_0:RefreshData(SUPER.GetImage(arg_20_0.ref), var_20_2, var_20_3, var_20_1, arg_20_0.ref)
	end

	local function var_19_1()
		local var_23_0 = 1

		for iter_23_0, iter_23_1 in ipairs(arg_19_0._allRefs) do
			if iter_23_1 == arg_19_0.upgrades[SUPER.Slot.LEFT].ref then
				var_23_0 = iter_23_0

				break
			end
		end

		return arg_19_0.Grid:GetPositionForIndex(var_23_0 - 1, {
			relativePosition = false
		})
	end

	local var_19_2 = math.min(#arg_19_0._allRefs, arg_19_0._defaultMaxVisibleColumns)

	arg_19_0.Grid:SetMaxVisibleColumns(var_19_2)
	arg_19_0.Grid:SetNumChildren(#arg_19_0._allRefs)
	arg_19_0.Grid:SetDefaultFocus(var_19_1)
	arg_19_0.Grid:SetRefreshChild(var_19_0)
	arg_19_0:addEventHandler("menu_create", function()
		arg_19_0.Grid:RefreshContent()
	end)
end

local function var_0_18(arg_25_0, arg_25_1)
	local function var_25_0()
		arg_25_0.upgrades[SUPER.Slot.LEFT].isActive = false
		arg_25_0.upgrades[SUPER.Slot.RIGHT].isActive = false

		var_0_12(arg_25_0)
	end

	local var_25_1 = Engine.CBBHFCGDIC("LUA_MENU/DESELECT_ALL")

	if arg_25_1 then
		arg_25_0.bindButton:registerEventHandler("button_alt1", function(arg_27_0, arg_27_1)
			var_25_0()

			if arg_27_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		end)
	else
		arg_25_0.bindButton:registerEventHandler("button_alt1", nil)

		var_25_1 = ""
	end

	arg_25_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		priority = 3,
		helper_text = var_25_1
	})
end

local function var_0_19(arg_28_0)
	local var_28_0 = arg_28_0.upgrades[SUPER.Slot.LEFT]

	arg_28_0.upgrades[SUPER.Slot.LEFT] = arg_28_0.upgrades[SUPER.Slot.RIGHT]
	arg_28_0.upgrades[SUPER.Slot.RIGHT] = var_28_0
end

local function var_0_20(arg_29_0, arg_29_1)
	local var_29_0 = "button_right_trigger"
	local var_29_1 = Engine.CBBHFCGDIC("LUA_MENU/SWAP")

	if arg_29_1 then
		arg_29_0.bindButton:registerEventHandler(var_29_0, function(arg_30_0, arg_30_1)
			if arg_30_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end

			var_0_19(arg_29_0)
			var_0_12(arg_29_0)
		end)
	else
		arg_29_0.bindButton:registerEventHandler(var_29_0, nil)

		var_29_1 = ""
	end

	arg_29_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		helper_text = var_29_1,
		button_ref = var_29_0,
		container = arg_29_0.UpgradesEquipped:GetSwapContainer()
	})
end

local function var_0_21(arg_31_0, arg_31_1)
	local var_31_0 = Engine.CBBHFCGDIC("LUA_MENU/PRO_HELP")
	local var_31_1 = "button_alt2"

	if arg_31_1 and CONDITIONS.InFrontend() then
		arg_31_0.bindButton:registerEventHandler(var_31_1, function(arg_32_0, arg_32_1)
			var_0_11(arg_32_0, arg_32_0._controllerIndex, true)

			if arg_32_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		end)
	else
		arg_31_0.bindButton:registerEventHandler(var_31_1, nil)

		var_31_0 = ""
	end

	arg_31_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 4,
		helper_text = var_31_0,
		button_ref = var_31_1
	})
end

local function var_0_22(arg_33_0, arg_33_1)
	local var_33_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_LOCKED", arg_33_0._proModeUnlockText)

	if arg_33_0._proModeAvailable then
		ACTIONS.AnimateSequence(arg_33_0.UpgradesEquipped, "ProAvailable")

		if arg_33_0.proMode == SUPER.ProMode.ENABLED then
			var_33_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_DEACTIVATE")
		else
			var_33_0 = Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_ACTIVATE")
		end

		arg_33_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			button_ref = "button_left_trigger",
			helper_text = var_33_0,
			container = arg_33_0.UpgradesEquipped:GetProModeContainer()
		})
	elseif CONDITIONS.AreRestrictionsActive(arg_33_1) then
		ACTIONS.AnimateSequence(arg_33_0.UpgradesEquipped, "ProHidden")
	else
		ACTIONS.AnimateSequence(arg_33_0.UpgradesEquipped, "ProUnavailable")
	end
end

local function var_0_23(arg_34_0, arg_34_1)
	if not arg_34_0._proModeAvailable then
		return false
	end

	local var_34_0 = false

	if arg_34_0.proMode == SUPER.ProMode.ENABLED then
		arg_34_0.proMode = SUPER.ProMode.DISABLED
	elseif arg_34_0.proMode == SUPER.ProMode.DISABLED then
		arg_34_0.proMode = SUPER.ProMode.ENABLED
		var_34_0 = true

		local var_34_1 = PROGRESSION.GetPlayerRankIcon(arg_34_1)

		var_0_13(arg_34_0, arg_34_1, var_34_1, Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_PRO_ACTIVATED"))
	end

	var_0_18(arg_34_0, var_34_0)
	var_0_21(arg_34_0, var_34_0)
	var_0_20(arg_34_0, var_34_0)
	var_0_22(arg_34_0, arg_34_1)

	if arg_34_0.upgrades[SUPER.Slot.LEFT].ref == Cac.superNoneValue then
		var_0_19(arg_34_0)
	end

	arg_34_0.upgrades[SUPER.Slot.RIGHT].ref = Cac.superNoneValue
	arg_34_0.upgrades[SUPER.Slot.RIGHT].isActive = false

	return true
end

local function var_0_24(arg_35_0, arg_35_1)
	local var_35_0 = PROGRESSION.GetPlayerRank(arg_35_1)
	local var_35_1 = arg_35_0.upgrades[SUPER.Slot.RIGHT].ref ~= Cac.superNoneValue
	local var_35_2 = false

	arg_35_0.proMode = SUPER.ProMode.DISABLED

	if CONDITIONS.AreRestrictionsActive(arg_35_1) then
		arg_35_0._proModeAvailable = false
	else
		arg_35_0._proModeAvailable = PROGRESSION.IsUnlocked(arg_35_1, LOOT.itemTypes.FEATURE, LOOT.fieldUpgradeProRef) or CONDITIONS.IsDevelopmentBuild()
	end

	arg_35_0._proModeUnlockText = PROGRESSION.GetUnlockText(arg_35_1, LOOT.itemTypes.FEATURE, LOOT.fieldUpgradeProRef)

	if arg_35_0._proModeAvailable then
		if var_35_1 then
			arg_35_0.proMode = SUPER.ProMode.ENABLED
			var_35_2 = true
		end

		if arg_35_0.BRWarningInfoFEPro then
			arg_35_0.BRWarningInfoFEPro:SetupWarning("LUA_MENU/BR_WARNING_FIELD_UPGRADE_PRO_DESC")
			ACTIONS.AnimateSequence(arg_35_0, "ShowProPerkWarning")
		end
	else
		arg_35_0.upgrades[SUPER.Slot.RIGHT].ref = Cac.superNoneValue
	end

	var_0_18(arg_35_0, var_35_2)
	var_0_21(arg_35_0, var_35_2)
	var_0_20(arg_35_0, var_35_2)
	var_0_22(arg_35_0, arg_35_1)
end

local function var_0_25(arg_36_0, arg_36_1)
	if arg_36_0.upgrades[SUPER.Slot.LEFT].ref == Cac.superNoneValue then
		var_0_19(arg_36_0)
	end

	assert(arg_36_0.upgrades[SUPER.Slot.LEFT].ref ~= Cac.superNoneValue)
	arg_36_0._playerData.fieldUpgrades[0]:set(arg_36_0.upgrades[SUPER.Slot.LEFT].ref)
	arg_36_0._playerData.fieldUpgrades[1]:set(arg_36_0.upgrades[SUPER.Slot.RIGHT].ref)
	ACTIONS.UploadStats(arg_36_0, arg_36_1)

	local var_36_0 = LUI.DataSourceInControllerModel.new("cg.players.selectedLoadout")

	if not Engine.DDJFBBJAIG() and var_36_0:GetValue(arg_36_1) then
		Engine.EBHIFJCGBH("class_edit", var_36_0:GetValue(arg_36_1))
	end
end

local function var_0_26(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADES"))

	arg_37_0.scaleAdjust = 0
	arg_37_0.ButtonAction = var_0_14
	arg_37_0.ButtonOver = var_0_15
	arg_37_0._allRefs = SUPER.GetAllRefs()
	arg_37_0._currentRef = arg_37_0._allRefs[1]
	arg_37_0._controllerIndex = arg_37_1
	arg_37_0._defaultMaxVisibleColumns = arg_37_0.Grid:GetMaxVisibleColumns()
	arg_37_0._playerData = PlayerData.BFFBGAJGD(arg_37_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	arg_37_0._upgradeSelectionComplete = true
	arg_37_0._prevImage = nil
	arg_37_0.upgrades = {
		[SUPER.Slot.LEFT] = {
			isActive = true,
			ref = arg_37_0._playerData.fieldUpgrades[0]:get()
		},
		[SUPER.Slot.RIGHT] = {
			isActive = true,
			ref = arg_37_0._playerData.fieldUpgrades[1]:get()
		}
	}

	arg_37_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	;(function()
		local var_38_0 = LAYOUT.GetTextWidth(arg_37_0.FieldUpgradeRechargeRate)
		local var_38_1 = arg_37_0.FieldUpgradeRechargeRate:GetCurrentAnchorsAndPositions().left
		local var_38_2 = 4 * _1080p

		if IsLanguageChinese() then
			var_38_2 = 8 * _1080p
		end

		arg_37_0.RechargeRate:SetLeft(var_38_1 + var_38_0 + var_38_2)
	end)()
	var_0_24(arg_37_0, arg_37_1)
	var_0_17(arg_37_0, arg_37_1)
	var_0_9(arg_37_0)

	local function var_37_0(arg_39_0, arg_39_1)
		if not LUI.IsLastInputGamepad(arg_39_1.controllerIndex) then
			arg_39_0.EquippedSlot:setText("")
		end

		if Engine.DDJFBBJAIG() then
			LAYOUT.AddAspectRatioFadeFrame(arg_39_0, arg_37_1, arg_39_0.Showcase)
		end
	end

	arg_37_0:addAndCallEventHandler("update_input_type", var_37_0, {
		controllerIndex = arg_37_1
	})
	arg_37_0:addEventHandler("menu_close", function(arg_40_0, arg_40_1)
		var_0_25(arg_37_0, arg_37_1)

		if Engine.DDJFBBJAIG() then
			Engine.EBCGADABJ()
		end
	end)

	if Engine.DDJFBBJAIG() then
		if Engine.CGABICJHAI() then
			local function var_37_1()
				local var_41_0 = CoD.GetAspectRatioScaleAdjust(0.2)

				arg_37_0.Showcase:SetScale(var_41_0)

				arg_37_0.scaleAdjust = var_41_0
			end

			ACTIONS.ScaleFullscreen(arg_37_0.FadeCover)
			arg_37_0:addAndCallEventHandler("onVideoChange", var_37_1)
		end
	else
		ACTIONS.ScaleFullscreen(arg_37_0.InGameMenuBackground)
	end

	ACTIONS.ScaleFullscreen(arg_37_0.BackgroundGradient)

	if not Engine.DDJFBBJAIG() then
		arg_37_0:addEventHandler("menu_create", function()
			arg_37_0:AddButtonHelperText({
				clickable = true,
				priority = 5,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_37_0.bindButton:addEventHandler("button_start", function(arg_43_0, arg_43_1)
			LUI.FlowManager.RequestCloseAllMenus(arg_37_0.id, false, arg_43_1.controller)

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_37_0)
	end

	arg_37_0.bindButton:addEventHandler("button_left_trigger", function(arg_44_0, arg_44_1)
		if var_0_23(arg_37_0, arg_37_1) then
			if arg_44_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end

			var_0_12(arg_37_0)
		end
	end)

	if LUI.IsLastInputKeyboardMouse(arg_37_1) then
		arg_37_0.Grid:GainFocus()
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_37_0, "AR")
	elseif IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_37_0, "CH")

		if IsLanguageTraditionalChinese() then
			arg_37_0.FieldUpgradeDescription:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 661, _1080p * 568, _1080p * 594)
		end
	end

	if Engine.DDJFBBJAIG() then
		local function var_37_2(arg_45_0, arg_45_1)
			if not CONDITIONS.IsMagmaGameMode() and not Onboarding.ProFieldUpgrade.WasCompleted(arg_45_0, arg_45_1) then
				var_0_11(arg_45_0, arg_45_1)
				Onboarding.ProFieldUpgrade.MarkCompleted(arg_45_0, arg_45_1)
			end
		end

		if not Onboarding.FieldUpgrade.WasCompleted(arg_37_0, arg_37_1) then
			local var_37_3

			if CONDITIONS.IsWZWipFlowEnabled() and CONDITIONS.AreWZLoadoutsEnabled() then
				var_37_3 = ONBOARDING_DATA.GetOnboardingCH2FieldUpgradeData()
			else
				var_37_3 = ONBOARDING_DATA.GetOnboardingFieldUpgradeData()
			end

			if arg_37_0._proModeAvailable then
				local function var_37_4(arg_46_0, arg_46_1)
					ACTIONS.LeaveMenu(arg_46_0)
					var_37_2(arg_46_0, arg_46_1)
				end

				var_37_3.confirmButton.action = var_37_4
			end

			LUI.FlowManager.RequestPopupMenu(arg_37_0, "onboardingpopup", true, arg_37_1, false, var_37_3)
			Onboarding.FieldUpgrade.MarkCompleted(arg_37_0, arg_37_0._controllerIndex)
		elseif arg_37_0._proModeAvailable then
			var_37_2(arg_37_0, arg_37_1)
		end
	end

	if not IsLanguageArabic() then
		arg_37_0.NewItemNotification:SetupLeftAlignment()
	end

	if arg_37_0._proModeAvailable and arg_37_0.BRWarningInfo then
		arg_37_0.BRWarningInfo:SetupWarning("LUA_MENU/BR_WARNING_FIELD_UPGRADE_DESC")
		ACTIONS.AnimateSequence(arg_37_0.UpgradesEquipped.BRWarning, "Show")
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_37_0, "WZSetup")
		LAYOUT.SetupScalingBackgroundVignette(arg_37_0)
	end
end

function FieldUpgrades(arg_47_0, arg_47_1)
	local var_47_0 = LUI.UIElement.new()

	var_47_0.id = "FieldUpgrades"
	var_47_0._animationSets = var_47_0._animationSets or {}
	var_47_0._sequences = var_47_0._sequences or {}

	local var_47_1 = arg_47_1 and arg_47_1.controllerIndex

	if not var_47_1 and not Engine.DDJFBBJAIG() then
		var_47_1 = var_47_0:getRootController()
	end

	assert(var_47_1)

	var_47_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_47_1
	})
	var_47_0.HelperBar.id = "HelperBar"

	var_47_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_47_0.HelperBar:setPriority(10)
	var_47_0:addElement(var_47_0.HelperBar)

	local var_47_2 = var_47_0
	local var_47_3

	if CONDITIONS.InFrontend() then
		local var_47_4 = LUI.UIImage.new()

		var_47_4.id = "Background"

		var_47_4:setImage(RegisterMaterial("mp_killstreak_background"), 0)
		var_47_0:addElement(var_47_4)

		var_47_0.Background = var_47_4
	end

	local var_47_5
	local var_47_6 = {
		worldBlur = 5,
		controllerIndex = var_47_1
	}
	local var_47_7 = MenuBuilder.BuildRegisteredType("WorldBlur", var_47_6)

	var_47_7.id = "WorldBlur"

	var_47_0:addElement(var_47_7)

	var_47_0.WorldBlur = var_47_7

	local var_47_8

	if CONDITIONS.InGame() then
		local var_47_9 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_47_1
		})

		var_47_9.id = "InGameMenuBackground"

		var_47_9:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_47_0:addElement(var_47_9)

		var_47_0.InGameMenuBackground = var_47_9
	end

	local var_47_10

	if Engine.DDJFBBJAIG() then
		local var_47_11 = LUI.UIImage.new()

		var_47_11.id = "Showcase"

		var_47_11:setImage(RegisterMaterial("frontend_field_upgrade_support_box"), 0)
		var_47_0:addElement(var_47_11)

		var_47_0.Showcase = var_47_11
	end

	local var_47_12
	local var_47_13 = LUI.UIImage.new()

	var_47_13.id = "BackgroundGradient"

	var_47_13:SetRGBFromInt(0, 0)
	var_47_13:SetAlpha(0.75, 0)
	var_47_13:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_47_13:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1322, 0, 0)
	var_47_0:addElement(var_47_13)

	var_47_0.BackgroundGradient = var_47_13

	local var_47_14

	if Engine.DDJFBBJAIG() then
		local var_47_15 = LUI.UIImage.new()

		var_47_15.id = "FadeCover"

		var_47_15:SetRGBFromInt(0, 0)
		var_47_15:SetAlpha(0, 0)
		var_47_0:addElement(var_47_15)

		var_47_0.FadeCover = var_47_15
	end

	local var_47_16
	local var_47_17 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_47_1
	})

	var_47_17.id = "Vignette"

	var_47_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_47_0:addElement(var_47_17)

	var_47_0.Vignette = var_47_17

	local var_47_18
	local var_47_19 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 16,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_47_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("FieldUpgradesButton", {
				controllerIndex = var_47_1
			})
		end,
		refreshChild = function(arg_49_0, arg_49_1, arg_49_2)
			return
		end,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 84,
		rowHeight = _1080p * 116,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_47_20 = LUI.UIGrid.new(var_47_19)

	var_47_20.id = "Grid"

	var_47_20:setUseStencil(false)
	var_47_20:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 100, _1080p * -100, _1080p * -238, _1080p * -75)
	var_47_0:addElement(var_47_20)

	var_47_0.Grid = var_47_20

	local var_47_21
	local var_47_22 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_47_1
	})

	var_47_22.id = "UnlockCriteria"

	var_47_22.UnlockDesc:SetRight(_1080p * 340, 0)
	var_47_22.UnlockDesc:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_47_22.UnlockDesc:setText("LOCKED", 0)
	var_47_22.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_47_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 456, _1080p * 700, _1080p * 732)
	var_47_0:addElement(var_47_22)

	var_47_0.UnlockCriteria = var_47_22

	local var_47_23
	local var_47_24 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_47_1
	})

	var_47_24.id = "EquippedWidget"

	var_47_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 250, _1080p * 747, _1080p * 777)
	var_47_0:addElement(var_47_24)

	var_47_0.EquippedWidget = var_47_24

	local var_47_25
	local var_47_26 = LUI.UIText.new()

	var_47_26.id = "EquippedSlot"

	var_47_26:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_47_26:setText("", 0)
	var_47_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_47_26:SetAlignment(LUI.Alignment.Left)
	var_47_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 572, _1080p * 787, _1080p * 805)
	var_47_0:addElement(var_47_26)

	var_47_0.EquippedSlot = var_47_26

	local var_47_27
	local var_47_28 = LUI.UIText.new()

	var_47_28.id = "FieldUpgradeName"

	var_47_28:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_47_28:setText("", 0)
	var_47_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_47_28:SetAlignment(LUI.Alignment.Left)
	var_47_28:SetOptOutRightToLeftAlignmentFlip(true)
	var_47_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 967, _1080p * 514, _1080p * 564)
	var_47_0:addElement(var_47_28)

	var_47_0.FieldUpgradeName = var_47_28

	local var_47_29
	local var_47_30 = LUI.UIStyledText.new()

	var_47_30.id = "FieldUpgradeDescription"

	var_47_30:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_47_30:setText("", 0)
	var_47_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_47_30:SetAlignment(LUI.Alignment.Left)
	var_47_30:SetOptOutRightToLeftAlignmentFlip(true)
	var_47_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 661, _1080p * 568, _1080p * 588)
	var_47_0:addElement(var_47_30)

	var_47_0.FieldUpgradeDescription = var_47_30

	local var_47_31

	if CONDITIONS.InFrontendPublicMP() then
		local var_47_32 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_47_1
		})

		var_47_32.id = "MPPlayerDetails"

		var_47_32:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_47_0:addElement(var_47_32)

		var_47_0.MPPlayerDetails = var_47_32
	end

	local var_47_33
	local var_47_34 = MenuBuilder.BuildRegisteredType("FieldUpgradesEquipped", {
		controllerIndex = var_47_1
	})

	var_47_34.id = "UpgradesEquipped"

	var_47_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1387, _1080p * 1576, _1080p * 707, _1080p * 787)
	var_47_0:addElement(var_47_34)

	var_47_0.UpgradesEquipped = var_47_34

	local var_47_35
	local var_47_36 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_47_1
	})

	var_47_36.id = "MenuTitle"

	var_47_36.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADES"), 0)
	var_47_36.Line:SetLeft(0, 0)
	var_47_36:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_47_0:addElement(var_47_36)

	var_47_0.MenuTitle = var_47_36

	local var_47_37
	local var_47_38 = LUI.UIStyledText.new()

	var_47_38.id = "RechargeRate"

	var_47_38:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_47_38:setText("", 0)
	var_47_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_47_38:SetAlignment(LUI.Alignment.Left)
	var_47_38:SetOptOutRightToLeftAlignmentFlip(true)
	var_47_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 299, _1080p * 772, _1080p * 634, _1080p * 658)
	var_47_0:addElement(var_47_38)

	var_47_0.RechargeRate = var_47_38

	local var_47_39
	local var_47_40 = LUI.UIStyledText.new()

	var_47_40.id = "FieldUpgradeRechargeRate"

	var_47_40:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_47_40:setText(Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_RATE"), 0)
	var_47_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_47_40:SetWordWrap(false)
	var_47_40:SetAlignment(LUI.Alignment.Left)
	var_47_40:SetOptOutRightToLeftAlignmentFlip(true)
	var_47_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 285, _1080p * 634, _1080p * 658)
	var_47_0:addElement(var_47_40)

	var_47_0.FieldUpgradeRechargeRate = var_47_40

	local var_47_41

	if CONDITIONS.InFrontend() then
		local var_47_42 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_47_1
		})

		var_47_42.id = "LobbyMembersFooter"

		var_47_42:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_47_0:addElement(var_47_42)

		var_47_0.LobbyMembersFooter = var_47_42
	end

	local var_47_43

	if CONDITIONS.InGame() then
		var_47_43 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_47_1
		})
		var_47_43.id = "InGameMenuTimerStatus"

		var_47_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_47_0:addElement(var_47_43)

		var_47_0.InGameMenuTimerStatus = var_47_43
	end

	local var_47_44
	local var_47_45 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_47_1
	})

	var_47_45.id = "NewItemNotification"

	var_47_45:SetAlpha(0, 0)
	var_47_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 192, _1080p * 747, _1080p * 777)
	var_47_0:addElement(var_47_45)

	var_47_0.NewItemNotification = var_47_45

	local var_47_46
	local var_47_47 = LUI.UIImage.new()

	var_47_47.id = "InfoMessageIcon"

	var_47_47:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_47_47:setImage(RegisterMaterial("hud_info_alert"), 0)
	var_47_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1347, _1080p * 1377, _1080p * 528, _1080p * 558)
	var_47_0:addElement(var_47_47)

	var_47_0.InfoMessageIcon = var_47_47

	local var_47_48
	local var_47_49 = LUI.UIStyledText.new()

	var_47_49.id = "InfoMessage"

	var_47_49:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_47_49:setText(Engine.CBBHFCGDIC("LUA_MENU/TACTICAL_INSERTION_DISCLAIMER"), 0)
	var_47_49:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_47_49:SetAlignment(LUI.Alignment.Left)
	var_47_49:SetOptOutRightToLeftAlignmentFlip(true)
	var_47_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1387, _1080p * 1790, _1080p * 531, _1080p * 555)
	var_47_0:addElement(var_47_49)

	var_47_0.InfoMessage = var_47_49

	local var_47_50
	local var_47_51 = MenuBuilder.BuildRegisteredType("CDLRestricted", {
		controllerIndex = var_47_1
	})

	var_47_51.id = "CDLRestricted"

	var_47_51:SetAlpha(0, 0)
	var_47_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 403, _1080p * 787, _1080p * 817)
	var_47_0:addElement(var_47_51)

	var_47_0.CDLRestricted = var_47_51

	local var_47_52

	if CONDITIONS.IsMagmaGameMode() then
		var_47_52 = MenuBuilder.BuildRegisteredType("BRWarningInfo", {
			controllerIndex = var_47_1
		})
		var_47_52.id = "BRWarningInfo"

		var_47_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 739, _1080p * 478, _1080p * 508)
		var_47_0:addElement(var_47_52)

		var_47_0.BRWarningInfo = var_47_52
	end

	local var_47_53

	if CONDITIONS.IsMagmaGameMode() then
		var_47_53 = MenuBuilder.BuildRegisteredType("BRWarningInfo", {
			controllerIndex = var_47_1
		})
		var_47_53.id = "BRWarningInfoFEPro"

		var_47_53:SetAlpha(0, 0)
		var_47_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 739, _1080p * 478, _1080p * 508)
		var_47_0:addElement(var_47_53)

		var_47_0.BRWarningInfoFEPro = var_47_53
	end

	local var_47_54

	if Engine.DDJFBBJAIG() then
		local var_47_55 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_47_1
		})

		var_47_55.id = "CDLRestrictionTag"

		var_47_55.CDLInfo:SetAlpha(1, 0)
		var_47_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_47_0:addElement(var_47_55)

		var_47_0.CDLRestrictionTag = var_47_55
	end

	local var_47_56
	local var_47_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_47:RegisterAnimationSequence("DefaultSequence", var_47_57)

	local var_47_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_49:RegisterAnimationSequence("DefaultSequence", var_47_58)

	local function var_47_59()
		var_47_47:AnimateSequence("DefaultSequence")
		var_47_49:AnimateSequence("DefaultSequence")
	end

	var_47_0._sequences.DefaultSequence = var_47_59

	local var_47_60
	local var_47_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 372
		}
	}

	var_47_22:RegisterAnimationSequence("Splitscreen", var_47_61)

	local var_47_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 387
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 417
		}
	}

	var_47_24:RegisterAnimationSequence("Splitscreen", var_47_62)

	local var_47_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 347
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 365
		}
	}

	var_47_26:RegisterAnimationSequence("Splitscreen", var_47_63)

	local var_47_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 204
		}
	}

	var_47_28:RegisterAnimationSequence("Splitscreen", var_47_64)

	local var_47_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		}
	}

	var_47_30:RegisterAnimationSequence("Splitscreen", var_47_65)

	local var_47_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 247
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1682
		}
	}

	var_47_34:RegisterAnimationSequence("Splitscreen", var_47_66)

	local var_47_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 298
		}
	}

	var_47_38:RegisterAnimationSequence("Splitscreen", var_47_67)

	local var_47_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 298
		}
	}

	var_47_40:RegisterAnimationSequence("Splitscreen", var_47_68)

	if CONDITIONS.InGame() then
		local var_47_69 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 760
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1160
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 34
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 84
			}
		}

		var_47_43:RegisterAnimationSequence("Splitscreen", var_47_69)
	end

	local var_47_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 412
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 442
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1404
		}
	}

	var_47_47:RegisterAnimationSequence("Splitscreen", var_47_70)

	local var_47_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1790
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 415
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_47_49:RegisterAnimationSequence("Splitscreen", var_47_71)

	local function var_47_72()
		var_47_22:AnimateSequence("Splitscreen")
		var_47_24:AnimateSequence("Splitscreen")
		var_47_26:AnimateSequence("Splitscreen")
		var_47_28:AnimateSequence("Splitscreen")
		var_47_30:AnimateSequence("Splitscreen")
		var_47_34:AnimateSequence("Splitscreen")
		var_47_38:AnimateSequence("Splitscreen")
		var_47_40:AnimateSequence("Splitscreen")

		if CONDITIONS.InGame() then
			var_47_43:AnimateSequence("Splitscreen")
		end

		var_47_47:AnimateSequence("Splitscreen")
		var_47_49:AnimateSequence("Splitscreen")
	end

	var_47_0._sequences.Splitscreen = var_47_72

	local var_47_73
	local var_47_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 703
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 735
		}
	}

	var_47_22:RegisterAnimationSequence("AR", var_47_74)

	local var_47_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 739
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		}
	}

	var_47_26:RegisterAnimationSequence("AR", var_47_75)

	local var_47_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 701
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 517
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 567
		}
	}

	var_47_28:RegisterAnimationSequence("AR", var_47_76)

	local var_47_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 599
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 567
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 701
		}
	}

	var_47_30:RegisterAnimationSequence("AR", var_47_77)

	local var_47_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 663
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 631
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 182
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		}
	}

	var_47_38:RegisterAnimationSequence("AR", var_47_78)

	local var_47_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 663
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 631
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 432
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 182
		}
	}

	var_47_40:RegisterAnimationSequence("AR", var_47_79)

	local function var_47_80()
		var_47_22:AnimateSequence("AR")
		var_47_26:AnimateSequence("AR")
		var_47_28:AnimateSequence("AR")
		var_47_30:AnimateSequence("AR")
		var_47_38:AnimateSequence("AR")
		var_47_40:AnimateSequence("AR")
	end

	var_47_0._sequences.AR = var_47_80

	local var_47_81
	local var_47_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 703
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 735
		}
	}

	var_47_22:RegisterAnimationSequence("CH", var_47_82)

	local var_47_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 701
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 517
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 567
		}
	}

	var_47_28:RegisterAnimationSequence("CH", var_47_83)

	local var_47_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 594
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 574
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 701
		}
	}

	var_47_30:RegisterAnimationSequence("CH", var_47_84)

	local var_47_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 655
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 631
		}
	}

	var_47_38:RegisterAnimationSequence("CH", var_47_85)

	local var_47_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 655
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 631
		}
	}

	var_47_40:RegisterAnimationSequence("CH", var_47_86)

	local function var_47_87()
		var_47_22:AnimateSequence("CH")
		var_47_28:AnimateSequence("CH")
		var_47_30:AnimateSequence("CH")
		var_47_38:AnimateSequence("CH")
		var_47_40:AnimateSequence("CH")
	end

	var_47_0._sequences.CH = var_47_87

	local var_47_88
	local var_47_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_47:RegisterAnimationSequence("ShowInfoMessage", var_47_89)

	local var_47_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_49:RegisterAnimationSequence("ShowInfoMessage", var_47_90)

	local function var_47_91()
		var_47_47:AnimateSequence("ShowInfoMessage")
		var_47_49:AnimateSequence("ShowInfoMessage")
	end

	var_47_0._sequences.ShowInfoMessage = var_47_91

	local var_47_92
	local var_47_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_47:RegisterAnimationSequence("HideInfoMessage", var_47_93)

	local var_47_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_49:RegisterAnimationSequence("HideInfoMessage", var_47_94)

	local function var_47_95()
		var_47_47:AnimateSequence("HideInfoMessage")
		var_47_49:AnimateSequence("HideInfoMessage")
	end

	var_47_0._sequences.HideInfoMessage = var_47_95

	local var_47_96

	if CONDITIONS.IsMagmaGameMode() then
		local var_47_97 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 440
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 470
			}
		}

		var_47_52:RegisterAnimationSequence("ShowProPerkWarning", var_47_97)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_47_98 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 478
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 508
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_47_53:RegisterAnimationSequence("ShowProPerkWarning", var_47_98)
	end

	local function var_47_99()
		if CONDITIONS.IsMagmaGameMode() then
			var_47_52:AnimateSequence("ShowProPerkWarning")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_47_53:AnimateSequence("ShowProPerkWarning")
		end
	end

	var_47_0._sequences.ShowProPerkWarning = var_47_99

	local var_47_100
	local var_47_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_47_0.UnlockCriteria.UnlockDesc
		}
	}

	var_47_22:RegisterAnimationSequence("WZSetup", var_47_101)

	local var_47_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_47_28:RegisterAnimationSequence("WZSetup", var_47_102)

	local var_47_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_47_30:RegisterAnimationSequence("WZSetup", var_47_103)

	local var_47_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_47_38:RegisterAnimationSequence("WZSetup", var_47_104)

	local var_47_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_47_49:RegisterAnimationSequence("WZSetup", var_47_105)

	local var_47_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_47_51:RegisterAnimationSequence("WZSetup", var_47_106)

	local function var_47_107()
		var_47_22:AnimateSequence("WZSetup")
		var_47_28:AnimateSequence("WZSetup")
		var_47_30:AnimateSequence("WZSetup")
		var_47_38:AnimateSequence("WZSetup")
		var_47_49:AnimateSequence("WZSetup")
		var_47_51:AnimateSequence("WZSetup")
	end

	var_47_0._sequences.WZSetup = var_47_107

	var_47_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_47_108 = LUI.UIBindButton.new()

	var_47_108.id = "selfBindButton"

	var_47_0:addElement(var_47_108)

	var_47_0.bindButton = var_47_108

	var_47_0.bindButton:addEventHandler("button_secondary", function(arg_58_0, arg_58_1)
		if not arg_58_1.controller then
			local var_58_0 = var_47_1
		end

		ACTIONS.LeaveMenu(var_47_0)
	end)
	var_0_26(var_47_0, var_47_1, arg_47_1)
	ACTIONS.AnimateSequence(var_47_0, "DefaultSequence")

	if CONDITIONS.IsSplitscreen() then
		ACTIONS.AnimateSequence(var_47_0, "Splitscreen")
	end

	return var_47_0
end

MenuBuilder.registerType("FieldUpgrades", FieldUpgrades)
LockTable(_M)
