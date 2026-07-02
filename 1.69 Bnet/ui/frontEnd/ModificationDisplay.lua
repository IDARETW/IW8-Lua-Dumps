module(..., package.seeall)

local var_0_0 = "Attachment"
local var_0_1 = GUNSMITH.maxCategories

local function var_0_2(arg_1_0)
	local function var_1_0(arg_2_0)
		if arg_2_0.Category then
			local var_2_0 = 20 * _1080p
			local var_2_1 = LAYOUT.GetTextWidth(arg_2_0.Category) + arg_2_0:GetImageWidth() + var_2_0
			local var_2_2 = arg_2_0:GetCurrentAnchorsAndPositions().left

			arg_2_0:SetRight(var_2_1 + var_2_2)

			return var_2_1
		end
	end

	local var_1_1
	local var_1_2 = 30 * _1080p

	for iter_1_0 = 1, #arg_1_0._customizations do
		local var_1_3 = var_1_0(arg_1_0._customizations[iter_1_0])

		if var_1_1 then
			arg_1_0._customizations[iter_1_0]:SetLeft(var_1_1)
			arg_1_0._customizations[iter_1_0]:SetRight(var_1_3 + var_1_1)

			var_1_1 = arg_1_0._customizations[iter_1_0]:GetCurrentAnchorsAndPositions().right + var_1_2
		else
			var_1_1 = arg_1_0._customizations[iter_1_0]:GetCurrentAnchorsAndPositions().right + var_1_2
		end
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = {}
	local var_3_2 = 1
	local var_3_3 = 1

	ATTACHMENT.SortTableOnEquipped(arg_3_1.attachments)

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.attachments) do
		if var_3_2 <= ATTACHMENT.count then
			var_3_0[var_3_2] = iter_3_1
			var_3_2 = var_3_2 + 1
		else
			var_3_1[var_3_3] = iter_3_1
			var_3_3 = var_3_3 + 1
		end
	end

	arg_3_0.DefaultAttachmentsGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = var_3_0[arg_4_2 + 1]

		if var_4_0 then
			arg_4_0:Setup(ATTACHMENT.GetRef(var_4_0.ref, arg_3_1.weapon))
		else
			arg_4_0:Setup(ATTACHMENT.none)
		end
	end)
	arg_3_0.DefaultAttachmentsGrid:SetNumChildren(var_3_2)
	arg_3_0.DefaultAttachmentsGrid:RefreshContent()
	arg_3_0.ExtraAttachmentsGrid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = var_3_1[arg_5_2 + 1]

		if var_5_0 then
			arg_5_0:Setup(ATTACHMENT.GetRef(var_5_0.ref, arg_3_1.weapon))
		else
			arg_5_0:Setup(ATTACHMENT.none)
		end
	end)
	arg_3_0.ExtraAttachmentsGrid:SetNumChildren(var_3_3)
	arg_3_0.ExtraAttachmentsGrid:RefreshContent()
	ACTIONS.AnimateSequence(arg_3_0, ATTACHMENT.GetMaxAttachmentCount(arg_3_1.weapon) > ATTACHMENT.count and "ShowExtraAttachments" or "ShowDefaultAttachments")
end

local function var_0_4(arg_6_0, arg_6_1)
	var_0_3(arg_6_0, arg_6_1)
	arg_6_0.Camo:SetupImage(WEAPON.GetCamoImage(arg_6_1.camo))
	arg_6_0.Reticle:SetupImage(WEAPON.GetReticleImage(arg_6_1.reticle))
	arg_6_0.Charm:SetupImage(WEAPON.GetCharmImage(arg_6_1.cosmeticAttachment))
	arg_6_0.StickerDisplay:Setup(arg_6_1)
	var_0_2(arg_6_0)
	arg_6_0.WeaponWithAttachments:UpdateWithWeaponTable(controllerIndex, false, arg_6_1)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.Camo)
	assert(arg_7_0.Reticle)
	assert(arg_7_0.Charm)
	assert(arg_7_0.StickerDisplay)

	arg_7_0.Setup = var_0_4
	arg_7_0._customizations = {
		arg_7_0.Camo,
		arg_7_0.Reticle,
		arg_7_0.Charm,
		arg_7_0.StickerDisplay
	}

	arg_7_0.BlueprintTag:SetBlueprint(false)
	ACTIONS.AnimateSequence(arg_7_0, "DefaultName")
end

