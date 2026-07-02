module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.title)
	assert(arg_1_2.buttons)

	if arg_1_2.title ~= nil then
		arg_1_0.Title:setText(ToUpperCase(arg_1_2.title))
	end

	if arg_1_2.superHeaderText ~= nil then
		arg_1_0.SuperHeader:setText(ToUpperCase(arg_1_2.superHeaderText))
	end

	if arg_1_2.superDescText ~= nil then
		arg_1_0.SuperDesc:setText(ToUpperCase(arg_1_2.superDescText))
	end

	local var_1_0 = arg_1_2.buttons[1]

	if var_1_0 ~= nil then
		arg_1_0.PrimaryActionButton:SetText(var_1_0.label)
		arg_1_0.PrimaryActionButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
			var_1_0.action(arg_2_0, arg_2_1.controller)
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
		end)
	end

	local var_1_1 = arg_1_2.buttons[2]

	if var_1_1 ~= nil then
		arg_1_0.SecondaryActionButton:SetText(var_1_1.label)
		arg_1_0.SecondaryActionButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			var_1_1.action(arg_3_0, arg_3_1.controller)
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
		end)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)

	if arg_1_2.anim ~= nil then
		ACTIONS.AnimateSequence(arg_1_0, arg_1_2.anim)
	end
end

function MaintenancePopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0.id = "MaintenancePopup"
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
	var_4_4:SetAlpha(0.97, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6.PopupBackground:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_6.PopupBackground:SetAlpha(1, 0)
	var_4_6.CornerTopLeft:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_6.CornerTopRight:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_6.CornerBotLeft:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_6.CornerBotRight:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_6.TopBorder:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_6.BotBorder:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_6.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_6.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	end

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 356, _1080p * -356)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
	var_4_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/WZONE_UNDER_MAINTENANCE_EXTRA_MESSAGE")), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_8:SetStartupDelay(1000)
	var_4_8:SetLineHoldTime(400)
	var_4_8:SetAnimMoveTime(1500)
	var_4_8:SetAnimMoveSpeed(1500)
	var_4_8:SetEndDelay(1000)
	var_4_8:SetCrossfadeTime(400)
	var_4_8:SetFadeInTime(300)
	var_4_8:SetFadeOutTime(300)
	var_4_8:SetMaxVisibleLines(1)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -808, _1080p * 805, _1080p * -112, _1080p * -62)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "ButtonHelperBar"

	var_4_10.Background:SetAlpha(0, 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 184, _1080p * 244)
	var_4_0:addElement(var_4_10)

	var_4_0.ButtonHelperBar = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "SuperDesc"

	var_4_12:SetRGBFromTable(SWATCHES.CH2.NeutralGray, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/INSTALL_REQUIRED_WZ")), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetWordWrap(false)
	var_4_12:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_12:SetStartupDelay(1000)
	var_4_12:SetLineHoldTime(400)
	var_4_12:SetAnimMoveTime(1500)
	var_4_12:SetAnimMoveSpeed(1500)
	var_4_12:SetEndDelay(1000)
	var_4_12:SetCrossfadeTime(400)
	var_4_12:SetFadeInTime(300)
	var_4_12:SetFadeOutTime(300)
	var_4_12:SetMaxVisibleLines(1)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -808, _1080p * 805, _1080p * -93, _1080p * -63)
	var_4_0:addElement(var_4_12)

	var_4_0.SuperDesc = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "SuperHeader"

	var_4_14:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/INSTALL_WARZONE_CALDERA")), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_14:SetWordWrap(false)
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_14:SetStartupDelay(1000)
	var_4_14:SetLineHoldTime(400)
	var_4_14:SetAnimMoveTime(1500)
	var_4_14:SetAnimMoveSpeed(1500)
	var_4_14:SetEndDelay(1000)
	var_4_14:SetCrossfadeTime(400)
	var_4_14:SetFadeInTime(300)
	var_4_14:SetFadeOutTime(300)
	var_4_14:SetMaxVisibleLines(1)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -808, _1080p * 805, _1080p * -140, _1080p * -104)
	var_4_0:addElement(var_4_14)

	var_4_0.SuperHeader = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("MaintenanceButton", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "PrimaryActionButton"

	var_4_16:SetScale(0.35, 0)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 38, _1080p * 76)
	var_4_0:addElement(var_4_16)

	var_4_0.PrimaryActionButton = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("MaintenanceButton", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "SecondaryActionButton"

	var_4_18:SetScale(-0.2, 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 637, _1080p * 675)
	var_4_0:addElement(var_4_18)

	var_4_0.SecondaryActionButton = var_4_18

	local function var_4_19()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_4_8:RegisterAnimationSequence("ThreeTitles", var_4_21)

	local var_4_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ThreeTitles", var_4_22)

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ThreeTitles", var_4_23)

	local function var_4_24()
		var_4_8:AnimateSequence("ThreeTitles")
		var_4_12:AnimateSequence("ThreeTitles")
		var_4_14:AnimateSequence("ThreeTitles")
	end

	var_4_0._sequences.ThreeTitles = var_4_24

	function var_4_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_25 = LUI.UIBindButton.new()

	var_4_25.id = "selfBindButton"

	var_4_0:addElement(var_4_25)

	var_4_0.bindButton = var_4_25

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MaintenancePopup", MaintenancePopup)
LockTable(_M)
