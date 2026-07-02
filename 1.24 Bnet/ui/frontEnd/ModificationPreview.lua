module(..., package.seeall)

local var_0_0 = "Attachment"
local var_0_1 = -30
local var_0_2 = 30
local var_0_3 = 200

local function var_0_4(arg_1_0, arg_1_1)
	arg_1_0.WeaponRotator = MenuBuilder.BuildRegisteredType("WeaponRotator", {
		controllerIndex = arg_1_1,
		weaponIndex = FrontEndScene.ClientWeapons.Preview,
		weaponModelName = arg_1_0._weaponModelName,
		weaponModel = arg_1_0._weaponModel
	})

	arg_1_0.WeaponRotator:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	arg_1_0.WeaponRotator.id = "WeaponRotator"

	arg_1_0:addElement(arg_1_0.WeaponRotator)
	arg_1_0.WeaponRotator.weaponRotationArea:addEventHandler("update_weapon_yaw_rotation", function(arg_2_0, arg_2_1)
		local var_2_0 = math.fmod(arg_2_0:GetCurrentYaw(), 360)
		local var_2_1 = var_2_0 > var_0_1 and var_2_0 < var_0_2

		for iter_2_0 = 1, GUNSMITH.maxCategories do
			if arg_1_0._usedAttachments[iter_2_0] then
				local var_2_2 = arg_1_0[var_0_0 .. iter_2_0]

				assert(var_2_2)
				var_2_2:SetAlpha(var_2_1 and 1 or 0, var_0_3)
			end
		end
	end)
end

local function var_0_5(arg_3_0, arg_3_1)
	local function var_3_0()
		ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, true)
		ACTIONS.AnimateSequence(arg_3_0, "FadeIn")
		arg_3_0:processEvent({
			name = "weapon_model_loaded"
		})
	end

	ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)
	WEAPON.LoadAndSetModel(arg_3_1, arg_3_0._weaponModel, arg_3_0._weaponTable, {
		callbackFunc = var_3_0
	})
end

local function var_0_6(arg_5_0, arg_5_1)
	return function()
		var_0_5(arg_5_0, arg_5_1)
	end
end

local function var_0_7(arg_7_0)
	for iter_7_0 = 1, GUNSMITH.maxCategories do
		if not arg_7_0._usedAttachments[iter_7_0] then
			local var_7_0 = arg_7_0[var_0_0 .. iter_7_0]

			assert(var_7_0)
			var_7_0:closeTree()

			arg_7_0[var_0_0 .. iter_7_0] = nil
		end
	end
end

local function var_0_8(arg_8_0, arg_8_1)
	for iter_8_0, iter_8_1 in pairs(arg_8_0._usedAttachments) do
		if iter_8_1 then
			local var_8_0 = arg_8_0[var_0_0 .. iter_8_0]

			assert(var_8_0)

			local var_8_1 = GUNSMITH.GetSelectedAttachIndexForCategory(iter_8_1, arg_8_0._weaponTable)
			local var_8_2 = arg_8_0._weaponTable.attachments[var_8_1]

			assert(var_8_2)

			local var_8_3 = arg_8_0._weaponTable.attachments
			local var_8_4

			for iter_8_2 = 1, #var_8_3 do
				if var_8_3[iter_8_2].ref == var_8_2.ref then
					var_8_4 = var_8_3[iter_8_2].variantID
				end
			end

			var_8_0:Setup(arg_8_0._weaponTable.weapon, var_8_4, ATTACHMENT.GetRef(var_8_2.ref, arg_8_0._weaponTable.weapon))
		end
	end

	var_0_7(arg_8_0)
end

