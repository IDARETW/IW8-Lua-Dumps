module(..., package.seeall)

function OperationStatus(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_1_0.id = "OperationStatus"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.4, 0)
	var_1_4:setImage(RegisterMaterial("icon_waypoint_backing_sp"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Frame"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.objectiveActive, 0)
	var_1_6:setImage(RegisterMaterial("icon_waypoint_frame"), 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Frame = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Fill"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.objectiveActive, 0)
	var_1_8:setImage(RegisterMaterial("icon_waypoint_status_plate"), 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Fill = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.objectiveComplete
		}
	}

	var_1_6:RegisterAnimationSequence("Complete", var_1_10)

	local var_1_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.objectiveComplete
		}
	}

	var_1_8:RegisterAnimationSequence("Complete", var_1_11)

	local function var_1_12()
		var_1_6:AnimateSequence("Complete")
		var_1_8:AnimateSequence("Complete")
	end

	var_1_0._sequences.Complete = var_1_12

	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.objectiveActive
		}
	}

	var_1_6:RegisterAnimationSequence("Incomplete", var_1_13)

	local var_1_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Incomplete", var_1_14)

	local function var_1_15()
		var_1_6:AnimateSequence("Incomplete")
		var_1_8:AnimateSequence("Incomplete")
	end

	var_1_0._sequences.Incomplete = var_1_15

	return var_1_0
end

MenuBuilder.registerType("OperationStatus", OperationStatus)
LockTable(_M)
