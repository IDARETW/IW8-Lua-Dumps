module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return function(arg_2_0, arg_2_1)
		local var_2_0 = Dvar.BJJCJHDBII(arg_1_4)
		local var_2_1 = math.min(arg_1_2, math.max(arg_1_1, var_2_0 + arg_1_3))

		Dvar.IICIFEEDC(arg_1_4, var_2_1)
		Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_2_1.controller)
		arg_1_0.MarginsGuide:AnimateMarginArrows()

		if var_2_1 <= arg_1_1 or var_2_1 >= arg_1_2 then
			Engine.BJDBIAGIDA(CoD.SFX.DenyAdjustSafeArea)
		else
			Engine.BJDBIAGIDA(CoD.SFX.AdjustSafeArea)
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = {
		controllerIndex = arg_3_1,
		message = Engine.CBBHFCGDIC("LUA_MENU/SAFE_AREA_CANCEL_MSG"),
		yesAction = function()
			LUI.FlowManager.RequestLeaveMenu(arg_3_0, true)
		end,
		noAction = function(arg_5_0)
			Dvar.IICIFEEDC("MKOOLLQRPS", arg_3_0.originalVertMargin)
			Dvar.IICIFEEDC("NNLRMRKOTM", arg_3_0.originalHorzMargin)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_3_1)
			Engine.BHBDBCEHC()
			LUI.FlowManager.RequestLeaveMenu(arg_3_0, true)
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_3_1, false, var_3_0, true, true)
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.MarginsGuide)
	assert(arg_6_0.ContinueButton)

	arg_6_0.isBootOptions = arg_6_2.isBootOption or false

	Engine.DAGFFDGFII("profile_updateSafeareaDvars")
	arg_6_0:addEventHandler("menu_create", function(arg_7_0, arg_7_1)
		arg_7_0.originalVertMargin = Dvar.BJJCJHDBII("MKOOLLQRPS")
		arg_7_0.originalHorzMargin = Dvar.BJJCJHDBII("NNLRMRKOTM")

		if arg_7_0.isBootOptions then
			arg_7_0.isQuickAccessShortcutsDisabled = true
		end

		if arg_7_0.originalVertMargin < SliderBounds.VertMargin.Min or arg_7_0.originalVertMargin > SliderBounds.VertMargin.Max then
			arg_7_0.originalVertMargin = LUI.clamp(arg_7_0.originalVertMargin, SliderBounds.VertMargin.Min, SliderBounds.VertMargin.Max)

			Dvar.IICIFEEDC("MKOOLLQRPS", arg_7_0.originalVertMargin)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_6_1)
		end

		if arg_7_0.originalHorzMargin < SliderBounds.HorzMargin.Min or arg_7_0.originalHorzMargin > SliderBounds.HorzMargin.Max then
			arg_7_0.originalHorzMargin = LUI.clamp(arg_7_0.originalHorzMargin, SliderBounds.HorzMargin.Min, SliderBounds.HorzMargin.Max)

			Dvar.IICIFEEDC("NNLRMRKOTM", arg_7_0.originalHorzMargin)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_6_1)
		end

		arg_7_0.MarginsGuide:AnimateMarginArrows()
	end)

	local var_6_0 = LUI.UIBindButton.new()

	var_6_0.id = "bindButton"

	arg_6_0:addElement(var_6_0)

	arg_6_0.bindButton = var_6_0

	arg_6_0.ContinueButton:addEventHandler("button_action", function()
		Engine.BHBDBCEHC()
		LUI.FlowManager.RequestLeaveMenu(arg_6_0, true)
	end)
	var_6_0:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		local var_9_0 = 0.001
		local var_9_1 = Dvar.BJJCJHDBII("NNLRMRKOTM")
		local var_9_2 = Dvar.BJJCJHDBII("MKOOLLQRPS")
		local var_9_3 = math.abs(arg_6_0.originalHorzMargin - var_9_1)
		local var_9_4 = math.abs(arg_6_0.originalVertMargin - var_9_2)

		if var_9_0 <= var_9_3 or var_9_0 <= var_9_4 then
			var_0_1(arg_6_0, arg_9_1.controller)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_6_0, true)
		end
	end)
	var_6_0:addEventHandler("button_up", var_0_0(arg_6_0, SliderBounds.VertMargin.Min, SliderBounds.VertMargin.Max, SliderBounds.VertMargin.Step, "MKOOLLQRPS"))
	var_6_0:addEventHandler("button_down", var_0_0(arg_6_0, SliderBounds.VertMargin.Min, SliderBounds.VertMargin.Max, -SliderBounds.VertMargin.Step, "MKOOLLQRPS"))
	var_6_0:addEventHandler("button_left", var_0_0(arg_6_0, SliderBounds.HorzMargin.Min, SliderBounds.HorzMargin.Max, -SliderBounds.HorzMargin.Step, "NNLRMRKOTM"))
	var_6_0:addEventHandler("button_right", var_0_0(arg_6_0, SliderBounds.HorzMargin.Min, SliderBounds.HorzMargin.Max, SliderBounds.HorzMargin.Step, "NNLRMRKOTM"))

	local function var_6_1(arg_10_0, arg_10_1)
		arg_10_0.AdjustRightButton:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_RIGHT_BUTTON"))
		arg_10_0.AdjustRightText:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_RIGHT_TEXT"))
		arg_10_0.AdjustLeftButton:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_LEFT_BUTTON"))
		arg_10_0.AdjustLeftText:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_LEFT_TEXT"))
		arg_10_0.AdjustTopButton:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_UP_BUTTON"))
		arg_10_0.AdjustTopText:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_UP_TEXT"))
		arg_10_0.AdjustBottomButton:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_DOWN_BUTTON"))
		arg_10_0.AdjustBottomText:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_DOWN_TEXT"))
	end

	arg_6_0:addAndCallEventHandler("update_input_type", var_6_1, {
		controllerIndex = arg_6_1
	})

	if IsLanguageArabic() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end

	LUI.TextChat.SetupMenuForNoChat(arg_6_0)

	local function var_6_2(arg_11_0, arg_11_1)
		if LUI.IsLastInputGamepad(arg_6_1) then
			ACTIONS.AnimateSequence(arg_11_0, "Gamepad")
		else
			ACTIONS.AnimateSequence(arg_11_0, "KBM")
		end
	end

	arg_6_0:addAndCallEventHandler("update_input_type", var_6_2, {
		controllerIndex = arg_6_1
	})
