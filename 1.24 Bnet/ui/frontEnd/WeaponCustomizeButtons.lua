module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_3 == nil then
		arg_1_3 = {}
	end

	arg_1_3.weaponSlot = arg_1_0.weaponSlot
	arg_1_3.loadoutIndex = arg_1_0.loadoutIndex

	LUI.FlowManager.RequestAddMenu(arg_1_2, true, arg_1_1, nil, arg_1_3, true)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_2)
	assert(arg_2_3)

	local var_2_0 = PlayerData.BFFBGAJGD(arg_2_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_2_3].weaponSetups[arg_2_2]
	local var_2_1 = var_2_0.weapon:get()
	local var_2_2 = var_2_0.attachmentSetup[0].attachment:get()
	local var_2_3 = var_2_0.attachmentSetup[1].attachment:get()
	local var_2_4 = WEAPON.GetEquippedCamo(var_2_0)
	local var_2_5 = WEAPON.GetEquippedReticle(var_2_0)
	local var_2_6 = WEAPON.GetEquippedCharm(var_2_0)
	local var_2_7 = WEAPON.GetEquippedStickers(var_2_0)

	arg_2_0.equippedOptic = ATTACHMENT.GetEquippedOptic(var_2_0)
	arg_2_0.weaponSlot = arg_2_2
	arg_2_0.loadoutIndex = arg_2_3

	local function var_2_8(arg_3_0, arg_3_1)
		if arg_3_1 ~= "" then
			arg_3_0:SetSelectedImage(arg_3_1)
		else
			arg_3_0.Image:SetAlpha(0)
		end
	end

	local function var_2_9(arg_4_0, arg_4_1)
		for iter_4_0 = 1, #arg_4_1 do
			arg_4_0:SetImageWithNum(iter_4_0, arg_4_1[iter_4_0])
		end
	end

	if var_2_4 then
		local var_2_10 = var_2_4 == WEAPON.CamoNoneValue and WEAPON.emptyCustomizeSlotIcon or WEAPON.GetCamoImage(var_2_4)

		var_2_8(arg_2_0.CamoButton, var_2_10)
	else
		arg_2_0.CamoButton.Image:SetAlpha(0)
	end

	local var_2_11 = var_2_1 .. GUNSMITH.typeNamePostFix.camos
	local var_2_12 = Loot.DAFIICDBFJ(arg_2_1, var_2_11)

	arg_2_0.CamoButton:UpdateBreadcrumb(var_2_12)

	if not WEAPON.SupportsOptics(var_2_1) then
		arg_2_0.OpticButton:closeTree()

		arg_2_0.OpticButton = nil
	elseif not ATTACHMENT.SupportsCustomReticles(arg_2_0.equippedOptic) then
		arg_2_0.OpticButton:SetDisabledText(Engine.CBBHFCGDIC("LUA_MENU/RETICLE_DISABLED_DESC"))
		arg_2_0.OpticButton:SetButtonDisabled(true)
	elseif var_2_5 then
		local var_2_13 = var_2_5 == WEAPON.ReticleNoneValue and WEAPON.emptyCustomizeSlotIcon or WEAPON.GetReticleImage(var_2_5)

		var_2_8(arg_2_0.OpticButton, var_2_13)

		local var_2_14 = GUNSMITH.CheckNewReticleForOptic(arg_2_1, arg_2_0.equippedOptic)

		arg_2_0.OpticButton:UpdateBreadcrumb(var_2_14)
	end

	if not WEAPON.SupportsCosmetics(var_2_1) then
		arg_2_0.CharmButton:closeTree()

		arg_2_0.CharmButton = nil
	elseif var_2_6 then
		local var_2_15 = var_2_6 == WEAPON.CharmNoneValue and WEAPON.emptyCustomizeSlotIcon or WEAPON.GetCharmImage(var_2_6)

		var_2_8(arg_2_0.CharmButton, var_2_15)

		local var_2_16 = LOOT.IsCategoryNew(arg_2_1, LOOT.itemTypes.CHARM)

		arg_2_0.CharmButton:UpdateBreadcrumb(var_2_16)
	end

	if not (WEAPON.GetMaxStickerSlotsForWeapon(var_2_1) > 0) then
		arg_2_0.StickerButton:closeTree()

		arg_2_0.StickerButton = nil
	elseif var_2_7 then
		local var_2_17 = {}
		local var_2_18 = WEAPON.GetMaxStickerSlotsForWeapon(var_2_1)

		for iter_2_0 = 1, var_2_18 do
			local var_2_19 = var_2_7[iter_2_0]
			local var_2_20 = var_2_19 == WEAPON.StickerNoneValue and WEAPON.emptyCustomizeSlotIcon or WEAPON.GetStickerImage(var_2_19)

			table.insert(var_2_17, var_2_20)
		end

		arg_2_0.StickerButton:SetAvailableImages(var_2_18)
		var_2_9(arg_2_0.StickerButton, var_2_17)

		local var_2_21 = LOOT.IsCategoryNew(arg_2_1, LOOT.itemTypes.STICKER)

		arg_2_0.StickerButton:UpdateBreadcrumb(var_2_21)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.CamoButton)
	assert(arg_5_0.OpticButton)
	assert(arg_5_0.CharmButton)
	assert(arg_5_0.StickerButton)

	arg_5_0.SetupButtons = var_0_1

	arg_5_0:SetAlignment(LUI.Alignment.Center)
	arg_5_0.CamoButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		var_0_0(arg_5_0, arg_6_1.controller, "CamoCategorySelect", arg_5_2)
	end)
	arg_5_0.OpticButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		var_0_0(arg_5_0, arg_7_1.controller, "ReticleSelect", {
			equippedOptic = arg_5_0.equippedOptic
		})
	end)
	arg_5_0.CharmButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		var_0_0(arg_5_0, arg_8_1.controller, "CharmSelect", arg_5_2)
	end)
	arg_5_0.StickerButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		var_0_0(arg_5_0, arg_9_1.controller, "StickerLocationSelect", arg_5_2)
	end)
