module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		arg_1_0.Title:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -364, _1080p * -254)
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.GetChallengesFunction(arg_2_1)

	if var_2_0 and #var_2_0 > 0 then
		Challenge.SortByLength(var_2_0)

		local var_2_1 = math.min(#var_2_0, #arg_2_0._details)

		ACTIONS.AnimateSequence(arg_2_0, "Display" .. var_2_1)

		for iter_2_0 = 1, var_2_1 do
			local var_2_2 = var_2_0[iter_2_0]

			arg_2_0._details[iter_2_0]:SetData(var_2_2)
		end
	elseif not Dvar.IBEGCHEFE("MKSNTLMSQR") then
		arg_2_0:addEventHandler("menu_create", function(arg_3_0, arg_3_1)
			arg_3_0:SetAlpha(0)
			LUI.FlowManager.RequestLeaveMenu(arg_3_0, false, true)
		end)
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.GetChallengesFunction = arg_4_2.GetChallengesFunction or Challenge.GetDailyChallenges
	arg_4_0._details = {
		arg_4_0.ChallengePopupDetails1,
		arg_4_0.ChallengePopupDetails2,
		arg_4_0.ChallengePopupDetails3
	}

	var_0_1(arg_4_0, arg_4_1)
	Challenge.SetupDailyResetTimer(arg_4_0.ChallengeResetTimer, arg_4_0.ChallengeResetTimer.Text, true)
	arg_4_0.ChallengeResetTimer:SetupLeftAlignment()

	local function var_4_0()
		Challenge.SetSeenDailyPopup(arg_4_1)
		LUI.FlowManager.RequestLeaveMenu(arg_4_0, true, false)
	end

	arg_4_0.ContinueButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		var_4_0()
	end)

	arg_4_0.BindButton = LUI.UIBindButton.new()
	arg_4_0.BindButton.id = "BindButton"

	arg_4_0:addElement(arg_4_0.BindButton)
	arg_4_0.BindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		var_4_0()
	end)
	ACTIONS.ScaleFullscreen(arg_4_0.Background)
	var_0_0(arg_4_0)
	arg_4_0:addEventHandler("new_daily_challenges", function(arg_8_0, arg_8_1)
		var_0_1(arg_8_0, arg_4_1)
	end)
	arg_4_0:addEventHandler("new_br_daily_challenges", function(arg_9_0, arg_9_1)
		var_0_1(arg_9_0, arg_4_1)
	end)
end

function ChallengesDailyPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "ChallengesDailyPopup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.9, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "GenericPopupWindow"

	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -294, _1080p * 296)
	var_10_0:addElement(var_10_6)

	var_10_0.GenericPopupWindow = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIText.new()

	var_10_8.id = "Title"

	var_10_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_8:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES")), 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_8:SetAlignment(LUI.Alignment.Center)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -263, _1080p * -203)
	var_10_0:addElement(var_10_8)

	var_10_0.Title = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "ContinueButton"

	var_10_10.Text:SetLeft(_1080p * 20, 0)
	var_10_10.Text:setText(Engine.CBBHFCGDIC("MENU/CONTINUE"), 0)
	var_10_10.Text:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 213, _1080p * 251)
	var_10_0:addElement(var_10_10)

	var_10_0.ContinueButton = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_10_0) then
		var_10_12.Label:setText("ButtonPrompts", 0)
	end

	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * 394, _1080p * 425)
	var_10_0:addElement(var_10_12)

	var_10_0.Prompts = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "ChallengeResetTimer"

	var_10_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 145, _1080p * 223, _1080p * -235, _1080p * -205)
	var_10_0:addElement(var_10_14)

	var_10_0.ChallengeResetTimer = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("ChallengePopupDetails", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "ChallengePopupDetails1"

	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 664, _1080p * 454, _1080p * 634)
	var_10_0:addElement(var_10_16)

	var_10_0.ChallengePopupDetails1 = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("ChallengePopupDetails", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "ChallengePopupDetails2"

	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 704, _1080p * 1218, _1080p * 454, _1080p * 634)
	var_10_0:addElement(var_10_18)

	var_10_0.ChallengePopupDetails2 = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("ChallengePopupDetails", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "ChallengePopupDetails3"

	var_10_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1258, _1080p * 1772, _1080p * 454, _1080p * 634)
	var_10_0:addElement(var_10_20)

	var_10_0.ChallengePopupDetails3 = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "WZHeader"

	var_10_22.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_CAPS"), 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -810, _1080p * 812, _1080p * -148, _1080p * -108)
	var_10_0:addElement(var_10_22)

	var_10_0.WZHeader = var_10_22

	local function var_10_23()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_23

	local var_10_24
	local var_10_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 703
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1217
		}
	}

	var_10_16:RegisterAnimationSequence("Display1", var_10_25)

	local var_10_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("Display1", var_10_26)

	local var_10_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("Display1", var_10_27)

	local function var_10_28()
		var_10_16:AnimateSequence("Display1")
		var_10_18:AnimateSequence("Display1")
		var_10_20:AnimateSequence("Display1")
	end

	var_10_0._sequences.Display1 = var_10_28

	local var_10_29
	local var_10_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 775
		}
	}

	var_10_16:RegisterAnimationSequence("Display2", var_10_30)

	local var_10_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1659
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("Display2", var_10_31)

	local var_10_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("Display2", var_10_32)

	local function var_10_33()
		var_10_16:AnimateSequence("Display2")
		var_10_18:AnimateSequence("Display2")
		var_10_20:AnimateSequence("Display2")
	end

	var_10_0._sequences.Display2 = var_10_33

	local var_10_34
	local var_10_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 664
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("Display3", var_10_35)

	local var_10_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 704
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1218
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("Display3", var_10_36)

	local var_10_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1772
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("Display3", var_10_37)

	local function var_10_38()
		var_10_16:AnimateSequence("Display3")
		var_10_18:AnimateSequence("Display3")
		var_10_20:AnimateSequence("Display3")
	end

	var_10_0._sequences.Display3 = var_10_38

	local var_10_39
	local var_10_40 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 223
		}
	}

	var_10_14:RegisterAnimationSequence("AR", var_10_40)

	local function var_10_41()
		var_10_14:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_41

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("ChallengesDailyPopup", ChallengesDailyPopup)
LockTable(_M)
