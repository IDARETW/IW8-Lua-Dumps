module(..., package.seeall)

local var_0_0 = 200

local function var_0_1(arg_1_0, arg_1_1)
	if not LUI.IsLastInputKeyboardMouse(arg_1_1.controller) then
		return
	end

	arg_1_0:SetVelocity(250)

	arg_1_0._paning = true
	arg_1_0._initialX = arg_1_1.x
	arg_1_0._initialY = arg_1_1.y
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0._paning = false
	arg_2_0._initialX = nil
	arg_2_0._initialY = nil
end

local function var_0_3(arg_3_0, arg_3_1)
	if arg_3_0._paning then
		if LUI.UIElement.IsMouseHidden(arg_3_1) then
			var_0_2(arg_3_0, arg_3_1)

			return
		end

		local var_3_0, var_3_1 = arg_3_1.root:PixelsToUnits(arg_3_1.x, arg_3_1.y)
		local var_3_2, var_3_3 = arg_3_1.root:PixelsToUnits(arg_3_0._initialX, arg_3_0._initialY)
		local var_3_4 = var_3_0 - var_3_2
		local var_3_5 = var_3_1 - var_3_3
		local var_3_6 = var_3_4 / var_0_0
		local var_3_7 = var_3_5 / var_0_0
		local var_3_8 = LUI.clamp(var_3_6, -1, 1)
		local var_3_9 = LUI.clamp(var_3_7, -1, 1)

		if var_3_8 ~= 0 and math.abs(var_3_9 / var_3_8) < 1 then
			var_3_9 = 0
		end

		arg_3_0:SetPanMouse(var_3_8, -var_3_9)

		arg_3_0._initialX = arg_3_1.x
		arg_3_0._initialY = arg_3_1.y
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	if not LUI.IsLastInputKeyboardMouse(arg_4_1.controller) then
		return
	end

	if not arg_4_1.insideWindow then
		return
	end

	arg_4_0:applyElementTransform()

	local var_4_0, var_4_1 = ProjectRootCoordinate(arg_4_1.rootName, arg_4_1.x, arg_4_1.y)

	var_0_3(arg_4_0, {
		controller = arg_4_1.controller,
		root = arg_4_1.root,
		x = var_4_0,
		y = var_4_1
	})
	arg_4_0:undoElementTransform()
end

function FrontendCameraMover(arg_5_0, arg_5_1)
	arg_5_1 = arg_5_1 or {}

	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "FrontendCameraMover"

	var_5_0:SetupFrontendCameraMover(arg_5_1)

	function var_5_0.closeTree(arg_6_0)
		arg_6_0:ResetCamera()
		LUI.UIElement.closeTree(arg_6_0)
	end

	if arg_5_1.enableWheelZoom then
		var_5_0:SetHandleMouse(true)
		var_5_0:addEventHandler("gamepad_button", function(arg_7_0, arg_7_1)
			if arg_7_1.qualifier == "mousewheel" then
				local var_7_0 = 0

				if arg_7_1.button == "up" then
					var_7_0 = 1
				elseif arg_7_1.button == "down" then
					var_7_0 = -1
				end

				arg_7_0:SetZoomWheel(var_7_0)
			end
		end)
	end

	if arg_5_1.useMousePan then
		var_5_0:SetHandleMouse(true)
		var_5_0:addEventHandler("mousemove", var_0_4)
		var_5_0:addEventHandler("leftmousedown", var_0_1)
		var_5_0:addEventHandler("leftmouseup", var_0_2)
		var_5_0:addEventHandler("mouse_capture_lost", var_0_2)
	end

	var_5_0.controllerIndex = arg_5_1.controllerIndex

	return var_5_0
end

MenuBuilder.registerType("FrontendCameraMover", FrontendCameraMover)
LockTable(_M)
