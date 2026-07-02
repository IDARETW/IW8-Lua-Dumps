module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local function var_1_0()
		local var_2_0 = arg_1_1:GetDataSource()
		local var_2_1 = var_2_0.weaponRef:GetValue(arg_1_0)
		local var_2_2 = {
			var_2_0.attachmentOneRef,
			var_2_0.attachmentTwoRef,
			var_2_0.attachmentThreeRef
		}

		if Engine.EAAHGICFBD() then
			table.insert(var_2_2, var_2_0.attachmentFourRef)
			table.insert(var_2_2, var_2_0.attachmentFiveRef)

			if var_2_0.attachmentSixRef then
				table.insert(var_2_2, var_2_0.attachmentSixRef)
			end
		end

		local var_2_3 = 0
		local var_2_4 = 0

		if var_2_1 and var_2_1 ~= "none" then
			local var_2_5 = WEAPON.GetWeaponClass(var_2_1)

			if Engine.EAIICIFIFA() and var_2_5 == "weapon_classic_s" then
				local var_2_6 = "weapon_classic_p"
			end
		end

		local var_2_7 = {
			accuracy = ATTACHMENT.GetStatAccuracy,
			damage = ATTACHMENT.GetStatDamage,
			range = ATTACHMENT.GetStatRange,
			fireRate = ATTACHMENT.GetStatFireRate,
			mobility = ATTACHMENT.GetStatMobility,
			control = ATTACHMENT.GetStatControl
		}

		for iter_2_0 = 1, #var_2_2 do
			if var_2_2[iter_2_0] then
				local var_2_8 = var_2_7[arg_1_3]

				assert(var_2_8)

				local var_2_9 = ATTACHMENT.GetRef(var_2_2[iter_2_0]:GetValue(arg_1_0), var_2_1)
				local var_2_10 = var_2_8(var_2_9)

				if var_2_10 then
					var_2_4 = var_2_4 + var_2_10

					local var_2_11 = ATTACHMENT.GetBaseRef(var_2_2[iter_2_0]:GetValue(arg_1_0))

					for iter_2_1 = iter_2_0 + 1, #var_2_2 do
						if var_2_11 == ATTACHMENT.GetBaseRef(var_2_2[iter_2_1]:GetValue(arg_1_0)) then
							var_2_4 = var_2_4 - var_2_10

							break
						end
					end
				end
			end
		end

		local var_2_12 = NormalizeNumber(var_2_3, 0, Cac.MaxStatValue)

		if var_2_12 == arg_1_2.lastBaseValue and var_2_4 == arg_1_2.lastAttachmentsValue then
			return
		end

		arg_1_2.lastBaseValue = var_2_12
		arg_1_2.lastAttachmentsValue = var_2_4

		local var_2_13 = var_2_12 / Cac.MaxStatValue
		local var_2_14 = var_2_4 / Cac.MaxStatValue
		local var_2_15 = SWATCHES.CAC.weaponMeterMain

		if var_2_14 > 0 then
			var_2_15 = SWATCHES.CAC.weaponMeterBetter
		elseif var_2_14 < 0 then
			var_2_15 = SWATCHES.CAC.weaponMeterWorse
		end

		local var_2_16 = -1
		local var_2_17 = 1
		local var_2_18 = NormalizeNumber(var_2_13, var_2_16, var_2_17)
		local var_2_19 = var_2_18 + var_2_14
		local var_2_20 = NormalizeNumber(var_2_19, var_2_16, var_2_17) - var_2_18
		local var_2_21 = (var_2_12 + var_2_4) / Cac.MaxStatValue
		local var_2_22 = NormalizeNumber(var_2_21, var_2_16, var_2_17)

		arg_1_2.ProgressBar.BaseFill:SetRightAnchor(1 - var_2_18, 250)
		arg_1_2.ProgressBar.ArrowStub:SetRightAnchor(1 - var_2_22, 250)
		arg_1_2.ProgressBar.ArrowStub:SetLeftAnchor(var_2_22, 250)
		arg_1_2.ProgressBar.AttachmentsFill:SetRightAnchor(1 - var_2_18 - var_2_20, 250)
		arg_1_2.ProgressBar.AttachmentsFill:SetLeftAnchor(var_2_18, 250)
		arg_1_2.ProgressBar.AttachmentsFill:SetRGBFromTable(var_2_15, 0)
		arg_1_2.BaseValue:setText(var_2_12)
		arg_1_2.AttachmentValue:setText(var_2_4 ~= 0 and var_2_4 or "")
		arg_1_2.AttachmentValue:SetRGBFromTable(var_2_15, 0)
	end

	arg_1_2:SubscribeToModelThroughElement(arg_1_1, "weaponRef", var_1_0)

	if Engine.EAAHGICFBD() then
		arg_1_2:SubscribeToModelThroughElement(arg_1_1, "weaponLootID", var_1_0)
	end

	arg_1_2:SubscribeToModelThroughElement(arg_1_1, "attachmentOneRef", var_1_0)
	arg_1_2:SubscribeToModelThroughElement(arg_1_1, "attachmentTwoRef", var_1_0)
	arg_1_2:SubscribeToModelThroughElement(arg_1_1, "attachmentThreeRef", var_1_0)

	if Engine.EAAHGICFBD() then
		arg_1_2:SubscribeToModelThroughElement(arg_1_1, "attachmentFourRef", var_1_0)
		arg_1_2:SubscribeToModelThroughElement(arg_1_1, "attachmentFiveRef", var_1_0)

		if arg_1_1:GetDataSource().attachmentSixRef then
			arg_1_2:SubscribeToModelThroughElement(arg_1_1, "attachmentSixRef", var_1_0)
		end
	end
