module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.m_requireFocusType = FocusType.MouseOver
end

function FullscreenVideoButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 456 * _1080p, 0, 256 * _1080p)

	var_2_0.id = "FullscreenVideoButton"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("FullscreenButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "FullscreenButton"

	var_2_4:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -38, _1080p * -6, _1080p * -37, _1080p * -6)
	var_2_0:addElement(var_2_4)

	var_2_0.FullscreenButton = var_2_4

	var_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.AnimateSequenceByElement(var_2_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "Focus",
			elementName = "FullscreenButton"
		})
	end)
	var_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_2_1
		end

		ACTIONS.AnimateSequenceByElement(var_2_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "UnFocus",
			elementName = "FullscreenButton"
		})
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("FullscreenVideoButton", FullscreenVideoButton)
LockTable(_M)
