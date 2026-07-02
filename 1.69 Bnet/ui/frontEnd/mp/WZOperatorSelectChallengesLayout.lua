module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0)
	assert(arg_1_1)

	local var_1_0 = ""
	local var_1_1 = StringTable.BJJBBCJGEJ(CSV.operators.file, CSV.operators.cols.ref, arg_1_0.ref)
	local var_1_2 = CSV.ReadRowWithColumns(CSV.operators, var_1_1, {
		dvar = CSV.operators.cols.dvarFilter,
		revealDesc1 = CSV.operators.cols.revealDesc1,
		revealDesc2 = CSV.operators.cols.revealDesc2
	})

	if var_1_2 and var_1_2.dvar ~= "" then
		local var_1_3 = var_1_2.dvar
		local var_1_4 = Dvar.CFHDGABACF(var_1_3)

		if var_1_4 == OPERATOR.UnlockState.REVEALED1 or var_1_4 == OPERATOR.UnlockState.REVEALED2 then
			arg_1_1.desc = var_1_4 == OPERATOR.UnlockState.REVEALED1 and var_1_2.revealDesc1 or var_1_2.revealDesc2
			arg_1_1.shouldHideGameUpsell = true
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = not (OPERATOR.IsRandomOperator(arg_2_1.ref) or OPERATOR.IsRandomFavOperator(arg_2_1.ref)) and OPERATOR.GetOperatorChallenges(arg_2_0._controllerIndex, arg_2_1.ref) or nil

	if var_2_1 then
		local var_2_2 = OPERATOR.GetLootIDFromRef(arg_2_1.ref)
		local var_2_3 = Challenge.GetFileTableByType(Challenge.Type.OPERATOR_UNLOCK)
		local var_2_4 = StringTable.BJJBBCJGEJ(var_2_3.file, var_2_3.cols.loot, var_2_2)

		var_2_0 = CSV.ReadRowWithColumns(var_2_3, var_2_4, {
			desc = var_2_3.cols.desc,
			amount = var_2_3.cols.amount
		})
		var_2_0.progress = var_2_1.Challenges.UnlockProgress
	end

	if arg_2_1.challengeUnlockDescOverride and arg_2_1.challengeUnlockDescOverride ~= "" then
		var_2_0.desc = arg_2_1.challengeUnlockDescOverride

		local var_2_5 = arg_2_1.ref == "t9stitch_eastern"

		var_2_0.shouldHideGameUpsell = true
		var_2_0.isUnlockedWithBattlePass = var_2_5
		var_2_0.isUnlockedWithActiveBattlePass = var_2_5 and tonumber(OPERATOR.GetOperatorSeason(arg_2_1.ref)) == SEASON.GetCurrentSeasonDataNum()
	end

	var_0_0(arg_2_1, var_2_0)

	var_2_0.operatorRef = arg_2_1.ref
	var_2_0.isT9DefaultOperator = OPERATOR.IsT9DefaultOperator(arg_2_1.ref)
	var_2_0.isLaunchOperator = false

	if arg_2_1.isLaunchOperator and #arg_2_1.isLaunchOperator > 0 then
		var_2_0.isLaunchOperator = arg_2_1.isLaunchOperator == "1"
	end

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.challengeData = var_0_1(arg_3_0, arg_3_1)
	arg_3_0.isOperatorLocked = not arg_3_2

	if not Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_3_0.BundleUpsellButton:HideButton()
	else
		arg_3_0.BundleUpsellButton:SetupUpsellButton(arg_3_0._controllerIndex, LOOT.itemTypes.OPERATOR, arg_3_1.ref)
	end

	local var_3_0 = arg_3_1.outfitMissionQuests or {}

	if OPERATOR.IsS4Operator(arg_3_1.ref) then
		var_3_0 = arg_3_1.challenges or {}
	end

	arg_3_0.OperatorSelectChallengesLayoutMissionGrid:UpdateGrid(var_3_0)
end

