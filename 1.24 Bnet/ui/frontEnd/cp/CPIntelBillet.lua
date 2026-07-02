module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.headshotImage)
	local var_1_1 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.faction)
	local var_1_2 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.header1)
	local var_1_3 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.header2)
	local var_1_4 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.header3)
	local var_1_5 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.header4)
	local var_1_6 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.name)
	local var_1_7 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.codeName)
	local var_1_8 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.aliases)
	local var_1_9 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.nationality)
	local var_1_10 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.dob)
	local var_1_11 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.gender)
	local var_1_12 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.laterality)
	local var_1_13 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.height)
	local var_1_14 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.weight)
	local var_1_15 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.vision)
	local var_1_16 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.blood)
	local var_1_17 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.eyeColor)
	local var_1_18 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.hairColor)
	local var_1_19 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.relatives)
	local var_1_20 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.languages)
	local var_1_21 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.maritalStatus)
	local var_1_22 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.children)
	local var_1_23 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.specialistFields)
	local var_1_24 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.history)
	local var_1_25 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.associations)
	local var_1_26 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.directive)
	local var_1_27 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.footerLeft)
	local var_1_28 = StringTable.DIFCHIGDFB(CSV.cpIntelBillet.file, CSV.cpIntelBillet.cols.ref, arg_1_1, CSV.cpIntelBillet.cols.footerRight)

	arg_1_0.Header1Text:setText(Engine.CBBHFCGDIC(var_1_2), 0)
	arg_1_0.Header2Text:setText(Engine.CBBHFCGDIC(var_1_3), 0)
	arg_1_0.Header3Text:setText(Engine.CBBHFCGDIC(var_1_4), 0)
	arg_1_0.Header4Text:setText(Engine.CBBHFCGDIC(var_1_5), 0)
	arg_1_0.NameText:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_6), 0))
	arg_1_0.CodeNameText:setText(Engine.CBBHFCGDIC(var_1_7), 0)
	arg_1_0.AliasText:setText(Engine.CBBHFCGDIC(var_1_8), 0)
	arg_1_0.DOBText:setText(Engine.CBBHFCGDIC(var_1_10), 0)
	arg_1_0.GenderText:setText(Engine.CBBHFCGDIC(var_1_11))
	arg_1_0.NationalityText:setText(Engine.CBBHFCGDIC(var_1_9), 0)
	arg_1_0.LateralityText:setText(Engine.CBBHFCGDIC(var_1_12), 0)
	arg_1_0.HeightText:setText(Engine.CBBHFCGDIC(var_1_13), 0)
	arg_1_0.WeightText:setText(Engine.CBBHFCGDIC(var_1_14), 0)
	arg_1_0.VisionText:setText(Engine.CBBHFCGDIC(var_1_15), 0)
	arg_1_0.BloodText:setText(Engine.CBBHFCGDIC(var_1_16), 0)
	arg_1_0.EyeText:setText(Engine.CBBHFCGDIC(var_1_17), 0)
	arg_1_0.HairText:setText(Engine.CBBHFCGDIC(var_1_18), 0)
	arg_1_0.RelativesText:setText(Engine.CBBHFCGDIC(var_1_19), 0)
	arg_1_0.LanguagesText:setText(Engine.CBBHFCGDIC(var_1_20), 0)
	arg_1_0.MaritalText:setText(Engine.CBBHFCGDIC(var_1_21), 0)
	arg_1_0.ChildrenText:setText(Engine.CBBHFCGDIC(var_1_22), 0)
	arg_1_0.SpecialistText:setText(Engine.CBBHFCGDIC(var_1_23), 0)
	arg_1_0.HistoryText.Text:setText(Engine.CBBHFCGDIC(var_1_24), 0)
	arg_1_0.AssociationsText.Text:setText(Engine.CBBHFCGDIC(var_1_25), 0)
	arg_1_0.DirectiveText.Text:setText(Engine.CBBHFCGDIC(var_1_26), 0)
	arg_1_0.FooterLeftText:setText(Engine.CBBHFCGDIC(var_1_27), 0)
	arg_1_0.FooterRightText:setText(Engine.CBBHFCGDIC(var_1_28), 0)
	arg_1_0.CPIntelBilletTemplate.headshotImage:setImage(RegisterMaterial(var_1_0), 0)

	if var_1_1 == "allies" then
		ACTIONS.AnimateSequence(arg_1_0, "Coalition")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Allegiance")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Update = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_2_0, "KORZHJP")
	end
end

