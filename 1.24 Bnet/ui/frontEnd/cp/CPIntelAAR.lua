module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.image)
	local var_1_1 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.faction)
	local var_1_2 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.mapName)
	local var_1_3 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.time)
	local var_1_4 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.mission)
	local var_1_5 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.assessment)
	local var_1_6 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.insertTime)
	local var_1_7 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.insertText)
	local var_1_8 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.infilTime)
	local var_1_9 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.infilText)
	local var_1_10 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementTime1)
	local var_1_11 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementText1)
	local var_1_12 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementTime2)
	local var_1_13 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementText2)
	local var_1_14 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementTime3)
	local var_1_15 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementText3)
	local var_1_16 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementTime4)
	local var_1_17 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementText4)
	local var_1_18 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementTime5)
	local var_1_19 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.engagementText5)
	local var_1_20 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.exfilTime)
	local var_1_21 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.exfilText)
	local var_1_22 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.extractTime)
	local var_1_23 = StringTable.DIFCHIGDFB(CSV.cpIntelAAR.file, CSV.cpIntelAAR.cols.ref, arg_1_1, CSV.cpIntelAAR.cols.extractText)

	arg_1_0.MapNameText:setText(Engine.CBBHFCGDIC(var_1_2), 0)
	arg_1_0.TimeText:setText(Engine.CBBHFCGDIC(var_1_3), 0)
	arg_1_0.MissionText:setText(Engine.CBBHFCGDIC(var_1_4), 0)
	arg_1_0.AssessmentText:setText(Engine.CBBHFCGDIC(var_1_5), 0)
	arg_1_0.InsertTime:setText(Engine.CBBHFCGDIC(var_1_6), 0)
	arg_1_0.InsertText:setText(Engine.CBBHFCGDIC(var_1_7), 0)
	arg_1_0.InfilTime:setText(Engine.CBBHFCGDIC(var_1_8), 0)
	arg_1_0.InfilText:setText(Engine.CBBHFCGDIC(var_1_9), 0)
	arg_1_0.Engagement1Time:setText(Engine.CBBHFCGDIC(var_1_10), 0)
	arg_1_0.Engagement1Text:setText(Engine.CBBHFCGDIC(var_1_11), 0)
	arg_1_0.Engagement2Time:setText(Engine.CBBHFCGDIC(var_1_12), 0)
	arg_1_0.Engagement2Text:setText(Engine.CBBHFCGDIC(var_1_13), 0)
	arg_1_0.Engagement3Time:setText(Engine.CBBHFCGDIC(var_1_14), 0)
	arg_1_0.Engagement3Text:setText(Engine.CBBHFCGDIC(var_1_15), 0)
	arg_1_0.Engagement4Time:setText(Engine.CBBHFCGDIC(var_1_16), 0)
	arg_1_0.Engagement4Text:setText(Engine.CBBHFCGDIC(var_1_17), 0)
	arg_1_0.Engagement5Time:setText(Engine.CBBHFCGDIC(var_1_18), 0)
	arg_1_0.Engagement5Text:setText(Engine.CBBHFCGDIC(var_1_19), 0)
	arg_1_0.FooterText:setText(Engine.CBBHFCGDIC(var_1_3), 0)
	arg_1_0.ExfilTime:setText(Engine.CBBHFCGDIC(var_1_20), 0)
	arg_1_0.ExfilText:setText(Engine.CBBHFCGDIC(var_1_21), 0)
	arg_1_0.ExtractTime:setText(Engine.CBBHFCGDIC(var_1_22), 0)
	arg_1_0.ExtractText:setText(Engine.CBBHFCGDIC(var_1_23), 0)
	arg_1_0.CPIntelAARTemplate.mapImage:setImage(RegisterMaterial(var_1_0), 0)

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
	elseif IsLanguageFrench() or IsLanguageGerman() or IsLanguageItalian() or IsLanguageSpanish() then
		ACTIONS.AnimateSequence(arg_2_0, "FRDEITSP")
	end
end

