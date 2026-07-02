module(..., package.seeall)

if Engine.DDJFBBJAIG() then
	LUI.FlowManager.RegisterFenceGroup("LoadoutSelect", {
		"StatsGroup"
	})
end

local var_0_0 = -0.8
local var_0_1 = 0.8
local var_0_2 = -0.8
local var_0_3 = 0.8
local var_0_4 = 3500
local var_0_5 = -0.3
local var_0_6 = 0.3
local var_0_7 = -0.3
local var_0_8 = 0.3
local var_0_9 = 4500

local function var_0_10(arg_1_0, arg_1_1)
	arg_1_1.widget = MenuBuilder.BuildRegisteredType("LoadoutOptionsPopup", arg_1_1)
	arg_1_1.flyInLeftNarrow = LAYOUT.GetTextWidth(arg_1_1.widget.MenuTitle.MenuTitle, arg_1_1.controllerIndex) < 480 * _1080p

	local var_1_0 = MenuBuilder.BuildRegisteredType("FlyInPopup", arg_1_1)

	var_1_0.id = "LoadoutOptions"

	return var_1_0
end

MenuBuilder.registerType("LoadoutOptions", var_0_10)

local function var_0_11(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("PopupYesNo", arg_2_1)

	var_2_0.id = "BRLoadoutPurchaseConfirmPopup"

	return var_2_0
end

MenuBuilder.registerType("BRLoadoutPurchaseConfirmPopup", var_0_11)

if not Engine.DDJFBBJAIG() then
	if CONDITIONS.IsThirdGameMode(self) then
		LUI.FlowManager.RequestSetStack("LoadoutSelect", {
			{
				name = "CPPauseMenu"
			}
		})
	elseif CONDITIONS.IsMagmaGameMode(self) then
		LUI.FlowManager.RequestSetStack("LoadoutSelect", {
			{
				name = "BrPauseMenu"
			}
		})
	else
		LUI.FlowManager.RequestSetStack("LoadoutSelect", {
			{
				name = "MPPauseMenu"
			}
		})
	end
end

local var_0_12 = {
	loadoutEdit = 2,
	loadoutSelect = 1
}
local var_0_13 = {
	default = 1,
	mix = 2,
	custom = 0
}

local function var_0_14(arg_3_0)
	return function()
		CLIENT_MODEL.SetAllModelsModifiable(arg_3_0)
	end
end

local function var_0_15(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {}

	for iter_5_0 = #arg_5_2 - 1, 0, -1 do
		local var_5_1 = arg_5_2[iter_5_0]

		for iter_5_1 = 0, #var_5_1.weaponSetups - 1 do
			local var_5_2 = var_5_1.weaponSetups[iter_5_1]
			local var_5_3 = WEAPON.GetWeaponModelNameFromPlayerData(var_5_2.weapon:get(), var_5_2, {
				includeCamos = true,
				includeAttachments = true,
				includeStickers = true,
				controllerIndex = arg_5_1
			})

			if not LUI.IsItemInArray(var_5_0, var_5_3) then
				table.insert(var_5_0, var_5_3)
			end
		end
	end

	local var_5_4 = WATCH.GetEquippedWatch(arg_5_1)
	local var_5_5 = WATCH.GetFullModelName(var_5_4)

	table.insert(var_5_0, var_5_5)

	if #var_5_0 > 0 then
		FrontEndScene.RequestWeaponViewModels(var_5_0, arg_5_1)
	end
end

local function var_0_16(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = PlayerData.BFFBGAJGD(arg_6_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	if Engine.DDJFBBJAIG() then
		Streaming.BDDBGGIC(true)
		var_0_15(arg_6_0, arg_6_1, var_6_0)
	end

	DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_6_0, arg_6_1)
end

local function var_0_17(arg_7_0, arg_7_1)
	if Engine.DDJFBBJAIG() then
		arg_7_0.Loadouts:SetMouseFocusBlocker(not arg_7_1)
	else
		arg_7_0.InGameLoadouts:SetMouseFocusBlocker(not arg_7_1)
	end
end

local function var_0_18(arg_8_0)
	if Engine.DDJFBBJAIG() then
		arg_8_0.Loadouts:RefreshContent()
	else
		arg_8_0.InGameLoadouts:RefreshContent()
	end
end

local function var_0_19(arg_9_0, arg_9_1)
	ACTIONS.AnimateSequence(arg_9_0.LoadoutSelectButtons.PrimaryWeaponCluster.WeaponButton, arg_9_1)
	ACTIONS.AnimateSequence(arg_9_0.LoadoutSelectButtons.SecondaryWeaponCluster.WeaponButton, arg_9_1)
	ACTIONS.AnimateSequence(arg_9_0.LoadoutSelectButtons.EquipmentGridItem, arg_9_1)
	ACTIONS.AnimateSequence(arg_9_0.LoadoutSelectButtons.TacticalGridItem, arg_9_1)
	ACTIONS.AnimateSequence(arg_9_0.LoadoutSelectButtons.PerkGridItem, arg_9_1)
end

local function var_0_20(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0.BundleUpsellButton then
		if Dvar.IBEGCHEFE("LTSNLQNRKO") and Dvar.IBEGCHEFE("NKRLMNTNRS") and arg_10_0._bundleVariants[arg_10_2] and not CONDITIONS.AreRestrictionsActive(arg_10_1) and arg_10_0._bundleVariants[arg_10_2][1] then
			arg_10_0.BundleUpsellButton:SetupUpsellButtonWithBundleID(arg_10_1, arg_10_0._bundleVariants[arg_10_2][1].bundleID)
		else
			arg_10_0.BundleUpsellButton:HideButton()
		end
	end
end

local function var_0_21(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = LUI.FlowManager.GetScopedData(arg_11_0)

	if var_11_0.menuState == var_0_12.loadoutSelect then
		var_11_0.loadoutSessionStartTime = Engine.DCJHCAFIIA()
	end

	var_11_0.menuState = var_0_12.loadoutEdit

	arg_11_0:dispatchEventToChildren({
		name = "menu_state_updated",
		menuState = var_11_0.menuState
	})

	if var_11_0.openedFromScriptRequest then
		arg_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	if Engine.DDJFBBJAIG() then
		arg_11_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_alt2"
		})
		arg_11_0.KBMLoadoutOptionsPrompt:SetAlpha(0)
	end

	var_0_19(arg_11_0, "LoadoutEdit")
	ACTIONS.AnimateSequence(arg_11_0, "LoadoutEdit")

	local function var_11_1(arg_12_0, arg_12_1)
		if not Onboarding.WeaponMasteryChallenges.WasCompleted(arg_12_0, arg_12_1) then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingWeaponMasteryChallengesData())
			Onboarding.WeaponMasteryChallenges.MarkCompleted(arg_12_0, arg_12_1)
		end
	end

	;(Engine.DDJFBBJAIG() and arg_11_0.Loadouts or arg_11_0.InGameLoadouts):processEvent({
		name = "lose_focus",
		controller = arg_11_1
	})

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.IsBlueprintStoreEnabled() and not Onboarding.BlueprintStore.WasCompleted(self, arg_11_1) then
			local var_11_2 = ONBOARDING_DATA.GetOnboardingBlueprintStoreData()

			if not Onboarding.WeaponMasteryChallenges.WasCompleted(self, arg_11_1) then
				local function var_11_3(arg_13_0, arg_13_1)
					ACTIONS.LeaveMenu(arg_13_0)
					var_11_1(self, arg_13_1)
				end

				var_11_2.confirmButton.action = var_11_3
			end

			LUI.FlowManager.RequestPopupMenu(self, "onboardingpopup", true, arg_11_1, false, var_11_2)
			Onboarding.BlueprintStore.MarkCompleted(self, arg_11_1)
		else
			var_11_1(self, arg_11_1)
		end
	end

	arg_11_0.LoadoutSelectButtons:processEvent({
		name = "gain_focus",
		controller = arg_11_1
	})
	var_0_17(arg_11_0, false)
	arg_11_0.LoadoutSelectButtons:SetMouseHandling(true)
	arg_11_0.MenuTitle:SetTitle(arg_11_2.name:get())

	if arg_11_0.InGameLoadoutTabs then
		arg_11_0.InGameLoadoutTabs:DisableAll()
	end

	if arg_11_0.BundleUpsellButton then
		local var_11_4 = arg_11_2.weaponSetups[WEAPON.PrimarySlot].weapon:get()

		arg_11_0:UpdateBundleUpsell(arg_11_1, var_11_4)
	end
end

local function var_0_22(arg_14_0, arg_14_1)
	Engine.DHFCHIIJCA("loadout_showcase")

	local var_14_0 = LUI.FlowManager.GetScopedData(arg_14_0)

	if var_14_0.menuState == var_0_12.loadoutEdit then
		METRICS.LoadoutSessionSendDLogEvent(arg_14_1, var_14_0.sessionID, var_14_0.loadoutSessionStartTime, var_14_0.selectedLoadoutIndex)
		LAYOUT.FadeInAspectRatioFadeFrame(arg_14_0, 300)
	end

	var_14_0.menuState = var_0_12.loadoutSelect

	arg_14_0:dispatchEventToChildren({
		name = "menu_state_updated",
		menuState = var_14_0.menuState
	})
	arg_14_0.LoadoutSelectButtons:processEvent({
		name = "lose_focus",
		controller = arg_14_1
	})

	local var_14_1 = Engine.DDJFBBJAIG() and arg_14_0.Loadouts or arg_14_0.InGameLoadouts

	var_0_17(arg_14_0, true)
	var_0_18(arg_14_0)
	var_14_1:processEvent({
		name = "gain_focus",
		controller = arg_14_1
	})

	if Engine.DDJFBBJAIG() then
		if LUI.IsLastInputGamepad(arg_14_1) then
			arg_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				clickable = true,
				priority = 20,
				side = "left",
				gamepad_only = true,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS")
			})
		else
			arg_14_0.KBMLoadoutOptionsPrompt:SetAlpha(1)
		end
	end

	var_0_19(arg_14_0, "LoadoutPreview")

	local var_14_2 = "LoadoutButtons"

	if not Engine.DDJFBBJAIG() then
		var_14_2 = (var_14_0.openedForPlunderBox == true or CONDITIONS.IsBRLoadoutGameType(arg_14_0)) and "InGameLoadoutButtonsBr" or "InGameLoadoutButtons"
	end

	ACTIONS.AnimateSequence(arg_14_0, var_14_2)
	arg_14_0.LoadoutSelectButtons:SetMouseHandling(false)

	if arg_14_0.InGameLoadoutTabs then
		arg_14_0.InGameLoadoutTabs:EnableAll()
	end

	if not Engine.DDJFBBJAIG() then
		arg_14_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_LOADOUT"))
	else
		arg_14_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/EDIT_LOADOUTS"))
	end

	if arg_14_0.BundleUpsellButton then
		arg_14_0.BundleUpsellButton:HideButton()
	end

	if arg_14_0.MasterChallenges then
		arg_14_0.MasterChallenges:SetAlpha(0)
	end
