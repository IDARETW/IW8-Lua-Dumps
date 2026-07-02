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

local function var_0_14(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	for iter_3_0 = 0, 1 do
		local var_3_0 = arg_3_2[arg_3_3].weaponSetups[iter_3_0]
		local var_3_1 = WEAPON.GetWeaponModelNameFromPlayerData(var_3_0.weapon:get(), var_3_0, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_3_1
		})
		local var_3_2 = iter_3_0 == 0 and arg_3_0.primaryWeaponModel or arg_3_0.secondaryWeaponModel
		local var_3_3 = WEAPON.GenerateWeaponTable(var_3_0)

		WEAPON.SetModelIfLoaded(arg_3_1, var_3_2, var_3_1, {
			adjustSandbags = iter_3_0 == 0,
			modelWeaponTable = var_3_3
		})
	end

	CLIENT_MODEL.UpdateModelsForLoadout(arg_3_0, arg_3_1, arg_3_3)
	WEAPON.SetResetDynBones({
		FrontEndScene.ClientWeapons.GunTablePrimary,
		FrontEndScene.ClientWeapons.GunTableSecondary
	})
end

local function var_0_15(arg_4_0)
	local var_4_0 = LUI.FlowManager.GetScopedData(arg_4_0)
	local var_4_1 = PlayerData.BFFBGAJGD(var_4_0.controllerIndex, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	var_0_14(arg_4_0, var_4_0.controllerIndex, var_4_1, var_4_0.selectedLoadoutIndex)
	CLIENT_MODEL.SetAllModelsModifiable(var_4_0.controllerIndex)
end

local function var_0_16(arg_5_0, arg_5_1, arg_5_2)
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

local function var_0_17(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = PlayerData.BFFBGAJGD(arg_6_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	if Engine.DDJFBBJAIG() then
		Streaming.BDDBGGIC(true)
		var_0_16(arg_6_0, arg_6_1, var_6_0)
	end

	DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_6_0, arg_6_1)
end

local function var_0_18(arg_7_0, arg_7_1)
	if Engine.DDJFBBJAIG() then
		arg_7_0.Loadouts:SetMouseFocusBlocker(not arg_7_1)
	else
		arg_7_0.InGameLoadouts:SetMouseFocusBlocker(not arg_7_1)
	end
end

local function var_0_19(arg_8_0)
	if Engine.DDJFBBJAIG() then
		arg_8_0.Loadouts:RefreshContent()
	else
		arg_8_0.InGameLoadouts:RefreshContent()
	end
end

local var_0_20 = {
	PREVIEW = "LoadoutPreview",
	EDIT = "LoadoutEdit"
}

local function var_0_21(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_2 and arg_9_2.snap and "Snap" or ""

	arg_9_1 = arg_9_1 .. var_9_0

	local var_9_1 = WZWIP.CheckForApplyPrependWZWipPrefix(arg_9_1)

	for iter_9_0, iter_9_1 in pairs(arg_9_0.LOADOUT_BUTTONS) do
		iter_9_1._isInPreviewState = arg_9_1 == var_0_20.PREVIEW

		if iter_9_1._sequences[var_9_1] then
			ACTIONS.AnimateSequence(iter_9_1, var_9_1)
		else
			ACTIONS.AnimateSequence(iter_9_1, arg_9_1)
		end
	end
end

local function var_0_22(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0.BundleUpsellButton then
		if Dvar.IBEGCHEFE("LTSNLQNRKO") and Dvar.IBEGCHEFE("NKRLMNTNRS") and arg_10_0._bundleVariants[arg_10_2] and not CONDITIONS.AreRestrictionsActive(arg_10_1) and arg_10_0._bundleVariants[arg_10_2][1] then
			arg_10_0.BundleUpsellButton:SetupUpsellButtonWithBundleID(arg_10_1, arg_10_0._bundleVariants[arg_10_2][1].bundleID)
		else
			arg_10_0.BundleUpsellButton:HideButton()
		end
	end
end

local function var_0_23(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
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

	var_0_21(arg_11_0, "LoadoutEdit")
	ACTIONS.AnimateSequence(arg_11_0, "LoadoutEdit")

	local function var_11_1(arg_12_0, arg_12_1)
		if not CONDITIONS.IsMagmaGameMode() and not Onboarding.WeaponMasteryChallenges.WasCompleted(arg_12_0, arg_12_1) then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingWeaponMasteryChallengesData())
			Onboarding.WeaponMasteryChallenges.MarkCompleted(arg_12_0, arg_12_1)
		end
	end

	local function var_11_2(arg_13_0, arg_13_1)
		if CONDITIONS.IsWZWipFlowEnabled() and Dvar.IBEGCHEFE("ui_ob_wz_show_weapon_mastery") and CONDITIONS.AreWZLoadoutsEnabled() and not Onboarding.WeaponCH2WZMasteryChallenges.WasCompleted(arg_13_0, arg_13_1) then
			LUI.FlowManager.RequestPopupMenu(arg_13_0, "onboardingpopup", true, arg_13_1, false, ONBOARDING_DATA.GetOnboardingCH2WZWeaponMasteryChallengesData())
			Onboarding.WeaponCH2WZMasteryChallenges.MarkCompleted(arg_13_0, arg_13_1)
		end
	end

	;(Engine.DDJFBBJAIG() and arg_11_0.Loadouts or arg_11_0.InGameLoadouts):processEvent({
		name = "lose_focus",
		controller = arg_11_1
	})

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.IsBlueprintStoreEnabled() and not Onboarding.BlueprintStore.WasCompleted(self, arg_11_1) then
			local var_11_3

			if CONDITIONS.IsWZWipFlowEnabled() then
				var_11_3 = ONBOARDING_DATA.GetOnboardingCH2WZBlueprintStoreData()
			else
				var_11_3 = ONBOARDING_DATA.GetOnboardingBlueprintStoreData()
			end

			if CONDITIONS.IsWZWipFlowEnabled() then
				if not Onboarding.WeaponCH2WZMasteryChallenges.WasCompleted(self, arg_11_1) then
					local function var_11_4(arg_14_0, arg_14_1)
						ACTIONS.LeaveMenu(arg_14_0)
						var_11_2(self, arg_14_1)
					end

					var_11_3.confirmButton.action = var_11_4
				end
			elseif not Onboarding.WeaponMasteryChallenges.WasCompleted(self, arg_11_1) then
				local function var_11_5(arg_15_0, arg_15_1)
					ACTIONS.LeaveMenu(arg_15_0)
					var_11_1(self, arg_15_1)
				end

				var_11_3.confirmButton.action = var_11_5
			end

			LUI.FlowManager.RequestPopupMenu(self, "onboardingpopup", true, arg_11_1, false, var_11_3)
			Onboarding.BlueprintStore.MarkCompleted(self, arg_11_1)
		elseif CONDITIONS.IsWZWipFlowEnabled() then
			var_11_2(self, arg_11_1)
		else
			var_11_1(self, arg_11_1)
		end
	end

	arg_11_0.LoadoutSelectButtons:processEvent({
		name = "gain_focus",
		controller = arg_11_1
	})
	var_0_18(arg_11_0, false)
	arg_11_0.LoadoutSelectButtons:SetMouseHandling(true)
	arg_11_0.MenuTitle:SetTitle(arg_11_2.name:get())

	if arg_11_0.InGameLoadoutTabs then
		arg_11_0.InGameLoadoutTabs:DisableAll()
	end

	if arg_11_0.BundleUpsellButton then
		local var_11_6 = arg_11_2.weaponSetups[WEAPON.PrimarySlot].weapon:get()

		arg_11_0:UpdateBundleUpsell(arg_11_1, var_11_6)
	end
end

local function var_0_24(arg_16_0, arg_16_1)
	Engine.DHFCHIIJCA("loadout_showcase")

	local var_16_0 = LUI.FlowManager.GetScopedData(arg_16_0)

	if var_16_0.menuState == var_0_12.loadoutEdit then
		METRICS.LoadoutSessionSendDLogEvent(arg_16_1, var_16_0.sessionID, var_16_0.loadoutSessionStartTime, var_16_0.selectedLoadoutIndex)
		LAYOUT.FadeInAspectRatioFadeFrame(arg_16_0, 300)
	end

	var_16_0.menuState = var_0_12.loadoutSelect

	arg_16_0:dispatchEventToChildren({
		name = "menu_state_updated",
		menuState = var_16_0.menuState
	})
	arg_16_0.LoadoutSelectButtons:processEvent({
		name = "lose_focus",
		controller = arg_16_1
	})

	local var_16_1 = Engine.DDJFBBJAIG() and arg_16_0.Loadouts or arg_16_0.InGameLoadouts

	var_0_18(arg_16_0, true)
	var_0_19(arg_16_0)
	var_16_1:processEvent({
		name = "gain_focus",
		controller = arg_16_1
	})

	if Engine.DDJFBBJAIG() then
		if LUI.IsLastInputGamepad(arg_16_1) then
			arg_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				clickable = true,
				priority = 20,
				side = "left",
				gamepad_only = true,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS")
			})
		else
			arg_16_0.KBMLoadoutOptionsPrompt:SetAlpha(1)
		end
	end

	var_0_21(arg_16_0, "LoadoutPreview")

	local var_16_2 = "LoadoutButtons"

	if not Engine.DDJFBBJAIG() then
		var_16_2 = (var_16_0.openedForPlunderBox == true or CONDITIONS.IsBRLoadoutGameType(arg_16_1)) and "InGameLoadoutButtonsBr" or "InGameLoadoutButtons"
	end

	ACTIONS.AnimateSequence(arg_16_0, var_16_2)
	arg_16_0.LoadoutSelectButtons:SetMouseHandling(false)

	if arg_16_0.InGameLoadoutTabs then
		arg_16_0.InGameLoadoutTabs:EnableAll()
	end

	if not Engine.DDJFBBJAIG() then
		arg_16_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_LOADOUT"))
	else
		arg_16_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/EDIT_LOADOUTS"))
	end

	if arg_16_0.BundleUpsellButton then
		arg_16_0.BundleUpsellButton:HideButton()
	end

	if arg_16_0.MasterChallenges then
		arg_16_0.MasterChallenges:SetAlpha(0)
	end
end

local function var_0_25(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = false

	if arg_17_0.selectedLoadout and arg_17_0.selectedLoadout:GetValue(arg_17_1) then
		local var_17_1 = arg_17_0.selectedLoadout:GetValue(arg_17_1)

		if arg_17_3 and var_17_1 == arg_17_2 + LOADOUT.DEFAULT_LOADOUT_INDEX_START or not arg_17_3 and var_17_1 == arg_17_2 then
			var_17_0 = true
		end
	end

	return var_17_0
end

local function var_0_26(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_2.Text and arg_18_2.Text:getText()

	arg_18_2:SetupContextualMenu({
		title = var_18_0
	})

	local var_18_1 = {
		id = "renameLoadout",
		actionName = Engine.CBBHFCGDIC("MENU/RENAME"),
		actionFunction = function()
			LOADOUT.RenameLoadout(arg_18_0, arg_18_1, arg_18_2.playerData, arg_18_2.index)
		end
	}

	arg_18_2:AddContextualMenuAction(var_18_1)

	local var_18_2 = {
		id = "copyLoadout",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/COPY_LOADOUT"),
		actionFunction = function()
			LOADOUT.OpenLoadoutCopyPopup(arg_18_1, arg_18_2.index)
		end
	}

	arg_18_2:AddContextualMenuAction(var_18_2)

	if IsOnlineMatch() then
		local var_18_3 = {
			id = "copyLoadout",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/SET_FAVORITE"),
			actionFunction = function()
				LOADOUT.SetFavoriteLoadout(arg_18_0, arg_18_1, arg_18_2.index)
			end
		}

		arg_18_2:AddContextualMenuAction(var_18_3)
	end
end

local function var_0_27(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0) do
		if iter_22_1 and iter_22_1 ~= "" and MLG.IsAttachmentRestricted(iter_22_1, arg_22_1) then
			return true
		end
	end

	return false
end

local function var_0_28(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PrimaryWeaponCluster.AttachmentsButton, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionWarningOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.SecondaryWeaponCluster.AttachmentsButton, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionWarningOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk1")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk2")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk3")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk4")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk5")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOffPerk6")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.EquipmentGridItem, "RestrictionOff")
	ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.TacticalGridItem, "RestrictionOff")

	local var_23_0 = arg_23_3 and arg_23_3.weapons[1].ref or arg_23_2.weaponSetups[0].weapon:get()

	if var_23_0 and var_23_0 ~= "" and MatchRules.CADFFHGJAE(var_23_0) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionOn")
	end

	if arg_23_3 and var_0_27(arg_23_3.weapons[1].attachments, var_23_0) or LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_23_2.weaponSetups[0].attachmentSetup, var_23_0) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PrimaryWeaponCluster, "RestrictionWarningOn")
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PrimaryWeaponCluster.AttachmentsButton, "RestrictionOn")
	end

	local var_23_1 = arg_23_3 and arg_23_3.weapons[2].ref or arg_23_2.weaponSetups[1].weapon:get()

	if var_23_1 and var_23_1 ~= "" and MatchRules.CADFFHGJAE(var_23_1) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionOn")
	end

	if arg_23_3 and var_0_27(arg_23_3.weapons[2].attachments, var_23_1) or LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_23_2.weaponSetups[1].attachmentSetup, var_23_1) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.SecondaryWeaponCluster, "RestrictionWarningOn")
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.SecondaryWeaponCluster.AttachmentsButton, "RestrictionOn")
	end

	local var_23_2 = arg_23_3 and arg_23_3.perks[1] or arg_23_2.loadoutPerks[0]:get()

	if var_23_2 and var_23_2 ~= "" and Restrictions.IsPerkRestricted(var_23_2) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk1")
	end

	local var_23_3 = arg_23_3 and arg_23_3.perks[2] or arg_23_2.loadoutPerks[1]:get()

	if var_23_3 and var_23_3 ~= "" and Restrictions.IsPerkRestricted(var_23_3) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk2")
	end

	local var_23_4 = arg_23_3 and arg_23_3.perks[3] or arg_23_2.loadoutPerks[2]:get()

	if var_23_4 and var_23_4 ~= "" and Restrictions.IsPerkRestricted(var_23_4) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk3")
	end

	local var_23_5

	if arg_23_3 then
		var_23_5 = arg_23_3.extraPerks
	else
		var_23_5 = arg_23_2.extraPerks[0]
	end

	if var_23_5 and not Restrictions.ArePerksRestricted() then
		local var_23_6 = arg_23_3 and arg_23_3.extraPerks[1] or arg_23_2.extraPerks[0]:get()

		if var_23_6 and var_23_6 ~= "" and Restrictions.IsPerkRestricted(var_23_6) then
			ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk4")
		end

		local var_23_7 = arg_23_3 and arg_23_3.extraPerks[2] or arg_23_2.extraPerks[1]:get()

		if var_23_7 and var_23_7 ~= "" and Restrictions.IsPerkRestricted(var_23_7) then
			ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk5")
		end

		local var_23_8 = arg_23_3 and arg_23_3.extraPerks[3] or arg_23_2.extraPerks[2]:get()

		if var_23_8 and var_23_8 ~= "" and Restrictions.IsPerkRestricted(var_23_8) then
			ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.PerkGridItem, "RestrictionOnPerk6")
		end
	end

	local var_23_9 = arg_23_3 and arg_23_3.lethal or arg_23_2.equipmentSetups[0].equipment:get()

	if var_23_9 and var_23_9 ~= "" and MatchRules.BAJDCAAGCG(var_23_9) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.EquipmentGridItem, "RestrictionOn")
	end

	local var_23_10 = arg_23_3 and arg_23_3.tactical or arg_23_2.equipmentSetups[1].equipment:get()

	if var_23_10 and var_23_10 ~= "" and MatchRules.BAJDCAAGCG(var_23_10) then
		ACTIONS.AnimateSequence(arg_23_0.LoadoutSelectButtons.TacticalGridItem, "RestrictionOn")
	end
