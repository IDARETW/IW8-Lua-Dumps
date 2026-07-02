module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.FullscreenButton)
	assert(arg_1_0.FullScreenPromptText)

	local function var_1_0(arg_2_0, arg_2_1)
		if LUI.IsLastInputKeyboardMouse(arg_2_1.controllerIndex) then
			arg_2_0.FullscreenButton:SetAlpha(1)
			arg_2_0.FullScreenPromptText:SetAlpha(0)
		else
			arg_2_0.FullscreenButton:SetAlpha(0)
			arg_2_0.FullScreenPromptText:SetAlpha(1)
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})
	arg_1_0.FullscreenButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		LUI.FlowManager.RequestPopupMenu(nil, "TutorialVideoMaximized", true, arg_1_1, false, {
			title = ""
		})
	end)

	arg_1_0.FullscreenButton.m_requireFocusType = FocusType.MouseOver
end

function OperatorLootIntro(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 456 * _1080p, 0, 256 * _1080p)

	var_4_0.id = "OperatorLootIntro"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Intro"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 456, 0, _1080p * 256)
	var_4_0:addElement(var_4_4)

	var_4_0.Intro = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "FullScreenPromptText"

	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/INTRO_FULLSCREEN"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 456, _1080p * 266, _1080p * 288)
	var_4_0:addElement(var_4_6)

	var_4_0.FullScreenPromptText = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("FullscreenButton", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "FullscreenButton"

	var_4_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -38, _1080p * -6, _1080p * -37, _1080p * -6)
	var_4_0:addElement(var_4_8)

	var_4_0.FullscreenButton = var_4_8

	var_4_8:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_4_1
		end

		ACTIONS.AnimateSequenceByElement(var_4_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "Focus",
			elementName = "FullscreenButton"
		})
	end)
	var_4_8:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_4_1
		end

		ACTIONS.AnimateSequenceByElement(var_4_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "UnFocus",
			elementName = "FullscreenButton"
		})
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("OperatorLootIntro", OperatorLootIntro)
LockTable(_M)
