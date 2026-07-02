module(..., package.seeall)

local var_0_0 = "ui_streak_warning"

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.WarningIcon:GetCurrentAnchorsAndPositions()

	if arg_1_1.rule.isPassing then
		arg_1_1.WarningIcon:SetAlpha(0)
		arg_1_1:SetLeft(var_1_0.left)
		arg_1_1:SetRGBFromTable(SWATCHES.Registration.pass)
	else
		arg_1_1.WarningIcon:SetAlpha(arg_1_0._isVisible and 1 or 0)
		arg_1_1:SetLeft(var_1_0.left + arg_1_0._warningIconWidth)
		arg_1_1:SetRGBFromTable(SWATCHES.HUDMeters.value)
	end

	arg_1_0._isDefault = false
end

local function var_0_2(arg_2_0)
	local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_0.WarningIcon:getLocalRect()

	arg_2_0._warningIconWidth = var_2_2 - var_2_0

	arg_2_0.WarningIcon:closeTree()

	arg_2_0.WarningIcon = nil

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._reqs) do
		local var_2_4 = iter_2_1:GetCurrentAnchorsAndPositions()
		local var_2_5 = LUI.UIImage.new()

		var_2_5.id = "WarningIcon" .. iter_2_1.id

		var_2_5:SetAlpha(0)
		var_2_5:setImage(RegisterMaterial(var_0_0))
		var_2_5:SetAnchorsAndPosition(var_2_4.leftAnchor, var_2_4.rightAnchor, var_2_4.topAnchor, var_2_4.bottomAnchor, var_2_4.left, var_2_4.left + arg_2_0._warningIconWidth, var_2_4.top, var_2_4.bottom)
		arg_2_0:addElement(var_2_5)

		iter_2_1.WarningIcon = var_2_5
	end
end

local function var_0_3(arg_3_0)
	arg_3_0._isDefault = true
	arg_3_0._isVisible = false
	arg_3_0._reqs = {}
	arg_3_0.ReqLength.rule = REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.LENGTH]

	arg_3_0.ReqLength:setText(arg_3_0.ReqLength.rule.GetLocalizedString())
	table.insert(arg_3_0._reqs, arg_3_0.ReqLength)

	arg_3_0.ReqCharNum.rule = REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.CHAR_NUMBER]

	arg_3_0.ReqCharNum:setText(arg_3_0.ReqCharNum.rule.GetLocalizedString())
	table.insert(arg_3_0._reqs, arg_3_0.ReqCharNum)

	arg_3_0.ReqSeqential.rule = REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.SEQUENTIAL]

	arg_3_0.ReqSeqential:setText(arg_3_0.ReqSeqential.rule.GetLocalizedString())
	table.insert(arg_3_0._reqs, arg_3_0.ReqSeqential)

	arg_3_0.ReqConsecutive.rule = REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.CONSECUTIVE]

	arg_3_0.ReqConsecutive:setText(arg_3_0.ReqConsecutive.rule.GetLocalizedString())
	table.insert(arg_3_0._reqs, arg_3_0.ReqConsecutive)
end

local function var_0_4(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0._reqs) do
		if arg_4_1 then
			iter_4_1.WarningIcon:SetAlpha((iter_4_1.rule.isPassing or arg_4_0._isDefault) and 0 or 1)
		else
			iter_4_1.WarningIcon:SetAlpha(0)
		end
	end

	ACTIONS.AnimateSequence(arg_4_0, arg_4_1 and "On" or "Off")

	arg_4_0._isVisible = arg_4_1
end

