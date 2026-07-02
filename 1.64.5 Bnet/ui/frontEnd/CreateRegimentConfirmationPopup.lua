module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.IsInputValid)

	if arg_1_2.regimentName and #arg_1_2.regimentName > 0 then
		arg_1_0.RegimentName:setText(Engine.CBBHFCGDIC("REGIMENTS/REGIMENT_NAME_CONFIRM", Engine.JCBDICCAH(arg_1_2.regimentName)))
	end

	arg_1_0.OKButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.IsInputValid(arg_2_0, arg_1_1, arg_1_2.regimentName) then
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_1_1, false, {
				controllerIndex = arg_1_1,
				message = Engine.CBBHFCGDIC("LUA_MENU/CREATING_REGIMENT")
			})

			if not Clans.DGAGIABGFJ(arg_1_1, arg_1_2.regimentName) then
				LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = Engine.CBBHFCGDIC("MENU/ERROR"),
					message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
				})
			end
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.CancelButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function CreateRegimentConfirmationPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0.id = "CreateRegimentConfirmationPopup"
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

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -150, _1080p * 206)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Header"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText(ToUpperCase(Engine.CBBHFCGDIC("REGIMENTS/CREATE_REGIMENT_HEADER")), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 770, _1080p * -104, _1080p * -44)
	var_4_0:addElement(var_4_8)

	var_4_0.Header = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Message"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("REGIMENTS/CREATE_REGIMENT_DESC"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 770, _1080p * -36, _1080p * -14)
	var_4_0:addElement(var_4_10)

	var_4_0.Message = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Image"

	var_4_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_12:SetAlpha(0.6, 0)
	var_4_12:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -726, _1080p * -462, _1080p * -104, _1080p * 160)
	var_4_0:addElement(var_4_12)

	var_4_0.Image = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ButtonHelperBar"

	var_4_14.Background:SetAlpha(0, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 210, _1080p * 270)
	var_4_0:addElement(var_4_14)

	var_4_0.ButtonHelperBar = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "OKButton"

	var_4_16.Text:SetLeft(_1080p * 20, 0)
	var_4_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"), 0)
	var_4_16.Text:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * 76, _1080p * 114)
	var_4_0:addElement(var_4_16)

	var_4_0.OKButton = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "CancelButton"

	var_4_18.Text:SetLeft(_1080p * 20, 0)
	var_4_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_4_18.Text:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * 123, _1080p * 161)
	var_4_0:addElement(var_4_18)

	var_4_0.CancelButton = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIText.new()

	var_4_20.id = "RegimentName"

	var_4_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_20:setText(Engine.CBBHFCGDIC("REGIMENTS/REGIMENT_NAME_CONFIRM"), 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_20:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 716, _1080p * -3, _1080p * 17)
	var_4_0:addElement(var_4_20)

	var_4_0.RegimentName = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 663
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 701
		}
	}

	var_4_16:RegisterAnimationSequence("ConfirmOnly", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ConfirmOnly", var_4_24)

	local function var_4_25()
		var_4_16:AnimateSequence("ConfirmOnly")
		var_4_18:AnimateSequence("ConfirmOnly")
	end

	var_4_0._sequences.ConfirmOnly = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_28)

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		}
	}

	var_4_20:RegisterAnimationSequence("AR", var_4_29)

	local function var_4_30()
		var_4_8:AnimateSequence("AR")
		var_4_10:AnimateSequence("AR")
		var_4_20:AnimateSequence("AR")
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

	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipSetup", var_4_33)

	local function var_4_34()
		var_4_8:AnimateSequence("WZWipSetup")
		var_4_12:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_34

	var_4_18:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)

	function var_4_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_35 = LUI.UIBindButton.new()

	var_4_35.id = "selfBindButton"

	var_4_0:addElement(var_4_35)

	var_4_0.bindButton = var_4_35

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CreateRegimentConfirmationPopup", CreateRegimentConfirmationPopup)
LockTable(_M)
