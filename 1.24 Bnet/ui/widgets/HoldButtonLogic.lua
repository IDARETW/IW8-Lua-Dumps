local function var_0_0(arg_1_0)
	arg_1_0._options.fill:SetProgress(0, arg_1_0._options.emptyDuration, LUI.EASING.inQuadratic)
	arg_1_0._options.fill:SetAlpha(1, 350, LUI.EASING.inCubic)

	arg_1_0.fillTween = nil
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._options = arg_2_2

	arg_2_0:registerEventHandler("mousedown", function(arg_3_0, arg_3_1)
		arg_3_0:processEvent({
			isMouse = true,
			name = "gamepad_button",
			button = "primary",
			down = true
		})
	end)
	arg_2_0:registerEventHandler("mouseup", function(arg_4_0, arg_4_1)
		arg_4_0:processEvent({
			isMouse = true,
			name = "gamepad_button",
			button = "primary",
			down = false
		})
	end)

	if arg_2_0._options.requireFocus then
		arg_2_0:addEventHandler("lose_focus", function(arg_5_0, arg_5_1)
			arg_5_0:ReleaseButton()
		end)
	end

	arg_2_0:addEventHandler("gamepad_button", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_2_0._options

		if not var_6_0.buttons[arg_6_1.button] then
			return
		end

		if var_6_0.requireFocus and not arg_6_0:isInFocus() then
			return
		end

		if not arg_6_1.down then
			arg_6_0:ReleaseButton()

			return
		end

		if arg_6_0:IsDisabled() then
			return
		end

		if var_6_0.clickKeyboardAndMouse and (arg_6_1.qualifier == ButtonQualifiers.Keyboard or arg_6_1.isMouse) then
			var_6_0:onFill()
		end

		if not arg_6_0.fillTween then
			var_6_0.fill:SetProgress(0, 0)

			arg_6_0.fillTween = var_6_0.fill:SetProgress(1, var_6_0.duration, LUI.EASING.inOutQuadratic)

			local var_6_1 = arg_6_0.fillTween

			function arg_6_0.fillTween.onComplete()
				if arg_6_0.fillTween ~= var_6_1 then
					return
				end

				var_6_0.fill:SetAlpha(0, 350, LUI.EASING.inCubic)
				var_6_0:onFill()
			end
		end
	end)
end

local function var_0_2(arg_8_0, arg_8_1)
	assert(arg_8_0._options)
	assert(arg_8_0._options.duration)

	arg_8_0._options.duration = arg_8_1
end

function LUI.AddUIHoldButtonLogic(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_2.fill)
	assert(arg_9_2.fill.SetProgress)
	assert(arg_9_2.onFill)
	assert(arg_9_2.duration)

	arg_9_2.buttons = arg_9_2.buttons or {
		primary = true
	}
	arg_9_2.emptyDuration = arg_9_2.emptyDuration or 150

	if arg_9_2.requireFocus == nil then
		arg_9_2.requireFocus = true
	end

	arg_9_2.clickKeyboardAndMouse = arg_9_2.clickKeyboardAndMouse or false

	var_0_1(arg_9_0, arg_9_1, arg_9_2)

	arg_9_0.UpdateDuration = var_0_2
	arg_9_0.ReleaseButton = var_0_0
end
