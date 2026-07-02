module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.title)
	assert(arg_1_2.panelData and arg_1_2.panelData[1])
	assert(arg_1_2.confirmButton)
	arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.title)))
	arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.panelData[1].image))
	arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_2.panelData[1].desc))
	arg_1_0.ConfirmButton:SetText(Engine.CBBHFCGDIC(arg_1_2.confirmButton.text))
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		arg_1_2.confirmButton.action(arg_2_0, arg_1_1)
	end)

	if arg_1_2.additionalText then
		arg_1_0.AdditionalText:setText(Engine.CBBHFCGDIC(arg_1_2.additionalText))

		local var_1_0 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.Description, Engine.CBBHFCGDIC(arg_1_2.panelData[1].desc))
		local var_1_1 = 10 * _1080p
		local var_1_2 = arg_1_0.Description:GetCurrentAnchorsAndPositions().top
		local var_1_3 = LAYOUT.GetElementHeight(arg_1_0.AdditionalText)

		arg_1_0.AdditionalText:SetTop(var_1_2 + var_1_0 + var_1_1)
		arg_1_0.AdditionalText:SetBottom(var_1_2 + var_1_0 + var_1_1 + var_1_3)
		ACTIONS.AnimateSequence(arg_1_0, "ShowAdditionalText")
	end

	if arg_1_2.cancelButton then
		arg_1_0.CancelButton:SetText(Engine.CBBHFCGDIC(arg_1_2.cancelButton.text))
		arg_1_0.CancelButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			arg_1_2.cancelButton.action(arg_3_0, arg_1_1)
		end)
		arg_1_0.ConfirmButton:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
			arg_4_0:StartTimer(arg_1_2.waitTime, true)
		end)
		arg_1_0:addEventHandler("timer_complete", function(arg_5_0, arg_5_1)
			arg_1_0.CancelButton:StartTimer(0)
		end)
		ACTIONS.AnimateSequence(arg_1_0, "ShowCancelButton")
	else
		arg_1_0.ConfirmButton:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
			arg_6_0:StartTimer(arg_1_2.waitTime)
		end)
		arg_1_0.CancelButton:SetFocusable(false)
		arg_1_0.CancelButton:SetMouseFocusBlocker(true)
	end

	if arg_1_2.backButtonOverride then
		arg_1_0.bindButton:registerEventHandler("button_secondary", function(arg_7_0, arg_7_1)
			if not arg_7_1.controller then
				local var_7_0 = arg_1_1
			end

			arg_1_2.backButtonOverride(arg_7_0, arg_7_1)
		end)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function OnboardingFeaturePopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "OnboardingFeaturePopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "ButtonHelperBar"

	var_8_8.Background:SetAlpha(0, 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 182, _1080p * 242)
	var_8_0:addElement(var_8_8)

	var_8_0.ButtonHelperBar = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Title"

	var_8_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_10:setText("TITLE", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -144, _1080p * -84)
	var_8_0:addElement(var_8_10)

	var_8_0.Title = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Image"

	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * -294, _1080p * -130, _1080p * 126)
	var_8_0:addElement(var_8_12)

	var_8_0.Image = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "CancelButton"

	var_8_14:SetAlpha(0, 0)
	var_8_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_8_14.Text:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_8_0:addElement(var_8_14)

	var_8_0.CancelButton = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "ConfirmButton"

	var_8_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_8_16.Text:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_8_0:addElement(var_8_16)

	var_8_0.ConfirmButton = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIStyledText.new()

	var_8_18.id = "Description"

	var_8_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_18:setText("", 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -79, _1080p * -57)
	var_8_0:addElement(var_8_18)

	var_8_0.Description = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIStyledText.new()

	var_8_20.id = "AdditionalText"

	var_8_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_20:SetAlpha(0, 0)
	var_8_20:setText("", 0)
	var_8_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_20:SetAlignment(LUI.Alignment.Left)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -17, _1080p * 5)
	var_8_0:addElement(var_8_20)

	var_8_0.AdditionalText = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_21

	local var_8_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ShowCancelButton", var_8_22)

	local var_8_23 = {
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

	var_8_16:RegisterAnimationSequence("ShowCancelButton", var_8_23)

	local function var_8_24()
		var_8_14:AnimateSequence("ShowCancelButton")
		var_8_16:AnimateSequence("ShowCancelButton")
	end

	var_8_0._sequences.ShowCancelButton = var_8_24

	local var_8_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ShowAdditionalText", var_8_25)

	local function var_8_26()
		var_8_20:AnimateSequence("ShowAdditionalText")
	end

	var_8_0._sequences.ShowAdditionalText = var_8_26

	local var_8_27 = {
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

	var_8_14:RegisterAnimationSequence("AR", var_8_27)

	local var_8_28 = {
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

	var_8_16:RegisterAnimationSequence("AR", var_8_28)

	local var_8_29 = {
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

	var_8_18:RegisterAnimationSequence("AR", var_8_29)

	local var_8_30 = {
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

	var_8_20:RegisterAnimationSequence("AR", var_8_30)

	local function var_8_31()
		var_8_14:AnimateSequence("AR")
		var_8_16:AnimateSequence("AR")
		var_8_18:AnimateSequence("AR")
		var_8_20:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_31

	function var_8_8.addButtonHelperFunction(arg_13_0, arg_13_1)
		arg_13_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	local var_8_32 = LUI.UIBindButton.new()

	var_8_32.id = "ButtonHelperBarBindButton"

	var_8_8:addElement(var_8_32)

	var_8_8.bindButton = var_8_32

	function var_8_0.addButtonHelperFunction(arg_14_0, arg_14_1)
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_8_0:addEventHandler("menu_create", var_8_0.addButtonHelperFunction)

	local var_8_33 = LUI.UIBindButton.new()

	var_8_33.id = "selfBindButton"

	var_8_0:addElement(var_8_33)

	var_8_0.bindButton = var_8_33

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("OnboardingFeaturePopup", OnboardingFeaturePopup)
LockTable(_M)
