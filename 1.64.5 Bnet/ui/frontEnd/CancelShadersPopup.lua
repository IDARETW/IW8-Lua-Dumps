module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("PLATFORM_UI/SHADER_FRONTEND_PRELOAD_WAIT"))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	local function var_1_0(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
	end

	arg_1_0.ButtonCancel:addEventHandler("button_action", var_1_0)
	arg_1_0.bindButton:addEventHandler("button_secondary", var_1_0)
	arg_1_0.ButtonConfirm:addEventHandler("button_action", arg_1_2.yesAction)
end

function CancelShadersPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CancelShadersPopup"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "GenericPopupFrame"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_3_0:addElement(var_3_4)

	var_3_0.GenericPopupFrame = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Image"

	var_3_6:SetRGBFromTable(SWATCHES.KeyBinding.bindingError, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_6:setImage(RegisterMaterial("icon_net_shader_warning_big"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 381, _1080p * 637, _1080p * -128, _1080p * 128)
	var_3_0:addElement(var_3_6)

	var_3_0.Image = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "MenuTitle"

	var_3_8.MenuTitle:setText(Engine.CBBHFCGDIC("PLATFORM_UI/SHADER_FRONTEND_PRELOAD_WAIT"), 0)
	var_3_8.Line:SetLeft(0, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 159, _1080p * -225, _1080p * -121)
	var_3_0:addElement(var_3_8)

	var_3_0.MenuTitle = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "SelectPrompt"

	if CONDITIONS.AlwaysFalse(var_3_0) then
		var_3_10.Label:setText("SelectPrompt", 0)
	end

	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -766, _1080p * -635, _1080p * 246, _1080p * 266)
	var_3_0:addElement(var_3_10)

	var_3_0.SelectPrompt = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ButtonConfirm"

	var_3_12.BackgroundDarkener:SetAlpha(0.5, 0)
	var_3_12.Text:SetLeft(_1080p * 20, 0)
	var_3_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/PAUSE_INSTALLATION")), 0)
	var_3_12.Text:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -766, _1080p * -346, _1080p * 30, _1080p * 68)
	var_3_0:addElement(var_3_12)

	var_3_0.ButtonConfirm = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "ButtonCancel"

	var_3_14.BackgroundDarkener:SetAlpha(0.5, 0)
	var_3_14.Text:SetLeft(_1080p * 20, 0)
	var_3_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GO_BACK_AND_WAIT")), 0)
	var_3_14.Text:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -766, _1080p * -346, _1080p * 83, _1080p * 121)
	var_3_0:addElement(var_3_14)

	var_3_0.ButtonCancel = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "DisplayNameHeader"

	var_3_16:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("PLATFORM_UI/SHADER_FRONTEND_PRELOAD_SKIP"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -766, _1080p * 113, _1080p * -100, _1080p * -76)
	var_3_0:addElement(var_3_16)

	var_3_0.DisplayNameHeader = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 166
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -66
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_20)

	local function var_3_21()
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_21

	var_3_4:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.ScaleFullscreen(var_3_0)
	end)

	function var_3_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_22 = LUI.UIBindButton.new()

	var_3_22.id = "selfBindButton"

	var_3_0:addElement(var_3_22)

	var_3_0.bindButton = var_3_22

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CancelShadersPopup", CancelShadersPopup)
LockTable(_M)
