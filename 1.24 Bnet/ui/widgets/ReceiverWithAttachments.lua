module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Icon)
	arg_1_0:SetAlpha(1)
	arg_1_0.Icon:SetAlpha(1)

	local var_1_0 = arg_1_2.animateSeq

	if var_1_0 and var_1_0 ~= "" then
		local var_1_1 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_1_2.ref, var_1_0, arg_1_2.variantID)

		DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_1_0, DYN_ATTACHMENT.DynamicWidgetType.RECEIVER, var_1_1, "Barrel")
		DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_1_0, DYN_ATTACHMENT.DynamicWidgetType.RECEIVER, var_1_1, "Guard")
		DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_1_0, DYN_ATTACHMENT.DynamicWidgetType.RECEIVER, var_1_1, "Magazine")
		DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_1_0, DYN_ATTACHMENT.DynamicWidgetType.RECEIVER, var_1_1, "Scope")
		DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_1_0, DYN_ATTACHMENT.DynamicWidgetType.RECEIVER, var_1_1, "Stock")
		DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_1_0, DYN_ATTACHMENT.DynamicWidgetType.RECEIVER, var_1_1, "Icon")
	end

	local var_1_2 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_1_2.ref, arg_1_2.icon, arg_1_2.variantID)

	if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_1_2) then
		arg_1_0.Icon:setImage(RegisterMaterial(var_1_2))
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Barrel:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Barrel:UpdateBarrelWidgetsVisibility(arg_2_1)
	arg_2_0.Guard:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Magazine:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Icon:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Scope:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.Stock:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.FireType:SetAlpha(arg_2_1 and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0._DynamicIconWidgetMapTable[arg_3_2]

	if var_3_0 == nil then
		return nil
	end

	if var_3_0.func then
		return var_3_0.func()
	else
		return var_3_0.widget
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = ATTACHMENT.GetImage(arg_4_0)

	if var_4_0 then
		arg_4_1.Icon:setImage(RegisterMaterial(var_4_0))
		arg_4_1.Icon:SetAlpha(1)

		if arg_4_2 then
			if split(arg_4_2, "_")[2] == DYN_ATTACHMENT.PISTOL_REF or CONDITIONS.InFrontend() then
				arg_4_1:SetScale(-0.3)
				arg_4_1:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * -100, _1080p * 16, _1080p * 60)
			else
				arg_4_1:SetScale(0)
				arg_4_1:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * -183, _1080p * 72, _1080p * 116)
			end
		else
			arg_4_1.Icon:SetAlpha(0)
		end
	else
		arg_4_1.Icon:SetAlpha(0)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	var_0_1(arg_5_0, false)
	arg_5_0.Perk:SetAlpha(0)

	local var_5_0 = {}

	if CONDITIONS.InFrontend() then
		assert(arg_5_3)

		var_5_0 = arg_5_3
	elseif arg_5_3 then
		var_5_0 = arg_5_3
	else
		var_5_0 = Game.EBGCIIBJHA(arg_5_1, arg_5_2)
	end

	DYN_ATTACHMENT.UpdateAttachmentTable(arg_5_1, var_5_0, arg_5_2)

	local var_5_1 = #var_5_0

	for iter_5_0 = 1, var_5_1 do
		local var_5_2 = var_5_0[iter_5_0]
		local var_5_3 = var_5_2.type
		local var_5_4

		if not var_5_3 or var_5_3 == DYN_ATTACHMENT.DynamicWidgetType.OTHER then
			if var_5_2.isGunPerk then
				var_5_4 = var_0_2(arg_5_0, arg_5_1, var_5_3)
			end
		else
			var_5_4 = var_0_2(arg_5_0, arg_5_1, var_5_3)
		end

		if var_5_4 then
			var_5_4:SetAlpha(1)

			if var_5_2.isGunPerk then
				var_0_3(var_5_2.ref, var_5_4, arg_5_4)
			elseif var_5_4.OverrideApplyAttachmentsData then
				var_5_2.weaponRef = arg_5_4

				var_5_4:OverrideApplyAttachmentsData(arg_5_1, var_5_2)
			else
				DYN_ATTACHMENT.ApplyDynamicAttachmentData(arg_5_1, var_5_4, var_5_4.Icon, var_5_2, var_5_3)
			end
		end
	end
