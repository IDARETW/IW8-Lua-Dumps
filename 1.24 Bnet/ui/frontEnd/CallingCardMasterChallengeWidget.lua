module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.TierCycleList:GetCurrentTier() == arg_1_0.currentTier then
		ACTIONS.AnimateSequence(arg_1_0.TierCycleList, "Active")
	else
		ACTIONS.AnimateSequence(arg_1_0.TierCycleList, "NotActive")
	end
end

local function var_0_1(arg_2_0)
	arg_2_0.TierCycleList.Text:setText(Engine.CBBHFCGDIC(arg_2_0.currentTier))
	arg_2_0.TierCycleList:UpdatePip(arg_2_0.currentTier, arg_2_0._challengeData.numTiers)
	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_2)

	arg_3_0._challengeData = arg_3_2

	if not arg_3_0._menu then
		arg_3_0._menu = arg_3_1
	end

	local var_3_0 = LUI.IsLastInputKeyboardMouse(arg_3_0._controllerIndex)

	arg_3_0.currentTier = arg_3_2.currentTier <= arg_3_2.numTiers and arg_3_2.currentTier or arg_3_2.numTiers

	if arg_3_2.shouldShowCategory then
		if var_3_0 then
			arg_3_0.TierCycleList:SetAlpha(0)
			arg_3_0.ChallengeTier:SetAlpha(1)
		end

		local var_3_1 = arg_3_2.categoryName and Engine.CBBHFCGDIC(arg_3_2.categoryName) or ""

		arg_3_0.CategoryName:setText(var_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "CategoryOn")
	else
		if var_3_0 then
			arg_3_0.TierCycleList:SetAlpha(1)
			arg_3_0.ChallengeTier:SetAlpha(0)
		else
			arg_3_0.TierCycleList:SetAlpha(0)
			arg_3_0.ChallengeTier:SetAlpha(1)
		end

		ACTIONS.AnimateSequence(arg_3_0, "CategoryOff")
	end

	if arg_3_2.challengeImage and #arg_3_2.challengeImage > 0 then
		arg_3_0.ChallengeImage:setImage(RegisterMaterial(arg_3_2.challengeImage))
	end

	if arg_3_2.challengeName and #arg_3_2.challengeName > 0 then
		arg_3_0.ChallengeName:setText(Engine.CBBHFCGDIC(arg_3_2.challengeName))
	else
		arg_3_0.ChallengeName:SetAlpha(0)
	end

	if arg_3_2.currentTier then
		arg_3_0.TierCycleList:SetCurrentTier(arg_3_2.currentTier)
		arg_3_0.ChallengeTier:setText(Engine.CBBHFCGDIC(arg_3_2.currentTier))
	end

	if arg_3_2.numTiers <= 1 then
		arg_3_0.TierCycleList:SetAlpha(0)
		arg_3_0.ChallengeTier:SetAlpha(0)
	elseif arg_3_2.currentTier then
		arg_3_0.TierCycleList.Text:setText(Engine.CBBHFCGDIC(arg_3_2.currentTier))
		arg_3_0.TierCycleList:UpdatePip(arg_3_2.currentTier, arg_3_2.numTiers)
		var_0_0(arg_3_0, arg_3_2.currentTier)
	end

	local var_3_2 = false

	if arg_3_2.isChallengeActive ~= nil then
		arg_3_0._challengeActive = arg_3_2.isChallengeActive

		ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")

		if arg_3_2.isChallengeActive == false then
			var_3_2 = true
		end
	end

	if arg_3_2.shouldShowCategory then
		if var_3_2 then
			ACTIONS.AnimateSequence(arg_3_0, "Complete")
			arg_3_0.ChallengeTier:SetAlpha(0)
		else
			arg_3_0.ChallengeTier:SetAlpha(1)
		end
	else
		ACTIONS.AnimateSequence(arg_3_0, var_3_2 and "Complete" or "Incomplete")
	end

	arg_3_0.ChallengeProgressBar:SetProgress(arg_3_2.progress)
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_0._beingPreviewed then
		return
	end

	if LUI.IsLastInputKeyboardMouse(arg_4_1) then
		ACTIONS.AnimateSequence(arg_4_0, "KBM")
		arg_4_0.ChallengeTier:SetAlpha(0)
		arg_4_0.TierCycleList.ArrowLeft:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
			if arg_4_0.currentTier > 1 then
				arg_4_0.currentTier = arg_4_0.currentTier - 1
			else
				arg_4_0.currentTier = arg_4_0._challengeData.numTiers
			end

			arg_4_0._menu:UpdateDetailsForKeyboard(LUI.BEARING.left, arg_4_0)

			return true
		end)
		arg_4_0.TierCycleList.ArrowRight:registerEventHandler("button_action", function(arg_6_0, arg_6_1)
			if arg_4_0.currentTier < arg_4_0._challengeData.numTiers then
				arg_4_0.currentTier = arg_4_0.currentTier + 1
			else
				arg_4_0.currentTier = 1
			end

			arg_4_0._menu:UpdateDetailsForKeyboard(LUI.BEARING.right, arg_4_0)

			return true
		end)

		if arg_4_0._challengeData and arg_4_0._challengeData.numTiers and arg_4_0._challengeData.numTiers > 1 then
			arg_4_0.TierCycleList:SetAlpha(1)
		else
			arg_4_0.TierCycleList:SetAlpha(0)
		end
	else
		ACTIONS.AnimateSequence(arg_4_0, "Gamepad")
		arg_4_0.TierCycleList:SetAlpha(0)
		arg_4_0.TierCycleList.ArrowLeft:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
			return
		end)
		arg_4_0.TierCycleList.ArrowRight:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
			return
		end)

		if arg_4_0._challengeData and arg_4_0._challengeData.numTiers and arg_4_0._challengeData.numTiers > 1 then
			arg_4_0.ChallengeTier:SetAlpha(1)
		else
			arg_4_0.ChallengeTier:SetAlpha(0)
		end
	end