end

local function var_0_29(arg_24_0)
	local var_24_0 = arg_24_0.weapons[1].ref

	if var_24_0 and var_24_0 ~= "" and MatchRules.CADFFHGJAE(var_24_0) then
		return true
	end

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.weapons[1].attachments) do
		if iter_24_1 and iter_24_1 ~= "" and MLG.IsAttachmentRestricted(iter_24_1, var_24_0) then
			return true
		end
	end

	local var_24_1 = arg_24_0.weapons[2].ref

	if var_24_1 and var_24_1 ~= "" and MatchRules.CADFFHGJAE(var_24_1) then
		return true
	end

	for iter_24_2, iter_24_3 in ipairs(arg_24_0.weapons[2].attachments) do
		if iter_24_3 and iter_24_3 ~= "" and MLG.IsAttachmentRestricted(iter_24_3, var_24_1) then
			return true
		end
	end

	local var_24_2 = arg_24_0.lethal

	if var_24_2 and var_24_2 ~= "" and MatchRules.BAJDCAAGCG(var_24_2) then
		return true
	end

	local var_24_3 = arg_24_0.tactical

	if var_24_3 and var_24_3 ~= "" and MatchRules.BAJDCAAGCG(var_24_3) then
		return true
	end

	for iter_24_4, iter_24_5 in ipairs(arg_24_0.perks) do
		if iter_24_5 and iter_24_5 ~= "" and Restrictions.IsPerkRestricted(iter_24_5) then
			return true
		end
	end

	if arg_24_0.extraPerks then
		for iter_24_6, iter_24_7 in ipairs(arg_24_0.extraPerks) do
			if iter_24_7 and iter_24_7 ~= "" and Restrictions.IsPerkRestricted(iter_24_7) then
				return true
			end
		end
	end

	return false
end

