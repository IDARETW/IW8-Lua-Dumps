module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._friendLabel = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._friendLabel and arg_2_1 then
		arg_2_0._friendCount = tostring(arg_2_1)

		arg_2_0.FriendLabel:setText(Engine.CBBHFCGDIC(arg_2_0._friendLabel, arg_2_0._friendCount))
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetFriendLabel = var_0_0
	arg_3_0.SetFriendCount = var_0_1

	if Dvar.IBEGCHEFE("ui_blades_hide_friend_counts") then
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("Hide", CONDITIONS.IsWZWipDvarEnabled()))
	else
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("Show", CONDITIONS.IsWZWipDvarEnabled()))
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")

		if IsLanguageJapanese() then
			ACTIONS.AnimateSequence(arg_3_0, "WZWipJA")
		end
	end
end

function WZBladesFriendCount(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 312 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "WZBladesFriendCount"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_3 = LUI.UIImage.new()
		var_4_3.id = "WZWipFriendBacker"

		var_4_3:SetRGBFromInt(9800312, 0)
		var_4_3:SetAlpha(0.2, 0)
		var_4_3:setImage(RegisterMaterial("ui_mp_br_shared_rounded_rectangle_ch2"), 0)
		var_4_3:Setup9SliceImage(_1080p * 5, _1080p * 5, 0.3, 0.3)
		var_4_3:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 156, _1080p * 2, _1080p * 30)
		var_4_0:addElement(var_4_3)

		var_4_0.WZWipFriendBacker = var_4_3
	end

	local var_4_4
	local var_4_5 = LUI.UIImage.new()

	var_4_5.id = "FriendBacker"

	var_4_5:SetRGBFromTable(SWATCHES.CH2.Ch2Brown, 0)
	var_4_5:SetAlpha(0.3, 0)
	var_4_5:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 156, _1080p * 2, _1080p * 29)
	var_4_0:addElement(var_4_5)

	var_4_0.FriendBacker = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIStyledText.new()

	var_4_7.id = "FriendLabel"

	var_4_7:setText(Engine.CBBHFCGDIC("MENU/FRIENDS_PLAYING"), 0)
	var_4_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_7:SetAlignment(LUI.Alignment.Center)
	var_4_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -80, _1080p * 105, _1080p * 4, _1080p * 28)
	var_4_0:addElement(var_4_7)

	var_4_0.FriendLabel = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIImage.new()

	var_4_9.id = "FriendImage"

	var_4_9:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_4_9:setImage(RegisterMaterial("blade_friend"), 0)
	var_4_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -112, _1080p * -88, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_9)

	var_4_0.FriendImage = var_4_9

	local function var_4_10()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.AccordionRefresh = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -156
		}
	}

	var_4_5:RegisterAnimationSequence("ARBladeOver", var_4_13)

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_4_7:RegisterAnimationSequence("ARBladeOver", var_4_14)

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -107
		}
	}

	var_4_9:RegisterAnimationSequence("ARBladeOver", var_4_15)

	local function var_4_16()
		var_4_5:AnimateSequence("ARBladeOver")
		var_4_7:AnimateSequence("ARBladeOver")
		var_4_9:AnimateSequence("ARBladeOver")
	end

	var_4_0._sequences.ARBladeOver = var_4_16

	local var_4_17
	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		}
	}

	var_4_5:RegisterAnimationSequence("ARBladeUp", var_4_18)

	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_4_7:RegisterAnimationSequence("ARBladeUp", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_9:RegisterAnimationSequence("ARBladeUp", var_4_20)

	local function var_4_21()
		var_4_5:AnimateSequence("ARBladeUp")
		var_4_7:AnimateSequence("ARBladeUp")
		var_4_9:AnimateSequence("ARBladeUp")
	end

	var_4_0._sequences.ARBladeUp = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Hide", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Hide", var_4_24)

	local var_4_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("Hide", var_4_25)

	local function var_4_26()
		var_4_5:AnimateSequence("Hide")
		var_4_7:AnimateSequence("Hide")
		var_4_9:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_26

	local var_4_27

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_28 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -156
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 156
			}
		}

		var_4_3:RegisterAnimationSequence("WZWipARBladeOver", var_4_28)
	end

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipARBladeOver", var_4_29)

	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -107
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipARBladeOver", var_4_30)

	local function var_4_31()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_3:AnimateSequence("WZWipARBladeOver")
		end

		var_4_7:AnimateSequence("WZWipARBladeOver")
		var_4_9:AnimateSequence("WZWipARBladeOver")
	end

	var_4_0._sequences.WZWipARBladeOver = var_4_31

	local var_4_32

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_33 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -30
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 30
			}
		}

		var_4_3:RegisterAnimationSequence("WZWipARBladeUp", var_4_33)
	end

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipARBladeUp", var_4_34)

	local var_4_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipARBladeUp", var_4_35)

	local function var_4_36()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_3:AnimateSequence("WZWipARBladeUp")
		end

		var_4_7:AnimateSequence("WZWipARBladeUp")
		var_4_9:AnimateSequence("WZWipARBladeUp")
	end

	var_4_0._sequences.WZWipARBladeUp = var_4_36

	local var_4_37

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_38 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("WZWipHide", var_4_38)
	end

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipHide", var_4_39)

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipHide", var_4_40)

	local function var_4_41()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_3:AnimateSequence("WZWipHide")
		end

		var_4_7:AnimateSequence("WZWipHide")
		var_4_9:AnimateSequence("WZWipHide")
	end

	var_4_0._sequences.WZWipHide = var_4_41

	local var_4_42

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_43 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("WZWipShow", var_4_43)
	end

	local var_4_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipShow", var_4_44)

	local var_4_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipShow", var_4_45)

	local function var_4_46()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_3:AnimateSequence("WZWipShow")
		end

		var_4_7:AnimateSequence("WZWipShow")
		var_4_9:AnimateSequence("WZWipShow")
	end

	var_4_0._sequences.WZWipShow = var_4_46

	local var_4_47
	local var_4_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("WZWipSetup", var_4_48)

	local var_4_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipSetup", var_4_49)

	local function var_4_50()
		var_4_5:AnimateSequence("WZWipSetup")
		var_4_7:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_50

	local var_4_51
	local var_4_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			value = false,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 107
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipJA", var_4_52)

	local function var_4_53()
		var_4_7:AnimateSequence("WZWipJA")
	end

	var_4_0._sequences.WZWipJA = var_4_53

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WZBladesFriendCount", WZBladesFriendCount)
LockTable(_M)
