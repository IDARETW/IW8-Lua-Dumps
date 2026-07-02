module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.title)
	assert(arg_1_2.panelData)

	local var_1_0 = {
		arg_1_0.Panel1,
		arg_1_0.Panel2,
		arg_1_0.Panel3
	}

	arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.title)))
	ACTIONS.AnimateSequence(arg_1_0, "Show" .. #arg_1_2.panelData)

	local var_1_1 = #arg_1_2.panelData < #var_1_0 and #arg_1_2.panelData or #var_1_0

	for iter_1_0 = 1, var_1_1 do
		if arg_1_2.panelData[iter_1_0] then
			var_1_0[iter_1_0]:Setup(arg_1_2.panelData[iter_1_0])
		end
	end

	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.confirmButton and arg_1_2.confirmButton.action then
			arg_1_2.confirmButton.action(arg_2_0, arg_1_1)
		else
			ACTIONS.LeaveMenu(arg_2_0)
		end
	end)
	arg_1_0.GenericButton:StartTimer(arg_1_2.waitTime)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function OnboardingPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "OnboardingPopup"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GenericPopupWindow"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -292, _1080p * 292)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ButtonHelperBar"

	var_3_8.Background:SetAlpha(0, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 292, _1080p * 352)
	var_3_0:addElement(var_3_8)

	var_3_0.ButtonHelperBar = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Title"

	var_3_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_10:setText("TITLE", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -261, _1080p * -201)
	var_3_0:addElement(var_3_10)

	var_3_0.Title = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Panel1"

	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -804, _1080p * -292, _1080p * -162, _1080p * 194)
	var_3_0:addElement(var_3_12)

	var_3_0.Panel1 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Panel2"

	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -162, _1080p * 194)
	var_3_0:addElement(var_3_14)

	var_3_0.Panel2 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Panel3"

	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 292, _1080p * 804, _1080p * -162, _1080p * 194)
	var_3_0:addElement(var_3_16)

	var_3_0.Panel3 = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "GenericButton"

	var_3_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_3_18.Text:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 750, _1080p * 1170, _1080p * 232, _1080p * 270)
	var_3_0:addElement(var_3_18)

	var_3_0.GenericButton = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Show1", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		}
	}

	var_3_14:RegisterAnimationSequence("Show1", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		}
	}

	var_3_16:RegisterAnimationSequence("Show1", var_3_22)

	local function var_3_23()
		var_3_12:AnimateSequence("Show1")
		var_3_14:AnimateSequence("Show1")
		var_3_16:AnimateSequence("Show1")
	end

	var_3_0._sequences.Show1 = var_3_23

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -632
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -120
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Show2", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 632
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Show2", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Show2", var_3_26)

	local function var_3_27()
		var_3_12:AnimateSequence("Show2")
		var_3_14:AnimateSequence("Show2")
		var_3_16:AnimateSequence("Show2")
	end

	var_3_0._sequences.Show2 = var_3_27

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -292
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Show3", var_3_28)

	local var_3_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		}
	}

	var_3_14:RegisterAnimationSequence("Show3", var_3_29)

	local var_3_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		}
	}

	var_3_16:RegisterAnimationSequence("Show3", var_3_30)

	local function var_3_31()
		var_3_12:AnimateSequence("Show3")
		var_3_14:AnimateSequence("Show3")
		var_3_16:AnimateSequence("Show3")
	end

	var_3_0._sequences.Show3 = var_3_31

	function var_3_0.addButtonHelperFunction(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_32 = LUI.UIBindButton.new()

	var_3_32.id = "selfBindButton"

	var_3_0:addElement(var_3_32)

	var_3_0.bindButton = var_3_32

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OnboardingPopup", OnboardingPopup)
LockTable(_M)
