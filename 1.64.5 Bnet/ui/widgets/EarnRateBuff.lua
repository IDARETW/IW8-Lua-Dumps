module(..., package.seeall)

local var_0_0 = 10

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.EarnRate:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_BUFF", var_0_0))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if BATTLEPASS.IsOwned(arg_1_1) then
		ACTIONS.AnimateSequence(arg_1_0, "Show")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Hide")
	end
end

function EarnRateBuff(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "EarnRateBuff"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "BuffIcon"

	var_2_4:setImage(RegisterMaterial("icon_double_buff_xp"), 0)
	var_2_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, 0, _1080p * -16, _1080p * 16)
	var_2_0:addElement(var_2_4)

	var_2_0.BuffIcon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "EarnRate"

	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_BUFF"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -32, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.EarnRate = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "BattlePassOwned"

	var_2_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_2_8:setText(Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS_OWNED"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_8:SetStartupDelay(1000)
	var_2_8:SetLineHoldTime(400)
	var_2_8:SetAnimMoveTime(1500)
	var_2_8:SetAnimMoveSpeed(1500)
	var_2_8:SetEndDelay(1000)
	var_2_8:SetCrossfadeTime(400)
	var_2_8:SetFadeInTime(300)
	var_2_8:SetFadeOutTime(300)
	var_2_8:SetMaxVisibleLines(1)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 199, _1080p * -18, 0)
	var_2_0:addElement(var_2_8)

	var_2_0.BattlePassOwned = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10
	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_12

	local var_2_13
	local var_2_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Hide", var_2_14)

	local var_2_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Hide", var_2_15)

	local var_2_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Hide", var_2_16)

	local function var_2_17()
		var_2_4:AnimateSequence("Hide")
		var_2_6:AnimateSequence("Hide")
		var_2_8:AnimateSequence("Hide")
	end

	var_2_0._sequences.Hide = var_2_17

	local var_2_18
	local var_2_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Show", var_2_19)

	local var_2_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Show", var_2_20)

	local var_2_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Show", var_2_21)

	local function var_2_22()
		var_2_4:AnimateSequence("Show")
		var_2_6:AnimateSequence("Show")
		var_2_8:AnimateSequence("Show")
	end

	var_2_0._sequences.Show = var_2_22

	local var_2_23
	local var_2_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_2_8:RegisterAnimationSequence("LabelLeft", var_2_24)

	local function var_2_25()
		var_2_8:AnimateSequence("LabelLeft")
	end

	var_2_0._sequences.LabelLeft = var_2_25

	local var_2_26
	local var_2_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ShowXPBoostAndIcon", var_2_27)

	local var_2_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_2_6:RegisterAnimationSequence("ShowXPBoostAndIcon", var_2_28)

	local var_2_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ShowXPBoostAndIcon", var_2_29)

	local function var_2_30()
		var_2_4:AnimateSequence("ShowXPBoostAndIcon")
		var_2_6:AnimateSequence("ShowXPBoostAndIcon")
		var_2_8:AnimateSequence("ShowXPBoostAndIcon")
	end

	var_2_0._sequences.ShowXPBoostAndIcon = var_2_30

	local var_2_31
	local var_2_32 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("LabelLeftNotOwned", var_2_32)

	local var_2_33 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("LabelLeftNotOwned", var_2_33)

	local var_2_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZError
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS_NOT_OWNED")
		}
	}

	var_2_8:RegisterAnimationSequence("LabelLeftNotOwned", var_2_34)

	local function var_2_35()
		var_2_4:AnimateSequence("LabelLeftNotOwned")
		var_2_6:AnimateSequence("LabelLeftNotOwned")
		var_2_8:AnimateSequence("LabelLeftNotOwned")
	end

	var_2_0._sequences.LabelLeftNotOwned = var_2_35

	local var_2_36
	local var_2_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ShowXPBoostOnly", var_2_37)

	local var_2_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_2_6:RegisterAnimationSequence("ShowXPBoostOnly", var_2_38)

	local var_2_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ShowXPBoostOnly", var_2_39)

	local function var_2_40()
		var_2_4:AnimateSequence("ShowXPBoostOnly")
		var_2_6:AnimateSequence("ShowXPBoostOnly")
		var_2_8:AnimateSequence("ShowXPBoostOnly")
	end

	var_2_0._sequences.ShowXPBoostOnly = var_2_40

	var_0_1(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("EarnRateBuff", EarnRateBuff)
LockTable(_M)
