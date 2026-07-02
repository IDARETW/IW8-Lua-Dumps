module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.ArrowUp then
		arg_1_0.Attachments:AddArrow(arg_1_0.ArrowUp)
	end

	if arg_1_0.ArrowDown then
		arg_1_0.Attachments:AddArrow(arg_1_0.ArrowDown)
	end

	if arg_1_0.ListCount then
		arg_1_0.Attachments:AddItemNumbers(arg_1_0.ListCount)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = {
		weapon = arg_2_1,
		attachments = {}
	}

	var_2_0.attachments[1] = var_2_0.attachments[attachSlot] or {}
	var_2_0.attachments[1].ref = ATTACHMENT.GetBaseRef(arg_2_2)
	var_2_0.attachments[1].variantID = arg_2_3 or ATTACHMENT.baseVariant

	for iter_2_0 = 2, 5 do
		var_2_0.attachments[iter_2_0] = {}
		var_2_0.attachments[iter_2_0].ref = "none"
		var_2_0.attachments[iter_2_0].variantID = -1
	end

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local var_3_0 = LUI.DeepCopy(arg_3_0._weaponTable)

	if arg_3_2 then
		var_3_0.attachments[arg_3_2].ref = ATTACHMENT.none
		var_3_0.attachments[arg_3_2].variantID = ATTACHMENT.baseVariant
	end

	arg_3_1 = arg_3_1 or #var_3_0.attachments + 1

	if arg_3_3 then
		var_3_0.attachments[arg_3_1] = var_3_0.attachments[arg_3_1] or {}
		var_3_0.attachments[arg_3_1].ref = ATTACHMENT.GetBaseRef(arg_3_3)
		var_3_0.attachments[arg_3_1].variantID = arg_3_4 or ATTACHMENT.baseVariant
	end

	return var_3_0
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	if not Engine.DDJFBBJAIG() or not arg_4_0._weaponModel then
		return
	end

	WEAPON.LoadAndSetModel(arg_4_1, arg_4_0._weaponModel, arg_4_0._currentTable, {
		forceOffsetsAndRotations = true
	})
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	return function()
		if arg_5_2 ~= ATTACHMENT.perkCategory or not CSV.weaponOffsets.previewFile then
			local var_6_0 = CSV.weaponOffsets.attachmentFile
		end

		FrontEndScene.HideWeaponModels()

		arg_5_0._weaponModel = WEAPON.GetWeaponModel(arg_5_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.attachmentFile)

		arg_5_0:addElement(arg_5_0._weaponModel)

		if arg_5_0._focusedAttachmentData then
			local var_6_1 = arg_5_0._focusedAttachmentData.ref
		end

		var_0_3(arg_5_0, arg_5_1, arg_5_0._focusedAttachmentData)
	end
end

