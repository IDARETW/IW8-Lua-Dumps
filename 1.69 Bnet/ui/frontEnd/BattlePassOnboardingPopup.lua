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
				helper_text = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_TRAILER", SEASON.GetLocalizedName({
					isForBattlePass = true
				}))
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
			extra = SEASON.GetLocalizedName({
				isForBattlePass = true
			})
		},
		{
			text = "BATTLEPASS/HOW_IT_WORKS_2"
		},
		{
			text = "BATTLEPASS/HOW_IT_WORKS_3"
		},
		{
			text = "BATTLEPASS/HOW_IT_WORKS_4"
		}
	}

	arg_2_0.HowItWorksList:SetupBullets(arg_2_1, var_2_0, false)

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

	arg_2_0.HowToUnlockList:SetupBullets(arg_2_1, var_2_1, false)

	local var_2_2 = {
		{
			text = "BATTLEPASS/WHAT_IT_MEANS_1"
		},
		{
			text = "BATTLEPASS/WHAT_IT_MEANS_2"
		}
	}

	arg_2_0.WhatItMeansList:SetupBullets(arg_2_1, var_2_2, false)

	arg_2_0._pages = {
		"Page1",
		"Page2"
	}

	local var_2_3 = LUI.FlowManager.GetScopedData(arg_2_0)

	if var_2_3 and var_2_3.currentPage then
		arg_2_0._currentPage = var_2_3.currentPage
	elseif arg_2_2.currentPage and arg_2_2.currentPage <= #arg_2_0._pages then
		arg_2_0._currentPage = arg_2_2.currentPage
	else
		arg_2_0._currentPage = 1
	end

	arg_2_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_2_0._currentSeason then
		ACTIONS.AnimateSequence(arg_2_0, "ColorAlt")
	end

	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._pages[arg_2_0._currentPage])
	arg_2_0.ContinueButton:StartTimer(0)
	Engine.DFCGFCGBFD("mp_battlepass_onboarding", VideoPlaybackFlags.LOOP)
	Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpOnboarding)
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
				if var_2_3 then
					var_2_3.currentPage = arg_2_0._currentPage
				end

				BATTLEPASS.ShowBPTrailer(arg_2_1)
			end
		end)

		if arg_2_0._currentPage > 1 then
			arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_TRAILER", SEASON.GetLocalizedName({
					isForBattlePass = true
				}))
			})
		end
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	arg_2_0.SnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceExclusivityID = BATTLEPASS.GetCurrentSeasonGameExclusivity(),
		alignment = LUI.Alignment.Left
	})
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_2_0, arg_2_1, {
		addWorldBlur = true,
		darkenerOpacity = 0.95,
		addScreenDarkener = true
	})

	if Engine.CGABICJHAI() and CoD.IsUsingAspectRatio(1.6) then
		ACTIONS.AnimateSequence(arg_2_0, "PC16x10Ratio")
		ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.Cinematic)
	end
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
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "GenericPopupWindow"

	var_5_4.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_4.PopupBackground:SetAlpha(0.3, 0)
	var_5_4.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_4.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_4.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_4.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_4.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_4.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_4.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_4.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -376, _1080p * 430)
	var_5_0:addElement(var_5_4)

	var_5_0.GenericPopupWindow = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "KeyArt"

	var_5_6:setImage(RegisterMaterial("ui_battlepass_onboarding_image"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 96, _1080p * -93, _1080p * -373, _1080p * 427)
	var_5_0:addElement(var_5_6)

	var_5_0.KeyArt = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "SoftEdgeRight"

	var_5_8:SetRGBFromInt(0, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -397, _1080p * -93, _1080p * -373, _1080p * 427)
	var_5_0:addElement(var_5_8)

	var_5_0.SoftEdgeRight = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "SoftEdgeLeft"

	var_5_10:SetRGBFromInt(0, 0)
	var_5_10:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 400, _1080p * -373, _1080p * 427)
	var_5_0:addElement(var_5_10)

	var_5_0.SoftEdgeLeft = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "Cinematic"

	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -960, _1080p * 960, 0, 0)
	var_5_0:addElement(var_5_12)

	var_5_0.Cinematic = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Title"

	var_5_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_5_14:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS")), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 972, _1080p * 216, _1080p * 276)
	var_5_0:addElement(var_5_14)

	var_5_0.Title = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "ContinueButton"

	var_5_16.Button.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_5_16.Button.Text:SetAlignment(LUI.Alignment.Center)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 792, _1080p * 1128, _1080p * 883, _1080p * 920)
	var_5_0:addElement(var_5_16)

	var_5_0.ContinueButton = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "Sparks"

	var_5_18:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_5_18:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -87, _1080p * -442, _1080p * 74, _1080p * 429)
	var_5_0:addElement(var_5_18)

	var_5_0.Sparks = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "HowItWorksDivider"

	var_5_20:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_20:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -793, _1080p * -147, _1080p * -263, _1080p * -262)
	var_5_0:addElement(var_5_20)

	var_5_0.HowItWorksDivider = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIStyledText.new()

	var_5_22.id = "HowItWorksHeader"

	var_5_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_22:setText(Engine.CBBHFCGDIC("BATTLEPASS/HOW_IT_WORKS_HEADER"), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_22:SetWordWrap(false)
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_22:SetStartupDelay(2000)
	var_5_22:SetLineHoldTime(400)
	var_5_22:SetAnimMoveTime(2000)
	var_5_22:SetAnimMoveSpeed(150)
	var_5_22:SetEndDelay(2000)
	var_5_22:SetCrossfadeTime(1000)
	var_5_22:SetFadeInTime(300)
	var_5_22:SetFadeOutTime(300)
	var_5_22:SetMaxVisibleLines(1)
	var_5_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * 12, _1080p * -218, _1080p * -182)
	var_5_0:addElement(var_5_22)

	var_5_0.HowItWorksHeader = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIImage.new()

	var_5_24.id = "HowToUnlockDivider"

	var_5_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_24:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * -471, _1080p * 48, _1080p * 49)
	var_5_0:addElement(var_5_24)

	var_5_0.HowToUnlockDivider = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIStyledText.new()

	var_5_26.id = "HowToUnlockHeader"

	var_5_26:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_5_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/HOW_TO_UNLOCK_HEADER"), 0)
	var_5_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_26:SetWordWrap(false)
	var_5_26:SetAlignment(LUI.Alignment.Left)
	var_5_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_26:SetStartupDelay(2000)
	var_5_26:SetLineHoldTime(400)
	var_5_26:SetAnimMoveTime(2000)
	var_5_26:SetAnimMoveSpeed(150)
	var_5_26:SetEndDelay(2000)
	var_5_26:SetCrossfadeTime(1000)
	var_5_26:SetFadeInTime(300)
	var_5_26:SetFadeOutTime(300)
	var_5_26:SetMaxVisibleLines(1)
	var_5_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * 12, _1080p * 12, _1080p * 42)
	var_5_0:addElement(var_5_26)

	var_5_0.HowToUnlockHeader = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIStyledText.new()

	var_5_28.id = "WelcomToBattlepass"

	var_5_28:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_5_28:SetAlpha(0, 0)
	var_5_28:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/WELCOME")), 0)
	var_5_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_28:SetAlignment(LUI.Alignment.Center)
	var_5_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -850, _1080p * 850, _1080p * 258, _1080p * 334)
	var_5_0:addElement(var_5_28)

	var_5_0.WelcomToBattlepass = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIImage.new()

	var_5_30.id = "Pip1"

	var_5_30:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * -16, _1080p * 394, _1080p * 410)
	var_5_0:addElement(var_5_30)

	var_5_0.Pip1 = var_5_30

	local var_5_31
	local var_5_32 = LUI.UIImage.new()

	var_5_32.id = "Pip2"

	var_5_32:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 394, _1080p * 410)
	var_5_0:addElement(var_5_32)

	var_5_0.Pip2 = var_5_32

	local var_5_33
	local var_5_34 = LUI.UIImage.new()

	var_5_34.id = "Pip3"

	var_5_34:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 16, _1080p * 32, _1080p * 394, _1080p * 410)
	var_5_0:addElement(var_5_34)

	var_5_0.Pip3 = var_5_34

	local var_5_35
	local var_5_36 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_36.id = "ButtonHelperBar"

	var_5_36.Background:SetAlpha(0, 0)
	var_5_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * 429, _1080p * 489)
	var_5_0:addElement(var_5_36)

	var_5_0.ButtonHelperBar = var_5_36

	local var_5_37
	local var_5_38 = {
		fontSize = "24",
		bulletImage = "bullet_point_diamond",
		spacing = 36,
		textColor = "SWATCHES.genericMenu.bodycopy",
		numericSeparator = ".",
		separation = 10,
		listType = 2,
		bulletColor = "SWATCHES.genericMenu.bodycopy",
		bulletScale = 0.75,
		controllerIndex = var_5_1
	}
	local var_5_39 = MenuBuilder.BuildRegisteredType("BulletList", var_5_38)

	var_5_39.id = "HowItWorksList"

	var_5_39:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 199, _1080p * 1045, _1080p * 392, _1080p * 410)
	var_5_0:addElement(var_5_39)

	var_5_0.HowItWorksList = var_5_39

	local var_5_40
	local var_5_41 = {
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
	local var_5_42 = MenuBuilder.BuildRegisteredType("BulletList", var_5_41)

	var_5_42.id = "HowToUnlockList"

	var_5_42:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 972, _1080p * 605, _1080p * 623)
	var_5_0:addElement(var_5_42)

	var_5_0.HowToUnlockList = var_5_42

	local var_5_43
	local var_5_44 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_5_1
	})

	var_5_44.id = "SnipeIcon"

	var_5_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 411, _1080p * 9, _1080p * 65)
	var_5_0:addElement(var_5_44)

	var_5_0.SnipeIcon = var_5_44

	local var_5_45
	local var_5_46 = LUI.UIText.new()

	var_5_46.id = "ExclusiveSnipeText"

	var_5_46:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_46:setText("", 0)
	var_5_46:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_46:SetAlignment(LUI.Alignment.Left)
	var_5_46:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 18)
	var_5_0:addElement(var_5_46)

	var_5_0.ExclusiveSnipeText = var_5_46

	local var_5_47
	local var_5_48 = {
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
	local var_5_49 = MenuBuilder.BuildRegisteredType("BulletList", var_5_48)

	var_5_49.id = "WhatItMeansList"

	var_5_49:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 972, _1080p * 380, _1080p * 398)
	var_5_0:addElement(var_5_49)

	var_5_0.WhatItMeansList = var_5_49

	local var_5_50
	local var_5_51 = LUI.UIImage.new()

	var_5_51.id = "WhatItMeansDivider"

	var_5_51:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_51:SetAlpha(0, 0)
	var_5_51:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_51:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -794, _1080p * -471, _1080p * -177, _1080p * -176)
	var_5_0:addElement(var_5_51)

	var_5_0.WhatItMeansDivider = var_5_51

	local var_5_52
	local var_5_53 = LUI.UIStyledText.new()

	var_5_53.id = "WhatItMeansHeader"

	var_5_53:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_53:SetAlpha(0, 0)
	var_5_53:setText(Engine.CBBHFCGDIC("BATTLEPASS/HOW_IT_WORKS_HEADER"), 0)
	var_5_53:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_53:SetWordWrap(false)
	var_5_53:SetAlignment(LUI.Alignment.Left)
	var_5_53:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_53:SetStartupDelay(2000)
	var_5_53:SetLineHoldTime(400)
	var_5_53:SetAnimMoveTime(2000)
	var_5_53:SetAnimMoveSpeed(150)
	var_5_53:SetEndDelay(2000)
	var_5_53:SetCrossfadeTime(1000)
	var_5_53:SetFadeInTime(300)
	var_5_53:SetFadeOutTime(300)
	var_5_53:SetMaxVisibleLines(1)
	var_5_53:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1351, _1080p * 569, _1080p * -212, _1080p * -182)
	var_5_0:addElement(var_5_53)

	var_5_0.WhatItMeansHeader = var_5_53

	local var_5_54
	local var_5_55 = LUI.UIImage.new()

	var_5_55.id = "WhatItMeansImage"

	var_5_55:SetAlpha(0, 0)
	var_5_55:setImage(RegisterMaterial("onboarding_battlepass_page3_scroll"), 0)
	var_5_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 185, _1080p * 1724, _1080p * 478, _1080p * 858)
	var_5_0:addElement(var_5_55)

	var_5_0.WhatItMeansImage = var_5_55

	local function var_5_56()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_56

	local var_5_57
	local var_5_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Page2", var_5_58)

	local var_5_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -397
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -93
		}
	}

	var_5_8:RegisterAnimationSequence("Page2", var_5_59)

	local var_5_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Page2", var_5_60)

	local var_5_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Page2", var_5_61)

	local var_5_62 = {
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

	var_5_16:RegisterAnimationSequence("Page2", var_5_62)

	local var_5_63 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -474
		}
	}

	var_5_18:RegisterAnimationSequence("Page2", var_5_63)

	local var_5_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Page2", var_5_64)

	local var_5_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -211
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -791
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 15
		}
	}

	var_5_22:RegisterAnimationSequence("Page2", var_5_65)

	local var_5_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Page2", var_5_66)

	local var_5_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("Page2", var_5_67)

	local var_5_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("Page2", var_5_68)

	local var_5_69 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_30:RegisterAnimationSequence("Page2", var_5_69)

	local var_5_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_32:RegisterAnimationSequence("Page2", var_5_70)

	local var_5_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_34:RegisterAnimationSequence("Page2", var_5_71)

	local var_5_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1036
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 399
		}
	}

	var_5_39:RegisterAnimationSequence("Page2", var_5_72)

	local var_5_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_42:RegisterAnimationSequence("Page2", var_5_73)

	local var_5_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 205
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 872
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 605
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 928
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_44:RegisterAnimationSequence("Page2", var_5_74)

	local var_5_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 836
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 695
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 863
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/EXCLUSIVELY_USABLE_IN")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_46:RegisterAnimationSequence("Page2", var_5_75)

	local var_5_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_49:RegisterAnimationSequence("Page2", var_5_76)

	local var_5_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_51:RegisterAnimationSequence("Page2", var_5_77)

	local var_5_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_53:RegisterAnimationSequence("Page2", var_5_78)

	local var_5_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_55:RegisterAnimationSequence("Page2", var_5_79)

	local function var_5_80()
		var_5_6:AnimateSequence("Page2")
		var_5_8:AnimateSequence("Page2")
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
		var_5_32:AnimateSequence("Page2")
		var_5_34:AnimateSequence("Page2")
		var_5_39:AnimateSequence("Page2")
		var_5_42:AnimateSequence("Page2")
		var_5_44:AnimateSequence("Page2")
		var_5_46:AnimateSequence("Page2")
		var_5_49:AnimateSequence("Page2")
		var_5_51:AnimateSequence("Page2")
		var_5_53:AnimateSequence("Page2")
		var_5_55:AnimateSequence("Page2")
	end

	var_5_0._sequences.Page2 = var_5_80

	local var_5_81
	local var_5_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Page1", var_5_82)

	local var_5_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Page1", var_5_83)

	local var_5_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Page1", var_5_84)

	local var_5_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Page1", var_5_85)

	local var_5_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Page1", var_5_86)

	local var_5_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("Page1", var_5_87)

	local var_5_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Page1", var_5_88)

	local var_5_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("Page1", var_5_89)

	local var_5_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonFreeBanner
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
			duration = 300,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
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

	var_5_28:RegisterAnimationSequence("Page1", var_5_90)

	local var_5_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_5_30:RegisterAnimationSequence("Page1", var_5_91)

	local var_5_92 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 24
		}
	}

	var_5_32:RegisterAnimationSequence("Page1", var_5_92)

	local var_5_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_34:RegisterAnimationSequence("Page1", var_5_93)

	local var_5_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_39:RegisterAnimationSequence("Page1", var_5_94)

	local var_5_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_42:RegisterAnimationSequence("Page1", var_5_95)

	local var_5_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_44:RegisterAnimationSequence("Page1", var_5_96)

	local var_5_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_49:RegisterAnimationSequence("Page1", var_5_97)

	local var_5_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_51:RegisterAnimationSequence("Page1", var_5_98)

	local var_5_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_53:RegisterAnimationSequence("Page1", var_5_99)

	local var_5_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_55:RegisterAnimationSequence("Page1", var_5_100)

	local function var_5_101()
		var_5_6:AnimateSequence("Page1")
		var_5_12:AnimateSequence("Page1")
		var_5_14:AnimateSequence("Page1")
		var_5_18:AnimateSequence("Page1")
		var_5_20:AnimateSequence("Page1")
		var_5_22:AnimateSequence("Page1")
		var_5_24:AnimateSequence("Page1")
		var_5_26:AnimateSequence("Page1")
		var_5_28:AnimateSequence("Page1")
		var_5_30:AnimateSequence("Page1")
		var_5_32:AnimateSequence("Page1")
		var_5_34:AnimateSequence("Page1")
		var_5_39:AnimateSequence("Page1")
		var_5_42:AnimateSequence("Page1")
		var_5_44:AnimateSequence("Page1")
		var_5_49:AnimateSequence("Page1")
		var_5_51:AnimateSequence("Page1")
		var_5_53:AnimateSequence("Page1")
		var_5_55:AnimateSequence("Page1")
	end

	var_5_0._sequences.Page1 = var_5_101

	local var_5_102
	local var_5_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Season3FreeBanner
		}
	}

	var_5_28:RegisterAnimationSequence("ColorAlt", var_5_103)

	local function var_5_104()
		var_5_28:AnimateSequence("ColorAlt")
	end

	var_5_0._sequences.ColorAlt = var_5_104

	local var_5_105
	local var_5_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -311
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -176
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_5_20:RegisterAnimationSequence("AR", var_5_106)

	local var_5_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -311
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 49
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_5_24:RegisterAnimationSequence("AR", var_5_107)

	local function var_5_108()
		var_5_20:AnimateSequence("AR")
		var_5_24:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_108

	local var_5_109
	local var_5_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Page3", var_5_110)

	local var_5_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Page3", var_5_111)

	local var_5_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/WHAT_IT_MEANS_TITLE"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1790
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		}
	}

	var_5_14:RegisterAnimationSequence("Page3", var_5_112)

	local var_5_113 = {
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

	var_5_16:RegisterAnimationSequence("Page3", var_5_113)

	local var_5_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Page3", var_5_114)

	local var_5_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Page3", var_5_115)

	local var_5_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("Page3", var_5_116)

	local var_5_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Page3", var_5_117)

	local var_5_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("Page3", var_5_118)

	local var_5_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("Page3", var_5_119)

	local var_5_120 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_30:RegisterAnimationSequence("Page3", var_5_120)

	local var_5_121 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_32:RegisterAnimationSequence("Page3", var_5_121)

	local var_5_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_34:RegisterAnimationSequence("Page3", var_5_122)

	local var_5_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_39:RegisterAnimationSequence("Page3", var_5_123)

	local var_5_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_42:RegisterAnimationSequence("Page3", var_5_124)

	local var_5_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_44:RegisterAnimationSequence("Page3", var_5_125)

	local var_5_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 832
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 690
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 862
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/EXCLUSIVELY_USABLE_IN")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_46:RegisterAnimationSequence("Page3", var_5_126)

	local var_5_127 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_49:RegisterAnimationSequence("Page3", var_5_127)

	local var_5_128 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_51:RegisterAnimationSequence("Page3", var_5_128)

	local var_5_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/WHAT_IT_MEANS_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -794
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1126
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_53:RegisterAnimationSequence("Page3", var_5_129)

	local var_5_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 454
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1728
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 838
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_55:RegisterAnimationSequence("Page3", var_5_130)

	local function var_5_131()
		var_5_6:AnimateSequence("Page3")
		var_5_12:AnimateSequence("Page3")
		var_5_14:AnimateSequence("Page3")
		var_5_16:AnimateSequence("Page3")
		var_5_18:AnimateSequence("Page3")
		var_5_20:AnimateSequence("Page3")
		var_5_22:AnimateSequence("Page3")
		var_5_24:AnimateSequence("Page3")
		var_5_26:AnimateSequence("Page3")
		var_5_28:AnimateSequence("Page3")
		var_5_30:AnimateSequence("Page3")
		var_5_32:AnimateSequence("Page3")
		var_5_34:AnimateSequence("Page3")
		var_5_39:AnimateSequence("Page3")
		var_5_42:AnimateSequence("Page3")
		var_5_44:AnimateSequence("Page3")
		var_5_46:AnimateSequence("Page3")
		var_5_49:AnimateSequence("Page3")
		var_5_51:AnimateSequence("Page3")
		var_5_53:AnimateSequence("Page3")
		var_5_55:AnimateSequence("Page3")
	end

	var_5_0._sequences.Page3 = var_5_131

	local var_5_132
	local var_5_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1066
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1066
		}
	}

	var_5_12:RegisterAnimationSequence("PC16x10Ratio", var_5_133)

	local function var_5_134()
		var_5_12:AnimateSequence("PC16x10Ratio")
	end

	var_5_0._sequences.PC16x10Ratio = var_5_134

	function var_5_0.addButtonHelperFunction(arg_13_0, arg_13_1)
		arg_13_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_135 = LUI.UIBindButton.new()

	var_5_135.id = "selfBindButton"

	var_5_0:addElement(var_5_135)

	var_5_0.bindButton = var_5_135

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassOnboardingPopup", BattlePassOnboardingPopup)
LockTable(_M)
