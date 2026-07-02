module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	return function()
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.Preview
		})

		arg_1_0._weaponModel = WEAPON.GetWeaponModel(arg_1_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.previewFile)

		arg_1_0:addElement(arg_1_0._weaponModel)
		WEAPON.LoadAndSetModel(arg_1_1, arg_1_0._weaponModel, arg_1_0._weaponTable)
		arg_1_0:processEvent({
			name = "scene_transitioned"
		})
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = LUI.FlowManager.GetScopedData(arg_3_0)
	local var_3_1 = {}

	if not GUNSMITH.IsDisabled(arg_3_0._weaponTable.weapon) then
		var_3_1[#var_3_1 + 1] = {
			menuName = "GunsmithAttachments",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ATTACHMENTS"))
		}
	end

	if not GUNSMITH.IsCustomizationDisabled(arg_3_0._weaponTable.weapon) and Engine.BACCCIHGDG() and Engine.CJJAFGIFAC(arg_3_0._controllerIndex) then
		var_3_1[#var_3_1 + 1] = {
			menuName = "GunsmithCustomize",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZE"))
		}
	end

	if #var_3_1 == 1 then
		arg_3_0.Tabs:SetAlpha(0)
	elseif #var_3_1 < 1 then
		arg_3_0.Tabs:closeTree()

		arg_3_0.Tabs = nil

		return
	end

	local var_3_2 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		table.insert(var_3_2, {
			name = iter_3_1.name,
			disabled = iter_3_1.disabled,
			hasDefaultFocus = iter_3_0 - 1 == var_3_0.activeTabIndex,
			focusFunction = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
				if var_3_0.activeTabIndex and arg_4_2 == var_3_0.activeTabIndex and arg_3_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_3_0, var_3_0.activeTabIndex, "activeTabWidget", arg_4_2, arg_4_3, iter_3_1.menuName, arg_3_1)

				var_3_0.activeTabIndex = arg_4_2

				local var_4_0 = var_3_0.previousTabName == "GunsmithAttachments" and "attachmentTimeSpent" or "customizeTimeSpent"
				local var_4_1 = var_3_0.lastTimeStamp
				local var_4_2 = Engine.DCJHCAFIIA()

				var_3_0.lastTimeStamp = Engine.DCJHCAFIIA()

				if iter_3_1.menuName == "GunsmithAttachments" then
					var_3_0[var_4_0] = var_3_0[var_4_0] + Engine.BAHGDJFBEF(var_4_2, "-" .. var_4_1)
					var_3_0.previousTabName = "GunsmithAttachments"

					arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						button_ref = "button_alt2",
						priority = 5,
						helper_text = Engine.CBBHFCGDIC("CAS/DESELECT_ALL")
					})
				else
					var_3_0[var_4_0] = var_3_0[var_4_0] + Engine.BAHGDJFBEF(var_4_2, "-" .. var_4_1)
					var_3_0.previousTabName = "GunsmithCustomize"

					arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						side = "left",
						button_ref = "button_alt2"
					})
					arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						side = "left",
						button_ref = "button_alt1"
					})
				end

				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			end
		})
	end

	arg_3_0.Tabs:SetTabs(var_3_2)

	local var_3_3, var_3_4 = GUNSMITH.CheckNewAttachmentAndCustomization(arg_3_0._controllerIndex, arg_3_0._weaponPlayerData)

	for iter_3_2 = 1, #var_3_1 do
		local var_3_5 = LUI.TabManager.GetTabAtIndex(arg_3_0.Tabs, iter_3_2)

		if var_3_1[iter_3_2].menuName == "GunsmithAttachments" then
			var_3_5.NewItemSmallIcon:UpdateAlpha(var_3_3 and 1 or 0, 0, true)
		elseif var_3_1[iter_3_2].menuName == "GunsmithCustomize" then
			var_3_5.NewItemSmallIcon:UpdateAlpha(var_3_4 and 1 or 0, 0, true)
		end
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	if Engine.BHICADFIHA() then
		if not arg_5_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for Gunsmith menu. Only OK after a MyChanges.")

			arg_5_2.loadoutIndex = 0
		end

		if not arg_5_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for Gunsmith menu. Only OK after a MyChanges.")

			arg_5_2.weaponSlot = 0
		end
	end

	assert(arg_5_2.loadoutIndex)
	assert(arg_5_2.weaponSlot)

	arg_5_0._controllerIndex = arg_5_1

	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_5_2.loadoutIndex]

	arg_5_0._weaponPlayerData = var_5_0.weaponSetups[arg_5_2.weaponSlot]
	arg_5_0._weaponTable = WEAPON.GenerateWeaponTable(arg_5_0._weaponPlayerData)

	local var_5_1
	local var_5_2
	local var_5_3 = GUNSMITH.GetCustomModName(arg_5_0._weaponPlayerData.blueprintName:get())

	if var_5_3 and #var_5_3 > 0 then
		var_5_1 = var_5_3
	elseif arg_5_0._weaponTable and arg_5_0._weaponTable.lootID ~= LOOT.emptyID then
		var_5_1 = WEAPON.GetLootWeaponName(arg_5_0._weaponTable.weapon, arg_5_0._weaponTable.lootID)
	else
		var_5_1 = Engine.CBBHFCGDIC("CAS/GUNSMITH_WEAPON", WEAPON.GetName(arg_5_0._weaponTable.weapon))
	end

	arg_5_0.MenuTitle:SetTitle(var_5_1)
	WEAPON.SetPreviewSceneForWeapon(arg_5_0._weaponTable.weapon)
	ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)
	MenuUtils.SetupSceneChangeCallback(arg_5_0, var_0_0(arg_5_0, arg_5_1))

	arg_5_2.loadoutPlayerData = var_5_0
	arg_5_2.weaponPlayerData = arg_5_0._weaponPlayerData

	local var_5_4 = LUI.FlowManager.GetScopedData(arg_5_0)

	if not var_5_4.startTime then
		var_5_4.startTime = Engine.DCJHCAFIIA()
		var_5_4.lastTimeStamp = var_5_4.lastTimeStamp or Engine.DCJHCAFIIA()
		var_5_4.attachmentTimeSpent = var_5_4.attachmentTimeSpent or 0
		var_5_4.customizeTimeSpent = var_5_4.customizeTimeSpent or 0
		var_5_4.previousAttachmentConfig = ATTACHMENT.GetConfigString(arg_5_0._weaponTable)
		var_5_4.previousCosmeticConfig = WEAPON.GetCosmeticConfigString(arg_5_0._weaponTable)
		var_5_4.previousBlueprintString = WEAPON.GetWeaponBlueprintString(arg_5_1, arg_5_0._weaponTable, var_5_4.previousAttachmentConfig)
	end

	var_0_1(arg_5_0, arg_5_2)
	arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})
	arg_5_0.bindButton:addEventHandler("button_right_stick", function(arg_6_0, arg_6_1)
		arg_5_2.weaponTable = WEAPON.GenerateWeaponTable(arg_5_0._weaponPlayerData)

		if tonumber(arg_5_2.weaponTable.variantID) > 0 then
			arg_5_2.weaponTable.lootName = WEAPON.GetLootWeaponName(arg_5_2.weaponTable.weapon, arg_5_2.weaponTable.lootID)
		end

		LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_5_1, false, arg_5_2, true)

		if arg_6_1.qualifier == "keyboard" or arg_6_1.qualifier == "gamepad" then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_5_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		local var_7_0 = LUI.FlowManager.GetScopedData("LoadoutSelect")
		local var_7_1 = var_5_4.lastTimeStamp
		local var_7_2 = Engine.DCJHCAFIIA()

		var_5_4.attachmentTimeSpent = var_5_4.attachmentTimeSpent + Engine.BAHGDJFBEF(var_7_2, "-" .. var_7_1)
		var_5_4.customizeTimeSpent = var_5_4.customizeTimeSpent + Engine.BAHGDJFBEF(var_7_2, "-" .. var_7_1)

		METRICS.GunsmithSessionSendDLogEvent(arg_5_1, var_7_0.sessionID, arg_5_0._weaponTable, arg_5_2.loadoutIndex, var_5_4.attachmentTimeSpent, var_5_4.customizeTimeSpent, var_5_4.previousAttachmentConfig, var_5_4.previousCosmeticConfig, var_5_4.previousBlueprintString)
	end)

	local var_5_5 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_5_0._weaponTable.weapon)

	if arg_5_0.SaveMod then
		local var_5_6 = GUNSMITH.CountAvailableCustomModSlots(arg_5_1, arg_5_0._weaponTable.weapon, var_5_5)
		local var_5_7 = GUNSMITH.CountModSlotsUnlocked(arg_5_1, var_5_5)

		arg_5_0.CustomModSlotCount:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MOD_COUNT", var_5_7 - var_5_6, var_5_7))

		local var_5_8 = GUNSMITH.GetNextModUnlockRank(arg_5_1, arg_5_0._weaponTable.weapon, var_5_5)

		if var_5_8 ~= nil and #var_5_8 > 0 then
			arg_5_0.NextSlotUnlock:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MOD_NEXT_UNLOCK", var_5_8))
		else
			arg_5_0.NextSlotUnlock:SetAlpha(0)
		end

		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			kbm_only = true,
			priority = 11,
			side = "left",
			button_ref = "button_left_trigger",
			helper_text = Engine.CBBHFCGDIC("CAS/SAVE_BLUEPRINT_KBM")
		})
		arg_5_0.bindButton:addEventHandler("button_left_trigger", function(arg_8_0, arg_8_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)

			local var_8_0 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_5_0._weaponTable.weapon)
			local var_8_1

			if #arg_5_0._weaponTable.blueprintName > 0 then
				var_8_1 = GUNSMITH.GetCustomModSlot(arg_5_0._weaponTable.blueprintName)
			else
				var_8_1 = GUNSMITH.GetFirstFreeCustomModSlot(arg_5_1, arg_5_0._weaponTable.weapon, var_8_0)
			end

			if var_8_1 then
				LUI.FlowManager.RequestPopupMenu(nil, "SaveCustomMod", true, arg_5_1, false, {
					loadoutIndex = arg_5_2.loadoutIndex,
					weaponIndex = arg_5_2.weaponSlot,
					modSlot = var_8_1
				})
			else
				LUI.FlowManager.RequestPopupMenu(nil, "CustomModSlotsFull", true, arg_5_1, false, {
					weaponRef = arg_5_0._weaponTable.weapon
				})
			end
		end)
	else
		local var_5_9 = GUNSMITH.GetNextModUnlockRank(arg_5_1, arg_5_0._weaponTable.weapon, var_5_5)

		if var_5_9 ~= nil and #var_5_9 > 0 then
			arg_5_0.NextSlotUnlock:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MOD_UNLOCK", var_5_9))
		else
			arg_5_0.NextSlotUnlock:SetAlpha(0)
		end
	end

	if Engine.DDJFBBJAIG() then
		local var_5_10 = Onboarding.Gunsmith.WasCompleted(arg_5_0, arg_5_1)

		local function var_5_11(arg_9_0, arg_9_1)
			if not Onboarding.WeaponMod.WasCompleted(arg_9_0, arg_9_1) then
				LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingpopup", true, arg_9_1, false, ONBOARDING_DATA.GetOnboardingWeaponModData())
				Onboarding.WeaponMod.MarkCompleted(arg_9_0, arg_9_1)
			end
		end

		if not var_5_10 then
			local var_5_12 = ONBOARDING_DATA.GetOnboardingGunsmithData()

			if CONDITIONS.GunsmithCanMakeModification(arg_5_0, arg_5_1) then
				local function var_5_13(arg_10_0, arg_10_1)
					ACTIONS.LeaveMenu(arg_10_0)
					var_5_11(arg_5_0, arg_10_1)
				end

				var_5_12.confirmButton.action = var_5_13
			end

			LUI.FlowManager.RequestPopupMenu(arg_5_0, "onboardingpopup", true, arg_5_1, false, var_5_12)
			Onboarding.Gunsmith.MarkCompleted(arg_5_0, arg_5_1)
		elseif CONDITIONS.GunsmithCanMakeModification(arg_5_0, arg_5_1) then
			var_5_11(arg_5_0, arg_5_1)
		end
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.TabBacker)
end

