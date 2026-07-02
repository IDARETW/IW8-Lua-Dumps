module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.laserHideList.file, CSV.laserHideList.cols.baseWeaponRef, arg_1_0, CSV.laserHideList.cols.excludedAttachments)

	if var_1_0 and #var_1_0 == 0 then
		var_1_0 = StringTable.DIFCHIGDFB(CSV.laserHideList.file, CSV.laserHideList.cols.specialWeaponRefs, arg_1_0, CSV.laserHideList.cols.excludedAttachments)
	end

	local var_1_1 = split(var_1_0, ",")

	for iter_1_0 = 1, #var_1_1 do
		if var_1_1[iter_1_0] == arg_1_1 then
			return false
		end
	end

	return true
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Muzzle:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.UnderBarrel:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Laser:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Icon:SetAlpha(arg_2_1 and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SetAlpha(1)

	local var_3_0 = arg_3_2.animateSeq
	local var_3_1
	local var_3_2 = false

	if arg_3_2.type == DYN_ATTACHMENT.DynamicWidgetType.MUZZLE then
		arg_3_0.Muzzle:SetAlpha(1)

		var_3_1 = arg_3_0.Muzzle
	elseif arg_3_2.type == DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL then
		arg_3_0.UnderBarrel:SetAlpha(1)

		var_3_1 = arg_3_0.UnderBarrel
	elseif arg_3_2.type == DYN_ATTACHMENT.DynamicWidgetType.LASER then
		if var_0_0(arg_3_2.weaponRef, arg_3_2.ref) then
			arg_3_0.Laser:SetAlpha(1)

			var_3_1 = arg_3_0.Laser
		else
			arg_3_0.Laser:SetAlpha(0)

			var_3_1 = nil
		end
	elseif arg_3_2.type == DYN_ATTACHMENT.DynamicWidgetType.BARREL then
		arg_3_0.Icon:SetAlpha(1)

		var_3_1 = arg_3_0
		var_3_2 = true
	end

	if var_3_1 then
		if var_3_0 and #var_3_0 > 0 then
			local var_3_3 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_3_2.ref, var_3_0, arg_3_2.variantID)

			if var_3_2 then
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_3_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_3_3, "Muzzle")
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_3_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_3_3, "Laser")
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_3_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_3_3, "UnderBarrel")
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_3_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_3_3, "Icon")
			else
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(var_3_1, arg_3_2.type, var_3_3, "Icon")
			end
		end

		local var_3_4 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_3_2.ref, arg_3_2.icon, arg_3_2.variantID)

		if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_3_4) then
			var_3_1.Icon:setImage(RegisterMaterial(var_3_4))
		end
	end
end

function PostLoadFunc(arg_4_0, arg_4_1)
	arg_4_0.OverrideApplyAttachmentsData = var_0_2
	arg_4_0.UpdateBarrelWidgetsVisibility = var_0_1
end

function BarrelAttachment(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_5_0.id = "BarrelAttachment"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Icon"

	var_5_4:SetScale(-0.95, 0)
	var_5_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 128, _1080p * -65, _1080p * 65)
	var_5_0:addElement(var_5_4)

	var_5_0.Icon = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("UnderBarrelAttachment", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "UnderBarrel"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 24, _1080p * 154, _1080p * 18, _1080p * 145)
	var_5_0:addElement(var_5_6)

	var_5_0.UnderBarrel = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("LaserAttachment", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Laser"

	var_5_8:SetAlpha(0, 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64)
	var_5_0:addElement(var_5_8)

	var_5_0.Laser = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("MuzzleAttachment", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Muzzle"

	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64)
	var_5_0:addElement(var_5_10)

	var_5_0.Muzzle = var_5_10

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BarrelAttachment", BarrelAttachment)
LockTable(_M)
