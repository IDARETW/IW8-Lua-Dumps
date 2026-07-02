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

	if var_2_1 and not arg_2_0.hiddenInCinematic and var_2_0 and not arg_2_0._forceIsVisible then
		arg_2_0:SetAlpha(0)

		arg_2_0.hiddenInCinematic = true

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(false)
		end
	elseif (not var_2_0 or not var_2_1) and arg_2_0.hiddenInCinematic or arg_2_0._forceIsVisible then
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

function LUI.UIMouseCursor.ForceCursorVisibility(arg_3_0)
	local var_3_0 = Engine.DBFFAEEFGJ().cursor

	if var_3_0 ~= nil then
		var_3_0._forceIsVisible = arg_3_0
	end
end

function LUI.UIMouseCursor.SetVisible(arg_4_0)
	local var_4_0 = Engine.DBFFAEEFGJ().cursor

	if var_4_0 then
		var_4_0:SetAlpha(arg_4_0 and 1 or 0)

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(arg_4_0)
		end
	end
end

function LUI.UIMouseCursor.UpdateMouseCursor(arg_5_0, arg_5_1)
	local var_5_0 = MouseCursorType.CURSOR_TYPE_ARROW_NORMAL

	if arg_5_0 and arg_5_0:isElementVisible() then
		local var_5_1 = LUI.MouseCursorContextualMenuLayer.GetLayer()

		if var_5_1 and var_5_1:AnyValidContextualDataConditions(arg_5_0, arg_5_1, nil) then
			var_5_0 = MouseCursorType.CURSOR_TYPE_ARROW_CONTEXTUAL
		elseif arg_5_0._mouseCursorTypeOverride then
			var_5_0 = arg_5_0._mouseCursorTypeOverride
		elseif arg_5_0.handleMouseButton then
			var_5_0 = MouseCursorType.CURSOR_TYPE_ARROW_ACTIVE
		end
	end

	local var_5_2 = Engine.DBFFAEEFGJ().cursor

	if var_5_2 then
		var_5_2._controllerIndex = arg_5_1

		var_5_2:SetMouseCursorController(arg_5_1)

		if var_5_2._currentCursorType ~= var_5_0 then
			var_5_2._currentCursorType = var_5_0

			if Engine.ECADDGAFF() then
				Engine.DCEDEGBFEJ(var_5_0.id)
			else
				local var_5_3 = RegisterMaterial(var_5_0.material or MouseCursorType.CURSOR_TYPE_ARROW_NORMAL.material)

				assert(var_5_3, "Cursor material " .. tostring(var_5_0.material) .. " invalid or not loaded")
				var_5_2:setImage(var_5_3)
			end
		end
	end
end

function LUI.UIMouseCursor.init(arg_6_0, arg_6_1)
	LUI.UIMouseCursor.super.init(arg_6_0)

	arg_6_0.id = "UIMouseCursor"

	arg_6_0:SetupMouseCursor()
	arg_6_0:SetAnchorsAndPosition(0, 1, 0, 1, -32, 32, -32, 32)
	arg_6_0:setImage(RegisterMaterial("ui_cursor_arrow_normal"))
	arg_6_0:setPriority(LUI.UIMouseCursor.priority)

	arg_6_0.lastMoveTime = Engine.BFBIDEGDFB()
	arg_6_0.showCursor = 0
	arg_6_0.hiddenInCinematic = false

	arg_6_0:SetAlpha(0)
	arg_6_0:registerEventHandler("mousemove", var_0_0)
	arg_6_0:registerEventHandler("mousedown", var_0_0)

	if not Dvar.IBEGCHEFE("NOMOKSKQRM") then
		local var_6_0 = LUI.UITimer.new({
			interval = 1000,
			broadcastToRoot = false,
			disposable = false,
			event = {
				name = "update_mouse"
			},
			eventTarget = arg_6_0
		})

		var_6_0.id = "updateTimer"

		arg_6_0:addElement(var_6_0)
		arg_6_0:registerEventHandler("update_mouse", var_0_1)
	end

	arg_6_0:registerEventHandler("update_input_type", function(arg_7_0, arg_7_1)
		if LUI.IsLastInputGamepad(arg_7_1.controllerIndex) and arg_7_0.showCursor == 1 then
			arg_7_0:SetAlpha(0, 400)

			arg_7_0.showCursor = 0

			if Engine.ECADDGAFF() then
				Engine.DDGIGAGHC(false)
			end
		end
	end)
end
