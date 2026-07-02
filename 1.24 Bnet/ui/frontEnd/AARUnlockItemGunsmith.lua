module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._attachmentImageTable = {
		arg_1_0.AttachmentImage1,
		arg_1_0.AttachmentImage2,
		arg_1_0.AttachmentImage3
	}
	arg_1_0._attachmentNameTable = {
		arg_1_0.AttachmentName1,
		arg_1_0.AttachmentName2,
		arg_1_0.AttachmentName3
	}

	assert(#arg_1_0._attachmentImageTable == #arg_1_0._attachmentNameTable)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.weaponRef)
	assert(arg_2_2.attachmentsData)

	local var_2_0 = WEAPON.GetName(arg_2_2.weaponRef)
	local var_2_1 = WEAPON.GetWeaponClass(arg_2_2.weaponRef)
	local var_2_2 = WEAPON.GetProgressionImage(arg_2_2.weaponRef)
	local var_2_3 = PROGRESSION.GetWeaponLevel(arg_2_1, arg_2_2.weaponRef)

	arg_2_0.WeaponName:setText(var_2_0)
	arg_2_0.WeaponClass:setText(WEAPON.GetClassName(var_2_1))
	arg_2_0.WeaponImage:setImage(RegisterMaterial(var_2_2))
	arg_2_0.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_FACTION_LEVEL", var_2_3))

	for iter_2_0 = 1, #arg_2_0._attachmentImageTable do
		local var_2_4 = arg_2_2.attachmentsData[iter_2_0]

		if var_2_4 then
			local var_2_5 = var_2_4.name

			arg_2_0._attachmentNameTable[iter_2_0]:SetAlpha(1)
			arg_2_0._attachmentNameTable[iter_2_0]:setText(var_2_5)

			if var_2_4.icon and #var_2_4.icon > 0 then
				arg_2_0._attachmentImageTable[iter_2_0]:SetAlpha(1)
				arg_2_0._attachmentImageTable[iter_2_0]:setImage(RegisterMaterial(var_2_4.icon))
			else
				arg_2_0._attachmentImageTable[iter_2_0]:SetAlpha(0)
			end
		else
			arg_2_0._attachmentNameTable[iter_2_0]:SetAlpha(0)
			arg_2_0._attachmentImageTable[iter_2_0]:SetAlpha(0)
		end
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.WeaponImage)
	assert(arg_3_0.WeaponName)
	assert(arg_3_0.AttachmentImage1)
	assert(arg_3_0.AttachmentImage2)
	assert(arg_3_0.AttachmentImage3)
	assert(arg_3_0.AttachmentName1)
	assert(arg_3_0.AttachmentName2)
	assert(arg_3_0.AttachmentName3)
	var_0_0(arg_3_0, arg_3_1)

	arg_3_0.SetFocusable = SetFocusable
	arg_3_0.SetupGunsmithUnlockData = var_0_1
end