end

local function var_0_23(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = false

	if arg_15_0.selectedLoadout and arg_15_0.selectedLoadout:GetValue(arg_15_1) then
		local var_15_1 = arg_15_0.selectedLoadout:GetValue(arg_15_1)

		if arg_15_3 and var_15_1 == arg_15_2 + LOADOUT.DEFAULT_LOADOUT_INDEX_START or not arg_15_3 and var_15_1 == arg_15_2 then
			var_15_0 = true
		end
	end

	return var_15_0
end

local function var_0_24(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2.Text and arg_16_2.Text:getText()

	arg_16_2:SetupContextualMenu({
		title = var_16_0
	})

	local var_16_1 = {
		id = "renameLoadout",
		actionName = Engine.CBBHFCGDIC("MENU/RENAME"),
		actionFunction = function()
			LOADOUT.RenameLoadout(arg_16_0, arg_16_1, arg_16_2.playerData, arg_16_2.index)
		end
	}

	arg_16_2:AddContextualMenuAction(var_16_1)

	local var_16_2 = {
		id = "copyLoadout",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/COPY_LOADOUT"),
		actionFunction = function()
			LOADOUT.OpenLoadoutCopyPopup(arg_16_1, arg_16_2.index)
		end
	}

	arg_16_2:AddContextualMenuAction(var_16_2)

	if IsOnlineMatch() then
		local var_16_3 = {
			id = "copyLoadout",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/SET_FAVORITE"),
			actionFunction = function()
				LOADOUT.SetFavoriteLoadout(arg_16_0, arg_16_1, arg_16_2.index)
			end
		}

		arg_16_2:AddContextualMenuAction(var_16_3)
	end
end

local function var_0_25(arg_20_0, arg_20_1, arg_20_2)
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PrimaryWeaponCluster.AttachmentsButton, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionWarningOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.SecondaryWeaponCluster.AttachmentsButton, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionWarningOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk1")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk2")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk3")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk4")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk5")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk6")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.EquipmentGridItem, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.TacticalGridItem, "RestrictionOff")

	if MatchRules.CADFFHGJAE(arg_20_2.weaponSetups[0].weapon:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionOn")
	end

	if LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_20_2.weaponSetups[0].attachmentSetup, arg_20_2.weaponSetups[0].weapon:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionWarningOn")
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PrimaryWeaponCluster.AttachmentsButton, "RestrictionOn")
	end

	if MatchRules.CADFFHGJAE(arg_20_2.weaponSetups[1].weapon:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionOn")
	end

	if LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_20_2.weaponSetups[1].attachmentSetup, arg_20_2.weaponSetups[0].weapon:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionWarningOn")
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.SecondaryWeaponCluster.AttachmentsButton, "RestrictionOn")
	end

	if MatchRules.CJBJJHJCI(arg_20_2.loadoutPerks[0]:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk1")
	end

	if MatchRules.CJBJJHJCI(arg_20_2.loadoutPerks[1]:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk2")
	end

	if MatchRules.CJBJJHJCI(arg_20_2.loadoutPerks[2]:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk3")
	end

	if arg_20_2.extraPerks[0] then
		if MatchRules.CJBJJHJCI(arg_20_2.extraPerks[0]:get()) then
			ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk4")
		end

		if MatchRules.CJBJJHJCI(arg_20_2.extraPerks[1]:get()) then
			ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk5")
		end

		if MatchRules.CJBJJHJCI(arg_20_2.extraPerks[2]:get()) then
			ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk6")
		end
	end

	if MatchRules.BAJDCAAGCG(arg_20_2.equipmentSetups[0].equipment:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.EquipmentGridItem, "RestrictionOn")
	end

	if MatchRules.BAJDCAAGCG(arg_20_2.equipmentSetups[1].equipment:get()) then
		ACTIONS.AnimateSequence(arg_20_0.LoadoutSelectButtons.TacticalGridItem, "RestrictionOn")
	end
end

local function var_0_26(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5)
	local var_21_0 = Engine.DDJFBBJAIG() and arg_21_0.Loadouts or arg_21_0.InGameLoadouts
	local var_21_1 = arg_21_2.LoadoutButton
	local var_21_2 = arg_21_3[arg_21_4]

	assert(var_21_1.Text)

	var_21_1.playerData = var_21_2
	var_21_1.index = arg_21_4

	if not Engine.DDJFBBJAIG() and var_21_0.state == var_0_13.mix and arg_21_4 >= #arg_21_3 then
		var_21_1.index = arg_21_4 - #arg_21_3

		arg_21_2:SetEditButtonEnabled(false)
	end

	var_21_1.isLoadout = true
	var_21_1.isDefault = arg_21_5

	if LOADOUT.MATCHRULES.LoadoutHasRestrictedItem(var_21_2) then
		ACTIONS.AnimateSequence(var_21_1, "RestrictionOn")
	else
		ACTIONS.AnimateSequence(var_21_1, "RestrictionOff")
	end

	if CONDITIONS.InGame() then
		if not PROGRESSION.IsUnlocked(arg_21_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef) then
			arg_21_0.UnlockText:SetAlpha(1)

			if arg_21_4 == 3 and not PROGRESSION.IsUnlocked(arg_21_1, LOOT.itemTypes.FEATURE, "loadout_4") then
				var_21_1:SetButtonDisabled(true)

				var_21_1.buttonDescription = PROGRESSION.GetUnlockText(arg_21_1, LOOT.itemTypes.FEATURE, "loadout_4")
			elseif arg_21_4 == 4 and not PROGRESSION.IsUnlocked(arg_21_1, LOOT.itemTypes.FEATURE, "loadout_5") then
				var_21_1:SetButtonDisabled(true)

				var_21_1.buttonDescription = PROGRESSION.GetUnlockText(arg_21_1, LOOT.itemTypes.FEATURE, "loadout_5")
			else
				var_21_1.buttonDescription = ""
			end
		end

		if not arg_21_5 and not Engine.BGGJFFFAFG(arg_21_1) and not CONDITIONS.InGameAndBRLoadoutSelect(arg_21_0) then
			local var_21_3 = {
				{
					button_ref = "button_start",
					keyprompt_text = LocalizeString("[{ONFOOT_MP:changeclass" .. arg_21_4 + 1 .. "}]"),
					helper_text = Engine.CBBHFCGDIC("MENU/QUICK_SWITCH")
				}
			}
			local var_21_4 = {
				promptsData = var_21_3
			}

			var_21_1:AddTooltipData(arg_21_1, var_21_4)
		else
			var_21_1:RemoveToolTipData()
		end
	end

	if not Engine.DDJFBBJAIG() then
		if var_0_23(arg_21_0, arg_21_1, var_21_1.index, var_21_1.isDefault) then
			var_21_1:SetSelected(arg_21_1, true)
		else
			var_21_1:SetSelected(arg_21_1, false)
		end

		var_21_1.defaultLoadout = arg_21_0.defaultLoadouts[var_21_1.index + 1]
		arg_21_2.EditButton.index = arg_21_4
		arg_21_2.EditButton.playerData = var_21_2

		if var_21_0.state == var_0_13.mix then
			arg_21_2:AddDividingLine(not arg_21_5 and arg_21_4 + 1 == #arg_21_3, arg_21_0.openedForPlunderBox or CONDITIONS.IsBRLoadoutGameType(arg_21_0))
		end
	end

	local var_21_5 = 0

	if CONDITIONS.InGameAndBRLoadoutSelect(arg_21_0) and not var_21_1:IsDisabled() then
		if arg_21_0.openedForPlunderBox == true then
			local var_21_6 = 0
			local var_21_7 = true

			if arg_21_5 then
				var_21_6 = tonumber(StringTable.DIFCHIGDFB(CSV.brKioskPurchases.file, CSV.brKioskPurchases.cols.type, "loadout_default", CSV.brKioskPurchases.cols.cost))
			else
				var_21_6 = tonumber(StringTable.DIFCHIGDFB(CSV.brKioskPurchases.file, CSV.brKioskPurchases.cols.type, "loadout_custom", CSV.brKioskPurchases.cols.cost))
			end

			local var_21_8 = DataSources.inGame.player.BRData.squadIndex:GetValue(arg_21_1)

			if var_21_8 then
				if var_21_8 <= 1 then
					var_21_8 = ""
				end
			else
				var_21_8 = ""
			end

			local var_21_9 = var_21_6 > DataSources.inGame.player.BRData["plunderAmount" .. var_21_8]:GetValue(arg_21_1)

			var_21_5 = var_21_6 * BRLOOT.PLUNDER_QUANTITY_SCALING_FACTOR

			var_21_1:SetCost(var_21_5, var_21_9)

			if var_21_9 == false then
				var_21_1:SetButtonDisabled(false)
			end
		else
			var_21_1:DisableCost()
			var_21_1:SetButtonDisabled(false)
		end
	end

	var_21_1.Text:setText(arg_21_5 and Engine.CBBHFCGDIC(var_21_1.defaultLoadout.name) or var_21_2.name:get())

	if not var_21_1.handlersAdded then
		local function var_21_10(arg_22_0, arg_22_1)
			if not Engine.DDJFBBJAIG() then
				if var_0_23(arg_21_0, arg_21_1, var_21_1.index, var_21_1.isDefault) then
					arg_21_0.LoadoutSelectButtons.EquippedWidget:UpdateVisibility(true)
					ACTIONS.AnimateSequence(arg_21_0.LoadoutSelectButtons.EquippedWidget, "TurnOn")
				else
					arg_21_0.LoadoutSelectButtons.EquippedWidget:UpdateVisibility(false)
				end
			end

			arg_21_0.LoadoutSelectButtons:SetupGridItems(arg_21_1, arg_22_0.index, arg_22_0.playerData, arg_22_0.isDefault and arg_22_0.defaultLoadout)

			arg_21_0._focusedLoadoutIndex = var_21_1.index

			if not Engine.DDJFBBJAIG() and not arg_22_0.isDefault and arg_21_0.openedForPlunderBox ~= true and not CONDITIONS.IsBRLoadoutGameType(arg_22_0) then
				arg_21_2:SetEditButtonEnabled(true)
			end

			if Engine.DDJFBBJAIG() then
				for iter_22_0 = 0, 1 do
					local var_22_0 = arg_22_0.playerData.weaponSetups[iter_22_0]
					local var_22_1 = WEAPON.GetWeaponModelNameFromPlayerData(var_22_0.weapon:get(), var_22_0, {
						includeCamos = true,
						includeAttachments = true,
						includeStickers = true,
						controllerIndex = arg_21_1
					})
					local var_22_2 = iter_22_0 == 0 and arg_21_0.primaryWeaponModel or arg_21_0.secondaryWeaponModel

					WEAPON.SetModelIfLoaded(arg_21_1, var_22_2, var_22_1, {
						adjustSandbags = iter_22_0 == 0
					})
				end

				local var_22_3 = arg_22_0.index

				CLIENT_MODEL.UpdateModelsForLoadout(arg_21_0, arg_21_1, var_22_3)
				WEAPON.SetResetDynBones({
					FrontEndScene.ClientWeapons.GunTablePrimary,
					FrontEndScene.ClientWeapons.GunTableSecondary
				})
			end

			var_0_25(arg_21_0, arg_21_1, arg_22_0.playerData)
		end

		var_21_1.refreshDetailsGrid = var_21_10

		var_21_1:addEventHandler("button_over", var_21_10)
		var_21_1:addEventHandler("button_over_disable", var_21_10)
		var_21_1:addEventHandler("tab_changed", var_21_10)
		var_21_1:addEventHandler("tab_changed", function(arg_23_0, arg_23_1)
			if arg_23_0.isDefault then
				arg_21_2:SetEditButtonEnabled(false)
			end
		end)

		local function var_21_11(arg_24_0, arg_24_1)
			LUI.FlowManager.GetScopedData(arg_21_0).selectedLoadoutIndex = arg_24_0.index

			var_0_21(arg_21_0, arg_21_1, var_21_2, arg_24_0.index)
		end

		if not Engine.DDJFBBJAIG() then
			var_21_1:addEventHandler("button_action", function(arg_25_0, arg_25_1)
				local var_25_0 = arg_25_0.index

				if arg_25_0.isDefault then
					var_25_0 = var_25_0 + LOADOUT.DEFAULT_LOADOUT_INDEX_START
				end

				arg_21_0.selectedLoadout:SetValue(arg_21_1, var_25_0)

				if arg_21_0.openedForPlunderBox == true then
					local var_25_1 = var_21_1.Text and var_21_1.Text:getText() or ""
					local var_25_2 = {
						defaultFocusIndex = 1,
						yesAction = function()
							arg_21_0.selectedLoadout:SetValue(arg_21_1, var_25_0)
							Engine.EBHIFJCGBH("br_loadout_purchase", var_25_0)
						end,
						message = Engine.CBBHFCGDIC("MP_BR_INGAME/DO_YOU_WANT_TO_PURCHASE_N_FOR_N", var_25_1, var_21_5)
					}

					LUI.FlowManager.RequestPopupMenu(arg_21_0, "BRLoadoutPurchaseConfirmPopup", true, arg_21_1, false, var_25_2)
				else
					arg_21_0.selectedLoadout:SetValue(arg_21_1, var_25_0)
					Engine.EBHIFJCGBH("class_select", var_25_0)

					if CONDITIONS.IsThirdGameMode(self) and not arg_25_0.isDefault then
						PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.cpLoadoutSel:set(var_25_0)
					end

					LUI.FlowManager.RequestCloseAllMenus()
				end

				local var_25_3 = LUI.FlowManager.GetScopedData(arg_21_0)

				if var_25_3.cacSessionDlogOnGoing then
					METRICS.CacSessionEndSendDLogEvent(arg_21_1, var_25_3.sessionID, var_25_3.cacSessionStartTime, METRICS.CacExitReasons.PLAYER_SELECTED_LOADOUT)

					var_25_3.cacSessionDlogOnGoing = nil
				end
			end)
			arg_21_2.EditButton:addEventHandler("button_action", var_21_11)
		else
			var_21_1:addEventHandler("button_action", var_21_11)
		end

		var_21_1.handlersAdded = true
	end

	if Engine.DDJFBBJAIG() then
		if IsOnlineMatch() then
			assert(arg_21_2.Star)

			local var_21_12, var_21_13 = LOADOUT.GetFavoriteLoadoutIndex(arg_21_1)
			local var_21_14 = arg_21_4 == var_21_12 and not var_21_13

			arg_21_2.Star:SetAlpha(var_21_14 and 1 or 0)
		end

		var_0_24(arg_21_0, arg_21_1, var_21_1)
	end

	if CONDITIONS.IsBRLoadoutGameType(self) and arg_21_2.LoadoutButton and arg_21_2.LoadoutButton.BRWarning then
		local var_21_15 = arg_21_5 and var_21_1.defaultLoadout.perks[1] or var_21_2.loadoutPerks[0]:get()
		local var_21_16 = arg_21_5 and var_21_1.defaultLoadout.perks[2] or var_21_2.loadoutPerks[1]:get()
		local var_21_17 = arg_21_5 and var_21_1.defaultLoadout.perks[3] or var_21_2.loadoutPerks[2]:get()
		local var_21_18 = Cac.GetIsPerkDisabledForBR(var_21_15)
		local var_21_19 = Cac.GetIsPerkDisabledForBR(var_21_16)
		local var_21_20 = Cac.GetIsPerkDisabledForBR(var_21_17)

		arg_21_2.LoadoutButton.BRWarning:SetShowWarningIcon(var_21_18 or var_21_19 or var_21_20)
	end
end

local function var_0_27(arg_27_0, arg_27_1)
	if Engine.DDJFBBJAIG() then
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})
		Engine.DHFCHIIJCA("loadout_showcase")
		FrontEndScene.HideWeaponModels()

		local var_27_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_27_1
		})

		var_27_0:SetLimits(var_0_0, var_0_1, var_0_2, var_0_3)
		var_27_0:SetSwayValues(var_0_4, 0.06, 0.1)

		arg_27_0.FrontendCameraMover = var_27_0

		arg_27_0:addElement(var_27_0)
		arg_27_0.FrontendCameraMover:addEventHandler("update_camera_limits", function(arg_28_0, arg_28_1)
			local var_28_0 = arg_28_1.isZoomed and var_0_5 or var_0_0
			local var_28_1 = arg_28_1.isZoomed and var_0_6 or var_0_1
			local var_28_2 = arg_28_1.isZoomed and var_0_7 or var_0_2
			local var_28_3 = arg_28_1.isZoomed and var_0_8 or var_0_3

			arg_28_0:SetLimits(var_28_0, var_28_1, var_28_2, var_28_3)

			if not arg_28_1.isZoomed or not var_0_9 then
				local var_28_4 = var_0_4
			end

			arg_28_0:SetSwayValues(var_0_9, 0.06, 0.1)
		end)

		local var_27_1 = WATCH.GetEquippedWatch(arg_27_1)
		local var_27_2 = WEAPON.GetWeaponModel(arg_27_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

		arg_27_0:addElement(var_27_2)
		WATCH.SetWatchModelIfLoaded(arg_27_0, arg_27_1, var_27_2, var_27_1)
	elseif arg_27_0.InGameLoadoutsMp then
		arg_27_0.InGameLoadouts = arg_27_0.InGameLoadoutsMp
	elseif arg_27_0.InGameLoadoutsBr then
		arg_27_0.InGameLoadouts = arg_27_0.InGameLoadoutsBr
	end
end

local function var_0_28(arg_29_0, arg_29_1, arg_29_2)
	var_0_27(arg_29_0, arg_29_1)
	assert(arg_29_0.Loadouts or arg_29_0.InGameLoadouts)
	assert(arg_29_0.LoadoutSelectButtons)

	arg_29_0.DisplayLoadout = var_0_19
	arg_29_0.UpdateBundleUpsell = var_0_20

	local var_29_0 = PlayerData.BFFBGAJGD(arg_29_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	arg_29_0.bindButton = LUI.UIBindButton.new()

	arg_29_0:addElement(arg_29_0.bindButton)

	local var_29_1 = false

	if CONDITIONS.IsThirdGameMode() and not Engine.DDJFBBJAIG() and Game.BFEEGCHICA(arg_29_1, "cp_open_cac") == -1 then
		var_29_1 = true
	end

	local var_29_2 = false

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsBRGameType() and Game.BFEEGCHICA(arg_29_1, "ui_open_loadout_bag") then
		var_29_2 = true
	end

	if (arg_29_0.BundleUpsellButton or Dvar.IBEGCHEFE("MRKSTPMLT")) and Engine.DDJFBBJAIG() then
		arg_29_0._bundleVariants = WEAPON.GetPriorityVariants(arg_29_1, {
			excludeOwned = true,
			useBaseRefKeys = true
		})
		arg_29_0._bundleVariants = WEAPON.GetAllVariantsInStore(arg_29_1, {
			excludeOwned = true,
			useBaseRefKeys = true,
			variantsTable = arg_29_0._bundleVariants
		})
		LUI.FlowManager.GetScopedData(arg_29_0).bundleVariants = arg_29_0._bundleVariants
	end

	if not arg_29_2.openedFromScriptRequest or var_29_1 then
		assert(arg_29_0.HelperBar)
		assert(arg_29_0.HelperBar.ButtonHelperText)
		arg_29_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_29_0.bindButton:addEventHandler("button_secondary", function(arg_30_0, arg_30_1)
			local var_30_0 = LUI.FlowManager.GetScopedData(arg_29_0)

			if var_30_0.menuState == var_0_12.loadoutEdit then
				if not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", var_30_0.selectedLoadoutIndex)
				end

				if arg_29_0.selectedLoadout ~= nil and var_30_0.selectedLoadoutIndex == arg_29_0.selectedLoadout:GetValue(arg_29_1) and not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", arg_29_0.selectedLoadout:GetValue(arg_29_1))
					var_0_22(arg_29_0, arg_29_1)
				else
					var_0_22(arg_29_0, arg_29_1)
				end
			else
				if var_30_0.cacSessionDlogOnGoing then
					METRICS.CacSessionEndSendDLogEvent(arg_29_1, var_30_0.sessionID, var_30_0.cacSessionStartTime, METRICS.CacExitReasons.PLAYER_EXIT)

					var_30_0.cacSessionDlogOnGoing = nil
				end

				if CONDITIONS.IsThirdGameMode() and not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_menu_closed", 1)
					LUI.FlowManager.RequestCloseAllMenus()
				else
					ACTIONS.UploadStats(arg_29_0, arg_29_1)
					ACTIONS.LeaveMenu(arg_29_0)
				end
			end
		end)

		if not Engine.DDJFBBJAIG() and not CONDITIONS.IsThirdGameMode() and arg_29_2.openedForPlunderBox ~= true then
			arg_29_0:addEventHandler("menu_create", function()
				arg_29_0:AddButtonHelperText({
					clickable = true,
					priority = 2,
					side = "left",
					kbmTooltipPromptOverload = "button_dismiss_pause_menu",
					button_ref = "button_start",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
				})
			end)
			arg_29_0.bindButton:addEventHandler("button_start", function(arg_32_0, arg_32_1)
				if Engine.CAADCDEEIA() then
					ACTIONS.ResumeGame(arg_32_0)
				end

				local var_32_0 = LUI.FlowManager.GetScopedData(arg_29_0)

				if var_32_0.cacSessionDlogOnGoing then
					METRICS.CacSessionEndSendDLogEvent(arg_29_1, var_32_0.sessionID, var_32_0.cacSessionStartTime, METRICS.CacExitReasons.PLAYER_EXIT)

					var_32_0.cacSessionDlogOnGoing = nil
				end

				LUI.FlowManager.RequestCloseAllMenus(arg_29_0.id, false, arg_32_1.controller)

				return true
			end)
			MenuUtils.AddDismissPauseMenuKBMHandler(arg_29_0)
		end
	elseif var_29_2 then
		arg_29_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_29_0.bindButton:addEventHandler("button_secondary", function(arg_33_0, arg_33_1)
			local var_33_0 = LUI.FlowManager.GetScopedData(arg_29_0)

			if var_33_0.menuState == var_0_12.loadoutEdit then
				if not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", var_33_0.selectedLoadoutIndex)
					var_0_22(arg_29_0, arg_29_1)
				end
			else
				Engine.EBHIFJCGBH("exit_loadout_bag", 1)
				LUI.FlowManager.RequestCloseAllMenus()
			end
		end)
	else
		arg_29_0.isQuickAccessShortcutsDisabled = true

		arg_29_0.bindButton:addEventHandler("button_secondary", function(arg_34_0, arg_34_1)
			local var_34_0 = LUI.FlowManager.GetScopedData(arg_29_0)

			if var_34_0.menuState == var_0_12.loadoutEdit then
				if not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", var_34_0.selectedLoadoutIndex)
				end

				arg_29_0.HelperBar.ButtonHelperText:PopButtonPrompt({
					button_ref = "button_secondary"
				})
				var_0_22(arg_29_0, arg_29_1)
			elseif CONDITIONS.IsBRLoadoutGameType(arg_29_0) and var_34_0.openedForPlunderBox ~= true then
				Engine.EBHIFJCGBH("class_select", -1)
				LUI.FlowManager.RequestCloseAllMenus()
			end
		end)
	end

	if CONDITIONS.InFrontendPublic() then
		arg_29_0:registerEventHandler("update_weapon_master_summary", function(arg_35_0, arg_35_1)
			if arg_35_1.weaponRef and GUNSMITH.AreMasterChallengesEnabled(arg_29_1, arg_35_1.weaponRef) then
				arg_29_0.MasterChallenges:SetAlpha(1)
				arg_29_0.MasterChallenges:Setup(arg_35_1.weaponRef)
				ACTIONS.AnimateSequence(arg_29_0, "ChallengesOn")
			else
				arg_29_0.MasterChallenges:SetAlpha(0)
				ACTIONS.AnimateSequence(arg_29_0, "ChallengesOff")
			end
		end)
	end

	if Engine.DDJFBBJAIG() then
		arg_29_0.bindButton:addEventHandler("button_alt2", function(arg_36_0, arg_36_1)
			if LUI.FlowManager.GetScopedData(arg_29_0).menuState == var_0_12.loadoutEdit then
				return
			end

			local var_36_0 = {
				disableQuickAccessShortcuts = true,
				controllerIndex = arg_29_1,
				loadoutIndex = arg_29_0._focusedLoadoutIndex
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LoadoutOptions", true, arg_36_1.controller, false, var_36_0)
		end)
		arg_29_0:addEventHandler("refresh_loadouts", function(arg_37_0, arg_37_1)
			arg_37_0.Loadouts:RefreshContent()
		end)
	end

	if CONDITIONS.IsCoreMultiplayer(arg_29_0) and not Engine.DDJFBBJAIG() or CONDITIONS.IsThirdGameMode(arg_29_0) then
		arg_29_0.selectedLoadout = LUI.DataSourceInControllerModel.new("cg.players.selectedLoadout")
	end

	if not Engine.DDJFBBJAIG() then
		arg_29_0.defaultLoadouts = LOADOUT.GetDefaultLoadouts(arg_29_1)
	end

	local var_29_3

	if arg_29_2.openedForPlunderBox == true then
		var_29_3 = LUI.FlowManager.GetScopedData("brPlunderBox")
		arg_29_0.openedForPlunderBox = true
		var_29_3.openedForPlunderBox = true

		arg_29_0.HelperBar:SetAlpha(0)
	else
		var_29_3 = LUI.FlowManager.GetScopedData(arg_29_0)
	end

	if not var_29_3.sessionID then
		var_29_3.sessionID = Engine.DCJHCAFIIA()
	end

	if not var_29_3.cacSessionStartTime then
		var_29_3.cacSessionStartTime = Engine.DCJHCAFIIA()
	end

	if not var_29_3.cacSessionDlogOnGoing and not CONDITIONS.IsBRLoadoutGameType(arg_29_0) then
		METRICS.CacSessionStartSendDLogEvent(arg_29_1, var_29_3.sessionID)

		var_29_3.cacSessionDlogOnGoing = true
	end

	var_29_3.menuState = var_29_3.menuState or var_0_12.loadoutSelect

	arg_29_0:dispatchEventToChildren({
		name = "menu_state_updated",
		menuState = var_29_3.menuState
	})

	local var_29_4 = Engine.DDJFBBJAIG() and arg_29_0.Loadouts or arg_29_0.InGameLoadouts

	var_29_4:SetRefreshChild(function(arg_38_0, arg_38_1, arg_38_2)
		local var_38_0 = var_29_4.state == var_0_13.default or var_29_4.state == var_0_13.mix and arg_38_2 >= #var_29_0

		var_0_26(arg_29_0, arg_29_1, arg_38_0, var_29_0, arg_38_2, var_38_0)
	end)

	local function var_29_5()
		if var_29_3.selectedLoadoutIndex then
			return {
				x = 0,
				y = var_29_3.selectedLoadoutIndex
			}
		elseif arg_29_0.selectedLoadout and arg_29_0.selectedLoadout:GetValue(arg_29_1) then
			local var_39_0 = arg_29_0.selectedLoadout:GetValue(arg_29_1)

			if var_39_0 >= LOADOUT.DEFAULT_LOADOUT_INDEX_START then
				local var_39_1 = PROGRESSION.IsUnlocked(arg_29_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef)

				var_39_0 = var_39_0 - LOADOUT.DEFAULT_LOADOUT_INDEX_START

				if var_39_1 and not Game.BFEEGCHICA(arg_29_1, "ui_only_default_loadouts") and not Dvar.IBEGCHEFE("NTMRRKSKPQ") then
					var_39_0 = var_39_0 + #var_29_0
				end
			end

			return {
				x = 0,
				y = var_39_0
			}
		end
	end

	var_29_4:SetDefaultFocus(var_29_5)

	if not Engine.DDJFBBJAIG() then
		local var_29_6 = PROGRESSION.IsUnlocked(arg_29_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef)

		if Game.BFEEGCHICA(arg_29_1, "ui_only_default_loadouts") then
			arg_29_0.InGameLoadouts.state = var_0_13.default

			var_29_4:SetNumChildren(LOADOUT.DefaultClassCount)
			var_29_4:RefreshContent()
		elseif var_29_6 and Dvar.IBEGCHEFE("NTMRRKSKPQ") then
			local var_29_7 = arg_29_0.selectedLoadout:GetValue(arg_29_1)
			local var_29_8 = var_29_7 and var_29_7 >= LOADOUT.DEFAULT_LOADOUT_INDEX_START
			local var_29_9 = {}

			table.insert(var_29_9, {
				name = Engine.CBBHFCGDIC("MP_INGAME_ONLY/LOADOUT_TAB_CUSTOM"),
				focusFunction = function(arg_40_0, arg_40_1)
					arg_29_0.InGameLoadouts.state = var_0_13.custom

					arg_29_0.InGameLoadouts:SetNumChildren(#var_29_0)
					arg_29_0.InGameLoadouts:RefreshContent()
					arg_29_0.InGameLoadouts:ProcessEventToChildInFocus({
						name = "tab_changed"
					})
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end,
				hasDefaultFocus = not var_29_8,
				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			})
			table.insert(var_29_9, {
				name = Engine.CBBHFCGDIC("MP_INGAME_ONLY/LOADOUT_TAB_DEFAULT"),
				focusFunction = function(arg_41_0, arg_41_1)
					arg_29_0.InGameLoadouts.state = var_0_13.default

					arg_29_0.InGameLoadouts:SetNumChildren(LOADOUT.DefaultClassCount)
					arg_29_0.InGameLoadouts:RefreshContent()
					arg_29_0.InGameLoadouts:ProcessEventToChildInFocus({
						name = "tab_changed"
					})
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end,
				hasDefaultFocus = not var_29_7 or var_29_8,
				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			})

			arg_29_0.tabsData = var_29_9

			arg_29_0.InGameLoadoutTabs:SetTabs(var_29_9)
		else
			if var_29_6 then
				arg_29_0.InGameLoadouts.state = var_0_13.mix

				var_29_4:SetNumChildren(#var_29_0 + LOADOUT.DefaultClassCount)
			else
				arg_29_0.InGameLoadouts.state = var_0_13.default

				var_29_4:SetNumChildren(LOADOUT.DefaultClassCount)
			end

			var_29_4:RefreshContent()
		end
	else
		var_29_4:SetNumChildren(#var_29_0)
		var_29_4:RefreshContent()
	end

	if Engine.DDJFBBJAIG() then
		LAYOUT.AddAspectRatioFadeFrame(arg_29_0, arg_29_1)
	else
		ACTIONS.ScaleFullscreen(arg_29_0.InGameMenuBackground)
		ACTIONS.ScaleFullscreen(arg_29_0.Vignette)
		ACTIONS.ScaleStretchAnchorFullscreen(arg_29_0.TabBacker)
	end

	arg_29_0.LoadoutSelectButtons:SetMouseHandling(false)

	local var_29_10 = var_29_3.selectedLoadoutIndex or 1

	arg_29_0.LoadoutSelectButtons:SetupGridItems(arg_29_1, var_29_10, var_29_0[var_29_10])

	if var_29_3.menuState == var_0_12.loadoutEdit then
		if var_29_3.openedFromScriptRequest then
			arg_29_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_secondary",
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
		end

		if Engine.DDJFBBJAIG() then
			CLIENT_MODEL.UpdateModelsForLoadout(arg_29_0, arg_29_1, var_29_3.selectedLoadoutIndex)
		elseif arg_29_0.InGameLoadoutTabs then
			arg_29_0.InGameLoadoutTabs:DisableAll()
		end

		if Engine.DDJFBBJAIG() then
			arg_29_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt2"
			})
			arg_29_0.KBMLoadoutOptionsPrompt:SetAlpha(0)
		end

		ACTIONS.AnimateSequence(arg_29_0, "LoadoutEditSnap")
		arg_29_0.MenuTitle:SetTitle(var_29_0[var_29_3.selectedLoadoutIndex].name:get())

		if arg_29_0.LoadoutsScrollbar then
			arg_29_0.LoadoutsScrollbar:SetAlpha(0)
		end

		arg_29_0.LoadoutSelectButtons:SetMouseHandling(true)
		var_0_17(arg_29_0, false)
		var_0_19(arg_29_0, "LoadoutEdit")

		if arg_29_0.BundleUpsellButton then
			arg_29_0.BundleUpsellButton:HideButton()
		end
	else
		if not Engine.DDJFBBJAIG() then
			arg_29_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_LOADOUT"))
		else
			arg_29_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/EDIT_LOADOUTS"))
		end

		var_0_19(arg_29_0, "LoadoutPreview")
	end

	if Engine.DDJFBBJAIG() then
		local var_29_11 = var_0_12.loadoutSelect

		local function var_29_12(arg_42_0, arg_42_1)
			if LUI.FlowManager.GetScopedData(arg_42_0).menuState == var_29_11 then
				if LUI.IsLastInputGamepad(arg_42_1.controllerIndex) then
					arg_42_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						clickable = true,
						priority = 20,
						side = "left",
						gamepad_only = true,
						button_ref = "button_alt2",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS")
					})
					arg_42_0.KBMLoadoutOptionsPrompt:SetAlpha(0)
				else
					arg_42_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						button_ref = "button_alt2"
					})
					arg_42_0.KBMLoadoutOptionsPrompt:SetAlpha(1)
				end
			end
		end

		arg_29_0:addAndCallEventHandler("update_input_type", var_29_12, {
			controllerIndex = arg_29_1
		})
	end

	if Engine.DDJFBBJAIG() then
		local var_29_13 = WEAPON.GetWeaponModel(arg_29_1, FrontEndScene.ClientWeapons.GunTablePrimary)

		arg_29_0:addElement(var_29_13)

		arg_29_0.primaryWeaponModel = var_29_13

		local var_29_14 = WEAPON.GetWeaponModel(arg_29_1, FrontEndScene.ClientWeapons.GunTableSecondary)

		arg_29_0:addElement(var_29_14)

		arg_29_0.secondaryWeaponModel = var_29_14

		arg_29_0.LoadoutSelectButtons:SetupWeaponModelEvents(arg_29_1, {
			arg_29_0.primaryWeaponModel,
			arg_29_0.secondaryWeaponModel
		}, var_29_0)

		if Engine.ECHCFGDDDF() then
			MenuUtils.SetupSceneChangeCallback(arg_29_0, var_0_14(arg_29_1))
		end
	elseif var_29_3.menuState ~= var_0_12.loadoutEdit then
		if var_29_3.openedForPlunderBox == true or CONDITIONS.IsBRLoadoutGameType(arg_29_0) then
			ACTIONS.AnimateSequence(arg_29_0, "InGameLoadoutButtonsBr")
		else
			ACTIONS.AnimateSequence(arg_29_0, "InGameLoadoutButtons")
		end
	end

	arg_29_0:addEventHandler("button_focused", function(arg_43_0, arg_43_1)
		if arg_43_1.button.isLoadout then
			local var_43_0 = arg_43_1.button:getParent()

			if arg_43_0.focusedButton and arg_43_0.focusedButton ~= var_43_0 then
				assert(arg_43_0.focusedButton)

				if not Engine.DDJFBBJAIG() then
					assert(arg_43_0.focusedButton.EditButton)
					arg_43_0.focusedButton:SetEditButtonEnabled(false)
				end
			end

			arg_43_0.focusedButton = var_43_0
		end

		return true
	end)
	arg_29_0:addEventHandler("gain_focus", function(arg_44_0, arg_44_1)
		local var_44_0 = Engine.DDJFBBJAIG() and arg_44_0.Loadouts or arg_44_0.InGameLoadouts
		local var_44_1 = LUI.FlowManager.GetScopedData(arg_44_0)
		local var_44_2 = false

		if var_44_1.menuState == var_0_12.loadoutEdit then
			if arg_44_0.LoadoutSelectButtons then
				arg_44_0.LoadoutSelectButtons:processEvent({
					name = "gain_focus",
					controller = arg_44_1.controller
				})

				var_44_2 = true
			end
		else
			var_44_0:processEvent({
				name = "gain_focus",
				controller = arg_44_1.controller
			})

			var_44_2 = true
		end

		return var_44_2
	end)
	var_0_18(arg_29_0)

	if LUI.IsLastInputKeyboardMouse(arg_29_1) and var_29_3.menuState == var_0_12.loadoutSelect then
		local var_29_15 = var_29_4:GetBuiltChildren()

		if #var_29_15 > 0 then
			if Engine.DDJFBBJAIG() then
				arg_29_0.focusedButton = var_29_15[1]

				local var_29_16 = var_29_15[1].LoadoutButton

				var_29_16.refreshDetailsGrid(var_29_16, {
					name = "button_over"
				})
			else
				local var_29_17 = var_29_15[1]

				for iter_29_0, iter_29_1 in ipairs(var_29_15) do
					if var_0_23(arg_29_0, arg_29_1, iter_29_1.LoadoutButton.index, iter_29_1.LoadoutButton.isDefault) then
						var_29_17 = iter_29_1
					end
				end

				var_29_17.LoadoutButton.refreshDetailsGrid(var_29_17.LoadoutButton, {
					name = "button_over"
				})

				arg_29_0.focusedButton = var_29_17
			end
		end
	end

	LUI.TextChat.SetupMenuForNoLine(arg_29_0)

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.IsThirdGameMode() then
			if not Onboarding.LoadoutCP.WasCompleted(arg_29_0, arg_29_1) then
				LUI.FlowManager.RequestPopupMenu(arg_29_0, "onboardingpopup", true, arg_29_1, false, ONBOARDING_DATA.GetOnboardingLoadoutData())
				Onboarding.LoadoutCP.MarkCompleted(arg_29_0, arg_29_1)
			end
		elseif MLG.IsCDLActive(arg_29_1) then
			if not Onboarding.CDL.WasCompleted(arg_29_0, arg_29_1) then
				LUI.FlowManager.RequestPopupMenu(arg_29_0, "onboardingpopup", true, arg_29_1, false, ONBOARDING_DATA.GetOnboardingCDLData())
				Onboarding.CDL.MarkCompleted(arg_29_0, arg_29_1)
			end
		elseif CONDITIONS.IsBRGameType() then
			if not Onboarding.WZDropKit.WasCompleted(arg_29_0, arg_29_1) then
				LUI.FlowManager.RequestPopupMenu(arg_29_0, "onboardingpopup", true, arg_29_1, false, ONBOARDING_DATA.GetOnboardingWZDropKitData())
				Onboarding.WZDropKit.MarkCompleted(arg_29_0, arg_29_1)
			end
		elseif not Onboarding.Loadout.WasCompleted(arg_29_0, arg_29_1) then
			LUI.FlowManager.RequestPopupMenu(arg_29_0, "onboardingpopup", true, arg_29_1, false, ONBOARDING_DATA.GetOnboardingLoadoutData())
			Onboarding.Loadout.MarkCompleted(arg_29_0, arg_29_1)
		end

		arg_29_0:registerEventHandler("update_bundle_upsell", function(arg_45_0, arg_45_1)
			arg_45_0:UpdateBundleUpsell(arg_29_1, arg_45_1.weaponRef)

			return true
		end)
	end

	arg_29_0:registerEventHandler("lui_game_start_notify", function(arg_46_0, arg_46_1)
		local var_46_0 = LUI.FlowManager.GetScopedData(arg_46_0)

		if var_46_0.cacSessionDlogOnGoing then
			METRICS.CacSessionEndSendDLogEvent(arg_29_1, var_46_0.sessionID, var_46_0.cacSessionStartTime, METRICS.CacExitReasons.GAME_START_INTERRUPT)

			var_46_0.cacSessionDlogOnGoing = nil
		end
	end)

	if LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_29_1) then
		ACTIONS.AnimateSequence(arg_29_0, "RestrictionWarningOn")
	else
		ACTIONS.AnimateSequence(arg_29_0, "RestrictionWarningOff")
	end

	if arg_29_0.BundleUpsellButton then
		arg_29_0.BundleUpsellButton:SetUpsellMenu("LoadoutSelect")
	end
