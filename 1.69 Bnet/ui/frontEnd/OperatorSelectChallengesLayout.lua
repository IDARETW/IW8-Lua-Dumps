module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetIgnoreInvisibleChildren(true)

	arg_1_0._missionGridShown = false

	function arg_1_0.UpdateDividerVisibility(arg_2_0)
		if arg_2_0.OperatorChallenges:GetAlpha() == 0 or arg_2_0.BundleUpsellButton:GetAlpha() == 0 then
			arg_2_0.TextDivider:SetAlpha(0)
		else
			arg_2_0.TextDivider:SetAlpha(1)
		end

		if arg_2_0._missionGridShown then
			arg_2_0.OperatorSelectChallengesLayoutMissionGrid:SetMouseFocusBlocker(false)
		else
			arg_2_0.OperatorSelectChallengesLayoutMissionGrid:SetMouseFocusBlocker(true)
		end
	end

	local function var_1_0()
		arg_1_0:UpdateDividerVisibility()

		return true
	end

	arg_1_0.BundleUpsellButton:addEventHandler("on_upsell_button_hidden", var_1_0)
	arg_1_0.BundleUpsellButton:addEventHandler("on_upsell_button_shown", var_1_0)
	arg_1_0:UpdateDividerVisibility()
end

function OperatorSelectChallengesLayout(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalStackedLayout.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 175 * _1080p)

	var_4_0.id = "OperatorSelectChallengesLayout"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(21 * _1080p)

	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "BundleUpsellButton"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 206)
	var_4_0:addElement(var_4_4)

	var_4_0.BundleUpsellButton = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("TextDivider", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "TextDivider"

	var_4_6.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/OR"), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 227, _1080p * 257)
	var_4_0:addElement(var_4_6)

	var_4_0.TextDivider = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("OperatorChallenges", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "OperatorChallenges"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 278, _1080p * 453)
	var_4_0:addElement(var_4_8)

	var_4_0.OperatorChallenges = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("OperatorSelectChallengesLayoutMissionGrid", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "OperatorSelectChallengesLayoutMissionGrid"

	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 450, _1080p * 474, _1080p * 1204)
	var_4_0:addElement(var_4_10)

	var_4_0.OperatorSelectChallengesLayoutMissionGrid = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("OnOperatorUnlocked", var_4_13)

	local var_4_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("OnOperatorUnlocked", var_4_14)

	local function var_4_15()
		var_4_8:AnimateSequence("OnOperatorUnlocked")
		var_4_10:AnimateSequence("OnOperatorUnlocked")
	end

	var_4_0._sequences.OnOperatorUnlocked = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("OnOperatorLocked", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("OnOperatorLocked", var_4_18)

	local function var_4_19()
		var_4_8:AnimateSequence("OnOperatorLocked")
		var_4_10:AnimateSequence("OnOperatorLocked")
	end

	var_4_0._sequences.OnOperatorLocked = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 476
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 682
		}
	}

	var_4_4:RegisterAnimationSequence("OnOperatorUnlockedWithMissions", var_4_21)

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("OnOperatorUnlockedWithMissions", var_4_22)

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("OnOperatorUnlockedWithMissions", var_4_23)

	local function var_4_24()
		var_4_4:AnimateSequence("OnOperatorUnlockedWithMissions")
		var_4_8:AnimateSequence("OnOperatorUnlockedWithMissions")
		var_4_10:AnimateSequence("OnOperatorUnlockedWithMissions")
	end

	var_4_0._sequences.OnOperatorUnlockedWithMissions = var_4_24

	var_4_4:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.AnimateSequenceByElement(var_4_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_4_4:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_4_1
		end

		ACTIONS.AnimateSequenceByElement(var_4_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("OperatorSelectChallengesLayout", OperatorSelectChallengesLayout)
LockTable(_M)