local function var_0_9(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0._weaponTable = arg_9_2.weaponTable

	WEAPON.SetPreviewSceneForWeapon(arg_9_0._weaponTable.weapon)

	arg_9_0._titleText = arg_9_0._weaponTable.blueprintName ~= "" and GUNSMITH.GetCustomModName(arg_9_0._weaponTable.blueprintName) or arg_9_0._weaponTable.lootName

	arg_9_0.SaveInfo:SetAlpha(0)
	arg_9_0.Continue:SetAlpha(0)
	arg_9_0.Continue:SetMouseFocusBlocker(true)

	arg_9_0._weaponModelName = WEAPON.GetWeaponModelName(arg_9_0._weaponTable.weapon, arg_9_0._weaponTable, {
		includeCamos = true,
		includeAttachments = true,
		includeStickers = true,
		controllerIndex = arg_9_1
	})

	if arg_9_2.weaponTable then
		local var_9_0 = arg_9_2.weaponTable.lootID or arg_9_2.isStorePreview and LOOT.GetItemID(arg_9_2.storePreviewItemType, arg_9_2.itemRef)
		local var_9_1 = arg_9_2.weaponTable.variantID or 0
		local var_9_2 = WEAPON.GetWeaponClass(arg_9_2.weaponTable.weapon)
		local var_9_3

		if var_9_2 == "weapon_melee" or var_9_2 == "weapon_melee2" then
			var_9_3 = ToUpperCase("STORE_FLAVOR/" .. string.gsub(arg_9_2.weaponTable.weapon, "^iw8_", "") .. "_" .. var_9_1 .. "_FLAVOR")
		else
			var_9_3 = ToUpperCase("WEAPON_FLAVOR/" .. string.gsub(arg_9_2.weaponTable.weapon, "^iw8_", "") .. "_" .. var_9_1 .. "_FLAVOR")
		end

		DebugPrint("|||||||||||||||||||||| flavorTextRef: " .. var_9_3)

		local var_9_4 = Engine.CBBHFCGDIC(var_9_3)

		if not Engine.CIDEADAABH() and WEAPON.IsWeaponDismembermentEnabled(var_9_0) then
			var_9_4 = var_9_4 .. " " .. Engine.CBBHFCGDIC("LUA_MENU/DISMEMBERMENT_REGION_LOCK_WARNING")
		end

		if var_9_4 ~= var_9_3 then
			arg_9_0.FlavorText:setText(var_9_4)
		end

		local var_9_5 = LOOT.GetItemQuality(LOOT.itemTypes.WEAPON, arg_9_2.itemRef, var_9_0)

		Engine.EBHIFJCGBH("set_ui_rarity_image", var_9_5 and var_9_5 + 1 or 0)
	end

	if arg_9_2.isStorePreview then
		assert(arg_9_0.ItemType)

		local var_9_6 = arg_9_2.storePreviewItemType
		local var_9_7 = var_9_6 == LOOT.itemTypes.WEAPON and arg_9_2.weaponTable.lootID or LOOT.GetItemID(var_9_6, arg_9_2.itemRef)
		local var_9_8 = LOOT.GetItemClassName(var_9_6, arg_9_2.itemRef)
		local var_9_9 = WEAPON.GetName(arg_9_2.itemRef)

		if var_9_8 and var_9_9 and #var_9_8 > 0 and #var_9_9 > 0 then
			arg_9_0.ItemType:setText(WEAPON.GetSubClass(arg_9_2.itemRef))
		end

		local var_9_10 = LOOT.GetItemQuality(var_9_6, arg_9_2.itemRef, var_9_7)
		local var_9_11 = LOOT.GetRarityColor(tonumber(var_9_10))
		local var_9_12 = LOOT.GetLootQualityString(tonumber(var_9_10))

		if arg_9_2.isVariant then
			arg_9_0.QualityText:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE", var_9_12, "CAS/BLUEPRINT"))
		else
			arg_9_0.QualityText:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE", var_9_12, "LOOT_MP/ITEM_TYPE_WEAPON"))
		end

		arg_9_0.QualityText:SetRGBFromTable(var_9_11)
		arg_9_0.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(tonumber(var_9_10))))
		arg_9_0.RarityIcon:SetRGBFromTable(var_9_11)
		ACTIONS.AnimateSequence(arg_9_0, "FromStore")
		arg_9_0.FlavorText:SetVerticalAlignment(LUI.Alignment.Top)
	else
		if IsLanguageChinese() then
			ACTIONS.AnimateSequence(arg_9_0, "CHT")
		end

		Engine.EBHIFJCGBH("set_ui_rarity_image", 0)
	end

	if arg_9_2.isStorePreview or arg_9_2.fromArmory then
		var_0_4(arg_9_0, arg_9_1)
	end
end