local function var_0_5(arg_7_0, arg_7_1)
	arg_7_0._weaponTable = WEAPON.GenerateWeaponTable(arg_7_0._weaponPlayerData)
	arg_7_0._equippedAttach = arg_7_0._weaponTable.attachments[arg_7_1] and arg_7_0._weaponTable.attachments[arg_7_1].ref
	arg_7_0._equippedVariant = arg_7_0._weaponTable.attachments[arg_7_1] and arg_7_0._weaponTable.attachments[arg_7_1].variantID

	arg_7_0.Attachments:RefreshContent()
	ATTACHMENT.SetupSlotDisplay(arg_7_0.DetailedEquippedSlots, {
		weaponTable = arg_7_0._weaponTable,
		currentCategory = arg_7_0._category
	})
	arg_7_0:processEvent({
		name = "update_showcase",
		attachmentData = Engine.DDJFBBJAIG() and arg_7_0.Attachments:GetVisibleChildInFocus().AttachmentButton:GetData() or arg_7_0.Attachments:GetVisibleChildInFocus():GetData()
	})
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.MenuTitle)
	assert(arg_8_0.MenuTitle.MenuTitle)
	assert(arg_8_0.DetailedEquippedSlots)
	assert(arg_8_0.GunsmithDetails)
	assert(arg_8_0.bindButton)

	if not Engine.DDJFBBJAIG() then
		assert(arg_8_0.AttachmentsInGame)

		arg_8_0.Attachments = arg_8_0.AttachmentsInGame
	else
		assert(arg_8_0.AttachmentsFrontend)

		arg_8_0.Attachments = arg_8_0.AttachmentsFrontend
	end

	var_0_0(arg_8_0, arg_8_1)
	ACTIONS.AnimateSequence(arg_8_0, CONDITIONS.IsSplitscreen() and "Splitscreen" or "Regular")

	if Engine.BHICADFIHA() then
		if not arg_8_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for AttachmentSelect menu. Only OK after a MyChanges.")

			arg_8_2.weaponSlot = 0
		end

		if not arg_8_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for AttachmentSelect menu. Only OK after a MyChanges.")

			arg_8_2.loadoutIndex = 0
		end

		if not arg_8_2.category then
			DebugPrint("WARNING: Missing \"category\" option for AttachmentSelect menu. Only OK after a MyChanges.")

			arg_8_2.category = "rail"
		end

		if not arg_8_2.attachments then
			DebugPrint("WARNING: Missing \"attachSlot\" option for AttachmentSelect menu. Only OK after a MyChanges.")

			arg_8_2.attachments = CSV.ReadRow(CSV.attachments, 3)
		end
	end

	assert(arg_8_2.weaponSlot)
	assert(arg_8_2.loadoutIndex)
	assert(arg_8_2.category)
	assert(arg_8_2.attachments)

	arg_8_0._category = arg_8_2.category

	local var_8_0 = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_8_2.category))

	arg_8_0.MenuTitle:SetTitle(var_8_0)

	local var_8_1 = PlayerData.BFFBGAJGD(arg_8_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_8_2.loadoutIndex]

	if CONDITIONS.IsWaveGameType() then
		var_8_1 = PlayerData.BFFBGAJGD(arg_8_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadoutWaveMode
	end

	arg_8_0._weaponPlayerData = var_8_1.weaponSetups[arg_8_2.weaponSlot]
	arg_8_0._weaponTable = WEAPON.GenerateWeaponTable(arg_8_0._weaponPlayerData)

	local var_8_2 = arg_8_0._weaponTable.weapon

	if PROGRESSION.ShouldUnlockAll() then
		arg_8_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_8_0.GunsmithWeaponLevel:Setup(arg_8_1, var_8_2)
	end

	if Engine.DDJFBBJAIG() and arg_8_2.category then
		local var_8_3 = GUNSMITH.GetAttachmentCategoryScene(var_8_2, arg_8_0._weaponTable.variantID, arg_8_2.category)

		if var_8_3 then
			Engine.DHFCHIIJCA(var_8_3)
		end
	end

	local var_8_4 = arg_8_2.attachSlot
	local var_8_5 = var_8_4 == nil
	local var_8_6 = ATTACHMENT.GetMaxAttachmentCount(var_8_2)

	for iter_8_0, iter_8_1 in ddlpairs(arg_8_0._weaponPlayerData.attachmentSetup) do
		if var_8_5 and iter_8_0 < var_8_6 and iter_8_1.attachment:get() == ATTACHMENT.none then
			var_8_4 = iter_8_0 + 1
		end
	end

	arg_8_0._equippedAttach = arg_8_0._weaponTable.attachments[var_8_4] and arg_8_0._weaponTable.attachments[var_8_4].ref
	arg_8_0._equippedVariant = arg_8_0._weaponTable.attachments[var_8_4] and arg_8_0._weaponTable.attachments[var_8_4].variantID

	ATTACHMENT.SetupSlotDisplay(arg_8_0.DetailedEquippedSlots, {
		weaponTable = arg_8_0._weaponTable,
		currentCategory = arg_8_0._category
	})

	local var_8_7 = 0

	for iter_8_2, iter_8_3 in ipairs(arg_8_2.attachments) do
		if arg_8_0._equippedAttach == iter_8_3.baseRef then
			var_8_7 = iter_8_2 - 1
		end
	end

	local function var_8_8()
		local var_9_0 = arg_8_2.attachments

		for iter_9_0 = 1, #var_9_0 do
			if #var_9_0[iter_9_0].variants > 1 then
				return true
			end
		end

		return false
	end

	local function var_8_9()
		if arg_8_0._category ~= "optic" then
			return
		end

		if not LOOT.IsT9Item({
			type = LOOT.itemTypes.WEAPON,
			ref = var_8_2
		}) then
			return
		end

		if arg_8_0._equippedAttach ~= "none" then
			return
		end

		local var_10_0 = WEAPON.GetEquippedReticle(arg_8_0._weaponPlayerData)

		if var_10_0 == "none" then
			return
		end

		WEAPON.SetEquippedReticle(arg_8_0._weaponPlayerData, var_10_0)
	end

	if Engine.DDJFBBJAIG() and var_8_8() and not Onboarding.GunsmithCustoms.WasCompleted(arg_8_0, arg_8_1) then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "onboardingpopup", true, arg_8_1, false, ONBOARDING_DATA.GetOnboardingGunsmithCustomsData())
		Onboarding.GunsmithCustoms.MarkCompleted(arg_8_0, arg_8_1)
	end

	local function var_8_10()
		local var_11_0 = {
			variants = arg_8_0._focusedAttachmentData.variants,
			weaponSlot = arg_8_2.weaponSlot,
			loadoutIndex = arg_8_2.loadoutIndex,
			attachSlot = var_8_4 and var_8_4 or arg_8_0._focusedAttachmentData.blockedCategorySlot,
			attachmentRef = arg_8_0._focusedAttachmentData.ref,
			blockedCategorySlot = arg_8_0._focusedAttachmentData.blockedCategorySlot,
			category = arg_8_2.category
		}

		LUI.FlowManager.RequestAddMenu("AttachmentAppearanceSelect", true, arg_8_1, false, var_11_0)
	end

	arg_8_0.Attachments:SetNumChildren(0)
	arg_8_0.Attachments:SetRefreshChild(function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_8_0.Attachments:GetContentIndex(arg_12_1, arg_12_2)
		local var_12_1 = arg_8_2.attachments[var_12_0 + 1]
		local var_12_2 = MLG.IsAttachmentRestricted(var_12_1.baseRef, var_8_2)

		arg_12_0:Setup(arg_8_1, var_12_1, var_12_1.baseRef == arg_8_0._equippedAttach, arg_8_0._weaponTable, var_12_2, var_8_4, arg_8_2)
		arg_12_0:SetupContextualMenu({
			title = Engine.CBBHFCGDIC(var_12_1.name)
		})

		local var_12_3 = {
			id = "chooseAppearance",
			actionName = Engine.CBBHFCGDIC("CAS/CHOOSE_APPEARANCE_NO_PROMPT"),
			conditionFunction = function()
				return GUNSMITH.IsGunsmithCustomsAvailable(arg_8_1, arg_8_0._focusedAttachmentData.unlocked, arg_8_0._focusedAttachmentData.variants, var_8_2, arg_8_2.category)
			end,
			actionFunction = function()
				var_8_10()
			end
		}

		arg_12_0:AddContextualMenuAction(var_12_3)
	end)
	arg_8_0.Attachments:SetNumChildren(#arg_8_2.attachments)
	arg_8_0.Attachments:SetDefaultFocus(arg_8_0.Attachments:GetPositionForIndex(var_8_7, {
		relativePosition = false
	}))
	arg_8_0.Attachments:RefreshContent()

	local var_8_11 = {}

	if arg_8_0._weaponTable.lootID ~= LOOT.emptyID then
		var_8_11 = WEAPON.GetModificationAttachments(arg_8_1, var_8_2, arg_8_0._weaponTable.lootID)
	end

	arg_8_0:registerEventHandler("update_showcase", function(arg_15_0, arg_15_1)
		local var_15_0 = #arg_15_1.attachmentData.variants > 1
		local var_15_1 = arg_15_1.attachmentData.baseRef == arg_15_0._equippedAttach
		local var_15_2 = arg_15_1.attachmentData.isClassified and ATTACHMENT.none or arg_15_1.attachmentData.ref
		local var_15_3 = arg_15_1.attachmentData.isClassified and ATTACHMENT.none or arg_15_1.attachmentData.baseRef
		local var_15_4 = ATTACHMENT.baseVariant

		if var_15_1 then
			var_15_4 = arg_15_0._equippedVariant
		elseif var_8_11[var_15_3] then
			var_15_4 = var_8_11[var_15_3]
		end

		local var_15_5 = var_15_1 and var_0_1(arg_15_0, arg_8_0._weaponTable.weapon, var_15_2, var_15_4) or {}

		arg_15_0._currentTable = var_0_2(arg_15_0, var_8_4, arg_15_1.attachmentData.blockedCategorySlot, var_15_2, var_15_4)

		arg_8_0.GunsmithDetails:Setup(arg_8_1, arg_15_1.attachmentData, var_15_1, arg_15_0._weaponTable, var_15_1 and var_15_5 or arg_15_0._currentTable, var_15_0, arg_15_1.attachmentData.blockedCategorySlot, var_15_4)

		arg_15_0._focusedAttachmentData = arg_15_1.attachmentData

		var_0_3(arg_15_0, arg_8_1, arg_15_1.attachmentData.ref)

		if var_15_1 then
			arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				priority = 2,
				replaceTop = true,
				button_ref = "button_primary",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
			})
		else
			arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				priority = 2,
				replaceTop = true,
				button_ref = "button_primary",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		end

		if CONDITIONS.IsWaveGameType() then
			local var_15_6 = tonumber(arg_15_1.attachmentData.survivalCost)
			local var_15_7 = CP.CurrencyGet(arg_8_1)

			arg_8_0.PurchaseWidget.CostValue:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/COST_SURVIVAL", tostring(var_15_6)))

			if var_15_6 <= var_15_7 then
				ACTIONS.AnimateSequence(arg_8_0.PurchaseWidget, "CanBuy")
			else
				ACTIONS.AnimateSequence(arg_8_0.PurchaseWidget, "NoBuy")
			end

			arg_8_0:registerOmnvarHandler("cp_open_cac", function(arg_16_0, arg_16_1)
				if arg_16_1.value == -2 and CONDITIONS.IsWaveGameType() then
					LUI.FlowManager.RequestCloseAllMenus()
				end
			end)
		end

		return true
	end)

	if LUI.IsLastInputMouseNavigation(arg_8_1) then
		arg_8_0:addEventHandler("menu_create", function(arg_17_0, arg_17_1)
			local var_17_0 = arg_8_2.attachments[var_8_7 + 1]
			local var_17_1 = {
				name = "update_showcase",
				attachmentData = var_17_0
			}

			arg_17_0:processEvent(var_17_1)
		end)
	end

	arg_8_0:registerEventHandler("equip_attachment", function(arg_18_0, arg_18_1)
		if CONDITIONS.IsWaveGameType() then
			local var_18_0 = CP.CurrencyGet(arg_8_1)
			local var_18_1 = tonumber(arg_18_1.attachmentData.survivalCost)

			if arg_18_1.attachmentData.baseRef == arg_18_0._equippedAttach then
				Engine.BJDBIAGIDA("ui_select_purchase_deny")
			elseif var_18_1 <= var_18_0 then
				if var_8_4 ~= nil then
					local var_18_2 = var_18_0 - var_18_1

					Engine.BJDBIAGIDA("ui_select_purchase_confirm")
					CP.CurrencySubtract(arg_8_1, var_18_1)
					Engine.EBHIFJCGBH("attachment_purchased", var_18_1)
				end
			else
				Engine.BJDBIAGIDA("ui_select_purchase_deny")
			end
		end

		DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_18_0, arg_8_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)

		local var_18_3 = GUNSMITH.EquipAttachment(arg_18_0, arg_8_1, arg_18_1.attachmentData.baseRef, arg_18_0._weaponPlayerData, {
			menusToLeave = {
				"AttachmentSelect"
			},
			attachSlot = var_8_4 and var_8_4 or arg_18_1.attachmentData.blockedCategorySlot,
			isNewAttachment = arg_18_1.attachmentData.baseRef ~= arg_18_0._equippedAttach,
			survivalCost = arg_18_1.attachmentData.survivalCost
		})

		if CONDITIONS.InGame() then
			Engine.EBHIFJCGBH("equip_item_ingame", 1)
		end

		DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_18_0, arg_8_1, DYN_ATTACHMENT.StreamedImageAction.ADD)

		if not var_18_3 then
			var_0_5(arg_18_0, var_8_4)
		end

		return true
	end)

	if Engine.DDJFBBJAIG() then
		ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)

		arg_8_0._currentTable = var_0_2(arg_8_0, var_8_4)

		MenuUtils.SetupSceneChangeCallback(arg_8_0, var_0_4(arg_8_0, arg_8_1, var_8_4, arg_8_2.category))
		arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
		})
		arg_8_0.bindButton:addEventHandler("button_right_stick", function(arg_19_0, arg_19_1)
			arg_8_2.weaponTable = arg_8_0._currentTable

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_8_1, false, arg_8_2, true)

			if arg_19_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		end)
	end

	if CONDITIONS.InGame() and not CONDITIONS.IsThirdGameMode() then
		arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			ignoreTooltip = false,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_8_0.bindButton:addEventHandler("button_start", function(arg_20_0, arg_20_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	if CONDITIONS.UsingWZLoadouts() then
		arg_8_0.bindButton:addEventHandler("button_secondary", function(arg_21_0, arg_21_1)
			var_8_9()
		end)
		arg_8_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			useGunsmithSetup = true,
			weaponRef = var_8_2
		})
	end

	if arg_8_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_8_0.InGameMenuBackground)
	end

	ACTIONS.ScaleFullscreen(arg_8_0.Vignette)

	if arg_8_0.Gradient then
		ACTIONS.ScaleFullscreen(arg_8_0.Gradient)
	end
