module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = RegisterMaterial(arg_1_2)

	if Engine.DFEIGFBEH(var_1_0) > 1 then
		arg_1_0.Icon:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64)
	else
		arg_1_0.Icon:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64)
	end

	if arg_1_2 == "white" then
		arg_1_0.Icon:SetAlpha(0)
	else
		arg_1_0.Icon:SetAlpha(1)
		arg_1_0.Icon:setImage(var_1_0)
	end

	arg_1_0.Receiver:SetAlpha(0)
	arg_1_0.DynamicWeapon:SetAlpha(0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = WEAPON.GetBWImage(arg_2_2.weapon)
	local var_2_1 = WEAPON.GetVariantOverridenIcon(arg_2_2.weapon, arg_2_2.variantID)

	if var_2_1 and #var_2_1 > 0 then
		var_2_0 = var_2_1
	end

	var_0_0(arg_2_0, arg_2_1, var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = WEAPON.GetWeaponClass(arg_3_3.weapon)

	if not WEAPON.IsBulletWeapon(var_3_0) then
		arg_3_0:UpdateStaticWithWeaponTable(arg_3_1, arg_3_3)

		return
	end

	local var_3_1 = WEAPON.GetWeaponModelName(arg_3_3.weapon, arg_3_3, {
		includeStickers = true,
		includeAttachments = true,
		keepAkimbo = true,
		includeCamos = true,
		controllerIndex = arg_3_1
	})
	local var_3_2 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_3_1)

	arg_3_0:PerformUpdate(arg_3_1, {
		isInteractive = arg_3_2,
		attachmentsData = var_3_2,
		weaponRef = arg_3_3.weapon,
		weaponFullName = var_3_1
	})
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_2.isInteractive
	local var_4_1 = arg_4_2.attachmentsData
	local var_4_2 = arg_4_2.weaponRef
	local var_4_3 = arg_4_2.weaponFullName

	if var_4_2 == nil or #var_4_2 == 0 or var_4_2 == "none" then
		return
	end

	if WEAPON.GetDynamicWeaponEnableValue(var_4_2) and DYN_ATTACHMENT.IsDynamicAttachmentIconsEnabled() then
		if Dvar.IBEGCHEFE("NRSSOSMOP") and arg_4_0.DynamicWeapon:IsValidDynamicWeapon(var_4_3) then
			arg_4_0.Receiver:SetAlpha(0)
			arg_4_0.Icon:SetAlpha(0)
			arg_4_0.DynamicWeapon:SetAlpha(1)
			arg_4_0.DynamicWeapon:SetupDynamicWeaponElement(arg_4_2)
		else
			arg_4_0.Receiver:SetAlpha(1)
			arg_4_0.Icon:SetAlpha(0)
			arg_4_0.DynamicWeapon:SetAlpha(0)
			arg_4_0.Receiver:PerformUpdate(arg_4_1, var_4_0, var_4_1, var_4_2)

			local var_4_4 = WEAPON.GetDynamicWeaponAnimationSeq(var_4_2)

			if var_4_4 and #var_4_4 > 0 then
				DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_4_0, nil, var_4_4, "Receiver", true)
			end
		end
	else
		local var_4_5 = WEAPON.StripSuffix(var_4_2, "_mp")
		local var_4_6 = WEAPON.GetBWImage(var_4_5)
		local var_4_7 = WEAPON.GetWeaponVariantID(var_4_5, var_4_3)

		if var_4_7 and tonumber(var_4_7) > 0 then
			local var_4_8 = WEAPON.GetBaseRef(var_4_5)
			local var_4_9 = WEAPON.GetVariantFile(var_4_8)

			if var_4_9 and #var_4_9 > 0 then
				local var_4_10 = StringTable.DIFCHIGDFB(var_4_9, CSV.weaponVariants.cols.variantID, tonumber(var_4_7), CSV.weaponVariants.cols.overrideImage)

				if var_4_10 and #var_4_10 > 0 then
					var_4_6 = var_4_10
				end
			end
		end

		var_0_0(arg_4_0, arg_4_1, var_4_6)
	end
end

function PostLoadFunc(arg_5_0, arg_5_1)
	assert(arg_5_0.Receiver)

	arg_5_0.PerformUpdate = var_0_3
	arg_5_0.UpdateWithWeaponTable = var_0_2
	arg_5_0.UpdateStaticWithWeaponTable = var_0_1
end

function WeaponWithAttachments(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 128 * _1080p)

	var_6_0.id = "WeaponWithAttachments"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Icon"

	var_6_4:setImage(RegisterMaterial("icon_weapon_sm_mpapa7"), 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Icon = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("ReceiverWithAttachments", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Receiver"

	var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Receiver = var_6_6

	local var_6_7
	local var_6_8 = {
		drawItems = false,
		controllerIndex = var_6_1
	}
	local var_6_9 = MenuBuilder.BuildRegisteredType("DynamicWeaponContent", var_6_8)

	var_6_9.id = "DynamicWeapon"

	var_6_0:addElement(var_6_9)

	var_6_0.DynamicWeapon = var_6_9

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WeaponWithAttachments", WeaponWithAttachments)
LockTable(_M)
