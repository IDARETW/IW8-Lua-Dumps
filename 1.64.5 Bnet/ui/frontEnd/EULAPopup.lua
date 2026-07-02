module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.currentPage = arg_1_0.currentPage + arg_1_1

	assert(arg_1_0.Arrows)
	assert(arg_1_0.Arrows.ListCount)
	arg_1_0.Arrows.ListCount:setText(Engine.CBBHFCGDIC("MENU/PAGE_N_SLASH_N", arg_1_0.currentPage, arg_1_0.totalPage))
	Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.EULAStringIds)

	local var_2_0 = arg_2_2.EULAStringIds

	arg_2_0.isQuickAccessShortcutsDisabled = true

	if arg_2_2.title then
		arg_2_0.Title:setText(arg_2_2.title)
	end

	if arg_2_2.terms then
		arg_2_0.Terms:setText(arg_2_2.terms)
	end

	arg_2_0.disableAcceptUntilLastPage = arg_2_2.disableAcceptUntilLastPage
	arg_2_0.chatOptOut = true
	arg_2_0.currentPage = 1
	arg_2_0.maxPageReached = false

	var_0_0(arg_2_0, 0)

	arg_2_0.currentEULAIndex = 1

	arg_2_0.EULAPagedText:setText(LocalizeLongString(var_2_0[arg_2_0.currentEULAIndex]))
	assert(arg_2_0.AcceptButton)
	assert(arg_2_2.acceptAction)
	arg_2_0.AcceptButton:addEventHandler("button_action", arg_2_2.acceptAction)

	if arg_2_0.disableAcceptUntilLastPage then
		arg_2_0.AcceptButton:processEvent({
			name = "disable"
		})
	end

	assert(arg_2_0.DeclineButton)
	assert(arg_2_2.declineAction)
	arg_2_0.DeclineButton:addEventHandler("button_action", arg_2_2.declineAction)

	function arg_2_0.EULAPagedText.OnFirstSetTextDone(arg_3_0)
		if arg_2_0.AcceptButton:IsDisabled() and #arg_3_0._textPages <= 1 and not var_2_0[arg_2_0.currentEULAIndex + 1] then
			arg_2_0.AcceptButton:processEvent({
				name = "enable",
				controller = arg_2_1
			})
		end

		arg_2_0.totalPage = arg_2_0.EULAPagedText:GetTotalPages(var_2_0)

		var_0_0(arg_2_0, 0)
	end

	arg_2_0.EULAPagedText:addEventHandler("next_page_success", function(arg_4_0, arg_4_1)
		if not arg_2_0.maxPageReached then
			var_0_0(arg_2_0, 1)
		end
	end)
	arg_2_0.EULAPagedText:addEventHandler("prev_page_success", function(arg_5_0, arg_5_1)
		if arg_2_0.currentPage > 1 then
			arg_2_0.maxPageReached = false

			var_0_0(arg_2_0, -1)
		end
	end)
	arg_2_0.EULAPagedText:addEventHandler("next_page_fail", function(arg_6_0, arg_6_1)
		if arg_2_0.currentEULAIndex < #var_2_0 then
			arg_2_0.currentEULAIndex = arg_2_0.currentEULAIndex + 1

			arg_2_0.EULAPagedText:setText(LocalizeLongString(var_2_0[arg_2_0.currentEULAIndex]), 0)
			var_0_0(arg_2_0, 1)

			if arg_2_0.currentEULAIndex == #var_2_0 and arg_2_0.AcceptButton:IsDisabled() then
				arg_2_0.AcceptButton:processEvent({
					name = "enable",
					controller = arg_6_1.controller
				})
			end
		else
			arg_2_0.maxPageReached = true
		end
	end)
	arg_2_0.EULAPagedText:addEventHandler("prev_page_fail", function(arg_7_0, arg_7_1)
		if arg_2_0.currentEULAIndex > 1 then
			arg_2_0.currentEULAIndex = arg_2_0.currentEULAIndex - 1

			arg_2_0.EULAPagedText:setText(LocalizeLongString(var_2_0[arg_2_0.currentEULAIndex]), 0)
			arg_2_0.EULAPagedText:SetPage(arg_2_0.EULAPagedText:GetNumPages(arg_2_0.EULAPagedText))

			arg_2_0.maxPageReached = false

			var_0_0(arg_2_0, -1)
		end
	end)
	arg_2_0.bindButton:addEventHandler("button_left", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller or arg_2_1

		if LUI.IsLastInputKeyboardMouse(var_8_0) then
			ACTIONS.PrevPage(arg_2_0)

			return true
		end
	end)
	arg_2_0.bindButton:addEventHandler("button_right", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.controller or arg_2_1

		if LUI.IsLastInputKeyboardMouse(var_9_0) then
			ACTIONS.NextPage(arg_2_0)

			return true
		end
	end)
	assert(arg_2_0.Arrows)
	arg_2_0.Arrows.ArrowUp:addEventHandler("leftmouseup", function(arg_10_0, arg_10_1)
		ACTIONS.PrevPage(arg_2_0)

		return true
	end)
	arg_2_0.Arrows.ArrowDown:addEventHandler("leftmouseup", function(arg_11_0, arg_11_1)
		ACTIONS.NextPage(arg_2_0)

		return true
	end)
	arg_2_0.bindButton:addEventHandler("button_shoulderl", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = arg_2_1
		end

		ACTIONS.PrevPage(arg_2_0)
	end)
	arg_2_0.bindButton:addEventHandler("button_shoulderr", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = arg_2_1
		end

		ACTIONS.NextPage(arg_2_0)
	end)

	local function var_2_1(arg_14_0, arg_14_1)
		if LUI.IsLastInputGamepad(arg_14_1.controllerIndex) then
			arg_14_0:AddButtonHelperTextToElement(arg_14_0.EULAButtonHelperBar, {
				side = "left",
				button_ref = "button_shoulderl",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREV_PAGE")
			})
			arg_14_0:AddButtonHelperTextToElement(arg_14_0.EULAButtonHelperBar, {
				side = "right",
				button_ref = "button_shoulderr",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/NEXT_PAGE")
			})
			arg_14_0.Arrows.ArrowUp:SetAlpha(0)
			arg_14_0.Arrows.ArrowDown:SetAlpha(0)
		else
			arg_14_0:RemoveButtonHelperTextFromElement(arg_14_0.HelperBar, "button_shoulderl", "right")
			arg_14_0:RemoveButtonHelperTextFromElement(arg_14_0.HelperBar, "button_shoulderr", "right")
			arg_14_0.Arrows.ArrowUp:SetAlpha(1)
			arg_14_0.Arrows.ArrowDown:SetAlpha(1)
		end
	end

	arg_2_0:addAndCallEventHandler("update_input_type", var_2_1, {
		controllerIndex = arg_2_1
	})
	arg_2_0:addEventHandler("onVideoChange", function(arg_15_0, arg_15_1)
		arg_15_0.currentPage = 1
		arg_15_0.currentEULAIndex = 1

		var_0_0(arg_15_0, 0)
		arg_15_0.EULAPagedText:SetPage(1)
		arg_15_0.EULAPagedText:setText(LocalizeLongString(var_2_0[arg_15_0.currentEULAIndex]), 0)

		arg_15_0.maxPageReached = false
	end)

	if Engine.CJJAFGIFAC(arg_2_1) then
		if not Engine.CFHBIHABCB(arg_2_1) then
			ACTIONS.AnimateSequence(arg_2_0, "WarzoneLogo")
		end
	else
		ACTIONS.AnimateSequence(arg_2_0, "HybridLogo")
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.BackgroundImage)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function EULAPopup(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIVerticalNavigator.new()

	var_16_0.id = "EULAPopup"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	var_16_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})
	var_16_0.HelperBar.id = "HelperBar"

	var_16_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_16_0.HelperBar:setPriority(10)
	var_16_0:addElement(var_16_0.HelperBar)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "BackgroundImage"

	var_16_4:setImage(RegisterMaterial("mm_boot_background"), 0)
	var_16_0:addElement(var_16_4)

	var_16_0.BackgroundImage = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "GenericPopupWindow"

	var_16_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -348, _1080p * 830, _1080p * -340, _1080p * 254)
	var_16_0:addElement(var_16_6)

	var_16_0.GenericPopupWindow = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "AcceptButton"

	var_16_8.Text:SetLeft(_1080p * 20, 0)
	var_16_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT"), 0)
	var_16_8.Text:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -781, _1080p * -450, _1080p * -82, _1080p * -43)
	var_16_0:addElement(var_16_8)

	var_16_0.AcceptButton = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "DeclineButton"

	var_16_10.Text:SetLeft(_1080p * 20, 0)
	var_16_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/DECLINE"), 0)
	var_16_10.Text:SetAlignment(LUI.Alignment.Left)
	var_16_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -781, _1080p * -450, _1080p * -31, _1080p * 8)
	var_16_0:addElement(var_16_10)

	var_16_0.DeclineButton = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIPagedText.new()

	var_16_12.id = "EULAPagedText"

	var_16_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_12:setText("PLATFORM_EULA", 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_12:SetAlignment(LUI.Alignment.Left)
	var_16_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -267, _1080p * 749, _1080p * -286, _1080p * -266)
	var_16_0:addElement(var_16_12)

	var_16_0.EULAPagedText = var_16_12

	local var_16_13
	local var_16_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})

	var_16_14.id = "EULAButtonHelperBar"

	var_16_14.Background:SetAlpha(0, 0)
	var_16_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 576, _1080p * 328, _1080p * 388)
	var_16_0:addElement(var_16_14)

	var_16_0.EULAButtonHelperBar = var_16_14

	local var_16_15

	if CONDITIONS.IsXboxLive(var_16_0) then
		local var_16_16 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_16_1
		})

		var_16_16.id = "Gamertag"

		var_16_16.TextLabel:SetAlignment(LUI.Alignment.Left)
		var_16_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -844, _1080p * -375, _1080p * 424, _1080p * 454)
		var_16_0:addElement(var_16_16)

		var_16_0.Gamertag = var_16_16
	end

	local var_16_17
	local var_16_18 = LUI.UIImage.new()

	var_16_18.id = "Logo"

	var_16_18:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_16_18:SetAlpha(0.6, 0)
	var_16_18:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_16_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -781, _1080p * -450, _1080p * -397, _1080p * -208)
	var_16_0:addElement(var_16_18)

	var_16_0.Logo = var_16_18

	local var_16_19
	local var_16_20 = LUI.UIText.new()

	var_16_20.id = "Message"

	var_16_20:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_20:SetAlpha(0.6, 0)
	var_16_20:setText(Engine.CBBHFCGDIC("LUA_MENU/READ_EULA_MESSAGE"), 0)
	var_16_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_20:SetAlignment(LUI.Alignment.Left)
	var_16_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -781, _1080p * -456, _1080p * -173, _1080p * -153)
	var_16_0:addElement(var_16_20)

	var_16_0.Message = var_16_20

	local var_16_21
	local var_16_22 = LUI.UIText.new()

	var_16_22.id = "Terms"

	var_16_22:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_16_22:setText(Engine.CBBHFCGDIC("LUA_MENU/EULA_TITLE"), 0)
	var_16_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_22:SetAlignment(LUI.Alignment.Left)
	var_16_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -348, _1080p * 830, _1080p * -386, _1080p * -358)
	var_16_0:addElement(var_16_22)

	var_16_0.Terms = var_16_22

	local var_16_23
	local var_16_24 = LUI.UIText.new()

	var_16_24.id = "Title"

	var_16_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_24:setText("", 0)
	var_16_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_24:SetAlignment(LUI.Alignment.Left)
	var_16_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -781, _1080p * -450, _1080p * -222, _1080p * -194)
	var_16_0:addElement(var_16_24)

	var_16_0.Title = var_16_24

	local var_16_25
	local var_16_26 = LUI.UIText.new()

	var_16_26.id = "Copyright"

	var_16_26:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_26:SetAlpha(0.6, 0)
	var_16_26:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_16_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_26:SetAlignment(LUI.Alignment.Left)
	var_16_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -781, _1080p * -450, _1080p * 40, _1080p * 60)
	var_16_0:addElement(var_16_26)

	var_16_0.Copyright = var_16_26

	local var_16_27
	local var_16_28 = MenuBuilder.BuildRegisteredType("GridCountArrows", {
		controllerIndex = var_16_1
	})

	var_16_28.id = "Arrows"

	var_16_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 141, _1080p * 341, _1080p * 336, _1080p * 368)
	var_16_0:addElement(var_16_28)

	var_16_0.Arrows = var_16_28

	local var_16_29
	local var_16_30 = LUI.UIStyledText.new()

	var_16_30.id = "RegisteredTrademark"

	var_16_30:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_16_30:SetAlpha(0.6, 0)
	var_16_30:setText(Engine.CBBHFCGDIC("MENU/R_CIRCLE"), 0)
	var_16_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_30:SetAlignment(LUI.Alignment.Left)
	var_16_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -505, _1080p * -371, _1080p * -286, _1080p * -268)
	var_16_0:addElement(var_16_30)

	var_16_0.RegisteredTrademark = var_16_30

	local function var_16_31()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_31

	local var_16_32
	local var_16_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -28
		}
	}

	var_16_8:RegisterAnimationSequence("AR", var_16_33)

	local var_16_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_16_10:RegisterAnimationSequence("AR", var_16_34)

	local var_16_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_16_12:RegisterAnimationSequence("AR", var_16_35)

	local var_16_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -196
		}
	}

	var_16_20:RegisterAnimationSequence("AR", var_16_36)

	local var_16_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -356
		}
	}

	var_16_22:RegisterAnimationSequence("AR", var_16_37)

	local var_16_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -238
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_16_24:RegisterAnimationSequence("AR", var_16_38)

	local var_16_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_16_26:RegisterAnimationSequence("AR", var_16_39)

	local function var_16_40()
		var_16_8:AnimateSequence("AR")
		var_16_10:AnimateSequence("AR")
		var_16_12:AnimateSequence("AR")
		var_16_20:AnimateSequence("AR")
		var_16_22:AnimateSequence("AR")
		var_16_24:AnimateSequence("AR")
		var_16_26:AnimateSequence("AR")
	end

	var_16_0._sequences.AR = var_16_40

	local var_16_41
	local var_16_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_wz_shadow")
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_18:RegisterAnimationSequence("WarzoneLogo", var_16_42)

	local var_16_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -541
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -271
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -407
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -253
		}
	}

	var_16_30:RegisterAnimationSequence("WarzoneLogo", var_16_43)

	local function var_16_44()
		var_16_18:AnimateSequence("WarzoneLogo")
		var_16_30:AnimateSequence("WarzoneLogo")
	end

	var_16_0._sequences.WarzoneLogo = var_16_44

	local var_16_45
	local var_16_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_main_menu_cod_mw")
		}
	}

	var_16_18:RegisterAnimationSequence("HybridLogo", var_16_46)

	local var_16_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -482
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -263
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -245
		}
	}

	var_16_30:RegisterAnimationSequence("HybridLogo", var_16_47)

	local function var_16_48()
		var_16_18:AnimateSequence("HybridLogo")
		var_16_30:AnimateSequence("HybridLogo")
	end

	var_16_0._sequences.HybridLogo = var_16_48

	var_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_16_49 = LUI.UIBindButton.new()

	var_16_49.id = "selfBindButton"

	var_16_0:addElement(var_16_49)

	var_16_0.bindButton = var_16_49

	var_0_1(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("EULAPopup", EULAPopup)
LockTable(_M)
