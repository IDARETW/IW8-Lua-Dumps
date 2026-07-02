PROMPT = PROMPT or {}
PROMPT.MIN_WIDGET_SIZE = 40 * _1080p
PROMPT.OFFSET_PADDING = 5 * _1080p

function PROMPT.AddKBMResizeLogic(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.kbmPromptWidget)
	assert(arg_1_2.prompt)
	assert(arg_1_2.label)

	arg_1_0._offsetLeft = arg_1_2.offsetLeft
	arg_1_0.options = arg_1_2

	function arg_1_0.AdjustLabelToPromptSize(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:GetCurrentAnchorsAndPositions()
		local var_2_1 = arg_2_1:GetCurrentAnchorsAndPositions()

		arg_2_1:SetAnchorsAndPosition(var_2_1.leftAnchor, var_2_1.rightAnchor, var_2_1.topAnchor, var_2_1.bottomAnchor, var_2_0.right + PROMPT.OFFSET_PADDING, var_2_1.right, var_2_1.top, var_2_1.bottom, 0)
	end

	function arg_1_0.GetScaledWidth(arg_3_0, arg_3_1)
		return arg_3_1 + arg_3_1 * arg_3_0:GetScale()
	end

	function arg_1_0.GetMinimumWidth(arg_4_0)
		return arg_4_0:GetScaledWidth(PROMPT.MIN_WIDGET_SIZE)
	end

	function arg_1_0.ResizeToWidthKBM(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_5_0:GetScaledWidth(arg_5_2)
		local var_5_1 = arg_5_0.options.label:GetCurrentAnchorsAndPositions()
		local var_5_2 = LAYOUT.GetTextWidth(arg_5_0.options.label)
		local var_5_3 = var_5_1.right - var_5_2 - PROMPT.OFFSET_PADDING

		arg_5_0:SetAnchorsAndPosition(arg_5_1.leftAnchor, arg_5_1.rightAnchor, arg_5_1.topAnchor, arg_5_1.bottomAnchor, arg_5_0._offsetLeft and var_5_3 - var_5_0 or arg_5_1.left, arg_5_0._offsetLeft and var_5_3 or arg_5_1.left + var_5_0, arg_5_1.top, arg_5_1.bottom, 0)

		if not arg_5_0._offsetLeft then
			arg_5_0.AdjustLabelToPromptSize(arg_5_0.options.prompt, arg_5_0.options.label)
		end
	end

	function arg_1_0.ResizeForGamepad(arg_6_0, arg_6_1)
		arg_6_0:SetAnchorsAndPosition(arg_6_1.leftAnchor, arg_6_1.rightAnchor, arg_6_1.topAnchor, arg_6_1.bottomAnchor, 0, arg_6_0:GetMinimumWidth(), arg_6_1.top, arg_6_1.bottom, 0)
	end

	function arg_1_0.ResizeToWidth(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_7_0:GetCurrentAnchorsAndPositions()

		if Engine.BGGJFFFAFG(arg_7_1) then
			arg_7_0:ResizeForGamepad(var_7_0)
		else
			arg_7_2 = math.max(arg_7_2, arg_7_0:GetMinimumWidth())

			arg_7_0:ResizeToWidthKBM(var_7_0, arg_7_2)
		end
	end

	arg_1_0.options.kbmPromptWidget._notifyOnResize = true

	local var_1_0 = arg_1_0.options.kbmPromptWidget:GetCurrentAnchorsAndPositions()
	local var_1_1 = math.abs(var_1_0.right - var_1_0.left)

	arg_1_0:registerAndCallEventHandler("resized_kbm_prompt", function(arg_8_0, arg_8_1)
		arg_8_0:ResizeToWidth(arg_8_1.controllerIndex, arg_8_1.width)
	end, {
		controllerIndex = arg_1_1,
		width = var_1_1
	})
end
