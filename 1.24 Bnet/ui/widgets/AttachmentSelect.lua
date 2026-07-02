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

		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.Preview
		})

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
	arg_7_0.DetailedEquippedSlots:Setup(arg_7_0._weaponTable, arg_7_0._category)
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
	local var_8_3, var_8_4 = GUNSMITH.GetAttachmentsAndBucketItems(arg_8_1, var_8_2)

	if PROGRESSION.ShouldUnlockAll() then
		arg_8_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_8_0.GunsmithWeaponLevel:Setup(arg_8_1, var_8_2)
	end

	if Engine.DDJFBBJAIG() and arg_8_2.category then
		local var_8_5 = GUNSMITH.GetAttachmentCategoryScene(var_8_2, arg_8_0._weaponTable.variantID, arg_8_2.category)

		if var_8_5 then
			Engine.DHFCHIIJCA(var_8_5)
		end
	end

	local var_8_6 = arg_8_2.attachSlot
	local var_8_7 = var_8_6 == nil
	local var_8_8 = 0

	for iter_8_0, iter_8_1 in ddlpairs(arg_8_0._weaponPlayerData.attachmentSetup) do
		if var_8_7 and iter_8_0 < ATTACHMENT.count and iter_8_1.attachment:get() == ATTACHMENT.none then
			var_8_6 = iter_8_0 + 1
		end
	end

	arg_8_0._equippedAttach = arg_8_0._weaponTable.attachments[var_8_6] and arg_8_0._weaponTable.attachments[var_8_6].ref
	arg_8_0._equippedVariant = arg_8_0._weaponTable.attachments[var_8_6] and arg_8_0._weaponTable.attachments[var_8_6].variantID

	arg_8_0.DetailedEquippedSlots:Setup(arg_8_0._weaponTable, arg_8_2.category)

	local var_8_9 = 0

	for iter_8_2, iter_8_3 in ipairs(arg_8_2.attachments) do
		if arg_8_0._equippedAttach == iter_8_3.baseRef then
			var_8_9 = iter_8_2 - 1
		end
	end

	local function var_8_10()
		local var_9_0 = arg_8_2.attachments

		for iter_9_0 = 1, #var_9_0 do
			if #var_9_0[iter_9_0].variants > 1 then
				return true
			end
		end

		return false
	end

	if Engine.DDJFBBJAIG() and var_8_10() and not Onboarding.GunsmithCustoms.WasCompleted(arg_8_0, arg_8_1) then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "onboardingpopup", true, arg_8_1, false, ONBOARDING_DATA.GetOnboardingGunsmithCustomsData())
		Onboarding.GunsmithCustoms.MarkCompleted(arg_8_0, arg_8_1)
	end

	local function var_8_11()
		local var_10_0 = {
			variants = arg_8_0._focusedAttachmentData.variants,
			weaponSlot = arg_8_2.weaponSlot,
			loadoutIndex = arg_8_2.loadoutIndex,
			attachSlot = var_8_6 and var_8_6 or arg_8_0._focusedAttachmentData.blockedCategorySlot,
			attachmentRef = arg_8_0._focusedAttachmentData.ref,
			blockedCategorySlot = arg_8_0._focusedAttachmentData.blockedCategorySlot,
			category = arg_8_2.category
		}

		LUI.FlowManager.RequestAddMenu("AttachmentAppearanceSelect", true, arg_8_1, false, var_10_0)
	end

	arg_8_0.Attachments:SetNumChildren(0)
	arg_8_0.Attachments:SetRefreshChild(function(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = arg_8_0.Attachments:GetContentIndex(arg_11_1, arg_11_2)
		local var_11_1 = arg_8_2.attachments[var_11_0 + 1]
		local var_11_2 = MatchRules.EBCADBGDHB(var_11_1.baseRef, var_8_2)

		arg_11_0:Setup(arg_8_1, var_11_1, var_11_1.baseRef == arg_8_0._equippedAttach, arg_8_0._weaponTable, var_11_2, var_8_6, arg_8_2)
		arg_11_0:SetupContextualMenu({
			title = Engine.CBBHFCGDIC(var_11_1.name)
		})

		local var_11_3 = {
			id = "chooseAppearance",
			actionName = Engine.CBBHFCGDIC("CAS/CHOOSE_APPEARANCE_NO_PROMPT"),
			conditionFunction = function()
				return GUNSMITH.IsGunsmithCustomsAvailable(arg_8_1, arg_8_0._focusedAttachmentData.unlocked, arg_8_0._focusedAttachmentData.variants, var_8_2, arg_8_2.category)
			end,
			actionFunction = function()
				var_8_11()
			end
		}

		arg_11_0:AddContextualMenuAction(var_11_3)
	end)
	arg_8_0.Attachments:SetNumChildren(#arg_8_2.attachments)
	arg_8_0.Attachments:SetDefaultFocus(arg_8_0.Attachments:GetPositionForIndex(var_8_9, {
		relativePosition = false
	}))
	arg_8_0.Attachments:RefreshContent()

	local var_8_12 = {}

	if arg_8_0._weaponTable.lootID ~= LOOT.emptyID then
		var_8_12 = WEAPON.GetModificationAttachments(arg_8_1, var_8_2, arg_8_0._weaponTable.lootID)
	end

	arg_8_0:registerEventHandler("update_showcase", function(arg_14_0, arg_14_1)
		local var_14_0 = #arg_14_1.attachmentData.variants > 1
		local var_14_1 = arg_14_1.attachmentData.baseRef == arg_14_0._equippedAttach
		local var_14_2 = arg_14_1.attachmentData.isClassified and ATTACHMENT.none or arg_14_1.attachmentData.ref
		local var_14_3 = arg_14_1.attachmentData.isClassified and ATTACHMENT.none or arg_14_1.attachmentData.baseRef
		local var_14_4 = ATTACHMENT.baseVariant

		if var_14_1 then
			var_14_4 = arg_14_0._equippedVariant
		elseif var_8_12[var_14_3] then
			var_14_4 = var_8_12[var_14_3]
		end

		local var_14_5 = var_14_1 and var_0_1(arg_14_0, arg_8_0._weaponTable.weapon, var_14_2, var_14_4) or {}

		arg_14_0._currentTable = var_0_2(arg_14_0, var_8_6, arg_14_1.attachmentData.blockedCategorySlot, var_14_2, var_14_4)

		arg_8_0.GunsmithDetails:Setup(arg_8_1, arg_14_1.attachmentData, var_14_1, arg_14_0._weaponTable, var_14_1 and var_14_5 or arg_14_0._currentTable, var_14_0, arg_14_1.attachmentData.blockedCategorySlot, var_14_4)

		arg_14_0._focusedAttachmentData = arg_14_1.attachmentData

		var_0_3(arg_14_0, arg_8_1, arg_14_1.attachmentData.ref)

		if var_14_1 then
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
			local var_14_6 = tonumber(arg_14_1.attachmentData.survivalCost)
			local var_14_7 = CP.CurrencyGet(arg_8_1)

			arg_8_0.PurchaseWidget.CostValue:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/COST_SURVIVAL", tostring(var_14_6)))

			if var_14_6 <= var_14_7 then
				ACTIONS.AnimateSequence(arg_8_0.PurchaseWidget, "CanBuy")
			else
				ACTIONS.AnimateSequence(arg_8_0.PurchaseWidget, "NoBuy")
			end

			arg_8_0:registerOmnvarHandler("cp_open_cac", function(arg_15_0, arg_15_1)
				if arg_15_1.value == -2 and CONDITIONS.IsWaveGameType() then
					LUI.FlowManager.RequestCloseAllMenus()
				end
			end)
		end

		return true
	end)

	if LUI.IsLastInputMouseNavigation(arg_8_1) then
		arg_8_0:addEventHandler("menu_create", function(arg_16_0, arg_16_1)
			local var_16_0 = arg_8_2.attachments[var_8_9 + 1]
			local var_16_1 = {
				name = "update_showcase",
				attachmentData = var_16_0
			}

			arg_16_0:processEvent(var_16_1)
		end)
	end

	arg_8_0:registerEventHandler("equip_attachment", function(arg_17_0, arg_17_1)
		if CONDITIONS.IsWaveGameType() then
			local var_17_0 = CP.CurrencyGet(arg_8_1)
			local var_17_1 = tonumber(arg_17_1.attachmentData.survivalCost)

			if arg_17_1.attachmentData.baseRef == arg_17_0._equippedAttach then
				Engine.BJDBIAGIDA("ui_select_purchase_deny")
			elseif var_17_1 <= var_17_0 then
				if var_8_6 ~= nil then
					local var_17_2 = var_17_0 - var_17_1

					Engine.BJDBIAGIDA("ui_select_purchase_confirm")
					CP.CurrencySubtract(arg_8_1, var_17_1)
					Engine.EBHIFJCGBH("attachment_purchased", var_17_1)
				end
			else
				Engine.BJDBIAGIDA("ui_select_purchase_deny")
			end
		end

		DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_17_0, arg_8_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)

		local var_17_3 = GUNSMITH.EquipAttachment(arg_17_0, arg_8_1, arg_17_1.attachmentData.baseRef, arg_17_0._weaponPlayerData, {
			menusToLeave = {
				"AttachmentSelect"
			},
			attachSlot = var_8_6 and var_8_6 or arg_17_1.attachmentData.blockedCategorySlot,
			isNewAttachment = arg_17_1.attachmentData.baseRef ~= arg_17_0._equippedAttach,
			survivalCost = arg_17_1.attachmentData.survivalCost
		})

		if CONDITIONS.InGame() then
			Engine.EBHIFJCGBH("equip_item_ingame", 1)
		end

		DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_17_0, arg_8_1, DYN_ATTACHMENT.StreamedImageAction.ADD)

		if not var_17_3 then
			var_0_5(arg_17_0, var_8_6)
		end

		return true
	end)

	if Engine.DDJFBBJAIG() then
		ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)

		arg_8_0._currentTable = var_0_2(arg_8_0, var_8_6)

		MenuUtils.SetupSceneChangeCallback(arg_8_0, var_0_4(arg_8_0, arg_8_1, var_8_6, arg_8_2.category))
		arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
		})
		arg_8_0.bindButton:addEventHandler("button_right_stick", function(arg_18_0, arg_18_1)
			arg_8_2.weaponTable = arg_8_0._currentTable

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_8_1, false, arg_8_2, true)

			if arg_18_1.qualifier then
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
		arg_8_0.bindButton:addEventHandler("button_start", function(arg_19_0, arg_19_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	if arg_8_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_8_0.InGameMenuBackground)
	end

	ACTIONS.ScaleFullscreen(arg_8_0.Vignette)

	if arg_8_0.Gradient then
		ACTIONS.ScaleFullscreen(arg_8_0.Gradient)
	end
end

function AttachmentSelect(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0.id = "AttachmentSelect"
	var_20_0._animationSets = var_20_0._animationSets or {}
	var_20_0._sequences = var_20_0._sequences or {}

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	var_20_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_20_1
	})
	var_20_0.HelperBar.id = "HelperBar"

	var_20_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_20_0.HelperBar:setPriority(10)
	var_20_0:addElement(var_20_0.HelperBar)

	local var_20_2 = var_20_0
	local var_20_3

	if CONDITIONS.InGame(var_20_0) then
		local var_20_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_20_1
		})

		var_20_4.id = "InGameMenuBackground"

		var_20_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_20_0:addElement(var_20_4)

		var_20_0.InGameMenuBackground = var_20_4
	end

	local var_20_5
	local var_20_6 = LUI.UIImage.new()

	var_20_6.id = "Vignette"

	var_20_6:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_20_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 770, 0, _1080p * 433)
	var_20_0:addElement(var_20_6)

	var_20_0.Vignette = var_20_6

	local var_20_7

	if Engine.DDJFBBJAIG() then
		local var_20_8 = LUI.UIImage.new()

		var_20_8.id = "Gradient"

		var_20_8:SetRGBFromInt(0, 0)
		var_20_8:SetAlpha(0.5, 0)
		var_20_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
		var_20_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -865, 0, 0)
		var_20_0:addElement(var_20_8)

		var_20_0.Gradient = var_20_8
	end

	local var_20_9
	local var_20_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_20_1
	})

	var_20_10.id = "MenuTitle"

	var_20_10.MenuTitle:setText("", 0)
	var_20_10.Line:SetLeft(0, 0)
	var_20_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_20_0:addElement(var_20_10)

	var_20_0.MenuTitle = var_20_10

	local var_20_11

	if Engine.DDJFBBJAIG() then
		local var_20_12 = {
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
			controllerIndex = var_20_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("AttachmentButtonGroup", {
					controllerIndex = var_20_1
				})
			end,
			refreshChild = function(arg_22_0, arg_22_1, arg_22_2)
				return
			end,
			spacingX = _1080p * 4,
			spacingY = _1080p * 4,
			columnWidth = _1080p * 420,
			rowHeight = _1080p * 62,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_20_11 = LUI.UIGrid.new(var_20_12)
		var_20_11.id = "AttachmentsFrontend"

		var_20_11:setUseStencil(true)
		var_20_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 117, _1080p * 609, _1080p * 178, _1080p * 834)
		var_20_0:addElement(var_20_11)

		var_20_0.AttachmentsFrontend = var_20_11
	end

	local var_20_13

	if not Engine.DDJFBBJAIG() then
		local var_20_14 = {
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
			controllerIndex = var_20_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("AttachmentButton", {
					controllerIndex = var_20_1
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

		var_20_13 = LUI.UIGrid.new(var_20_14)
		var_20_13.id = "AttachmentsInGame"

		var_20_13:setUseStencil(true)
		var_20_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 117, _1080p * 537, _1080p * 178, _1080p * 964)
		var_20_0:addElement(var_20_13)

		var_20_0.AttachmentsInGame = var_20_13
	end

	local var_20_15
	local var_20_16 = MenuBuilder.BuildRegisteredType("GunsmithDetails", {
		controllerIndex = var_20_1
	})

	var_20_16.id = "GunsmithDetails"

	var_20_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1010, _1080p * 178, _1080p * 828)
	var_20_0:addElement(var_20_16)

	var_20_0.GunsmithDetails = var_20_16

	local var_20_17
	local var_20_18 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_20_1
	})

	var_20_18.id = "VerticalScrollbar"

	var_20_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 108, _1080p * 178, _1080p * 834)
	var_20_0:addElement(var_20_18)

	var_20_0.VerticalScrollbar = var_20_18

	local var_20_19
	local var_20_20 = MenuBuilder.BuildRegisteredType("GunsmithDetailedEquippedSlots", {
		controllerIndex = var_20_1
	})

	var_20_20.id = "DetailedEquippedSlots"

	var_20_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 462, _1080p * 121, _1080p * 153)
	var_20_0:addElement(var_20_20)

	var_20_0.DetailedEquippedSlots = var_20_20

	local var_20_21

	if CONDITIONS.InFrontend(var_20_0) then
		local var_20_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_20_1
		})

		var_20_22.id = "LobbyMembersFooter"

		var_20_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_20_0:addElement(var_20_22)

		var_20_0.LobbyMembersFooter = var_20_22
	end

	local var_20_23

	if CONDITIONS.InGame(var_20_0) then
		local var_20_24 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_20_1
		})

		var_20_24.id = "InGameMenuTimerStatus"

		var_20_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_20_0:addElement(var_20_24)

		var_20_0.InGameMenuTimerStatus = var_20_24
	end

	local var_20_25
	local var_20_26 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_20_1
	})

	var_20_26.id = "GunsmithWeaponLevel"

	var_20_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_20_0:addElement(var_20_26)

	var_20_0.GunsmithWeaponLevel = var_20_26

	local var_20_27
	local var_20_28 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_20_1
	})

	var_20_28.id = "ArrowUp"

	var_20_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -750, _1080p * -718, _1080p * 533, _1080p * 565)
	var_20_0:addElement(var_20_28)

	var_20_0.ArrowUp = var_20_28

	local var_20_29
	local var_20_30 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_20_1
	})

	var_20_30.id = "ArrowDown"

	var_20_30.Arrow:SetZRotation(180, 0)
	var_20_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -582, _1080p * -550, _1080p * 533, _1080p * 565)
	var_20_0:addElement(var_20_30)

	var_20_0.ArrowDown = var_20_30

	local var_20_31
	local var_20_32 = LUI.UIText.new()

	var_20_32.id = "ListCount"

	var_20_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_20_32:setText("", 0)
	var_20_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_32:SetAlignment(LUI.Alignment.Center)
	var_20_32:SetVerticalAlignment(LUI.Alignment.Center)
	var_20_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -718, _1080p * -582, _1080p * 540, _1080p * 560)
	var_20_0:addElement(var_20_32)

	var_20_0.ListCount = var_20_32

	local var_20_33

	if CONDITIONS.IsWaveGameType(var_20_0) then
		local var_20_34 = MenuBuilder.BuildRegisteredType("WaveTimer", {
			controllerIndex = var_20_1
		})

		var_20_34.id = "WaveTimer"

		var_20_34.ReinforcementsText:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/RESPAWN_COUNTDOWN"), 0)
		var_20_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1385, _1080p * 1670, _1080p * 240, _1080p * 374)
		var_20_0:addElement(var_20_34)

		var_20_0.WaveTimer = var_20_34
	end

	local var_20_35

	if CONDITIONS.IsWaveGameType(var_20_0) then
		var_20_35 = MenuBuilder.BuildRegisteredType("PurchaseWidget", {
			controllerIndex = var_20_1
		})
		var_20_35.id = "PurchaseWidget"

		var_20_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 913, _1080p * 786, _1080p * 930)
		var_20_0:addElement(var_20_35)

		var_20_0.PurchaseWidget = var_20_35
	end

	local var_20_36

	if Engine.DDJFBBJAIG() then
		local var_20_37 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_20_1
		})

		var_20_37.id = "CDLRestrictionTag"

		var_20_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_20_0:addElement(var_20_37)

		var_20_0.CDLRestrictionTag = var_20_37
	end

	local function var_20_38()
		return
	end

	var_20_0._sequences.DefaultSequence = var_20_38

	local function var_20_39()
		return
	end

	var_20_0._sequences.Blueprint = var_20_39

	local var_20_40
	local var_20_41 = {
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

	var_20_16:RegisterAnimationSequence("Splitscreen", var_20_41)

	local var_20_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 503
		}
	}

	var_20_18:RegisterAnimationSequence("Splitscreen", var_20_42)

	local var_20_43 = {
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

	var_20_28:RegisterAnimationSequence("Splitscreen", var_20_43)

	local var_20_44 = {
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

	var_20_30:RegisterAnimationSequence("Splitscreen", var_20_44)

	local var_20_45 = {
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

	var_20_32:RegisterAnimationSequence("Splitscreen", var_20_45)

	if CONDITIONS.IsWaveGameType(var_20_0) then
		local var_20_46 = {
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

		var_20_35:RegisterAnimationSequence("Splitscreen", var_20_46)
	end

	local function var_20_47()
		var_20_16:AnimateSequence("Splitscreen")
		var_20_18:AnimateSequence("Splitscreen")
		var_20_28:AnimateSequence("Splitscreen")
		var_20_30:AnimateSequence("Splitscreen")
		var_20_32:AnimateSequence("Splitscreen")

		if CONDITIONS.IsWaveGameType(var_20_0) then
			var_20_35:AnimateSequence("Splitscreen")
		end
	end

	var_20_0._sequences.Splitscreen = var_20_47

	local var_20_48
	local var_20_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 834
		}
	}

	var_20_18:RegisterAnimationSequence("Regular", var_20_49)

	local var_20_50 = {
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

	var_20_28:RegisterAnimationSequence("Regular", var_20_50)

	local var_20_51 = {
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

	var_20_30:RegisterAnimationSequence("Regular", var_20_51)

	local var_20_52 = {
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

	var_20_32:RegisterAnimationSequence("Regular", var_20_52)

	local function var_20_53()
		var_20_18:AnimateSequence("Regular")
		var_20_28:AnimateSequence("Regular")
		var_20_30:AnimateSequence("Regular")
		var_20_32:AnimateSequence("Regular")
	end

	var_20_0._sequences.Regular = var_20_53

	local var_20_54
	local var_20_55 = {
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

	var_20_16:RegisterAnimationSequence("Frontend", var_20_55)

	local function var_20_56()
		var_20_16:AnimateSequence("Frontend")
	end

	var_20_0._sequences.Frontend = var_20_56

	local var_20_57
	local var_20_58 = {
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

	var_20_16:RegisterAnimationSequence("InGame", var_20_58)

	local function var_20_59()
		var_20_16:AnimateSequence("InGame")
	end

	var_20_0._sequences.InGame = var_20_59

	if Engine.DDJFBBJAIG() then
		local var_20_60 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_20_18,
			startCap = var_20_18.startCap,
			endCap = var_20_18.endCap,
			sliderArea = var_20_18.sliderArea,
			slider = var_20_18.sliderArea and var_20_18.sliderArea.slider,
			fixedSizeSlider = var_20_18.sliderArea and var_20_18.sliderArea.fixedSizeSlider
		})

		var_20_11:AddScrollbar(var_20_60)
	end

	if not Engine.DDJFBBJAIG() then
		local var_20_61 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_20_18,
			startCap = var_20_18.startCap,
			endCap = var_20_18.endCap,
			sliderArea = var_20_18.sliderArea,
			slider = var_20_18.sliderArea and var_20_18.sliderArea.slider,
			fixedSizeSlider = var_20_18.sliderArea and var_20_18.sliderArea.fixedSizeSlider
		})

		var_20_13:AddScrollbar(var_20_61)
	end

	var_20_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_20_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
	})

	local var_20_62 = LUI.UIBindButton.new()

	var_20_62.id = "selfBindButton"

	var_20_0:addElement(var_20_62)

	var_20_0.bindButton = var_20_62

	var_20_0.bindButton:addEventHandler("button_secondary", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_20_1
		end

		ACTIONS.LeaveMenu(var_20_0)
	end)
	var_0_6(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("AttachmentSelect", AttachmentSelect)
LockTable(_M)