function Gunsmith(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "Gunsmith"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

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
	local var_11_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "TabBacker"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_11_0:addElement(var_11_4)

	var_11_0.TabBacker = var_11_4

	local var_11_5
	local var_11_6 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_11_1
			})
		end,
		controllerIndex = var_11_1
	}
	local var_11_7 = LUI.TabManager.new(var_11_6)

	var_11_7.id = "Tabs"

	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 993, _1080p * 108, _1080p * 160)
	var_11_0:addElement(var_11_7)

	var_11_0.Tabs = var_11_7

	local var_11_8
	local var_11_9 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_9.id = "MenuTitle"

	var_11_9.MenuTitle:setText("", 0)
	var_11_9.Line:SetLeft(0, 0)
	var_11_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_9)

	var_11_0.MenuTitle = var_11_9

	local var_11_10

	if CONDITIONS.InFrontend(var_11_0) then
		local var_11_11 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_11_1
		})

		var_11_11.id = "LobbyMembersFooter"

		var_11_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_11_0:addElement(var_11_11)

		var_11_0.LobbyMembersFooter = var_11_11
	end

	local var_11_12

	if CONDITIONS.GunsmithCanMakeModification(var_11_0, var_11_1) then
		var_11_12 = LUI.UIText.new()
		var_11_12.id = "CustomModSlotCount"

		var_11_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_11_12:SetAlpha(0.5, 0)
		var_11_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MOD_COUNT"), 0)
		var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_11_12:SetWordWrap(false)
		var_11_12:SetAlignment(LUI.Alignment.Left)
		var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 587, _1080p * 712, _1080p * 736)
		var_11_0:addElement(var_11_12)

		var_11_0.CustomModSlotCount = var_11_12
	end

	local var_11_13

	if CONDITIONS.GunsmithCanMakeModification(var_11_0, var_11_1) then
		var_11_13 = LUI.UIText.new()
		var_11_13.id = "SaveMod"

		var_11_13:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_11_13:setText(Engine.CBBHFCGDIC("CAS/SAVE_BLUEPRINT"), 0)
		var_11_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_11_13:SetWordWrap(false)
		var_11_13:SetAlignment(LUI.Alignment.Left)
		var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 587, _1080p * 679, _1080p * 707)
		var_11_0:addElement(var_11_13)

		var_11_0.SaveMod = var_11_13
	end

	local var_11_14
	local var_11_15 = LUI.UIText.new()

	var_11_15.id = "NextSlotUnlock"

	var_11_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_15:SetAlpha(0.5, 0)
	var_11_15:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MOD_NEXT_UNLOCK"), 0)
	var_11_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_15:SetWordWrap(false)
	var_11_15:SetAlignment(LUI.Alignment.Left)
	var_11_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 587, _1080p * 736, _1080p * 760)
	var_11_0:addElement(var_11_15)

	var_11_0.NextSlotUnlock = var_11_15

	local function var_11_16()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_16

	local var_11_17

	if CONDITIONS.GunsmithCanMakeModification(var_11_0, var_11_1) then
		local var_11_18 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 730
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 700
			}
		}

		var_11_12:RegisterAnimationSequence("AR", var_11_18)
	end

	if CONDITIONS.GunsmithCanMakeModification(var_11_0, var_11_1) then
		local var_11_19 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 659
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 695
			}
		}

		var_11_13:RegisterAnimationSequence("AR", var_11_19)
	end

	local var_11_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 730
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 760
		}
	}

	var_11_15:RegisterAnimationSequence("AR", var_11_20)

	local function var_11_21()
		if CONDITIONS.GunsmithCanMakeModification(var_11_0, var_11_1) then
			var_11_12:AnimateSequence("AR")
		end

		if CONDITIONS.GunsmithCanMakeModification(var_11_0, var_11_1) then
			var_11_13:AnimateSequence("AR")
		end

		var_11_15:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_21

	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_11_22 = LUI.UIBindButton.new()

	var_11_22.id = "selfBindButton"

	var_11_0:addElement(var_11_22)

	var_11_0.bindButton = var_11_22

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("Gunsmith", Gunsmith)
LockTable(_M)
