module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if #arg_1_1 < 1 then
		ACTIONS.AnimateSequence(arg_1_0, "HideDetails")

		return
	else
		ACTIONS.AnimateSequence(arg_1_0, "ShowDetails")

		if #arg_1_1 == 1 then
			ACTIONS.AnimateSequence(arg_1_0, "Show1")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Show2")
		end
	end

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._details) do
		if iter_1_0 <= #arg_1_1 then
			iter_1_1:SetData(arg_1_1[iter_1_0])

			if iter_1_1.SetDifficulty and Dvar.IBEGCHEFE("LLQKSNOSS") then
				iter_1_1:SetDifficulty(arg_1_1[iter_1_0])
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	Challenge.SortByNearestComplete(arg_2_0._dailyChallenges)

	for iter_2_0 = 1, arg_2_1 do
		local var_2_0 = arg_2_0._dailyChallenges[iter_2_0]

		table.insert(arg_2_0._data, var_2_0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._data = {}

	local var_3_0 = CONDITIONS.IsMagmaGameMode() and Challenge.ActivationCategoryBR or Challenge.ActivationCategoryMP
	local var_3_1 = Challenge.GetActiveMissionData(arg_3_1, var_3_0)

	arg_3_0._dailyChallenges = Challenge.GetCombinedDailyChallenges(arg_3_1)

	local var_3_2 = arg_3_0._dailyChallenges and #arg_3_0._dailyChallenges > 0

	if var_3_1 or var_3_2 then
		if var_3_1 then
			if not var_3_2 then
				var_3_1.type = Challenge.Type.MISSION

				table.insert(arg_3_0._data, var_3_1)
			else
				var_3_1.type = Challenge.Type.MISSION

				table.insert(arg_3_0._data, var_3_1)
				var_0_1(arg_3_0, 1)
			end
		elseif var_3_2 then
			var_0_1(arg_3_0, math.min(#arg_3_0._dailyChallenges, 2))
		end
	end

	var_0_0(arg_3_0, arg_3_0._data)

	arg_3_0.initialized = true
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0._data = {}

	if #arg_4_2 > 0 then
		arg_4_0._data[1] = arg_4_2[1]
		arg_4_0._data[1].type = arg_4_3

		if #arg_4_2 > 1 then
			arg_4_0._data[2] = arg_4_2[2]
			arg_4_0._data[2].type = arg_4_3
		end
	end

	var_0_0(arg_4_0, arg_4_0._data)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Details1)
	assert(arg_5_0.Details2)

	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._details = {
		arg_5_0.Details1,
		arg_5_0.Details2
	}
	arg_5_0.SetData = var_0_0
	arg_5_0.InitializeData = var_0_2
	arg_5_0.PreviewWeekly = var_0_3

	ACTIONS.AnimateSequence(arg_5_0, "HideDetails")
	arg_5_0:addEventHandler("new_daily_challenges", function(arg_6_0, arg_6_1)
		var_0_2(arg_6_0, arg_5_1)
	end)
	arg_5_0:addEventHandler("new_br_daily_challenges", function(arg_7_0, arg_7_1)
		var_0_2(arg_7_0, arg_5_1)
	end)
end

function BarracksChallengesSummary(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1060 * _1080p, 0, 760 * _1080p)

	var_8_0.id = "BarracksChallengesSummary"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIText.new()

	var_8_4.id = "NoChallengesLabel"

	var_8_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_4:SetAlpha(0, 0)
	var_8_4:setText(Engine.CBBHFCGDIC("CHALLENGE/NONE_AVAILABLE"), 0)
	var_8_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_4:SetAlignment(LUI.Alignment.Center)
	var_8_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -600, _1080p * 600, _1080p * -84, _1080p * -60)
	var_8_0:addElement(var_8_4)

	var_8_0.NoChallengesLabel = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("BarracksChallengeDetails", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Details1"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 514, 0, _1080p * 500)
	var_8_0:addElement(var_8_6)

	var_8_0.Details1 = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("BarracksChallengeDetails", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Details2"

	var_8_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -514, 0, 0, _1080p * 500)
	var_8_0:addElement(var_8_8)

	var_8_0.Details2 = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10
	local var_8_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ShowDetails", var_8_11)

	local var_8_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ShowDetails", var_8_12)

	local var_8_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ShowDetails", var_8_13)

	local function var_8_14()
		var_8_4:AnimateSequence("ShowDetails")
		var_8_6:AnimateSequence("ShowDetails")
		var_8_8:AnimateSequence("ShowDetails")
	end

	var_8_0._sequences.ShowDetails = var_8_14

	local var_8_15
	local var_8_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -599.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600.5
		}
	}

	var_8_4:RegisterAnimationSequence("HideDetails", var_8_16)

	local var_8_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("HideDetails", var_8_17)

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("HideDetails", var_8_18)

	local function var_8_19()
		var_8_4:AnimateSequence("HideDetails")
		var_8_6:AnimateSequence("HideDetails")
		var_8_8:AnimateSequence("HideDetails")
	end

	var_8_0._sequences.HideDetails = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Show1", var_8_21)

	local function var_8_22()
		var_8_8:AnimateSequence("Show1")
	end

	var_8_0._sequences.Show1 = var_8_22

	local var_8_23
	local var_8_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Show2", var_8_24)

	local function var_8_25()
		var_8_8:AnimateSequence("Show2")
	end

	var_8_0._sequences.Show2 = var_8_25

	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("BarracksChallengesSummary", BarracksChallengesSummary)
LockTable(_M)
