module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Muzzle:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0.UnderBarrel:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0.Laser:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0.Icon:SetAlpha(arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetAlpha(1)

	local var_2_0 = arg_2_2.animateSeq
	local var_2_1
	local var_2_2 = false

	if arg_2_2.type == DYN_ATTACHMENT.DynamicWidgetType.MUZZLE then
		arg_2_0.Muzzle:SetAlpha(1)

		var_2_1 = arg_2_0.Muzzle
	elseif arg_2_2.type == DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL then
		arg_2_0.UnderBarrel:SetAlpha(1)

		var_2_1 = arg_2_0.UnderBarrel
	elseif arg_2_2.type == DYN_ATTACHMENT.DynamicWidgetType.LASER then
		arg_2_0.Laser:SetAlpha(1)

		var_2_1 = arg_2_0.Laser
	elseif arg_2_2.type == DYN_ATTACHMENT.DynamicWidgetType.BARREL then
		arg_2_0.Icon:SetAlpha(1)

		var_2_1 = arg_2_0
		var_2_2 = true
	end

	if var_2_1 then
		if var_2_0 and #var_2_0 > 0 then
			local var_2_3 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_2_2.ref, var_2_0, arg_2_2.variantID)

			if var_2_2 then
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_2_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_2_3, "Muzzle")
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_2_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_2_3, "Laser")
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_2_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_2_3, "UnderBarrel")
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_2_0, DYN_ATTACHMENT.DynamicWidgetType.BARREL, var_2_3, "Icon")
			else
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(var_2_1, arg_2_2.type, var_2_3, "Icon")
			end
		end

		local var_2_4 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_2_2.ref, arg_2_2.icon, arg_2_2.variantID)

		if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_2_4) then
			var_2_1.Icon:setImage(RegisterMaterial(var_2_4))
		end
	end
end

function PostLoadFunc(arg_3_0, arg_3_1)
	arg_3_0.OverrideApplyAttachmentsData = var_0_1
	arg_3_0.UpdateBarrelWidgetsVisibility = var_0_0
end

function BarrelAttachment(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_4_0.id = "BarrelAttachment"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Icon"

	var_4_4:SetScale(-0.95, 0)
	var_4_4:setImage(RegisterMaterial("icon_dyn_attachment_sn_t9accurate_barrel"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 128, _1080p * -65, _1080p * 65)
	var_4_0:addElement(var_4_4)

	var_4_0.Icon = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("UnderBarrelAttachment", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "UnderBarrel"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 24, _1080p * 154, _1080p * 20, _1080p * 147)
	var_4_0:addElement(var_4_6)

	var_4_0.UnderBarrel = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("LaserAttachment", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Laser"

	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64)
	var_4_0:addElement(var_4_8)

	var_4_0.Laser = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("MuzzleAttachment", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Muzzle"

	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64)
	var_4_0:addElement(var_4_10)

	var_4_0.Muzzle = var_4_10

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BarrelAttachment", BarrelAttachment)
LockTable(_M)
