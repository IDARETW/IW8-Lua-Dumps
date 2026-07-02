module(..., package.seeall)

TIMED_BUTTON_LOCK_TIMER = 5000

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		Engine.DFJDIFJEGA("hasSeenCOPPANoticeMessage", 1, arg_1_1)
		Engine.CCBBGABHEH(arg_1_1)
		LUI.FlowManager.RequestLeaveMenu(arg_2_0)
	end)
	arg_1_0.ConfirmButton:addEventHandler("menu_create", function(arg_3_0, arg_3_1)
		arg_3_0:StartTimer(TIMED_BUTTON_LOCK_TIMER, true)
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end

	arg_1_0.CancelButton:SetFocusable(false)
end

function COPPAMenuNotice(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0.id = "COPPAMenuNotice"
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

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_NOTICE_NAME"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * 805, _1080p * -145, _1080p * -85)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "CancelButton"

	var_4_10:SetAlpha(0, 0)
	var_4_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_4_10.Text:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_4_0:addElement(var_4_10)

	var_4_0.CancelButton = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "ConfirmButton"

	var_4_12.Text:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_NOTICE_BTN_CONFIRM"), 0)
	var_4_12.Text:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_4_0:addElement(var_4_12)

	var_4_0.ConfirmButton = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "Description"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_NOTICE_SHORT_DESC"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * 805, _1080p * -79, _1080p * -57)
	var_4_0:addElement(var_4_14)

	var_4_0.Description = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIStyledText.new()

	var_4_16.id = "AdditionalText"

	var_4_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_16:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_NOTICE_FULL_DESC"), 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * 805, _1080p * -17, _1080p * 5)
	var_4_0:addElement(var_4_16)

	var_4_0.AdditionalText = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ShowCancelButton", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 83
		}
	}

	var_4_12:RegisterAnimationSequence("ShowCancelButton", var_4_20)

	local function var_4_21()
		var_4_10:AnimateSequence("ShowCancelButton")
		var_4_12:AnimateSequence("ShowCancelButton")
	end

	var_4_0._sequences.ShowCancelButton = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ShowAdditionalText", var_4_23)

	local function var_4_24()
		var_4_16:AnimateSequence("ShowAdditionalText")
	end

	var_4_0._sequences.ShowAdditionalText = var_4_24

	local var_4_25
	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 805
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 805
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -4 * _1080p
		}
	}

	var_4_14:RegisterAnimationSequence("AR", var_4_28)

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_4_16:RegisterAnimationSequence("AR", var_4_29)

	local function var_4_30()
		var_4_10:AnimateSequence("AR")
		var_4_12:AnimateSequence("AR")
		var_4_14:AnimateSequence("AR")
		var_4_16:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_30

	local var_4_31
	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_32)

	local function var_4_33()
		var_4_8:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_33

	function var_4_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_34 = LUI.UIBindButton.new()

	var_4_34.id = "selfBindButton"

	var_4_0:addElement(var_4_34)

	var_4_0.bindButton = var_4_34

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("COPPAMenuNotice", COPPAMenuNotice)
LockTable(_M)
