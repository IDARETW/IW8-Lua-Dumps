module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if LUI.FlowManager.IsInStack("pre_game") then
		DisableMousePointer.pre_game = false

		Engine.DBFFAEEFGJ():TryAddMouseCursor()
	end

	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local var_1_1 = LUI.UIElement.new()

	var_1_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_1:SetHandleMouse(true)
	ACTIONS.ScaleFullscreen(var_1_1)
	var_1_0:addElement(var_1_1)
	var_1_1:registerEventHandler("mousedown", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:getParent()

		if var_2_0 and not CONDITIONS.IsMenuInStack("SPPauseMenu") then
			var_2_0.element:processEvent({
				down = true,
				name = "gamepad_button",
				button = "primary"
			})
		end
	end)
	var_1_1:registerEventHandler("mouseup", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:getParent()

		if var_3_0 then
			var_3_0.element:processEvent({
				down = false,
				name = "gamepad_button",
				button = "primary"
			})
		end
	end)

	local var_1_2 = 32
	local var_1_3 = LUI.UIElement.new()

	var_1_3:SetAnchorsAndPosition(0, 0, 1, 0, 100, -100, -100 - var_1_2, -100)

	var_1_3.id = "BinkSkipPrompt"
	var_1_0.element = var_1_3

	var_1_0:addElement(var_1_3)
	var_1_3:registerEventHandler("gamepad_button", function(arg_4_0, arg_4_1)
		if not ({
			start = true,
			space = true,
			alt1 = true,
			secondary = true,
			primary = true
		})[arg_4_1.button] then
			return
		end

		local function var_4_0()
			arg_4_0.text:SetAlpha(0, 150)
			arg_4_0.bar:SetProgress(0, 150, LUI.EASING.inQuadratic)

			arg_4_0.fillTween = nil
		end

		local function var_4_1()
			if arg_4_1.qualifier == ButtonQualifiers.Gamepad and arg_4_1.button == "start" then
				return true
			elseif arg_4_1.qualifier == ButtonQualifiers.Keyboard and arg_4_1.button == "secondary" then
				return true
			end

			return false
		end

		if Engine.CAADCDEEIA() and not Engine.DDJFBBJAIG() and var_4_1() and arg_4_1.down then
			if Engine.CFIECCHFCA(PauseReason.KEY_INPUT) then
				var_4_0()
				LUI.FlowManager.RequestAddMenu("SPPauseMenu", true, arg_4_1.controller, false)
				Engine.BEHFHDEBDG()
			end

			return
		elseif arg_4_1.down and arg_4_1.qualifier == ButtonQualifiers.Keyboard and arg_4_1.button == "secondary" and arg_1_1.onSkipInput then
			arg_1_1.onSkipInput()
		end

		if arg_4_1.down and arg_1_1.skipImmediate and arg_1_1.onSkipInput then
			arg_1_1.onSkipInput()
		end

		if arg_4_0.fillComplete then
			return
		end

		assert(arg_4_0.bar)

		if not arg_4_1.down then
			var_4_0()

			return
		end

		assert(arg_4_1.down)

		if not arg_4_0.fillTween then
			arg_4_0.bar:SetProgress(0)
			arg_4_0.text:SetAlpha(1, 150)

			arg_4_0.fillTween = arg_4_0.bar:SetProgress(1, 1500, LUI.EASING.inOutQuadratic)

			local var_4_2 = arg_4_0.fillTween

			function arg_4_0.fillTween.onComplete()
				if arg_4_0.fillTween ~= var_4_2 then
					return
				end

				arg_4_0.fillComplete = true

				arg_4_0.bar:SetScale(0.5, 400, LUI.EASING.inBack)
				arg_4_0.bar:SetAlpha(0, 350, LUI.EASING.inCubic)
				arg_4_0.text:SetAlpha(0, 350, LUI.EASING.inCubic)

				if arg_1_1.onSkipInput then
					arg_1_1.onSkipInput()
				end
			end
		end
	end)

	local var_1_4 = 32 * _1080p
	local var_1_5 = Engine.CBBHFCGDIC("MENU/SKIP_MOVIE")

	var_1_3.text = LUI.UIText.new()
	var_1_3.text.id = "skipBinkText"

	var_1_3.text:SetAnchorsAndPosition(0.5, 0, 0.5, 0.5, -500, 0, -var_1_4 / 2, var_1_4 / 2)
	var_1_3.text:SetAlignment(LUI.Alignment.Right)
	var_1_3.text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_3.text:setText(var_1_5)
	var_1_3.text:SetAlpha(0)
	var_1_3:addElement(var_1_3.text)
	var_1_3.text:setTextStyle(CoD.TextStyle.Shadowed)

	local var_1_6, var_1_7, var_1_8, var_1_9 = GetTextDimensions(var_1_5, var_1_3.text:GetCurrentFont(), var_1_4)
	local var_1_10 = var_1_8 - var_1_6

	var_1_3.bar = LUI.UIRadialProgressBar.new({
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment"
	})

	var_1_3.bar:SetAnchorsAndPosition(1, 0, 0, 1, -var_1_10 - 10 - var_1_2, -var_1_10 - 10, 0, var_1_2)
	var_1_3:addElement(var_1_3.bar)

	return var_1_0
end

MenuBuilder.registerType("BinkSkipPrompt", var_0_0)
LockTable(_M)