end

function WeaponCustomizeButtons(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIHorizontalList.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1660 * _1080p, 0, 112 * _1080p)

	var_10_0.id = "WeaponCustomizeButtons"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0

	var_10_0:SetSpacing(55 * _1080p)

	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("WeaponCustomizeButton", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "CamoButton"

	var_10_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CAMO_SELECT_DESC"), 0)
	var_10_4.Category:setText(Engine.CBBHFCGDIC("MENU/CAMOUFLAGE"), 0)
	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 301, 0, _1080p * 112)
	var_10_0:addElement(var_10_4)

	var_10_0.CamoButton = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("WeaponCustomizeButton", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "OpticButton"

	var_10_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/RETICLE_SELECT_DESC"), 0)
	var_10_6.Category:setText(Engine.CBBHFCGDIC("MENU/RETICLE"), 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 356, _1080p * 657, 0, _1080p * 112)
	var_10_0:addElement(var_10_6)

	var_10_0.OpticButton = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("WeaponCustomizeButton", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "CharmButton"

	var_10_8.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CHARM_SELECT_DESC"), 0)
	var_10_8.Category:setText(Engine.CBBHFCGDIC("MENU/CHARM"), 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 712, _1080p * 1013, 0, _1080p * 112)
	var_10_0:addElement(var_10_8)

	var_10_0.CharmButton = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("StickerCustomizeButton", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "StickerButton"

	var_10_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/STICKER_SELECT_DESC"), 0)
	var_10_10.Category:setText(Engine.CBBHFCGDIC("MENU/STICKER"), 0)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1068, _1080p * 1369, 0, _1080p * 112)
	var_10_0:addElement(var_10_10)

	var_10_0.StickerButton = var_10_10

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("WeaponCustomizeButtons", WeaponCustomizeButtons)
LockTable(_M)
