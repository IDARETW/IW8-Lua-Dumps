module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = LUI.DeepCopy(arg_1_0._weaponTable)

	if arg_1_2 then
		var_1_0.attachments[arg_1_2].ref = ATTACHMENT.none
		var_1_0.attachments[arg_1_2].variantID = ATTACHMENT.baseVariant
	end

	arg_1_1 = arg_1_1 or #var_1_0.attachments + 1

	if arg_1_3 then
		var_1_0.attachments[arg_1_1] = var_1_0.attachments[arg_1_1] or {}
		var_1_0.attachments[arg_1_1].ref = arg_1_0._baseRef
		var_1_0.attachments[arg_1_1].variantID = arg_1_3
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if not Engine.DDJFBBJAIG() or not arg_2_0._weaponModel then
		return
	end

	WEAPON.LoadAndSetModel(arg_2_1, arg_2_0._weaponModel, arg_2_0._currentTable, {
		forceOffsetsAndRotations = true
	})
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	return function()
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.Preview
		})

		arg_3_0._weaponModel = WEAPON.GetWeaponModel(arg_3_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.attachmentFile)

		arg_3_0:addElement(arg_3_0._weaponModel)
		var_0_1(arg_3_0, arg_3_1, arg_3_2, arg_3_0._currentVariantID)
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.AttachmentAppearanceDetails)
	assert(arg_5_0.Attachments)
	assert(arg_5_0.MenuTitle)

	if Engine.BHICADFIHA() then
		if not arg_5_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for AttachmentAppearanceSelect menu. Only OK after a MyChanges.")

			arg_5_2.weaponSlot = 0
		end

		if not arg_5_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for AttachmentAppearanceSelect menu. Only OK after a MyChanges.")

			arg_5_2.loadoutIndex = 0
		end

		if not arg_5_2.variants then
			DebugPrint("WARNING: Missing \"variants\" option for AttachmentAppearanceSelect menu. Only OK after a MyChanges.")

			arg_5_2.variants = {}
		end

		if not arg_5_2.attachmentRef then
			DebugPrint("WARNING: Missing \"attachment\" option for AttachmentAppearanceSelect menu. Only OK after a MyChanges.")

			arg_5_2.attachmentRef = "acog"
		end
	end

	ACTIONS.ScaleFullscreen(arg_5_0.Gradient)
	ACTIONS.ScaleFullscreen(arg_5_0.Vignette)
	table.sort(arg_5_2.variants, function(arg_6_0, arg_6_1)
		return arg_6_0.variantID < arg_6_1.variantID
	end)

	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_5_2.loadoutIndex].weaponSetups[arg_5_2.weaponSlot]

	arg_5_0._weaponTable = WEAPON.GenerateWeaponTable(var_5_0)

	arg_5_0.DetailedEquippedSlots:Setup(arg_5_0._weaponTable, arg_5_2.category)

	local var_5_1 = 0

	for iter_5_0, iter_5_1 in ddlpairs(var_5_0.attachmentSetup) do
		if iter_5_1.attachment:get() ~= ATTACHMENT.none then
			var_5_1 = var_5_1 + 1
		end
	end

	arg_5_0.DetailedEquippedSlots.EquippedText:setText(Engine.CBBHFCGDIC("CAS/EQUIPPED_COUNT", var_5_1, ATTACHMENT.count))

	arg_5_0._baseRef = ATTACHMENT.GetBaseRef(arg_5_2.attachmentRef)

	local var_5_2 = arg_5_2.attachmentRef

	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/BLUEPRINT_ATTACHMENT"))

	local var_5_3
	local var_5_4

	if arg_5_2.attachSlot then
		var_5_3 = var_5_0.attachmentSetup[arg_5_2.attachSlot - 1].variantID:get()
		var_5_4 = var_5_0.attachmentSetup[arg_5_2.attachSlot - 1].attachment:get()
	end

	local var_5_5 = var_5_4 == arg_5_0._baseRef
	local var_5_6 = 0

	if var_5_3 and var_5_5 then
		for iter_5_2, iter_5_3 in ipairs(arg_5_2.variants) do
			if var_5_3 == iter_5_3.variantID then
				var_5_6 = iter_5_2 - 1

				local var_5_7 = ATTACHMENT.GetName(var_5_2, arg_5_0._weaponTable.weapon)

				arg_5_0.AttachmentAppearanceDetails:Setup(iter_5_3, arg_5_0._weaponTable, var_5_5 and var_5_3, arg_5_2.blockedCategorySlot, var_5_7)
			end
		end
	end

	arg_5_0.Attachments:SetNumChildren(0)
	arg_5_0.Attachments:SetRefreshChild(function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_5_0.Attachments:GetContentIndex(arg_7_1, arg_7_2)
		local var_7_1 = arg_5_2.variants[var_7_0 + 1]
		local var_7_2 = var_5_3 == var_7_1.variantID and var_5_5

		arg_7_0:Setup(var_7_1, var_7_2, var_5_0.weapon:get())
	end)
	arg_5_0.Attachments:SetNumChildren(#arg_5_2.variants)
	arg_5_0.Attachments:SetDefaultFocus(arg_5_0.Attachments:GetPositionForIndex(var_5_6, {
		relativePosition = false
	}))
	arg_5_0.Attachments:RefreshContent()

	local var_5_8 = ATTACHMENT.GetName(var_5_2, arg_5_0._weaponTable.weapon)

	arg_5_0:registerEventHandler("update_showcase", function(arg_8_0, arg_8_1)
		arg_8_0.AttachmentAppearanceDetails:Setup(arg_8_1.variantData, arg_8_0._weaponTable, var_5_5 and var_5_3, arg_5_2.blockedCategorySlot, var_5_8)

		arg_8_0._currentVariantID = arg_8_1.variantData.variantID
		arg_5_0._currentTable = var_0_0(arg_5_0, arg_5_2.attachSlot, arg_5_2.blockedCategorySlot, arg_8_0._currentVariantID)

		var_0_1(arg_8_0, arg_5_1, arg_5_0._baseRef, arg_8_1.variantData.variantID)
	end)
	arg_5_0:registerEventHandler("equip_attachment", function(arg_9_0, arg_9_1)
		GUNSMITH.EquipAttachment(arg_9_0, arg_5_1, arg_5_0._baseRef, var_5_0, {
			menusToLeave = {
				"AttachmentSelect",
				"AttachmentAppearanceSelect"
			},
			attachSlot = arg_5_2.attachSlot,
			lootID = arg_9_1.variantData.lootID,
			variantID = arg_9_1.variantData.variantID,
			isNewVariantID = arg_9_1.variantData.variantID ~= var_5_3 or not var_5_5
		})

		return true
	end)

	if Engine.DDJFBBJAIG() then
		MenuUtils.SetupSceneChangeCallback(arg_5_0, var_0_2(arg_5_0, arg_5_1))

		local var_5_9 = ATTACHMENT.GetCategory(var_5_2)
		local var_5_10 = GUNSMITH.GetAttachmentCategoryScene(arg_5_0._weaponTable.weapon, arg_5_0._weaponTable.variantID, var_5_9)

		Engine.DHFCHIIJCA(var_5_10)

		arg_5_0._currentTable = var_0_0(arg_5_0, arg_5_2.attachSlot)

		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
		})
		arg_5_0.bindButton:addEventHandler("button_right_stick", function(arg_10_0, arg_10_1)
			arg_5_2.weaponTable = arg_5_0._currentTable

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_5_1, false, arg_5_2, true)
		end)
	end
