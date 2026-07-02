module(..., package.seeall)

local var_0_0 = 4
local var_0_1 = 5

function UpdateContentForSeason(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0.CardGrid:GetBuiltChildren()

	for iter_1_0, iter_1_1 in pairs(var_1_0) do
		local var_1_1 = iter_1_1.columnIdx or 0
		local var_1_2 = iter_1_1.rowIdx or 0
		local var_1_3 = var_1_1 * var_0_1 + var_1_2 + 1
		local var_1_4 = PROGRESSION.GetSeasonalChallengeData(arg_1_1, arg_1_2, var_1_3)

		var_1_4._challengeIndex = var_1_3

		iter_1_1:SetDetailsFromChallengeData(var_1_4)
	end

	local var_1_5 = 1
	local var_1_6 = PROGRESSION.GetSeasonalChallengeData(arg_1_1, arg_1_2, var_1_5)

	var_1_6._challengeIndex = var_1_5

	if var_1_6 then
		arg_1_0:UpdateDetailInfo(arg_1_1, var_1_6)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Details:SetDetailsFromChallengeData(arg_2_2)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateContentForSeason = UpdateContentForSeason
	arg_3_0.UpdateDetailInfo = var_0_2

	arg_3_0.CardGrid:SetNumColumns(var_0_0)
	arg_3_0.CardGrid:SetNumRows(var_0_1)
	arg_3_0.CardGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_0.columnIdx = arg_4_1
		arg_4_0.rowIdx = arg_4_2

		if not arg_4_0.hasHandlers then
			arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
				ACTIONS.AnimateSequence(arg_4_0, IsLanguageArabic() and "ActiveAR" or "Active")

				if arg_4_0._challengeData ~= nil then
					arg_3_0:UpdateDetailInfo(arg_3_1, arg_4_0._challengeData)
				end
			end)
			arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
				ACTIONS.AnimateSequence(arg_4_0, IsLanguageArabic() and "InactiveAR" or "Inactive")
			end)

			arg_4_0.hasHandlers = true
		end
	end)
	arg_3_0.CardGrid:RefreshContent()

	if CONDITIONS.IsChallengeTabEnabled() and CONDITIONS.IsBattlePassEnabled() then
		local var_3_0
		local var_3_1 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			isSeasonReset = true,
			controllerIndex = arg_3_1
		})

		var_3_1.id = "BattlePassSeasonResetStatus"

		var_3_1.ResetText:SetLeft(_1080p * 80, 0)
		var_3_1.ResetText:SetRight(_1080p * 372, 0)
		var_3_1.ResetText:SetTop(_1080p * 21, 0)
		var_3_1.ResetText:SetBottom(_1080p * 42, 0)
		var_3_1.ResetText:SetAlignment(LUI.Alignment.Right)
		var_3_1.BattlePass:SetAlpha(0, 0)
		var_3_1:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -383, _1080p * -8, _1080p * -11, _1080p * 69)
		arg_3_0:addElement(var_3_1)

		arg_3_0.BattlePassSeasonResetStatus = var_3_1
	end
end

function ProgressionChallengeContainer(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1090 * _1080p, 0, 582 * _1080p)

	var_7_0.id = "ProgressionChallengeContainer"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "ChallengeLoadoutBackground"

	var_7_4:SetAlpha(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1, _1080p * -1, _1080p * 58, _1080p * 540)
	var_7_0:addElement(var_7_4)

	var_7_0.ChallengeLoadoutBackground = var_7_4

	local var_7_5
	local var_7_6 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 5,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PrestigeChallengeCard", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 9,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 266,
		rowHeight = _1080p * 92,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_7 = LUI.UIGrid.new(var_7_6)

	var_7_7.id = "CardGrid"

	var_7_7:setUseStencil(false)
	var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1070, _1080p * 58, _1080p * 526)
	var_7_0:addElement(var_7_7)

	var_7_0.CardGrid = var_7_7

	local var_7_8
	local var_7_9 = MenuBuilder.BuildRegisteredType("PrestigeChallengeDetails", {
		controllerIndex = var_7_1
	})

	var_7_9.id = "Details"

	var_7_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 565, _1080p * 688)
	var_7_0:addElement(var_7_9)

	var_7_0.Details = var_7_9

	local var_7_10
	local var_7_11 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_7_1
	})

	var_7_11.id = "WZContainer"

	var_7_11.TitleBackground:SetLeft(_1080p * 4, 0)
	var_7_11.TitleBackground:SetRight(_1080p * -4, 0)
	var_7_11.TitleBackground:SetTop(_1080p * 19, 0)
	var_7_11.TitleBackground:SetBottom(_1080p * 47, 0)
	var_7_11.TitleBackground:SetAlpha(0, 0)
	var_7_11.Title:SetLeft(_1080p * 14, 0)
	var_7_11.Title:SetRight(_1080p * -14, 0)
	var_7_11.Title:SetTop(_1080p * 9, 0)
	var_7_11.Title:SetBottom(_1080p * 35, 0)
	var_7_11.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CHALLENGE_TITLE_VANGUARD")), 0)
	var_7_11.Title:SetAlignment(LUI.Alignment.Left)
	var_7_11.BorderBacker:SetLeft(0, 0)
	var_7_11.BorderBacker:SetRight(0, 0)
	var_7_11.BorderBacker:SetTop(0, 0)
	var_7_11.BorderBacker:SetBottom(0, 0)
	var_7_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 43)
	var_7_0:addElement(var_7_11)

	var_7_0.WZContainer = var_7_11

	local function var_7_12()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_12

	local var_7_13
	local var_7_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_9:RegisterAnimationSequence("Preview", var_7_14)

	local function var_7_15()
		var_7_9:AnimateSequence("Preview")
	end

	var_7_0._sequences.Preview = var_7_15

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ProgressionChallengeContainer", ProgressionChallengeContainer)
LockTable(_M)
