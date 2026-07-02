module(..., package.seeall)

function PrestigeLock(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "PrestigeLock"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:setUseStencil(true)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("IndicatorArrow", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Backing"

	var_1_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_4:SetZRotation(135, 0)
	var_1_4:SetScale(3, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 43, _1080p * 1, _1080p * 17)
	var_1_0:addElement(var_1_4)

	var_1_0.Backing = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Lock"

	var_1_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZContainerBackground, 0)
	var_1_6:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 46, _1080p * -2, _1080p * 31)
	var_1_0:addElement(var_1_6)

	var_1_0.Lock = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Locked", var_1_9)

	local var_1_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Locked", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Locked")
		var_1_6:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ExclusiveLocked", var_1_13)

	local function var_1_14()
		var_1_6:AnimateSequence("ExclusiveLocked")
	end

	var_1_0._sequences.ExclusiveLocked = var_1_14

	local function var_1_15()
		return
	end

	var_1_0._sequences.MasterLocked = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("HideBacking", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("HideBacking")
	end

	var_1_0._sequences.HideBacking = var_1_18

	local var_1_19
	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("LockOnly", var_1_20)

	local function var_1_21()
		var_1_6:AnimateSequence("LockOnly")
	end

	var_1_0._sequences.LockOnly = var_1_21

	return var_1_0
end

MenuBuilder.registerType("PrestigeLock", PrestigeLock)
LockTable(_M)
