module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_3 == 1 then
		arg_1_0.ConnectLine:SetAlpha(0)
	else
		local var_1_0 = arg_1_1.unlocked and 1 or 0.3

		arg_1_0.ConnectLine:SetAlpha(var_1_0)
	end

	local var_1_1 = ATTACHMENT.GetRef(arg_1_1.ref, arg_1_2)

	arg_1_0.Icon:setImage(RegisterMaterial(ATTACHMENT.GetImage(var_1_1)))
	arg_1_0.Category:setText(Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_1_1.category)))
	arg_1_0.Name:setText(ATTACHMENT.GetName(var_1_1))

	if arg_1_1.unlocked == true then
		ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
		arg_1_0.UnlockLevel:setText(Engine.CBBHFCGDIC("CAS/UNLOCKED"))
	else
		arg_1_0.UnlockLevel:setText(Engine.CBBHFCGDIC("CAS/ATTACH_UNLOCK_LEVEL", tonumber(arg_1_1.gunsmithAttach.level) + 1))
		ACTIONS.AnimateSequence(arg_1_0, "Locked")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.ConnectLine)
	assert(arg_2_0.Icon)
	assert(arg_2_0.Category)
	assert(arg_2_0.Name)
	assert(arg_2_0.UnlockLevel)

	arg_2_0.Setup = var_0_0
end

function NextUnlockItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "NextUnlockItem"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "ConnectLine"

	var_3_6:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_3_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_3_6:SetUMax(8, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -180, 0, _1080p * -1, _1080p * 1)
	var_3_0:addElement(var_3_6)

	var_3_0.ConnectLine = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "UnlockLevel"

	var_3_8:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -44, _1080p * 44, _1080p * 214, _1080p * 242)
	var_3_0:addElement(var_3_8)

	var_3_0.UnlockLevel = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Icon"

	var_3_10:setImage(RegisterMaterial("icon_attachment_ar_falima_xmags"), 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -10, _1080p * 10, _1080p * -10)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Category"

	var_3_12:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt2, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -44, _1080p * 44, _1080p * 134, _1080p * 158)
	var_3_0:addElement(var_3_12)

	var_3_0.Category = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Name"

	var_3_14:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -86, _1080p * 86, _1080p * 158, _1080p * 183)
	var_3_0:addElement(var_3_14)

	var_3_0.Name = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Lock"

	var_3_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_3_16:SetColorOp(COLOR_OP.saturation, 0)
	var_3_16:SetColorOpParam(1, 0)
	var_3_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -25, _1080p * 27)
	var_3_0:addElement(var_3_16)

	var_3_0.Lock = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Unlocked", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_3_6:RegisterAnimationSequence("Unlocked", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Popups.highlight
		}
	}

	var_3_8:RegisterAnimationSequence("Unlocked", var_3_20)

	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Unlocked", var_3_21)

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Popups.subHeaderTxt2
		}
	}

	var_3_12:RegisterAnimationSequence("Unlocked", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Popups.bodyTxt
		}
	}

	var_3_14:RegisterAnimationSequence("Unlocked", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Unlocked", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("Unlocked")
		var_3_6:AnimateSequence("Unlocked")
		var_3_8:AnimateSequence("Unlocked")
		var_3_10:AnimateSequence("Unlocked")
		var_3_12:AnimateSequence("Unlocked")
		var_3_14:AnimateSequence("Unlocked")
		var_3_16:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_25

	local var_3_26 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Locked", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_dashed_line")
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_27)

	local var_3_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Popups.bodyTxt
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_28)

	local var_3_29 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Locked", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Popups.subHeaderTxt2
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Popups.bodyTxt
		}
	}

	var_3_14:RegisterAnimationSequence("Locked", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_32)

	local function var_3_33()
		var_3_4:AnimateSequence("Locked")
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_10:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")
		var_3_14:AnimateSequence("Locked")
		var_3_16:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_33

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("NextUnlockItem", NextUnlockItem)
LockTable(_M)
