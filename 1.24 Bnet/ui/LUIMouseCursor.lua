LUI.UIMouseCursor = LUI.Class(LUI.UIElement)
LUI.UIMouseCursor.priority = 1000
LUI.UIMouseCursor.mouseTimeout = 3000
LUI.UIMouseCursor.cinematicHideDelay = 2000

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.lastMoveTime = Engine.BFBIDEGDFB()

	if arg_1_0.showCursor == 0 then
		arg_1_0:SetAlpha(1)

		arg_1_0.showCursor = 1

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(true)
		end
	end

	if arg_1_0.hiddenInCinematic then
		arg_1_0:SetAlpha(arg_1_0.showCursor)

		arg_1_0.hiddenInCinematic = false

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(arg_1_0.showCursor == 1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Engine.BFBIDEGDFB() >= arg_2_0.lastMoveTime + LUI.UIMouseCursor.cinematicHideDelay
	local var_2_1 = Engine.IGAJBFHE()

	if var_2_1 and not arg_2_0.hiddenInCinematic and var_2_0 then
		arg_2_0:SetAlpha(0)

		arg_2_0.hiddenInCinematic = true

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(false)
		end
	elseif (not var_2_0 or not var_2_1) and arg_2_0.hiddenInCinematic then
		arg_2_0:SetAlpha(arg_2_0.showCursor)

		arg_2_0.hiddenInCinematic = false

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(arg_2_0.showCursor == 1)
		end
	end
end

MouseCursorType = {
	CURSOR_TYPE_ARROW_NORMAL = {
		id = 0,
		material = "ui_cursor_arrow_normal"
	},
	CURSOR_TYPE_ARROW_ACTIVE = {
		id = 1,
		material = "ui_cursor_arrow_active"
	},
	CURSOR_TYPE_ARROW_UNAVAILABLE = {
		id = 2
	},
	CURSOR_TYPE_ARROW_INACTIVE = {
		id = 3
	},
	CURSOR_TYPE_ARROW_CONTEXTUAL = {
		id = 4,
		material = "ui_cursor_arrow_contextual"
	},
	CURSOR_TYPE_ROTATION_NORMAL = {
		id = 5,
		material = "ui_cursor_arrow_rotation"
	},
	CURSOR_TYPE_ROTATION_ACTIVE = {
		id = 6
	},
	CURSOR_TYPE_ROTATION_UNAVAILABLE = {
		id = 7
	},
	CURSOR_TYPE_ARROW_PANFOURWAYS = {
		id = 8,
		material = "ui_cursor_arrow_panfourways"
	},
	CURSOR_TYPE_IBEAM = {
		id = 9,
		material = "ui_cursor_i_beam"
	},
	CURSOR_TYPE_WIN_ARROW = {
		id = 10
	},
	CURSOR_TYPE_WIN_HAND = {
		id = 11
	},
	CURSOR_TYPE_WIN_IBEAM = {
		id = 12
	}
}

function LUI.UIMouseCursor.UpdateMouseCursor(arg_3_0, arg_3_1)
	local var_3_0 = MouseCursorType.CURSOR_TYPE_ARROW_NORMAL

	if arg_3_0 then
		local var_3_1 = LUI.MouseCursorContextualMenuLayer.GetLayer()

		if var_3_1 and var_3_1:AnyValidContextualDataConditions(arg_3_0, arg_3_1, nil) then
			var_3_0 = MouseCursorType.CURSOR_TYPE_ARROW_CONTEXTUAL
		elseif arg_3_0._mouseCursorTypeOverride then
			var_3_0 = arg_3_0._mouseCursorTypeOverride
		elseif arg_3_0.handleMouseButton then
			var_3_0 = MouseCursorType.CURSOR_TYPE_ARROW_ACTIVE
		end
	end

	local var_3_2 = Engine.DBFFAEEFGJ().cursor

	if var_3_2 then
		var_3_2._controllerIndex = arg_3_1

		var_3_2:SetMouseCursorController(arg_3_1)

		if var_3_2._currentCursorType ~= var_3_0 then
			var_3_2._currentCursorType = var_3_0

			if Engine.ECADDGAFF() then
				Engine.DCEDEGBFEJ(var_3_0.id)
			else
				local var_3_3 = RegisterMaterial(var_3_0.material or MouseCursorType.CURSOR_TYPE_ARROW_NORMAL.material)

				assert(var_3_3, "Cursor material " .. tostring(var_3_0.material) .. " invalid or not loaded")
				var_3_2:setImage(var_3_3)
			end
		end
	end
end

function LUI.UIMouseCursor.init(arg_4_0, arg_4_1)
	LUI.UIMouseCursor.super.init(arg_4_0)

	arg_4_0.id = "UIMouseCursor"

	arg_4_0:SetupMouseCursor()
	arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, -32, 32, -32, 32)
	arg_4_0:setImage(RegisterMaterial("ui_cursor_arrow_normal"))
	arg_4_0:setPriority(LUI.UIMouseCursor.priority)

	arg_4_0.lastMoveTime = Engine.BFBIDEGDFB()
	arg_4_0.showCursor = 0
	arg_4_0.hiddenInCinematic = false

	arg_4_0:SetAlpha(0)
	arg_4_0:registerEventHandler("mousemove", var_0_0)
	arg_4_0:registerEventHandler("mousedown", var_0_0)

	local var_4_0 = LUI.UITimer.new({
		interval = 1000,
		broadcastToRoot = false,
		disposable = false,
		event = {
			name = "update_mouse"
		},
		eventTarget = arg_4_0
	})

	var_4_0.id = "updateTimer"

	arg_4_0:addElement(var_4_0)
	arg_4_0:registerEventHandler("update_mouse", var_0_1)
	arg_4_0:registerEventHandler("update_input_type", function(arg_5_0, arg_5_1)
		if LUI.IsLastInputGamepad(arg_5_1.controllerIndex) and arg_5_0.showCursor == 1 then
			arg_5_0:SetAlpha(0, 400)

			arg_5_0.showCursor = 0

			if Engine.ECADDGAFF() then
				Engine.DDGIGAGHC(false)
			end
		end
	end)
end
