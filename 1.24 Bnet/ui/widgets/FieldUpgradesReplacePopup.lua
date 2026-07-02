module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		image = RegisterMaterial(SUPER.GetImage(arg_1_0)),
		name = Engine.CBBHFCGDIC(SUPER.GetName(arg_1_0)),
		desc = Engine.CBBHFCGDIC(SUPER.GetDesc(arg_1_0)),
		rechargeSpeed = SUPER.GetRechargeLabel(arg_1_0),
		rechargeColor = SUPER.GetRechargeColor(arg_1_0)
	}

	if arg_1_1 then
		var_1_0.slot = arg_1_1
		var_1_0.slotName = Engine.CBBHFCGDIC(arg_1_1 == SUPER.Slot.LEFT and "LUA_MENU/LEFT" or "LUA_MENU/RIGHT")
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.refLeft)
	assert(arg_2_2.refRight)
	assert(arg_2_2.refSelection)
	assert(arg_2_2.replaceSlot)
	arg_2_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_REPLACE_MESSAGE", SUPER.GetName(arg_2_2.refSelection)))
	arg_2_0.SubMessage:setText(Engine.CBBHFCGDIC("LUA_MENU/STREAK_REPLACE_SUBMESSAGE"))

	local var_2_0 = var_0_0(arg_2_2.refSelection)

	arg_2_0.ChosenUpgrade.Image:setImage(var_2_0.image)
	arg_2_0.ChosenUpgrade.Name:setText(var_2_0.name)

	local function var_2_1(arg_3_0, arg_3_1, arg_3_2)
		arg_3_0.slot = arg_3_2

		local var_3_0 = var_0_0(arg_3_1, arg_3_2)

		arg_3_0.Image:setImage(var_3_0.image)
		arg_3_0.Name:setText(var_3_0.name)
		arg_3_0.Cost:setText(var_3_0.slotName)
		arg_3_0:Setup(var_3_0)
	end

	var_2_1(arg_2_0.LeftUpgrade, arg_2_2.refLeft, SUPER.Slot.LEFT)
	var_2_1(arg_2_0.RightUpgrade, arg_2_2.refRight, SUPER.Slot.RIGHT)

	arg_2_0.LeftUpgrade.navigation = {}
	arg_2_0.LeftUpgrade.navigation.right = arg_2_0.RightUpgrade
	arg_2_0.RightUpgrade.navigation = {}
	arg_2_0.RightUpgrade.navigation.left = arg_2_0.LeftUpgrade

	arg_2_0.ChosenPreview.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_SWAP_EQUIP"))
	arg_2_0.ChosenPreview.Name:setText(var_2_0.name)
	arg_2_0.ChosenPreview.Kills:setText(var_2_0.rechargeSpeed)
	arg_2_0.ChosenPreview.Kills:SetRGBFromTable(var_2_0.rechargeColor)
	arg_2_0.ChosenPreview.Desc:setText(var_2_0.desc)
	arg_2_0.SwapPreview.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_SWAP_REPLACE"))
	ACTIONS.AnimateSequence(arg_2_0.ChosenUpgrade, "Swap")

	local function var_2_2(arg_4_0, arg_4_1)
		arg_2_2.replaceSlot(arg_4_0.slot)
		ACTIONS.LeaveMenu(arg_2_0)
	end

	arg_2_0.LeftUpgrade.MenuButtonAction = var_2_2
	arg_2_0.RightUpgrade.MenuButtonAction = var_2_2

	local var_2_3 = LAYOUT.GetElementWidth(arg_2_0.ChosenUpgrade)

	arg_2_0:registerEventHandler("preview_streak", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.streakData
		local var_5_1 = var_5_0.slot == SUPER.Slot.LEFT and 810 * _1080p or 1010 * _1080p
		local var_5_2 = var_5_1 + var_2_3

		if CONDITIONS.IsSplitscreen(arg_2_0) and CONDITIONS.InGame(arg_2_0) then
			arg_2_0.ChosenUpgrade:SetAlpha(0)
			ACTIONS.AnimateSequence(arg_2_0, "Splitscreen")
		else
			arg_2_0.ChosenUpgrade:SetTop(_1080p * 516)
			arg_2_0.ChosenUpgrade:SetBottom(_1080p * 616)
		end

		arg_2_0.ChosenUpgrade:SetLeft(var_5_1)
		arg_2_0.ChosenUpgrade:SetRight(var_5_2)
		arg_2_0.SwapPreview.Name:setText(var_5_0.name)
		arg_2_0.SwapPreview.Kills:setText(var_5_0.rechargeSpeed)
		arg_2_0.SwapPreview.Kills:SetRGBFromTable(var_5_0.rechargeColor)
		arg_2_0.SwapPreview.Desc:setText(var_5_0.desc)
	end)

	arg_2_0.BindButton = LUI.UIBindButton.new()
	arg_2_0.BindButton.id = "BindButton"

	arg_2_0:addElement(arg_2_0.BindButton)
	arg_2_0.BindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		ACTIONS.LeaveMenu(arg_2_0)
	end)
	arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 0,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_2_0.Prompts
	})
	arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT"),
		container = arg_2_0.Prompts
	})
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
end

function FieldUpgradesReplacePopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0.id = "FieldUpgradesReplacePopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Darkener"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0.8, 0)
	var_7_4:SetScale(1, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_7_0:addElement(var_7_4)

	var_7_0.Darkener = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 147, _1080p * 933)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "Title"

	var_7_8:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_7_8:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_REPLACE_TITLE"), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -539, _1080p * 539, _1080p * 163, _1080p * 223)
	var_7_0:addElement(var_7_8)

	var_7_0.Title = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIText.new()

	var_7_10.id = "SubMessage"

	var_7_10:SetAlpha(0, 0)
	var_7_10:setText("LUA_MENU/FIELD_UPGRADE_REPLACE_SUBMESSAGE", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -640, _1080p * 640, _1080p * -30, _1080p * -10)
	var_7_0:addElement(var_7_10)

	var_7_0.SubMessage = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIText.new()

	var_7_12.id = "Message"

	var_7_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_7_12:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADE_REPLACE_MESSAGE"), 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_12:SetAlignment(LUI.Alignment.Center)
	var_7_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 237, _1080p * 257)
	var_7_0:addElement(var_7_12)

	var_7_0.Message = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_7_0) then
		var_7_14.Label:setText("ButtonPrompts", 0)
	end

	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -855, _1080p * -755, _1080p * 964, _1080p * 995)
	var_7_0:addElement(var_7_14)

	var_7_0.Prompts = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("SwapStreakPreview", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "ChosenPreview"

	var_7_16.Label:setText("", 0)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -460, _1080p * -60, _1080p * 661, _1080p * 901)
	var_7_0:addElement(var_7_16)

	var_7_0.ChosenPreview = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("SwapStreakPreview", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "SwapPreview"

	var_7_18.Label:setText("", 0)
	var_7_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 60, _1080p * 460, _1080p * 661, _1080p * 901)
	var_7_0:addElement(var_7_18)

	var_7_0.SwapPreview = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("SwapStreakButton", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "ChosenUpgrade"

	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 810, _1080p * 910, _1080p * 516, _1080p * 616)
	var_7_0:addElement(var_7_20)

	var_7_0.ChosenUpgrade = var_7_20

	local var_7_21
	local var_7_22 = MenuBuilder.BuildRegisteredType("SwapStreakButton", {
		controllerIndex = var_7_1
	})

	var_7_22.id = "LeftUpgrade"

	var_7_22:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 810, _1080p * -1010, _1080p * 301, _1080p * 401)
	var_7_0:addElement(var_7_22)

	var_7_0.LeftUpgrade = var_7_22

	local var_7_23
	local var_7_24 = MenuBuilder.BuildRegisteredType("SwapStreakButton", {
		controllerIndex = var_7_1
	})

	var_7_24.id = "RightUpgrade"

	var_7_24:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1010, _1080p * -810, _1080p * 301, _1080p * 401)
	var_7_0:addElement(var_7_24)

	var_7_0.RightUpgrade = var_7_24

	local function var_7_25()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_25

	local var_7_26
	local var_7_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		}
	}

	var_7_10:RegisterAnimationSequence("Gamepad", var_7_27)

	local function var_7_28()
		var_7_10:AnimateSequence("Gamepad")
	end

	var_7_0._sequences.Gamepad = var_7_28

	local var_7_29
	local var_7_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -211
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -163
		}
	}

	var_7_8:RegisterAnimationSequence("KBM", var_7_30)

	local var_7_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("KBM", var_7_31)

	local var_7_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -163
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -133
		}
	}

	var_7_12:RegisterAnimationSequence("KBM", var_7_32)

	local function var_7_33()
		var_7_8:AnimateSequence("KBM")
		var_7_10:AnimateSequence("KBM")
		var_7_12:AnimateSequence("KBM")
	end

	var_7_0._sequences.KBM = var_7_33

	local var_7_34
	local var_7_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 566
		}
	}

	var_7_6:RegisterAnimationSequence("Splitscreen", var_7_35)

	local function var_7_36()
		var_7_6:AnimateSequence("Splitscreen")
	end

	var_7_0._sequences.Splitscreen = var_7_36

	var_7_22:addEventHandler("menu_create", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or var_7_1

		ACTIONS.GainFocus(var_7_0, "LeftUpgrade", var_12_0)
	end)
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
	})
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_7_37 = LUI.UIBindButton.new()

	var_7_37.id = "selfBindButton"

	var_7_0:addElement(var_7_37)

	var_7_0.bindButton = var_7_37

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("FieldUpgradesReplacePopup", FieldUpgradesReplacePopup)
LockTable(_M)
