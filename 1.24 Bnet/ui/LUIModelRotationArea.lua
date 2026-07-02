LUI.UIModelRotationArea = LUI.Class(LUI.UIElement)
LUI.UIModelRotationArea.Types = {
	Weapon = 0,
	Character = 1
}
LUI.UIModelRotationArea.MaxScrollDistance = 200

local var_0_0 = -30
local var_0_1 = 50
local var_0_2 = -65
local var_0_3 = 65
local var_0_4 = -180
local var_0_5 = 180
local var_0_6 = 2
local var_0_7 = 6
local var_0_8 = 0.2
local var_0_9 = 100
local var_0_10 = 100
local var_0_11 = {
	Idle = 0,
	Right = 2,
	Left = 1
}

local function var_0_12(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._currentYawDirection = arg_1_1
	arg_1_0._currentRoll = arg_1_2 * (arg_1_2 > 0 and var_0_3 or -var_0_2)

	ClientWeapon.BJDAEAFFA(arg_1_0._modelIndex, arg_1_0._offsetData.pitch + 0, arg_1_0._offsetData.yaw + arg_1_0._currentYaw, arg_1_0._offsetData.roll + arg_1_0._currentRoll)
end

local function var_0_13(arg_2_0)
	if math.abs(arg_2_0._currentYawDirection) < var_0_8 then
		return
	end

	arg_2_0._currentYaw = arg_2_0._currentYaw + var_0_7 * (arg_2_0._currentYawDirection > 0 and 1 or -1)

	ClientWeapon.BJDAEAFFA(arg_2_0._modelIndex, arg_2_0._offsetData.pitch + 0, arg_2_0._offsetData.yaw + arg_2_0._currentYaw, arg_2_0._offsetData.roll + arg_2_0._currentRoll)
end

local function var_0_14(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_1 - arg_3_0._lastYaw
	local var_3_1 = arg_3_2 - arg_3_0._lastRoll

	arg_3_0._currentRoll = LUI.clamp(arg_3_0._currentRoll + var_3_1 * var_0_9, var_0_2, var_0_3)
	arg_3_0._currentYaw = arg_3_0._currentYaw + var_3_0 * var_0_10

	ClientWeapon.BJDAEAFFA(arg_3_0._modelIndex, arg_3_0._offsetData.pitch + 0, arg_3_0._offsetData.yaw + arg_3_0._currentYaw, arg_3_0._offsetData.roll - arg_3_0._currentRoll)

	arg_3_0._lastYaw = arg_3_1
	arg_3_0._lastRoll = arg_3_2
end

local function var_0_15(arg_4_0)
	arg_4_0._currentRoll = 0
end

local function var_0_16(arg_5_0, arg_5_1)
	arg_5_0._rotationInput = arg_5_1

	if arg_5_0._rotationInput < 0.25 and arg_5_0._rotationInput > -0.25 then
		arg_5_0._rotationInput = 0
	end

	local var_5_0 = arg_5_0._rotationInput > 0
	local var_5_1 = arg_5_0._rotationInput < 0
	local var_5_2 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_5_0.operatorRef, CSV.operators.cols.gender)
	local var_5_3 = CSV.ReadRow(CSV.operatorTurnAnimations, var_5_2)
	local var_5_4 = ClientCharacter.DCECEDGHEG(arg_5_0._modelIndex)

	if arg_5_0.currentState ~= var_0_11.Idle and (var_5_4 == string.lower(var_5_3.idleFront) or var_5_4 == string.lower(var_5_3.idleLeft) or var_5_4 == string.lower(var_5_3.idleRight) or var_5_4 == string.lower(var_5_3.idleBack)) then
		arg_5_0.currentState = var_0_11.Idle
		arg_5_0.lockTurnAnimUpdate = false
	end

	local var_5_5

	if arg_5_0.currentState ~= var_0_11.Right and var_5_1 then
		var_5_5 = var_0_11.Right
	elseif arg_5_0.currentState ~= var_0_11.Left and var_5_0 then
		var_5_5 = var_0_11.Left
	end

	if var_5_5 and arg_5_0.currentState ~= var_5_5 and not arg_5_0.lockTurnAnimUpdate then
		local var_5_6
		local var_5_7
		local var_5_8
		local var_5_9
		local var_5_10

		if var_5_5 == var_0_11.Left then
			var_5_6 = StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_5_2, CSV.operatorTurnAnimations.cols.leftTurnFront + arg_5_0.turnCounter)
			arg_5_0.turnCounter = arg_5_0.turnCounter + 1
		elseif var_5_5 == var_0_11.Right then
			var_5_6 = StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_5_2, CSV.operatorTurnAnimations.cols.rightTurnFront + arg_5_0.turnCounter)
			arg_5_0.turnCounter = arg_5_0.turnCounter - 1
		end

		if arg_5_0.turnCounter > 3 then
			arg_5_0.turnCounter = 0
		end

		if arg_5_0.turnCounter < 0 then
			arg_5_0.turnCounter = 3
		end

		local var_5_11, var_5_12, var_5_13 = OPERATOR.GetTransitionInfoFromAnimation(var_5_4)

		if arg_5_0.currentState == var_0_11.Idle then
			ClientCharacter.CAECDIHFCF(arg_5_0._modelIndex, var_5_6, var_5_11)
		else
			arg_5_0.lockTurnAnimUpdate = true

			ClientCharacter.DBHGHFFHFD(arg_5_0._modelIndex)
			ClientCharacter.BHJJGDDGFI(arg_5_0._modelIndex, var_5_6, var_5_13, var_5_11, var_5_12)
		end

		local var_5_14 = StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_5_2, CSV.operatorTurnAnimations.cols.idleFront + arg_5_0.turnCounter)
		local var_5_15, var_5_16 = OPERATOR.GetTransitionInfoFromAnimation(var_5_6)

		ClientCharacter.BHJJGDDGFI(arg_5_0._modelIndex, var_5_14, nil, var_5_15)

		arg_5_0.currentState = var_5_5
	end
