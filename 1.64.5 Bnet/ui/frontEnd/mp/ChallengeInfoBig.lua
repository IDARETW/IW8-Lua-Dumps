module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ChallengeInfoBigProgress0 and arg_1_0.ChallengeInfoBigProgress0.ChallengesTiers)

	if CONDITIONS.IsThirdGameMode(arg_1_0) then
		arg_1_0.CPScreen:SetMask(arg_1_0.CPScreenMask)

		if IsLanguageArabic() then
			arg_1_0.NameHeaderLeftBarCP:SetAlpha(0, 0)
			arg_1_0.DescLeftBarCP:SetAlpha(0, 0)
		end
	end

	arg_1_0:addEventHandler("selection_changed", function(arg_2_0, arg_2_1)
		assert(arg_2_1.newSelection)
		arg_1_0:SetDataSource(arg_2_1.newSelection:GetDataSource(arg_1_1), arg_1_1)
	end)

	local function var_1_0()
		if not arg_1_0:GetDataSource().isCompleted:GetValue(arg_1_1) then
			ACTIONS.AnimateSequence(arg_1_0, "Locked")
		else
			ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
		end

		local var_3_0 = arg_1_0:GetDataSource().isHiddenChallenge:GetValue(arg_1_1)

		if var_3_0 and var_3_0 ~= nil then
			ACTIONS.AnimateSequence(arg_1_0, "Hidden")
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "isCompleted", var_1_0)

	local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_MAX_TIER")

	arg_1_0.LockStatusLabel:setText(var_1_1, 0)

	local var_1_2 = arg_1_0.LockStatusLabel:GetCurrentFont()
	local var_1_3, var_1_4, var_1_5, var_1_6 = arg_1_0.LockStatusLabel:getLocalRect()
	local var_1_7 = math.abs(var_1_4 - var_1_6)
	local var_1_8, var_1_9, var_1_10, var_1_11 = GetTextDimensions(var_1_1, var_1_2, var_1_7)
	local var_1_12 = (var_1_10 - var_1_8 + 36) / 2

	arg_1_0.LockStatusLabel:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 304.5 - var_1_12, _1080p * 505, _1080p * 99.5, _1080p * 119.5)
	arg_1_0.Padlock:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 260.5 - var_1_12, _1080p * 296.5 - var_1_12, _1080p * -266.5, _1080p * -230.5)
end

