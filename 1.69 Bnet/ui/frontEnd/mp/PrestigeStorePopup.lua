module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.title)
	assert(arg_1_2.panelData)

	arg_1_0._useKBMPrompts = true

	local var_1_0 = {
		arg_1_0.PrestigeDetailPanel1,
		arg_1_0.PrestigeDetailPanel2,
		arg_1_0.PrestigeDetailPanel3
	}

	arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.title)))
	arg_1_0.TitleFlavor:setText(Engine.CBBHFCGDIC(arg_1_2.titleFlavor))
	ACTIONS.AnimateSequence(arg_1_0, "Show" .. #arg_1_2.panelData)

	local var_1_1 = #arg_1_2.panelData < #var_1_0 and #arg_1_2.panelData or #var_1_0

	for iter_1_0 = 1, var_1_1 do
		if arg_1_2.panelData[iter_1_0] then
			var_1_0[iter_1_0]:Setup(arg_1_1, arg_1_2.panelData[iter_1_0])
		end
	end

	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.confirmButton and arg_1_2.confirmButton.action then
			arg_1_2.confirmButton.action(arg_2_0, arg_1_1)
		else
			ACTIONS.LeaveMenu(arg_2_0)
		end
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function PrestigeStorePopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "PrestigeStorePopup"
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
	var_3_4:SetAlpha(0.85, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Example"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.1, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Example = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Panel"

	var_3_8:SetAlpha(0.8, 0)
	var_3_8:setImage(RegisterMaterial("ui_mp_br_shared_popup_generic_background_ch2"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -355, _1080p * 355)
	var_3_0:addElement(var_3_8)

	var_3_0.Panel = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Title"

	var_3_10:setText(Engine.CBBHFCGDIC("PRESTIGE/STORE_POPUP_HEADING"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -554, _1080p * 438, _1080p * -298, _1080p * -258)
	var_3_0:addElement(var_3_10)

	var_3_0.Title = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Logo"

	var_3_12:SetScale(-0.1, 0)
	var_3_12:setImage(RegisterMaterial("mw_bocw_logo"), 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -811, _1080p * -555, _1080p * -336, _1080p * -208)
	var_3_0:addElement(var_3_12)

	var_3_0.Logo = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("PrestigeDetailPanel", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "PrestigeDetailPanel3"

	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 285, _1080p * 799, _1080p * -190, _1080p * 190)
	var_3_0:addElement(var_3_14)

	var_3_0.PrestigeDetailPanel3 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("PrestigeDetailPanel", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "PrestigeDetailPanel2"

	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -257, _1080p * 257, _1080p * -190, _1080p * 190)
	var_3_0:addElement(var_3_16)

	var_3_0.PrestigeDetailPanel2 = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("PrestigeDetailPanel", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "PrestigeDetailPanel1"

	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -797, _1080p * -285, _1080p * -190, _1080p * 190)
	var_3_0:addElement(var_3_18)

	var_3_0.PrestigeDetailPanel1 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "TitleFlavor"

	var_3_20:SetAlpha(0, 0)
	var_3_20:setText(Engine.CBBHFCGDIC("PRESTIGE/STORE_POPUP_FLAVOR"), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 1802, _1080p * 105, _1080p * 130)
	var_3_0:addElement(var_3_20)

	var_3_0.TitleFlavor = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "ButtonHelperBar"

	var_3_22.Background:SetAlpha(0, 0)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -960, _1080p * 960, _1080p * -60, 0)
	var_3_0:addElement(var_3_22)

	var_3_0.ButtonHelperBar = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "GenericButton"

	var_3_24.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OK"), 0)
	var_3_24.Text:SetAlignment(LUI.Alignment.Center)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 246, _1080p * 306)
	var_3_0:addElement(var_3_24)

	var_3_0.GenericButton = var_3_24

	local var_3_25
	local var_3_26 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_3_1
	})

	var_3_26.id = "ButtonPromptContainer"

	var_3_26:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse(var_3_0) then
		var_3_26.Label:setText("ButtonPrompt", 0)
	end

	var_3_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 285, _1080p * 799, _1080p * 248, _1080p * 288)
	var_3_0:addElement(var_3_26)

	var_3_0.ButtonPromptContainer = var_3_26

	local function var_3_27()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 285
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 797
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Show3", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Show3", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -797
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -285
		}
	}

	var_3_18:RegisterAnimationSequence("Show3", var_3_31)

	local function var_3_32()
		var_3_14:AnimateSequence("Show3")
		var_3_16:AnimateSequence("Show3")
		var_3_18:AnimateSequence("Show3")
	end

	var_3_0._sequences.Show3 = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Show2", var_3_34)

	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 532
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Show2", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -532
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Show2", var_3_36)

	local function var_3_37()
		var_3_14:AnimateSequence("Show2")
		var_3_16:AnimateSequence("Show2")
		var_3_18:AnimateSequence("Show2")
	end

	var_3_0._sequences.Show2 = var_3_37

	local var_3_38
	local var_3_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Show1", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Show1", var_3_40)

	local var_3_41 = {
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

	var_3_18:RegisterAnimationSequence("Show1", var_3_41)

	local var_3_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		}
	}

	var_3_24:RegisterAnimationSequence("Show1", var_3_42)

	local function var_3_43()
		var_3_14:AnimateSequence("Show1")
		var_3_16:AnimateSequence("Show1")
		var_3_18:AnimateSequence("Show1")
		var_3_24:AnimateSequence("Show1")
	end

	var_3_0._sequences.Show1 = var_3_43

	local var_3_44
	local var_3_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("ShowPromptGamepad", var_3_45)

	local function var_3_46()
		var_3_26:AnimateSequence("ShowPromptGamepad")
	end

	var_3_0._sequences.ShowPromptGamepad = var_3_46

	local var_3_47
	local var_3_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("ShowPromptKBM", var_3_48)

	local function var_3_49()
		var_3_26:AnimateSequence("ShowPromptKBM")
	end

	var_3_0._sequences.ShowPromptKBM = var_3_49

	function var_3_22.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	local var_3_50 = LUI.UIBindButton.new()

	var_3_50.id = "ButtonHelperBarBindButton"

	var_3_22:addElement(var_3_50)

	var_3_22.bindButton = var_3_50

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PrestigeStorePopup", PrestigeStorePopup)
LockTable(_M)
