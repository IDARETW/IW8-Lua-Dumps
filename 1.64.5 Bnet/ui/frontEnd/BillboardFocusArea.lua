module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ArrowRight:registerEventHandler("leftmouseup", function(arg_2_0, arg_2_1)
		if arg_2_1.inside then
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			arg_1_1(arg_2_0, arg_2_1)

			return true
		end
	end)
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.ArrowLeft:registerEventHandler("leftmouseup", function(arg_4_0, arg_4_1)
		if arg_4_1.inside then
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			arg_3_1(arg_4_0, arg_4_1)

			return true
		end
	end)
end

local function var_0_2(arg_5_0, arg_5_1)
	arg_5_0.Background:registerEventHandler("leftmouseup", function(arg_6_0, arg_6_1)
		if arg_6_1.inside then
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			arg_5_1(arg_6_0, arg_6_1)

			return true
		end
	end)
end

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0:registerEventHandler("gamepad_button", arg_7_1)
end

local function var_0_4(arg_8_0, arg_8_1)
	if not arg_8_0.Background._categoryData or #arg_8_0.Background._categoryData.items == 1 then
		arg_8_1 = false
	end

	arg_8_0.ArrowLeft:SetAlpha(arg_8_1 and 1 or 0)
	arg_8_0.ArrowLeft:SetHandleMouse(arg_8_1)
	arg_8_0.ArrowLeft:SetFocusable(arg_8_1)
	arg_8_0.ArrowRight:SetAlpha(arg_8_1 and 1 or 0)
	arg_8_0.ArrowRight:SetHandleMouse(arg_8_1)
	arg_8_0.ArrowRight:SetFocusable(arg_8_1)
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.Background._element = arg_9_1
	arg_9_0.Background._categoryData = arg_9_2
end

local function var_0_6(arg_10_0, arg_10_1)
	arg_10_0:SetAlpha(arg_10_1 and 1 or 0)
	arg_10_0:SetFocusable(arg_10_1)
	arg_10_0:SetHandleMouse(arg_10_1)
	arg_10_0:SetArrowsState(arg_10_1)
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetRightNavigationHandler = var_0_0
	arg_11_0.SetLeftNavigationHandler = var_0_1
	arg_11_0.SetBackgroundLeftMouseHandler = var_0_2
	arg_11_0.SetGamepadButtonHandler = var_0_3
	arg_11_0.SetArrowsState = var_0_4
	arg_11_0.SetCurrentCategoryData = var_0_5
	arg_11_0.SetState = var_0_6

	arg_11_0.Background:SetHandleMouse(true)

	local function var_11_0(arg_12_0, arg_12_1)
		local var_12_0 = LUI.IsLastInputKeyboardMouse(arg_12_1.controllerIndex)

		arg_12_0:SetState(var_12_0)
	end

	arg_11_0:registerAndCallEventHandler("update_input_type", var_11_0, {
		controllerIndex = arg_11_1
	})
end

function BillboardFocusArea(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 580 * _1080p)

	var_13_0.id = "BillboardFocusArea"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0

	var_13_0:setUseStencil(true)

	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:SetAlpha(0, 0)
	var_13_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 960, _1080p * -960, _1080p * -290, _1080p * 290)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("BillboardArrow", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "ArrowLeft"

	var_13_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 110, _1080p * -290, _1080p * 290)
	var_13_0:addElement(var_13_6)

	var_13_0.ArrowLeft = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("BillboardArrow", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "ArrowRight"

	var_13_8:SetYRotation(180, 0)
	var_13_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -110, 0, _1080p * -290, _1080p * 290)
	var_13_0:addElement(var_13_8)

	var_13_0.ArrowRight = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "HighlightTop"

	var_13_10:SetAlpha(0, 0)
	var_13_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 3)
	var_13_0:addElement(var_13_10)

	var_13_0.HighlightTop = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "HighlightBottom"

	var_13_12:SetAlpha(0, 0)
	var_13_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -3, 0)
	var_13_0:addElement(var_13_12)

	var_13_0.HighlightBottom = var_13_12

	local function var_13_13()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_13

	local var_13_14 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOver", var_13_14)

	local var_13_15 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOver", var_13_15)

	local function var_13_16()
		var_13_10:AnimateSequence("ButtonOver")
		var_13_12:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_16

	local var_13_17 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUp", var_13_17)

	local var_13_18 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUp", var_13_18)

	local function var_13_19()
		var_13_10:AnimateSequence("ButtonUp")
		var_13_12:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_19

	var_13_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonOver")
	end)
	var_13_0:addEventHandler("button_up", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "self.ArrowLeft",
			sequenceName = "ButtonUp",
			elementName = "ArrowLeft"
		})
		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "self.ArrowRight",
			sequenceName = "ButtonUp",
			elementName = "ArrowRight"
		})
	end)
	var_0_7(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("BillboardFocusArea", BillboardFocusArea)
LockTable(_M)
