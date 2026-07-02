module(..., package.seeall)

local function var_0_0(arg_1_0)
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

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = 0

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.attachments) do
		if iter_3_1.ref and iter_3_1.ref ~= ATTACHMENT.none then
			var_3_0 = var_3_0 + 1

			local var_3_1 = arg_3_0._attachments[var_3_0]

			if var_3_1 then
				var_3_1:Setup(ATTACHMENT.GetRef(iter_3_1.ref, arg_3_1.weapon))
			end
		end
	end

	for iter_3_2 = var_3_0 + 1, #arg_3_0._attachments do
		arg_3_0._attachments[iter_3_2]:Setup(ATTACHMENT.none)
	end

	arg_3_0.Camo:SetupImage(WEAPON.GetCamoImage(arg_3_1.camo))
	arg_3_0.Reticle:SetupImage(WEAPON.GetReticleImage(arg_3_1.reticle))
	arg_3_0.Charm:SetupImage(WEAPON.GetCharmImage(arg_3_1.cosmeticAttachment))
	arg_3_0.StickerDisplay:Setup(arg_3_1)
	var_0_0(arg_3_0)
	arg_3_0.WeaponWithAttachments:UpdateWithWeaponTable(controllerIndex, false, arg_3_1)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Camo)
	assert(arg_4_0.Reticle)
	assert(arg_4_0.Charm)
	assert(arg_4_0.StickerDisplay)

	arg_4_0.Setup = var_0_1
	arg_4_0._attachments = {
		arg_4_0.Attachment1,
		arg_4_0.Attachment2,
		arg_4_0.Attachment3,
		arg_4_0.Attachment4,
		arg_4_0.Attachment5
	}
	arg_4_0._customizations = {
		arg_4_0.Camo,
		arg_4_0.Reticle,
		arg_4_0.Charm,
		arg_4_0.StickerDisplay
	}

	arg_4_0.BlueprintTag:SetBlueprint(false)
	ACTIONS.AnimateSequence(arg_4_0, "DefaultName")
end

function ModificationDisplay(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1338 * _1080p, 0, 436 * _1080p)

	var_5_0.id = "ModificationDisplay"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "WeaponWithAttachments"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * 76, _1080p * -88, _1080p * 88)
	var_5_0:addElement(var_5_6)

	var_5_0.WeaponWithAttachments = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Attachment1"

	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -19, _1080p * 26, _1080p * 76)
	var_5_0:addElement(var_5_8)

	var_5_0.Attachment1 = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Attachment2"

	var_5_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -19, _1080p * 87, _1080p * 137)
	var_5_0:addElement(var_5_10)

	var_5_0.Attachment2 = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "Attachment3"

	var_5_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -19, _1080p * 147, _1080p * 197)
	var_5_0:addElement(var_5_12)

	var_5_0.Attachment3 = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "Attachment4"

	var_5_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -19, _1080p * 207, _1080p * 257)
	var_5_0:addElement(var_5_14)

	var_5_0.Attachment4 = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("AttachmentDisplay", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "Attachment5"

	var_5_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -261, _1080p * -19, _1080p * 267, _1080p * 317)
	var_5_0:addElement(var_5_16)

	var_5_0.Attachment5 = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("ModCustomizationItem", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "Camo"

	var_5_18.Category:setText(Engine.CBBHFCGDIC("LOOT_MP/CAMO"), 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 276, _1080p * 350, _1080p * 406)
	var_5_0:addElement(var_5_18)

	var_5_0.Camo = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("ModCustomizationItem", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "Reticle"

	var_5_20.Category:setText(Engine.CBBHFCGDIC("LOOT_MP/RETICLE"), 0)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 276, _1080p * 526, _1080p * 350, _1080p * 406)
	var_5_0:addElement(var_5_20)

	var_5_0.Reticle = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("ModCustomizationItem", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "Charm"

	var_5_22.Category:setText(Engine.CBBHFCGDIC("LOOT_MP/CHARM"), 0)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 526, _1080p * 776, _1080p * 350, _1080p * 406)
	var_5_0:addElement(var_5_22)

	var_5_0.Charm = var_5_22

	local var_5_23
	local var_5_24 = MenuBuilder.BuildRegisteredType("StickerDisplay", {
		controllerIndex = var_5_1
	})

	var_5_24.id = "StickerDisplay"

	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 776, _1080p * 1176, _1080p * 350, _1080p * 406)
	var_5_0:addElement(var_5_24)

	var_5_0.StickerDisplay = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIText.new()

	var_5_26.id = "ModName"

	var_5_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_26:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/WEAPON_NAME")), 0)
	var_5_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_26:SetAlignment(LUI.Alignment.Left)
	var_5_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 1039, _1080p * 19, _1080p * 69)
	var_5_0:addElement(var_5_26)

	var_5_0.ModName = var_5_26

	local var_5_27
	local var_5_28 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_5_1
	})

	var_5_28.id = "BlueprintTag"

	var_5_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 163, _1080p * 75, _1080p * 105)
	var_5_0:addElement(var_5_28)

	var_5_0.BlueprintTag = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIImage.new()

	var_5_30.id = "Line"

	var_5_30:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_30:SetAlpha(0.4, 0)
	var_5_30:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 28, _1080p * -28, _1080p * 112, _1080p * 113)
	var_5_0:addElement(var_5_30)

	var_5_0.Line = var_5_30

	local function var_5_31()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_31

	local var_5_32 = {
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

	var_5_26:RegisterAnimationSequence("ActiveName", var_5_32)

	local function var_5_33()
		var_5_26:AnimateSequence("ActiveName")
	end

	var_5_0._sequences.ActiveName = var_5_33

	local var_5_34 = {
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

	var_5_26:RegisterAnimationSequence("DefaultName", var_5_34)

	local function var_5_35()
		var_5_26:AnimateSequence("DefaultName")
	end

	var_5_0._sequences.DefaultName = var_5_35

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ModificationDisplay", ModificationDisplay)
LockTable(_M)