local function var_0_30(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
	local var_25_0 = Engine.DDJFBBJAIG() and arg_25_0.Loadouts or arg_25_0.InGameLoadouts
	local var_25_1 = arg_25_2.LoadoutButton
	local var_25_2 = arg_25_3[arg_25_4]

	assert(var_25_1.Text)

	var_25_1.playerData = var_25_2
	var_25_1.index = arg_25_4

	if not Engine.DDJFBBJAIG() and var_25_0.state == var_0_13.mix and arg_25_4 >= #arg_25_3 then
		var_25_1.index = arg_25_4 - #arg_25_3

		arg_25_2:SetEditButtonEnabled(false)
	end

	var_25_1.isLoadout = true
	var_25_1.isDefault = arg_25_5

	local var_25_3 = false

	if arg_25_5 and arg_25_0.defaultLoadouts then
		local var_25_4 = arg_25_0.defaultLoadouts[var_25_1.index + 1]

		var_25_3 = var_0_29(var_25_4)
	else
		var_25_3 = LOADOUT.MATCHRULES.LoadoutHasRestrictedItem(var_25_2)
	end

	if var_25_3 then
		ACTIONS.AnimateSequence(var_25_1, "RestrictionOn")
	else
		ACTIONS.AnimateSequence(var_25_1, "RestrictionOff")
	end

	if CONDITIONS.InGame() then
		if not PROGRESSION.AreCustomLoadoutsUnlocked(arg_25_1) then
			arg_25_0.UnlockText:SetAlpha(1)

			if arg_25_4 == 3 and not PROGRESSION.IsUnlocked(arg_25_1, LOOT.itemTypes.FEATURE, "loadout_4") then
				var_25_1:SetButtonDisabled(true)

				var_25_1.buttonDescription = PROGRESSION.GetUnlockText(arg_25_1, LOOT.itemTypes.FEATURE, "loadout_4")
			elseif arg_25_4 == 4 and not PROGRESSION.IsUnlocked(arg_25_1, LOOT.itemTypes.FEATURE, "loadout_5") then
				var_25_1:SetButtonDisabled(true)

				var_25_1.buttonDescription = PROGRESSION.GetUnlockText(arg_25_1, LOOT.itemTypes.FEATURE, "loadout_5")
			else
				var_25_1.buttonDescription = ""
			end
		end

		if not arg_25_5 and not Engine.BGGJFFFAFG(arg_25_1) and not CONDITIONS.InGameAndBRLoadoutSelect(arg_25_1) then
			local var_25_5 = {
				{
					button_ref = "button_start",
					keyprompt_text = LocalizeString("[{ONFOOT_MP:changeclass" .. arg_25_4 + 1 .. "}]"),
					helper_text = Engine.CBBHFCGDIC("MENU/QUICK_SWITCH")
				}
			}
			local var_25_6 = {
				promptsData = var_25_5
			}

			var_25_1:AddTooltipData(arg_25_1, var_25_6)
		else
			var_25_1:RemoveToolTipData()
		end
	end

	if not Engine.DDJFBBJAIG() then
		if var_0_25(arg_25_0, arg_25_1, var_25_1.index, var_25_1.isDefault) then
			var_25_1:SetSelected(arg_25_1, true)
		else
			var_25_1:SetSelected(arg_25_1, false)
		end

		var_25_1.defaultLoadout = arg_25_0.defaultLoadouts[var_25_1.index + 1]
		arg_25_2.EditButton.index = arg_25_4
		arg_25_2.EditButton.playerData = var_25_2

		if var_25_0.state == var_0_13.mix then
			arg_25_2:AddDividingLine(not arg_25_5 and arg_25_4 + 1 == #arg_25_3, arg_25_0.openedForPlunderBox or CONDITIONS.IsBRLoadoutGameType(arg_25_1))
		end
	end

	local var_25_7 = 0

	if CONDITIONS.InGameAndBRLoadoutSelect(arg_25_1) and not var_25_1:IsDisabled() then
		if arg_25_0.openedForPlunderBox == true then
			local var_25_8 = 0
			local var_25_9 = true

			if arg_25_5 then
				var_25_8 = tonumber(StringTable.DIFCHIGDFB(CSV.brKioskPurchases.file, CSV.brKioskPurchases.cols.type, "loadout_default", CSV.brKioskPurchases.cols.cost))
			else
				var_25_8 = tonumber(StringTable.DIFCHIGDFB(CSV.brKioskPurchases.file, CSV.brKioskPurchases.cols.type, "loadout_custom", CSV.brKioskPurchases.cols.cost))
			end

			local var_25_10 = DataSources.inGame.player.BRData.squadIndex:GetValue(arg_25_1)

			if var_25_10 then
				if var_25_10 <= 1 then
					var_25_10 = ""
				end
			else
				var_25_10 = ""
			end

			local var_25_11 = var_25_8 > DataSources.inGame.player.BRData["plunderAmount" .. var_25_10]:GetValue(arg_25_1)

			var_25_7 = var_25_8 * BRLOOT.PLUNDER_QUANTITY_SCALING_FACTOR

			var_25_1:SetCost(var_25_7, var_25_11)

			if var_25_11 == false then
				var_25_1:SetButtonDisabled(false)
			end
		else
			var_25_1:DisableCost()
			var_25_1:SetButtonDisabled(false)
		end
	end

	var_25_1.Text:setText(arg_25_5 and Engine.CBBHFCGDIC(var_25_1.defaultLoadout.name) or var_25_2.name:get())

	if not var_25_1.handlersAdded then
		local function var_25_12(arg_26_0, arg_26_1)
			if not Engine.DDJFBBJAIG() then
				if var_0_25(arg_25_0, arg_25_1, var_25_1.index, var_25_1.isDefault) then
					arg_25_0.LoadoutSelectButtons.EquippedWidget:UpdateVisibility(true)
					ACTIONS.AnimateSequence(arg_25_0.LoadoutSelectButtons.EquippedWidget, "TurnOn")
				else
					arg_25_0.LoadoutSelectButtons.EquippedWidget:UpdateVisibility(false)
				end
			end

			arg_25_0.LoadoutSelectButtons:SetupGridItems(arg_25_1, arg_26_0.index, arg_26_0.playerData, arg_26_0.isDefault and arg_26_0.defaultLoadout)

			arg_25_0._focusedLoadoutIndex = var_25_1.index

			if not Engine.DDJFBBJAIG() then
				local var_26_0 = Dvar.IBEGCHEFE("scr_br_disableLoadoutEdit") or false

				if not arg_26_0.isDefault and arg_25_0.openedForPlunderBox ~= true and not CONDITIONS.IsBRLoadoutGameType(arg_25_1) and not var_26_0 then
					arg_25_2:SetEditButtonEnabled(true)
				end
			end

			if Engine.DDJFBBJAIG() then
				var_0_14(arg_25_0, arg_25_1, arg_25_3, arg_26_0.index)
			end

			var_0_28(arg_25_0, arg_25_1, arg_26_0.playerData, arg_26_0.isDefault and arg_26_0.defaultLoadout)
		end

		var_25_1.refreshDetailsGrid = var_25_12

		var_25_1:addEventHandler("button_over", var_25_12)
		var_25_1:addEventHandler("button_over_disable", var_25_12)
		var_25_1:addEventHandler("tab_changed", var_25_12)
		var_25_1:addEventHandler("tab_changed", function(arg_27_0, arg_27_1)
			if arg_27_0.isDefault then
				arg_25_2:SetEditButtonEnabled(false)
			end
		end)

		local function var_25_13(arg_28_0, arg_28_1)
			LUI.FlowManager.GetScopedData(arg_25_0).selectedLoadoutIndex = arg_28_0.index

			var_0_23(arg_25_0, arg_25_1, var_25_2, arg_28_0.index)
		end

		if not Engine.DDJFBBJAIG() then
			var_25_1:addEventHandler("button_action", function(arg_29_0, arg_29_1)
				local var_29_0 = arg_29_0.index

				if arg_29_0.isDefault then
					var_29_0 = var_29_0 + LOADOUT.DEFAULT_LOADOUT_INDEX_START
				end

				arg_25_0.selectedLoadout:SetValue(arg_25_1, var_29_0)

				if arg_25_0.openedForPlunderBox == true then
					local var_29_1 = var_25_1.Text and var_25_1.Text:getText() or ""
					local var_29_2 = {
						defaultFocusIndex = 1,
						yesAction = function()
							arg_25_0.selectedLoadout:SetValue(arg_25_1, var_29_0)
							Engine.EBHIFJCGBH("br_loadout_purchase", var_29_0)
						end,
						message = Engine.CBBHFCGDIC("MP_BR_INGAME/DO_YOU_WANT_TO_PURCHASE_N_FOR_N", var_29_1, var_25_7)
					}

					LUI.FlowManager.RequestPopupMenu(arg_25_0, "BRLoadoutPurchaseConfirmPopup", true, arg_25_1, false, var_29_2)
				else
					arg_25_0.selectedLoadout:SetValue(arg_25_1, var_29_0)
					Engine.EBHIFJCGBH("class_select", var_29_0)

					if CONDITIONS.IsThirdGameMode(self) and not arg_29_0.isDefault then
						PlayerData.BFFBGAJGD(arg_25_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.cpLoadoutSel:set(var_29_0)
					end

					LUI.FlowManager.RequestCloseAllMenus()
					LUI.FlowManager.RequestResumeMovement()
				end

				local var_29_3 = LUI.FlowManager.GetScopedData(arg_25_0)

				if var_29_3.cacSessionDlogOnGoing then
					METRICS.CacSessionEndSendDLogEvent(arg_25_1, var_29_3.sessionID, var_29_3.cacSessionStartTime, METRICS.CacExitReasons.PLAYER_SELECTED_LOADOUT)

					var_29_3.cacSessionDlogOnGoing = nil
				end
			end)
			arg_25_2.EditButton:addEventHandler("button_action", var_25_13)
		else
			var_25_1:addEventHandler("button_action", var_25_13)
		end

		var_25_1.handlersAdded = true
	end

	if Engine.DDJFBBJAIG() then
		if IsOnlineMatch() then
			assert(arg_25_2.Star)

			local var_25_14, var_25_15 = LOADOUT.GetFavoriteLoadoutIndex(arg_25_1)
			local var_25_16 = arg_25_4 == var_25_14 and not var_25_15

			arg_25_2.Star:SetAlpha(var_25_16 and 1 or 0)
		end

		var_0_26(arg_25_0, arg_25_1, var_25_1)
	end

	if CONDITIONS.IsBRLoadoutGameType(arg_25_1) and arg_25_2.LoadoutButton and arg_25_2.LoadoutButton.BRWarning then
		local var_25_17 = arg_25_5 and var_25_1.defaultLoadout.perks[1] or var_25_2.loadoutPerks[0]:get()
		local var_25_18 = arg_25_5 and var_25_1.defaultLoadout.perks[2] or var_25_2.loadoutPerks[1]:get()
		local var_25_19 = arg_25_5 and var_25_1.defaultLoadout.perks[3] or var_25_2.loadoutPerks[2]:get()
		local var_25_20 = Cac.GetIsPerkDisabledForBR(var_25_17)
		local var_25_21 = Cac.GetIsPerkDisabledForBR(var_25_18)
		local var_25_22 = Cac.GetIsPerkDisabledForBR(var_25_19)

		arg_25_2.LoadoutButton.BRWarning:SetShowWarningIcon(var_25_20 or var_25_21 or var_25_22)
	end
end

local function var_0_31(arg_31_0, arg_31_1)
	if Engine.DDJFBBJAIG() then
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})
		Engine.DHFCHIIJCA("loadout_showcase")
		FrontEndScene.HideWeaponModels()

		local var_31_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_31_1
		})

		var_31_0:SetLimits(var_0_0, var_0_1, var_0_2, var_0_3)
		var_31_0:SetSwayValues(var_0_4, 0.06, 0.1)

		arg_31_0.FrontendCameraMover = var_31_0

		arg_31_0:addElement(var_31_0)
		arg_31_0.FrontendCameraMover:addEventHandler("update_camera_limits", function(arg_32_0, arg_32_1)
			local var_32_0 = arg_32_1.isZoomed and var_0_5 or var_0_0
			local var_32_1 = arg_32_1.isZoomed and var_0_6 or var_0_1
			local var_32_2 = arg_32_1.isZoomed and var_0_7 or var_0_2
			local var_32_3 = arg_32_1.isZoomed and var_0_8 or var_0_3

			arg_32_0:SetLimits(var_32_0, var_32_1, var_32_2, var_32_3)

			if not arg_32_1.isZoomed or not var_0_9 then
				local var_32_4 = var_0_4
			end

			arg_32_0:SetSwayValues(var_0_9, 0.06, 0.1)
		end)

		local var_31_1 = WATCH.GetEquippedWatch(arg_31_1)
		local var_31_2 = WEAPON.GetWeaponModel(arg_31_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

		arg_31_0:addElement(var_31_2)
		WATCH.SetWatchModelIfLoaded(arg_31_0, arg_31_1, var_31_2, var_31_1)
	elseif arg_31_0.InGameLoadoutsMp then
		arg_31_0.InGameLoadouts = arg_31_0.InGameLoadoutsMp
	elseif arg_31_0.InGameLoadoutsBr then
		arg_31_0.InGameLoadouts = arg_31_0.InGameLoadoutsBr
	end
end

local function var_0_32(arg_33_0, arg_33_1, arg_33_2)
	var_0_31(arg_33_0, arg_33_1)
	assert(arg_33_0.Loadouts or arg_33_0.InGameLoadouts)
	assert(arg_33_0.LoadoutSelectButtons)

	arg_33_0.UpdateBundleUpsell = var_0_22

	local var_33_0 = PlayerData.BFFBGAJGD(arg_33_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	arg_33_0.bindButton = LUI.UIBindButton.new()

	arg_33_0:addElement(arg_33_0.bindButton)

	arg_33_0.LOADOUT_BUTTONS = {
		arg_33_0.LoadoutSelectButtons.PrimaryWeaponCluster.WeaponButton,
		arg_33_0.LoadoutSelectButtons.SecondaryWeaponCluster.WeaponButton,
		arg_33_0.LoadoutSelectButtons.EquipmentGridItem,
		arg_33_0.LoadoutSelectButtons.TacticalGridItem,
		arg_33_0.LoadoutSelectButtons.PerkGridItem
	}

	local var_33_1 = false

	if CONDITIONS.IsThirdGameMode() and not Engine.DDJFBBJAIG() and Game.BFEEGCHICA(arg_33_1, "cp_open_cac") == -1 then
		var_33_1 = true
	end

	local var_33_2 = false

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsMagmaGameMode() and Game.BFEEGCHICA(arg_33_1, "ui_open_loadout_bag") then
		var_33_2 = true
	end

	if (arg_33_0.BundleUpsellButton or Dvar.IBEGCHEFE("MRKSTPMLT")) and Engine.DDJFBBJAIG() then
		arg_33_0._bundleVariants = WEAPON.GetPriorityVariants(arg_33_1, {
			excludeOwned = true,
			useBaseRefKeys = true
		})
		arg_33_0._bundleVariants = WEAPON.GetAllVariantsInStore(arg_33_1, {
			excludeOwned = true,
			useBaseRefKeys = true,
			variantsTable = arg_33_0._bundleVariants
		})
		LUI.FlowManager.GetScopedData(arg_33_0).bundleVariants = arg_33_0._bundleVariants
	end

	if not arg_33_2.openedFromScriptRequest or var_33_1 then
		assert(arg_33_0.HelperBar)
		assert(arg_33_0.HelperBar.ButtonHelperText)
		arg_33_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_33_0.bindButton:addEventHandler("button_secondary", function(arg_34_0, arg_34_1)
			local var_34_0 = LUI.FlowManager.GetScopedData(arg_33_0)

			if var_34_0.menuState == var_0_12.loadoutEdit then
				if not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", var_34_0.selectedLoadoutIndex)
				end

				if arg_33_0.selectedLoadout ~= nil and var_34_0.selectedLoadoutIndex == arg_33_0.selectedLoadout:GetValue(arg_33_1) and not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", arg_33_0.selectedLoadout:GetValue(arg_33_1))
					var_0_24(arg_33_0, arg_33_1)
				else
					var_0_24(arg_33_0, arg_33_1)
				end
			else
				if var_34_0.cacSessionDlogOnGoing then
					METRICS.CacSessionEndSendDLogEvent(arg_33_1, var_34_0.sessionID, var_34_0.cacSessionStartTime, METRICS.CacExitReasons.PLAYER_EXIT)

					var_34_0.cacSessionDlogOnGoing = nil
				end

				if CONDITIONS.IsThirdGameMode() and not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_menu_closed", 1)
					LUI.FlowManager.RequestCloseAllMenus()
					LUI.FlowManager.RequestResumeMovement()
				else
					ACTIONS.UploadStats(arg_33_0, arg_33_1)
					ACTIONS.LeaveMenu(arg_33_0)
				end
			end
		end)
		LAYOUT.SetupScalingBackgroundVignette(arg_33_0, {
			customAnimState = "ShowWeaponOverlay",
			customVignette = arg_33_0.WZVignette
		})

		if not CONDITIONS.InGame() and CONDITIONS.IsWZWipFlowEnabled() then
			ACTIONS.AnimateSequence(arg_33_0, "WZWipSetup")
		end

		if not Engine.DDJFBBJAIG() and not CONDITIONS.IsThirdGameMode() and arg_33_2.openedForPlunderBox ~= true then
			arg_33_0:addEventHandler("menu_create", function()
				arg_33_0:AddButtonHelperText({
					clickable = true,
					priority = 2,
					side = "left",
					kbmTooltipPromptOverload = "button_dismiss_pause_menu",
					button_ref = "button_start",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
				})
			end)
			arg_33_0.bindButton:addEventHandler("button_start", function(arg_36_0, arg_36_1)
				if Engine.CAADCDEEIA() then
					ACTIONS.ResumeGame(arg_36_0)
				end

				local var_36_0 = LUI.FlowManager.GetScopedData(arg_33_0)

				if var_36_0.cacSessionDlogOnGoing then
					METRICS.CacSessionEndSendDLogEvent(arg_33_1, var_36_0.sessionID, var_36_0.cacSessionStartTime, METRICS.CacExitReasons.PLAYER_EXIT)

					var_36_0.cacSessionDlogOnGoing = nil
				end

				LUI.FlowManager.RequestCloseAllMenus(arg_33_0.id, false, arg_36_1.controller)

				return true
			end)
			MenuUtils.AddDismissPauseMenuKBMHandler(arg_33_0)
		end
	elseif var_33_2 then
		arg_33_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_33_0.bindButton:addEventHandler("button_secondary", function(arg_37_0, arg_37_1)
			local var_37_0 = LUI.FlowManager.GetScopedData(arg_33_0)

			if var_37_0.menuState == var_0_12.loadoutEdit then
				if not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", var_37_0.selectedLoadoutIndex)
					var_0_24(arg_33_0, arg_33_1)
				end
			else
				Engine.EBHIFJCGBH("exit_loadout_bag", 1)
				LUI.FlowManager.RequestCloseAllMenus()
				LUI.FlowManager.RequestResumeMovement()
			end
		end)
	else
		arg_33_0.isQuickAccessShortcutsDisabled = true

		arg_33_0.bindButton:addEventHandler("button_secondary", function(arg_38_0, arg_38_1)
			local var_38_0 = LUI.FlowManager.GetScopedData(arg_33_0)

			if var_38_0.menuState == var_0_12.loadoutEdit then
				if not Engine.DDJFBBJAIG() then
					Engine.EBHIFJCGBH("class_edit", var_38_0.selectedLoadoutIndex)
				end

				arg_33_0.HelperBar.ButtonHelperText:PopButtonPrompt({
					button_ref = "button_secondary"
				})
				var_0_24(arg_33_0, arg_33_1)
			elseif CONDITIONS.IsBRLoadoutGameType(arg_33_1) and var_38_0.openedForPlunderBox ~= true then
				Engine.EBHIFJCGBH("class_select", -1)
				LUI.FlowManager.RequestCloseAllMenus()
				LUI.FlowManager.RequestResumeMovement()
			end
		end)
	end

	if CONDITIONS.InFrontendPublic() then
		arg_33_0:registerEventHandler("update_weapon_master_summary", function(arg_39_0, arg_39_1)
			if arg_39_1.weaponRef and GUNSMITH.AreMasterChallengesEnabled(arg_33_1, arg_39_1.weaponRef) then
				arg_33_0.MasterChallenges:SetAlpha(1)
				arg_33_0.MasterChallenges:Setup(arg_39_1.weaponRef)
				ACTIONS.AnimateSequence(arg_33_0, "ChallengesOn")
			else
				arg_33_0.MasterChallenges:SetAlpha(0)
				ACTIONS.AnimateSequence(arg_33_0, "ChallengesOff")
			end
		end)
	end

	if Engine.DDJFBBJAIG() then
		arg_33_0.bindButton:addEventHandler("button_alt2", function(arg_40_0, arg_40_1)
			if LUI.FlowManager.GetScopedData(arg_33_0).menuState == var_0_12.loadoutEdit then
				return
			end

			local var_40_0 = {
				disableQuickAccessShortcuts = true,
				controllerIndex = arg_33_1,
				loadoutIndex = arg_33_0._focusedLoadoutIndex
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LoadoutOptions", true, arg_40_1.controller, false, var_40_0)
		end)
		arg_33_0:addEventHandler("refresh_loadouts", function(arg_41_0, arg_41_1)
			arg_41_0.Loadouts:RefreshContent()
		end)
	end

	if CONDITIONS.IsCoreMultiplayer(arg_33_0) and not Engine.DDJFBBJAIG() or CONDITIONS.IsThirdGameMode(arg_33_0) then
		arg_33_0.selectedLoadout = LUI.DataSourceInControllerModel.new("cg.players.selectedLoadout")
	end

	if not Engine.DDJFBBJAIG() then
		arg_33_0.defaultLoadouts = LOADOUT.GetDefaultLoadouts(arg_33_1)
	end

	local var_33_3

	if arg_33_2.openedForPlunderBox == true then
		var_33_3 = LUI.FlowManager.GetScopedData("brPlunderBox")
		arg_33_0.openedForPlunderBox = true
		var_33_3.openedForPlunderBox = true

		arg_33_0.HelperBar:SetAlpha(0)
	else
		var_33_3 = LUI.FlowManager.GetScopedData(arg_33_0)
	end

	if not var_33_3.sessionID then
		var_33_3.sessionID = Engine.DCJHCAFIIA()
	end

	if not var_33_3.cacSessionStartTime then
		var_33_3.cacSessionStartTime = Engine.DCJHCAFIIA()
	end

	if not var_33_3.cacSessionDlogOnGoing and not CONDITIONS.IsBRLoadoutGameType(arg_33_1) then
		METRICS.CacSessionStartSendDLogEvent(arg_33_1, var_33_3.sessionID)

		var_33_3.cacSessionDlogOnGoing = true
	end

	var_33_3.menuState = var_33_3.menuState or var_0_12.loadoutSelect

	arg_33_0:dispatchEventToChildren({
		name = "menu_state_updated",
		menuState = var_33_3.menuState
	})

	local var_33_4 = Engine.DDJFBBJAIG() and arg_33_0.Loadouts or arg_33_0.InGameLoadouts

	var_33_4:SetRefreshChild(function(arg_42_0, arg_42_1, arg_42_2)
		local var_42_0 = var_33_4.state == var_0_13.default or var_33_4.state == var_0_13.mix and arg_42_2 >= #var_33_0

		var_0_30(arg_33_0, arg_33_1, arg_42_0, var_33_0, arg_42_2, var_42_0)
	end)

	local function var_33_5()
		if var_33_2 and CONDITIONS.ShouldFocusFirstItemInLoadoutDrop(arg_33_1) == true then
			return {
				x = 0,
				y = 0
			}
		elseif var_33_3.selectedLoadoutIndex then
			return {
				x = 0,
				y = var_33_3.selectedLoadoutIndex
			}
		elseif arg_33_0.selectedLoadout and arg_33_0.selectedLoadout:GetValue(arg_33_1) then
			local var_43_0 = arg_33_0.selectedLoadout:GetValue(arg_33_1)

			if var_43_0 >= LOADOUT.DEFAULT_LOADOUT_INDEX_START then
				local var_43_1 = PROGRESSION.AreCustomLoadoutsUnlocked(arg_33_1)

				var_43_0 = var_43_0 - LOADOUT.DEFAULT_LOADOUT_INDEX_START

				if var_43_1 and not Game.BFEEGCHICA(arg_33_1, "ui_only_default_loadouts") and not Dvar.IBEGCHEFE("NTMRRKSKPQ") then
					var_43_0 = var_43_0 + #var_33_0
				end
			end

			return {
				x = 0,
				y = var_43_0
			}
		end
	end

	var_33_4:SetDefaultFocus(var_33_5)

	if not Engine.DDJFBBJAIG() then
		local var_33_6 = PROGRESSION.AreCustomLoadoutsUnlocked(arg_33_1)

		if Game.BFEEGCHICA(arg_33_1, "ui_only_default_loadouts") then
			arg_33_0.InGameLoadouts.state = var_0_13.default

			if CONDITIONS.IsSnipersOnlyClasses() then
				arg_33_0.InGameLoadouts:SetNumChildren(LOADOUT.SnipersOnlyClassCount)
			else
				var_33_4:SetNumChildren(LOADOUT.DefaultClassCount)
			end

			var_33_4:RefreshContent()
		elseif var_33_6 and Dvar.IBEGCHEFE("NTMRRKSKPQ") then
			local var_33_7 = arg_33_0.selectedLoadout:GetValue(arg_33_1)
			local var_33_8 = var_33_7 and var_33_7 >= LOADOUT.DEFAULT_LOADOUT_INDEX_START
			local var_33_9 = {}

			table.insert(var_33_9, {
				name = Engine.CBBHFCGDIC("MP_INGAME_ONLY/LOADOUT_TAB_CUSTOM"),
				focusFunction = function(arg_44_0, arg_44_1)
					arg_33_0.InGameLoadouts.state = var_0_13.custom

					arg_33_0.InGameLoadouts:SetNumChildren(#var_33_0)
					arg_33_0.InGameLoadouts:RefreshContent()
					arg_33_0.InGameLoadouts:ProcessEventToChildInFocus({
						name = "tab_changed"
					})
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end,
				hasDefaultFocus = not var_33_8,
				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			})
			table.insert(var_33_9, {
				name = Engine.CBBHFCGDIC("MP_INGAME_ONLY/LOADOUT_TAB_DEFAULT"),
				focusFunction = function(arg_45_0, arg_45_1)
					arg_33_0.InGameLoadouts.state = var_0_13.default

					if CONDITIONS.IsSnipersOnlyClasses() then
						arg_33_0.InGameLoadouts:SetNumChildren(LOADOUT.SnipersOnlyClassCount)
					else
						arg_33_0.InGameLoadouts:SetNumChildren(LOADOUT.DefaultClassCount)
					end

					arg_33_0.InGameLoadouts:RefreshContent()
					arg_33_0.InGameLoadouts:ProcessEventToChildInFocus({
						name = "tab_changed"
					})
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end,
				hasDefaultFocus = not var_33_7 or var_33_8,
				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			})

			arg_33_0.tabsData = var_33_9

			arg_33_0.InGameLoadoutTabs:SetTabs(var_33_9)
		else
			if var_33_6 then
				arg_33_0.InGameLoadouts.state = var_0_13.mix

				if CONDITIONS.IsSnipersOnlyClasses() then
					var_33_4:SetNumChildren(#var_33_0 + LOADOUT.SnipersOnlyClassCount)
				else
					var_33_4:SetNumChildren(#var_33_0 + LOADOUT.DefaultClassCount)
				end
			else
				arg_33_0.InGameLoadouts.state = var_0_13.default

				if CONDITIONS.IsSnipersOnlyClasses() then
					var_33_4:SetNumChildren(LOADOUT.SnipersOnlyClassCount)
				else
					var_33_4:SetNumChildren(LOADOUT.DefaultClassCount)
				end
			end

			var_33_4:RefreshContent()
		end
	else
		var_33_4:SetNumChildren(#var_33_0)
		var_33_4:RefreshContent()
	end

	if CONDITIONS.InFrontend() or CONDITIONS.IsPrematch(arg_33_1) then
		LAYOUT.AddAspectRatioFadeFrame(arg_33_0, arg_33_1)
	elseif CONDITIONS.InGame() then
		ACTIONS.ScaleFullscreen(arg_33_0.InGameMenuBackground)
		ACTIONS.ScaleFullscreen(arg_33_0.Vignette)
		ACTIONS.ScaleStretchAnchorFullscreen(arg_33_0.TabBacker)
		ACTIONS.ScaleFullscreen(arg_33_0.WZVignette)
	end

	arg_33_0.LoadoutSelectButtons:SetMouseHandling(false)

	local var_33_10 = var_33_3.selectedLoadoutIndex or 1

	arg_33_0.LoadoutSelectButtons:SetupGridItems(arg_33_1, var_33_10, var_33_0[var_33_10])

	if var_33_3.menuState == var_0_12.loadoutEdit then
		if var_33_3.openedFromScriptRequest then
			arg_33_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_secondary",
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
		end

		if Engine.DDJFBBJAIG() then
			CLIENT_MODEL.UpdateModelsForLoadout(arg_33_0, arg_33_1, var_33_3.selectedLoadoutIndex)
		elseif arg_33_0.InGameLoadoutTabs then
			arg_33_0.InGameLoadoutTabs:DisableAll()
		end

		if Engine.DDJFBBJAIG() then
			arg_33_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt2"
			})
			arg_33_0.KBMLoadoutOptionsPrompt:SetAlpha(0)
		end

		ACTIONS.AnimateSequence(arg_33_0, "LoadoutEditSnap")
		arg_33_0.MenuTitle:SetTitle(var_33_0[var_33_3.selectedLoadoutIndex].name:get())

		if arg_33_0.LoadoutsScrollbar then
			arg_33_0.LoadoutsScrollbar:SetAlpha(0)
		end

		arg_33_0.LoadoutSelectButtons:SetMouseHandling(true)
		var_0_18(arg_33_0, false)
		var_0_21(arg_33_0, "LoadoutEdit")

		if arg_33_0.BundleUpsellButton then
			arg_33_0.BundleUpsellButton:HideButton()
		end
	else
		if not Engine.DDJFBBJAIG() then
			arg_33_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_LOADOUT"))
		else
			arg_33_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/EDIT_LOADOUTS"))
		end

		var_0_21(arg_33_0, "LoadoutPreview")
	end

	if Engine.DDJFBBJAIG() then
		local var_33_11 = var_0_12.loadoutSelect

		local function var_33_12(arg_46_0, arg_46_1)
			if LUI.FlowManager.GetScopedData(arg_46_0).menuState == var_33_11 then
				if LUI.IsLastInputGamepad(arg_46_1.controllerIndex) then
					arg_46_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						clickable = true,
						priority = 20,
						side = "left",
						gamepad_only = true,
						button_ref = "button_alt2",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS")
					})
					arg_46_0.KBMLoadoutOptionsPrompt:SetAlpha(0)
				else
					arg_46_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						button_ref = "button_alt2"
					})
					arg_46_0.KBMLoadoutOptionsPrompt:SetAlpha(1)
				end
			end
		end

		arg_33_0:addAndCallEventHandler("update_input_type", var_33_12, {
			controllerIndex = arg_33_1
		})
	end

	if Engine.DDJFBBJAIG() then
		local var_33_13 = WEAPON.GetWeaponModel(arg_33_1, FrontEndScene.ClientWeapons.GunTablePrimary)

		arg_33_0:addElement(var_33_13)

		arg_33_0.primaryWeaponModel = var_33_13

		local var_33_14 = WEAPON.GetWeaponModel(arg_33_1, FrontEndScene.ClientWeapons.GunTableSecondary)

		arg_33_0:addElement(var_33_14)

		arg_33_0.secondaryWeaponModel = var_33_14

		arg_33_0.LoadoutSelectButtons:SetupWeaponModelEvents(arg_33_1, {
			arg_33_0.primaryWeaponModel,
			arg_33_0.secondaryWeaponModel
		}, var_33_0)

		if Engine.ECHCFGDDDF() then
			local var_33_15 = LUI.FlowManager.GetScopedData(arg_33_0)

			var_33_15.controllerIndex = arg_33_1
			var_33_15.selectedLoadoutIndex = var_33_15.selectedLoadoutIndex or 0

			MenuUtils.SetupSceneChangeCallbackWithMenuArg(arg_33_0, var_0_15)
		end

		if var_33_3.menuState == var_0_12.loadoutEdit and var_33_3.selectedLoadoutIndex then
			var_0_14(arg_33_0, arg_33_1, var_33_0, var_33_3.selectedLoadoutIndex)
		end
	elseif var_33_3.menuState ~= var_0_12.loadoutEdit then
		if var_33_3.openedForPlunderBox == true or CONDITIONS.IsBRLoadoutGameType(arg_33_1) then
			ACTIONS.AnimateSequence(arg_33_0, "InGameLoadoutButtonsBr")
		else
			ACTIONS.AnimateSequence(arg_33_0, "InGameLoadoutButtons")
		end
	end

	arg_33_0:addEventHandler("button_focused", function(arg_47_0, arg_47_1)
		if arg_47_1.button.isLoadout then
			local var_47_0 = arg_47_1.button:getParent()

			if arg_47_0.focusedButton and arg_47_0.focusedButton ~= var_47_0 then
				assert(arg_47_0.focusedButton)

				if not Engine.DDJFBBJAIG() then
					assert(arg_47_0.focusedButton.EditButton)
					arg_47_0.focusedButton:SetEditButtonEnabled(false)
				end
			end

			arg_47_0.focusedButton = var_47_0
		end

		return true
	end)
	arg_33_0:addEventHandler("gain_focus", function(arg_48_0, arg_48_1)
		local var_48_0 = Engine.DDJFBBJAIG() and arg_48_0.Loadouts or arg_48_0.InGameLoadouts
		local var_48_1 = LUI.FlowManager.GetScopedData(arg_48_0)
		local var_48_2 = false

		if var_48_1.menuState == var_0_12.loadoutEdit then
			if arg_48_0.LoadoutSelectButtons then
				arg_48_0.LoadoutSelectButtons:processEvent({
					name = "gain_focus",
					controller = arg_48_1.controller
				})

				var_48_2 = true
			end
		else
			var_48_0:processEvent({
				name = "gain_focus",
				controller = arg_48_1.controller
			})

			var_48_2 = true
		end

		return var_48_2
	end)
	var_0_19(arg_33_0)

	if LUI.IsLastInputKeyboardMouse(arg_33_1) and var_33_3.menuState == var_0_12.loadoutSelect then
		local var_33_16 = var_33_4:GetBuiltChildren()

		if #var_33_16 > 0 then
			if Engine.DDJFBBJAIG() then
				arg_33_0.focusedButton = var_33_16[1]

				local var_33_17 = var_33_16[1].LoadoutButton

				var_33_17.refreshDetailsGrid(var_33_17, {
					name = "button_over"
				})
			else
				local var_33_18 = var_33_16[1]

				for iter_33_0, iter_33_1 in ipairs(var_33_16) do
					if var_0_25(arg_33_0, arg_33_1, iter_33_1.LoadoutButton.index, iter_33_1.LoadoutButton.isDefault) then
						var_33_18 = iter_33_1
					end
				end

				var_33_18.LoadoutButton.refreshDetailsGrid(var_33_18.LoadoutButton, {
					name = "button_over"
				})

				arg_33_0.focusedButton = var_33_18
			end
		end
	end

	LUI.TextChat.SetupMenuForNoLine(arg_33_0)

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.IsThirdGameMode() then
			if not Onboarding.LoadoutCP.WasCompleted(arg_33_0, arg_33_1) then
				LUI.FlowManager.RequestPopupMenu(arg_33_0, "onboardingpopup", true, arg_33_1, false, ONBOARDING_DATA.GetOnboardingLoadoutData())
				Onboarding.LoadoutCP.MarkCompleted(arg_33_0, arg_33_1)
			end
		elseif MLG.IsCDLActive(arg_33_1) then
			if not Onboarding.CDL.WasCompleted(arg_33_0, arg_33_1) then
				LUI.FlowManager.RequestPopupMenu(arg_33_0, "onboardingpopup", true, arg_33_1, false, ONBOARDING_DATA.GetOnboardingCDLData())
				Onboarding.CDL.MarkCompleted(arg_33_0, arg_33_1)
			end
		elseif CONDITIONS.IsMagmaGameMode() then
			if not Onboarding.WZDropKit.WasCompleted(arg_33_0, arg_33_1) then
				if CONDITIONS.IsWZWipFlowEnabled() and CONDITIONS.AreWZLoadoutsEnabled() then
					LUI.FlowManager.RequestPopupMenu(arg_33_0, "onboardingpopup", true, arg_33_1, false, ONBOARDING_DATA.GetOnboardingWZEditLoadoutData())
				else
					LUI.FlowManager.RequestPopupMenu(arg_33_0, "onboardingpopup", true, arg_33_1, false, ONBOARDING_DATA.GetOnboardingWZDropKitData())
				end

				Onboarding.WZDropKit.MarkCompleted(arg_33_0, arg_33_1)
			end
		elseif not Onboarding.Loadout.WasCompleted(arg_33_0, arg_33_1) then
			LUI.FlowManager.RequestPopupMenu(arg_33_0, "onboardingpopup", true, arg_33_1, false, ONBOARDING_DATA.GetOnboardingLoadoutData())
			Onboarding.Loadout.MarkCompleted(arg_33_0, arg_33_1)
		end

		arg_33_0:registerEventHandler("update_bundle_upsell", function(arg_49_0, arg_49_1)
			arg_49_0:UpdateBundleUpsell(arg_33_1, arg_49_1.weaponRef)

			return true
		end)
	end

	arg_33_0:registerEventHandler("lui_game_start_notify", function(arg_50_0, arg_50_1)
		local var_50_0 = LUI.FlowManager.GetScopedData(arg_50_0)

		if var_50_0.cacSessionDlogOnGoing then
			METRICS.CacSessionEndSendDLogEvent(arg_33_1, var_50_0.sessionID, var_50_0.cacSessionStartTime, METRICS.CacExitReasons.GAME_START_INTERRUPT)

			var_50_0.cacSessionDlogOnGoing = nil
		end
	end)

	if LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_33_1) or Restrictions.ArePerksRestricted() then
		ACTIONS.AnimateSequence(arg_33_0, "RestrictionWarningOn")
	else
		ACTIONS.AnimateSequence(arg_33_0, "RestrictionWarningOff")
	end

	if arg_33_0.BundleUpsellButton then
		arg_33_0.BundleUpsellButton:SetUpsellMenu("LoadoutSelect")
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_33_0.TabBacker)
end

