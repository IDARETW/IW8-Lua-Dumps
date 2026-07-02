module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Image)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.Text)
	assert(arg_1_0.ButtonOK)
	assert(arg_1_0.ButtonOKHold)

	arg_1_0.chatOptOut = true

	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU_SP/OFFENSIVE_TITLE"))

	local function var_1_0(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, false)
	end

	LUI.AddUIHoldButtonLogic(arg_1_0.ButtonOKHold, arg_1_1, {
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_1_0.ButtonOKHold.GenericProgressBar,
		onFill = var_1_0
	})
	arg_1_0.ButtonOK:addEventHandler("button_action", var_1_0)

	arg_1_0.ButtonOK.isRemoved = false
	arg_1_0.ButtonOKHold.isRemoved = false

	local function var_1_1(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0.ButtonOK
		local var_3_1 = arg_3_0.ButtonOKHold

		if LUI.IsLastInputKeyboardMouse(arg_3_1.controllerIndex) then
			var_3_0 = arg_3_0.ButtonOKHold
			var_3_1 = arg_3_0.ButtonOK
		end

		if not var_3_0.isRemoved then
			arg_3_0:RemoveElement(var_3_0)

			var_3_0.isRemoved = true
		end

		if var_3_1.isRemoved then
			arg_3_0:addElement(var_3_1)

			var_3_1.isRemoved = false
		end

		var_3_1:processEvent({
			name = "gain_focus"
		})
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_1, {
		controllerIndex = arg_1_1
	})
	ACTIONS.ScaleFullscreen(arg_1_0.Background)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function DisturbingContent(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "DisturbingContent"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:setImage(RegisterMaterial("mm_boot_background"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupFrame"

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupFrame = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Image"

	var_4_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_8:SetAlpha(0.6, 0)
	var_4_8:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1151, _1080p * 1687, _1080p * 387, _1080p * 693)
	var_4_0:addElement(var_4_8)

	var_4_0.Image = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Text"

	var_4_10:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("MENU_SP/OFFENSIVE_WARNING"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -620, _1080p * 21, _1080p * 433, _1080p * 457)
	var_4_0:addElement(var_4_10)

	var_4_0.Text = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "MenuTitle"

	var_4_12.MenuTitle:setText(Engine.CBBHFCGDIC("MENU_SP/OFFENSIVE_TITLE"), 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -705, _1080p * 319, _1080p * 284, _1080p * 389)
	var_4_0:addElement(var_4_12)

	var_4_0.MenuTitle = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "Line"

	var_4_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -855, _1080p * -705, _1080p * 385, _1080p * 386)
	var_4_0:addElement(var_4_14)

	var_4_0.Line = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "ButtonHelperBar"

	var_4_16.Background:SetAlpha(0.2, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 771, _1080p * 831)
	var_4_0:addElement(var_4_16)

	var_4_0.ButtonHelperBar = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "ButtonOK"

	var_4_18.Text:SetLeft(_1080p * 20, 0)
	var_4_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/OK")), 0)
	var_4_18.Text:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -620, _1080p * -188, _1080p * 675, _1080p * 715)
	var_4_0:addElement(var_4_18)

	var_4_0.ButtonOK = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "ButtonOKHold"

	var_4_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/OK")), 0)
	var_4_20.Text:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -620, _1080p * -188, _1080p * 675, _1080p * 715)
	var_4_0:addElement(var_4_20)

	var_4_0.ButtonOKHold = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 465
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_22)

	local function var_4_23()
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_23

	function var_4_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/HOLD_TO_SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_24 = LUI.UIBindButton.new()

	var_4_24.id = "selfBindButton"

	var_4_0:addElement(var_4_24)

	var_4_0.bindButton = var_4_24

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("DisturbingContent", DisturbingContent)
LockTable(_M)
