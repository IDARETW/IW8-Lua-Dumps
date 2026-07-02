module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.ref == "sms_text_olena" or arg_1_1.ref == "sms_text_lyubov" or arg_1_1.ref == "sms_text_mom" then
		if IsLanguageRussian() then
			ACTIONS.AnimateSequence(arg_1_0, "HideTranslation")
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "ShowTranslation")
	end

	if arg_1_1.ref == "sms_text_baba" then
		if IsLanguageEnglish() then
			ACTIONS.AnimateSequence(arg_1_0, "HideTranslation")
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "ShowTranslation")
	end

	arg_1_0.TextImage:setImage(RegisterMaterial(arg_1_1.imageName), 0)
	arg_1_0.Translation:setText(Engine.CBBHFCGDIC(arg_1_1.desc))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Update = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function CPIntelText(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CPIntelText"
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

	var_3_4.id = "TextImage"

	var_3_4:setImage(RegisterMaterial("intel_text_Lyubov"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 893, _1080p * 1341, _1080p * 170, _1080p * 956)
	var_3_0:addElement(var_3_4)

	var_3_0.TextImage = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "DoubleNotchedBacker"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.8, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1383, _1080p * 1797, _1080p * 167, _1080p * 956)
	var_3_0:addElement(var_3_6)

	var_3_0.DoubleNotchedBacker = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Translation"

	var_3_8:SetRGBFromInt(10853781, 0)
	var_3_8:SetAlpha(0.8, 0)
	var_3_8:setText("CP_INTEL/text", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_8:SetStartupDelay(5000)
	var_3_8:SetLineHoldTime(2000)
	var_3_8:SetAnimMoveTime(150)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(5000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(38)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1403, _1080p * 1777, _1080p * 249, _1080p * 267)
	var_3_0:addElement(var_3_8)

	var_3_0.Translation = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Header"

	var_3_10:SetRGBFromInt(3431288, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("CP_INTEL/TRANSLATION"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1393, _1080p * 1785, _1080p * 193, _1080p * 217)
	var_3_0:addElement(var_3_10)

	var_3_0.Header = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Line"

	var_3_12:SetRGBFromInt(3431288, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1383, _1080p * 1797, _1080p * 222, _1080p * 221)
	var_3_0:addElement(var_3_12)

	var_3_0.Line = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("HideTranslation", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("HideTranslation", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("HideTranslation", var_3_16)

	local var_3_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("HideTranslation", var_3_17)

	local function var_3_18()
		var_3_6:AnimateSequence("HideTranslation")
		var_3_8:AnimateSequence("HideTranslation")
		var_3_10:AnimateSequence("HideTranslation")
		var_3_12:AnimateSequence("HideTranslation")
	end

	var_3_0._sequences.HideTranslation = var_3_18

	local var_3_19 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowTranslation", var_3_19)

	local var_3_20 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowTranslation", var_3_20)

	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowTranslation", var_3_21)

	local var_3_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ShowTranslation", var_3_22)

	local function var_3_23()
		var_3_6:AnimateSequence("ShowTranslation")
		var_3_8:AnimateSequence("ShowTranslation")
		var_3_10:AnimateSequence("ShowTranslation")
		var_3_12:AnimateSequence("ShowTranslation")
	end

	var_3_0._sequences.ShowTranslation = var_3_23

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 245
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_25)

	local function var_3_26()
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_26

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPIntelText", CPIntelText)
LockTable(_M)