function ChallengeInfoBig(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 521 * _1080p, 0, 716 * _1080p)

	var_4_0.id = "ChallengeInfoBig"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_4 = LUI.UIBlur.new()

		var_4_4.id = "ListBlur"

		var_4_4:SetBlurStrength(1.5, 0)
		var_4_0:addElement(var_4_4)

		var_4_0.ListBlur = var_4_4
	end

	local var_4_5

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_6 = LUI.UIImage.new()

		var_4_6.id = "GradientBackgroundInGameOnly"

		var_4_6:SetRGBFromInt(0, 0)
		var_4_6:SetAlpha(0.4, 0)
		var_4_0:addElement(var_4_6)

		var_4_0.GradientBackgroundInGameOnly = var_4_6
	end

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "GradBackroundCP"

	var_4_8:SetRGBFromInt(0, 0)
	var_4_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_0:addElement(var_4_8)

	var_4_0.GradBackroundCP = var_4_8

	local var_4_9

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_10 = LUI.UIImage.new()

		var_4_10.id = "CPScreen"

		var_4_10:SetAlpha(0.6, 0)
		var_4_10:setImage(RegisterMaterial("cp_faf_card_screen_backing_grad"), 0)
		var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -188, _1080p * 818, _1080p * 445, _1080p * 681)
		var_4_0:addElement(var_4_10)

		var_4_0.CPScreen = var_4_10
	end

	local var_4_11

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_12 = LUI.UIImage.new()

		var_4_12.id = "CPScreenMask"

		var_4_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top_opaque_dark"), 0)
		var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -188, _1080p * 818, _1080p * 445, _1080p * 681)
		var_4_0:addElement(var_4_12)

		var_4_0.CPScreenMask = var_4_12
	end

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "TicBRCopy1"

	var_4_14:SetAlpha(0.8, 0)
	var_4_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4, _1080p * -1)
	var_4_0:addElement(var_4_14)

	var_4_0.TicBRCopy1 = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "TicBRCopy2"

	var_4_16:SetAlpha(0.8, 0)
	var_4_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4)
	var_4_0:addElement(var_4_16)

	var_4_0.TicBRCopy2 = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIImage.new()

	var_4_18.id = "TicBRCopy3"

	var_4_18:SetAlpha(0.8, 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4, _1080p * -1)
	var_4_0:addElement(var_4_18)

	var_4_0.TicBRCopy3 = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "TicBRCopy4"

	var_4_20:SetAlpha(0.8, 0)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4)
	var_4_0:addElement(var_4_20)

	var_4_0.TicBRCopy4 = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIImage.new()

	var_4_22.id = "blackCopy0"

	var_4_22:SetRGBFromInt(0, 0)
	var_4_22:SetAlpha(0.5, 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 504, _1080p * 218, _1080p * 257)
	var_4_0:addElement(var_4_22)

	var_4_0.blackCopy0 = var_4_22

	local var_4_23

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_24 = LUI.UIStyledText.new()

		var_4_24.id = "Name"

		var_4_24:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
		var_4_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_24:SetAlignment(LUI.Alignment.Left)
		var_4_24:SetStartupDelay(1000)
		var_4_24:SetLineHoldTime(400)
		var_4_24:SetAnimMoveTime(150)
		var_4_24:SetAnimMoveSpeed(50)
		var_4_24:SetEndDelay(1000)
		var_4_24:SetCrossfadeTime(400)
		var_4_24:SetFadeInTime(300)
		var_4_24:SetFadeOutTime(300)
		var_4_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_24:SetMaxVisibleLines(1)
		var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21.35, _1080p * 499, _1080p * 221, _1080p * 253)
		var_4_0:addElement(var_4_24)

		var_4_0.Name = var_4_24
	end

	local var_4_25

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		var_4_25 = LUI.UIStyledText.new()
		var_4_25.id = "NameCP"

		var_4_25:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
		var_4_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_25:SetAlignment(LUI.Alignment.Left)
		var_4_25:SetStartupDelay(1000)
		var_4_25:SetLineHoldTime(400)
		var_4_25:SetAnimMoveTime(150)
		var_4_25:SetAnimMoveSpeed(50)
		var_4_25:SetEndDelay(1000)
		var_4_25:SetCrossfadeTime(400)
		var_4_25:SetFadeInTime(300)
		var_4_25:SetFadeOutTime(300)
		var_4_25:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_25:SetMaxVisibleLines(1)
		var_4_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21.35, _1080p * 499, _1080p * 221, _1080p * 269)
		var_4_0:addElement(var_4_25)

		var_4_0.NameCP = var_4_25
	end

	local var_4_26

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_27 = LUI.UIImage.new()

		var_4_27.id = "NameHeaderLeftBarCP"

		var_4_27:SetAlpha(0.3, 0)
		var_4_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 22, _1080p * 218, _1080p * 280)
		var_4_0:addElement(var_4_27)

		var_4_0.NameHeaderLeftBarCP = var_4_27
	end

	local var_4_28
	local var_4_29 = LUI.UIImage.new()

	var_4_29.id = "GradientBackgroundInGameOnlyCopy0"

	var_4_29:SetRGBFromInt(0, 0)
	var_4_29:SetAlpha(0, 0)
	var_4_29:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 14, _1080p * 205)
	var_4_0:addElement(var_4_29)

	var_4_0.GradientBackgroundInGameOnlyCopy0 = var_4_29

	local var_4_30
	local var_4_31 = LUI.UIImage.new()

	var_4_31.id = "Reward"

	var_4_31:setImage(RegisterMaterial("playercard_placeholder_background"), 0)
	var_4_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 505, _1080p * 14, _1080p * 205)
	var_4_0:addElement(var_4_31)

	var_4_0.Reward = var_4_31

	local var_4_32
	local var_4_33 = LUI.UIImage.new()

	var_4_33.id = "Darkening"

	var_4_33:SetRGBFromInt(0, 0)
	var_4_33:SetAlpha(0, 0)
	var_4_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 505, _1080p * 14, _1080p * 205)
	var_4_0:addElement(var_4_33)

	var_4_0.Darkening = var_4_33

	local var_4_34
	local var_4_35 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_4_1
	})

	var_4_35.id = "ButtonDescriptionText"

	var_4_35.Description:SetRight(_1080p * 470, 0)
	var_4_35.Description:SetRGBFromInt(16777215, 0)
	var_4_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21.35, _1080p * 480.35, _1080p * 266, _1080p * 298)
	var_4_0:addElement(var_4_35)

	var_4_0.ButtonDescriptionText = var_4_35

	local var_4_36

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_37 = LUI.UIImage.new()

		var_4_37.id = "DescLeftBarCP"

		var_4_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 22, _1080p * 297, _1080p * 307)
		var_4_0:addElement(var_4_37)

		var_4_0.DescLeftBarCP = var_4_37
	end

	local var_4_38
	local var_4_39 = LUI.UIImage.new()

	var_4_39.id = "blackCopy1"

	var_4_39:SetRGBFromInt(0, 0)
	var_4_39:SetAlpha(0, 0)
	var_4_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 505, _1080p * 89.5, _1080p * 128.5)
	var_4_0:addElement(var_4_39)

	var_4_0.blackCopy1 = var_4_39

	local var_4_40
	local var_4_41 = LUI.UIText.new()

	var_4_41.id = "LockStatusLabel"

	var_4_41:setText("Set in User Code", 0)
	var_4_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_41:SetAlignment(LUI.Alignment.Left)
	var_4_41:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 304.5, _1080p * 502, _1080p * 99.5, _1080p * 117.5)
	var_4_0:addElement(var_4_41)

	var_4_0.LockStatusLabel = var_4_41

	local var_4_42
	local var_4_43 = LUI.UIImage.new()

	var_4_43.id = "Padlock"

	var_4_43:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_4_43:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_43:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 260.5, _1080p * 296.5, _1080p * -266.5, _1080p * -230.5)
	var_4_0:addElement(var_4_43)

	var_4_0.Padlock = var_4_43

	local var_4_44
	local var_4_45 = LUI.UIText.new()

	var_4_45.id = "PlayerCardEarnedInfo"

	var_4_45:SetRGBFromInt(12566463, 0)
	var_4_45:SetAlpha(Subtract(0.5, 0.5), 0)
	var_4_45:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYER_CARD_EARNED"), 0)
	var_4_45:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_45:SetAlignment(LUI.Alignment.Right)
	var_4_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 45.48, _1080p * 489.48, _1080p * 668, _1080p * 686)
	var_4_0:addElement(var_4_45)

	var_4_0.PlayerCardEarnedInfo = var_4_45

	local var_4_46
	local var_4_47 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
		controllerIndex = var_4_1
	})

	var_4_47.id = "LineCopy1"

	var_4_47:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 205, _1080p * 206)
	var_4_0:addElement(var_4_47)

	var_4_0.LineCopy1 = var_4_47

	local var_4_48
	local var_4_49 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
		controllerIndex = var_4_1
	})

	var_4_49.id = "LineCopy2"

	var_4_49:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 13, _1080p * 14)
	var_4_0:addElement(var_4_49)

	var_4_0.LineCopy2 = var_4_49

	local var_4_50
	local var_4_51 = MenuBuilder.BuildRegisteredType("ChallengeInfoBigProgress", {
		controllerIndex = var_4_1
	})

	var_4_51.id = "ChallengeInfoBigProgress0"

	var_4_51:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
	var_4_0:addElement(var_4_51)

	var_4_0.ChallengeInfoBigProgress0 = var_4_51

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("DefaultSequence", var_4_52)

	local var_4_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("DefaultSequence", var_4_53)

	local var_4_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_39:RegisterAnimationSequence("DefaultSequence", var_4_54)

	local var_4_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_41:RegisterAnimationSequence("DefaultSequence", var_4_55)

	local var_4_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_43:RegisterAnimationSequence("DefaultSequence", var_4_56)

	local var_4_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_51:RegisterAnimationSequence("DefaultSequence", var_4_57)

	local function var_4_58()
		var_4_29:AnimateSequence("DefaultSequence")
		var_4_33:AnimateSequence("DefaultSequence")
		var_4_39:AnimateSequence("DefaultSequence")
		var_4_41:AnimateSequence("DefaultSequence")
		var_4_43:AnimateSequence("DefaultSequence")
		var_4_51:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_58

	local var_4_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 205
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_29:RegisterAnimationSequence("Locked", var_4_59)

	local var_4_60 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Locked", var_4_60)

	local var_4_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_39:RegisterAnimationSequence("Locked", var_4_61)

	local var_4_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_41:RegisterAnimationSequence("Locked", var_4_62)

	local var_4_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_43:RegisterAnimationSequence("Locked", var_4_63)

	local var_4_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_51:RegisterAnimationSequence("Locked", var_4_64)

	local function var_4_65()
		var_4_29:AnimateSequence("Locked")
		var_4_33:AnimateSequence("Locked")
		var_4_39:AnimateSequence("Locked")
		var_4_41:AnimateSequence("Locked")
		var_4_43:AnimateSequence("Locked")
		var_4_51:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_65

	local var_4_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("DefaultCP", var_4_66)

	local var_4_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("DefaultCP", var_4_67)

	local var_4_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("DefaultCP", var_4_68)

	local var_4_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("DefaultCP", var_4_69)

	local var_4_70 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 521
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_22:RegisterAnimationSequence("DefaultCP", var_4_70)

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 32
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 500
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 229
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 279
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_4_25:RegisterAnimationSequence("DefaultCP", var_4_71)
	end

	local var_4_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 286
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 318
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_35:RegisterAnimationSequence("DefaultCP", var_4_72)

	local function var_4_73()
		var_4_14:AnimateSequence("DefaultCP")
		var_4_16:AnimateSequence("DefaultCP")
		var_4_18:AnimateSequence("DefaultCP")
		var_4_20:AnimateSequence("DefaultCP")
		var_4_22:AnimateSequence("DefaultCP")

		if CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_25:AnimateSequence("DefaultCP")
		end

		var_4_35:AnimateSequence("DefaultCP")
	end

	var_4_0._sequences.DefaultCP = var_4_73

	local var_4_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_51:RegisterAnimationSequence("Hidden", var_4_74)

	local function var_4_75()
		var_4_51:AnimateSequence("Hidden")
	end

	var_4_0._sequences.Hidden = var_4_75

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "DefaultCP")
	end

	return var_4_0
end

MenuBuilder.registerType("ChallengeInfoBig", ChallengeInfoBig)
LockTable(_M)