end

function ScreenMargins(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0.id = "ScreenMargins"
	var_12_0._animationSets = {}
	var_12_0._sequences = {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Background"

	var_12_4:SetRGBFromInt(3355443, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Background = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("MarginsGuide", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "MarginsGuide"

	var_12_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.MarginsGuide = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIText.new()

	var_12_8.id = "Title"

	var_12_8:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_12_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SAFE_AREA")), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_12_8:SetAlignment(LUI.Alignment.Center)
	var_12_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -825, _1080p * 830, _1080p * 154, _1080p * 214)
	var_12_0:addElement(var_12_8)

	var_12_0.Title = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIText.new()

	var_12_10.id = "Instructions"

	var_12_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_12_10:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_INSTRUCTIONS"), 0)
	var_12_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_10:SetAlignment(LUI.Alignment.Center)
	var_12_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 130, _1080p * -130, _1080p * 299, _1080p * 323)
	var_12_0:addElement(var_12_10)

	var_12_0.Instructions = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIText.new()

	var_12_12.id = "InstructionsHorz"

	var_12_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_12_12:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_HORZ"), 0)
	var_12_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_12:SetAlignment(LUI.Alignment.Center)
	var_12_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 429, _1080p * 465)
	var_12_0:addElement(var_12_12)

	var_12_0.InstructionsHorz = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIText.new()

	var_12_14.id = "AdjustLeftButton"

	var_12_14:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_LEFT_BUTTON"), 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_14:SetAlignment(LUI.Alignment.Center)
	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * -2, _1080p * -47, _1080p * 13)
	var_12_0:addElement(var_12_14)

	var_12_0.AdjustLeftButton = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIText.new()

	var_12_16.id = "AdjustLeftText"

	var_12_16:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_LEFT_TEXT"), 0)
	var_12_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_16:SetAlignment(LUI.Alignment.Center)
	var_12_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * -2, _1080p * 21, _1080p * 41)
	var_12_0:addElement(var_12_16)

	var_12_0.AdjustLeftText = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIText.new()

	var_12_18.id = "AdjustRightButton"

	var_12_18:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_RIGHT_BUTTON"), 0)
	var_12_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_18:SetAlignment(LUI.Alignment.Center)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 250, _1080p * -47, _1080p * 13)
	var_12_0:addElement(var_12_18)

	var_12_0.AdjustRightButton = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIText.new()

	var_12_20.id = "AdjustRightText"

	var_12_20:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_RIGHT_TEXT"), 0)
	var_12_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_20:SetAlignment(LUI.Alignment.Center)
	var_12_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 250, _1080p * 21, _1080p * 41)
	var_12_0:addElement(var_12_20)

	var_12_0.AdjustRightText = var_12_20

	local var_12_21
	local var_12_22 = LUI.UIText.new()

	var_12_22.id = "InstructionsVert"

	var_12_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_12_22:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_VERT"), 0)
	var_12_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_22:SetAlignment(LUI.Alignment.Center)
	var_12_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 654, _1080p * 690)
	var_12_0:addElement(var_12_22)

	var_12_0.InstructionsVert = var_12_22

	local var_12_23
	local var_12_24 = LUI.UIText.new()

	var_12_24.id = "AdjustTopButton"

	var_12_24:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_UP_BUTTON"), 0)
	var_12_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_24:SetAlignment(LUI.Alignment.Center)
	var_12_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * -2, _1080p * 167, _1080p * 227)
	var_12_0:addElement(var_12_24)

	var_12_0.AdjustTopButton = var_12_24

	local var_12_25
	local var_12_26 = LUI.UIText.new()

	var_12_26.id = "AdjustTopText"

	var_12_26:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_UP_TEXT"), 0)
	var_12_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_26:SetAlignment(LUI.Alignment.Center)
	var_12_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * -2, _1080p * 234, _1080p * 254)
	var_12_0:addElement(var_12_26)

	var_12_0.AdjustTopText = var_12_26

	local var_12_27
	local var_12_28 = LUI.UIText.new()

	var_12_28.id = "AdjustBottomButton"

	var_12_28:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_DOWN_BUTTON"), 0)
	var_12_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_28:SetAlignment(LUI.Alignment.Center)
	var_12_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 250, _1080p * 167, _1080p * 227)
	var_12_0:addElement(var_12_28)

	var_12_0.AdjustBottomButton = var_12_28

	local var_12_29
	local var_12_30 = LUI.UIText.new()

	var_12_30.id = "AdjustBottomText"

	var_12_30:setText(Engine.CBBHFCGDIC("MENU/ADJUST_SAFE_AREA_DOWN_TEXT"), 0)
	var_12_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_30:SetAlignment(LUI.Alignment.Center)
	var_12_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 250, _1080p * 234, _1080p * 254)
	var_12_0:addElement(var_12_30)

	var_12_0.AdjustBottomText = var_12_30

	local var_12_31
	local var_12_32 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_12_1
	})

	var_12_32.id = "ContinueButton"

	var_12_32.Text:SetLeft(_1080p * 20, 0)
	var_12_32.Text:setText(Engine.CBBHFCGDIC("MENU/APPLY"), 0)
	var_12_32.Text:SetAlignment(LUI.Alignment.Center)
	var_12_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -210, _1080p * 210, _1080p * 866, _1080p * 904)
	var_12_0:addElement(var_12_32)

	var_12_0.ContinueButton = var_12_32

	local function var_12_33()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_33

	local var_12_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 329
		}
	}

	var_12_10:RegisterAnimationSequence("AR", var_12_34)

	local var_12_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_12_14:RegisterAnimationSequence("AR", var_12_35)

	local var_12_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_12_18:RegisterAnimationSequence("AR", var_12_36)

	local var_12_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 205
		}
	}

	var_12_24:RegisterAnimationSequence("AR", var_12_37)

	local var_12_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 205
		}
	}

	var_12_28:RegisterAnimationSequence("AR", var_12_38)

	local function var_12_39()
		var_12_10:AnimateSequence("AR")
		var_12_14:AnimateSequence("AR")
		var_12_18:AnimateSequence("AR")
		var_12_24:AnimateSequence("AR")
		var_12_28:AnimateSequence("AR")
	end

	var_12_0._sequences.AR = var_12_39

	local var_12_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18
		}
	}

	var_12_14:RegisterAnimationSequence("KBM", var_12_40)

	local var_12_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 270
		}
	}

	var_12_18:RegisterAnimationSequence("KBM", var_12_41)

	local var_12_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18
		}
	}

	var_12_24:RegisterAnimationSequence("KBM", var_12_42)

	local var_12_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 270
		}
	}

	var_12_28:RegisterAnimationSequence("KBM", var_12_43)

	local function var_12_44()
		var_12_14:AnimateSequence("KBM")
		var_12_18:AnimateSequence("KBM")
		var_12_24:AnimateSequence("KBM")
		var_12_28:AnimateSequence("KBM")
	end

	var_12_0._sequences.KBM = var_12_44

	local var_12_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -250
		}
	}

	var_12_14:RegisterAnimationSequence("Gamepad", var_12_45)

	local var_12_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		}
	}

	var_12_18:RegisterAnimationSequence("Gamepad", var_12_46)

	local var_12_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -250
		}
	}

	var_12_24:RegisterAnimationSequence("Gamepad", var_12_47)

	local var_12_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		}
	}

	var_12_28:RegisterAnimationSequence("Gamepad", var_12_48)

	local function var_12_49()
		var_12_14:AnimateSequence("Gamepad")
		var_12_18:AnimateSequence("Gamepad")
		var_12_24:AnimateSequence("Gamepad")
		var_12_28:AnimateSequence("Gamepad")
	end

	var_12_0._sequences.Gamepad = var_12_49

	var_0_2(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("ScreenMargins", ScreenMargins)
LockTable(_M)
