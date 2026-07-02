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
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = WEAPON.GetWeaponClass(arg_2_3.weapon)

	if not WEAPON.IsBulletWeapon(var_2_0) then
		local var_2_1 = WEAPON.GetBWImage(arg_2_3.weapon)
		local var_2_2 = WEAPON.GetVariantOverridenIcon(arg_2_3.weapon, arg_2_3.variantID)

		if var_2_2 and #var_2_2 > 0 then
			var_2_1 = var_2_2
		end

		arg_2_0.Receiver:SetAlpha(0)
		var_0_0(arg_2_0, arg_2_1, var_2_1)

		return
	end

	local var_2_3 = WEAPON.GetWeaponModelName(arg_2_3.weapon, arg_2_3, {
		includeStickers = true,
		includeAttachments = true,
		keepAkimbo = true,
		includeCamos = true,
		controllerIndex = arg_2_1
	})
	local var_2_4 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_2_3)

	arg_2_0:PerformUpdate(arg_2_1, arg_2_2, var_2_4, arg_2_3.weapon)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	if arg_3_4 == nil or #arg_3_4 == 0 or arg_3_4 == "none" then
		return
	end

	if WEAPON.GetDynamicWeaponEnableValue(arg_3_4) and DYN_ATTACHMENT.IsDynamicAttachmentIconsEnabled() then
		arg_3_0.Receiver:SetAlpha(1)
		arg_3_0.Icon:SetAlpha(0)
		arg_3_0.Receiver:PerformUpdate(arg_3_1, arg_3_2, arg_3_3, arg_3_4)

		local var_3_0 = WEAPON.GetDynamicWeaponAnimationSeq(arg_3_4)

		if var_3_0 and #var_3_0 > 0 then
			DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_3_0, nil, var_3_0, "Receiver", true)
		end
	else
		arg_3_0.Receiver:SetAlpha(0)

		arg_3_4 = WEAPON.StripSuffix(arg_3_4, "_mp")

		local var_3_1 = WEAPON.GetBWImage(arg_3_4)
		local var_3_2 = "loot"

		if arg_3_5 and #arg_3_5 > 0 then
			local var_3_3, var_3_4 = string.find(arg_3_5, "+" .. var_3_2 .. "%d")

			if var_3_3 and var_3_4 and var_3_3 - 1 > 1 then
				local var_3_5 = WEAPON.GetBaseRef(arg_3_4)
				local var_3_6 = WEAPON.GetVariantFile(var_3_5)
				local var_3_7
				local var_3_8 = string.sub(arg_3_5, var_3_4 + 1, #arg_3_5)
				local var_3_9, var_3_10 = string.find(var_3_8, "+")

				if var_3_9 and var_3_10 then
					var_3_7 = string.sub(arg_3_5, var_3_4, var_3_4 + var_3_9 - 1)
				else
					var_3_7 = string.sub(arg_3_5, var_3_4, #arg_3_5)
				end

				if var_3_6 and #var_3_6 > 0 and var_3_7 and tonumber(var_3_7) > 0 then
					local var_3_11 = StringTable.DIFCHIGDFB(var_3_6, CSV.weaponVariants.cols.variantID, tonumber(var_3_7), CSV.weaponVariants.cols.overrideImage)

					if var_3_11 and #var_3_11 > 0 then
						var_3_1 = var_3_11
					end
				end
			end
		end

		var_0_0(arg_3_0, arg_3_1, var_3_1)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1)
	assert(arg_4_0.Receiver)

	arg_4_0.PerformUpdate = var_0_2
	arg_4_0.UpdateWithWeaponTable = var_0_1
end

function WeaponWithAttachments(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 128 * _1080p)

	var_5_0.id = "WeaponWithAttachments"
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

	var_5_4:setImage(RegisterMaterial("icon_weapon_sm_mpapa7"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Icon = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("ReceiverWithAttachments", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Receiver"

	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Receiver = var_5_6

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WeaponWithAttachments", WeaponWithAttachments)
LockTable(_M)