end

function AttachmentAppearanceSelect(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "AttachmentAppearanceSelect"

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

	if CONDITIONS.InGame(var_11_0) then
		local var_11_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_11_1
		})

		var_11_4.id = "InGameMenuBackground"

		var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_11_0:addElement(var_11_4)

		var_11_0.InGameMenuBackground = var_11_4
	end

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Vignette"

	var_11_6:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 770, 0, _1080p * 433)
	var_11_0:addElement(var_11_6)

	var_11_0.Vignette = var_11_6

	local var_11_7

	if Engine.DDJFBBJAIG() then
		local var_11_8 = LUI.UIImage.new()

		var_11_8.id = "Gradient"

		var_11_8:SetRGBFromInt(0, 0)
		var_11_8:SetAlpha(0.5, 0)
		var_11_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
		var_11_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -603, 0, 0)
		var_11_0:addElement(var_11_8)

		var_11_0.Gradient = var_11_8
	end

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "MenuTitle"

	var_11_10.MenuTitle:setText("", 0)
	var_11_10.Line:SetLeft(0, 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_10)

	var_11_0.MenuTitle = var_11_10

	local var_11_11
	local var_11_12 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 10,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AttachmentVariantButton", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 62,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_13 = LUI.UIGrid.new(var_11_12)

	var_11_13.id = "Attachments"

	var_11_13:setUseStencil(true)
	var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 178, _1080p * 864)
	var_11_0:addElement(var_11_13)

	var_11_0.Attachments = var_11_13

	local var_11_14
	local var_11_15 = MenuBuilder.BuildRegisteredType("AttachmentAppearanceDetails", {
		controllerIndex = var_11_1
	})

	var_11_15.id = "AttachmentAppearanceDetails"

	var_11_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 980, _1080p * 178, _1080p * 318)
	var_11_0:addElement(var_11_15)

	var_11_0.AttachmentAppearanceDetails = var_11_15

	local var_11_16
	local var_11_17 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_17.id = "VerticalScrollbar"

	var_11_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 516, _1080p * 532, _1080p * 178, _1080p * 864)
	var_11_0:addElement(var_11_17)

	var_11_0.VerticalScrollbar = var_11_17

	local var_11_18
	local var_11_19 = MenuBuilder.BuildRegisteredType("GunsmithDetailedEquippedSlots", {
		controllerIndex = var_11_1
	})

	var_11_19.id = "DetailedEquippedSlots"

	var_11_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 462, _1080p * 121, _1080p * 153)
	var_11_0:addElement(var_11_19)

	var_11_0.DetailedEquippedSlots = var_11_19

	local var_11_20 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_17,
		startCap = var_11_17.startCap,
		endCap = var_11_17.endCap,
		sliderArea = var_11_17.sliderArea,
		slider = var_11_17.sliderArea and var_11_17.sliderArea.slider,
		fixedSizeSlider = var_11_17.sliderArea and var_11_17.sliderArea.fixedSizeSlider
	})

	var_11_13:AddScrollbar(var_11_20)
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
	})

	local var_11_21 = LUI.UIBindButton.new()

	var_11_21.id = "selfBindButton"

	var_11_0:addElement(var_11_21)

	var_11_0.bindButton = var_11_21

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("AttachmentAppearanceSelect", AttachmentAppearanceSelect)
LockTable(_M)
