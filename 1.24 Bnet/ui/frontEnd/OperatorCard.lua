module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.OperatorName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_NAME", arg_1_1.fullName)))
	arg_1_0.OperatorIcon:setImage(RegisterMaterial(arg_1_1.bioImage))
	arg_1_0.Citizenship:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_CITIZENSHIP", arg_1_1.citizenship)))
	arg_1_0.FirstLanguage:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_FIRST_LANGUAGE", arg_1_1.firstLanguage)))
	arg_1_0.Status:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_STATUS", arg_1_1.status)))
	arg_1_0.Background:setText(Engine.CBBHFCGDIC("LUA_MENU/BIO_BACKGROUND", arg_1_1.background))

	local var_1_0 = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR, arg_1_1.ref)

	if var_1_0 and var_1_0 > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
		arg_1_0.Season:SetAlpha(1)
		arg_1_0.Season:UpdateSeasonText(var_1_0)
	else
		arg_1_0.Season:SetAlpha(0)
	end

	local var_1_1 = StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, arg_1_1.factionRef, CSV.FactionTable.cols.name)

	if tonumber(arg_1_1.superfaction) == OPERATOR.SuperFaction.WEST then
		arg_1_0.Faction:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_FACTION_DETAILS", "LUA_MENU/THE_WEST", var_1_1)))
	else
		arg_1_0.Faction:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BIO_FACTION_DETAILS", "LUA_MENU/THE_EAST", var_1_1)))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.OperatorName)
	assert(arg_2_0.Season)
	assert(arg_2_0.Citizenship)
	assert(arg_2_0.FirstLanguage)
	assert(arg_2_0.Background)
	assert(arg_2_0.Status)
	assert(arg_2_0.OperatorIcon)

	arg_2_0.SetupCardDetails = var_0_0

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "LargeText")
	end
end

function OperatorCard(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1628 * _1080p, 0, 248 * _1080p)

	var_3_0.id = "OperatorCard"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:setImage(RegisterMaterial("ui_operator_bio_box_description"), 0)
	var_3_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1276, 0, 0, _1080p * 248)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "OperatorIcon"

	var_3_6:SetColorOp(COLOR_OP.saturation, 0)
	var_3_6:SetColorOpParam(1, 0)
	var_3_6:setImage(RegisterMaterial("ui_operator_bio_east_bale_headshot"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 352, 0, _1080p * 248)
	var_3_0:addElement(var_3_6)

	var_3_0.OperatorIcon = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Season"

	var_3_8:SetScale(-0.1, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1476, _1080p * 1636, _1080p * -53, _1080p * -21)
	var_3_0:addElement(var_3_8)

	var_3_0.Season = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Faction"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:SetAlpha(0.6, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/FACTION_DETAILS"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -16, _1080p * 63, _1080p * 85)
	var_3_0:addElement(var_3_10)

	var_3_0.Faction = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Citizenship"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_12:SetAlpha(0.6, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CITIZENSHIP"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -594, _1080p * 110, _1080p * 132)
	var_3_0:addElement(var_3_12)

	var_3_0.Citizenship = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Background"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:SetAlpha(0.6, 0)
	var_3_14:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BACKGROUND")), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -72, _1080p * 151, _1080p * 173)
	var_3_0:addElement(var_3_14)

	var_3_0.Background = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "FirstLanguage"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_16:SetAlpha(0.6, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("LUA_MENU/FIRST_LANGUAGE"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -568, _1080p * -16, _1080p * 110, _1080p * 132)
	var_3_0:addElement(var_3_16)

	var_3_0.FirstLanguage = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "Status"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_18:SetAlpha(0.6, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU/STATUS"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -568, _1080p * -16, _1080p * 16, _1080p * 38)
	var_3_0:addElement(var_3_18)

	var_3_0.Status = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "OperatorName"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_20:SetAlpha(0.6, 0)
	var_3_20:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1260, _1080p * -594, _1080p * 16, _1080p * 38)
	var_3_0:addElement(var_3_20)

	var_3_0.OperatorName = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22
	local var_3_23 = {
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

	var_3_10:RegisterAnimationSequence("LargeText", var_3_23)

	local var_3_24 = {
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

	var_3_12:RegisterAnimationSequence("LargeText", var_3_24)

	local var_3_25 = {
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

	var_3_14:RegisterAnimationSequence("LargeText", var_3_25)

	local var_3_26 = {
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

	var_3_16:RegisterAnimationSequence("LargeText", var_3_26)

	local var_3_27 = {
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

	var_3_18:RegisterAnimationSequence("LargeText", var_3_27)

	local var_3_28 = {
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

	var_3_20:RegisterAnimationSequence("LargeText", var_3_28)

	local function var_3_29()
		var_3_10:AnimateSequence("LargeText")
		var_3_12:AnimateSequence("LargeText")
		var_3_14:AnimateSequence("LargeText")
		var_3_16:AnimateSequence("LargeText")
		var_3_18:AnimateSequence("LargeText")
		var_3_20:AnimateSequence("LargeText")
	end

	var_3_0._sequences.LargeText = var_3_29

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OperatorCard", OperatorCard)
LockTable(_M)