end

function PostLoadFunc(arg_6_0, arg_6_1)
	assert(arg_6_0.Guard)
	assert(arg_6_0.Barrel)
	assert(arg_6_0.Magazine)
	assert(arg_6_0.Scope)
	assert(arg_6_0.Stock)
	assert(arg_6_0.FireType)
	assert(arg_6_0.Icon)
	assert(arg_6_0.Perk)

	arg_6_0._DynamicIconWidgetMapTable = {
		[DYN_ATTACHMENT.DynamicWidgetType.MUZZLE] = {
			widget = arg_6_0.Barrel
		},
		[DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL] = {
			widget = arg_6_0.Barrel
		},
		[DYN_ATTACHMENT.DynamicWidgetType.LASER] = {
			widget = arg_6_0.Barrel
		},
		[DYN_ATTACHMENT.DynamicWidgetType.BARREL] = {
			widget = arg_6_0.Barrel
		},
		[DYN_ATTACHMENT.DynamicWidgetType.GUARD] = {
			widget = arg_6_0.Guard
		},
		[DYN_ATTACHMENT.DynamicWidgetType.MAGAZINE] = {
			widget = arg_6_0.Magazine
		},
		[DYN_ATTACHMENT.DynamicWidgetType.RECEIVER] = {
			widget = arg_6_0
		},
		[DYN_ATTACHMENT.DynamicWidgetType.SCOPE] = {
			widget = arg_6_0.Scope
		},
		[DYN_ATTACHMENT.DynamicWidgetType.STOCK] = {
			widget = arg_6_0.Stock
		},
		[DYN_ATTACHMENT.DynamicWidgetType.FIRETYPE] = {
			widget = arg_6_0.FireType
		},
		[DYN_ATTACHMENT.DynamicWidgetType.OTHER] = {
			widget = arg_6_0.Perk,
			func = function()
				return Dvar.IBEGCHEFE("LRKORRLSSM") and arg_6_0.Perk or nil
			end
		}
	}
	arg_6_0.PerformUpdate = var_0_4
	arg_6_0.OverrideApplyAttachmentsData = var_0_0
end

function ReceiverWithAttachments(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 128 * _1080p)

	var_8_0.id = "ReceiverWithAttachments"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("FiretypeAttachment", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "FireType"

	var_8_4:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_4:SetAlpha(0, 0)
	var_8_4:SetScale(-0.8, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 33, _1080p * 161, _1080p * -35, _1080p * 93)
	var_8_0:addElement(var_8_4)

	var_8_0.FireType = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("MagazineAttachment", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Magazine"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 84, _1080p * 87, _1080p * 215)
	var_8_0:addElement(var_8_6)

	var_8_0.Magazine = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Icon"

	var_8_8:SetScale(-0.95, 0)
	var_8_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -183, _1080p * -55, _1080p * -119, _1080p * 9)
	var_8_0:addElement(var_8_8)

	var_8_0.Icon = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("StockAttachment", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "Stock"

	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 180, _1080p * 308, _1080p * -64, _1080p * 64)
	var_8_0:addElement(var_8_10)

	var_8_0.Stock = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("BarrelAttachment", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "Barrel"

	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -302, _1080p * -174, _1080p * -64, _1080p * 64)
	var_8_0:addElement(var_8_12)

	var_8_0.Barrel = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("GuardAttachment", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "Guard"

	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -134, _1080p * -6, _1080p * 102, _1080p * 230)
	var_8_0:addElement(var_8_14)

	var_8_0.Guard = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("ScopeAttachment", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "Scope"

	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 84, _1080p * -227, _1080p * -99)
	var_8_0:addElement(var_8_16)

	var_8_0.Scope = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("PerktypeAttachment", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "Perk"

	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * -183, _1080p * 72, _1080p * 116)
	var_8_0:addElement(var_8_18)

	var_8_0.Perk = var_8_18

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("ReceiverWithAttachments", ReceiverWithAttachments)
LockTable(_M)
