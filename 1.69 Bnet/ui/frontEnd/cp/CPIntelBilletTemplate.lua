module(..., package.seeall)

function CPIntelBilletTemplate(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "CPIntelBilletTemplate"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(2171169, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 931, _1080p * 1687, _1080p * 57, _1080p * 988)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "FieldBacking"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_1_6:SetAlpha(0.86, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1665, _1080p * 181, _1080p * 610)
	var_1_0:addElement(var_1_6)

	var_1_0.FieldBacking = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "headshotImage"

	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1339, _1080p * 181, _1080p * 455)
	var_1_0:addElement(var_1_8)

	var_1_0.headshotImage = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "BorderName"

	var_1_11:SetRGBFromInt(10853781, 0)
	var_1_11:SetAlpha(0.4, 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1665, _1080p * 181, _1080p * 221)
	var_1_0:addElement(var_1_11)

	var_1_0.BorderName = var_1_11

	local var_1_12
	local var_1_13 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_14 = LUI.UIBorder.new(var_1_13)

	var_1_14.id = "BorderCodeName"

	var_1_14:SetRGBFromInt(10853781, 0)
	var_1_14:SetAlpha(0.4, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1665, _1080p * 220, _1080p * 260)
	var_1_0:addElement(var_1_14)

	var_1_0.BorderCodeName = var_1_14

	local var_1_15
	local var_1_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_17 = LUI.UIBorder.new(var_1_16)

	var_1_17.id = "BorderAliases"

	var_1_17:SetRGBFromInt(10853781, 0)
	var_1_17:SetAlpha(0.4, 0)
	var_1_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1665, _1080p * 259, _1080p * 299)
	var_1_0:addElement(var_1_17)

	var_1_0.BorderAliases = var_1_17

	local var_1_18
	local var_1_19 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_20 = LUI.UIBorder.new(var_1_19)

	var_1_20.id = "BorderDOB"

	var_1_20:SetRGBFromInt(10853781, 0)
	var_1_20:SetAlpha(0.4, 0)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1665, _1080p * 298, _1080p * 338)
	var_1_0:addElement(var_1_20)

	var_1_0.BorderDOB = var_1_20

	local var_1_21
	local var_1_22 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_23 = LUI.UIBorder.new(var_1_22)

	var_1_23.id = "BorderGender"

	var_1_23:SetRGBFromInt(10853781, 0)
	var_1_23:SetAlpha(0.4, 0)
	var_1_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1443, _1080p * 337, _1080p * 377)
	var_1_0:addElement(var_1_23)

	var_1_0.BorderGender = var_1_23

	local var_1_24
	local var_1_25 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_26 = LUI.UIBorder.new(var_1_25)

	var_1_26.id = "BorderNationality"

	var_1_26:SetRGBFromInt(10853781, 0)
	var_1_26:SetAlpha(0.4, 0)
	var_1_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1442, _1080p * 1665, _1080p * 337, _1080p * 377)
	var_1_0:addElement(var_1_26)

	var_1_0.BorderNationality = var_1_26

	local var_1_27
	local var_1_28 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_29 = LUI.UIBorder.new(var_1_28)

	var_1_29.id = "BorderLaterality"

	var_1_29:SetRGBFromInt(10853781, 0)
	var_1_29:SetAlpha(0.4, 0)
	var_1_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1665, _1080p * 376, _1080p * 416)
	var_1_0:addElement(var_1_29)

	var_1_0.BorderLaterality = var_1_29

	local var_1_30
	local var_1_31 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_32 = LUI.UIBorder.new(var_1_31)

	var_1_32.id = "BorderHeight"

	var_1_32:SetRGBFromInt(10853781, 0)
	var_1_32:SetAlpha(0.4, 0)
	var_1_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1341, _1080p * 1412, _1080p * 415, _1080p * 456)
	var_1_0:addElement(var_1_32)

	var_1_0.BorderHeight = var_1_32

	local var_1_33
	local var_1_34 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_35 = LUI.UIBorder.new(var_1_34)

	var_1_35.id = "BorderWeight"

	var_1_35:SetRGBFromInt(10853781, 0)
	var_1_35:SetAlpha(0.4, 0)
	var_1_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1411, _1080p * 1496, _1080p * 415, _1080p * 456)
	var_1_0:addElement(var_1_35)

	var_1_0.BorderWeight = var_1_35

	local var_1_36
	local var_1_37 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_38 = LUI.UIBorder.new(var_1_37)

	var_1_38.id = "BorderVision"

	var_1_38:SetRGBFromInt(10853781, 0)
	var_1_38:SetAlpha(0.4, 0)
	var_1_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1495, _1080p * 1564, _1080p * 415, _1080p * 456)
	var_1_0:addElement(var_1_38)

	var_1_0.BorderVision = var_1_38

	local var_1_39
	local var_1_40 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_41 = LUI.UIBorder.new(var_1_40)

	var_1_41.id = "BorderBlood"

	var_1_41:SetRGBFromInt(10853781, 0)
	var_1_41:SetAlpha(0.4, 0)
	var_1_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1563, _1080p * 1665, _1080p * 415, _1080p * 456)
	var_1_0:addElement(var_1_41)

	var_1_0.BorderBlood = var_1_41

	local var_1_42
	local var_1_43 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_44 = LUI.UIBorder.new(var_1_43)

	var_1_44.id = "BorderRelatives"

	var_1_44:SetRGBFromInt(10853781, 0)
	var_1_44:SetAlpha(0.4, 0)
	var_1_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 951, _1080p * 1665, _1080p * 455, _1080p * 513)
	var_1_0:addElement(var_1_44)

	var_1_0.BorderRelatives = var_1_44

	local var_1_45
	local var_1_46 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_47 = LUI.UIBorder.new(var_1_46)

	var_1_47.id = "BorderEye"

	var_1_47:SetRGBFromInt(10853781, 0)
	var_1_47:SetAlpha(0.4, 0)
	var_1_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 951, _1080p * 1055, _1080p * 512, _1080p * 553)
	var_1_0:addElement(var_1_47)

	var_1_0.BorderEye = var_1_47

	local var_1_48
	local var_1_49 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_50 = LUI.UIBorder.new(var_1_49)

	var_1_50.id = "BorderHair"

	var_1_50:SetRGBFromInt(10853781, 0)
	var_1_50:SetAlpha(0.4, 0)
	var_1_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1054, _1080p * 1187, _1080p * 512, _1080p * 553)
	var_1_0:addElement(var_1_50)

	var_1_0.BorderHair = var_1_50

	local var_1_51
	local var_1_52 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_53 = LUI.UIBorder.new(var_1_52)

	var_1_53.id = "BorderLanguages"

	var_1_53:SetRGBFromInt(10853781, 0)
	var_1_53:SetAlpha(0.4, 0)
	var_1_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1186, _1080p * 1496, _1080p * 512, _1080p * 553)
	var_1_0:addElement(var_1_53)

	var_1_0.BorderLanguages = var_1_53

	local var_1_54
	local var_1_55 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_56 = LUI.UIBorder.new(var_1_55)

	var_1_56.id = "BorderChildren"

	var_1_56:SetRGBFromInt(10853781, 0)
	var_1_56:SetAlpha(0.4, 0)
	var_1_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1495, _1080p * 1665, _1080p * 512, _1080p * 553)
	var_1_0:addElement(var_1_56)

	var_1_0.BorderChildren = var_1_56

	local var_1_57
	local var_1_58 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_59 = LUI.UIBorder.new(var_1_58)

	var_1_59.id = "BorderMarital"

	var_1_59:SetRGBFromInt(10853781, 0)
	var_1_59:SetAlpha(0.4, 0)
	var_1_59:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1495, _1080p * 1665, _1080p * 455, _1080p * 513)
	var_1_0:addElement(var_1_59)

	var_1_0.BorderMarital = var_1_59

	local var_1_60
	local var_1_61 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_62 = LUI.UIBorder.new(var_1_61)

	var_1_62.id = "BorderSpecialist"

	var_1_62:SetRGBFromInt(10853781, 0)
	var_1_62:SetAlpha(0.4, 0)
	var_1_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 951, _1080p * 1665, _1080p * 552, _1080p * 610)
	var_1_0:addElement(var_1_62)

	var_1_0.BorderSpecialist = var_1_62

	local var_1_63
	local var_1_64 = LUI.UIImage.new()

	var_1_64.id = "BarTop"

	var_1_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 931, _1080p * 1687, _1080p * 54, _1080p * 77)
	var_1_0:addElement(var_1_64)

	var_1_0.BarTop = var_1_64

	local var_1_65
	local var_1_66 = LUI.UIImage.new()

	var_1_66.id = "BarBottomLine"

	var_1_66:SetRGBFromInt(15132390, 0)
	var_1_66:SetAlpha(0, 0)
	var_1_66:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1665, _1080p * 949, _1080p * 950)
	var_1_0:addElement(var_1_66)

	var_1_0.BarBottomLine = var_1_66

	return var_1_0
end

MenuBuilder.registerType("CPIntelBilletTemplate", CPIntelBilletTemplate)
LockTable(_M)
