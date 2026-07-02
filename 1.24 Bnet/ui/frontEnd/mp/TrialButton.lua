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
end

function TrialButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 197 * _1080p)

	var_4_0.id = "TrialButton"
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

	var_4_4.id = "BackgroundImage"

	var_4_0:addElement(var_4_4)

	var_4_0.BackgroundImage = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Mask"

	var_4_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 197)
	var_4_0:addElement(var_4_6)

	var_4_0.Mask = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Lock"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -340, _1080p * -310, _1080p * 40, _1080p * 70)
	var_4_0:addElement(var_4_8)

	var_4_0.Lock = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "DownloadIcon"

	var_4_10:SetAlpha(0, 0)
	var_4_10:setImage(RegisterMaterial("icon_download"), 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -36, _1080p * -10, _1080p * 13, _1080p * 39)
	var_4_0:addElement(var_4_10)

	var_4_0.DownloadIcon = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Gradient"

	var_4_12:SetRGBFromInt(0, 0)
	var_4_12:SetAlpha(0.8, 0)
	var_4_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -197, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.Gradient = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "BackgroundBlack"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_14:SetAlpha(0.6, 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 1, _1080p * -1, _1080p * -32, 0)
	var_4_0:addElement(var_4_14)

	var_4_0.BackgroundBlack = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIStyledText.new()

	var_4_16.id = "Text"

	var_4_16:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_16:setText(ToUpperCase(""), 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetWordWrap(false)
	var_4_16:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_16:SetUseEllipses(ELLIPSES.enabled)
	var_4_16:SetStartupDelay(1000)
	var_4_16:SetLineHoldTime(400)
	var_4_16:SetAnimMoveTime(150)
	var_4_16:SetAnimMoveSpeed(50)
	var_4_16:SetEndDelay(1000)
	var_4_16:SetCrossfadeTime(400)
	var_4_16:SetFadeInTime(300)
	var_4_16:SetFadeOutTime(300)
	var_4_16:SetMaxVisibleLines(1)
	var_4_16:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_4_16:SetOutlineRGBFromInt(0, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 340, _1080p * -29, _1080p * -5)
	var_4_0:addElement(var_4_16)

	var_4_0.Text = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("TrialRewardStarsSmall", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "Stars"

	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 180, _1080p * 115, _1080p * 165)
	var_4_0:addElement(var_4_18)

	var_4_0.Stars = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "HighlightTop"

	var_4_20:SetAlpha(0, 0)
	var_4_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_4_0:addElement(var_4_20)

	var_4_0.HighlightTop = var_4_20

	local var_4_21
	local var_4_22 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_22.id = "HighlightBottom"

	var_4_22:SetAlpha(0, 0)
	var_4_22:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_4_0:addElement(var_4_22)

	var_4_0.HighlightBottom = var_4_22

	local function var_4_23()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_23

	local var_4_24 = {
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

	var_4_10:RegisterAnimationSequence("ShowDownloadIcon", var_4_24)

	local function var_4_25()
		var_4_10:AnimateSequence("ShowDownloadIcon")
	end

	var_4_0._sequences.ShowDownloadIcon = var_4_25

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("HideDownloadIcon", var_4_26)

	local function var_4_27()
		var_4_10:AnimateSequence("HideDownloadIcon")
	end

	var_4_0._sequences.HideDownloadIcon = var_4_27

	local var_4_28 = {
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

	var_4_10:RegisterAnimationSequence("isArabic", var_4_28)

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39
		}
	}

	var_4_16:RegisterAnimationSequence("isArabic", var_4_29)

	local function var_4_30()
		var_4_10:AnimateSequence("isArabic")
		var_4_16:AnimateSequence("isArabic")
	end

	var_4_0._sequences.isArabic = var_4_30

	local var_4_31 = {
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

	var_4_8:RegisterAnimationSequence("Disabled", var_4_31)

	local function var_4_32()
		var_4_8:AnimateSequence("Disabled")
	end

	var_4_0._sequences.Disabled = var_4_32

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Enabled", var_4_33)

	local function var_4_34()
		var_4_8:AnimateSequence("Enabled")
	end

	var_4_0._sequences.Enabled = var_4_34

	local var_4_35 = {
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

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_35)

	local var_4_36 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_16:RegisterAnimationSequence("ButtonOver", var_4_36)

	local var_4_37 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("ButtonOver", var_4_37)

	local var_4_38 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("ButtonOver", var_4_38)

	local function var_4_39()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_16:AnimateSequence("ButtonOver")
		var_4_20:AnimateSequence("ButtonOver")
		var_4_22:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_39

	local var_4_40 = {
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

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_40)

	local var_4_41 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_16:RegisterAnimationSequence("ButtonUp", var_4_41)

	local var_4_42 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("ButtonUp", var_4_42)

	local var_4_43 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("ButtonUp", var_4_43)

	local function var_4_44()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_16:AnimateSequence("ButtonUp")
		var_4_20:AnimateSequence("ButtonUp")
		var_4_22:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_44

	var_4_18:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_18:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_4_0:addEventHandler("disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Disabled")
	end)
	var_4_0:addEventHandler("enable", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Enabled")
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	if CONDITIONS.IsArabic(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "isArabic")
	end

	return var_4_0
end

MenuBuilder.registerType("TrialButton", TrialButton)
LockTable(_M)