function ModificationDisplay(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1338 * _1080p, 0, 436 * _1080p)

	var_8_0.id = "ModificationDisplay"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "DoubleNotchedBacker"

	var_8_4:SetAlpha(0.5, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.DoubleNotchedBacker = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "WeaponWithAttachments"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * 76, _1080p * -88, _1080p * 88)
	var_8_0:addElement(var_8_6)

	var_8_0.WeaponWithAttachments = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("ModCustomizationItem", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Camo"

	var_8_8.Category:setText(Engine.CBBHFCGDIC("LOOT_MP/CAMO"), 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 276, _1080p * 350, _1080p * 406)
	var_8_0:addElement(var_8_8)

	var_8_0.Camo = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("ModCustomizationItem", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "Reticle"

	var_8_10.Category:setText(Engine.CBBHFCGDIC("LOOT_MP/RETICLE"), 0)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 276, _1080p * 526, _1080p * 350, _1080p * 406)
	var_8_0:addElement(var_8_10)

	var_8_0.Reticle = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("ModCustomizationItem", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "Charm"

	var_8_12.Category:setText(Engine.CBBHFCGDIC("LOOT_MP/CHARM"), 0)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 526, _1080p * 776, _1080p * 350, _1080p * 406)
	var_8_0:addElement(var_8_12)

	var_8_0.Charm = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("StickerDisplay", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "StickerDisplay"

	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 776, _1080p * 1176, _1080p * 350, _1080p * 406)
	var_8_0:addElement(var_8_14)

	var_8_0.StickerDisplay = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "ModName"

	var_8_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_16:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/WEAPON_NAME")), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 1039, _1080p * 19, _1080p * 69)
	var_8_0:addElement(var_8_16)

	var_8_0.ModName = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "BlueprintTag"

	var_8_18.BlueprintIcon:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 163, _1080p * 75, _1080p * 105)
	var_8_0:addElement(var_8_18)

	var_8_0.BlueprintTag = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "Line"

	var_8_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_20:SetAlpha(0.4, 0)
	var_8_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 28, _1080p * -28, _1080p * 112, _1080p * 113)
	var_8_0:addElement(var_8_20)

	var_8_0.Line = var_8_20

	local var_8_21
	local var_8_22 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 227,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_23 = LUI.UIGrid.new(var_8_22)

	var_8_23.id = "DefaultAttachmentsGrid"

	var_8_23:setUseStencil(false)
	var_8_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -34, _1080p * 27, _1080p * 325)
	var_8_0:addElement(var_8_23)

	var_8_0.DefaultAttachmentsGrid = var_8_23

	local var_8_24
	local var_8_25 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 227,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_26 = LUI.UIGrid.new(var_8_25)

	var_8_26.id = "ExtraAttachmentsGrid"

	var_8_26:SetAlpha(0, 0)
	var_8_26:setUseStencil(false)
	var_8_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -34, _1080p * 27, _1080p * 317)
	var_8_0:addElement(var_8_26)

	var_8_0.ExtraAttachmentsGrid = var_8_26

	local function var_8_27()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ActiveName", var_8_29)

	local function var_8_30()
		var_8_16:AnimateSequence("ActiveName")
	end

	var_8_0._sequences.ActiveName = var_8_30

	local var_8_31
	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEmpty
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("DefaultName", var_8_32)

	local function var_8_33()
		var_8_16:AnimateSequence("DefaultName")
	end

	var_8_0._sequences.DefaultName = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -49
		}
	}

	var_8_6:RegisterAnimationSequence("ShowExtraAttachments", var_8_35)

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -509
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -282
		}
	}

	var_8_23:RegisterAnimationSequence("ShowExtraAttachments", var_8_36)

	local var_8_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_26:RegisterAnimationSequence("ShowExtraAttachments", var_8_37)

	local function var_8_38()
		var_8_6:AnimateSequence("ShowExtraAttachments")
		var_8_23:AnimateSequence("ShowExtraAttachments")
		var_8_26:AnimateSequence("ShowExtraAttachments")
	end

	var_8_0._sequences.ShowExtraAttachments = var_8_38

	local var_8_39
	local var_8_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -278
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 76
		}
	}

	var_8_6:RegisterAnimationSequence("ShowDefaultAttachments", var_8_40)

	local var_8_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -34
		}
	}

	var_8_23:RegisterAnimationSequence("ShowDefaultAttachments", var_8_41)

	local var_8_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_26:RegisterAnimationSequence("ShowDefaultAttachments", var_8_42)

	local function var_8_43()
		var_8_6:AnimateSequence("ShowDefaultAttachments")
		var_8_23:AnimateSequence("ShowDefaultAttachments")
		var_8_26:AnimateSequence("ShowDefaultAttachments")
	end

	var_8_0._sequences.ShowDefaultAttachments = var_8_43

	var_0_5(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("ModificationDisplay", ModificationDisplay)
LockTable(_M)
