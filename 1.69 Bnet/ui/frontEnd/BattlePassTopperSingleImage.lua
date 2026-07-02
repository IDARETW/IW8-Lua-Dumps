module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	return
end

function BattlePassTopperSingleImage(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p)

	var_2_0.id = "BattlePassTopperSingleImage"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "SingleImage"

	var_2_0:addElement(var_2_4)

	var_2_0.SingleImage = var_2_4

	local function var_2_5()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_5

	local var_2_6
	local var_2_7 = {
		{
			value = 0.93,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Visible", var_2_7)

	local function var_2_8()
		var_2_4:AnimateSequence("Visible")
	end

	var_2_0._sequences.Visible = var_2_8

	local var_2_9
	local var_2_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Hidden", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("Hidden")
	end

	var_2_0._sequences.Hidden = var_2_11

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassTopperSingleImage", BattlePassTopperSingleImage)
LockTable(_M)
