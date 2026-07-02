module(..., package.seeall)

local var_0_0 = {
	equip_c4 = Engine.CBBHFCGDIC("EQUIPMENT/C4_DESC_KBM")
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LOOT.GetTypeForID(arg_1_2)
	local var_1_1 = LOOT.GetItemRef(var_1_0, arg_1_2)
	local var_1_2 = LOOT.GetItemProgressionImage(var_1_0, var_1_1)
	local var_1_3 = LOOT.GetItemName(var_1_0, var_1_1)
	local var_1_4 = LOOT.GetItemDescription(var_1_0, var_1_1)
	local var_1_5 = LOOT.GetItemClassName(var_1_0, var_1_1)

	var_1_4 = not Engine.BGGJFFFAFG(arg_1_1) and var_0_0[var_1_1] or var_1_4

	arg_1_0.UnlockIcon:SetAlpha(0, 200)
	arg_1_0.UnlockName:SetAlpha(0, 200)
	arg_1_0.UnlockName:SetDecodeParams(0, 0, 0)
	arg_1_0.UnlockName:setText("")
	arg_1_0.UnlockType:SetAlpha(0, 200)

	arg_1_0:Wait(200).onComplete = function()
		local var_2_0 = RegisterMaterial(var_1_2)

		if Engine.DFEIGFBEH(var_2_0) > 1 then
			ACTIONS.AnimateSequence(arg_1_0, "Icon2x1")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Icon1x1")
		end

		arg_1_0.UnlockIcon:setImage(var_2_0)
		arg_1_0.UnlockIcon:SetAlpha(1, 200)
		arg_1_0.UnlockName:setText(var_1_3)
		arg_1_0.UnlockName:SetAlpha(1, 200)
		arg_1_0.UnlockName:SetDecodeParams(40, 1, 2)
		arg_1_0.UnlockDescription:setText(var_1_4)
		arg_1_0.UnlockDescription:SetAlpha(1, 200)
		arg_1_0.UnlockType:setText(var_1_5)
		arg_1_0.UnlockType:SetAlpha(1, 200)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateUnlockData = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	elseif IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_3_0, "KORZHJP")
	end
end

function UnlocksLootItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "UnlocksLootItem"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "UnlockIcon"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -182, _1080p * 74)
	var_4_0:addElement(var_4_4)

	var_4_0.UnlockIcon = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "UnlockDescription"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetLeading(3 * _1080p, 0)
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -245, _1080p * 245, _1080p * 156, _1080p * 174)
	var_4_0:addElement(var_4_6)

	var_4_0.UnlockDescription = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "UnlockName"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * 119, _1080p * 149)
	var_4_0:addElement(var_4_8)

	var_4_0.UnlockName = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "UnlockType"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_10:setText("TEMP - Unlock Type", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * 91, _1080p * 119)
	var_4_0:addElement(var_4_10)

	var_4_0.UnlockType = var_4_10

	local var_4_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_11)

	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("DefaultSequence", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("DefaultSequence")
		var_4_10:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_13

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		}
	}

	var_4_4:RegisterAnimationSequence("Icon1x1", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("Icon1x1")
	end

	var_4_0._sequences.Icon1x1 = var_4_15

	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		}
	}

	var_4_4:RegisterAnimationSequence("Icon2x1", var_4_16)

	local function var_4_17()
		var_4_4:AnimateSequence("Icon2x1")
	end

	var_4_0._sequences.Icon2x1 = var_4_17

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 183
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -3 * _1080p
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_18)

	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("AR")
		var_4_8:AnimateSequence("AR")
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_21

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = 7 * _1080p
		}
	}

	var_4_6:RegisterAnimationSequence("KORZHJP", var_4_22)

	local function var_4_23()
		var_4_6:AnimateSequence("KORZHJP")
	end

	var_4_0._sequences.KORZHJP = var_4_23

	var_0_2(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("UnlocksLootItem", UnlocksLootItem)
LockTable(_M)
