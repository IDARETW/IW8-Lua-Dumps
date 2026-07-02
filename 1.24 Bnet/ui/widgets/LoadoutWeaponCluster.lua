module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.AttachmentsButton:SetAlpha(0)
	arg_1_0.ChallengesButton:SetAlpha(0)
	arg_1_0.ChallengesButton:SetMouseFocusBlocker(true)
	arg_1_0.BlueprintStoreButton:SetAlpha(0)
	arg_1_0.BlueprintStoreButton:SetMouseFocusBlocker(true)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_3 = arg_2_3 and Dvar.IBEGCHEFE("MRKSTPMLT") and not CONDITIONS.AreRestrictionsActive(controllerIndex)

	arg_2_0.AttachmentsButton:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.AttachmentsButton:SetMouseFocusBlocker(not arg_2_1)
	arg_2_0.ChallengesButton:SetAlpha(arg_2_2 and 1 or 0)
	arg_2_0.ChallengesButton:SetMouseFocusBlocker(not arg_2_2)
	arg_2_0.BlueprintStoreButton:SetAlpha(arg_2_3 and 1 or 0)
	arg_2_0.BlueprintStoreButton:SetMouseFocusBlocker(not arg_2_3)

	local var_2_0 = 3

	if arg_2_1 and not arg_2_2 then
		var_2_0 = 2
	elseif not arg_2_1 and not arg_2_2 then
		var_2_0 = 1
	end

	ACTIONS.AnimateSequence(arg_2_0, "BlueprintStore" .. var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3 = arg_3_3 and Dvar.IBEGCHEFE("MRKSTPMLT") and not CONDITIONS.AreRestrictionsActive(controllerIndex)

	if arg_3_1 ~= arg_3_0._attachmentsEnabled or arg_3_2 ~= arg_3_0._challengesEnabled or arg_3_3 ~= arg_3_0._blueprintStoreEnabled then
		arg_3_0.WeaponButton.navigation = (arg_3_1 or arg_3_2 or arg_3_3) and {} or nil
		arg_3_0.AttachmentsButton.navigation = arg_3_1 and {} or nil
		arg_3_0.ChallengesButton.navigation = arg_3_2 and {} or nil
		arg_3_0.BlueprintStoreButton.navigation = arg_3_3 and {} or nil

		local var_3_0 = {
			arg_3_0.WeaponButton
		}

		if arg_3_1 then
			table.insert(var_3_0, arg_3_0.AttachmentsButton)
		end

		if arg_3_2 then
			table.insert(var_3_0, arg_3_0.ChallengesButton)
		end

		if arg_3_3 then
			table.insert(var_3_0, arg_3_0.BlueprintStoreButton)
		end

		for iter_3_0, iter_3_1 in ipairs(var_3_0) do
			if var_3_0[iter_3_0 + 1] then
				iter_3_1.navigation.right = var_3_0[iter_3_0 + 1]
			end

			if var_3_0[iter_3_0 - 1] then
				iter_3_1.navigation.left = var_3_0[iter_3_0 - 1]
			end
		end
	end

	arg_3_0._attachmentsEnabled = arg_3_1
	arg_3_0._challengesEnabled = arg_3_2
	arg_3_0._blueprintStoreEnabled = arg_3_3
end

local var_0_3 = {
	loadoutEdit = 2,
	loadoutSelect = 1
}

local function var_0_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = WEAPON.GetSlotFromRef(arg_4_2)
	local var_4_1 = #WEAPON.GetNewWeaponIDsBySlot(arg_4_1, var_4_0) > 0
	local var_4_2 = GUNSMITH.CheckNewGunsmithByWeapon(arg_4_1, arg_4_3)
	local var_4_3 = LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_4_3.attachmentSetup, arg_4_2)
	local var_4_4 = false

	if arg_4_0._menuState == var_0_3.loadoutSelect then
		var_4_4 = (var_4_1 or var_4_2) and not var_4_3
	else
		var_4_4 = var_4_1 and not var_4_3
	end

	if not CONDITIONS.IsSplitscreen() then
		arg_4_0.WeaponButton.NewItemSmallIcon:UpdateAlpha(var_4_4 and 1 or 0, 0, true)
		arg_4_0.AttachmentsButton.NewItemSmallIcon:UpdateAlpha(var_4_2 and not var_4_3 and 1 or 0, 0, true)

		local var_4_5 = LUI.FlowManager.GetScopedData(arg_4_0)

		if var_4_5.bundleVariants then
			local var_4_6 = STORE.AreAnyBundlesNew(arg_4_1, var_4_5.bundleVariants[arg_4_2])

			arg_4_0.BlueprintStoreButton.NewItemSmallIcon:UpdateAlpha(var_4_6 and 1 or 0, 0, true)
		end
	end
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6, arg_5_7)
	assert(arg_5_0.WeaponButton)
	assert(arg_5_0.AttachmentsButton)

	local var_5_0 = arg_5_7 and arg_5_7.ref or arg_5_2.weapon:get()
	local var_5_1 = arg_5_7 and true or false
	local var_5_2 = arg_5_7 and "" or GUNSMITH.GetCustomModName(arg_5_2.blueprintName:get())

	arg_5_0.WeaponButton:SetupButton(arg_5_1, var_5_0, var_5_2, arg_5_3, arg_5_4, arg_5_2, arg_5_7, var_5_1)

	if arg_5_0.WeaponButton.WeaponLevelBar then
		arg_5_0.WeaponButton.WeaponLevelBar:Setup(arg_5_1, var_5_0)
	end

	arg_5_0.WeaponButton.MiniAttachments:Setup(arg_5_1, var_5_0, arg_5_7 and arg_5_7.attachments or ATTACHMENT.GetTableFromWeaponSetup(arg_5_2), {
		isPrimary = true
	})

	local var_5_3 = false

	if arg_5_2 then
		var_5_3 = PROGRESSION.IsUnlocked(arg_5_1, LOOT.itemTypes.WEAPON, arg_5_2.weapon:get())
	end

	if arg_5_0.WeaponButton.RarityColorBackground then
		if not Engine.DDJFBBJAIG() and CONDITIONS.IsBRGameType(arg_5_0) then
			if arg_5_7 then
				local var_5_4 = arg_5_0.WeaponButton.MiniAttachments:GetCurrentNumOfAttachments()
				local var_5_5 = var_5_4

				if var_5_4 > 1 then
					var_5_5 = var_5_4 - 1
				end

				arg_5_0.WeaponButton.RarityColorBackground:ShowRarityColor(var_5_5)
			else
				local var_5_6 = arg_5_2.lootItemID:get()

				if var_5_6 ~= LOOT.emptyID then
					local var_5_7 = LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, var_5_6)

					arg_5_0.WeaponButton.RarityColorBackground:ShowRarityColor(var_5_7)
				else
					arg_5_0.WeaponButton.RarityColorBackground:ShowRarityColor(BRLOOT.itemRarities.COMMON)
				end
			end
		else
			arg_5_0.WeaponButton.RarityColorBackground:HideRarityColor()
		end
	end

	if arg_5_5 then
		arg_5_0.WeaponButton.MiniAttachments:SetAlpha(1)
	else
		arg_5_0.WeaponButton.MiniAttachments:SetAlpha(0)
	end

	local var_5_8 = GUNSMITH.AreMasterChallengesEnabled(arg_5_1, var_5_0)
	local var_5_9 = LUI.FlowManager.GetScopedData(arg_5_0)

	var_0_2(arg_5_0, (arg_5_5 or arg_5_6) and var_5_3, var_5_8, var_5_9.bundleVariants and var_5_9.bundleVariants[var_5_0])
	arg_5_0.WeaponButton:addEventHandler("button_over", function()
		if arg_5_5 then
			arg_5_0.WeaponButton.MiniAttachments:SetAlpha(1, 200)
		else
			arg_5_0.WeaponButton.MiniAttachments:SetAlpha(0)
		end
	end)
	arg_5_0.WeaponButton:addEventHandler("button_up", function()
		if arg_5_5 then
			arg_5_0.WeaponButton.MiniAttachments:SetAlpha(1, 100)
		else
			arg_5_0.WeaponButton.MiniAttachments:SetAlpha(0)
		end
	end)
	arg_5_0:addAndCallEventHandler("menu_state_updated", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0 or arg_5_0:GetCurrentMenu()

		arg_5_0._menuState = var_8_0._scoped.menuState or var_0_3.loadoutSelect

		var_0_4(arg_5_0, arg_5_1, var_5_0, arg_5_2)
	end)

	if MatchRules.CADFFHGJAE(var_5_0) then
		ACTIONS.AnimateSequence(arg_5_0, "RestrictionOn")
	end

	if LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_5_2.attachmentSetup, var_5_0) then
		ACTIONS.AnimateSequence(arg_5_0, "RestrictionWarningOn")
		ACTIONS.AnimateSequence(arg_5_0.AttachmentsButton, "RestrictionOn")
	end
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.SetupCluster = var_0_5
	arg_9_0.HideCustomizeButtons = var_0_0
	arg_9_0.ShowCustomizeButtons = var_0_1

	if CONDITIONS.IsSplitscreen(arg_9_0) then
		ACTIONS.AnimateSequence(arg_9_0, "Splitscreen")
	end

	arg_9_0.BlueprintStoreButton:SetupTheme()