end

local function var_0_17(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0._initialX - LUI.UIModelRotationArea.MaxScrollDistance
	local var_6_1 = arg_6_0._initialX + LUI.UIModelRotationArea.MaxScrollDistance
	local var_6_2 = arg_6_0._initialY - LUI.UIModelRotationArea.MaxScrollDistance
	local var_6_3 = arg_6_0._initialY + LUI.UIModelRotationArea.MaxScrollDistance
	local var_6_4, var_6_5 = arg_6_1.root:PixelsToUnits(arg_6_1.x, arg_6_1.y)
	local var_6_6, var_6_7 = arg_6_1.root:PixelsToUnits(var_6_0, var_6_2)
	local var_6_8, var_6_9 = arg_6_1.root:PixelsToUnits(var_6_1, var_6_3)
	local var_6_10 = (var_6_4 - var_6_6) / (var_6_8 - var_6_6)
	local var_6_11 = (var_6_5 - var_6_7) / (var_6_9 - var_6_7)

	return var_6_10, var_6_11
end

local function var_0_18(arg_7_0, arg_7_1)
	if arg_7_0._rotating then
		if arg_7_0:IsMouseHidden(arg_7_1) then
			EndMouseRotation(arg_7_0, arg_7_1)
			ResetRotation(arg_7_0)

			return
		end

		local var_7_0, var_7_1 = var_0_17(arg_7_0, arg_7_1)

		if arg_7_0._type == LUI.UIModelRotationArea.Types.Weapon then
			var_0_14(arg_7_0, var_7_0, var_7_1)
		elseif arg_7_0._type == LUI.UIModelRotationArea.Types.Character then
			local var_7_2 = true
			local var_7_3 = -1
			local var_7_4 = 1
			local var_7_5 = LUI.Lerp(var_7_3, var_7_4, var_7_0)
			local var_7_6 = LUI.Lerp(var_7_3, var_7_4, var_7_1)
			local var_7_7 = LUI.clamp(var_7_5, var_7_3, var_7_4)
			local var_7_8 = LUI.clamp(var_7_6, var_7_3, var_7_4) * -1

			if arg_7_0._lastMouseX and arg_7_0._lastMouseY then
				local var_7_9, var_7_10 = arg_7_1.root:PixelsToUnits(arg_7_0._lastMouseX, arg_7_0._lastMouseY)
				local var_7_11, var_7_12 = arg_7_1.root:PixelsToUnits(arg_7_1.x, arg_7_1.y)
				local var_7_13 = var_7_9 - var_7_11
				local var_7_14 = var_7_10 - var_7_12

				if var_7_14 ~= 0 and math.abs(var_7_13 / var_7_14) < 1 then
					var_7_2 = false
				end
			end

			if var_7_2 then
				var_0_16(arg_7_0, var_7_7)
			end
		end

		arg_7_0._lastMouseX = arg_7_1.x
		arg_7_0._lastMouseY = arg_7_1.y
	end
end

local function var_0_19(arg_8_0, arg_8_1)
	if not LUI.IsLastInputKeyboardMouse(arg_8_1.controller) then
		return
	end

	if not arg_8_1.insideWindow then
		return
	end

	arg_8_0:applyElementTransform()

	local var_8_0, var_8_1 = ProjectRootCoordinate(arg_8_1.rootName, arg_8_1.x, arg_8_1.y)

	var_0_18(arg_8_0, {
		controller = arg_8_1.controller,
		root = arg_8_1.root,
		x = var_8_0,
		y = var_8_1
	})
	arg_8_0:undoElementTransform()
end

local function var_0_20(arg_9_0, arg_9_1)
	if arg_9_1.controller ~= arg_9_0._controllerIndex or not LUI.IsLastInputGamepad(arg_9_1.controller) then
		return
	end

	local var_9_0 = arg_9_1.rightStickYaw or 0
	local var_9_1 = arg_9_1.rightStickPitch or 0

	if arg_9_0._type == LUI.UIModelRotationArea.Types.Weapon then
		var_0_12(arg_9_0, var_9_0, var_9_1)
	elseif arg_9_0._type == LUI.UIModelRotationArea.Types.Character then
		var_0_16(arg_9_0, var_9_0)
	end

	return true
end

local function var_0_21(arg_10_0, arg_10_1)
	if not LUI.IsLastInputKeyboardMouse(arg_10_1.controller) then
		return
	end

	if arg_10_0._modelIndex then
		arg_10_0._rotating = true
		arg_10_0._initialX = arg_10_1.x
		arg_10_0._initialY = arg_10_1.y

		local var_10_0, var_10_1 = var_0_17(arg_10_0, arg_10_1)

		arg_10_0._lastYaw = var_10_0
		arg_10_0._lastRoll = var_10_1

		Engine.BFAABIIGDC(true)
	end
end

local function var_0_22(arg_11_0, arg_11_1)
	arg_11_0._rotating = false
	arg_11_0._initialX = nil
	arg_11_0._initialY = nil
	arg_11_0._currentYawDirection = 0
end

local function var_0_23(arg_12_0)
	if arg_12_0._modelIndex and arg_12_0._type == LUI.UIModelRotationArea.Types.Weapon then
		ClientWeapon.BJDAEAFFA(arg_12_0._modelIndex, 0, 0, 0)
	end

	arg_12_0._currentYaw = 0
	arg_12_0._currentYawDirection = 0
	arg_12_0._currentRoll = 0
end

local function var_0_24(arg_13_0, arg_13_1)
	arg_13_0._currentYaw = arg_13_0._currentYaw + var_0_6 * arg_13_0._rotationInput
end

local function var_0_25(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.controller or Engine.IJEBHJIJF()

	if not LUI.IsLastInputKeyboardMouse(var_14_0) then
		return
	end

	var_0_15(arg_14_0)
	Engine.BFAABIIGDC(false)
	var_0_22(arg_14_0, arg_14_1)
end

function LUI.UIModelRotationArea.ButtonInput(arg_15_0, arg_15_1)
	var_0_16(arg_15_0, arg_15_1)
end

local function var_0_26(arg_16_0)
	var_0_23(arg_16_0)
	var_0_22(arg_16_0, nil)
end

function LUI.UIModelRotationArea.GetCurrentYaw(arg_17_0)
	return arg_17_0._currentYaw
end

function LUI.UIModelRotationArea.GetCurrentRoll(arg_18_0)
	return arg_18_0._currentRoll
end

function LUI.UIModelRotationArea.SetModelIndex(arg_19_0, arg_19_1)
	assert(type(arg_19_1) == "number")

	arg_19_0._modelIndex = arg_19_1

	var_0_23(arg_19_0)
end

function LUI.UIModelRotationArea.SetModel(arg_20_0, arg_20_1)
	assert(type(arg_20_1) == "userdata")

	arg_20_0._model = arg_20_1

	var_0_23(arg_20_0)
end

function LUI.UIModelRotationArea.SetModelName(arg_21_0, arg_21_1)
	assert(type(arg_21_1) == "string")

	arg_21_0._modelName = arg_21_1

	var_0_23(arg_21_0)
end

function LUI.UIModelRotationArea.SetModelOffsetData(arg_22_0)
	assert(arg_22_0._modelName, "Make sure you set up _modelName before calling this function")
	assert(arg_22_0._model, "Make sure you set up _model before calling this function")

	arg_22_0._offsetData = arg_22_0._model:GetOffsetsAndRotations(arg_22_0._modelName)
end

function LUI.UIModelRotationArea.SetCharacterInfo(arg_23_0, arg_23_1, arg_23_2)
	assert(type(arg_23_1) == "number")

	arg_23_0._modelIndex = arg_23_1
	arg_23_0.operatorRef = arg_23_2
	arg_23_0.turnCounter = 0
	arg_23_0.currentState = var_0_11.Idle
end

function LUI.UIModelRotationArea.init(arg_24_0, arg_24_1)
	LUI.UIModelRotationArea.super.init(arg_24_0, arg_24_1)
	assert(arg_24_1)
	assert(arg_24_1.type)

	arg_24_0._type = arg_24_1.type
	arg_24_0._controllerIndex = arg_24_1.controllerIndex

	if arg_24_0._type == LUI.UIModelRotationArea.Types.Character then
		arg_24_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_PANFOURWAYS)
	else
		arg_24_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ROTATION_NORMAL)
	end

	arg_24_0.Reset = var_0_26
	arg_24_0._rotationInput = 0
	arg_24_0._currentYaw = 0
	arg_24_0._currentRoll = 0
	arg_24_0._currentYawDirection = 0

	arg_24_0:registerEventHandler("gamepad_sticks", var_0_20)
	arg_24_0:registerEventHandler("leftmousedown", var_0_21)
	arg_24_0:registerEventHandler("leftmouseup", var_0_25)
	arg_24_0:addEventHandler("popup_active", var_0_25)
	arg_24_0:addEventHandler("mouse_capture_lost", var_0_25)
	arg_24_0:addEventHandler("mousemove", var_0_19)
	arg_24_0:registerEventHandler("tick", var_0_24)

	function arg_24_0.AcceptsFocusType(arg_25_0, arg_25_1)
		return arg_25_1 == FocusType.MouseOver
	end

	arg_24_0:SetHandleMouse(true)

	if arg_24_0._type == LUI.UIModelRotationArea.Types.Weapon then
		arg_24_0.weaponYawRotationTimer = LUI.UITimer.new({
			interval = 50,
			event = "update_weapon_yaw_rotation"
		})
		arg_24_0.weaponYawRotationTimer.id = "lobbyTimer"

		arg_24_0:addElement(arg_24_0.weaponYawRotationTimer)
		arg_24_0:addEventHandler("update_weapon_yaw_rotation", function(arg_26_0, arg_26_1)
			var_0_13(arg_26_0)
		end)
	end

	local function var_24_0(arg_27_0, arg_27_1)
		if LUI.IsLastInputKeyboardMouse(arg_27_1) then
			if arg_27_0.timer then
				arg_27_0.timer:closeTree()

				arg_27_0.timer = nil
			end
		elseif arg_27_0._type == LUI.UIModelRotationArea.Types.Character and not arg_27_0.timer then
			local var_27_0 = LUI.UITimer.new({
				interval = 15,
				event = "tick"
			})

			var_27_0.id = "UIModelRotationAreaTimer"

			arg_27_0:addElement(var_27_0)

			arg_27_0.timer = var_27_0
		end
	end

	arg_24_0:registerEventHandler("update_input_type", function(arg_28_0, arg_28_1)
		var_24_0(arg_28_0, arg_28_1.controllerIndex)
	end)
end
