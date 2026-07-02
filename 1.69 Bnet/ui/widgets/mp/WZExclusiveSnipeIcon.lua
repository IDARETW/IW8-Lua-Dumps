module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.SnipeIcon:UpdateSnipeIcon(arg_1_1)

	arg_1_0.SnipeIcon:SetRight(var_1_0)

	local var_1_1 = arg_1_1.isExclusive

	if var_1_1 == nil and arg_1_1.gameSourceExclusivityID and arg_1_1.gameSourceExclusivityID ~= LOOT.itemSourceExclusivity.NONE then
		var_1_1 = LOOT.IsItemSourceExclusive(arg_1_1.gameSourceExclusivityID)
	end

	ACTIONS.AnimateSequence(arg_1_0, var_1_1 and "ShowExclusive" or "HideExclusive")
	ACTIONS.AnimateSequence(arg_1_0, "ShowSnipe")
	arg_1_0.ExclusiveBanner:SetText({
		backerRightPadding = arg_1_1.backerRightPadding
	})

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateExclusiveSnipeIcon = var_0_0
end

function WZExclusiveSnipeIcon(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "WZExclusiveSnipeIcon"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "SnipeIcon"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 20, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.SnipeIcon = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WZExclusiveBanner", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ExclusiveBanner"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 150, 0, _1080p * 32)
	var_3_0:addElement(var_3_6)

	var_3_0.ExclusiveBanner = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowExclusive", var_3_9)

	local function var_3_10()
		var_3_6:AnimateSequence("ShowExclusive")
	end

	var_3_0._sequences.ShowExclusive = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("HideExclusive", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("HideExclusive")
	end

	var_3_0._sequences.HideExclusive = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowSnipe", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("ShowSnipe")
	end

	var_3_0._sequences.ShowSnipe = var_3_16

	local var_3_17
	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZExclusiveSnipeIcon", WZExclusiveSnipeIcon)
LockTable(_M)
