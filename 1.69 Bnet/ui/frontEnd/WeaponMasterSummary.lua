module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0, var_1_1 = WEAPON.GetMasterChallenges(arg_1_0._controllerIndex, arg_1_1)
	local var_1_2 = WEAPON.GetMasterChallengeCompletionCount(arg_1_0._controllerIndex)
	local var_1_3 = LUI.clamp(var_1_2 / WEAPON.UltimateChallengeCounts.MAX, 0, 1)
	local var_1_4 = var_1_2 >= WEAPON.UltimateChallengeCounts.MIN

	if var_1_1.numChallenges == var_1_1.numComplete then
		ACTIONS.AnimateSequence(arg_1_0, var_1_4 and (var_1_3 >= 1 and "AllComplete" or "CompleteWithClassifiedUnlocked") or "Complete")
	else
		ACTIONS.AnimateSequence(arg_1_0, var_1_4 and "IncompleteWithClassifiedUnlocked" or "Incomplete")
		arg_1_0.RecommendedText:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("CHALLENGE/RECOMMENDED_X", var_1_1.nearestComplete.name)))
		arg_1_0.ChallengeDesc:setText(LAYOUT.SetWarzoneStringHighlightOverride(var_1_1.nearestComplete.desc))
		arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_1.nearestComplete.amountEarned, var_1_1.nearestComplete.amountNeeded))

		if var_1_1.nearestComplete.amountNeeded > 0 then
			local var_1_5 = var_1_1.nearestComplete.amountEarned / var_1_1.nearestComplete.amountNeeded

			arg_1_0.ProgressBar:SetProgress(var_1_5, 0)
		else
			arg_1_0.ProgressBar:SetAlpha(0)
		end
	end

	arg_1_0.ClassifiedChallengeCount:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_2, WEAPON.UltimateChallengeCounts.MAX))
	arg_1_0.ClassifiedCompleteCheckBox:SetValue(var_1_3 >= 1, true)
	arg_1_0.ClassifiedStatusCheckBox:SetValue(var_1_3 >= 1, true)
	arg_1_0.ClassifiedProgressBar:SetProgress(var_1_3)
	arg_1_0.ClassifiedProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_2, WEAPON.UltimateChallengeCounts.MAX))
	arg_1_0.ClassifiedChallengeDesc:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE_DESC_NO_NOTE", WEAPON.UltimateChallengeCounts.MAX)))

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._checkboxes) do
		iter_1_1:SetValue(iter_1_0 <= var_1_1.numComplete)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0._checkboxes = {
		arg_2_0.Checkbox1,
		arg_2_0.Checkbox2,
		arg_2_0.Checkbox3,
		arg_2_0.Checkbox4,
		arg_2_0.Checkbox5,
		arg_2_0.Checkbox6,
		arg_2_0.Checkbox7,
		arg_2_0.Checkbox8
	}

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_2_0, "WZSetup")
	end
end