end

function AttachmentSelect(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIElement.new()

	var_22_0.id = "AttachmentSelect"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	var_22_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_22_1
	})
	var_22_0.HelperBar.id = "HelperBar"

	var_22_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_22_0.HelperBar:setPriority(10)
	var_22_0:addElement(var_22_0.HelperBar)

	local var_22_2 = var_22_0
	local var_22_3

	if CONDITIONS.InGame(var_22_0) then
		local var_22_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_22_1
		})

		var_22_4.id = "InGameMenuBackground"

		var_22_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_22_0:addElement(var_22_4)

		var_22_0.InGameMenuBackground = var_22_4
	end

	local var_22_5

	if CONDITIONS.UsingWZLoadouts() then
		local var_22_6 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_22_1
		})

		var_22_6.id = "WZWipSnipeBackgroundSceneOverlay"

		var_22_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_22_0:addElement(var_22_6)

		var_22_0.WZWipSnipeBackgroundSceneOverlay = var_22_6
	end

	local var_22_7
	local var_22_8 = LUI.UIImage.new()

	var_22_8.id = "Vignette"

	var_22_8:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_22_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 770, 0, _1080p * 433)
	var_22_0:addElement(var_22_8)

	var_22_0.Vignette = var_22_8

	local var_22_9

	if Engine.DDJFBBJAIG() then
		local var_22_10 = LUI.UIImage.new()

		var_22_10.id = "Gradient"

		var_22_10:SetRGBFromInt(0, 0)
		var_22_10:SetAlpha(0.5, 0)
		var_22_10:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
		var_22_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -865, 0, 0)
		var_22_0:addElement(var_22_10)

		var_22_0.Gradient = var_22_10
	end

	local var_22_11
	local var_22_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_22_1
	})

	var_22_12.id = "MenuTitle"

	var_22_12.MenuTitle:setText("", 0)
	var_22_12.Line:SetLeft(0, 0)
	var_22_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_22_0:addElement(var_22_12)

	var_22_0.MenuTitle = var_22_12

	local var_22_13

	if Engine.DDJFBBJAIG() then
		local var_22_14 = {
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
			controllerIndex = var_22_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("AttachmentButtonGroup", {
					controllerIndex = var_22_1
				})
			end,
			refreshChild = function(arg_24_0, arg_24_1, arg_24_2)
				return
			end,
			spacingX = _1080p * 4,
			spacingY = _1080p * 4,
			columnWidth = _1080p * 420,
			rowHeight = _1080p * 62,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_22_13 = LUI.UIGrid.new(var_22_14)
		var_22_13.id = "AttachmentsFrontend"

		var_22_13:setUseStencil(true)
		var_22_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 117, _1080p * 609, _1080p * 178, _1080p * 834)
		var_22_0:addElement(var_22_13)

		var_22_0.AttachmentsFrontend = var_22_13
	end

	local var_22_15

	if not Engine.DDJFBBJAIG() then
		local var_22_16 = {
			scrollingThresholdX = 1,
			buildArrowsLabel = false,
			maxVelocity = 5000,
			adjustSizeToContent = true,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleColumns = 1,
			wrapY = true,
			arrowsVerticalOffset = 0,
			forcePrimaryAxisScrolling = true,
			springCoefficient = 400,
			maxVisibleRows = SubtractForSplitscreen(10, 5),
			controllerIndex = var_22_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("AttachmentButton", {
					controllerIndex = var_22_1
				})
			end,
			refreshChild = function(arg_26_0, arg_26_1, arg_26_2)
				return
			end,
			spacingX = _1080p * 4,
			spacingY = _1080p * 4,
			columnWidth = _1080p * 420,
			rowHeight = _1080p * 62,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_22_15 = LUI.UIGrid.new(var_22_16)
		var_22_15.id = "AttachmentsInGame"

		var_22_15:setUseStencil(true)
		var_22_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 117, _1080p * 537, _1080p * 178, _1080p * 964)
		var_22_0:addElement(var_22_15)

		var_22_0.AttachmentsInGame = var_22_15
	end

	local var_22_17
	local var_22_18 = MenuBuilder.BuildRegisteredType("GunsmithDetails", {
		controllerIndex = var_22_1
	})

	var_22_18.id = "GunsmithDetails"

	var_22_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1010, _1080p * 178, _1080p * 828)
	var_22_0:addElement(var_22_18)

	var_22_0.GunsmithDetails = var_22_18

	local var_22_19
	local var_22_20 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_22_1
	})

	var_22_20.id = "VerticalScrollbar"

	var_22_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 108, _1080p * 178, _1080p * 834)
	var_22_0:addElement(var_22_20)

	var_22_0.VerticalScrollbar = var_22_20

	local var_22_21
	local var_22_22 = MenuBuilder.BuildRegisteredType("GunsmithDetailedEquippedSlots", {
		controllerIndex = var_22_1
	})

	var_22_22.id = "DetailedEquippedSlots"

	var_22_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 462, _1080p * 121, _1080p * 153)
	var_22_0:addElement(var_22_22)

	var_22_0.DetailedEquippedSlots = var_22_22

	local var_22_23

	if CONDITIONS.InFrontend(var_22_0) then
		local var_22_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_22_1
		})

		var_22_24.id = "LobbyMembersFooter"

		var_22_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_22_0:addElement(var_22_24)

		var_22_0.LobbyMembersFooter = var_22_24
	end

	local var_22_25

	if CONDITIONS.InGame(var_22_0) then
		local var_22_26 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_22_1
		})

		var_22_26.id = "InGameMenuTimerStatus"

		var_22_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_22_0:addElement(var_22_26)

		var_22_0.InGameMenuTimerStatus = var_22_26
	end

	local var_22_27
	local var_22_28 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_22_1
	})

	var_22_28.id = "GunsmithWeaponLevel"

	var_22_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_22_0:addElement(var_22_28)

	var_22_0.GunsmithWeaponLevel = var_22_28

	local var_22_29
	local var_22_30 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_22_1
	})

	var_22_30.id = "ArrowUp"

	var_22_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -750, _1080p * -718, _1080p * 533, _1080p * 565)
	var_22_0:addElement(var_22_30)

	var_22_0.ArrowUp = var_22_30

	local var_22_31
	local var_22_32 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_22_1
	})

	var_22_32.id = "ArrowDown"

	var_22_32.Arrow:SetZRotation(180, 0)
	var_22_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -582, _1080p * -550, _1080p * 533, _1080p * 565)
	var_22_0:addElement(var_22_32)

	var_22_0.ArrowDown = var_22_32

	local var_22_33
	local var_22_34 = LUI.UIText.new()

	var_22_34.id = "ListCount"

	var_22_34:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_22_34:setText("", 0)
	var_22_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_34:SetAlignment(LUI.Alignment.Center)
	var_22_34:SetVerticalAlignment(LUI.Alignment.Center)
	var_22_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -718, _1080p * -582, _1080p * 540, _1080p * 560)
	var_22_0:addElement(var_22_34)

	var_22_0.ListCount = var_22_34

	local var_22_35

	if CONDITIONS.IsWaveGameType(var_22_0) then
		local var_22_36 = MenuBuilder.BuildRegisteredType("WaveTimer", {
			controllerIndex = var_22_1
		})

		var_22_36.id = "WaveTimer"

		var_22_36.ReinforcementsText:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/RESPAWN_COUNTDOWN"), 0)
		var_22_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1385, _1080p * 1670, _1080p * 240, _1080p * 374)
		var_22_0:addElement(var_22_36)

		var_22_0.WaveTimer = var_22_36
	end

	local var_22_37

	if CONDITIONS.IsWaveGameType(var_22_0) then
		var_22_37 = MenuBuilder.BuildRegisteredType("PurchaseWidget", {
			controllerIndex = var_22_1
		})
		var_22_37.id = "PurchaseWidget"

		var_22_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 913, _1080p * 786, _1080p * 930)
		var_22_0:addElement(var_22_37)

		var_22_0.PurchaseWidget = var_22_37
	end

	local var_22_38

	if Engine.DDJFBBJAIG() then
		local var_22_39 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_22_1
		})

		var_22_39.id = "CDLRestrictionTag"

		var_22_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_22_0:addElement(var_22_39)

		var_22_0.CDLRestrictionTag = var_22_39
	end

	local function var_22_40()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_40

	local function var_22_41()
		return
	end

	var_22_0._sequences.Blueprint = var_22_41

	local var_22_42
	local var_22_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 597
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1020
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 828
		}
	}

	var_22_18:RegisterAnimationSequence("Splitscreen", var_22_43)

	local var_22_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 503
		}
	}

	var_22_20:RegisterAnimationSequence("Splitscreen", var_22_44)

	local var_22_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 533
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -750
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -718
		}
	}

	var_22_30:RegisterAnimationSequence("Splitscreen", var_22_45)

	local var_22_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 533
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -582
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -550
		}
	}

	var_22_32:RegisterAnimationSequence("Splitscreen", var_22_46)

	local var_22_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -718
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -582
		}
	}

	var_22_34:RegisterAnimationSequence("Splitscreen", var_22_47)

	if CONDITIONS.IsWaveGameType(var_22_0) then
		local var_22_48 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1359
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 374
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1712
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 518
			}
		}

		var_22_37:RegisterAnimationSequence("Splitscreen", var_22_48)
	end

	local function var_22_49()
		var_22_18:AnimateSequence("Splitscreen")
		var_22_20:AnimateSequence("Splitscreen")
		var_22_30:AnimateSequence("Splitscreen")
		var_22_32:AnimateSequence("Splitscreen")
		var_22_34:AnimateSequence("Splitscreen")

		if CONDITIONS.IsWaveGameType(var_22_0) then
			var_22_37:AnimateSequence("Splitscreen")
		end
	end

	var_22_0._sequences.Splitscreen = var_22_49

	local var_22_50
	local var_22_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 834
		}
	}

	var_22_20:RegisterAnimationSequence("Regular", var_22_51)

	local var_22_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 848
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 880
		}
	}

	var_22_30:RegisterAnimationSequence("Regular", var_22_52)

	local var_22_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 848
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 880
		}
	}

	var_22_32:RegisterAnimationSequence("Regular", var_22_53)

	local var_22_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 855
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 875
		}
	}

	var_22_34:RegisterAnimationSequence("Regular", var_22_54)

	local function var_22_55()
		var_22_20:AnimateSequence("Regular")
		var_22_30:AnimateSequence("Regular")
		var_22_32:AnimateSequence("Regular")
		var_22_34:AnimateSequence("Regular")
	end

	var_22_0._sequences.Regular = var_22_55

	local var_22_56
	local var_22_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 632
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1082
		}
	}

	var_22_18:RegisterAnimationSequence("Frontend", var_22_57)

	local function var_22_58()
		var_22_18:AnimateSequence("Frontend")
	end

	var_22_0._sequences.Frontend = var_22_58

	local var_22_59
	local var_22_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1010
		}
	}

	var_22_18:RegisterAnimationSequence("InGame", var_22_60)

	local function var_22_61()
		var_22_18:AnimateSequence("InGame")
	end

	var_22_0._sequences.InGame = var_22_61

	if Engine.DDJFBBJAIG() then
		local var_22_62 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_22_20,
			startCap = var_22_20.startCap,
			endCap = var_22_20.endCap,
			sliderArea = var_22_20.sliderArea,
			slider = var_22_20.sliderArea and var_22_20.sliderArea.slider,
			fixedSizeSlider = var_22_20.sliderArea and var_22_20.sliderArea.fixedSizeSlider
		})

		var_22_13:AddScrollbar(var_22_62)
	end

	if not Engine.DDJFBBJAIG() then
		local var_22_63 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_22_20,
			startCap = var_22_20.startCap,
			endCap = var_22_20.endCap,
			sliderArea = var_22_20.sliderArea,
			slider = var_22_20.sliderArea and var_22_20.sliderArea.slider,
			fixedSizeSlider = var_22_20.sliderArea and var_22_20.sliderArea.fixedSizeSlider
		})

		var_22_15:AddScrollbar(var_22_63)
	end

	var_22_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_22_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
	})

	local var_22_64 = LUI.UIBindButton.new()

	var_22_64.id = "selfBindButton"

	var_22_0:addElement(var_22_64)

	var_22_0.bindButton = var_22_64

	var_22_0.bindButton:addEventHandler("button_secondary", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_22_1
		end

		ACTIONS.LeaveMenu(var_22_0)
	end)
	var_0_6(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("AttachmentSelect", AttachmentSelect)
LockTable(_M)