function CPIntelBillet(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CPIntelBillet"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("CPIntelBilletTemplate", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "CPIntelBilletTemplate"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_3_0:addElement(var_3_4)

	var_3_0.CPIntelBilletTemplate = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "AliasTitle"

	var_3_6.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_ALIASES_TITLE")), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1662, _1080p * 260, _1080p * 280)
	var_3_0:addElement(var_3_6)

	var_3_0.AliasTitle = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "DOBTitle"

	var_3_8.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_DOB_TITLE")), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1662, _1080p * 299, _1080p * 319)
	var_3_0:addElement(var_3_8)

	var_3_0.DOBTitle = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "CodeNameTitle"

	var_3_10.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_CODENAME_TITLE")), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1662, _1080p * 221, _1080p * 241)
	var_3_0:addElement(var_3_10)

	var_3_0.CodeNameTitle = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "NameTitle"

	var_3_12.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_NAME_TITLE")), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1662, _1080p * 182, _1080p * 202)
	var_3_0:addElement(var_3_12)

	var_3_0.NameTitle = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "GenderTitle"

	var_3_14.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_GENDER_TITLE")), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1440, _1080p * 338, _1080p * 358)
	var_3_0:addElement(var_3_14)

	var_3_0.GenderTitle = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "NationalityTitle"

	var_3_16.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_NATIONALITY_TITLE")), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1445, _1080p * 1664, _1080p * 338, _1080p * 358)
	var_3_0:addElement(var_3_16)

	var_3_0.NationalityTitle = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "LateralityTitle"

	var_3_18.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_LATERALITY_TITLE")), 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1662, _1080p * 377, _1080p * 397)
	var_3_0:addElement(var_3_18)

	var_3_0.LateralityTitle = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "HeightTitle"

	var_3_20.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_HEIGHT_TITLE")), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1410, _1080p * 416, _1080p * 436)
	var_3_0:addElement(var_3_20)

	var_3_0.HeightTitle = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "WeightTitle"

	var_3_22.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_WEIGHT_TITLE")), 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1416, _1080p * 1493, _1080p * 416, _1080p * 436)
	var_3_0:addElement(var_3_22)

	var_3_0.WeightTitle = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "VisionTitle"

	var_3_24.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_VISION_TITLE")), 0)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1498, _1080p * 1563, _1080p * 416, _1080p * 436)
	var_3_0:addElement(var_3_24)

	var_3_0.VisionTitle = var_3_24

	local var_3_25
	local var_3_26 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_26.id = "BloodTitle"

	var_3_26.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_BLOOD_TITLE")), 0)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1568, _1080p * 1664, _1080p * 416, _1080p * 436)
	var_3_0:addElement(var_3_26)

	var_3_0.BloodTitle = var_3_26

	local var_3_27
	local var_3_28 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_28.id = "RelativesTitle"

	var_3_28.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_RELATIVES_TITLE")), 0)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1343, _1080p * 456, _1080p * 476)
	var_3_0:addElement(var_3_28)

	var_3_0.RelativesTitle = var_3_28

	local var_3_29
	local var_3_30 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_30.id = "EyeTitle"

	var_3_30.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_EYECOLOR_TITLE")), 0)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1050, _1080p * 512, _1080p * 532)
	var_3_0:addElement(var_3_30)

	var_3_0.EyeTitle = var_3_30

	local var_3_31
	local var_3_32 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_32.id = "HairTitle"

	var_3_32.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_HAIR_TITLE")), 0)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1057, _1080p * 1182, _1080p * 512, _1080p * 532)
	var_3_0:addElement(var_3_32)

	var_3_0.HairTitle = var_3_32

	local var_3_33
	local var_3_34 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_34.id = "LanguagesTitle"

	var_3_34.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_LANGUAGES_TITLE")), 0)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1190, _1080p * 1335, _1080p * 512, _1080p * 532)
	var_3_0:addElement(var_3_34)

	var_3_0.LanguagesTitle = var_3_34

	local var_3_35
	local var_3_36 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_36.id = "MartialTitle"

	var_3_36.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_MARITALSTATUS_TITLE")), 0)
	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1498, _1080p * 1646, _1080p * 456, _1080p * 476)
	var_3_0:addElement(var_3_36)

	var_3_0.MartialTitle = var_3_36

	local var_3_37
	local var_3_38 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_38.id = "ChildrenTitle"

	var_3_38.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_CHILDERN_TITLE")), 0)
	var_3_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1498, _1080p * 1659, _1080p * 512, _1080p * 532)
	var_3_0:addElement(var_3_38)

	var_3_0.ChildrenTitle = var_3_38

	local var_3_39
	local var_3_40 = MenuBuilder.BuildRegisteredType("BilletTitle", {
		controllerIndex = var_3_1
	})

	var_3_40.id = "SpecialistTitle"

	var_3_40.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_SPECIALIST_TITLE")), 0)
	var_3_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 957, _1080p * 1345, _1080p * 552, _1080p * 572)
	var_3_0:addElement(var_3_40)

	var_3_0.SpecialistTitle = var_3_40

	local var_3_41
	local var_3_42 = LUI.UIStyledText.new()

	var_3_42.id = "FooterRightText"

	var_3_42:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_42:SetAlpha(0, 0)
	var_3_42:setText(ToUpperCase(""), 0)
	var_3_42:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_42:SetAlignment(LUI.Alignment.Right)
	var_3_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1369, _1080p * 1662, _1080p * 953, _1080p * 971)
	var_3_0:addElement(var_3_42)

	var_3_0.FooterRightText = var_3_42

	local var_3_43
	local var_3_44 = LUI.UIImage.new()

	var_3_44.id = "AllegianceIconLarge"

	var_3_44:SetAlpha(0.08, 0)
	var_3_44:SetScale(-0.49, 0)
	var_3_44:setImage(RegisterMaterial("icon_faction_east_large"), 0)
	var_3_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1339, _1080p * 1851, _1080p * -112, _1080p * 400)
	var_3_0:addElement(var_3_44)

	var_3_0.AllegianceIconLarge = var_3_44

	local var_3_45
	local var_3_46 = LUI.UIImage.new()

	var_3_46.id = "AllegianceIcon"

	var_3_46:SetScale(-0.23, 0)
	var_3_46:setImage(RegisterMaterial("icon_faction_east_large"), 0)
	var_3_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1531, _1080p * 1659, _1080p * 70, _1080p * 198)
	var_3_0:addElement(var_3_46)

	var_3_0.AllegianceIcon = var_3_46

	local var_3_47
	local var_3_48 = LUI.UIImage.new()

	var_3_48.id = "CoalitionIconLarge"

	var_3_48:SetAlpha(0.08, 0)
	var_3_48:SetScale(-0.49, 0)
	var_3_48:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_3_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1339, _1080p * 1851, _1080p * -123, _1080p * 389)
	var_3_0:addElement(var_3_48)

	var_3_0.CoalitionIconLarge = var_3_48

	local var_3_49
	local var_3_50 = LUI.UIImage.new()

	var_3_50.id = "CoalitionIcon"

	var_3_50:SetScale(-0.23, 0)
	var_3_50:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_3_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1531, _1080p * 1659, _1080p * 64, _1080p * 192)
	var_3_0:addElement(var_3_50)

	var_3_0.CoalitionIcon = var_3_50

	local var_3_51
	local var_3_52 = LUI.UIStyledText.new()

	var_3_52.id = "TopHeader"

	var_3_52:setText(ToUpperCase(""), 0)
	var_3_52:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_52:SetAlignment(LUI.Alignment.Left)
	var_3_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 947, _1080p * 1672, _1080p * 54, _1080p * 74)
	var_3_0:addElement(var_3_52)

	var_3_0.TopHeader = var_3_52

	local var_3_53
	local var_3_54 = LUI.UIStyledText.new()

	var_3_54.id = "NameText"

	var_3_54:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_54:setText("", 0)
	var_3_54:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_54:SetAlignment(LUI.Alignment.Left)
	var_3_54:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_54:SetStartupDelay(1000)
	var_3_54:SetLineHoldTime(400)
	var_3_54:SetAnimMoveTime(150)
	var_3_54:SetAnimMoveSpeed(50)
	var_3_54:SetEndDelay(1000)
	var_3_54:SetCrossfadeTime(400)
	var_3_54:SetFadeInTime(300)
	var_3_54:SetFadeOutTime(300)
	var_3_54:SetMaxVisibleLines(1)
	var_3_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1663, _1080p * 202, _1080p * 220)
	var_3_0:addElement(var_3_54)

	var_3_0.NameText = var_3_54

	local var_3_55
	local var_3_56 = LUI.UIStyledText.new()

	var_3_56.id = "CodeNameText"

	var_3_56:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_56:setText("", 0)
	var_3_56:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_56:SetAlignment(LUI.Alignment.Left)
	var_3_56:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_56:SetStartupDelay(1000)
	var_3_56:SetLineHoldTime(400)
	var_3_56:SetAnimMoveTime(150)
	var_3_56:SetAnimMoveSpeed(50)
	var_3_56:SetEndDelay(1000)
	var_3_56:SetCrossfadeTime(400)
	var_3_56:SetFadeInTime(300)
	var_3_56:SetFadeOutTime(300)
	var_3_56:SetMaxVisibleLines(1)
	var_3_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1663, _1080p * 241, _1080p * 259)
	var_3_0:addElement(var_3_56)

	var_3_0.CodeNameText = var_3_56

	local var_3_57
	local var_3_58 = LUI.UIStyledText.new()

	var_3_58.id = "AliasText"

	var_3_58:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_58:setText("", 0)
	var_3_58:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_58:SetAlignment(LUI.Alignment.Left)
	var_3_58:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_58:SetStartupDelay(1000)
	var_3_58:SetLineHoldTime(400)
	var_3_58:SetAnimMoveTime(150)
	var_3_58:SetAnimMoveSpeed(50)
	var_3_58:SetEndDelay(1000)
	var_3_58:SetCrossfadeTime(400)
	var_3_58:SetFadeInTime(300)
	var_3_58:SetFadeOutTime(300)
	var_3_58:SetMaxVisibleLines(1)
	var_3_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1663, _1080p * 280, _1080p * 298)
	var_3_0:addElement(var_3_58)

	var_3_0.AliasText = var_3_58

	local var_3_59
	local var_3_60 = LUI.UIStyledText.new()

	var_3_60.id = "DOBText"

	var_3_60:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_60:setText("", 0)
	var_3_60:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_60:SetAlignment(LUI.Alignment.Left)
	var_3_60:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_60:SetStartupDelay(1000)
	var_3_60:SetLineHoldTime(400)
	var_3_60:SetAnimMoveTime(150)
	var_3_60:SetAnimMoveSpeed(50)
	var_3_60:SetEndDelay(1000)
	var_3_60:SetCrossfadeTime(400)
	var_3_60:SetFadeInTime(300)
	var_3_60:SetFadeOutTime(300)
	var_3_60:SetMaxVisibleLines(1)
	var_3_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1663, _1080p * 319, _1080p * 337)
	var_3_0:addElement(var_3_60)

	var_3_0.DOBText = var_3_60

	local var_3_61
	local var_3_62 = LUI.UIStyledText.new()

	var_3_62.id = "GenderText"

	var_3_62:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_62:setText("", 0)
	var_3_62:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_62:SetAlignment(LUI.Alignment.Left)
	var_3_62:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_62:SetStartupDelay(1000)
	var_3_62:SetLineHoldTime(400)
	var_3_62:SetAnimMoveTime(150)
	var_3_62:SetAnimMoveSpeed(50)
	var_3_62:SetEndDelay(1000)
	var_3_62:SetCrossfadeTime(400)
	var_3_62:SetFadeInTime(300)
	var_3_62:SetFadeOutTime(300)
	var_3_62:SetMaxVisibleLines(1)
	var_3_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1440, _1080p * 358, _1080p * 376)
	var_3_0:addElement(var_3_62)

	var_3_0.GenderText = var_3_62

	local var_3_63
	local var_3_64 = LUI.UIStyledText.new()

	var_3_64.id = "NationalityText"

	var_3_64:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_64:setText("", 0)
	var_3_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_64:SetAlignment(LUI.Alignment.Left)
	var_3_64:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_64:SetStartupDelay(1000)
	var_3_64:SetLineHoldTime(400)
	var_3_64:SetAnimMoveTime(150)
	var_3_64:SetAnimMoveSpeed(50)
	var_3_64:SetEndDelay(1000)
	var_3_64:SetCrossfadeTime(400)
	var_3_64:SetFadeInTime(300)
	var_3_64:SetFadeOutTime(300)
	var_3_64:SetMaxVisibleLines(1)
	var_3_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1445, _1080p * 1662, _1080p * 358, _1080p * 376)
	var_3_0:addElement(var_3_64)

	var_3_0.NationalityText = var_3_64

	local var_3_65
	local var_3_66 = LUI.UIStyledText.new()

	var_3_66.id = "LateralityText"

	var_3_66:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_66:setText("", 0)
	var_3_66:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_66:SetAlignment(LUI.Alignment.Left)
	var_3_66:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_66:SetStartupDelay(1000)
	var_3_66:SetLineHoldTime(400)
	var_3_66:SetAnimMoveTime(150)
	var_3_66:SetAnimMoveSpeed(50)
	var_3_66:SetEndDelay(1000)
	var_3_66:SetCrossfadeTime(400)
	var_3_66:SetFadeInTime(300)
	var_3_66:SetFadeOutTime(300)
	var_3_66:SetMaxVisibleLines(1)
	var_3_66:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1662, _1080p * 397, _1080p * 415)
	var_3_0:addElement(var_3_66)

	var_3_0.LateralityText = var_3_66

	local var_3_67
	local var_3_68 = LUI.UIStyledText.new()

	var_3_68.id = "HeightText"

	var_3_68:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_68:setText("", 0)
	var_3_68:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_68:SetAlignment(LUI.Alignment.Left)
	var_3_68:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_68:SetStartupDelay(1000)
	var_3_68:SetLineHoldTime(400)
	var_3_68:SetAnimMoveTime(150)
	var_3_68:SetAnimMoveSpeed(50)
	var_3_68:SetEndDelay(1000)
	var_3_68:SetCrossfadeTime(400)
	var_3_68:SetFadeInTime(300)
	var_3_68:SetFadeOutTime(300)
	var_3_68:SetMaxVisibleLines(1)
	var_3_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1410, _1080p * 436, _1080p * 454)
	var_3_0:addElement(var_3_68)

	var_3_0.HeightText = var_3_68

	local var_3_69
	local var_3_70 = LUI.UIStyledText.new()

	var_3_70.id = "WeightText"

	var_3_70:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_70:setText("", 0)
	var_3_70:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_70:SetAlignment(LUI.Alignment.Left)
	var_3_70:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_70:SetStartupDelay(1000)
	var_3_70:SetLineHoldTime(400)
	var_3_70:SetAnimMoveTime(150)
	var_3_70:SetAnimMoveSpeed(50)
	var_3_70:SetEndDelay(1000)
	var_3_70:SetCrossfadeTime(400)
	var_3_70:SetFadeInTime(300)
	var_3_70:SetFadeOutTime(300)
	var_3_70:SetMaxVisibleLines(1)
	var_3_70:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1415, _1080p * 1481, _1080p * 436, _1080p * 454)
	var_3_0:addElement(var_3_70)

	var_3_0.WeightText = var_3_70

	local var_3_71
	local var_3_72 = LUI.UIStyledText.new()

	var_3_72.id = "VisionText"

	var_3_72:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_72:setText("", 0)
	var_3_72:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_72:SetAlignment(LUI.Alignment.Left)
	var_3_72:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_72:SetStartupDelay(1000)
	var_3_72:SetLineHoldTime(400)
	var_3_72:SetAnimMoveTime(150)
	var_3_72:SetAnimMoveSpeed(50)
	var_3_72:SetEndDelay(1000)
	var_3_72:SetCrossfadeTime(400)
	var_3_72:SetFadeInTime(300)
	var_3_72:SetFadeOutTime(300)
	var_3_72:SetMaxVisibleLines(1)
	var_3_72:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1497, _1080p * 1563, _1080p * 436, _1080p * 454)
	var_3_0:addElement(var_3_72)

	var_3_0.VisionText = var_3_72

	local var_3_73
	local var_3_74 = LUI.UIStyledText.new()

	var_3_74.id = "BloodText"

	var_3_74:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_74:setText("", 0)
	var_3_74:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_74:SetAlignment(LUI.Alignment.Left)
	var_3_74:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_74:SetStartupDelay(1000)
	var_3_74:SetLineHoldTime(400)
	var_3_74:SetAnimMoveTime(150)
	var_3_74:SetAnimMoveSpeed(50)
	var_3_74:SetEndDelay(1000)
	var_3_74:SetCrossfadeTime(400)
	var_3_74:SetFadeInTime(300)
	var_3_74:SetFadeOutTime(300)
	var_3_74:SetMaxVisibleLines(1)
	var_3_74:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1566, _1080p * 1659, _1080p * 436, _1080p * 454)
	var_3_0:addElement(var_3_74)

	var_3_0.BloodText = var_3_74

	local var_3_75
	local var_3_76 = LUI.UIStyledText.new()

	var_3_76.id = "RelativesText"

	var_3_76:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_76:setText("", 0)
	var_3_76:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_76:SetAlignment(LUI.Alignment.Left)
	var_3_76:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_76:SetStartupDelay(1000)
	var_3_76:SetLineHoldTime(400)
	var_3_76:SetAnimMoveTime(150)
	var_3_76:SetAnimMoveSpeed(50)
	var_3_76:SetEndDelay(1000)
	var_3_76:SetCrossfadeTime(400)
	var_3_76:SetFadeInTime(300)
	var_3_76:SetFadeOutTime(300)
	var_3_76:SetMaxVisibleLines(2)
	var_3_76:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1493, _1080p * 475, _1080p * 493)
	var_3_0:addElement(var_3_76)

	var_3_0.RelativesText = var_3_76

	local var_3_77
	local var_3_78 = LUI.UIStyledText.new()

	var_3_78.id = "MaritalText"

	var_3_78:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_78:setText("", 0)
	var_3_78:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_78:SetAlignment(LUI.Alignment.Left)
	var_3_78:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_78:SetStartupDelay(1000)
	var_3_78:SetLineHoldTime(400)
	var_3_78:SetAnimMoveTime(150)
	var_3_78:SetAnimMoveSpeed(50)
	var_3_78:SetEndDelay(1000)
	var_3_78:SetCrossfadeTime(400)
	var_3_78:SetFadeInTime(300)
	var_3_78:SetFadeOutTime(300)
	var_3_78:SetMaxVisibleLines(2)
	var_3_78:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1497, _1080p * 1662, _1080p * 476, _1080p * 494)
	var_3_0:addElement(var_3_78)

	var_3_0.MaritalText = var_3_78

	local var_3_79
	local var_3_80 = LUI.UIStyledText.new()

	var_3_80.id = "ChildrenText"

	var_3_80:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_80:setText("", 0)
	var_3_80:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_80:SetAlignment(LUI.Alignment.Left)
	var_3_80:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_80:SetStartupDelay(1000)
	var_3_80:SetLineHoldTime(400)
	var_3_80:SetAnimMoveTime(150)
	var_3_80:SetAnimMoveSpeed(50)
	var_3_80:SetEndDelay(1000)
	var_3_80:SetCrossfadeTime(400)
	var_3_80:SetFadeInTime(300)
	var_3_80:SetFadeOutTime(300)
	var_3_80:SetMaxVisibleLines(1)
	var_3_80:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1497, _1080p * 1662, _1080p * 532, _1080p * 550)
	var_3_0:addElement(var_3_80)

	var_3_0.ChildrenText = var_3_80

	local var_3_81
	local var_3_82 = LUI.UIStyledText.new()

	var_3_82.id = "EyeText"

	var_3_82:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_82:setText("", 0)
	var_3_82:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_82:SetAlignment(LUI.Alignment.Left)
	var_3_82:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_82:SetStartupDelay(1000)
	var_3_82:SetLineHoldTime(400)
	var_3_82:SetAnimMoveTime(150)
	var_3_82:SetAnimMoveSpeed(50)
	var_3_82:SetEndDelay(1000)
	var_3_82:SetCrossfadeTime(400)
	var_3_82:SetFadeInTime(300)
	var_3_82:SetFadeOutTime(300)
	var_3_82:SetMaxVisibleLines(1)
	var_3_82:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1055, _1080p * 532, _1080p * 550)
	var_3_0:addElement(var_3_82)

	var_3_0.EyeText = var_3_82

	local var_3_83
	local var_3_84 = LUI.UIStyledText.new()

	var_3_84.id = "HairText"

	var_3_84:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_84:setText("", 0)
	var_3_84:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_84:SetAlignment(LUI.Alignment.Left)
	var_3_84:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_84:SetStartupDelay(1000)
	var_3_84:SetLineHoldTime(400)
	var_3_84:SetAnimMoveTime(150)
	var_3_84:SetAnimMoveSpeed(50)
	var_3_84:SetEndDelay(1000)
	var_3_84:SetCrossfadeTime(400)
	var_3_84:SetFadeInTime(300)
	var_3_84:SetFadeOutTime(300)
	var_3_84:SetMaxVisibleLines(1)
	var_3_84:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1057, _1080p * 1182, _1080p * 532, _1080p * 550)
	var_3_0:addElement(var_3_84)

	var_3_0.HairText = var_3_84

	local var_3_85
	local var_3_86 = LUI.UIStyledText.new()

	var_3_86.id = "LanguagesText"

	var_3_86:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_86:setText("", 0)
	var_3_86:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_86:SetAlignment(LUI.Alignment.Left)
	var_3_86:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_86:SetStartupDelay(1000)
	var_3_86:SetLineHoldTime(400)
	var_3_86:SetAnimMoveTime(150)
	var_3_86:SetAnimMoveSpeed(50)
	var_3_86:SetEndDelay(1000)
	var_3_86:SetCrossfadeTime(400)
	var_3_86:SetFadeInTime(300)
	var_3_86:SetFadeOutTime(300)
	var_3_86:SetMaxVisibleLines(1)
	var_3_86:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1190, _1080p * 1493, _1080p * 532, _1080p * 550)
	var_3_0:addElement(var_3_86)

	var_3_0.LanguagesText = var_3_86

	local var_3_87
	local var_3_88 = LUI.UIStyledText.new()

	var_3_88.id = "SpecialistText"

	var_3_88:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_88:setText("", 0)
	var_3_88:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_88:SetAlignment(LUI.Alignment.Left)
	var_3_88:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_88:SetStartupDelay(1000)
	var_3_88:SetLineHoldTime(400)
	var_3_88:SetAnimMoveTime(150)
	var_3_88:SetAnimMoveSpeed(50)
	var_3_88:SetEndDelay(1000)
	var_3_88:SetCrossfadeTime(400)
	var_3_88:SetFadeInTime(300)
	var_3_88:SetFadeOutTime(300)
	var_3_88:SetMaxVisibleLines(2)
	var_3_88:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1659, _1080p * 571, _1080p * 589)
	var_3_0:addElement(var_3_88)

	var_3_0.SpecialistText = var_3_88

	local var_3_89
	local var_3_90 = LUI.UIStyledText.new()

	var_3_90.id = "FooterLeftText"

	var_3_90:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_90:SetAlpha(0, 0)
	var_3_90:setText("", 0)
	var_3_90:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_90:SetAlignment(LUI.Alignment.Left)
	var_3_90:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1274, _1080p * 953, _1080p * 971)
	var_3_0:addElement(var_3_90)

	var_3_0.FooterLeftText = var_3_90

	local var_3_91
	local var_3_92 = LUI.UIImage.new()

	var_3_92.id = "BarHistory"

	var_3_92:SetRGBFromInt(1907997, 0)
	var_3_92:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1665, _1080p * 615, _1080p * 772)
	var_3_0:addElement(var_3_92)

	var_3_0.BarHistory = var_3_92

	local var_3_93
	local var_3_94 = MenuBuilder.BuildRegisteredType("BilletData", {
		controllerIndex = var_3_1
	})

	var_3_94.id = "HistoryText"

	var_3_94.Text:setText("", 0)
	var_3_94.Text:SetAlignment(LUI.Alignment.Left)
	var_3_94.Text:SetStartupDelay(3000)
	var_3_94.Text:SetLineHoldTime(2000)
	var_3_94.Text:SetEndDelay(5000)
	var_3_94.Text:SetMaxVisibleLines(8)
	var_3_94:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1664, _1080p * 631, _1080p * 649)
	var_3_0:addElement(var_3_94)

	var_3_0.HistoryText = var_3_94

	local var_3_95
	local var_3_96 = MenuBuilder.BuildRegisteredType("BilletSubTitle", {
		controllerIndex = var_3_1
	})

	var_3_96.id = "HistorySubTitle"

	var_3_96.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_HISTORY_TITLE")), 0)
	var_3_96:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 953, _1080p * 1644, _1080p * 613, _1080p * 633)
	var_3_0:addElement(var_3_96)

	var_3_0.HistorySubTitle = var_3_96

	local var_3_97
	local var_3_98 = LUI.UIImage.new()

	var_3_98.id = "BarAssociations"

	var_3_98:SetRGBFromInt(1907997, 0)
	var_3_98:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1665, _1080p * 777, _1080p * 876)
	var_3_0:addElement(var_3_98)

	var_3_0.BarAssociations = var_3_98

	local var_3_99
	local var_3_100 = MenuBuilder.BuildRegisteredType("BilletData", {
		controllerIndex = var_3_1
	})

	var_3_100.id = "AssociationsText"

	var_3_100.Text:setText("", 0)
	var_3_100.Text:SetAlignment(LUI.Alignment.Left)
	var_3_100.Text:SetStartupDelay(3000)
	var_3_100.Text:SetLineHoldTime(2000)
	var_3_100.Text:SetEndDelay(5000)
	var_3_100.Text:SetMaxVisibleLines(5)
	var_3_100:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1664, _1080p * 793, _1080p * 811)
	var_3_0:addElement(var_3_100)

	var_3_0.AssociationsText = var_3_100

	local var_3_101
	local var_3_102 = MenuBuilder.BuildRegisteredType("BilletSubTitle", {
		controllerIndex = var_3_1
	})

	var_3_102.id = "AssociationsSubTitle"

	var_3_102.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_ASSOCIATIONS_TITLE")), 0)
	var_3_102:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 953, _1080p * 1644, _1080p * 775, _1080p * 795)
	var_3_0:addElement(var_3_102)

	var_3_0.AssociationsSubTitle = var_3_102

	local var_3_103
	local var_3_104 = LUI.UIImage.new()

	var_3_104.id = "BarDirective"

	var_3_104:SetRGBFromInt(1907997, 0)
	var_3_104:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1665, _1080p * 881, _1080p * 944)
	var_3_0:addElement(var_3_104)

	var_3_0.BarDirective = var_3_104

	local var_3_105
	local var_3_106 = MenuBuilder.BuildRegisteredType("BilletData", {
		controllerIndex = var_3_1
	})

	var_3_106.id = "DirectiveText"

	var_3_106.Text:setText("", 0)
	var_3_106.Text:SetAlignment(LUI.Alignment.Left)
	var_3_106.Text:SetStartupDelay(3000)
	var_3_106.Text:SetLineHoldTime(2000)
	var_3_106.Text:SetEndDelay(5000)
	var_3_106.Text:SetMaxVisibleLines(2)
	var_3_106:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 955, _1080p * 1664, _1080p * 897, _1080p * 915)
	var_3_0:addElement(var_3_106)

	var_3_0.DirectiveText = var_3_106

	local var_3_107
	local var_3_108 = MenuBuilder.BuildRegisteredType("BilletSubTitle", {
		controllerIndex = var_3_1
	})

	var_3_108.id = "DirectiveSubTitle"

	var_3_108.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_DIRECTIVE_TITLE")), 0)
	var_3_108:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 953, _1080p * 1644, _1080p * 879, _1080p * 897)
	var_3_0:addElement(var_3_108)

	var_3_0.DirectiveSubTitle = var_3_108

	local var_3_109
	local var_3_110 = LUI.UIStyledText.new()

	var_3_110.id = "Header1Text"

	var_3_110:SetRGBFromInt(14934750, 0)
	var_3_110:SetAlpha(0.8, 0)
	var_3_110:setText("", 0)
	var_3_110:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_110:SetAlignment(LUI.Alignment.Left)
	var_3_110:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 948, _1080p * 1335, _1080p * 84, _1080p * 108)
	var_3_0:addElement(var_3_110)

	var_3_0.Header1Text = var_3_110

	local var_3_111
	local var_3_112 = LUI.UIStyledText.new()

	var_3_112.id = "Header2Text"

	var_3_112:SetRGBFromInt(14934750, 0)
	var_3_112:SetAlpha(0.8, 0)
	var_3_112:setText("", 0)
	var_3_112:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_112:SetAlignment(LUI.Alignment.Left)
	var_3_112:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 948, _1080p * 1335, _1080p * 106, _1080p * 128)
	var_3_0:addElement(var_3_112)

	var_3_0.Header2Text = var_3_112

	local var_3_113
	local var_3_114 = LUI.UIImage.new()

	var_3_114.id = "Header3Background"

	var_3_114:SetRGBFromInt(10853781, 0)
	var_3_114:SetAlpha(0, 0)
	var_3_114:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1052, _1080p * 947, _1080p * 128, _1080p * 148)
	var_3_0:addElement(var_3_114)

	var_3_0.Header3Background = var_3_114

	local var_3_115
	local var_3_116 = LUI.UIStyledText.new()

	var_3_116.id = "Header3Text"

	var_3_116:SetRGBFromInt(14934750, 0)
	var_3_116:SetAlpha(0.8, 0)
	var_3_116:setText("", 0)
	var_3_116:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_116:SetAlignment(LUI.Alignment.Left)
	var_3_116:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 948, _1080p * 1335, _1080p * 126, _1080p * 148)
	var_3_0:addElement(var_3_116)

	var_3_0.Header3Text = var_3_116

	local var_3_117
	local var_3_118 = LUI.UIStyledText.new()

	var_3_118.id = "Header4Text"

	var_3_118:SetRGBFromInt(14934750, 0)
	var_3_118:SetAlpha(0.8, 0)
	var_3_118:setText("", 0)
	var_3_118:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_118:SetAlignment(LUI.Alignment.Left)
	var_3_118:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 948, _1080p * 1335, _1080p * 146, _1080p * 168)
	var_3_0:addElement(var_3_118)

	var_3_0.Header4Text = var_3_118

	local function var_3_119()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_119

	local var_3_120 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelBilletTemplate.BarTop
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelBilletTemplate.FieldBacking
		},
		{
			value = 2171169,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelBilletTemplate.Background
		},
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelBilletTemplate.FieldBacking
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelBilletTemplate.BarTop
		}
	}

	var_3_4:RegisterAnimationSequence("Coalition", var_3_120)

	local var_3_121 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AliasTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Coalition", var_3_121)

	local var_3_122 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.DOBTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Coalition", var_3_122)

	local var_3_123 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CodeNameTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Coalition", var_3_123)

	local var_3_124 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.NameTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Coalition", var_3_124)

	local var_3_125 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.GenderTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Coalition", var_3_125)

	local var_3_126 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.NationalityTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Coalition", var_3_126)

	local var_3_127 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.LateralityTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Coalition", var_3_127)

	local var_3_128 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HeightTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Coalition", var_3_128)

	local var_3_129 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.WeightTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Coalition", var_3_129)

	local var_3_130 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.VisionTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Coalition", var_3_130)

	local var_3_131 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.BloodTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Coalition", var_3_131)

	local var_3_132 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.RelativesTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Coalition", var_3_132)

	local var_3_133 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.EyeTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("Coalition", var_3_133)

	local var_3_134 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HairTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("Coalition", var_3_134)

	local var_3_135 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.LanguagesTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_34:RegisterAnimationSequence("Coalition", var_3_135)

	local var_3_136 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.MartialTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Coalition", var_3_136)

	local var_3_137 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.ChildrenTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Coalition", var_3_137)

	local var_3_138 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.SpecialistTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Coalition", var_3_138)

	local var_3_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Coalition", var_3_139)

	local var_3_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Coalition", var_3_140)

	local var_3_141 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("Coalition", var_3_141)

	local var_3_142 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("Coalition", var_3_142)

	local var_3_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_COALITION_TITLE"))
		},
		{
			value = 9225837,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_52:RegisterAnimationSequence("Coalition", var_3_143)

	local var_3_144 = {
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 633
		}
	}

	var_3_92:RegisterAnimationSequence("Coalition", var_3_144)

	local var_3_145 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HistorySubTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HistorySubTitle.Square
		}
	}

	var_3_96:RegisterAnimationSequence("Coalition", var_3_145)

	local var_3_146 = {
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 795
		}
	}

	var_3_98:RegisterAnimationSequence("Coalition", var_3_146)

	local var_3_147 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AssociationsSubTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 793
		},
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AssociationsSubTitle.Square
		}
	}

	var_3_102:RegisterAnimationSequence("Coalition", var_3_147)

	local var_3_148 = {
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 897
		}
	}

	var_3_104:RegisterAnimationSequence("Coalition", var_3_148)

	local var_3_149 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.DirectiveSubTitle.DOBTitle
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.DirectiveSubTitle.Square
		}
	}

	var_3_108:RegisterAnimationSequence("Coalition", var_3_149)

	local function var_3_150()
		var_3_4:AnimateSequence("Coalition")
		var_3_6:AnimateSequence("Coalition")
		var_3_8:AnimateSequence("Coalition")
		var_3_10:AnimateSequence("Coalition")
		var_3_12:AnimateSequence("Coalition")
		var_3_14:AnimateSequence("Coalition")
		var_3_16:AnimateSequence("Coalition")
		var_3_18:AnimateSequence("Coalition")
		var_3_20:AnimateSequence("Coalition")
		var_3_22:AnimateSequence("Coalition")
		var_3_24:AnimateSequence("Coalition")
		var_3_26:AnimateSequence("Coalition")
		var_3_28:AnimateSequence("Coalition")
		var_3_30:AnimateSequence("Coalition")
		var_3_32:AnimateSequence("Coalition")
		var_3_34:AnimateSequence("Coalition")
		var_3_36:AnimateSequence("Coalition")
		var_3_38:AnimateSequence("Coalition")
		var_3_40:AnimateSequence("Coalition")
		var_3_44:AnimateSequence("Coalition")
		var_3_46:AnimateSequence("Coalition")
		var_3_48:AnimateSequence("Coalition")
		var_3_50:AnimateSequence("Coalition")
		var_3_52:AnimateSequence("Coalition")
		var_3_92:AnimateSequence("Coalition")
		var_3_96:AnimateSequence("Coalition")
		var_3_98:AnimateSequence("Coalition")
		var_3_102:AnimateSequence("Coalition")
		var_3_104:AnimateSequence("Coalition")
		var_3_108:AnimateSequence("Coalition")
	end

	var_3_0._sequences.Coalition = var_3_150

	local var_3_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Callouts.teamAxis,
			child = var_3_0.CPIntelBilletTemplate.BarTop
		},
		{
			value = 0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelBilletTemplate.FieldBacking
		},
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelBilletTemplate.Background
		},
		{
			value = 13487565,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelBilletTemplate.FieldBacking
		}
	}

	var_3_4:RegisterAnimationSequence("Allegiance", var_3_151)

	local var_3_152 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AliasTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Allegiance", var_3_152)

	local var_3_153 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.DOBTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Allegiance", var_3_153)

	local var_3_154 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CodeNameTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Allegiance", var_3_154)

	local var_3_155 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.NameTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Allegiance", var_3_155)

	local var_3_156 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.GenderTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Allegiance", var_3_156)

	local var_3_157 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.NationalityTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Allegiance", var_3_157)

	local var_3_158 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.LateralityTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Allegiance", var_3_158)

	local var_3_159 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HeightTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Allegiance", var_3_159)

	local var_3_160 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.WeightTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Allegiance", var_3_160)

	local var_3_161 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.VisionTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Allegiance", var_3_161)

	local var_3_162 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.BloodTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Allegiance", var_3_162)

	local var_3_163 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.RelativesTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Allegiance", var_3_163)

	local var_3_164 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.EyeTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("Allegiance", var_3_164)

	local var_3_165 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HairTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("Allegiance", var_3_165)

	local var_3_166 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.LanguagesTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_34:RegisterAnimationSequence("Allegiance", var_3_166)

	local var_3_167 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.MartialTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Allegiance", var_3_167)

	local var_3_168 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.ChildrenTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Allegiance", var_3_168)

	local var_3_169 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.SpecialistTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Allegiance", var_3_169)

	local var_3_170 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Allegiance", var_3_170)

	local var_3_171 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Allegiance", var_3_171)

	local var_3_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("Allegiance", var_3_172)

	local var_3_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("Allegiance", var_3_173)

	local var_3_174 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_ALLEGIANCE_TITLE"))
		},
		{
			value = 16761996,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_52:RegisterAnimationSequence("Allegiance", var_3_174)

	local var_3_175 = {
		{
			value = 1644825,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 633
		}
	}

	var_3_92:RegisterAnimationSequence("Allegiance", var_3_175)

	local var_3_176 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HistorySubTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.HistorySubTitle.Square
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_96:RegisterAnimationSequence("Allegiance", var_3_176)

	local var_3_177 = {
		{
			value = 1644825,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 795
		}
	}

	var_3_98:RegisterAnimationSequence("Allegiance", var_3_177)

	local var_3_178 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AssociationsSubTitle.DOBTitle
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AssociationsSubTitle.Square
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_102:RegisterAnimationSequence("Allegiance", var_3_178)

	local var_3_179 = {
		{
			value = 1644825,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.86,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 897
		}
	}

	var_3_104:RegisterAnimationSequence("Allegiance", var_3_179)

	local var_3_180 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.DirectiveSubTitle.DOBTitle
		},
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.DirectiveSubTitle.Square
		}
	}

	var_3_108:RegisterAnimationSequence("Allegiance", var_3_180)

	local function var_3_181()
		var_3_4:AnimateSequence("Allegiance")
		var_3_6:AnimateSequence("Allegiance")
		var_3_8:AnimateSequence("Allegiance")
		var_3_10:AnimateSequence("Allegiance")
		var_3_12:AnimateSequence("Allegiance")
		var_3_14:AnimateSequence("Allegiance")
		var_3_16:AnimateSequence("Allegiance")
		var_3_18:AnimateSequence("Allegiance")
		var_3_20:AnimateSequence("Allegiance")
		var_3_22:AnimateSequence("Allegiance")
		var_3_24:AnimateSequence("Allegiance")
		var_3_26:AnimateSequence("Allegiance")
		var_3_28:AnimateSequence("Allegiance")
		var_3_30:AnimateSequence("Allegiance")
		var_3_32:AnimateSequence("Allegiance")
		var_3_34:AnimateSequence("Allegiance")
		var_3_36:AnimateSequence("Allegiance")
		var_3_38:AnimateSequence("Allegiance")
		var_3_40:AnimateSequence("Allegiance")
		var_3_44:AnimateSequence("Allegiance")
		var_3_46:AnimateSequence("Allegiance")
		var_3_48:AnimateSequence("Allegiance")
		var_3_50:AnimateSequence("Allegiance")
		var_3_52:AnimateSequence("Allegiance")
		var_3_92:AnimateSequence("Allegiance")
		var_3_96:AnimateSequence("Allegiance")
		var_3_98:AnimateSequence("Allegiance")
		var_3_102:AnimateSequence("Allegiance")
		var_3_104:AnimateSequence("Allegiance")
		var_3_108:AnimateSequence("Allegiance")
	end

	var_3_0._sequences.Allegiance = var_3_181

	local var_3_182 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_182)

	local var_3_183 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_183)

	local var_3_184 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_184)

	local var_3_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_185)

	local var_3_186 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1436
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_186)

	local var_3_187 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_187)

	local var_3_188 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_18:RegisterAnimationSequence("AR", var_3_188)

	local var_3_189 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_20:RegisterAnimationSequence("AR", var_3_189)

	local var_3_190 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1487
		}
	}

	var_3_22:RegisterAnimationSequence("AR", var_3_190)

	local var_3_191 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1554
		}
	}

	var_3_24:RegisterAnimationSequence("AR", var_3_191)

	local var_3_192 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_26:RegisterAnimationSequence("AR", var_3_192)

	local var_3_193 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1487
		}
	}

	var_3_28:RegisterAnimationSequence("AR", var_3_193)

	local var_3_194 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1046
		}
	}

	var_3_30:RegisterAnimationSequence("AR", var_3_194)

	local var_3_195 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1175
		}
	}

	var_3_32:RegisterAnimationSequence("AR", var_3_195)

	local var_3_196 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1487
		}
	}

	var_3_34:RegisterAnimationSequence("AR", var_3_196)

	local var_3_197 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_36:RegisterAnimationSequence("AR", var_3_197)

	local var_3_198 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_38:RegisterAnimationSequence("AR", var_3_198)

	local var_3_199 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_40:RegisterAnimationSequence("AR", var_3_199)

	local var_3_200 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		}
	}

	var_3_54:RegisterAnimationSequence("AR", var_3_200)

	local var_3_201 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 237
		}
	}

	var_3_56:RegisterAnimationSequence("AR", var_3_201)

	local var_3_202 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1649
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 298
		}
	}

	var_3_58:RegisterAnimationSequence("AR", var_3_202)

	local var_3_203 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 315
		}
	}

	var_3_60:RegisterAnimationSequence("AR", var_3_203)

	local var_3_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1431
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 354
		}
	}

	var_3_62:RegisterAnimationSequence("AR", var_3_204)

	local var_3_205 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 354
		}
	}

	var_3_64:RegisterAnimationSequence("AR", var_3_205)

	local var_3_206 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 393
		}
	}

	var_3_66:RegisterAnimationSequence("AR", var_3_206)

	local var_3_207 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		}
	}

	var_3_68:RegisterAnimationSequence("AR", var_3_207)

	local var_3_208 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		}
	}

	var_3_70:RegisterAnimationSequence("AR", var_3_208)

	local var_3_209 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1554
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		}
	}

	var_3_72:RegisterAnimationSequence("AR", var_3_209)

	local var_3_210 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		}
	}

	var_3_74:RegisterAnimationSequence("AR", var_3_210)

	local var_3_211 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 471
		}
	}

	var_3_76:RegisterAnimationSequence("AR", var_3_211)

	local var_3_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 472
		}
	}

	var_3_78:RegisterAnimationSequence("AR", var_3_212)

	local var_3_213 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 528
		}
	}

	var_3_80:RegisterAnimationSequence("AR", var_3_213)

	local var_3_214 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1046
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 528
		}
	}

	var_3_82:RegisterAnimationSequence("AR", var_3_214)

	local var_3_215 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 528
		}
	}

	var_3_84:RegisterAnimationSequence("AR", var_3_215)

	local var_3_216 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 528
		}
	}

	var_3_86:RegisterAnimationSequence("AR", var_3_216)

	local var_3_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1627
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 960
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 589
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 567
		}
	}

	var_3_88:RegisterAnimationSequence("AR", var_3_217)

	local var_3_218 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_94:RegisterAnimationSequence("AR", var_3_218)

	local var_3_219 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_96:RegisterAnimationSequence("AR", var_3_219)

	local var_3_220 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_100:RegisterAnimationSequence("AR", var_3_220)

	local var_3_221 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_102:RegisterAnimationSequence("AR", var_3_221)

	local var_3_222 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_106:RegisterAnimationSequence("AR", var_3_222)

	local var_3_223 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1653
		}
	}

	var_3_108:RegisterAnimationSequence("AR", var_3_223)

	local function var_3_224()
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
		var_3_18:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
		var_3_22:AnimateSequence("AR")
		var_3_24:AnimateSequence("AR")
		var_3_26:AnimateSequence("AR")
		var_3_28:AnimateSequence("AR")
		var_3_30:AnimateSequence("AR")
		var_3_32:AnimateSequence("AR")
		var_3_34:AnimateSequence("AR")
		var_3_36:AnimateSequence("AR")
		var_3_38:AnimateSequence("AR")
		var_3_40:AnimateSequence("AR")
		var_3_54:AnimateSequence("AR")
		var_3_56:AnimateSequence("AR")
		var_3_58:AnimateSequence("AR")
		var_3_60:AnimateSequence("AR")
		var_3_62:AnimateSequence("AR")
		var_3_64:AnimateSequence("AR")
		var_3_66:AnimateSequence("AR")
		var_3_68:AnimateSequence("AR")
		var_3_70:AnimateSequence("AR")
		var_3_72:AnimateSequence("AR")
		var_3_74:AnimateSequence("AR")
		var_3_76:AnimateSequence("AR")
		var_3_78:AnimateSequence("AR")
		var_3_80:AnimateSequence("AR")
		var_3_82:AnimateSequence("AR")
		var_3_84:AnimateSequence("AR")
		var_3_86:AnimateSequence("AR")
		var_3_88:AnimateSequence("AR")
		var_3_94:AnimateSequence("AR")
		var_3_96:AnimateSequence("AR")
		var_3_100:AnimateSequence("AR")
		var_3_102:AnimateSequence("AR")
		var_3_106:AnimateSequence("AR")
		var_3_108:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_224

	local var_3_225 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 77
		}
	}

	var_3_52:RegisterAnimationSequence("KORZHJP", var_3_225)

	local var_3_226 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1474
		}
	}

	var_3_76:RegisterAnimationSequence("KORZHJP", var_3_226)

	local var_3_227 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1339
		}
	}

	var_3_112:RegisterAnimationSequence("KORZHJP", var_3_227)

	local var_3_228 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1339
		}
	}

	var_3_116:RegisterAnimationSequence("KORZHJP", var_3_228)

	local var_3_229 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		}
	}

	var_3_118:RegisterAnimationSequence("KORZHJP", var_3_229)

	local function var_3_230()
		var_3_52:AnimateSequence("KORZHJP")
		var_3_76:AnimateSequence("KORZHJP")
		var_3_112:AnimateSequence("KORZHJP")
		var_3_116:AnimateSequence("KORZHJP")
		var_3_118:AnimateSequence("KORZHJP")
	end

	var_3_0._sequences.KORZHJP = var_3_230

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPIntelBillet", CPIntelBillet)
LockTable(_M)