function AARUnlockItemGunsmith(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 840 * _1080p, 0, 190 * _1080p)

	var_4_0.id = "AARUnlockItemGunsmith"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_7 = LUI.UIBorder.new(var_4_6)

	var_4_7.id = "Border"

	var_4_7:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 323, _1080p * 824, _1080p * 15, _1080p * 175)
	var_4_0:addElement(var_4_7)

	var_4_0.Border = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIStyledText.new()

	var_4_9.id = "AttachmentName3"

	var_4_9:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_9:setText("", 0)
	var_4_9:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_9:SetAlignment(LUI.Alignment.Center)
	var_4_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_9:SetStartupDelay(1000)
	var_4_9:SetLineHoldTime(400)
	var_4_9:SetAnimMoveTime(150)
	var_4_9:SetAnimMoveSpeed(50)
	var_4_9:SetEndDelay(1000)
	var_4_9:SetCrossfadeTime(400)
	var_4_9:SetFadeInTime(300)
	var_4_9:SetFadeOutTime(300)
	var_4_9:SetMaxVisibleLines(2)
	var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 653, _1080p * 809, _1080p * 121, _1080p * 143)
	var_4_0:addElement(var_4_9)

	var_4_0.AttachmentName3 = var_4_9

	local var_4_10
	local var_4_11 = LUI.UIStyledText.new()

	var_4_11.id = "AttachmentName2"

	var_4_11:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_11:setText("", 0)
	var_4_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_11:SetAlignment(LUI.Alignment.Center)
	var_4_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_11:SetStartupDelay(1000)
	var_4_11:SetLineHoldTime(400)
	var_4_11:SetAnimMoveTime(150)
	var_4_11:SetAnimMoveSpeed(50)
	var_4_11:SetEndDelay(1000)
	var_4_11:SetCrossfadeTime(400)
	var_4_11:SetFadeInTime(300)
	var_4_11:SetFadeOutTime(300)
	var_4_11:SetMaxVisibleLines(2)
	var_4_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 495, _1080p * 652, _1080p * 121, _1080p * 143)
	var_4_0:addElement(var_4_11)

	var_4_0.AttachmentName2 = var_4_11

	local var_4_12
	local var_4_13 = LUI.UIStyledText.new()

	var_4_13.id = "AttachmentName1"

	var_4_13:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_13:setText("", 0)
	var_4_13:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_13:SetAlignment(LUI.Alignment.Center)
	var_4_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_13:SetStartupDelay(1000)
	var_4_13:SetLineHoldTime(400)
	var_4_13:SetAnimMoveTime(150)
	var_4_13:SetAnimMoveSpeed(50)
	var_4_13:SetEndDelay(1000)
	var_4_13:SetCrossfadeTime(400)
	var_4_13:SetFadeInTime(300)
	var_4_13:SetFadeOutTime(300)
	var_4_13:SetMaxVisibleLines(2)
	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 341, _1080p * 497, _1080p * 121, _1080p * 143)
	var_4_0:addElement(var_4_13)

	var_4_0.AttachmentName1 = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIImage.new()

	var_4_15.id = "AttachmentImage1"

	var_4_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 379, _1080p * 459, _1080p * 34, _1080p * 114)
	var_4_0:addElement(var_4_15)

	var_4_0.AttachmentImage1 = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIImage.new()

	var_4_17.id = "AttachmentImage2"

	var_4_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 533, _1080p * 613, _1080p * 36, _1080p * 116)
	var_4_0:addElement(var_4_17)

	var_4_0.AttachmentImage2 = var_4_17

	local var_4_18
	local var_4_19 = LUI.UIImage.new()

	var_4_19.id = "AttachmentImage3"

	var_4_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 691, _1080p * 771, _1080p * 34, _1080p * 114)
	var_4_0:addElement(var_4_19)

	var_4_0.AttachmentImage3 = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "WeaponImage"

	var_4_21:setImage(RegisterMaterial("icon_weapon_ar_akilo47"), 0)
	var_4_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 268, _1080p * 61, _1080p * 181)
	var_4_0:addElement(var_4_21)

	var_4_0.WeaponImage = var_4_21

	local var_4_22
	local var_4_23 = LUI.UIText.new()

	var_4_23.id = "WeaponName"

	var_4_23:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_23:setText("", 0)
	var_4_23:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_23:SetAlignment(LUI.Alignment.Left)
	var_4_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 308, _1080p * 12, _1080p * 34)
	var_4_0:addElement(var_4_23)

	var_4_0.WeaponName = var_4_23

	local var_4_24
	local var_4_25 = LUI.UIText.new()

	var_4_25.id = "WeaponClass"

	var_4_25:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_4_25:setText("", 0)
	var_4_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_25:SetAlignment(LUI.Alignment.Left)
	var_4_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 308, _1080p * 36, _1080p * 60)
	var_4_0:addElement(var_4_25)

	var_4_0.WeaponClass = var_4_25

	local var_4_26
	local var_4_27 = LUI.UIText.new()

	var_4_27.id = "WeaponLevel"

	var_4_27:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_27:setText("Level 99", 0)
	var_4_27:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_27:SetAlignment(LUI.Alignment.Left)
	var_4_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 308, _1080p * 153, _1080p * 175)
	var_4_0:addElement(var_4_27)

	var_4_0.WeaponLevel = var_4_27

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("AARUnlockItemGunsmith", AARUnlockItemGunsmith)
LockTable(_M)