local function var_0_10(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MenuTitle)
	assert(arg_10_0.Continue)

	if Engine.BHICADFIHA() then
		if not arg_10_2.modSlot then
			DebugPrint("WARNING: Missing \"modSlot\" option for ModificationPreview menu. Only OK after a MyChanges.")

			arg_10_2.modSlot = 0
		end

		if not arg_10_2.weaponRef then
			DebugPrint("WARNING: Missing \"weaponTable\" option for ModificationPreview menu. Only OK after a MyChanges.")

			arg_10_2.weaponRef = WEAPON.DefaultPrimary
		end
	end

	if not arg_10_2.weaponRef then
		arg_10_2.weaponRef = arg_10_2.itemRef or arg_10_2.weaponTable and arg_10_2.weaponTable.weapon
	end

	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_10_0._weaponModel = WEAPON.GetWeaponModel(arg_10_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.previewFile)

	arg_10_0:addElement(arg_10_0._weaponModel)

	local var_10_0 = LUI.UIBindButton.new()

	var_10_0.id = "selfBindButton"

	arg_10_0:addElement(var_10_0)

	arg_10_0.bindButton = var_10_0
	arg_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_10_1
	})
	arg_10_0.HelperBar.id = "HelperBar"

	arg_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	arg_10_0.HelperBar:setPriority(10)
	arg_10_0:addElement(arg_10_0.HelperBar)

	if not arg_10_2.isStorePreview and not arg_10_2.fromArmory then
		arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
		})
		arg_10_0.bindButton:addEventHandler("button_right_stick", function(arg_11_0, arg_11_1)
			local var_11_0 = LUI.DeepCopy(arg_10_2)

			var_11_0.weaponTable = arg_10_0._weaponTable
			var_11_0.isStorePreview = false

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_10_1, false, var_11_0, true)
		end)
	else
		if GUNSMITH.IsAnyWeaponAvailableCategoryPreviewData(arg_10_2.weaponRef) then
			arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				priority = 10,
				helper_text = Engine.CBBHFCGDIC("WEAPON/ENTER_PREVIEW_MODE")
			})
			arg_10_0.bindButton:addEventHandler("button_right_stick", function(arg_12_0, arg_12_1)
				LUI.FlowManager.RequestAddMenu("WeaponPreviewFilm", true, arg_10_1, false, arg_10_2, true)

				if arg_12_1.qualifier then
					Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
				end
			end)
		end

		if arg_10_2.isBattlePass then
			BATTLEPASS.AddPurchasePrompt(arg_10_0, arg_10_1)
		end

		local var_10_1 = arg_10_2.bundleData

		if arg_10_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_10_1.isBundlePurchased then
			arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE")
			})
			arg_10_0.bindButton:addEventHandler("button_alt1", function(arg_13_0, arg_13_1)
				STORE.OpenQuickPurchasePopupInPreview(var_10_1)
			end)
		end
	end

	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_10_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		ACTIONS.LeaveMenu(arg_10_0)
	end)

	arg_10_0._titleText = ""

	if arg_10_2.fromArmory or arg_10_2.isStorePreview then
		var_0_9(arg_10_0, arg_10_1, arg_10_2)
	else
		assert(arg_10_2.modSlot)
		assert(arg_10_2.weaponRef)

		arg_10_0._weaponTable = GUNSMITH.GetCustomMod(arg_10_1, arg_10_2.weaponRef, arg_10_2.modSlot)
		arg_10_0._titleText = GUNSMITH.GetCustomModName(arg_10_0._weaponTable.blueprintName)

		arg_10_0.SaveInfo:SetAlpha(1)
		arg_10_0.Continue:SetAlpha(1)
		arg_10_0.Continue:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			LUI.FlowManager.RequestLeaveMenu(arg_15_0)
		end)
	end

	arg_10_0.MenuTitle:SetTitle(arg_10_0._titleText)

	if arg_10_2.isStorePreview then
		if not arg_10_2.isVariant then
			ACTIONS.AnimateSequence(arg_10_0, "IsBase")
		end

		local var_10_2 = LAYOUT.GetTextWidth(arg_10_0.MenuTitle.MenuTitle)
		local var_10_3 = LAYOUT.GetElementWidth(arg_10_0.BlueprintIcon)
		local var_10_4 = 100 * _1080p

		arg_10_0.BlueprintIcon:SetLeft(var_10_2 + var_10_4)
		arg_10_0.BlueprintIcon:SetRight(var_10_2 + var_10_4 + var_10_3)

		local var_10_5 = arg_10_2.storePreviewItemType
		local var_10_6 = var_10_5 == LOOT.itemTypes.WEAPON and arg_10_2.weaponTable.lootID or LOOT.GetItemID(var_10_5, arg_10_2.itemRef)

		if Loot.DEBEIFJEEG(arg_10_1, var_10_6) > 0 then
			local var_10_7 = LAYOUT.GetElementWidth(arg_10_0.CheckboxFrame)
			local var_10_8 = 16 * _1080p
			local var_10_9 = var_10_5 == LOOT.itemTypes.WEAPON
			local var_10_10 = {
				arg_10_0.Checkbox,
				arg_10_0.CheckboxFrame
			}

			for iter_10_0 = 1, #var_10_10 do
				var_10_10[iter_10_0]:SetLeft(var_10_2 + var_10_4 + (var_10_9 and var_10_3 + var_10_8 or 0))
				var_10_10[iter_10_0]:SetRight(var_10_2 + var_10_4 + (var_10_9 and var_10_3 + var_10_8 or 0) + var_10_7)
				var_10_10[iter_10_0]:SetAlpha(1)
			end
		end
	end

	arg_10_0.WeaponAttributes:Setup(arg_10_0._weaponTable)
	arg_10_0:addEventHandler("menu_close", function(arg_16_0, arg_16_1)
		Engine.EBHIFJCGBH("set_ui_rarity_image", 0)
	end)

	local var_10_11 = {}

	for iter_10_1, iter_10_2 in ipairs(arg_10_0._weaponTable.attachments) do
		local var_10_12 = ATTACHMENT.GetRef(iter_10_2.ref, arg_10_0._weaponTable.weapon)
		local var_10_13 = ATTACHMENT.GetCategory(var_10_12)

		if var_10_12 ~= ATTACHMENT.none then
			var_10_11[var_10_13] = var_10_11[var_10_13] or {}

			table.insert(var_10_11[var_10_13], var_10_12)
		end
	end

	arg_10_0._usedAttachments = GUNSMITH.GetUsedAttachmentIndices(arg_10_0._weaponTable.weapon, var_10_11)

	var_0_8(arg_10_0, arg_10_1)

	if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 then
		var_0_5(arg_10_0, arg_10_1)
	end

	MenuUtils.SetupSceneChangeCallback(arg_10_0, var_0_6(arg_10_0, arg_10_1))
	ACTIONS.ScaleFullscreen(arg_10_0.Darkener)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_10_0.TabBacker)

	if arg_10_2.timerValue then
		arg_10_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_10_2.timerValue, true, true)
	else
		arg_10_0.LimitedTimeItem:SetAlpha(0)
	end