local function var_0_3(arg_4_0)
	local var_4_0 = arg_4_0.OperatorChallenges:GetAlpha() == 0 or arg_4_0.BundleUpsellButton:GetAlpha() == 0

	arg_4_0.TextDivider:SetAlpha(var_4_0 and 0 or 1)
	arg_4_0.OperatorSelectChallengesLayoutMissionGrid:SetMouseFocusBlocker(not arg_4_0._missionGridShown)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:SetIgnoreInvisibleChildren(true)

	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._missionGridShown = false
	arg_5_0.UpdateDividerVisibility = var_0_3
	arg_5_0.SetData = var_0_2

	local function var_5_0()
		arg_5_0:UpdateDividerVisibility()
		arg_5_0.OperatorChallenges:Refresh(arg_5_0.challengeData, arg_5_0.isOperatorLocked, false)

		return true
	end

	local function var_5_1()
		arg_5_0:UpdateDividerVisibility()
		arg_5_0.OperatorChallenges:Refresh(arg_5_0.challengeData, arg_5_0.isOperatorLocked, true)

		return true
	end

	arg_5_0.BundleUpsellButton:addEventHandler("on_upsell_button_hidden", var_5_0)
	arg_5_0.BundleUpsellButton:addEventHandler("on_upsell_button_shown", var_5_1)
	var_0_3(arg_5_0)
end

function WZOperatorSelectChallengesLayout(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalStackedLayout.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 175 * _1080p)

	var_8_0.id = "WZOperatorSelectChallengesLayout"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:SetSpacing(21 * _1080p)

	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("OperatorChallenges", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "OperatorChallenges"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 175)
	var_8_0:addElement(var_8_4)

	var_8_0.OperatorChallenges = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("OperatorSelectChallengesLayoutMissionGrid", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "OperatorSelectChallengesLayoutMissionGrid"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 196, _1080p * 534)
	var_8_0:addElement(var_8_6)

	var_8_0.OperatorSelectChallengesLayoutMissionGrid = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("TextDivider", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "TextDivider"

	var_8_8.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/OR"), 0)
	var_8_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 555, _1080p * 585)
	var_8_0:addElement(var_8_8)

	var_8_0.TextDivider = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "BundleUpsellButton"

	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 606, _1080p * 812)
	var_8_0:addElement(var_8_10)

	var_8_0.BundleUpsellButton = var_8_10

	local function var_8_11()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_11

	local var_8_12
	local var_8_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("OnOperatorUnlocked", var_8_13)

	local var_8_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("OnOperatorUnlocked", var_8_14)

	local function var_8_15()
		var_8_4:AnimateSequence("OnOperatorUnlocked")
		var_8_6:AnimateSequence("OnOperatorUnlocked")
	end

	var_8_0._sequences.OnOperatorUnlocked = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("OnOperatorLocked", var_8_17)

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("OnOperatorLocked", var_8_18)

	local function var_8_19()
		var_8_4:AnimateSequence("OnOperatorLocked")
		var_8_6:AnimateSequence("OnOperatorLocked")
	end

	var_8_0._sequences.OnOperatorLocked = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("OnOperatorUnlockedWithMissions", var_8_21)

	local var_8_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("OnOperatorUnlockedWithMissions", var_8_22)

	local var_8_23 = {
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

	var_8_10:RegisterAnimationSequence("OnOperatorUnlockedWithMissions", var_8_23)

	local function var_8_24()
		var_8_4:AnimateSequence("OnOperatorUnlockedWithMissions")
		var_8_6:AnimateSequence("OnOperatorUnlockedWithMissions")
		var_8_10:AnimateSequence("OnOperatorUnlockedWithMissions")
	end

	var_8_0._sequences.OnOperatorUnlockedWithMissions = var_8_24

	var_8_10:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_8_1
		end

		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_8_10:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_8_1
		end

		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)
	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WZOperatorSelectChallengesLayout", WZOperatorSelectChallengesLayout)
LockTable(_M)