local function var_0_33()
	local var_51_0 = LUI.FlowManager.GetScopedData("LoadoutSelect")

	if var_51_0.cacSessionDlogOnGoing then
		METRICS.CacSessionEndSendDLogEvent(var_51_0.controllerIndex, var_51_0.sessionID, var_51_0.cacSessionStartTime, METRICS.CacExitReasons.UNEXPECTED_CLOSE)

		var_51_0.cacSessionDlogOnGoing = nil
	end
end

function LoadoutSelect(arg_52_0, arg_52_1)
	local var_52_0 = LUI.UIElement.new()

	var_52_0.id = "LoadoutSelect"
	var_52_0._animationSets = var_52_0._animationSets or {}
	var_52_0._sequences = var_52_0._sequences or {}

	local var_52_1 = arg_52_1 and arg_52_1.controllerIndex

	if not var_52_1 and not Engine.DDJFBBJAIG() then
		var_52_1 = var_52_0:getRootController()
	end

	assert(var_52_1)
	var_0_17(var_52_0, var_52_1, arg_52_1)

	var_52_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_52_1
	})
	var_52_0.HelperBar.id = "HelperBar"

	var_52_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_52_0.HelperBar:setPriority(10)
	var_52_0:addElement(var_52_0.HelperBar)

	local var_52_2 = var_52_0
	local var_52_3

	if CONDITIONS.InGame() then
		var_52_3 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_52_1
		})
		var_52_3.id = "InGameMenuBackground"

		var_52_3:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_52_0:addElement(var_52_3)

		var_52_0.InGameMenuBackground = var_52_3
	end

	local var_52_4
	local var_52_5 = LUI.UIImage.new()

	var_52_5.id = "Vignette"

	var_52_5:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_52_5:SetAlpha(0.5, 0)
	var_52_5:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_52_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -185, _1080p * -1058, 0, 0)
	var_52_0:addElement(var_52_5)

	var_52_0.Vignette = var_52_5

	local var_52_6
	local var_52_7 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_52_1
	})

	var_52_7.id = "WZVignette"

	var_52_7:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_52_0:addElement(var_52_7)

	var_52_0.WZVignette = var_52_7

	local var_52_8
	local var_52_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_52_1
	})

	var_52_9.id = "TabBacker"

	var_52_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_52_0:addElement(var_52_9)

	var_52_0.TabBacker = var_52_9

	local var_52_10
	local var_52_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_52_1
	})

	var_52_11.id = "MenuTitle"

	var_52_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_LOADOUT")), 0)
	var_52_11.Line:SetLeft(0, 0)
	var_52_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 562, 0, _1080p * 100)
	var_52_0:addElement(var_52_11)

	var_52_0.MenuTitle = var_52_11

	local var_52_12

	if CONDITIONS.InFrontend() then
		local var_52_13 = {
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
			controllerIndex = var_52_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("FrontendLoadoutButton", {
					controllerIndex = var_52_1
				})
			end,
			refreshChild = function(arg_54_0, arg_54_1, arg_54_2)
				return
			end,
			spacingX = _1080p * 8,
			spacingY = _1080p * 8,
			columnWidth = _1080p * 370,
			rowHeight = _1080p * 60,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_52_12 = LUI.UIGrid.new(var_52_13)
		var_52_12.id = "Loadouts"

		var_52_12:setUseStencil(false)
		var_52_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 475, _1080p * 170, _1080p * 503)
		var_52_0:addElement(var_52_12)

		var_52_0.Loadouts = var_52_12
	end

	local var_52_14

	if CONDITIONS.InGame() then
		local var_52_15 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
			controllerIndex = var_52_1
		})

		var_52_15.id = "UnlockText"

		var_52_15.Description:SetRight(_1080p * 500, 0)
		var_52_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 509, _1080p * 556, _1080p * 588)
		var_52_0:addElement(var_52_15)

		var_52_0.UnlockText = var_52_15
	end

	local var_52_16

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
		local var_52_17 = {
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
			controllerIndex = var_52_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("InGameLoadoutButton", {
					controllerIndex = var_52_1
				})
			end,
			refreshChild = function(arg_56_0, arg_56_1, arg_56_2)
				return
			end,
			spacingX = _1080p * 8,
			spacingY = _1080p * 8,
			columnWidth = _1080p * 550,
			rowHeight = _1080p * 60,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_52_16 = LUI.UIGrid.new(var_52_17)
		var_52_16.id = "InGameLoadoutsMp"

		var_52_16:setUseStencil(true)
		var_52_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 475, _1080p * 216, _1080p * 696)
		var_52_0:addElement(var_52_16)

		var_52_0.InGameLoadoutsMp = var_52_16
	end

	local var_52_18

	if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
		local var_52_19 = {
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
			controllerIndex = var_52_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("BRInGameLoadoutButton", {
					controllerIndex = var_52_1
				})
			end,
			refreshChild = function(arg_58_0, arg_58_1, arg_58_2)
				return
			end,
			spacingX = _1080p * 8,
			spacingY = _1080p * 8,
			columnWidth = _1080p * 500,
			rowHeight = _1080p * 40,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_52_18 = LUI.UIGrid.new(var_52_19)
		var_52_18.id = "InGameLoadoutsBr"

		var_52_18:setUseStencil(false)
		var_52_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 696)
		var_52_0:addElement(var_52_18)

		var_52_0.InGameLoadoutsBr = var_52_18
	end

	local var_52_20
	local var_52_21 = MenuBuilder.BuildRegisteredType("LoadoutSelectButtons", {
		controllerIndex = var_52_1
	})

	var_52_21.id = "LoadoutSelectButtons"

	var_52_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 536, _1080p * 1686, _1080p * 170, _1080p * 976)
	var_52_0:addElement(var_52_21)

	var_52_0.LoadoutSelectButtons = var_52_21

	local var_52_22

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
		local var_52_23 = {
			spacing = 4,
			wrap = false,
			tabHeight = _1080p * 52,
			buildTab = function()
				return MenuBuilder.BuildRegisteredType("SubMenuTab", {
					controllerIndex = var_52_1
				})
			end,
			controllerIndex = var_52_1
		}

		var_52_22 = LUI.TabManager.new(var_52_23)
		var_52_22.id = "InGameLoadoutTabs"

		var_52_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 545, _1080p * 108, _1080p * 160)
		var_52_0:addElement(var_52_22)

		var_52_0.InGameLoadoutTabs = var_52_22
	end

	local var_52_24

	if not Engine.DDJFBBJAIG() then
		var_52_24 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_52_1
		})
		var_52_24.id = "InGameMenuTimerStatus"

		var_52_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 54, _1080p * 104)
		var_52_0:addElement(var_52_24)

		var_52_0.InGameMenuTimerStatus = var_52_24
	end

	local var_52_25
	local var_52_26 = LUI.UIStyledText.new()

	var_52_26.id = "ListNumber"

	var_52_26:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_52_26:setText("", 0)
	var_52_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_52_26:SetAlignment(LUI.Alignment.Center)
	var_52_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 227, _1080p * 391, _1080p * 908, _1080p * 932)
	var_52_0:addElement(var_52_26)

	var_52_0.ListNumber = var_52_26

	local var_52_27

	if CONDITIONS.InFrontendPublicMP() then
		local var_52_28 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_52_1
		})

		var_52_28.id = "MPPlayerDetails"

		var_52_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_52_0:addElement(var_52_28)

		var_52_0.MPPlayerDetails = var_52_28
	end

	local var_52_29

	if CONDITIONS.InFrontendPublic() then
		local var_52_30 = MenuBuilder.BuildRegisteredType("WeaponMasterSummary", {
			controllerIndex = var_52_1
		})

		var_52_30.id = "MasterChallenges"

		var_52_30:SetAlpha(0, 0)
		var_52_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -672, _1080p * -96, _1080p * 216, _1080p * 396)
		var_52_0:addElement(var_52_30)

		var_52_0.MasterChallenges = var_52_30
	end

	local var_52_31

	if not Engine.DDJFBBJAIG() and not CONDITIONS.IsSplitscreen() then
		var_52_31 = MenuBuilder.BuildRegisteredType("TalkersList", {
			controllerIndex = var_52_1
		})
		var_52_31.id = "TalkersList"

		var_52_31:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -447, _1080p * -96, _1080p * 154, _1080p * 529)
		var_52_0:addElement(var_52_31)

		var_52_0.TalkersList = var_52_31
	end

	local var_52_32

	if CONDITIONS.InFrontend() then
		local var_52_33 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_52_1
		})

		var_52_33.id = "LobbyMembersFooter"

		var_52_33:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_52_0:addElement(var_52_33)

		var_52_0.LobbyMembersFooter = var_52_33
	end

	local var_52_34

	if Engine.DDJFBBJAIG() then
		local var_52_35 = LUI.UIStyledText.new()

		var_52_35.id = "KBMLoadoutOptionsPrompt"

		var_52_35:SetAlpha(0, 0)
		var_52_35:setText(Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS_PROMPT"), 0)
		var_52_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_52_35:SetAlignment(LUI.Alignment.Left)
		var_52_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 545, _1080p * 1045, _1080p * 904, _1080p * 928)
		var_52_0:addElement(var_52_35)

		var_52_0.KBMLoadoutOptionsPrompt = var_52_35
	end

	local var_52_36
	local var_52_37 = MenuBuilder.BuildRegisteredType("RestrictionLoadoutWarning", {
		controllerIndex = var_52_1
	})

	var_52_37.id = "RestrictionLoadoutWarning"

	var_52_37:SetAlpha(0, 0)
	var_52_37:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -180, _1080p * 180, _1080p * 114, _1080p * 144)
	var_52_0:addElement(var_52_37)

	var_52_0.RestrictionLoadoutWarning = var_52_37

	local var_52_38

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen() then
		var_52_38 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
			controllerIndex = var_52_1
		})
		var_52_38.id = "LoadoutsScrollbar"

		var_52_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 107, _1080p * 170, _1080p * 502)
		var_52_0:addElement(var_52_38)

		var_52_0.LoadoutsScrollbar = var_52_38
	end

	local var_52_39

	if Engine.DDJFBBJAIG() then
		var_52_39 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
			controllerIndex = var_52_1
		})
		var_52_39.id = "BundleUpsellButton"

		var_52_39:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -546, _1080p * -96, _1080p * 775, _1080p * 979)
		var_52_0:addElement(var_52_39)

		var_52_0.BundleUpsellButton = var_52_39
	end

	local var_52_40

	if Engine.DDJFBBJAIG() then
		var_52_40 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_52_1
		})
		var_52_40.id = "CDLRestrictionTag"

		var_52_40.CDLInfo:SetAlpha(1, 0)
		var_52_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_52_0:addElement(var_52_40)

		var_52_0.CDLRestrictionTag = var_52_40
	end

	local function var_52_41()
		return
	end

	var_52_0._sequences.DefaultSequence = var_52_41

	local var_52_42

	if CONDITIONS.InFrontend() then
		local var_52_43 = {
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_12:RegisterAnimationSequence("LoadoutButtons", var_52_43)
	end

	local var_52_44 = {
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

	var_52_21:RegisterAnimationSequence("LoadoutButtons", var_52_44)

	local var_52_45 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_26:RegisterAnimationSequence("LoadoutButtons", var_52_45)

	local function var_52_46()
		if CONDITIONS.InFrontend() then
			var_52_12:AnimateSequence("LoadoutButtons")
		end

		var_52_21:AnimateSequence("LoadoutButtons")
		var_52_26:AnimateSequence("LoadoutButtons")
	end

	var_52_0._sequences.LoadoutButtons = var_52_46

	local var_52_47

	if CONDITIONS.InFrontend() then
		local var_52_48 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_12:RegisterAnimationSequence("LoadoutEdit", var_52_48)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
		local var_52_49 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_16:RegisterAnimationSequence("LoadoutEdit", var_52_49)
	end

	if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
		local var_52_50 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_18:RegisterAnimationSequence("LoadoutEdit", var_52_50)
	end

	local var_52_51 = {
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

	var_52_21:RegisterAnimationSequence("LoadoutEdit", var_52_51)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
		local var_52_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_22:RegisterAnimationSequence("LoadoutEdit", var_52_52)
	end

	local var_52_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_26:RegisterAnimationSequence("LoadoutEdit", var_52_53)

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen() then
		local var_52_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_38:RegisterAnimationSequence("LoadoutEdit", var_52_54)
	end

	local function var_52_55()
		if CONDITIONS.InFrontend() then
			var_52_12:AnimateSequence("LoadoutEdit")
		end

		if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
			var_52_16:AnimateSequence("LoadoutEdit")
		end

		if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
			var_52_18:AnimateSequence("LoadoutEdit")
		end

		var_52_21:AnimateSequence("LoadoutEdit")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
			var_52_22:AnimateSequence("LoadoutEdit")
		end

		var_52_26:AnimateSequence("LoadoutEdit")

		if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen() then
			var_52_38:AnimateSequence("LoadoutEdit")
		end
	end

	var_52_0._sequences.LoadoutEdit = var_52_55

	local var_52_56

	if CONDITIONS.InFrontend() then
		local var_52_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_12:RegisterAnimationSequence("LoadoutEditSnap", var_52_57)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
		local var_52_58 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_16:RegisterAnimationSequence("LoadoutEditSnap", var_52_58)
	end

	if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
		local var_52_59 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_18:RegisterAnimationSequence("LoadoutEditSnap", var_52_59)
	end

	local var_52_60 = {
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

	var_52_21:RegisterAnimationSequence("LoadoutEditSnap", var_52_60)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
		local var_52_61 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_22:RegisterAnimationSequence("LoadoutEditSnap", var_52_61)
	end

	local var_52_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_26:RegisterAnimationSequence("LoadoutEditSnap", var_52_62)

	local function var_52_63()
		if CONDITIONS.InFrontend() then
			var_52_12:AnimateSequence("LoadoutEditSnap")
		end

		if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
			var_52_16:AnimateSequence("LoadoutEditSnap")
		end

		if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
			var_52_18:AnimateSequence("LoadoutEditSnap")
		end

		var_52_21:AnimateSequence("LoadoutEditSnap")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
			var_52_22:AnimateSequence("LoadoutEditSnap")
		end

		var_52_26:AnimateSequence("LoadoutEditSnap")
	end

	var_52_0._sequences.LoadoutEditSnap = var_52_63

	local var_52_64

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
		local var_52_65 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_16:RegisterAnimationSequence("InGameLoadoutButtons", var_52_65)
	end

	local var_52_66 = {
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

	var_52_21:RegisterAnimationSequence("InGameLoadoutButtons", var_52_66)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
		local var_52_67 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_22:RegisterAnimationSequence("InGameLoadoutButtons", var_52_67)
	end

	local var_52_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_26:RegisterAnimationSequence("InGameLoadoutButtons", var_52_68)

	if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen() then
		local var_52_69 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_38:RegisterAnimationSequence("InGameLoadoutButtons", var_52_69)
	end

	local function var_52_70()
		if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
			var_52_16:AnimateSequence("InGameLoadoutButtons")
		end

		var_52_21:AnimateSequence("InGameLoadoutButtons")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
			var_52_22:AnimateSequence("InGameLoadoutButtons")
		end

		var_52_26:AnimateSequence("InGameLoadoutButtons")

		if not Engine.DDJFBBJAIG() and CONDITIONS.IsSplitscreen() then
			var_52_38:AnimateSequence("InGameLoadoutButtons")
		end
	end

	var_52_0._sequences.InGameLoadoutButtons = var_52_70

	local var_52_71

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
		local var_52_72 = {
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

		var_52_16:RegisterAnimationSequence("Splitscreen", var_52_72)
	end

	local var_52_73 = {
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

	var_52_21:RegisterAnimationSequence("Splitscreen", var_52_73)

	if not Engine.DDJFBBJAIG() then
		local var_52_74 = {
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

		var_52_24:RegisterAnimationSequence("Splitscreen", var_52_74)
	end

	local var_52_75 = {
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

	var_52_26:RegisterAnimationSequence("Splitscreen", var_52_75)

	local function var_52_76()
		if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
			var_52_16:AnimateSequence("Splitscreen")
		end

		var_52_21:AnimateSequence("Splitscreen")

		if not Engine.DDJFBBJAIG() then
			var_52_24:AnimateSequence("Splitscreen")
		end

		var_52_26:AnimateSequence("Splitscreen")
	end

	var_52_0._sequences.Splitscreen = var_52_76

	local var_52_77

	if CONDITIONS.InGame() then
		local var_52_78 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_3:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_78)
	end

	local var_52_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_5:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_79)

	local var_52_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_11:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_80)

	if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
		local var_52_81 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_18:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_81)
	end

	local var_52_82 = {
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

	var_52_21:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_82)

	if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
		local var_52_83 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_52_22:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_83)
	end

	local var_52_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_26:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_84)

	if not Engine.DDJFBBJAIG() and not CONDITIONS.IsSplitscreen() then
		local var_52_85 = {}

		var_52_31:RegisterAnimationSequence("InGameLoadoutButtonsBr", var_52_85)
	end

	local function var_52_86()
		if CONDITIONS.InGame() then
			var_52_3:AnimateSequence("InGameLoadoutButtonsBr")
		end

		var_52_5:AnimateSequence("InGameLoadoutButtonsBr")
		var_52_11:AnimateSequence("InGameLoadoutButtonsBr")

		if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
			var_52_18:AnimateSequence("InGameLoadoutButtonsBr")
		end

		var_52_21:AnimateSequence("InGameLoadoutButtonsBr")

		if not Engine.DDJFBBJAIG() and CONDITIONS.AreInGameLoadoutTabsEnabled(var_52_0, var_52_1) then
			var_52_22:AnimateSequence("InGameLoadoutButtonsBr")
		end

		var_52_26:AnimateSequence("InGameLoadoutButtonsBr")

		if not Engine.DDJFBBJAIG() and not CONDITIONS.IsSplitscreen() then
			var_52_31:AnimateSequence("InGameLoadoutButtonsBr")
		end
	end

	var_52_0._sequences.InGameLoadoutButtonsBr = var_52_86

	local var_52_87
	local var_52_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_37:RegisterAnimationSequence("RestrictionWarningOff", var_52_88)

	local function var_52_89()
		var_52_37:AnimateSequence("RestrictionWarningOff")
	end

	var_52_0._sequences.RestrictionWarningOff = var_52_89

	local var_52_90
	local var_52_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_37:RegisterAnimationSequence("RestrictionWarningOn", var_52_91)

	local function var_52_92()
		var_52_37:AnimateSequence("RestrictionWarningOn")
	end

	var_52_0._sequences.RestrictionWarningOn = var_52_92

	local var_52_93

	if Engine.DDJFBBJAIG() then
		local var_52_94 = {
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

		var_52_40:RegisterAnimationSequence("ChallengesOn", var_52_94)
	end

	local function var_52_95()
		if Engine.DDJFBBJAIG() then
			var_52_40:AnimateSequence("ChallengesOn")
		end
	end

	var_52_0._sequences.ChallengesOn = var_52_95

	local function var_52_96()
		return
	end

	var_52_0._sequences.ChallengesOff = var_52_96

	local var_52_97
	local var_52_98 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_5:RegisterAnimationSequence("WZWipSetup", var_52_98)

	local var_52_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_52_7:RegisterAnimationSequence("WZWipSetup", var_52_99)

	local function var_52_100()
		var_52_5:AnimateSequence("WZWipSetup")
		var_52_7:AnimateSequence("WZWipSetup")
	end

	var_52_0._sequences.WZWipSetup = var_52_100

	if Engine.DDJFBBJAIG() then
		var_52_39:addEventHandler("button_over", function(arg_72_0, arg_72_1)
			if not arg_72_1.controller then
				local var_72_0 = var_52_1
			end

			ACTIONS.AnimateSequenceByElement(var_52_0, {
				elementPath = "self.BundleUpsellButton",
				sequenceName = "ButtonOver",
				elementName = "BundleUpsellButton"
			})
		end)
		var_52_39:addEventHandler("button_up", function(arg_73_0, arg_73_1)
			if not arg_73_1.controller then
				local var_73_0 = var_52_1
			end

			ACTIONS.AnimateSequenceByElement(var_52_0, {
				elementPath = "self.BundleUpsellButton",
				sequenceName = "ButtonUp",
				elementName = "BundleUpsellButton"
			})
		end)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) and CONDITIONS.IsSplitscreen() then
		local var_52_101 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_52_38,
			startCap = var_52_38.startCap,
			endCap = var_52_38.endCap,
			sliderArea = var_52_38.sliderArea,
			slider = var_52_38.sliderArea and var_52_38.sliderArea.slider,
			fixedSizeSlider = var_52_38.sliderArea and var_52_38.sliderArea.fixedSizeSlider
		})

		var_52_16:AddScrollbar(var_52_101)
	end

	if CONDITIONS.InGameAndMPLoadoutSelect(var_52_1) then
		var_52_16:AddItemNumbers(var_52_26)
	end

	if CONDITIONS.InGameAndBRLoadoutSelect(var_52_1) then
		var_52_18:AddItemNumbers(var_52_26)
	end

	var_52_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_52_102 = LUI.UIBindButton.new()

	var_52_102.id = "selfBindButton"

	var_52_0:addElement(var_52_102)

	var_52_0.bindButton = var_52_102

	var_0_32(var_52_0, var_52_1, arg_52_1)

	if CONDITIONS.IsSplitscreen() then
		ACTIONS.AnimateSequence(var_52_0, "Splitscreen")
	end

	return var_52_0
end

MenuBuilder.registerType("LoadoutSelect", LoadoutSelect)
LUI.FlowManager.RegisterStackPopBehaviour("LoadoutSelect", var_0_33)
LockTable(_M)