end

local function var_0_29()
	local var_47_0 = LUI.FlowManager.GetScopedData("LoadoutSelect")

	if var_47_0.cacSessionDlogOnGoing then
		METRICS.CacSessionEndSendDLogEvent(var_47_0.controllerIndex, var_47_0.sessionID, var_47_0.cacSessionStartTime, METRICS.CacExitReasons.UNEXPECTED_CLOSE)

		var_47_0.cacSessionDlogOnGoing = nil
	end
end

function LoadoutSelect(arg_48_0, arg_48_1)
	local var_48_0 = LUI.UIElement.new()

	var_48_0.id = "LoadoutSelect"
	var_48_0._animationSets = var_48_0._animationSets or {}
	var_48_0._sequences = var_48_0._sequences or {}

	local var_48_1 = arg_48_1 and arg_48_1.controllerIndex

	if not var_48_1 and not Engine.DDJFBBJAIG() then
		var_48_1 = var_48_0:getRootController()
	end

	assert(var_48_1)
	var_0_16(var_48_0, var_48_1, arg_48_1)

	var_48_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_48_1
	})
	var_48_0.HelperBar.id = "HelperBar"

	var_48_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_48_0.HelperBar:setPriority(10)
	var_48_0:addElement(var_48_0.HelperBar)

	local var_48_2 = var_48_0
	local var_48_3

	if CONDITIONS.InGame(var_48_0) then
		var_48_3 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_48_1
		})
		var_48_3.id = "InGameMenuBackground"

		var_48_3:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_48_0:addElement(var_48_3)

		var_48_0.InGameMenuBackground = var_48_3
	end

	local var_48_4
	local var_48_5 = LUI.UIImage.new()

	var_48_5.id = "Vignette"

	var_48_5:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_48_5:SetAlpha(0.5, 0)
	var_48_5:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_48_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -185, _1080p * -1058, 0, 0)
	var_48_0:addElement(var_48_5)

	var_48_0.Vignette = var_48_5

	local var_48_6

	if not Engine.DDJFBBJAIG() then
		local var_48_7 = MenuBuilder.BuildRegisteredType("TabBacker", {
			controllerIndex = var_48_1
		})

		var_48_7.id = "TabBacker"

		var_48_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
		var_48_0:addElement(var_48_7)

		var_48_0.TabBacker = var_48_7
	end

	local var_48_8
	local var_48_9 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_48_1
	})

	var_48_9.id = "MenuTitle"

	var_48_9.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_LOADOUT")), 0)
	var_48_9.Line:SetLeft(0, 0)
	var_48_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 562, 0, _1080p * 100)
	var_48_0:addElement(var_48_9)

	var_48_0.MenuTitle = var_48_9

	local var_48_10

	if CONDITIONS.InFrontend(var_48_0) then
		local var_48_11 = {
			scrollingThresholdX = 1,
			buildArrowsLabel = false,
			maxVelocity = 5000,
			adjustSizeToContent = true,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleColumns = 1,
			maxVisibleRows = 10,
			wrapY = true,
			arrowsVerticalOffset = 0,
			forcePrimaryAxisScrolling = true,
			springCoefficient = 400,
			controllerIndex = var_48_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("FrontendLoadoutButton", {
					controllerIndex = var_48_1
				})
			end,
			refreshChild = function(arg_50_0, arg_50_1, arg_50_2)
				return
			end,
			spacingX = _1080p * 8,
			spacingY = _1080p * 8,
			columnWidth = _1080p * 370,
			rowHeight = _1080p * 60,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_48_10 = LUI.UIGrid.new(var_48_11)
		var_48_10.id = "Loadouts"

		var_48_10:setUseStencil(false)
		var_48_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 475, _1080p * 170, _1080p * 503)
		var_48_0:addElement(var_48_10)

		var_48_0.Loadouts = var_48_10
	end

	local var_48_12

	if CONDITIONS.InGame(var_48_0) then
		local var_48_13 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
			controllerIndex = var_48_1
		})

		var_48_13.id = "UnlockText"

		var_48_13.Description:SetRight(_1080p * 500, 0)
		var_48_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 509, _1080p * 556, _1080p * 588)
		var_48_0:addElement(var_48_13)

		var_48_0.UnlockText = var_48_13
	end

	local var_48_14

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
		local var_48_15 = {
			scrollingThresholdX = 0,
			buildArrowsLabel = false,
			maxVelocity = 5000,
			adjustSizeToContent = true,
			scrollingThresholdY = 1,
			wrapX = false,
			maxVisibleColumns = 1,
			wrapY = true,
			arrowsVerticalOffset = 0,
			forcePrimaryAxisScrolling = true,
			springCoefficient = 400,
			maxVisibleRows = SubtractForSplitscreen(10, 5),
			controllerIndex = var_48_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("InGameLoadoutButton", {
					controllerIndex = var_48_1
				})
			end,
			refreshChild = function(arg_52_0, arg_52_1, arg_52_2)
				return
			end,
			spacingX = _1080p * 8,
			spacingY = _1080p * 8,
			columnWidth = _1080p * 550,
			rowHeight = _1080p * 60,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_48_14 = LUI.UIGrid.new(var_48_15)
		var_48_14.id = "InGameLoadoutsMp"

		var_48_14:setUseStencil(true)
		var_48_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 475, _1080p * 216, _1080p * 696)
		var_48_0:addElement(var_48_14)

		var_48_0.InGameLoadoutsMp = var_48_14
	end

	local var_48_16

	if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
		local var_48_17 = {
			scrollingThresholdX = 0,
			buildArrowsLabel = false,
			maxVelocity = 5000,
			adjustSizeToContent = true,
			scrollingThresholdY = 1,
			wrapX = false,
			maxVisibleColumns = 1,
			wrapY = true,
			arrowsVerticalOffset = 0,
			forcePrimaryAxisScrolling = true,
			springCoefficient = 400,
			maxVisibleRows = SubtractForSplitscreen(10, 5),
			controllerIndex = var_48_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("BRInGameLoadoutButton", {
					controllerIndex = var_48_1
				})
			end,
			refreshChild = function(arg_54_0, arg_54_1, arg_54_2)
				return
			end,
			spacingX = _1080p * 8,
			spacingY = _1080p * 8,
			columnWidth = _1080p * 500,
			rowHeight = _1080p * 40,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_48_16 = LUI.UIGrid.new(var_48_17)
		var_48_16.id = "InGameLoadoutsBr"

		var_48_16:setUseStencil(false)
		var_48_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 696)
		var_48_0:addElement(var_48_16)

		var_48_0.InGameLoadoutsBr = var_48_16
	end

	local var_48_18
	local var_48_19 = MenuBuilder.BuildRegisteredType("LoadoutSelectButtons", {
		controllerIndex = var_48_1
	})

	var_48_19.id = "LoadoutSelectButtons"

	var_48_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 536, _1080p * 1686, _1080p * 170, _1080p * 976)
	var_48_0:addElement(var_48_19)

	var_48_0.LoadoutSelectButtons = var_48_19

	local var_48_20

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
		local var_48_21 = {
			spacing = 4,
			wrap = false,
			tabHeight = _1080p * 52,
			buildTab = function()
				return MenuBuilder.BuildRegisteredType("SubMenuTab", {
					controllerIndex = var_48_1
				})
			end,
			controllerIndex = var_48_1
		}

		var_48_20 = LUI.TabManager.new(var_48_21)
		var_48_20.id = "InGameLoadoutTabs"

		var_48_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 539, _1080p * 108, _1080p * 160)
		var_48_0:addElement(var_48_20)

		var_48_0.InGameLoadoutTabs = var_48_20
	end

	local var_48_22

	if not Engine.DDJFBBJAIG() then
		var_48_22 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_48_1
		})
		var_48_22.id = "InGameMenuTimerStatus"

		var_48_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 54, _1080p * 104)
		var_48_0:addElement(var_48_22)

		var_48_0.InGameMenuTimerStatus = var_48_22
	end

	local var_48_23
	local var_48_24 = LUI.UIStyledText.new()

	var_48_24.id = "ListNumber"

	var_48_24:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_48_24:setText("", 0)
	var_48_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_48_24:SetAlignment(LUI.Alignment.Center)
	var_48_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 227, _1080p * 391, _1080p * 908, _1080p * 932)
	var_48_0:addElement(var_48_24)

	var_48_0.ListNumber = var_48_24

	local var_48_25

	if CONDITIONS.InFrontendPublicMP(var_48_0) then
		local var_48_26 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_48_1
		})

		var_48_26.id = "MPPlayerDetails"

		var_48_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_48_0:addElement(var_48_26)

		var_48_0.MPPlayerDetails = var_48_26
	end

	local var_48_27

	if CONDITIONS.InFrontendPublic(var_48_0) then
		local var_48_28 = MenuBuilder.BuildRegisteredType("WeaponMasterSummary", {
			controllerIndex = var_48_1
		})

		var_48_28.id = "MasterChallenges"

		var_48_28:SetAlpha(0, 0)
		var_48_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -672, _1080p * -96, _1080p * 216, _1080p * 396)
		var_48_0:addElement(var_48_28)

		var_48_0.MasterChallenges = var_48_28
	end

	local var_48_29

	if not Engine.DDJFBBJAIG() and not CONDITIONS.IsSplitscreen(var_48_0) then
		var_48_29 = MenuBuilder.BuildRegisteredType("TalkersList", {
			controllerIndex = var_48_1
		})
		var_48_29.id = "TalkersList"

		var_48_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -447, _1080p * -96, _1080p * 154, _1080p * 529)
		var_48_0:addElement(var_48_29)

		var_48_0.TalkersList = var_48_29
	end

	local var_48_30

	if CONDITIONS.InFrontend(var_48_0) then
		local var_48_31 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_48_1
		})

		var_48_31.id = "LobbyMembersFooter"

		var_48_31:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_48_0:addElement(var_48_31)

		var_48_0.LobbyMembersFooter = var_48_31
	end

	local var_48_32

	if Engine.DDJFBBJAIG() then
		local var_48_33 = LUI.UIStyledText.new()

		var_48_33.id = "KBMLoadoutOptionsPrompt"

		var_48_33:SetAlpha(0, 0)
		var_48_33:setText(Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS_PROMPT"), 0)
		var_48_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_48_33:SetAlignment(LUI.Alignment.Left)
		var_48_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 568, _1080p * 1068, _1080p * 142, _1080p * 160)
		var_48_0:addElement(var_48_33)

		var_48_0.KBMLoadoutOptionsPrompt = var_48_33
	end

	local var_48_34
	local var_48_35 = MenuBuilder.BuildRegisteredType("RestrictionLoadoutWarning", {
		controllerIndex = var_48_1
	})

	var_48_35.id = "RestrictionLoadoutWarning"

	var_48_35:SetAlpha(0, 0)
	var_48_35:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -180, _1080p * 180, _1080p * 114, _1080p * 144)
	var_48_0:addElement(var_48_35)

	var_48_0.RestrictionLoadoutWarning = var_48_35

	local var_48_36

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen(var_48_0) then
		var_48_36 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
			controllerIndex = var_48_1
		})
		var_48_36.id = "LoadoutsScrollbar"

		var_48_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 107, _1080p * 170, _1080p * 502)
		var_48_0:addElement(var_48_36)

		var_48_0.LoadoutsScrollbar = var_48_36
	end

	local var_48_37

	if Engine.DDJFBBJAIG() then
		local var_48_38 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
			controllerIndex = var_48_1
		})

		var_48_38.id = "BundleUpsellButton"

		var_48_38:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -546, _1080p * -96, _1080p * 775, _1080p * 979)
		var_48_0:addElement(var_48_38)

		var_48_0.BundleUpsellButton = var_48_38
	end

	local var_48_39

	if Engine.DDJFBBJAIG() then
		var_48_39 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_48_1
		})
		var_48_39.id = "CDLRestrictionTag"

		var_48_39.CDLInfo:SetAlpha(1, 0)
		var_48_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_48_0:addElement(var_48_39)

		var_48_0.CDLRestrictionTag = var_48_39
	end

	local function var_48_40()
		return
	end

	var_48_0._sequences.DefaultSequence = var_48_40

	local var_48_41

	if CONDITIONS.InFrontend(var_48_0) then
		local var_48_42 = {
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_10:RegisterAnimationSequence("LoadoutButtons", var_48_42)
	end

	local var_48_43 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 534
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1684
		}
	}

	var_48_19:RegisterAnimationSequence("LoadoutButtons", var_48_43)

	local var_48_44 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_24:RegisterAnimationSequence("LoadoutButtons", var_48_44)

	local function var_48_45()
		if CONDITIONS.InFrontend(var_48_0) then
			var_48_10:AnimateSequence("LoadoutButtons")
		end

		var_48_19:AnimateSequence("LoadoutButtons")
		var_48_24:AnimateSequence("LoadoutButtons")
	end

	var_48_0._sequences.LoadoutButtons = var_48_45

	local var_48_46

	if CONDITIONS.InFrontend(var_48_0) then
		local var_48_47 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_10:RegisterAnimationSequence("LoadoutEdit", var_48_47)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
		local var_48_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_14:RegisterAnimationSequence("LoadoutEdit", var_48_48)
	end

	if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
		local var_48_49 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_16:RegisterAnimationSequence("LoadoutEdit", var_48_49)
	end

	local var_48_50 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1246
		}
	}

	var_48_19:RegisterAnimationSequence("LoadoutEdit", var_48_50)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
		local var_48_51 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_20:RegisterAnimationSequence("LoadoutEdit", var_48_51)
	end

	local var_48_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_24:RegisterAnimationSequence("LoadoutEdit", var_48_52)

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen(var_48_0) then
		local var_48_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_36:RegisterAnimationSequence("LoadoutEdit", var_48_53)
	end

	local function var_48_54()
		if CONDITIONS.InFrontend(var_48_0) then
			var_48_10:AnimateSequence("LoadoutEdit")
		end

		if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
			var_48_14:AnimateSequence("LoadoutEdit")
		end

		if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
			var_48_16:AnimateSequence("LoadoutEdit")
		end

		var_48_19:AnimateSequence("LoadoutEdit")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
			var_48_20:AnimateSequence("LoadoutEdit")
		end

		var_48_24:AnimateSequence("LoadoutEdit")

		if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen(var_48_0) then
			var_48_36:AnimateSequence("LoadoutEdit")
		end
	end

	var_48_0._sequences.LoadoutEdit = var_48_54

	local var_48_55

	if CONDITIONS.InFrontend(var_48_0) then
		local var_48_56 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_10:RegisterAnimationSequence("LoadoutEditSnap", var_48_56)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
		local var_48_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_14:RegisterAnimationSequence("LoadoutEditSnap", var_48_57)
	end

	if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
		local var_48_58 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_16:RegisterAnimationSequence("LoadoutEditSnap", var_48_58)
	end

	local var_48_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1246
		}
	}

	var_48_19:RegisterAnimationSequence("LoadoutEditSnap", var_48_59)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
		local var_48_60 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_20:RegisterAnimationSequence("LoadoutEditSnap", var_48_60)
	end

	local var_48_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_24:RegisterAnimationSequence("LoadoutEditSnap", var_48_61)

	local function var_48_62()
		if CONDITIONS.InFrontend(var_48_0) then
			var_48_10:AnimateSequence("LoadoutEditSnap")
		end

		if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
			var_48_14:AnimateSequence("LoadoutEditSnap")
		end

		if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
			var_48_16:AnimateSequence("LoadoutEditSnap")
		end

		var_48_19:AnimateSequence("LoadoutEditSnap")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
			var_48_20:AnimateSequence("LoadoutEditSnap")
		end

		var_48_24:AnimateSequence("LoadoutEditSnap")
	end

	var_48_0._sequences.LoadoutEditSnap = var_48_62

	local var_48_63

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
		local var_48_64 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_14:RegisterAnimationSequence("InGameLoadoutButtons", var_48_64)
	end

	local var_48_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 680
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1022
		}
	}

	var_48_19:RegisterAnimationSequence("InGameLoadoutButtons", var_48_65)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
		local var_48_66 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_20:RegisterAnimationSequence("InGameLoadoutButtons", var_48_66)
	end

	local var_48_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_24:RegisterAnimationSequence("InGameLoadoutButtons", var_48_67)

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen(var_48_0) then
		local var_48_68 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_36:RegisterAnimationSequence("InGameLoadoutButtons", var_48_68)
	end

	local function var_48_69()
		if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
			var_48_14:AnimateSequence("InGameLoadoutButtons")
		end

		var_48_19:AnimateSequence("InGameLoadoutButtons")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
			var_48_20:AnimateSequence("InGameLoadoutButtons")
		end

		var_48_24:AnimateSequence("InGameLoadoutButtons")

		if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen(var_48_0) then
			var_48_36:AnimateSequence("InGameLoadoutButtons")
		end
	end

	var_48_0._sequences.InGameLoadoutButtons = var_48_69

	local var_48_70

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
		local var_48_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 170
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 650
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 117
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 496
			}
		}

		var_48_14:RegisterAnimationSequence("Splitscreen", var_48_71)
	end

	local var_48_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1026
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 220
		}
	}

	var_48_19:RegisterAnimationSequence("Splitscreen", var_48_72)

	if not Engine.DDJFBBJAIG() then
		local var_48_73 = {
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

		var_48_22:RegisterAnimationSequence("Splitscreen", var_48_73)
	end

	local var_48_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 232
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 532
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 396
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 556
		}
	}

	var_48_24:RegisterAnimationSequence("Splitscreen", var_48_74)

	local function var_48_75()
		if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
			var_48_14:AnimateSequence("Splitscreen")
		end

		var_48_19:AnimateSequence("Splitscreen")

		if not Engine.DDJFBBJAIG() then
			var_48_22:AnimateSequence("Splitscreen")
		end

		var_48_24:AnimateSequence("Splitscreen")
	end

	var_48_0._sequences.Splitscreen = var_48_75

	local var_48_76

	if CONDITIONS.InGame(var_48_0) then
		local var_48_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_3:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_77)
	end

	local var_48_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_5:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_78)

	local var_48_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_9:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_79)

	if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
		local var_48_80 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_16:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_80)
	end

	local var_48_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 648
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1792
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1022
		}
	}

	var_48_19:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_81)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
		local var_48_82 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_48_20:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_82)
	end

	local var_48_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_24:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_83)

	if not Engine.DDJFBBJAIG() and not CONDITIONS.IsSplitscreen(var_48_0) then
		local var_48_84 = {}

		var_48_29:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_48_84)
	end

	local function var_48_85()
		if CONDITIONS.InGame(var_48_0) then
			var_48_3:AnimateSequence("InGameLoadoutButtonsBr")
		end

		var_48_5:AnimateSequence("InGameLoadoutButtonsBr")
		var_48_9:AnimateSequence("InGameLoadoutButtonsBr")

		if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
			var_48_16:AnimateSequence("InGameLoadoutButtonsBr")
		end

		var_48_19:AnimateSequence("InGameLoadoutButtonsBr")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_48_0, var_48_1) then
			var_48_20:AnimateSequence("InGameLoadoutButtonsBr")
		end

		var_48_24:AnimateSequence("InGameLoadoutButtonsBr")

		if not Engine.DDJFBBJAIG() and not CONDITIONS.IsSplitscreen(var_48_0) then
			var_48_29:AnimateSequence("InGameLoadoutButtonsBr")
		end
	end

	var_48_0._sequences.InGameLoadoutButtonsBr = var_48_85

	local var_48_86
	local var_48_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_35:RegisterAnimationSequence("RestrictionWarningOff", var_48_87)

	local function var_48_88()
		var_48_35:AnimateSequence("RestrictionWarningOff")
	end

	var_48_0._sequences.RestrictionWarningOff = var_48_88

	local var_48_89
	local var_48_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_48_35:RegisterAnimationSequence("RestrictionWarningOn", var_48_90)

	local function var_48_91()
		var_48_35:AnimateSequence("RestrictionWarningOn")
	end

	var_48_0._sequences.RestrictionWarningOn = var_48_91

	local var_48_92

	if Engine.DDJFBBJAIG() then
		local var_48_93 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 124
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 154
			}
		}

		var_48_39:RegisterAnimationSequence("ChallengesOn", var_48_93)
	end

	local function var_48_94()
		if Engine.DDJFBBJAIG() then
			var_48_39:AnimateSequence("ChallengesOn")
		end
	end

	var_48_0._sequences.ChallengesOn = var_48_94

	local function var_48_95()
		return
	end

	var_48_0._sequences.ChallengesOff = var_48_95

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) and CONDITIONS.IsSplitscreen(var_48_0) then
		local var_48_96 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_48_36,
			startCap = var_48_36.startCap,
			endCap = var_48_36.endCap,
			sliderArea = var_48_36.sliderArea,
			slider = var_48_36.sliderArea and var_48_36.sliderArea.slider,
			fixedSizeSlider = var_48_36.sliderArea and var_48_36.sliderArea.fixedSizeSlider
		})

		var_48_14:AddScrollbar(var_48_96)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_48_0) then
		var_48_14:AddItemNumbers(var_48_24)
	end

	if CONDITIONS.InGameAndBRLoadoutSelect(var_48_0) then
		var_48_16:AddItemNumbers(var_48_24)
	end

	var_48_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_48_97 = LUI.UIBindButton.new()

	var_48_97.id = "selfBindButton"

	var_48_0:addElement(var_48_97)

	var_48_0.bindButton = var_48_97

	var_0_28(var_48_0, var_48_1, arg_48_1)

	if CONDITIONS.IsSplitscreen(var_48_0) then
		ACTIONS.AnimateSequence(var_48_0, "Splitscreen")
	end

	return var_48_0
end

MenuBuilder.registerType("LoadoutSelect", LoadoutSelect)
LUI.FlowManager.RegisterStackPopBehaviour("LoadoutSelect", var_0_29)
LockTable(_M)