function CPIntelAAR(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CPIntelAAR"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("CPIntelAARTemplate", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "CPIntelAARTemplate"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_3_0:addElement(var_3_4)

	var_3_0.CPIntelAARTemplate = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "AssessmentText"

	var_3_6:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_6:SetStartupDelay(3000)
	var_3_6:SetLineHoldTime(2000)
	var_3_6:SetAnimMoveTime(150)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(5000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(8)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 652, _1080p * 1303, _1080p * 768, _1080p * 786)
	var_3_0:addElement(var_3_6)

	var_3_0.AssessmentText = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "AllegianceIconLarge"

	var_3_8:SetAlpha(0.08, 0)
	var_3_8:SetScale(-0.24, 0)
	var_3_8:setImage(RegisterMaterial("icon_faction_east_large"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * 492, _1080p * 1004)
	var_3_0:addElement(var_3_8)

	var_3_0.AllegianceIconLarge = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "CoalitionIconLarge"

	var_3_10:SetAlpha(0.08, 0)
	var_3_10:SetScale(-0.24, 0)
	var_3_10:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * 492, _1080p * 1004)
	var_3_0:addElement(var_3_10)

	var_3_0.CoalitionIconLarge = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "TopHeader"

	var_3_12:setText(ToUpperCase(""), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 636, _1080p * 1361, _1080p * 84, _1080p * 104)
	var_3_0:addElement(var_3_12)

	var_3_0.TopHeader = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("BilletSubTitle", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "AssesmentTitle"

	var_3_14.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_ASSESSMENT_HEADER")), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1307, _1080p * 745, _1080p * 765)
	var_3_0:addElement(var_3_14)

	var_3_0.AssesmentTitle = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("BilletSubTitle", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "MissionTitle"

	var_3_16.DOBTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_MISSION_HEADER")), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1303, _1080p * 567, _1080p * 587)
	var_3_0:addElement(var_3_16)

	var_3_0.MissionTitle = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "AfterActionTitle"

	var_3_18:SetRGBFromInt(10066328, 0)
	var_3_18:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_TITLE")), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1303, _1080p * 126, _1080p * 144)
	var_3_0:addElement(var_3_18)

	var_3_0.AfterActionTitle = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "TimeineTitle"

	var_3_20:SetRGBFromInt(10066328, 0)
	var_3_20:SetAlpha(0.8, 0)
	var_3_20:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_TIMELINE_HEADER")), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1666, _1080p * 126, _1080p * 144)
	var_3_0:addElement(var_3_20)

	var_3_0.TimeineTitle = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIStyledText.new()

	var_3_22.id = "MissionText"

	var_3_22:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_22:SetStartupDelay(3000)
	var_3_22:SetLineHoldTime(2000)
	var_3_22:SetAnimMoveTime(150)
	var_3_22:SetAnimMoveSpeed(50)
	var_3_22:SetEndDelay(5000)
	var_3_22:SetCrossfadeTime(400)
	var_3_22:SetFadeInTime(300)
	var_3_22:SetFadeOutTime(300)
	var_3_22:SetMaxVisibleLines(8)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 652, _1080p * 1303, _1080p * 588, _1080p * 606)
	var_3_0:addElement(var_3_22)

	var_3_0.MissionText = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIStyledText.new()

	var_3_24.id = "ConfidentalText"

	var_3_24:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_24:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_CONFIDENTIAL")), 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Left)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 636, _1080p * 1063, _1080p * 182, _1080p * 200)
	var_3_0:addElement(var_3_24)

	var_3_0.ConfidentalText = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIStyledText.new()

	var_3_26.id = "TimeText"

	var_3_26:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_26:setText("", 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_26:SetAlignment(LUI.Alignment.Left)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1090, _1080p * 1295, _1080p * 185, _1080p * 203)
	var_3_0:addElement(var_3_26)

	var_3_0.TimeText = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIStyledText.new()

	var_3_28.id = "MapNameText"

	var_3_28:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_28:setText("", 0)
	var_3_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_28:SetAlignment(LUI.Alignment.Right)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1090, _1080p * 1295, _1080p * 509, _1080p * 527)
	var_3_0:addElement(var_3_28)

	var_3_0.MapNameText = var_3_28

	local var_3_29
	local var_3_30 = LUI.UIStyledText.new()

	var_3_30.id = "FooterText"

	var_3_30:SetRGBFromInt(8880246, 0)
	var_3_30:SetAlpha(0, 0)
	var_3_30:setText("", 0)
	var_3_30:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_30:SetAlignment(LUI.Alignment.Left)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 834, _1080p * 954, _1080p * 972)
	var_3_0:addElement(var_3_30)

	var_3_0.FooterText = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIImage.new()

	var_3_32.id = "BarEngagement"

	var_3_32:SetAlpha(0.08, 0)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1326, _1080p * 1660, _1080p * 312, _1080p * 328)
	var_3_0:addElement(var_3_32)

	var_3_0.BarEngagement = var_3_32

	local var_3_33
	local var_3_34 = LUI.UIStyledText.new()

	var_3_34.id = "EngagementTitle"

	var_3_34:SetRGBFromInt(10066328, 0)
	var_3_34:SetAlpha(0.8, 0)
	var_3_34:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_ENGAGEMENT_HEADER")), 0)
	var_3_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_34:SetAlignment(LUI.Alignment.Left)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1656, _1080p * 310, _1080p * 328)
	var_3_0:addElement(var_3_34)

	var_3_0.EngagementTitle = var_3_34

	local var_3_35
	local var_3_36 = LUI.UIStyledText.new()

	var_3_36.id = "InsertText"

	var_3_36:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_36:setText("", 0)
	var_3_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_36:SetAlignment(LUI.Alignment.Left)
	var_3_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_36:SetStartupDelay(3000)
	var_3_36:SetLineHoldTime(2000)
	var_3_36:SetAnimMoveTime(150)
	var_3_36:SetAnimMoveSpeed(50)
	var_3_36:SetEndDelay(4000)
	var_3_36:SetCrossfadeTime(400)
	var_3_36:SetFadeInTime(300)
	var_3_36:SetFadeOutTime(300)
	var_3_36:SetMaxVisibleLines(3)
	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 167, _1080p * 185)
	var_3_0:addElement(var_3_36)

	var_3_0.InsertText = var_3_36

	local var_3_37
	local var_3_38 = LUI.UIStyledText.new()

	var_3_38.id = "InsertTime"

	var_3_38:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_38:setText("", 0)
	var_3_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_38:SetAlignment(LUI.Alignment.Left)
	var_3_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 185, _1080p * 203)
	var_3_0:addElement(var_3_38)

	var_3_0.InsertTime = var_3_38

	local var_3_39
	local var_3_40 = LUI.UIStyledText.new()

	var_3_40.id = "InsertHeader"

	var_3_40:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_40:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_INSERT_HEADER")), 0)
	var_3_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_40:SetWordWrap(false)
	var_3_40:SetAlignment(LUI.Alignment.Left)
	var_3_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 167, _1080p * 185)
	var_3_0:addElement(var_3_40)

	var_3_0.InsertHeader = var_3_40

	local var_3_41
	local var_3_42 = LUI.UIStyledText.new()

	var_3_42.id = "InfilText"

	var_3_42:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_42:setText("", 0)
	var_3_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_42:SetAlignment(LUI.Alignment.Left)
	var_3_42:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_42:SetStartupDelay(3000)
	var_3_42:SetLineHoldTime(2000)
	var_3_42:SetAnimMoveTime(150)
	var_3_42:SetAnimMoveSpeed(50)
	var_3_42:SetEndDelay(4000)
	var_3_42:SetCrossfadeTime(400)
	var_3_42:SetFadeInTime(300)
	var_3_42:SetFadeOutTime(300)
	var_3_42:SetMaxVisibleLines(3)
	var_3_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 237, _1080p * 255)
	var_3_0:addElement(var_3_42)

	var_3_0.InfilText = var_3_42

	local var_3_43
	local var_3_44 = LUI.UIStyledText.new()

	var_3_44.id = "InfilTime"

	var_3_44:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_44:setText("", 0)
	var_3_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_44:SetAlignment(LUI.Alignment.Left)
	var_3_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 255, _1080p * 273)
	var_3_0:addElement(var_3_44)

	var_3_0.InfilTime = var_3_44

	local var_3_45
	local var_3_46 = LUI.UIStyledText.new()

	var_3_46.id = "InfilHeader"

	var_3_46:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_46:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_INFIL_HEADER")), 0)
	var_3_46:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_46:SetWordWrap(false)
	var_3_46:SetAlignment(LUI.Alignment.Left)
	var_3_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 237, _1080p * 255)
	var_3_0:addElement(var_3_46)

	var_3_0.InfilHeader = var_3_46

	local var_3_47
	local var_3_48 = LUI.UIStyledText.new()

	var_3_48.id = "Engagement1Text"

	var_3_48:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_48:setText("", 0)
	var_3_48:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_48:SetAlignment(LUI.Alignment.Left)
	var_3_48:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_48:SetStartupDelay(3000)
	var_3_48:SetLineHoldTime(2000)
	var_3_48:SetAnimMoveTime(150)
	var_3_48:SetAnimMoveSpeed(50)
	var_3_48:SetEndDelay(4000)
	var_3_48:SetCrossfadeTime(400)
	var_3_48:SetFadeInTime(300)
	var_3_48:SetFadeOutTime(300)
	var_3_48:SetMaxVisibleLines(4)
	var_3_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 339, _1080p * 357)
	var_3_0:addElement(var_3_48)

	var_3_0.Engagement1Text = var_3_48

	local var_3_49
	local var_3_50 = LUI.UIStyledText.new()

	var_3_50.id = "Engagement1Time"

	var_3_50:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_50:setText("", 0)
	var_3_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_50:SetAlignment(LUI.Alignment.Left)
	var_3_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 339, _1080p * 357)
	var_3_0:addElement(var_3_50)

	var_3_0.Engagement1Time = var_3_50

	local var_3_51
	local var_3_52 = LUI.UIStyledText.new()

	var_3_52.id = "Engagement2Text"

	var_3_52:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_52:setText("", 0)
	var_3_52:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_52:SetAlignment(LUI.Alignment.Left)
	var_3_52:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_52:SetStartupDelay(3000)
	var_3_52:SetLineHoldTime(2000)
	var_3_52:SetAnimMoveTime(150)
	var_3_52:SetAnimMoveSpeed(50)
	var_3_52:SetEndDelay(4000)
	var_3_52:SetCrossfadeTime(400)
	var_3_52:SetFadeInTime(300)
	var_3_52:SetFadeOutTime(300)
	var_3_52:SetMaxVisibleLines(5)
	var_3_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 424, _1080p * 442)
	var_3_0:addElement(var_3_52)

	var_3_0.Engagement2Text = var_3_52

	local var_3_53
	local var_3_54 = LUI.UIStyledText.new()

	var_3_54.id = "Engagement2Time"

	var_3_54:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_54:setText("", 0)
	var_3_54:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_54:SetAlignment(LUI.Alignment.Left)
	var_3_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 424, _1080p * 442)
	var_3_0:addElement(var_3_54)

	var_3_0.Engagement2Time = var_3_54

	local var_3_55
	local var_3_56 = LUI.UIStyledText.new()

	var_3_56.id = "Engagement3Text"

	var_3_56:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_56:setText("", 0)
	var_3_56:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_56:SetAlignment(LUI.Alignment.Left)
	var_3_56:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_56:SetStartupDelay(3000)
	var_3_56:SetLineHoldTime(2000)
	var_3_56:SetAnimMoveTime(150)
	var_3_56:SetAnimMoveSpeed(50)
	var_3_56:SetEndDelay(4000)
	var_3_56:SetCrossfadeTime(400)
	var_3_56:SetFadeInTime(300)
	var_3_56:SetFadeOutTime(300)
	var_3_56:SetMaxVisibleLines(5)
	var_3_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 517, _1080p * 535)
	var_3_0:addElement(var_3_56)

	var_3_0.Engagement3Text = var_3_56

	local var_3_57
	local var_3_58 = LUI.UIStyledText.new()

	var_3_58.id = "Engagement3Time"

	var_3_58:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_58:setText("", 0)
	var_3_58:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_58:SetAlignment(LUI.Alignment.Left)
	var_3_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 516, _1080p * 534)
	var_3_0:addElement(var_3_58)

	var_3_0.Engagement3Time = var_3_58

	local var_3_59
	local var_3_60 = LUI.UIStyledText.new()

	var_3_60.id = "Engagement4Text"

	var_3_60:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_60:setText("", 0)
	var_3_60:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_60:SetAlignment(LUI.Alignment.Left)
	var_3_60:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_60:SetStartupDelay(3000)
	var_3_60:SetLineHoldTime(2000)
	var_3_60:SetAnimMoveTime(150)
	var_3_60:SetAnimMoveSpeed(50)
	var_3_60:SetEndDelay(4000)
	var_3_60:SetCrossfadeTime(400)
	var_3_60:SetFadeInTime(300)
	var_3_60:SetFadeOutTime(300)
	var_3_60:SetMaxVisibleLines(4)
	var_3_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 618, _1080p * 636)
	var_3_0:addElement(var_3_60)

	var_3_0.Engagement4Text = var_3_60

	local var_3_61
	local var_3_62 = LUI.UIStyledText.new()

	var_3_62.id = "Engagement4Time"

	var_3_62:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_62:setText("", 0)
	var_3_62:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_62:SetAlignment(LUI.Alignment.Left)
	var_3_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 617, _1080p * 635)
	var_3_0:addElement(var_3_62)

	var_3_0.Engagement4Time = var_3_62

	local var_3_63
	local var_3_64 = LUI.UIStyledText.new()

	var_3_64.id = "Engagement5Text"

	var_3_64:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_64:setText("", 0)
	var_3_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_64:SetAlignment(LUI.Alignment.Left)
	var_3_64:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_64:SetStartupDelay(3000)
	var_3_64:SetLineHoldTime(2000)
	var_3_64:SetAnimMoveTime(150)
	var_3_64:SetAnimMoveSpeed(50)
	var_3_64:SetEndDelay(4000)
	var_3_64:SetCrossfadeTime(400)
	var_3_64:SetFadeInTime(300)
	var_3_64:SetFadeOutTime(300)
	var_3_64:SetMaxVisibleLines(4)
	var_3_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 704, _1080p * 722)
	var_3_0:addElement(var_3_64)

	var_3_0.Engagement5Text = var_3_64

	local var_3_65
	local var_3_66 = LUI.UIStyledText.new()

	var_3_66.id = "Engagement5Time"

	var_3_66:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_66:setText("", 0)
	var_3_66:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_66:SetAlignment(LUI.Alignment.Left)
	var_3_66:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 703, _1080p * 721)
	var_3_0:addElement(var_3_66)

	var_3_0.Engagement5Time = var_3_66

	local var_3_67
	local var_3_68 = LUI.UIStyledText.new()

	var_3_68.id = "ExfilText"

	var_3_68:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_68:setText("", 0)
	var_3_68:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_68:SetAlignment(LUI.Alignment.Left)
	var_3_68:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_68:SetStartupDelay(3000)
	var_3_68:SetLineHoldTime(2000)
	var_3_68:SetAnimMoveTime(150)
	var_3_68:SetAnimMoveSpeed(50)
	var_3_68:SetEndDelay(4000)
	var_3_68:SetCrossfadeTime(400)
	var_3_68:SetFadeInTime(300)
	var_3_68:SetFadeOutTime(300)
	var_3_68:SetMaxVisibleLines(5)
	var_3_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 778, _1080p * 796)
	var_3_0:addElement(var_3_68)

	var_3_0.ExfilText = var_3_68

	local var_3_69
	local var_3_70 = LUI.UIStyledText.new()

	var_3_70.id = "ExfilTime"

	var_3_70:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_70:setText("", 0)
	var_3_70:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_70:SetAlignment(LUI.Alignment.Left)
	var_3_70:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 796, _1080p * 814)
	var_3_0:addElement(var_3_70)

	var_3_0.ExfilTime = var_3_70

	local var_3_71
	local var_3_72 = LUI.UIStyledText.new()

	var_3_72.id = "ExfilHeader"

	var_3_72:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_72:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_EXFIL_HEADER")), 0)
	var_3_72:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_72:SetWordWrap(false)
	var_3_72:SetAlignment(LUI.Alignment.Left)
	var_3_72:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 778, _1080p * 796)
	var_3_0:addElement(var_3_72)

	var_3_0.ExfilHeader = var_3_72

	local var_3_73
	local var_3_74 = LUI.UIStyledText.new()

	var_3_74.id = "ExtractText"

	var_3_74:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_74:setText("", 0)
	var_3_74:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_74:SetAlignment(LUI.Alignment.Left)
	var_3_74:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_74:SetStartupDelay(2000)
	var_3_74:SetLineHoldTime(2000)
	var_3_74:SetAnimMoveTime(150)
	var_3_74:SetAnimMoveSpeed(50)
	var_3_74:SetEndDelay(4000)
	var_3_74:SetCrossfadeTime(400)
	var_3_74:SetFadeInTime(300)
	var_3_74:SetFadeOutTime(300)
	var_3_74:SetMaxVisibleLines(2)
	var_3_74:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1417, _1080p * 1660, _1080p * 879, _1080p * 897)
	var_3_0:addElement(var_3_74)

	var_3_0.ExtractText = var_3_74

	local var_3_75
	local var_3_76 = LUI.UIStyledText.new()

	var_3_76.id = "ExtractTime"

	var_3_76:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_76:setText("", 0)
	var_3_76:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_76:SetAlignment(LUI.Alignment.Left)
	var_3_76:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 897, _1080p * 915)
	var_3_0:addElement(var_3_76)

	var_3_0.ExtractTime = var_3_76

	local var_3_77
	local var_3_78 = LUI.UIStyledText.new()

	var_3_78.id = "ExtractHeader"

	var_3_78:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_78:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_EXTRACT_HEADER")), 0)
	var_3_78:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_78:SetWordWrap(false)
	var_3_78:SetAlignment(LUI.Alignment.Left)
	var_3_78:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1409, _1080p * 879, _1080p * 897)
	var_3_0:addElement(var_3_78)

	var_3_0.ExtractHeader = var_3_78

	local function var_3_79()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_79

	local var_3_80 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.BarTop
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.TimelineBacking
		},
		{
			value = 2171169,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.Backing
		},
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.TimelineBacking
		},
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.BarMission
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.BarMission
		},
		{
			value = 1250067,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.BarAssessment
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.BarAssessment
		}
	}

	var_3_4:RegisterAnimationSequence("Coalition", var_3_80)

	local var_3_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Coalition", var_3_81)

	local var_3_82 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_10:RegisterAnimationSequence("Coalition", var_3_82)

	local var_3_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_COALITION_TITLE"))
		},
		{
			value = 9225837,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_12:RegisterAnimationSequence("Coalition", var_3_83)

	local var_3_84 = {
		{
			value = 10066329,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AssesmentTitle.DOBTitle
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 10066329,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.AssesmentTitle.Square
		}
	}

	var_3_14:RegisterAnimationSequence("Coalition", var_3_84)

	local var_3_85 = {
		{
			value = 10066329,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.MissionTitle.DOBTitle
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 10066329,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.MissionTitle.Square
		}
	}

	var_3_16:RegisterAnimationSequence("Coalition", var_3_85)

	local var_3_86 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Coalition", var_3_86)

	local var_3_87 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_38:RegisterAnimationSequence("Coalition", var_3_87)

	local var_3_88 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_40:RegisterAnimationSequence("Coalition", var_3_88)

	local var_3_89 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Coalition", var_3_89)

	local var_3_90 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_44:RegisterAnimationSequence("Coalition", var_3_90)

	local var_3_91 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_46:RegisterAnimationSequence("Coalition", var_3_91)

	local var_3_92 = {
		{
			value = 10853781,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("Coalition", var_3_92)

	local var_3_93 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_50:RegisterAnimationSequence("Coalition", var_3_93)

	local var_3_94 = {
		{
			value = 10853781,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_52:RegisterAnimationSequence("Coalition", var_3_94)

	local var_3_95 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_54:RegisterAnimationSequence("Coalition", var_3_95)

	local var_3_96 = {
		{
			value = 10853781,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_56:RegisterAnimationSequence("Coalition", var_3_96)

	local var_3_97 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_58:RegisterAnimationSequence("Coalition", var_3_97)

	local var_3_98 = {
		{
			value = 10853781,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_60:RegisterAnimationSequence("Coalition", var_3_98)

	local var_3_99 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_62:RegisterAnimationSequence("Coalition", var_3_99)

	local var_3_100 = {
		{
			value = 10853781,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_64:RegisterAnimationSequence("Coalition", var_3_100)

	local var_3_101 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_66:RegisterAnimationSequence("Coalition", var_3_101)

	local var_3_102 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_68:RegisterAnimationSequence("Coalition", var_3_102)

	local var_3_103 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_70:RegisterAnimationSequence("Coalition", var_3_103)

	local var_3_104 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_72:RegisterAnimationSequence("Coalition", var_3_104)

	local var_3_105 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_74:RegisterAnimationSequence("Coalition", var_3_105)

	local var_3_106 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_76:RegisterAnimationSequence("Coalition", var_3_106)

	local var_3_107 = {
		{
			value = 6455123,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_78:RegisterAnimationSequence("Coalition", var_3_107)

	local function var_3_108()
		var_3_4:AnimateSequence("Coalition")
		var_3_8:AnimateSequence("Coalition")
		var_3_10:AnimateSequence("Coalition")
		var_3_12:AnimateSequence("Coalition")
		var_3_14:AnimateSequence("Coalition")
		var_3_16:AnimateSequence("Coalition")
		var_3_36:AnimateSequence("Coalition")
		var_3_38:AnimateSequence("Coalition")
		var_3_40:AnimateSequence("Coalition")
		var_3_42:AnimateSequence("Coalition")
		var_3_44:AnimateSequence("Coalition")
		var_3_46:AnimateSequence("Coalition")
		var_3_48:AnimateSequence("Coalition")
		var_3_50:AnimateSequence("Coalition")
		var_3_52:AnimateSequence("Coalition")
		var_3_54:AnimateSequence("Coalition")
		var_3_56:AnimateSequence("Coalition")
		var_3_58:AnimateSequence("Coalition")
		var_3_60:AnimateSequence("Coalition")
		var_3_62:AnimateSequence("Coalition")
		var_3_64:AnimateSequence("Coalition")
		var_3_66:AnimateSequence("Coalition")
		var_3_68:AnimateSequence("Coalition")
		var_3_70:AnimateSequence("Coalition")
		var_3_72:AnimateSequence("Coalition")
		var_3_74:AnimateSequence("Coalition")
		var_3_76:AnimateSequence("Coalition")
		var_3_78:AnimateSequence("Coalition")
	end

	var_3_0._sequences.Coalition = var_3_108

	local var_3_109 = {
		{
			value = 7812405,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.BarTop
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.BarTop
		},
		{
			value = 1447446,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.Backing
		},
		{
			value = 13487565,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.TimelineBacking
		},
		{
			value = 0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.TimelineBacking
		},
		{
			value = 13487565,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.BarMission
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.BarMission
		},
		{
			value = 13487565,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_3_0.CPIntelAARTemplate.BarAssessment
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.CPIntelAARTemplate.BarAssessment
		}
	}

	var_3_4:RegisterAnimationSequence("Allegiance", var_3_109)

	local var_3_110 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Allegiance", var_3_110)

	local var_3_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Allegiance", var_3_111)

	local var_3_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/BILLET_ALLEGIANCE_TITLE"))
		},
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_12:RegisterAnimationSequence("Allegiance", var_3_112)

	local var_3_113 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Allegiance", var_3_113)

	local var_3_114 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Allegiance", var_3_114)

	local var_3_115 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Allegiance", var_3_115)

	local var_3_116 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Allegiance", var_3_116)

	local var_3_117 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Allegiance", var_3_117)

	local var_3_118 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Allegiance", var_3_118)

	local var_3_119 = {
		{
			value = 12434877,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("Allegiance", var_3_119)

	local var_3_120 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("Allegiance", var_3_120)

	local var_3_121 = {
		{
			value = 12434877,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_52:RegisterAnimationSequence("Allegiance", var_3_121)

	local var_3_122 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_54:RegisterAnimationSequence("Allegiance", var_3_122)

	local var_3_123 = {
		{
			value = 12434877,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_56:RegisterAnimationSequence("Allegiance", var_3_123)

	local var_3_124 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_58:RegisterAnimationSequence("Allegiance", var_3_124)

	local var_3_125 = {
		{
			value = 12434877,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_60:RegisterAnimationSequence("Allegiance", var_3_125)

	local var_3_126 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_62:RegisterAnimationSequence("Allegiance", var_3_126)

	local var_3_127 = {
		{
			value = 12434877,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_64:RegisterAnimationSequence("Allegiance", var_3_127)

	local var_3_128 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_66:RegisterAnimationSequence("Allegiance", var_3_128)

	local var_3_129 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_68:RegisterAnimationSequence("Allegiance", var_3_129)

	local var_3_130 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_70:RegisterAnimationSequence("Allegiance", var_3_130)

	local var_3_131 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_72:RegisterAnimationSequence("Allegiance", var_3_131)

	local var_3_132 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_74:RegisterAnimationSequence("Allegiance", var_3_132)

	local var_3_133 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_76:RegisterAnimationSequence("Allegiance", var_3_133)

	local var_3_134 = {
		{
			value = 16548172,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_78:RegisterAnimationSequence("Allegiance", var_3_134)

	local function var_3_135()
		var_3_4:AnimateSequence("Allegiance")
		var_3_8:AnimateSequence("Allegiance")
		var_3_10:AnimateSequence("Allegiance")
		var_3_12:AnimateSequence("Allegiance")
		var_3_36:AnimateSequence("Allegiance")
		var_3_38:AnimateSequence("Allegiance")
		var_3_40:AnimateSequence("Allegiance")
		var_3_42:AnimateSequence("Allegiance")
		var_3_44:AnimateSequence("Allegiance")
		var_3_46:AnimateSequence("Allegiance")
		var_3_48:AnimateSequence("Allegiance")
		var_3_50:AnimateSequence("Allegiance")
		var_3_52:AnimateSequence("Allegiance")
		var_3_54:AnimateSequence("Allegiance")
		var_3_56:AnimateSequence("Allegiance")
		var_3_58:AnimateSequence("Allegiance")
		var_3_60:AnimateSequence("Allegiance")
		var_3_62:AnimateSequence("Allegiance")
		var_3_64:AnimateSequence("Allegiance")
		var_3_66:AnimateSequence("Allegiance")
		var_3_68:AnimateSequence("Allegiance")
		var_3_70:AnimateSequence("Allegiance")
		var_3_72:AnimateSequence("Allegiance")
		var_3_74:AnimateSequence("Allegiance")
		var_3_76:AnimateSequence("Allegiance")
		var_3_78:AnimateSequence("Allegiance")
	end

	var_3_0._sequences.Allegiance = var_3_135

	local var_3_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 766
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 788
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_136)

	local var_3_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1670
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_137)

	local var_3_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1295
		}
	}

	var_3_18:RegisterAnimationSequence("AR", var_3_138)

	local var_3_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1660
		}
	}

	var_3_20:RegisterAnimationSequence("AR", var_3_139)

	local var_3_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 586
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 608
		}
	}

	var_3_22:RegisterAnimationSequence("AR", var_3_140)

	local var_3_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 178
		}
	}

	var_3_24:RegisterAnimationSequence("AR", var_3_141)

	local var_3_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 181
		}
	}

	var_3_26:RegisterAnimationSequence("AR", var_3_142)

	local var_3_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 950
		}
	}

	var_3_30:RegisterAnimationSequence("AR", var_3_143)

	local var_3_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1654
		}
	}

	var_3_34:RegisterAnimationSequence("AR", var_3_144)

	local var_3_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 163
		}
	}

	var_3_36:RegisterAnimationSequence("AR", var_3_145)

	local var_3_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 181
		}
	}

	var_3_38:RegisterAnimationSequence("AR", var_3_146)

	local var_3_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 163
		}
	}

	var_3_40:RegisterAnimationSequence("AR", var_3_147)

	local var_3_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 233
		}
	}

	var_3_42:RegisterAnimationSequence("AR", var_3_148)

	local var_3_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 251
		}
	}

	var_3_44:RegisterAnimationSequence("AR", var_3_149)

	local var_3_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 233
		}
	}

	var_3_46:RegisterAnimationSequence("AR", var_3_150)

	local var_3_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 335
		}
	}

	var_3_48:RegisterAnimationSequence("AR", var_3_151)

	local var_3_152 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 335
		}
	}

	var_3_50:RegisterAnimationSequence("AR", var_3_152)

	local var_3_153 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 420
		}
	}

	var_3_52:RegisterAnimationSequence("AR", var_3_153)

	local var_3_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 420
		}
	}

	var_3_54:RegisterAnimationSequence("AR", var_3_154)

	local var_3_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 513
		}
	}

	var_3_56:RegisterAnimationSequence("AR", var_3_155)

	local var_3_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 512
		}
	}

	var_3_58:RegisterAnimationSequence("AR", var_3_156)

	local var_3_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 614
		}
	}

	var_3_60:RegisterAnimationSequence("AR", var_3_157)

	local var_3_158 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 613
		}
	}

	var_3_62:RegisterAnimationSequence("AR", var_3_158)

	local var_3_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 700
		}
	}

	var_3_64:RegisterAnimationSequence("AR", var_3_159)

	local var_3_160 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 699
		}
	}

	var_3_66:RegisterAnimationSequence("AR", var_3_160)

	local var_3_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 780
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 802
		}
	}

	var_3_68:RegisterAnimationSequence("AR", var_3_161)

	local var_3_162 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 798
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 820
		}
	}

	var_3_70:RegisterAnimationSequence("AR", var_3_162)

	local var_3_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 780
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 802
		}
	}

	var_3_72:RegisterAnimationSequence("AR", var_3_163)

	local var_3_164 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 875
		}
	}

	var_3_74:RegisterAnimationSequence("AR", var_3_164)

	local var_3_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 893
		}
	}

	var_3_76:RegisterAnimationSequence("AR", var_3_165)

	local var_3_166 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 875
		}
	}

	var_3_78:RegisterAnimationSequence("AR", var_3_166)

	local function var_3_167()
		var_3_6:AnimateSequence("AR")
		var_3_12:AnimateSequence("AR")
		var_3_18:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
		var_3_22:AnimateSequence("AR")
		var_3_24:AnimateSequence("AR")
		var_3_26:AnimateSequence("AR")
		var_3_30:AnimateSequence("AR")
		var_3_34:AnimateSequence("AR")
		var_3_36:AnimateSequence("AR")
		var_3_38:AnimateSequence("AR")
		var_3_40:AnimateSequence("AR")
		var_3_42:AnimateSequence("AR")
		var_3_44:AnimateSequence("AR")
		var_3_46:AnimateSequence("AR")
		var_3_48:AnimateSequence("AR")
		var_3_50:AnimateSequence("AR")
		var_3_52:AnimateSequence("AR")
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
	end

	var_3_0._sequences.AR = var_3_167

	local var_3_168 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 769
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 787
		}
	}

	var_3_6:RegisterAnimationSequence("KORZHJP", var_3_168)

	local var_3_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 106
		}
	}

	var_3_12:RegisterAnimationSequence("KORZHJP", var_3_169)

	local var_3_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_3_18:RegisterAnimationSequence("KORZHJP", var_3_170)

	local var_3_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_3_20:RegisterAnimationSequence("KORZHJP", var_3_171)

	local var_3_172 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 589
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 607
		}
	}

	var_3_22:RegisterAnimationSequence("KORZHJP", var_3_172)

	local var_3_173 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 329
		}
	}

	var_3_34:RegisterAnimationSequence("KORZHJP", var_3_173)

	local function var_3_174()
		var_3_6:AnimateSequence("KORZHJP")
		var_3_12:AnimateSequence("KORZHJP")
		var_3_18:AnimateSequence("KORZHJP")
		var_3_20:AnimateSequence("KORZHJP")
		var_3_22:AnimateSequence("KORZHJP")
		var_3_34:AnimateSequence("KORZHJP")
	end

	var_3_0._sequences.KORZHJP = var_3_174

	local var_3_175 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1324
		}
	}

	var_3_32:RegisterAnimationSequence("FRDEITSP", var_3_175)

	local var_3_176 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_38:RegisterAnimationSequence("FRDEITSP", var_3_176)

	local var_3_177 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_40:RegisterAnimationSequence("FRDEITSP", var_3_177)

	local var_3_178 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 257
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_44:RegisterAnimationSequence("FRDEITSP", var_3_178)

	local var_3_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 239
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_46:RegisterAnimationSequence("FRDEITSP", var_3_179)

	local var_3_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 341
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_50:RegisterAnimationSequence("FRDEITSP", var_3_180)

	local var_3_181 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 426
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_54:RegisterAnimationSequence("FRDEITSP", var_3_181)

	local var_3_182 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_58:RegisterAnimationSequence("FRDEITSP", var_3_182)

	local var_3_183 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 619
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_62:RegisterAnimationSequence("FRDEITSP", var_3_183)

	local var_3_184 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 705
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_66:RegisterAnimationSequence("FRDEITSP", var_3_184)

	local var_3_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 798
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_70:RegisterAnimationSequence("FRDEITSP", var_3_185)

	local var_3_186 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 780
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_72:RegisterAnimationSequence("FRDEITSP", var_3_186)

	local var_3_187 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 899
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_76:RegisterAnimationSequence("FRDEITSP", var_3_187)

	local var_3_188 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 881
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1403
		}
	}

	var_3_78:RegisterAnimationSequence("FRDEITSP", var_3_188)

	local function var_3_189()
		var_3_32:AnimateSequence("FRDEITSP")
		var_3_38:AnimateSequence("FRDEITSP")
		var_3_40:AnimateSequence("FRDEITSP")
		var_3_44:AnimateSequence("FRDEITSP")
		var_3_46:AnimateSequence("FRDEITSP")
		var_3_50:AnimateSequence("FRDEITSP")
		var_3_54:AnimateSequence("FRDEITSP")
		var_3_58:AnimateSequence("FRDEITSP")
		var_3_62:AnimateSequence("FRDEITSP")
		var_3_66:AnimateSequence("FRDEITSP")
		var_3_70:AnimateSequence("FRDEITSP")
		var_3_72:AnimateSequence("FRDEITSP")
		var_3_76:AnimateSequence("FRDEITSP")
		var_3_78:AnimateSequence("FRDEITSP")
	end

	var_3_0._sequences.FRDEITSP = var_3_189

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPIntelAAR", CPIntelAAR)
LockTable(_M)