local function var_0_5(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0._reqs) do
		local var_5_0 = iter_5_1.WarningIcon:GetCurrentAnchorsAndPositions()

		iter_5_1.WarningIcon:SetAlpha(0)
		iter_5_1:SetLeft(var_5_0.left)
		iter_5_1:SetRGBFromTable(SWATCHES.HUDMeters.value)
	end

	arg_5_0._isDefault = true
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.ReqLength)
	assert(arg_6_0.ReqCharNum)
	assert(arg_6_0.ReqSeqential)
	assert(arg_6_0.ReqConsecutive)
	assert(arg_6_0.WarningIcon)

	arg_6_0.Reset = var_0_5
	arg_6_0.SetVisible = var_0_4

	var_0_3(arg_6_0)
	arg_6_0:registerEventHandler("menu_create", function(arg_7_0, arg_7_1)
		var_0_2(arg_7_0)
		arg_7_0:Reset()
		ACTIONS.AnimateSequence(arg_7_0, "Off")
	end)
	arg_6_0:registerEventHandler("password_updated", function(arg_8_0, arg_8_1)
		for iter_8_0, iter_8_1 in ipairs(arg_6_0._reqs) do
			var_0_1(arg_8_0, iter_8_1)
		end

		return true
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end
end

function CODAccountPasswordReqs(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 342 * _1080p, 0, 290 * _1080p)

	var_9_0.id = "CODAccountPasswordReqs"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Background"

	var_9_4:SetRGBFromTable(SWATCHES.genericButton.backgroundDisabledFocus, 0)
	var_9_4:SetAlpha(0.8, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 44, _1080p * -53)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "BorderImg2"

	var_9_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_9_6:SetPixelGridEnabled(true)
	var_9_6:SetPixelGridContrast(0.5, 0)
	var_9_6:SetPixelGridBlockWidth(2, 0)
	var_9_6:SetPixelGridBlockHeight(2, 0)
	var_9_6:SetPixelGridGutterWidth(1, 0)
	var_9_6:SetPixelGridGutterHeight(1, 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 342, _1080p * -342, 0, _1080p * 44)
	var_9_0:addElement(var_9_6)

	var_9_0.BorderImg2 = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "BorderImg"

	var_9_8:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_9_8:SetPixelGridEnabled(true)
	var_9_8:SetPixelGridContrast(0.25, 0)
	var_9_8:SetPixelGridBlockWidth(2, 0)
	var_9_8:SetPixelGridBlockHeight(2, 0)
	var_9_8:SetPixelGridGutterWidth(1, 0)
	var_9_8:SetPixelGridGutterHeight(1, 0)
	var_9_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 342, _1080p * -342, 0, _1080p * 44)
	var_9_0:addElement(var_9_8)

	var_9_0.BorderImg = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "BorderBG"

	var_9_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, 0, 0, _1080p * 44)
	var_9_0:addElement(var_9_10)

	var_9_0.BorderBG = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIText.new()

	var_9_12.id = "Title"

	var_9_12:SetRGBFromTable(SWATCHES.text.buildNumber, 0)
	var_9_12:setText(Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_REQ_TITLE"), 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetAlignment(LUI.Alignment.Left)
	var_9_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 155, _1080p * 10, _1080p * 34)
	var_9_0:addElement(var_9_12)

	var_9_0.Title = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIImage.new()

	var_9_14.id = "WarningIcon"

	var_9_14:SetAlpha(0, 0)
	var_9_14:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_9_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * -134, _1080p * 48, _1080p * 70)
	var_9_0:addElement(var_9_14)

	var_9_0.WarningIcon = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIStyledText.new()

	var_9_16.id = "ReqLength"

	var_9_16:SetRGBFromTable(SWATCHES.HUDMeters.value, 0)
	var_9_16:setText("", 0)
	var_9_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_16:SetAlignment(LUI.Alignment.Left)
	var_9_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_16:SetStartupDelay(1000)
	var_9_16:SetLineHoldTime(400)
	var_9_16:SetAnimMoveTime(3000)
	var_9_16:SetAnimMoveSpeed(50)
	var_9_16:SetEndDelay(1000)
	var_9_16:SetCrossfadeTime(400)
	var_9_16:SetFadeInTime(300)
	var_9_16:SetFadeOutTime(300)
	var_9_16:SetMaxVisibleLines(2)
	var_9_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 155, _1080p * 48, _1080p * 70)
	var_9_0:addElement(var_9_16)

	var_9_0.ReqLength = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIStyledText.new()

	var_9_18.id = "ReqCharNum"

	var_9_18:SetRGBFromTable(SWATCHES.HUDMeters.value, 0)
	var_9_18:setText("", 0)
	var_9_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_18:SetAlignment(LUI.Alignment.Left)
	var_9_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_18:SetStartupDelay(1000)
	var_9_18:SetLineHoldTime(400)
	var_9_18:SetAnimMoveTime(3000)
	var_9_18:SetAnimMoveSpeed(50)
	var_9_18:SetEndDelay(1000)
	var_9_18:SetCrossfadeTime(400)
	var_9_18:SetFadeInTime(300)
	var_9_18:SetFadeOutTime(300)
	var_9_18:SetMaxVisibleLines(2)
	var_9_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 155, _1080p * 94, _1080p * 116)
	var_9_0:addElement(var_9_18)

	var_9_0.ReqCharNum = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIStyledText.new()

	var_9_20.id = "ReqSeqential"

	var_9_20:SetRGBFromTable(SWATCHES.HUDMeters.value, 0)
	var_9_20:setText("", 0)
	var_9_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_20:SetAlignment(LUI.Alignment.Left)
	var_9_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_20:SetStartupDelay(1000)
	var_9_20:SetLineHoldTime(400)
	var_9_20:SetAnimMoveTime(3000)
	var_9_20:SetAnimMoveSpeed(50)
	var_9_20:SetEndDelay(1000)
	var_9_20:SetCrossfadeTime(400)
	var_9_20:SetFadeInTime(300)
	var_9_20:SetFadeOutTime(300)
	var_9_20:SetMaxVisibleLines(2)
	var_9_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 155, _1080p * 138, _1080p * 160)
	var_9_0:addElement(var_9_20)

	var_9_0.ReqSeqential = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIStyledText.new()

	var_9_22.id = "ReqConsecutive"

	var_9_22:SetRGBFromTable(SWATCHES.HUDMeters.value, 0)
	var_9_22:setText("", 0)
	var_9_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_22:SetAlignment(LUI.Alignment.Left)
	var_9_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_22:SetStartupDelay(1000)
	var_9_22:SetLineHoldTime(400)
	var_9_22:SetAnimMoveTime(3000)
	var_9_22:SetAnimMoveSpeed(50)
	var_9_22:SetEndDelay(1000)
	var_9_22:SetCrossfadeTime(400)
	var_9_22:SetFadeInTime(300)
	var_9_22:SetFadeOutTime(300)
	var_9_22:SetMaxVisibleLines(2)
	var_9_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 155, _1080p * 182, _1080p * 204)
	var_9_0:addElement(var_9_22)

	var_9_0.ReqConsecutive = var_9_22

	local var_9_23
	local var_9_24 = LUI.UIImage.new()

	var_9_24.id = "Arrow"

	var_9_24:SetRGBFromTable(SWATCHES.HUD.HUDPrimary, 0)
	var_9_24:SetZRotation(180, 0)
	var_9_24:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -14, _1080p * -6, _1080p * 12, _1080p * 32)
	var_9_0:addElement(var_9_24)

	var_9_0.Arrow = var_9_24

	local function var_9_25()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_25

	local var_9_26 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("On", var_9_26)

	local var_9_27 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("On", var_9_27)

	local var_9_28 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("On", var_9_28)

	local var_9_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("On", var_9_29)

	local var_9_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("On", var_9_30)

	local var_9_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("On", var_9_31)

	local var_9_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("On", var_9_32)

	local var_9_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("On", var_9_33)

	local var_9_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("On", var_9_34)

	local var_9_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("On", var_9_35)

	local function var_9_36()
		var_9_4:AnimateSequence("On")
		var_9_6:AnimateSequence("On")
		var_9_8:AnimateSequence("On")
		var_9_10:AnimateSequence("On")
		var_9_12:AnimateSequence("On")
		var_9_16:AnimateSequence("On")
		var_9_18:AnimateSequence("On")
		var_9_20:AnimateSequence("On")
		var_9_22:AnimateSequence("On")
		var_9_24:AnimateSequence("On")
	end

	var_9_0._sequences.On = var_9_36

	local var_9_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("Off", var_9_37)

	local var_9_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Off", var_9_38)

	local var_9_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Off", var_9_39)

	local var_9_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Off", var_9_40)

	local var_9_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("Off", var_9_41)

	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("Off", var_9_42)

	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("Off", var_9_43)

	local var_9_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("Off", var_9_44)

	local var_9_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("Off", var_9_45)

	local var_9_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("Off", var_9_46)

	local function var_9_47()
		var_9_4:AnimateSequence("Off")
		var_9_6:AnimateSequence("Off")
		var_9_8:AnimateSequence("Off")
		var_9_10:AnimateSequence("Off")
		var_9_12:AnimateSequence("Off")
		var_9_16:AnimateSequence("Off")
		var_9_18:AnimateSequence("Off")
		var_9_20:AnimateSequence("Off")
		var_9_22:AnimateSequence("Off")
		var_9_24:AnimateSequence("Off")
	end

	var_9_0._sequences.Off = var_9_47

	local var_9_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_9_4:RegisterAnimationSequence("AR", var_9_48)

	local var_9_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 161
		}
	}

	var_9_12:RegisterAnimationSequence("AR", var_9_49)

	local var_9_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48
		}
	}

	var_9_14:RegisterAnimationSequence("AR", var_9_50)

	local var_9_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		}
	}

	var_9_16:RegisterAnimationSequence("AR", var_9_51)

	local var_9_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		}
	}

	var_9_18:RegisterAnimationSequence("AR", var_9_52)

	local var_9_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 198
		}
	}

	var_9_20:RegisterAnimationSequence("AR", var_9_53)

	local var_9_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 228
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 258
		}
	}

	var_9_22:RegisterAnimationSequence("AR", var_9_54)

	local function var_9_55()
		var_9_4:AnimateSequence("AR")
		var_9_12:AnimateSequence("AR")
		var_9_14:AnimateSequence("AR")
		var_9_16:AnimateSequence("AR")
		var_9_18:AnimateSequence("AR")
		var_9_20:AnimateSequence("AR")
		var_9_22:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_55

	var_9_0:addEventHandler("menu_create", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Off")
	end)
	var_0_6(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("CODAccountPasswordReqs", CODAccountPasswordReqs)
LockTable(_M)
