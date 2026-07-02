module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.OperatorName:setText(ToUpperCase(arg_1_0.LanguageFormatBioEntry("LUA_MENU/BIO_NAME", arg_1_1.fullName)))
	arg_1_0.OperatorIcon:setImage(RegisterMaterial(arg_1_1.bioImage))
	arg_1_0.Citizenship:setText(ToUpperCase(arg_1_0.LanguageFormatBioEntry("LUA_MENU/BIO_CITIZENSHIP", arg_1_1.citizenship)))
	arg_1_0.FirstLanguage:setText(ToUpperCase(arg_1_0.LanguageFormatBioEntry("LUA_MENU/BIO_FIRST_LANGUAGE", arg_1_1.firstLanguage)))
	arg_1_0.Status:setText(ToUpperCase(arg_1_0.LanguageFormatBioEntry("LUA_MENU/BIO_STATUS", arg_1_1.status)))
	arg_1_0.Background:setText(arg_1_0.LanguageFormatBioEntry("LUA_MENU/BIO_BACKGROUND", arg_1_1.background))

	local var_1_0 = StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, arg_1_1.factionRef, CSV.FactionTable.cols.name)

	if OPERATOR.IsT9Operator(arg_1_1.ref) then
		arg_1_0.Faction:setText(ToUpperCase(arg_1_0.LanguageFormatBioEntry("LUA_MENU/BIO_FACTION_DETAILS_CW", var_1_0)))
	else
		local var_1_1 = tonumber(arg_1_1.superfaction) == OPERATOR.SuperFaction.WEST and "LUA_MENU/THE_WEST" or "LUA_MENU/THE_EAST"

		if IsLanguageArabic() then
			arg_1_0.Faction:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_0) .. "، " .. Engine.CBBHFCGDIC(var_1_1) .. " " .. arg_1_0.LocalizeARLabelWithoutPlaceTokens("LUA_MENU/BIO_FACTION_DETAILS")))
		else
			arg_1_0.Faction:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_FACTION_DETAILS", var_1_1, var_1_0)))
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if IsLanguageArabic() then
		local var_2_0 = string.gsub(Engine.CBBHFCGDIC(arg_2_0), "&&1", "")

		return Engine.CBBHFCGDIC(arg_2_1) .. var_2_0
	else
		return Engine.CBBHFCGDIC(arg_2_0, arg_2_1)
	end
end

local function var_0_2(arg_3_0)
	local var_3_0 = string.gsub(Engine.CBBHFCGDIC(arg_3_0), "&&1", "")
	local var_3_1 = string.gsub(var_3_0, "&&2", "")
	local var_3_2 = string.gsub(var_3_1, ", ", "")

	return (string.gsub(var_3_2, " ، ", ""))
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.OperatorName)
	assert(arg_4_0.Citizenship)
	assert(arg_4_0.FirstLanguage)
	assert(arg_4_0.Background)
	assert(arg_4_0.Status)
	assert(arg_4_0.OperatorIcon)

	arg_4_0.SetupCardDetails = var_0_0
	arg_4_0.LanguageFormatBioEntry = var_0_1
	arg_4_0.LocalizeARLabelWithoutPlaceTokens = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "LargeText")
	end
end

function OperatorCard(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1628 * _1080p, 0, 248 * _1080p)

	var_5_0.id = "OperatorCard"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Backer"

	var_5_4:setImage(RegisterMaterial("ui_operator_bio_box_description"), 0)
	var_5_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1276, 0, 0, _1080p * 248)
	var_5_0:addElement(var_5_4)

	var_5_0.Backer = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "OperatorIcon"

	var_5_6:SetColorOp(COLOR_OP.saturation, 0)
	var_5_6:SetColorOpParam(1, 0)
	var_5_6:setImage(RegisterMaterial("ui_operator_bio_east_bale_headshot"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 352, 0, _1080p * 248)
	var_5_0:addElement(var_5_6)

	var_5_0.OperatorIcon = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Faction"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_8:SetAlpha(0.6, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/FACTION_DETAILS"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -16, _1080p * 63, _1080p * 85)
	var_5_0:addElement(var_5_8)

	var_5_0.Faction = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Citizenship"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_10:SetAlpha(0.6, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("LUA_MENU/CITIZENSHIP"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -594, _1080p * 110, _1080p * 132)
	var_5_0:addElement(var_5_10)

	var_5_0.Citizenship = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Background"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_12:SetAlpha(0.6, 0)
	var_5_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BACKGROUND")), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -72, _1080p * 151, _1080p * 173)
	var_5_0:addElement(var_5_12)

	var_5_0.Background = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "FirstLanguage"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_14:SetAlpha(0.6, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("LUA_MENU/FIRST_LANGUAGE"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -568, _1080p * -16, _1080p * 110, _1080p * 132)
	var_5_0:addElement(var_5_14)

	var_5_0.FirstLanguage = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Status"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_16:SetAlpha(0.6, 0)
	var_5_16:setText(Engine.CBBHFCGDIC("LUA_MENU/STATUS"), 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -568, _1080p * -16, _1080p * 16, _1080p * 38)
	var_5_0:addElement(var_5_16)

	var_5_0.Status = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "OperatorName"

	var_5_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_18:SetAlpha(0.6, 0)
	var_5_18:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -594, _1080p * 16, _1080p * 38)
	var_5_0:addElement(var_5_18)

	var_5_0.OperatorName = var_5_18

	local function var_5_19()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_5_8:RegisterAnimationSequence("LargeText", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 133
		}
	}

	var_5_10:RegisterAnimationSequence("LargeText", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 182
		}
	}

	var_5_12:RegisterAnimationSequence("LargeText", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 133
		}
	}

	var_5_14:RegisterAnimationSequence("LargeText", var_5_24)

	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_5_16:RegisterAnimationSequence("LargeText", var_5_25)

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_5_18:RegisterAnimationSequence("LargeText", var_5_26)

	local function var_5_27()
		var_5_8:AnimateSequence("LargeText")
		var_5_10:AnimateSequence("LargeText")
		var_5_12:AnimateSequence("LargeText")
		var_5_14:AnimateSequence("LargeText")
		var_5_16:AnimateSequence("LargeText")
		var_5_18:AnimateSequence("LargeText")
	end

	var_5_0._sequences.LargeText = var_5_27

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("OperatorCard", OperatorCard)
LockTable(_M)
