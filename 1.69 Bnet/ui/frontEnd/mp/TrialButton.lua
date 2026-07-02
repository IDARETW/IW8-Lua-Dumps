module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.bestScore ~= 0 then
		if arg_1_1.scoreType == "time" then
			if arg_1_1.bestScore <= tonumber(arg_1_1.tier3) then
				ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier3")
			elseif arg_1_1.bestScore <= tonumber(arg_1_1.tier2) then
				ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier2")
			elseif arg_1_1.bestScore <= tonumber(arg_1_1.tier1) then
				ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier1")
			else
				ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier0")
			end
		elseif arg_1_1.bestScore >= tonumber(arg_1_1.tier3) then
			ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier3")
		elseif arg_1_1.bestScore >= tonumber(arg_1_1.tier2) then
			ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier2")
		elseif arg_1_1.bestScore >= tonumber(arg_1_1.tier1) then
			ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier1")
		else
			ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier0")
		end
	else
		ACTIONS.AnimateSequence(arg_1_0.Stars, "Tier0")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.BackgroundImage)

	arg_2_0.SetBestScoreStars = var_0_0

	arg_2_0.BackgroundImage:SetMask(arg_2_0.Mask)

	local var_2_0 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")

	local function var_2_1()
		arg_2_0:SetButtonDisabled(var_2_0:GetValue(arg_2_1))
	end

	arg_2_0:SubscribeToModel(var_2_0:GetModel(arg_2_1), var_2_1)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("disable", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, "Disabled")
	end)
	arg_2_0:addEventHandler("enable", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "Enabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function TrialButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 197 * _1080p)

	var_8_0.id = "TrialButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "BackgroundImage"

	var_8_0:addElement(var_8_4)

	var_8_0.BackgroundImage = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Mask"

	var_8_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 197)
	var_8_0:addElement(var_8_6)

	var_8_0.Mask = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Lock"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -340, _1080p * -310, _1080p * 40, _1080p * 70)
	var_8_0:addElement(var_8_8)

	var_8_0.Lock = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "DownloadIcon"

	var_8_10:SetAlpha(0, 0)
	var_8_10:setImage(RegisterMaterial("icon_download"), 0)
	var_8_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -36, _1080p * -10, _1080p * 13, _1080p * 39)
	var_8_0:addElement(var_8_10)

	var_8_0.DownloadIcon = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Gradient"

	var_8_12:SetRGBFromInt(0, 0)
	var_8_12:SetAlpha(0.8, 0)
	var_8_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -197, 0)
	var_8_0:addElement(var_8_12)

	var_8_0.Gradient = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "BackgroundBlack"

	var_8_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_14:SetAlpha(0.6, 0)
	var_8_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 1, _1080p * -1, _1080p * -32, 0)
	var_8_0:addElement(var_8_14)

	var_8_0.BackgroundBlack = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIStyledText.new()

	var_8_16.id = "Text"

	var_8_16:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_16:setText(ToUpperCase(""), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_16:SetWordWrap(false)
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_16:SetUseEllipses(ELLIPSES.enabled)
	var_8_16:SetStartupDelay(1000)
	var_8_16:SetLineHoldTime(400)
	var_8_16:SetAnimMoveTime(150)
	var_8_16:SetAnimMoveSpeed(50)
	var_8_16:SetEndDelay(1000)
	var_8_16:SetCrossfadeTime(400)
	var_8_16:SetFadeInTime(300)
	var_8_16:SetFadeOutTime(300)
	var_8_16:SetMaxVisibleLines(1)
	var_8_16:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_8_16:SetOutlineRGBFromInt(0, 0)
	var_8_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 340, _1080p * -29, _1080p * -5)
	var_8_0:addElement(var_8_16)

	var_8_0.Text = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("TrialRewardStarsSmall", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "Stars"

	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 180, _1080p * 115, _1080p * 165)
	var_8_0:addElement(var_8_18)

	var_8_0.Stars = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "HighlightTop"

	var_8_20:SetAlpha(0, 0)
	var_8_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_8_0:addElement(var_8_20)

	var_8_0.HighlightTop = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "HighlightBottom"

	var_8_22:SetAlpha(0, 0)
	var_8_22:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_8_0:addElement(var_8_22)

	var_8_0.HighlightBottom = var_8_22

	local function var_8_23()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_8_10:RegisterAnimationSequence("ShowDownloadIcon", var_8_25)

	local function var_8_26()
		var_8_10:AnimateSequence("ShowDownloadIcon")
	end

	var_8_0._sequences.ShowDownloadIcon = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("HideDownloadIcon", var_8_28)

	local function var_8_29()
		var_8_10:AnimateSequence("HideDownloadIcon")
	end

	var_8_0._sequences.HideDownloadIcon = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -488
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -462
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_8_10:RegisterAnimationSequence("AR", var_8_31)

	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39
		}
	}

	var_8_16:RegisterAnimationSequence("AR", var_8_32)

	local function var_8_33()
		var_8_10:AnimateSequence("AR")
		var_8_16:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_8_8:RegisterAnimationSequence("Disabled", var_8_35)

	local function var_8_36()
		var_8_8:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Enabled", var_8_38)

	local function var_8_39()
		var_8_8:AnimateSequence("Enabled")
	end

	var_8_0._sequences.Enabled = var_8_39

	local var_8_40
	local var_8_41 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_41)

	local var_8_42 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonOver", var_8_42)

	local var_8_43 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ButtonOver", var_8_43)

	local var_8_44 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("ButtonOver", var_8_44)

	local function var_8_45()
		var_8_4:AnimateSequence("ButtonOver")
		var_8_16:AnimateSequence("ButtonOver")
		var_8_20:AnimateSequence("ButtonOver")
		var_8_22:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_45

	local var_8_46
	local var_8_47 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUp", var_8_47)

	local var_8_48 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonUp", var_8_48)

	local var_8_49 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ButtonUp", var_8_49)

	local var_8_50 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("ButtonUp", var_8_50)

	local function var_8_51()
		var_8_4:AnimateSequence("ButtonUp")
		var_8_16:AnimateSequence("ButtonUp")
		var_8_20:AnimateSequence("ButtonUp")
		var_8_22:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_51

	local var_8_52
	local var_8_53 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipSetup", var_8_53)

	local var_8_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("WZWipSetup", var_8_54)

	local function var_8_55()
		var_8_14:AnimateSequence("WZWipSetup")
		var_8_16:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_55

	local var_8_56
	local var_8_57 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_8_4:RegisterAnimationSequence("WZWipButtonOver", var_8_57)

	local var_8_58 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("WZWipButtonOver", var_8_58)

	local var_8_59 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("WZWipButtonOver", var_8_59)

	local var_8_60 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("WZWipButtonOver", var_8_60)

	local function var_8_61()
		var_8_4:AnimateSequence("WZWipButtonOver")
		var_8_16:AnimateSequence("WZWipButtonOver")
		var_8_20:AnimateSequence("WZWipButtonOver")
		var_8_22:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_61

	local var_8_62
	local var_8_63 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_8_4:RegisterAnimationSequence("WZWipButtonUp", var_8_63)

	local var_8_64 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("WZWipButtonUp", var_8_64)

	local var_8_65 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("WZWipButtonUp", var_8_65)

	local var_8_66 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("WZWipButtonUp", var_8_66)

	local function var_8_67()
		var_8_4:AnimateSequence("WZWipButtonUp")
		var_8_16:AnimateSequence("WZWipButtonUp")
		var_8_20:AnimateSequence("WZWipButtonUp")
		var_8_22:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_67

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("TrialButton", TrialButton)
LockTable(_M)