end

local function var_0_4(arg_9_0)
	arg_9_0._beingPreviewed = true

	ACTIONS.AnimateSequence(arg_9_0, "ModePreview")
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.SetChallengeData = var_0_2
	arg_10_0.UpdatePipsData = var_0_1
	arg_10_0.PreviewChallenge = var_0_4
	arg_10_0.currentTier = 1
	arg_10_0._controllerIndex = arg_10_1

	var_0_3(arg_10_0, arg_10_1)
	arg_10_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if arg_11_0._challengeActive ~= nil then
			ACTIONS.AnimateSequence(arg_11_0, "ButtonOver")
			ACTIONS.AnimateSequence(arg_11_0.TierCycleList, "ButtonOver")
		end

		if arg_11_0._menu and arg_11_0._menu.PreviewChallenge then
			arg_11_0._menu:PreviewChallenge()
		end
	end)
	arg_10_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		ACTIONS.AnimateSequence(arg_12_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_12_0.TierCycleList, "ButtonUp")
	end)
	arg_10_0:addEventHandler("update_input_type", function(arg_13_0, arg_13_1)
		var_0_3(arg_13_0, arg_13_1.controllerIndex)
	end)
	arg_10_0:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if (arg_14_1.keyboard or LUI.IsLastInputGamepad(arg_14_1.controller)) and arg_14_0._menu and arg_14_0._menu.EquipCurrentCallingCard then
			arg_14_0._menu:EquipCurrentCallingCard(arg_14_1.controller)
		end

		if LUI.IsLastInputKeyboardMouse(arg_14_1.controller) then
			return true
		end
	end)
end

