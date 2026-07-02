module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0 = 1, AAR.MAX_STATS_DISPLAY_NUM do
		local var_1_0 = arg_1_0.statsItems[iter_1_0]

		if arg_1_2[iter_1_0].Name and arg_1_2[iter_1_0].Name ~= AAR.INVALID_STATS_NAME then
			var_1_0:DisplayStatsInfo(arg_1_1, arg_1_2[iter_1_0])
		else
			var_1_0:HideStatsInfo(arg_1_1)
		end
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitStatsData = var_0_0

	assert(arg_2_0.AARStatsItem1)
	assert(arg_2_0.AARStatsItem2)
	assert(arg_2_0.AARStatsItem3)
	assert(arg_2_0.AARStatsItem4)
	assert(arg_2_0.AARStatsItem5)
	assert(arg_2_0.AARStatsItem6)

	arg_2_0.statsItems = {
		arg_2_0.AARStatsItem1,
		arg_2_0.AARStatsItem2,
		arg_2_0.AARStatsItem3,
		arg_2_0.AARStatsItem4,
		arg_2_0.AARStatsItem5,
		arg_2_0.AARStatsItem6
	}
end

function AARStats(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "AARStats"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARStatsItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "AARStatsItem6"

	var_3_6:SetAlpha(0, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 100, _1080p * 220, _1080p * 30, _1080p * 150)
	var_3_0:addElement(var_3_6)

	var_3_0.AARStatsItem6 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("AARStatsItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "AARStatsItem5"

	var_3_8:SetAlpha(0, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * 30, _1080p * 150)
	var_3_0:addElement(var_3_8)

	var_3_0.AARStatsItem5 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("AARStatsItem", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "AARStatsItem4"

	var_3_10:SetAlpha(0, 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -220, _1080p * -100, _1080p * 30, _1080p * 150)
	var_3_0:addElement(var_3_10)

	var_3_0.AARStatsItem4 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("AARStatsItem", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "AARStatsItem3"

	var_3_12:SetAlpha(0, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 100, _1080p * 220, _1080p * -110, _1080p * 10)
	var_3_0:addElement(var_3_12)

	var_3_0.AARStatsItem3 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("AARStatsItem", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "AARStatsItem2"

	var_3_14:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -110, _1080p * 10)
	var_3_0:addElement(var_3_14)

	var_3_0.AARStatsItem2 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("AARStatsItem", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "AARStatsItem1"

	var_3_16:SetAlpha(0, 0)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -220, _1080p * -100, _1080p * -110, _1080p * 10)
	var_3_0:addElement(var_3_16)

	var_3_0.AARStatsItem1 = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "Title"

	var_3_18.Text:setText(Engine.CBBHFCGDIC("AAR/STATS"), 0)
	var_3_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_3_0:addElement(var_3_18)

	var_3_0.Title = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Intro", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Intro", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Intro", var_3_22)

	local var_3_23 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Intro", var_3_23)

	local var_3_24 = {
		{
			value = 0.01,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Intro", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Intro", var_3_25)

	local function var_3_26()
		var_3_6:AnimateSequence("Intro")
		var_3_8:AnimateSequence("Intro")
		var_3_10:AnimateSequence("Intro")
		var_3_12:AnimateSequence("Intro")
		var_3_14:AnimateSequence("Intro")
		var_3_16:AnimateSequence("Intro")
	end

	var_3_0._sequences.Intro = var_3_26

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARStats", AARStats)
LockTable(_M)
