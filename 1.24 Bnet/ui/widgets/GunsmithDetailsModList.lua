module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = #arg_1_1
	local var_1_1 = {}
	local var_1_2 = {}

	for iter_1_0 = 1, var_1_0 do
		local var_1_3 = arg_1_1[iter_1_0].name
		local var_1_4 = arg_1_1[iter_1_0].value

		if var_1_4 > 0 then
			table.insert(var_1_1, {
				name = var_1_3,
				value = var_1_4
			})
		elseif var_1_4 < 0 then
			table.insert(var_1_2, {
				name = var_1_3,
				value = var_1_4
			})
		end
	end

	table.sort(var_1_1, function(arg_2_0, arg_2_1)
		return arg_2_0.value > arg_2_1.value
	end)
	table.sort(var_1_2, function(arg_3_0, arg_3_1)
		return arg_3_0.value < arg_3_1.value
	end)

	local function var_1_5(arg_4_0, arg_4_1)
		if arg_4_0 then
			local var_4_0 = arg_4_0.name
			local var_4_1 = arg_4_0.value
			local var_4_2, var_4_3 = ATTACHMENT.GetAttachmentModifierString(var_4_0, var_4_1)

			arg_4_1:SetAlpha(1)
			arg_4_1.ModIcons:setText(var_4_2)
			arg_4_1.ModText:setText(var_4_3)
		else
			arg_4_1:SetAlpha(0)
		end
	end

	for iter_1_1 = 1, 4 do
		var_1_5(var_1_1[iter_1_1], arg_1_0._modifierWidgetsPro[iter_1_1])
		var_1_5(var_1_2[iter_1_1], arg_1_0._modifierWidgetsCon[iter_1_1])
	end
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetupMods = var_0_0
	arg_5_0._modifierWidgetsPro = {
		arg_5_0.Pro1,
		arg_5_0.Pro2,
		arg_5_0.Pro3,
		arg_5_0.Pro4
	}
	arg_5_0._modifierWidgetsCon = {
		arg_5_0.Con1,
		arg_5_0.Con2,
		arg_5_0.Con3,
		arg_5_0.Con4
	}
end

function GunsmithDetailsModList(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalStackedLayout.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 397 * _1080p, 0, 247 * _1080p)

	var_6_0.id = "GunsmithDetailsModList"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:SetSpacing(2 * _1080p)

	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "SpacerTop"

	var_6_4:SetAlpha(0, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 5)
	var_6_0:addElement(var_6_4)

	var_6_0.SpacerTop = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "ProModTitle"

	var_6_6:SetRGBFromTable(SWATCHES.CAC.weaponMeterBetter, 0)
	var_6_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROS")), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 356, _1080p * 7, _1080p * 31)
	var_6_0:addElement(var_6_6)

	var_6_0.ProModTitle = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Pro1"

	var_6_8:SetRGBFromTable(SWATCHES.CAC.weaponMeterBetter, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 33, _1080p * 53)
	var_6_0:addElement(var_6_8)

	var_6_0.Pro1 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Pro2"

	var_6_10:SetRGBFromTable(SWATCHES.CAC.weaponMeterBetter, 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 55, _1080p * 75)
	var_6_0:addElement(var_6_10)

	var_6_0.Pro2 = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Pro3"

	var_6_12:SetRGBFromTable(SWATCHES.CAC.weaponMeterBetter, 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 77, _1080p * 97)
	var_6_0:addElement(var_6_12)

	var_6_0.Pro3 = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Pro4"

	var_6_14:SetRGBFromTable(SWATCHES.CAC.weaponMeterBetter, 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 99, _1080p * 119)
	var_6_0:addElement(var_6_14)

	var_6_0.Pro4 = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "SpacerMid"

	var_6_16:SetAlpha(0, 0)
	var_6_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 121, _1080p * 126)
	var_6_0:addElement(var_6_16)

	var_6_0.SpacerMid = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIStyledText.new()

	var_6_18.id = "ConModTitle"

	var_6_18:SetRGBFromTable(SWATCHES.CAC.weaponMeterWorse, 0)
	var_6_18:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONS")), 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_18:SetAlignment(LUI.Alignment.Left)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 356, _1080p * 128, _1080p * 152)
	var_6_0:addElement(var_6_18)

	var_6_0.ConModTitle = var_6_18

	local var_6_19
	local var_6_20 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_20.id = "Con1"

	var_6_20:SetRGBFromTable(SWATCHES.CAC.weaponMeterWorse, 0)
	var_6_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 154, _1080p * 174)
	var_6_0:addElement(var_6_20)

	var_6_0.Con1 = var_6_20

	local var_6_21
	local var_6_22 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_22.id = "Con2"

	var_6_22:SetRGBFromTable(SWATCHES.CAC.weaponMeterWorse, 0)
	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 176, _1080p * 196)
	var_6_0:addElement(var_6_22)

	var_6_0.Con2 = var_6_22

	local var_6_23
	local var_6_24 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_24.id = "Con3"

	var_6_24:SetRGBFromTable(SWATCHES.CAC.weaponMeterWorse, 0)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 198, _1080p * 218)
	var_6_0:addElement(var_6_24)

	var_6_0.Con3 = var_6_24

	local var_6_25
	local var_6_26 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModifier", {
		controllerIndex = var_6_1
	})

	var_6_26.id = "Con4"

	var_6_26:SetRGBFromTable(SWATCHES.CAC.weaponMeterWorse, 0)
	var_6_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, _1080p * 220, _1080p * 240)
	var_6_0:addElement(var_6_26)

	var_6_0.Con4 = var_6_26

	local var_6_27
	local var_6_28 = LUI.UIImage.new()

	var_6_28.id = "SpacerBottom"

	var_6_28:SetAlpha(0, 0)
	var_6_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 242, _1080p * 247)
	var_6_0:addElement(var_6_28)

	var_6_0.SpacerBottom = var_6_28

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GunsmithDetailsModList", GunsmithDetailsModList)
LockTable(_M)