function CallingCardMasterChallengeWidget(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIButton.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 130 * _1080p)

	var_15_0.id = "CallingCardMasterChallengeWidget"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "ChallengeImage"

	var_15_4:SetRGBFromInt(8421504, 0)
	var_15_4:SetAlpha(0.5, 0)
	var_15_4:setImage(RegisterMaterial("ui_playercard_307"), 0)
	var_15_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 90)
	var_15_0:addElement(var_15_4)

	var_15_0.ChallengeImage = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "Backer"

	var_15_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_6:SetAlpha(0.5, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 30, 0, _1080p * -40, 0)
	var_15_0:addElement(var_15_6)

	var_15_0.Backer = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "TierBacker"

	var_15_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_8:SetAlpha(0.5, 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 30, _1080p * -40, 0)
	var_15_0:addElement(var_15_8)

	var_15_0.TierBacker = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIStyledText.new()

	var_15_10.id = "ChallengeName"

	var_15_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_15_10:setText("", 0)
	var_15_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_10:SetWordWrap(false)
	var_15_10:SetAlignment(LUI.Alignment.Left)
	var_15_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_10:SetStartupDelay(2000)
	var_15_10:SetLineHoldTime(400)
	var_15_10:SetAnimMoveTime(2000)
	var_15_10:SetAnimMoveSpeed(150)
	var_15_10:SetEndDelay(2000)
	var_15_10:SetCrossfadeTime(250)
	var_15_10:SetFadeInTime(300)
	var_15_10:SetFadeOutTime(300)
	var_15_10:SetMaxVisibleLines(1)
	var_15_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 3, _1080p * -80, _1080p * -35, _1080p * -15)
	var_15_0:addElement(var_15_10)

	var_15_0.ChallengeName = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIText.new()

	var_15_12.id = "ChallengeTier"

	var_15_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_15_12:SetAlpha(0, 0)
	var_15_12:setText("1", 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Center)
	var_15_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 329, _1080p * 359, _1080p * -35, _1080p * -15)
	var_15_0:addElement(var_15_12)

	var_15_0.ChallengeTier = var_15_12

	local var_15_13
	local var_15_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_15_1
	})

	var_15_14.id = "ChallengeProgressBar"

	var_15_14.Overlay:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_15_14.Fill:SetRGBFromTable(SWATCHES.masterChallenges.progressFill, 0)
	var_15_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -10, 0)
	var_15_0:addElement(var_15_14)

	var_15_0.ChallengeProgressBar = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIText.new()

	var_15_16.id = "CategoryName"

	var_15_16:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_15_16:setText("", 0)
	var_15_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_16:setTextStyle(CoD.TextStyle.Shadowed)
	var_15_16:SetWordWrap(false)
	var_15_16:SetAlignment(LUI.Alignment.Right)
	var_15_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -70, _1080p * -10, _1080p * -34, _1080p * -16)
	var_15_0:addElement(var_15_16)

	var_15_0.CategoryName = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "ButtonHighlightBarTop"

	var_15_18:SetAlpha(0, 0)
	var_15_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_15_0:addElement(var_15_18)

	var_15_0.ButtonHighlightBarTop = var_15_18

	local var_15_19
	local var_15_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_15_1
	})

	var_15_20.id = "ButtonHighlightBarBottom"

	var_15_20:SetAlpha(0, 0)
	var_15_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_15_0:addElement(var_15_20)

	var_15_0.ButtonHighlightBarBottom = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("SmallCycleList", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "TierCycleList"

	var_15_22.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_15_22:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 290, _1080p * 370, _1080p * -40, _1080p * -10)
	var_15_0:addElement(var_15_22)

	var_15_0.TierCycleList = var_15_22

	local var_15_23
	local var_15_24 = LUI.UIImage.new()

	var_15_24.id = "CheckMark"

	var_15_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_15_24:SetAlpha(0, 0)
	var_15_24:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_15_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 328, _1080p * 360, _1080p * -41, _1080p * -9)
	var_15_0:addElement(var_15_24)

	var_15_0.CheckMark = var_15_24

	local function var_15_25()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_25

	local var_15_26
	local var_15_27 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOver", var_15_27)

	local var_15_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOver", var_15_28)

	local var_15_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonOver", var_15_29)

	local var_15_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonOver", var_15_30)

	local var_15_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonOver", var_15_31)

	local function var_15_32()
		var_15_4:AnimateSequence("ButtonOver")
		var_15_10:AnimateSequence("ButtonOver")
		var_15_12:AnimateSequence("ButtonOver")
		var_15_18:AnimateSequence("ButtonOver")
		var_15_20:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_32

	local var_15_33
	local var_15_34 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUp", var_15_34)

	local var_15_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUp", var_15_35)

	local var_15_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonUp", var_15_36)

	local var_15_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonUp", var_15_37)

	local var_15_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonUp", var_15_38)

	local function var_15_39()
		var_15_4:AnimateSequence("ButtonUp")
		var_15_10:AnimateSequence("ButtonUp")
		var_15_12:AnimateSequence("ButtonUp")
		var_15_18:AnimateSequence("ButtonUp")
		var_15_20:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_39

	local var_15_40
	local var_15_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		}
	}

	var_15_6:RegisterAnimationSequence("KBM", var_15_41)

	local var_15_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -80
		}
	}

	var_15_10:RegisterAnimationSequence("KBM", var_15_42)

	local function var_15_43()
		var_15_6:AnimateSequence("KBM")
		var_15_10:AnimateSequence("KBM")
	end

	var_15_0._sequences.KBM = var_15_43

	local var_15_44
	local var_15_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		}
	}

	var_15_6:RegisterAnimationSequence("Gamepad", var_15_45)

	local var_15_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		}
	}

	var_15_10:RegisterAnimationSequence("Gamepad", var_15_46)

	local function var_15_47()
		var_15_6:AnimateSequence("Gamepad")
		var_15_10:AnimateSequence("Gamepad")
	end

	var_15_0._sequences.Gamepad = var_15_47

	local var_15_48
	local var_15_49 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ModePreview", var_15_49)

	local var_15_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.lightBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ModePreview", var_15_50)

	local var_15_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.darkBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_15_8:RegisterAnimationSequence("ModePreview", var_15_51)

	local var_15_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.name
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50
		}
	}

	var_15_10:RegisterAnimationSequence("ModePreview", var_15_52)

	local var_15_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.name
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
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
		}
	}

	var_15_12:RegisterAnimationSequence("ModePreview", var_15_53)

	local var_15_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("ModePreview", var_15_54)

	local var_15_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style,
			value = CoD.TextStyle.Shadowed
		}
	}

	var_15_16:RegisterAnimationSequence("ModePreview", var_15_55)

	local var_15_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ModePreview", var_15_56)

	local var_15_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("ModePreview", var_15_57)

	local var_15_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ModePreview", var_15_58)

	local var_15_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
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
		}
	}

	var_15_24:RegisterAnimationSequence("ModePreview", var_15_59)

	local function var_15_60()
		var_15_4:AnimateSequence("ModePreview")
		var_15_6:AnimateSequence("ModePreview")
		var_15_8:AnimateSequence("ModePreview")
		var_15_10:AnimateSequence("ModePreview")
		var_15_12:AnimateSequence("ModePreview")
		var_15_14:AnimateSequence("ModePreview")
		var_15_16:AnimateSequence("ModePreview")
		var_15_18:AnimateSequence("ModePreview")
		var_15_20:AnimateSequence("ModePreview")
		var_15_22:AnimateSequence("ModePreview")
		var_15_24:AnimateSequence("ModePreview")
	end

	var_15_0._sequences.ModePreview = var_15_60

	local var_15_61
	local var_15_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_10:RegisterAnimationSequence("Complete", var_15_62)

	local var_15_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("Complete", var_15_63)

	local var_15_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_15_0.ChallengeProgressBar.Fill
		}
	}

	var_15_14:RegisterAnimationSequence("Complete", var_15_64)

	local var_15_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("Complete", var_15_65)

	local function var_15_66()
		var_15_10:AnimateSequence("Complete")
		var_15_12:AnimateSequence("Complete")
		var_15_14:AnimateSequence("Complete")
		var_15_24:AnimateSequence("Complete")
	end

	var_15_0._sequences.Complete = var_15_66

	local var_15_67
	local var_15_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -80
		}
	}

	var_15_10:RegisterAnimationSequence("CategoryOn", var_15_68)

	local var_15_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("CategoryOn", var_15_69)

	local function var_15_70()
		var_15_10:AnimateSequence("CategoryOn")
		var_15_16:AnimateSequence("CategoryOn")
	end

	var_15_0._sequences.CategoryOn = var_15_70

	local var_15_71
	local var_15_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_15_10:RegisterAnimationSequence("CategoryOff", var_15_72)

	local var_15_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("CategoryOff", var_15_73)

	local function var_15_74()
		var_15_10:AnimateSequence("CategoryOff")
		var_15_16:AnimateSequence("CategoryOff")
	end

	var_15_0._sequences.CategoryOff = var_15_74

	local var_15_75
	local var_15_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("NotComplete", var_15_76)

	local function var_15_77()
		var_15_24:AnimateSequence("NotComplete")
	end

	var_15_0._sequences.NotComplete = var_15_77

	local var_15_78
	local var_15_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_10:RegisterAnimationSequence("Incomplete", var_15_79)

	local var_15_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.progressFill,
			child = var_15_0.ChallengeProgressBar.Fill
		}
	}

	var_15_14:RegisterAnimationSequence("Incomplete", var_15_80)

	local var_15_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("Incomplete", var_15_81)

	local function var_15_82()
		var_15_10:AnimateSequence("Incomplete")
		var_15_14:AnimateSequence("Incomplete")
		var_15_24:AnimateSequence("Incomplete")
	end

	var_15_0._sequences.Incomplete = var_15_82

	var_0_5(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("CallingCardMasterChallengeWidget", CallingCardMasterChallengeWidget)
LockTable(_M)