end

function NormalizeNumber(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0 < arg_3_1 then
		return arg_3_1
	elseif arg_3_2 < arg_3_0 then
		return arg_3_2
	end

	return arg_3_0
end

local function var_0_1(arg_4_0, arg_4_1)
	arg_4_0:SubscribeToDataSourceThroughElement(arg_4_0, nil, function()
		if not arg_4_0.setupStatsBars then
			var_0_0(arg_4_1, arg_4_0, arg_4_0.accuracyBar, "accuracy")
			var_0_0(arg_4_1, arg_4_0, arg_4_0.damageBar, "damage")
			var_0_0(arg_4_1, arg_4_0, arg_4_0.rangeBar, "range")
			var_0_0(arg_4_1, arg_4_0, arg_4_0.fireRateBar, "fireRate")
			var_0_0(arg_4_1, arg_4_0, arg_4_0.mobilityBar, "mobility")

			arg_4_0.setupStatsBars = true
		end
	end)
end

function WeaponStatsPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 86 * _1080p)

	var_6_0.id = "WeaponStatsPanel"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("WeaponStatsBar", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "mobilityBar"

	var_6_4.StatName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_MOBILITY")), 0)
	var_6_4.BaseValue:setText("999", 0)
	var_6_4.AttachmentValue:setText("999", 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, 0, _1080p * 68, _1080p * 88)
	var_6_0:addElement(var_6_4)

	var_6_0.mobilityBar = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("WeaponStatsBar", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "fireRateBar"

	var_6_6.StatName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_ROF")), 0)
	var_6_6.BaseValue:setText("999", 0)
	var_6_6.AttachmentValue:setText("999", 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, 0, _1080p * 51, _1080p * 71)
	var_6_0:addElement(var_6_6)

	var_6_0.fireRateBar = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("WeaponStatsBar", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "rangeBar"

	var_6_8.StatName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_RANGE")), 0)
	var_6_8.BaseValue:setText("999", 0)
	var_6_8.AttachmentValue:setText("999", 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, 0, _1080p * 34, _1080p * 54)
	var_6_0:addElement(var_6_8)

	var_6_0.rangeBar = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("WeaponStatsBar", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "damageBar"

	var_6_10.StatName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_DAMAGE")), 0)
	var_6_10.BaseValue:setText("999", 0)
	var_6_10.AttachmentValue:setText("999", 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, 0, _1080p * 17, _1080p * 37)
	var_6_0:addElement(var_6_10)

	var_6_0.damageBar = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("WeaponStatsBar", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "accuracyBar"

	var_6_12.StatName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_ACCURACY")), 0)
	var_6_12.BaseValue:setText("999", 0)
	var_6_12.AttachmentValue:setText("999", 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, 0, 0, _1080p * 20)
	var_6_0:addElement(var_6_12)

	var_6_0.accuracyBar = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "VerticalBar"

	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, 0, 0, _1080p * 86)
	var_6_0:addElement(var_6_14)

	var_6_0.VerticalBar = var_6_14

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WeaponStatsPanel", WeaponStatsPanel)
LockTable(_M)
