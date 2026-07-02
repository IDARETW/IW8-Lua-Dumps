module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._currentPage ~= #arg_1_0._pages then
		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._pages[arg_1_0._currentPage + 1])

		arg_1_0._currentPage = arg_1_0._currentPage + 1

		if arg_1_2.skipDelay then
			arg_1_0.ContinueButton:StartTimer(0)
		else
			arg_1_0.ContinueButton:StartTimer(2000)
		end

		if BATTLEPASS.SHOW_TRAILER_PROMPT and BATTLEPASS.IsOwned(arg_1_1) and arg_1_0._currentPage > 1 then
			arg_1_0.ButtonHelperBar:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt1",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_TRAILER", SEASON.GetCurrentSeason())
			})
		end
	else
		Onboarding.BattlePass.MarkCompleted(arg_1_0, arg_1_1)
		Engine.EBCGADABJ()

		if arg_1_2.closeAction then
			arg_1_2.closeAction(arg_1_2.menu)
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {
		{
			text = "BATTLEPASS/HOW_IT_WORKS_1",
			extra = SEASON.GetCurrentSeason()
		},
		{
			text = "BATTLEPASS/HOW_IT_WORKS_2"
		},
		{
			text = "BATTLEPASS/HOW_IT_WORKS_3"
		}
	}

	arg_2_0.HowItWorksList:SetupBullets(arg_2_1, var_2_0, true)

	local var_2_1 = {
		{
			text = "BATTLEPASS/HOW_TO_UNLOCK_1"
		},
		{
			text = "BATTLEPASS/HOW_TO_UNLOCK_2"
		},
		{
			text = "BATTLEPASS/HOW_TO_UNLOCK_3"
		}
	}

	arg_2_0.HowToUnlockList:SetupBullets(arg_2_1, var_2_1, true)

	arg_2_0._pages = {
		"Page1",
		"Page2"
	}

	local var_2_2 = LUI.FlowManager.GetScopedData(arg_2_0)

	if var_2_2 and var_2_2.currentPage then
		arg_2_0._currentPage = var_2_2.currentPage
	elseif arg_2_2.currentPage and arg_2_2.currentPage <= #arg_2_0._pages then
		arg_2_0._currentPage = arg_2_2.currentPage
	else
		arg_2_0._currentPage = 1
	end

	arg_2_0._currentSeason = SEASON.GetCurrentSeason()

	if arg_2_0._currentSeason and arg_2_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_2_0, "S5")
	end

	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._pages[arg_2_0._currentPage])
	arg_2_0.ContinueButton:StartTimer(0)
	Engine.DFCGFCGBFD("mp_battlepass_onboarding", VideoPlaybackFlags.LOOP)
	arg_2_0.ContinueButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if arg_2_2.overrideAction then
			arg_2_2.overrideAction()
		else
			var_0_0(arg_2_0, arg_2_1, arg_2_2)
		end
	end)

	if BATTLEPASS.SHOW_TRAILER_PROMPT and BATTLEPASS.IsOwned(arg_2_1) then
		arg_2_0.bindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
			if arg_2_0._currentPage > 1 then
				if var_2_2 then
					var_2_2.currentPage = arg_2_0._currentPage
				end

				BATTLEPASS.ShowBPTrailer(arg_2_1)
			end
		end)

		if arg_2_0._currentPage > 1 then
			arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_TRAILER", SEASON.GetCurrentSeason())
			})
		end
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
end

function BattlePassOnboardingPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "BattlePassOnboardingPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.95, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_6.PopupBackground:SetAlpha(0.3, 0)
	var_5_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -370, _1080p * 430)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "KeyArt"

	var_5_8:setImage(RegisterMaterial("ui_battlepass_onboarding_image"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 536, _1080p * 1823, _1080p * 172, _1080p * 969)
	var_5_0:addElement(var_5_8)

	var_5_0.KeyArt = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Cinematic"

	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 31, _1080p * 31)
	var_5_0:addElement(var_5_10)

	var_5_0.Cinematic = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Title"

	var_5_12:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_12:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS")), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 666, _1080p * 210, _1080p * 270)
	var_5_0:addElement(var_5_12)

	var_5_0.Title = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "ContinueButton"

	var_5_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_5_14.Text:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 792, _1080p * 1128, _1080p * 883, _1080p * 920)
	var_5_0:addElement(var_5_14)

	var_5_0.ContinueButton = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "Sparks"

	var_5_16:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 863, _1080p * 472, _1080p * 38, _1080p * 429)
	var_5_0:addElement(var_5_16)

	var_5_0.Sparks = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "HowItWorksDivider"

	var_5_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_18:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * -471, _1080p * -177, _1080p * -176)
	var_5_0:addElement(var_5_18)

	var_5_0.HowItWorksDivider = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "HowItWorksHeader"

	var_5_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_20:setText(Engine.CBBHFCGDIC("BATTLEPASS/HOW_IT_WORKS_HEADER"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetWordWrap(false)
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_20:SetStartupDelay(2000)
	var_5_20:SetLineHoldTime(400)
	var_5_20:SetAnimMoveTime(2000)
	var_5_20:SetAnimMoveSpeed(150)
	var_5_20:SetEndDelay(2000)
	var_5_20:SetCrossfadeTime(1000)
	var_5_20:SetFadeInTime(300)
	var_5_20:SetFadeOutTime(300)
	var_5_20:SetMaxVisibleLines(1)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * -262, _1080p * -212, _1080p * -182)
	var_5_0:addElement(var_5_20)

	var_5_0.HowItWorksHeader = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIImage.new()

	var_5_22.id = "HowToUnlockDivider"

	var_5_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_22:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * -471, _1080p * 48, _1080p * 49)
	var_5_0:addElement(var_5_22)

	var_5_0.HowToUnlockDivider = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIStyledText.new()

	var_5_24.id = "HowToUnlockHeader"

	var_5_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_24:setText(Engine.CBBHFCGDIC("BATTLEPASS/HOW_TO_UNLOCK_HEADER"), 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetWordWrap(false)
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_24:SetStartupDelay(2000)
	var_5_24:SetLineHoldTime(400)
	var_5_24:SetAnimMoveTime(2000)
	var_5_24:SetAnimMoveSpeed(150)
	var_5_24:SetEndDelay(2000)
	var_5_24:SetCrossfadeTime(1000)
	var_5_24:SetFadeInTime(300)
	var_5_24:SetFadeOutTime(300)
	var_5_24:SetMaxVisibleLines(1)
	var_5_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * -262, _1080p * 12, _1080p * 42)
	var_5_0:addElement(var_5_24)

	var_5_0.HowToUnlockHeader = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIStyledText.new()

	var_5_26.id = "WelcomToBattlepass"

	var_5_26:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_26:SetAlpha(0, 0)
	var_5_26:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/WELCOME")), 0)
	var_5_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_26:SetAlignment(LUI.Alignment.Center)
	var_5_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -850, _1080p * 850, _1080p * 258, _1080p * 334)
	var_5_0:addElement(var_5_26)

	var_5_0.WelcomToBattlepass = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIImage.new()

	var_5_28.id = "Pip1"

	var_5_28:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * -4, _1080p * 394, _1080p * 410)
	var_5_0:addElement(var_5_28)

	var_5_0.Pip1 = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIImage.new()

	var_5_30.id = "Pip2"

	var_5_30:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 4, _1080p * 20, _1080p * 394, _1080p * 410)
	var_5_0:addElement(var_5_30)

	var_5_0.Pip2 = var_5_30

	local var_5_31
	local var_5_32 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_32.id = "ButtonHelperBar"

	var_5_32.Background:SetAlpha(0, 0)
	var_5_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * 429, _1080p * 489)
	var_5_0:addElement(var_5_32)

	var_5_0.ButtonHelperBar = var_5_32

	local var_5_33
	local var_5_34 = {
		fontSize = "24",
		bulletImage = "bullet_point_diamond",
		spacing = 16,
		textColor = "SWATCHES.genericMenu.bodycopy",
		numericSeparator = "",
		separation = 10,
		listType = 1,
		bulletColor = "SWATCHES.BattlePass.PopupTexture",
		bulletScale = 0.75,
		controllerIndex = var_5_1
	}
	local var_5_35 = MenuBuilder.BuildRegisteredType("BulletList", var_5_34)

	var_5_35.id = "HowItWorksList"

	var_5_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 1072, _1080p * 380, _1080p * 398)
	var_5_0:addElement(var_5_35)

	var_5_0.HowItWorksList = var_5_35

	local var_5_36
	local var_5_37 = {
		fontSize = "24",
		bulletImage = "bullet_point_diamond",
		spacing = 16,
		textColor = "SWATCHES.genericMenu.bodycopy",
		numericSeparator = "",
		separation = 10,
		listType = 1,
		bulletColor = "SWATCHES.BattlePass.PopupTexture",
		bulletScale = 0.75,
		controllerIndex = var_5_1
	}
	local var_5_38 = MenuBuilder.BuildRegisteredType("BulletList", var_5_37)

	var_5_38.id = "HowToUnlockList"

	var_5_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 1072, _1080p * 605, _1080p * 623)
	var_5_0:addElement(var_5_38)

	var_5_0.HowToUnlockList = var_5_38

	local function var_5_39()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_39

	local var_5_40
	local var_5_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Page2", var_5_41)

	local var_5_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Page2", var_5_42)

	local var_5_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Page2", var_5_43)

	local var_5_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 883
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 920
		}
	}

	var_5_14:RegisterAnimationSequence("Page2", var_5_44)

	local var_5_45 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Page2", var_5_45)

	local var_5_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Page2", var_5_46)

	local var_5_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Page2", var_5_47)

	local var_5_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("Page2", var_5_48)

	local var_5_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Page2", var_5_49)

	local var_5_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("Page2", var_5_50)

	local var_5_51 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("Page2", var_5_51)

	local var_5_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_30:RegisterAnimationSequence("Page2", var_5_52)

	local var_5_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_35:RegisterAnimationSequence("Page2", var_5_53)

	local var_5_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_38:RegisterAnimationSequence("Page2", var_5_54)

	local function var_5_55()
		var_5_8:AnimateSequence("Page2")
		var_5_10:AnimateSequence("Page2")
		var_5_12:AnimateSequence("Page2")
		var_5_14:AnimateSequence("Page2")
		var_5_16:AnimateSequence("Page2")
		var_5_18:AnimateSequence("Page2")
		var_5_20:AnimateSequence("Page2")
		var_5_22:AnimateSequence("Page2")
		var_5_24:AnimateSequence("Page2")
		var_5_26:AnimateSequence("Page2")
		var_5_28:AnimateSequence("Page2")
		var_5_30:AnimateSequence("Page2")
		var_5_35:AnimateSequence("Page2")
		var_5_38:AnimateSequence("Page2")
	end

	var_5_0._sequences.Page2 = var_5_55

	local var_5_56
	local var_5_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Page1", var_5_57)

	local var_5_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Page1", var_5_58)

	local var_5_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Page1", var_5_59)

	local var_5_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Page1", var_5_60)

	local var_5_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Page1", var_5_61)

	local var_5_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Page1", var_5_62)

	local var_5_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("Page1", var_5_63)

	local var_5_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Page1", var_5_64)

	local var_5_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 90,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 210,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 210,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_26:RegisterAnimationSequence("Page1", var_5_65)

	local var_5_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("Page1", var_5_66)

	local var_5_67 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_30:RegisterAnimationSequence("Page1", var_5_67)

	local var_5_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_35:RegisterAnimationSequence("Page1", var_5_68)

	local var_5_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_38:RegisterAnimationSequence("Page1", var_5_69)

	local function var_5_70()
		var_5_8:AnimateSequence("Page1")
		var_5_10:AnimateSequence("Page1")
		var_5_12:AnimateSequence("Page1")
		var_5_16:AnimateSequence("Page1")
		var_5_18:AnimateSequence("Page1")
		var_5_20:AnimateSequence("Page1")
		var_5_22:AnimateSequence("Page1")
		var_5_24:AnimateSequence("Page1")
		var_5_26:AnimateSequence("Page1")
		var_5_28:AnimateSequence("Page1")
		var_5_30:AnimateSequence("Page1")
		var_5_35:AnimateSequence("Page1")
		var_5_38:AnimateSequence("Page1")
	end

	var_5_0._sequences.Page1 = var_5_70

	local var_5_71
	local var_5_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks_s5")
		}
	}

	var_5_16:RegisterAnimationSequence("S5", var_5_72)

	local var_5_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowLight
		}
	}

	var_5_26:RegisterAnimationSequence("S5", var_5_73)

	local function var_5_74()
		var_5_16:AnimateSequence("S5")
		var_5_26:AnimateSequence("S5")
	end

	var_5_0._sequences.S5 = var_5_74

	function var_5_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_75 = LUI.UIBindButton.new()

	var_5_75.id = "selfBindButton"

	var_5_0:addElement(var_5_75)

	var_5_0.bindButton = var_5_75

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassOnboardingPopup", BattlePassOnboardingPopup)
LockTable(_M)