end

function LoadoutWeaponCluster(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 190 * _1080p)

	var_10_0.id = "LoadoutWeaponCluster"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("LoadoutWeaponButton", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "WeaponButton"

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, 0, _1080p * 190)
	var_10_0:addElement(var_10_4)

	var_10_0.WeaponButton = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("RestrictionGunsmithWarning", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "RestrictionGunsmithWarning"

	var_10_6:SetAlpha(0, 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 453, 0, _1080p * 120)
	var_10_0:addElement(var_10_6)

	var_10_0.RestrictionGunsmithWarning = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("LoadoutEditButton", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "AttachmentsButton"

	var_10_8:SetAlpha(0, 0)
	var_10_8.Icon:setImage(RegisterMaterial("icon_attachments"), 0)
	var_10_8.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/GUNSMITH"), 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 531, 0, _1080p * 120)
	var_10_0:addElement(var_10_8)

	var_10_0.AttachmentsButton = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("LoadoutEditButton", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "ChallengesButton"

	var_10_10:SetAlpha(0, 0)
	var_10_10.Icon:setImage(RegisterMaterial("icon_challenge_weapon"), 0)
	var_10_10.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGE"), 0)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 538, _1080p * 658, 0, _1080p * 120)
	var_10_0:addElement(var_10_10)

	var_10_0.ChallengesButton = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "RestrictionWarning"

	var_10_12:SetAlpha(0, 0)
	var_10_12:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_10_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -37, _1080p * -2, _1080p * 74, _1080p * 109)
	var_10_0:addElement(var_10_12)

	var_10_0.RestrictionWarning = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("LoadoutEditButton", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "BlueprintStoreButton"

	var_10_14:SetAlpha(0, 0)
	var_10_14.Icon:setImage(RegisterMaterial("icon_challenge_weapon"), 0)
	var_10_14.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE"), 0)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 665, _1080p * 785, 0, _1080p * 120)
	var_10_0:addElement(var_10_14)

	var_10_0.BlueprintStoreButton = var_10_14

	local function var_10_15()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_15

	local function var_10_16()
		return
	end

	var_10_0._sequences.ExtendAttachments = var_10_16

	local function var_10_17()
		return
	end

	var_10_0._sequences.RetractAttachments = var_10_17

	local var_10_18
	local var_10_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 188
		}
	}

	var_10_4:RegisterAnimationSequence("Splitscreen", var_10_19)

	local function var_10_20()
		var_10_4:AnimateSequence("Splitscreen")
	end

	var_10_0._sequences.Splitscreen = var_10_20

	local function var_10_21()
		return
	end

	var_10_0._sequences.RestrictionWarningOff = var_10_21

	local var_10_22
	local var_10_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("RestrictionWarningOn", var_10_23)

	local function var_10_24()
		var_10_6:AnimateSequence("RestrictionWarningOn")
	end

	var_10_0._sequences.RestrictionWarningOn = var_10_24

	local var_10_25
	local var_10_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("RestrictionOn", var_10_26)

	local function var_10_27()
		var_10_12:AnimateSequence("RestrictionOn")
	end

	var_10_0._sequences.RestrictionOn = var_10_27

	local var_10_28
	local var_10_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("RestrictionOff", var_10_29)

	local function var_10_30()
		var_10_12:AnimateSequence("RestrictionOff")
	end

	var_10_0._sequences.RestrictionOff = var_10_30

	local var_10_31
	local var_10_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 658
		}
	}

	var_10_14:RegisterAnimationSequence("BlueprintStore2", var_10_32)

	local function var_10_33()
		var_10_14:AnimateSequence("BlueprintStore2")
	end

	var_10_0._sequences.BlueprintStore2 = var_10_33

	local var_10_34
	local var_10_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 411
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 531
		}
	}

	var_10_14:RegisterAnimationSequence("BlueprintStore1", var_10_35)

	local function var_10_36()
		var_10_14:AnimateSequence("BlueprintStore1")
	end

	var_10_0._sequences.BlueprintStore1 = var_10_36

	local var_10_37
	local var_10_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 665
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 785
		}
	}

	var_10_14:RegisterAnimationSequence("BlueprintStore3", var_10_38)

	local function var_10_39()
		var_10_14:AnimateSequence("BlueprintStore3")
	end

	var_10_0._sequences.BlueprintStore3 = var_10_39

	var_0_6(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("LoadoutWeaponCluster", LoadoutWeaponCluster)
LockTable(_M)