end

function ModificationPreview(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "ModificationPreview"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "Darkener"

	var_17_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Darkener = var_17_4

	local var_17_5
	local var_17_6 = LUI.UIBlur.new()

	var_17_6.id = "Blur"

	var_17_6:SetRGBFromInt(10066329, 0)
	var_17_6:SetAlpha(0, 0)
	var_17_6:SetBlurStrength(5, 0)
	var_17_0:addElement(var_17_6)

	var_17_0.Blur = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIStyledText.new()

	var_17_8.id = "FlavorText"

	var_17_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_17_8:setText("", 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_17_8:SetAlignment(LUI.Alignment.Left)
	var_17_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_17_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_17_8:SetStartupDelay(2000)
	var_17_8:SetLineHoldTime(400)
	var_17_8:SetAnimMoveTime(2000)
	var_17_8:SetAnimMoveSpeed(150)
	var_17_8:SetEndDelay(2000)
	var_17_8:SetCrossfadeTime(250)
	var_17_8:SetFadeInTime(300)
	var_17_8:SetFadeOutTime(300)
	var_17_8:SetMaxVisibleLines(7)
	var_17_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 520, _1080p * 784, _1080p * 806)
	var_17_0:addElement(var_17_8)

	var_17_0.FlavorText = var_17_8

	local var_17_9
	local var_17_10 = LUI.UIText.new()

	var_17_10.id = "ItemType"

	var_17_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_17_10:SetAlpha(0, 0)
	var_17_10:setText("", 0)
	var_17_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_10:SetAlignment(LUI.Alignment.Left)
	var_17_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 600, _1080p * 723, _1080p * 753)
	var_17_0:addElement(var_17_10)

	var_17_0.ItemType = var_17_10

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "Continue"

	var_17_12.Text:SetLeft(_1080p * 20, 0)
	var_17_12.Text:setText(Engine.CBBHFCGDIC("CAS/CONTINUE"), 0)
	var_17_12.Text:SetAlignment(LUI.Alignment.Left)
	var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 520, _1080p * 753, _1080p * 791)
	var_17_0:addElement(var_17_12)

	var_17_0.Continue = var_17_12

	local var_17_13
	local var_17_14 = LUI.UIText.new()

	var_17_14.id = "SaveInfo"

	var_17_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_14:setText(Engine.CBBHFCGDIC("CAS/SAVED_TO_ARMORY"), 0)
	var_17_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_17_14:SetAlignment(LUI.Alignment.Left)
	var_17_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 600, _1080p * 720, _1080p * 742)
	var_17_0:addElement(var_17_14)

	var_17_0.SaveInfo = var_17_14

	local var_17_15
	local var_17_16 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_16.id = "Attachment1"

	var_17_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -865, _1080p * -581, _1080p * 170, _1080p * 234)
	var_17_0:addElement(var_17_16)

	var_17_0.Attachment1 = var_17_16

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "Attachment2"

	var_17_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -502, _1080p * -218, _1080p * 170, _1080p * 234)
	var_17_0:addElement(var_17_18)

	var_17_0.Attachment2 = var_17_18

	local var_17_19
	local var_17_20 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_20.id = "Attachment3"

	var_17_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -142, _1080p * 142, _1080p * 170, _1080p * 234)
	var_17_0:addElement(var_17_20)

	var_17_0.Attachment3 = var_17_20

	local var_17_21
	local var_17_22 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_22.id = "Attachment4"

	var_17_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 218, _1080p * 504, _1080p * 170, _1080p * 234)
	var_17_0:addElement(var_17_22)

	var_17_0.Attachment4 = var_17_22

	local var_17_23
	local var_17_24 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_24.id = "Attachment5"

	var_17_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 580, _1080p * 864, _1080p * 170, _1080p * 234)
	var_17_0:addElement(var_17_24)

	var_17_0.Attachment5 = var_17_24

	local var_17_25
	local var_17_26 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_26.id = "Attachment6"

	var_17_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -410, _1080p * -126, _1080p * 915, _1080p * 979)
	var_17_0:addElement(var_17_26)

	var_17_0.Attachment6 = var_17_26

	local var_17_27
	local var_17_28 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_28.id = "Attachment7"

	var_17_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -80, _1080p * 204, _1080p * 915, _1080p * 979)
	var_17_0:addElement(var_17_28)

	var_17_0.Attachment7 = var_17_28

	local var_17_29
	local var_17_30 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_30.id = "Attachment8"

	var_17_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 250, _1080p * 534, _1080p * 915, _1080p * 979)
	var_17_0:addElement(var_17_30)

	var_17_0.Attachment8 = var_17_30

	local var_17_31
	local var_17_32 = MenuBuilder.BuildRegisteredType("ModificationPreviewAttach", {
		controllerIndex = var_17_1
	})

	var_17_32.id = "Attachment9"

	var_17_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 580, _1080p * 864, _1080p * 915, _1080p * 979)
	var_17_0:addElement(var_17_32)

	var_17_0.Attachment9 = var_17_32

	local var_17_33
	local var_17_34 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_17_1
	})

	var_17_34.id = "WeaponAttributes"

	var_17_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 95, _1080p * 507, _1080p * -261, _1080p * -101)
	var_17_0:addElement(var_17_34)

	var_17_0.WeaponAttributes = var_17_34

	local var_17_35
	local var_17_36 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_17_1
	})

	var_17_36.id = "TabBacker"

	var_17_36:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_17_0:addElement(var_17_36)

	var_17_0.TabBacker = var_17_36

	local var_17_37
	local var_17_38 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_38.id = "MenuTitle"

	var_17_38.MenuTitle:setText("", 0)
	var_17_38.Line:SetLeft(0, 0)
	var_17_38:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_38)

	var_17_0.MenuTitle = var_17_38

	local var_17_39
	local var_17_40 = LUI.UIImage.new()

	var_17_40.id = "BlueprintIcon"

	var_17_40:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_17_40:SetAlpha(0, 0)
	var_17_40:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_17_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 422, _1080p * 466, _1080p * 668, _1080p * 712)
	var_17_0:addElement(var_17_40)

	var_17_0.BlueprintIcon = var_17_40

	local var_17_41
	local var_17_42 = LUI.UIStyledText.new()

	var_17_42.id = "QualityText"

	var_17_42:SetAlpha(0, 0)
	var_17_42:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE"), 0)
	var_17_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_42:SetAlignment(LUI.Alignment.Left)
	var_17_42:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 141, _1080p * 517, _1080p * 761, _1080p * 789)
	var_17_0:addElement(var_17_42)

	var_17_0.QualityText = var_17_42

	local var_17_43
	local var_17_44 = LUI.UIImage.new()

	var_17_44.id = "RarityIcon"

	var_17_44:SetAlpha(0, 0)
	var_17_44:setImage(RegisterMaterial("icon_rarity_4"), 0)
	var_17_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 128, _1080p * 759, _1080p * 791)
	var_17_0:addElement(var_17_44)

	var_17_0.RarityIcon = var_17_44

	local var_17_45
	local var_17_46 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_17_1
	})

	var_17_46.id = "LimitedTimeItem"

	var_17_46:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 396, _1080p * -460, _1080p * -430)
	var_17_0:addElement(var_17_46)

	var_17_0.LimitedTimeItem = var_17_46

	local var_17_47
	local var_17_48 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_17_49 = LUI.UIBorder.new(var_17_48)

	var_17_49.id = "CheckboxFrame"

	var_17_49:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_17_49:SetAlpha(0, 0)
	var_17_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_17_0:addElement(var_17_49)

	var_17_0.CheckboxFrame = var_17_49

	local var_17_50
	local var_17_51 = LUI.UIImage.new()

	var_17_51.id = "Checkbox"

	var_17_51:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_17_51:SetAlpha(0, 0)
	var_17_51:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_17_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_17_0:addElement(var_17_51)

	var_17_0.Checkbox = var_17_51

	local function var_17_52()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_52

	local var_17_53
	local var_17_54 = {
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_17_4:RegisterAnimationSequence("FadeIn", var_17_54)

	local var_17_55 = {
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_36:RegisterAnimationSequence("FadeIn", var_17_55)

	local function var_17_56()
		var_17_4:AnimateSequence("FadeIn")
		var_17_36:AnimateSequence("FadeIn")
	end

	var_17_0._sequences.FadeIn = var_17_56

	local var_17_57
	local var_17_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 841
		}
	}

	var_17_8:RegisterAnimationSequence("FromStore", var_17_58)

	local var_17_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("FromStore", var_17_59)

	local var_17_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_34:RegisterAnimationSequence("FromStore", var_17_60)

	local var_17_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_36:RegisterAnimationSequence("FromStore", var_17_61)

	local var_17_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 620
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 720
		}
	}

	var_17_38:RegisterAnimationSequence("FromStore", var_17_62)

	local var_17_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_40:RegisterAnimationSequence("FromStore", var_17_63)

	local var_17_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_42:RegisterAnimationSequence("FromStore", var_17_64)

	local var_17_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_44:RegisterAnimationSequence("FromStore", var_17_65)

	local function var_17_66()
		var_17_8:AnimateSequence("FromStore")
		var_17_10:AnimateSequence("FromStore")
		var_17_34:AnimateSequence("FromStore")
		var_17_36:AnimateSequence("FromStore")
		var_17_38:AnimateSequence("FromStore")
		var_17_40:AnimateSequence("FromStore")
		var_17_42:AnimateSequence("FromStore")
		var_17_44:AnimateSequence("FromStore")
	end

	var_17_0._sequences.FromStore = var_17_66

	local var_17_67
	local var_17_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 658
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 722
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_icon_weapon_glint")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_40:RegisterAnimationSequence("IsBase", var_17_68)

	local function var_17_69()
		var_17_40:AnimateSequence("IsBase")
	end

	var_17_0._sequences.IsBase = var_17_69

	local var_17_70
	local var_17_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 764
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 786
		}
	}

	var_17_8:RegisterAnimationSequence("CHT", var_17_71)

	local function var_17_72()
		var_17_8:AnimateSequence("CHT")
	end

	var_17_0._sequences.CHT = var_17_72

	var_0_10(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("ModificationPreview", ModificationPreview)
LockTable(_M)