function WeaponMasterSummary(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 576 * _1080p, 0, 300 * _1080p)

	var_3_0.id = "WeaponMasterSummary"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "ClassifiedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 200, _1080p * 300)
	var_3_0:addElement(var_3_4)

	var_3_0.ClassifiedBacker = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "DoubleNotchedBacker"

	var_3_6:SetAlpha(0.5, 0)
	var_3_6.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 190)
	var_3_0:addElement(var_3_6)

	var_3_0.DoubleNotchedBacker = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Checkbox1"

	var_3_8.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -211, _1080p * -189, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_8)

	var_3_0.Checkbox1 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Checkbox2"

	var_3_10.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -187, _1080p * -165, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_10)

	var_3_0.Checkbox2 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Checkbox3"

	var_3_12.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -163, _1080p * -141, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_12)

	var_3_0.Checkbox3 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Checkbox4"

	var_3_14.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -139, _1080p * -117, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_14)

	var_3_0.Checkbox4 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Checkbox5"

	var_3_16.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -115, _1080p * -93, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_16)

	var_3_0.Checkbox5 = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "Checkbox6"

	var_3_18.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -91, _1080p * -69, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_18)

	var_3_0.Checkbox6 = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "Checkbox7"

	var_3_20.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -67, _1080p * -45, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_20)

	var_3_0.Checkbox7 = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "Checkbox8"

	var_3_22.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -43, _1080p * -21, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_22)

	var_3_0.Checkbox8 = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIStyledText.new()

	var_3_24.id = "RecommendedText"

	var_3_24:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_24:setText("", 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetWordWrap(false)
	var_3_24:SetAlignment(LUI.Alignment.Left)
	var_3_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_24:SetStartupDelay(2000)
	var_3_24:SetLineHoldTime(400)
	var_3_24:SetAnimMoveTime(2000)
	var_3_24:SetAnimMoveSpeed(150)
	var_3_24:SetEndDelay(2000)
	var_3_24:SetCrossfadeTime(400)
	var_3_24:SetFadeInTime(250)
	var_3_24:SetFadeOutTime(300)
	var_3_24:SetMaxVisibleLines(1)
	var_3_24:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, _1080p * -21, _1080p * 55, _1080p * 79)
	var_3_0:addElement(var_3_24)

	var_3_0.RecommendedText = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIText.new()

	var_3_26.id = "ChallengeDesc"

	var_3_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_26:setText("", 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_26:SetAlignment(LUI.Alignment.Left)
	var_3_26:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 438, _1080p * 120, _1080p * 142)
	var_3_0:addElement(var_3_26)

	var_3_0.ChallengeDesc = var_3_26

	local var_3_27
	local var_3_28 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_28.id = "Checkbox"

	var_3_28.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 60, _1080p * 122, _1080p * 164)
	var_3_0:addElement(var_3_28)

	var_3_0.Checkbox = var_3_28

	local var_3_29
	local var_3_30 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_30.id = "ProgressBar"

	var_3_30.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_30.Overlay:SetAlpha(0.2, 0)
	var_3_30.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_30:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 68, _1080p * -21, _1080p * 146, _1080p * 164)
	var_3_0:addElement(var_3_30)

	var_3_0.ProgressBar = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIText.new()

	var_3_32.id = "ProgressDesc"

	var_3_32:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_32:setText("", 0)
	var_3_32:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_32:SetAlignment(LUI.Alignment.Right)
	var_3_32:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -127, _1080p * -21, _1080p * 120, _1080p * 142)
	var_3_0:addElement(var_3_32)

	var_3_0.ProgressDesc = var_3_32

	local var_3_33
	local var_3_34 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_34.id = "RewardTitle"

	var_3_34.Text:SetLeft(0, 0)
	var_3_34.Text:SetRight(0, 0)
	var_3_34.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES"), 0)
	var_3_34.Text:SetAlignment(LUI.Alignment.Center)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 358, _1080p * 1, _1080p * 47)
	var_3_0:addElement(var_3_34)

	var_3_0.RewardTitle = var_3_34

	local var_3_35
	local var_3_36 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_36.id = "ClassifiedChallengeTitle"

	var_3_36.Text:SetLeft(0, 0)
	var_3_36.Text:SetRight(0, 0)
	var_3_36.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE"), 0)
	var_3_36.Text:SetAlignment(LUI.Alignment.Center)
	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 358, _1080p * 200, _1080p * 246)
	var_3_0:addElement(var_3_36)

	var_3_0.ClassifiedChallengeTitle = var_3_36

	local var_3_37
	local var_3_38 = LUI.UIText.new()

	var_3_38.id = "DetailsPrompt"

	var_3_38:setText("", 0)
	var_3_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_38:SetAlignment(LUI.Alignment.Center)
	var_3_38:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 574, _1080p * 214, _1080p * 232)
	var_3_0:addElement(var_3_38)

	var_3_0.DetailsPrompt = var_3_38

	local var_3_39
	local var_3_40 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_40.id = "ClassifiedCompleteCheckBox"

	var_3_40.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 531, _1080p * 553, _1080p * 212, _1080p * 234)
	var_3_0:addElement(var_3_40)

	var_3_0.ClassifiedCompleteCheckBox = var_3_40

	local var_3_41
	local var_3_42 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_42.id = "ClassifiedStatusCheckBox"

	var_3_42.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 60, _1080p * 256, _1080p * 291)
	var_3_0:addElement(var_3_42)

	var_3_0.ClassifiedStatusCheckBox = var_3_42

	local var_3_43
	local var_3_44 = LUI.UIStyledText.new()

	var_3_44.id = "ClassifiedChallengeDesc"

	var_3_44:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_44:setText(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE_DESC_NO_NOTE"), 0)
	var_3_44:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_44:SetWordWrap(false)
	var_3_44:SetAlignment(LUI.Alignment.Left)
	var_3_44:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_44:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_44:SetStartupDelay(1000)
	var_3_44:SetLineHoldTime(2000)
	var_3_44:SetAnimMoveTime(2000)
	var_3_44:SetAnimMoveSpeed(150)
	var_3_44:SetEndDelay(1000)
	var_3_44:SetCrossfadeTime(400)
	var_3_44:SetFadeInTime(300)
	var_3_44:SetFadeOutTime(300)
	var_3_44:SetMaxVisibleLines(1)
	var_3_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 446, _1080p * 249, _1080p * 271)
	var_3_0:addElement(var_3_44)

	var_3_0.ClassifiedChallengeDesc = var_3_44

	local var_3_45
	local var_3_46 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_46.id = "ClassifiedProgressBar"

	var_3_46.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_46.Overlay:SetAlpha(0.2, 0)
	var_3_46.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_46:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 66, _1080p * -23, _1080p * 273, _1080p * 291)
	var_3_0:addElement(var_3_46)

	var_3_0.ClassifiedProgressBar = var_3_46

	local var_3_47
	local var_3_48 = LUI.UIText.new()

	var_3_48.id = "ClassifiedProgressDesc"

	var_3_48:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_48:setText("", 0)
	var_3_48:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_48:SetAlignment(LUI.Alignment.Right)
	var_3_48:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, _1080p * -23, _1080p * 249, _1080p * 271)
	var_3_0:addElement(var_3_48)

	var_3_0.ClassifiedProgressDesc = var_3_48

	local var_3_49
	local var_3_50 = LUI.UIText.new()

	var_3_50.id = "ClassifiedChallengeCount"

	var_3_50:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_50:setText("", 0)
	var_3_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_50:SetAlignment(LUI.Alignment.Left)
	var_3_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 322, _1080p * 210, _1080p * 240)
	var_3_0:addElement(var_3_50)

	var_3_0.ClassifiedChallengeCount = var_3_50

	local function var_3_51()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_51

	local var_3_52
	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Complete", var_3_53)

	local var_3_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 67
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 576
		}
	}

	var_3_6:RegisterAnimationSequence("Complete", var_3_54)

	local var_3_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Complete", var_3_55)

	local var_3_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Complete", var_3_56)

	local var_3_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Complete", var_3_57)

	local var_3_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("Complete", var_3_58)

	local var_3_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("Complete", var_3_59)

	local var_3_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Complete", var_3_60)

	local var_3_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Complete", var_3_61)

	local var_3_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Complete", var_3_62)

	local var_3_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Complete", var_3_63)

	local var_3_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Complete", var_3_64)

	local var_3_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("Complete", var_3_65)

	local var_3_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("Complete", var_3_66)

	local function var_3_67()
		var_3_4:AnimateSequence("Complete")
		var_3_6:AnimateSequence("Complete")
		var_3_24:AnimateSequence("Complete")
		var_3_26:AnimateSequence("Complete")
		var_3_28:AnimateSequence("Complete")
		var_3_30:AnimateSequence("Complete")
		var_3_32:AnimateSequence("Complete")
		var_3_36:AnimateSequence("Complete")
		var_3_40:AnimateSequence("Complete")
		var_3_42:AnimateSequence("Complete")
		var_3_44:AnimateSequence("Complete")
		var_3_46:AnimateSequence("Complete")
		var_3_48:AnimateSequence("Complete")
		var_3_50:AnimateSequence("Complete")
	end

	var_3_0._sequences.Complete = var_3_67

	local var_3_68
	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Incomplete", var_3_69)

	local var_3_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		}
	}

	var_3_6:RegisterAnimationSequence("Incomplete", var_3_70)

	local var_3_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Incomplete", var_3_71)

	local var_3_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Incomplete", var_3_72)

	local var_3_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Incomplete", var_3_73)

	local var_3_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("Incomplete", var_3_74)

	local var_3_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("Incomplete", var_3_75)

	local var_3_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Incomplete", var_3_76)

	local var_3_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Incomplete", var_3_77)

	local var_3_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Incomplete", var_3_78)

	local var_3_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Incomplete", var_3_79)

	local var_3_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Incomplete", var_3_80)

	local var_3_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("Incomplete", var_3_81)

	local var_3_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("Incomplete", var_3_82)

	local function var_3_83()
		var_3_4:AnimateSequence("Incomplete")
		var_3_6:AnimateSequence("Incomplete")
		var_3_24:AnimateSequence("Incomplete")
		var_3_26:AnimateSequence("Incomplete")
		var_3_28:AnimateSequence("Incomplete")
		var_3_30:AnimateSequence("Incomplete")
		var_3_32:AnimateSequence("Incomplete")
		var_3_36:AnimateSequence("Incomplete")
		var_3_40:AnimateSequence("Incomplete")
		var_3_42:AnimateSequence("Incomplete")
		var_3_44:AnimateSequence("Incomplete")
		var_3_46:AnimateSequence("Incomplete")
		var_3_48:AnimateSequence("Incomplete")
		var_3_50:AnimateSequence("Incomplete")
	end

	var_3_0._sequences.Incomplete = var_3_83

	local var_3_84
	local var_3_85 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		}
	}

	var_3_4:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_85)

	local var_3_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		}
	}

	var_3_6:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_86)

	local var_3_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_87)

	local var_3_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 526
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 548
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_3_40:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_88)

	local var_3_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 286
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		}
	}

	var_3_42:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_89)

	local var_3_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_90)

	local var_3_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_91)

	local var_3_92 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("ShowClassifiedChallengeDetails", var_3_92)

	local function var_3_93()
		var_3_4:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_6:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_36:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_40:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_42:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_44:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_46:AnimateSequence("ShowClassifiedChallengeDetails")
		var_3_48:AnimateSequence("ShowClassifiedChallengeDetails")
	end

	var_3_0._sequences.ShowClassifiedChallengeDetails = var_3_93

	local var_3_94
	local var_3_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
		}
	}

	var_3_4:RegisterAnimationSequence("HideClassifiedChallenge", var_3_95)

	local var_3_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
		}
	}

	var_3_36:RegisterAnimationSequence("HideClassifiedChallenge", var_3_96)

	local var_3_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("HideClassifiedChallenge", var_3_97)

	local var_3_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("HideClassifiedChallenge", var_3_98)

	local var_3_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 448
		}
	}

	var_3_44:RegisterAnimationSequence("HideClassifiedChallenge", var_3_99)

	local var_3_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("HideClassifiedChallenge", var_3_100)

	local var_3_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("HideClassifiedChallenge", var_3_101)

	local var_3_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("HideClassifiedChallenge", var_3_102)

	local function var_3_103()
		var_3_4:AnimateSequence("HideClassifiedChallenge")
		var_3_36:AnimateSequence("HideClassifiedChallenge")
		var_3_40:AnimateSequence("HideClassifiedChallenge")
		var_3_42:AnimateSequence("HideClassifiedChallenge")
		var_3_44:AnimateSequence("HideClassifiedChallenge")
		var_3_46:AnimateSequence("HideClassifiedChallenge")
		var_3_48:AnimateSequence("HideClassifiedChallenge")
		var_3_50:AnimateSequence("HideClassifiedChallenge")
	end

	var_3_0._sequences.HideClassifiedChallenge = var_3_103

	local var_3_104
	local var_3_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 178
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_105)

	local var_3_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 67
		}
	}

	var_3_6:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_106)

	local var_3_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_107)

	local var_3_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_108)

	local var_3_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_109)

	local var_3_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_110)

	local var_3_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_111)

	local var_3_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_112)

	local var_3_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_113)

	local var_3_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_114)

	local var_3_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_115)

	local var_3_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_116)

	local var_3_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_117)

	local var_3_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 116
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("CompleteWithClassifiedUnlocked", var_3_118)

	local function var_3_119()
		var_3_4:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_6:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_24:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_26:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_28:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_30:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_32:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_36:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_40:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_42:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_44:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_46:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_48:AnimateSequence("CompleteWithClassifiedUnlocked")
		var_3_50:AnimateSequence("CompleteWithClassifiedUnlocked")
	end

	var_3_0._sequences.CompleteWithClassifiedUnlocked = var_3_119

	local var_3_120
	local var_3_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("AllComplete", var_3_121)

	local var_3_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 67
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_3_6:RegisterAnimationSequence("AllComplete", var_3_122)

	local var_3_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("AllComplete", var_3_123)

	local var_3_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("AllComplete", var_3_124)

	local var_3_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("AllComplete", var_3_125)

	local var_3_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("AllComplete", var_3_126)

	local var_3_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("AllComplete", var_3_127)

	local var_3_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("AllComplete", var_3_128)

	local var_3_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("AllComplete", var_3_129)

	local var_3_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("AllComplete", var_3_130)

	local var_3_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("AllComplete", var_3_131)

	local var_3_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("AllComplete", var_3_132)

	local var_3_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("AllComplete", var_3_133)

	local var_3_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 116
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("AllComplete", var_3_134)

	local function var_3_135()
		var_3_4:AnimateSequence("AllComplete")
		var_3_6:AnimateSequence("AllComplete")
		var_3_24:AnimateSequence("AllComplete")
		var_3_26:AnimateSequence("AllComplete")
		var_3_28:AnimateSequence("AllComplete")
		var_3_30:AnimateSequence("AllComplete")
		var_3_32:AnimateSequence("AllComplete")
		var_3_36:AnimateSequence("AllComplete")
		var_3_40:AnimateSequence("AllComplete")
		var_3_42:AnimateSequence("AllComplete")
		var_3_44:AnimateSequence("AllComplete")
		var_3_46:AnimateSequence("AllComplete")
		var_3_48:AnimateSequence("AllComplete")
		var_3_50:AnimateSequence("AllComplete")
	end

	var_3_0._sequences.AllComplete = var_3_135

	local var_3_136
	local var_3_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 255
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 187
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_137)

	local var_3_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_3_6:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_138)

	local var_3_139 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_139)

	local var_3_140 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_140)

	local var_3_141 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_141)

	local var_3_142 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_142)

	local var_3_143 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_143)

	local var_3_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 238
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_144)

	local var_3_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_145)

	local var_3_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 255
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 277
		}
	}

	var_3_42:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_146)

	local var_3_147 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 244
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 450
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 266
		}
	}

	var_3_44:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_147)

	local var_3_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 286
		}
	}

	var_3_46:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_148)

	local var_3_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 244
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 266
		}
	}

	var_3_48:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_149)

	local var_3_150 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 232
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 358
		}
	}

	var_3_50:RegisterAnimationSequence("IncompleteWithClassifiedUnlocked", var_3_150)

	local function var_3_151()
		var_3_4:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_6:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_24:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_26:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_28:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_30:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_32:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_36:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_40:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_42:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_44:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_46:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_48:AnimateSequence("IncompleteWithClassifiedUnlocked")
		var_3_50:AnimateSequence("IncompleteWithClassifiedUnlocked")
	end

	var_3_0._sequences.IncompleteWithClassifiedUnlocked = var_3_151

	local var_3_152
	local var_3_153 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_3_24:RegisterAnimationSequence("WZSetup", var_3_153)

	local var_3_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_3_26:RegisterAnimationSequence("WZSetup", var_3_154)

	local var_3_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_3_0.ProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder,
			child = var_3_0.ProgressBar.Overlay
		}
	}

	var_3_30:RegisterAnimationSequence("WZSetup", var_3_155)

	local var_3_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_32:RegisterAnimationSequence("WZSetup", var_3_156)

	local var_3_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_3_0.ClassifiedChallengeTitle.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator,
			child = var_3_0.ClassifiedChallengeTitle.Divider
		}
	}

	var_3_36:RegisterAnimationSequence("WZSetup", var_3_157)

	local var_3_158 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_3_44:RegisterAnimationSequence("WZSetup", var_3_158)

	local var_3_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder,
			child = var_3_0.ClassifiedProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_3_0.ClassifiedProgressBar.Fill
		}
	}

	var_3_46:RegisterAnimationSequence("WZSetup", var_3_159)

	local var_3_160 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_48:RegisterAnimationSequence("WZSetup", var_3_160)

	local var_3_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_50:RegisterAnimationSequence("WZSetup", var_3_161)

	local function var_3_162()
		var_3_24:AnimateSequence("WZSetup")
		var_3_26:AnimateSequence("WZSetup")
		var_3_30:AnimateSequence("WZSetup")
		var_3_32:AnimateSequence("WZSetup")
		var_3_36:AnimateSequence("WZSetup")
		var_3_44:AnimateSequence("WZSetup")
		var_3_46:AnimateSequence("WZSetup")
		var_3_48:AnimateSequence("WZSetup")
		var_3_50:AnimateSequence("WZSetup")
	end

	var_3_0._sequences.WZSetup = var_3_162

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeaponMasterSummary", WeaponMasterSummary)
LockTable(_M)
