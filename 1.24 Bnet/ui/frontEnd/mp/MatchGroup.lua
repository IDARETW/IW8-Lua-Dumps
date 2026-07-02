module(..., package.seeall)

local var_0_0 = 4
local var_0_1 = 23
local var_0_2 = 2 * _1080p
local var_0_3 = {
	extendThenCollapse = "ExtendThenCollapse",
	extended = "Extended",
	collapsed = "Collapsed"
}

local function var_0_4(arg_1_0)
	local var_1_0 = _1080p * (arg_1_0._isLeft and 312 or 16)
	local var_1_1 = _1080p * (arg_1_0._isLeft and -16 or -312)
	local var_1_2 = MenuBuilder.BuildRegisteredType("TournamentPlayerStatus", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_2.id = "TournamentPlayerStatus1"

	var_1_2:SetAnchorsAndPosition(0, 0, 0, 1, var_1_0, var_1_1, _1080p * 48, _1080p * 86)
	var_1_2:SetNumPlayers(Tournament.DIGGEIGAHD())
	arg_1_0:addElement(var_1_2)

	arg_1_0.TournamentPlayerStatus1 = var_1_2

	local var_1_3 = MenuBuilder.BuildRegisteredType("TournamentPlayerStatus", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_3.id = "TournamentPlayerStatus2"

	var_1_3:SetAnchorsAndPosition(0, 0, 0, 1, var_1_0, var_1_1, _1080p * 88, _1080p * 126)
	var_1_3:SetNumPlayers(Tournament.DIGGEIGAHD())
	arg_1_0:addElement(var_1_3)

	arg_1_0.TournamentPlayerStatus2 = var_1_3

	arg_1_0.MatchGroup.RoundNum:SetAlpha(0)
	arg_1_0.MatchGroup.MatchTimeString:SetAlpha(0)
	arg_1_0.MatchGroup.MatchTimeRemain:SetAlpha(0)

	arg_1_0._playerStatusCreated = true
end

local function var_0_5(arg_2_0)
	if arg_2_0.TournamentPlayerStatus1 and arg_2_0.TournamentPlayerStatus2 then
		arg_2_0.TournamentPlayerStatus1:closeTree()

		arg_2_0.TournamentPlayerStatus1 = nil

		arg_2_0.TournamentPlayerStatus2:closeTree()

		arg_2_0.TournamentPlayerStatus2 = nil

		arg_2_0.MatchGroup.RoundNum:SetAlpha(1)
		arg_2_0.MatchGroup.MatchTimeString:SetAlpha(1)
		arg_2_0.MatchGroup.MatchTimeRemain:SetAlpha(1)

		arg_2_0._playerStatusCreated = false
	end
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_0._prevBracket

	if var_3_0 then
		local var_3_1 = arg_3_3 * 2 + 1
		local var_3_2 = var_3_0["MatchGroup" .. var_3_1]
		local var_3_3 = arg_3_3 * 2 + 1 + 1
		local var_3_4 = var_3_0["MatchGroup" .. var_3_3]

		return var_3_2, var_3_4
	end
end

local function var_0_7(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_0._isLeft and "Left" or "Right"
	local var_4_1 = arg_4_3 and "Snap" or ""
	local var_4_2 = arg_4_2 .. var_4_1 .. var_4_0

	ACTIONS.AnimateSequence(arg_4_1, var_4_2)
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MatchGroup.RoundNum)
	assert(arg_5_0.MatchGroup.MatchTimeString)
	assert(arg_5_0.MatchGroup.BracketTeam1)
	assert(arg_5_0.MatchGroup.BracketTeam2)
	assert(arg_5_0.MatchGroup.MatchNumButton)

	arg_5_0.canSpectate = arg_5_1.canSpectate

	local var_5_0 = TOURNAMENT.GetAdjustedMatchIndex(arg_5_0.roundIndex - 1, arg_5_0.matchIndex - 1)
	local var_5_1 = LUI.FlowManager.GetScopedData(TOURNAMENT.GetMenuName("arena"))
	local var_5_2 = arg_5_1.teams[1].teamID ~= -1 and arg_5_1.teams[2].teamID ~= -1

	if arg_5_1.canSpectate then
		arg_5_0.MatchGroup.RoundNum:setText(MenuUtils.GetOrdinalNumber(arg_5_1.subMatchIndex, true))
		arg_5_0.MatchGroup.RoundNum:SetAlpha(0)
		arg_5_0.MatchGroup.RoundNum:SetAlpha(1, 200, LUI.EASING.outQuadratic)

		local var_5_3 = arg_5_1.timeString
		local var_5_4 = arg_5_1.time
		local var_5_5

		if var_5_4 then
			var_5_5 = var_5_4 > 0 and "DisplayMatchTime" or "DisplayMatchMsg"
		else
			var_5_5 = "DisplayMatchTime"
		end

		ACTIONS.AnimateSequence(arg_5_0.MatchGroup, var_5_5)
		arg_5_0.MatchGroup.MatchTimeString:setText(var_5_3)

		if arg_5_0._matchData and arg_5_0._matchData.timeString ~= arg_5_1.timeString and var_5_5 == "DisplayMatchMsg" then
			arg_5_0.MatchGroup.MatchTimeString:SetAlpha(0)
		end

		arg_5_0.MatchGroup.MatchTimeString:SetAlpha(1, 200, LUI.EASING.outQuadratic)

		if arg_5_0:isInFocus() then
			arg_5_0:dispatchEventToCurrentMenu({
				visible = true,
				name = "match_preview_prompt"
			})
		end
	else
		arg_5_0.MatchGroup.RoundNum:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
		arg_5_0.MatchGroup.MatchTimeString:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))

		if arg_5_0:isInFocus() then
			arg_5_0:dispatchEventToCurrentMenu({
				visible = false,
				name = "match_preview_prompt"
			})
		end
	end

	arg_5_0.MatchGroup.BracketTeam1:Update(1, arg_5_1)
	arg_5_0.MatchGroup.BracketTeam2:Update(2, arg_5_1)

	if arg_5_1.isMyMatch and not arg_5_1.complete and not arg_5_1.canSpectate then
		if not arg_5_0._playerStatusCreated then
			var_0_4(arg_5_0, arg_5_0._isLeft)
		end

		arg_5_0.TournamentPlayerStatus1:Update(arg_5_1.teams[1], arg_5_1.canSpectate, true)
		arg_5_0.TournamentPlayerStatus2:Update(arg_5_1.teams[2], arg_5_1.canSpectate, true)
	end

	if (not arg_5_1.isMyMatch or arg_5_1.complete) and arg_5_0._playerStatusCreated then
		var_0_5(arg_5_0)
	end

	for iter_5_0, iter_5_1 in ipairs(arg_5_1.teams) do
		if iter_5_1.won and iter_5_1.isMyTeam then
			arg_5_0.MatchGroup.MatchStatusLine:SetRGBFromTable(SWATCHES.Tournament.teamNeutral)
		end

		local function var_5_6()
			arg_5_0.ConnectNear:SetAlpha(1)
			arg_5_0.ConnectMid:SetAlpha(1)
			arg_5_0._ConnectFar:SetAlpha(1)

			if iter_5_1.won and iter_5_1.isMyTeam then
				arg_5_0.ConnectNear:SetRGBFromTable(SWATCHES.Tournament.teamNeutral)
				arg_5_0.ConnectMid:SetRGBFromTable(SWATCHES.Tournament.teamNeutral)
				arg_5_0._ConnectFar:SetRGBFromTable(SWATCHES.Tournament.teamNeutral)
			end
		end

		local var_5_7 = var_0_3.extended
		local var_5_8 = true
		local var_5_9 = "NotMyMatchWaitingSnap"

		if not arg_5_1.complete then
			if arg_5_1.canSpectate then
				arg_5_0.MatchGroup.MatchNumButton.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_NUM_IN_PROGRESS", var_5_0))

				if arg_5_0._matchData and arg_5_0._matchData.canSpectate ~= arg_5_1.canSpectate then
					var_5_9 = arg_5_1.isMyMatch and "InProgress" or "NotMyMatchInProgress"

					ACTIONS.AnimateSequence(arg_5_0, var_5_9)

					var_5_7 = arg_5_1.isMyMatch and var_0_3.extendThenCollapse or var_0_3.collapsed
					var_5_8 = false
				else
					var_5_9 = arg_5_1.isMyMatch and "InProgressSnap" or "NotMyMatchInProgressSnap"
					var_5_7 = var_0_3.collapsed
				end
			else
				arg_5_0.MatchGroup.MatchNumButton.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_NUM", var_5_0))

				if arg_5_1.isMyMatch and var_5_2 then
					if arg_5_0._matchData and var_5_2 ~= arg_5_0._bothTeamsInBracket then
						var_5_9 = "MyMatchWaiting"

						ACTIONS.AnimateSequence(arg_5_0, var_5_9)

						var_5_7 = var_0_3.collapsed
						var_5_8 = false
					else
						var_5_9 = "MyMatchWaitingSnap"
						var_5_7 = var_0_3.collapsed
					end
				else
					var_5_9 = "NotMyMatchWaitingSnap"
				end
			end
		else
			arg_5_0.MatchGroup.MatchNumButton.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_NUM_COMPLETED", var_5_0))

			if arg_5_0._matchData and arg_5_0._matchData.complete ~= arg_5_1.complete then
				var_5_9 = "Completed"

				Engine.BJDBIAGIDA("ui_iw8_2v2_nextround_line")

				arg_5_0:Wait(350).onComplete = function()
					var_5_6()
				end
				var_5_8 = false
			else
				var_5_9 = "CompletedSnap"

				var_5_6()
			end
		end

		ACTIONS.AnimateSequence(arg_5_0.MatchGroup, var_5_9)

		if arg_5_0._adjRoundIndex > 0 and arg_5_0._adjRoundIndex < 3 then
			var_0_7(arg_5_0, arg_5_0._prevMatch1, var_5_7, var_5_8)
			var_0_7(arg_5_0, arg_5_0._prevMatch2, var_5_7, var_5_8)
		end
	end

	arg_5_0._bothTeamsInBracket = var_5_2
	arg_5_0._matchData = arg_5_1
end

local function var_0_9(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._isLeft = arg_8_2.isLeft
	arg_8_0._prevBracket = arg_8_2.prevBracket

	local var_8_0 = MenuBuilder.BuildRegisteredType(arg_8_0._isLeft and "MatchGroupRightSide" or "MatchGroupLeftSide", {
		controllerIndex = arg_8_0._controllerIndex,
		isLeft = arg_8_2.isLeft
	})

	var_8_0.id = arg_8_0._isLeft and "MatchGroupRightSide" or "MatchGroupLeftSide"

	var_8_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_8_0:addElement(var_8_0)

	arg_8_0.MatchGroup = var_8_0

	local var_8_1 = TOURNAMENT.GetAdjustedMatchIndex(arg_8_2.roundIndex - 1, arg_8_1 - 1)

	arg_8_0.matchIndex = arg_8_1
	arg_8_0.roundIndex = arg_8_2.roundIndex

	arg_8_0.MatchGroup.MatchNumButton.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_NUM", var_8_1))

	if arg_8_0._isLeft then
		ACTIONS.AnimateSequence(arg_8_0, "LinkLeft")
	end

	local var_8_2 = CONDITIONS.IsTournamentFullSize(arg_8_0)

	arg_8_0._adjRoundIndex = arg_8_0.roundIndex - 1
	arg_8_0._prevMatch1, arg_8_0._prevMatch2 = var_0_6(arg_8_0, arg_8_0._isLeft, arg_8_0._adjRoundIndex, arg_8_0.matchIndex - 1)

	local var_8_3 = Tournament.DEAFAIEJGI()

	if arg_8_2.roundIndex == var_8_3 and not var_8_2 then
		ACTIONS.AnimateSequence(arg_8_0, "HideLinks")
	else
		arg_8_0._isLinkedToFinal = var_8_2 and var_8_3 - arg_8_2.roundIndex == 1

		local var_8_4 = math.ceil(arg_8_1 / 2)
		local var_8_5 = arg_8_2.nextBracket["MatchGroup" .. var_8_4]

		assert(var_8_5)

		local var_8_6, var_8_7, var_8_8, var_8_9 = var_8_5:getLocalRect()
		local var_8_10 = (var_8_9 - var_8_7) / 2
		local var_8_11, var_8_12, var_8_13, var_8_14 = arg_8_0:getLocalRect()
		local var_8_15 = 88

		if arg_8_0._isLinkedToFinal then
			arg_8_0.ConnectFarBottom:SetAlpha(0)

			local var_8_16 = 296

			arg_8_0.ConnectMid:SetBottom(var_8_16 * _1080p)
			arg_8_0.ConnectFarTop:SetTop(var_8_16 * _1080p - var_0_2)
			arg_8_0.ConnectFarTop:SetBottom(var_8_16 * _1080p)

			if arg_8_0._isLeft then
				ACTIONS.AnimateSequence(arg_8_0, "FinalLinkLeft")
			else
				ACTIONS.AnimateSequence(arg_8_0, "FinalLinkRight")
			end
		end

		if arg_8_1 % 2 == 0 then
			arg_8_0._ConnectFar = arg_8_0.ConnectFarBottom

			local var_8_17 = var_8_7 + (var_8_10 + var_0_1 - 1) * _1080p
			local var_8_18 = var_8_12 + (var_8_10 + var_0_0 + 1) * _1080p - var_8_17

			arg_8_0.ConnectFarTop:SetAlpha(0)

			if not arg_8_0._isLinkedToFinal then
				arg_8_0.ConnectFarBottom:SetAlpha(0.5)
				arg_8_0.ConnectFarBottom:SetTop(var_8_15 * _1080p - var_8_18 - var_0_2)
				arg_8_0.ConnectFarBottom:SetBottom(var_8_15 * _1080p - var_8_18)
				arg_8_0.ConnectMid:SetTop(var_8_15 * _1080p - var_8_18 - var_0_2)
				arg_8_0.ConnectMid:SetBottom(var_8_15 * _1080p)
			end
		else
			arg_8_0._ConnectFar = arg_8_0.ConnectFarTop

			local var_8_19 = var_8_12 + (var_8_10 + var_0_1 - 1) * _1080p
			local var_8_20 = var_8_7 + (var_8_10 + var_0_0 + 1) * _1080p - var_8_19

			arg_8_0.ConnectFarBottom:SetAlpha(0)

			if not arg_8_0._isLinkedToFinal then
				arg_8_0.ConnectFarTop:SetAlpha(0.5)
				arg_8_0.ConnectFarTop:SetTop(var_8_15 * _1080p + var_8_20 - var_0_2)
				arg_8_0.ConnectFarTop:SetBottom(var_8_15 * _1080p + var_8_20)
				arg_8_0.ConnectMid:SetTop(var_8_15 * _1080p - var_0_2)
				arg_8_0.ConnectMid:SetBottom(var_8_15 * _1080p + var_8_20)
			end
		end
	end
end

local function var_0_10(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0.Update = var_0_8
	arg_9_0.SetMatch = var_0_9
	arg_9_0._enablePreview = false
	arg_9_0._ConnectFar = arg_9_0.ConnectFarTop

	arg_9_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		arg_9_0:dispatchEventToCurrentMenu({
			name = "match_preview_prompt",
			visible = arg_9_0._enablePreview
		})
	end)
end

function MatchGroup(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 506 * _1080p, 0, 126 * _1080p)

	var_11_0.id = "MatchGroup"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "ConnectNear"

	var_11_4:SetRGBFromTable(SWATCHES.Tournament.bracketLine, 0)
	var_11_4:SetAlpha(0.5, 0)
	var_11_4:SetAnchorsAndPosition(1, 0, 0, 1, 0, _1080p * 40, _1080p * 86, _1080p * 88)
	var_11_0:addElement(var_11_4)

	var_11_0.ConnectNear = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "ConnectMid"

	var_11_6:SetRGBFromTable(SWATCHES.Tournament.bracketLine, 0)
	var_11_6:SetAlpha(0.5, 0)
	var_11_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 40, _1080p * 42, _1080p * 86, _1080p * 226)
	var_11_0:addElement(var_11_6)

	var_11_0.ConnectMid = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "ConnectFarBottom"

	var_11_8:SetRGBFromTable(SWATCHES.Tournament.bracketLine, 0)
	var_11_8:SetAlpha(0.5, 0)
	var_11_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 42, _1080p * 190, _1080p * 224, _1080p * 226)
	var_11_0:addElement(var_11_8)

	var_11_0.ConnectFarBottom = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "ConnectFarTop"

	var_11_10:SetRGBFromTable(SWATCHES.Tournament.bracketLine, 0)
	var_11_10:SetAlpha(0.5, 0)
	var_11_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 42, _1080p * 190, _1080p * 164, _1080p * 166)
	var_11_0:addElement(var_11_10)

	var_11_0.ConnectFarTop = var_11_10

	local function var_11_11()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_11

	local var_11_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_11_4:RegisterAnimationSequence("LinkRight", var_11_12)

	local var_11_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_11_6:RegisterAnimationSequence("LinkRight", var_11_13)

	local var_11_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 224
		}
	}

	var_11_8:RegisterAnimationSequence("LinkRight", var_11_14)

	local var_11_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 140
		},
		{
			value = 1,
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 166
		}
	}

	var_11_10:RegisterAnimationSequence("LinkRight", var_11_15)

	local function var_11_16()
		var_11_4:AnimateSequence("LinkRight")
		var_11_6:AnimateSequence("LinkRight")
		var_11_8:AnimateSequence("LinkRight")
		var_11_10:AnimateSequence("LinkRight")
	end

	var_11_0._sequences.LinkRight = var_11_16

	local var_11_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_11_4:RegisterAnimationSequence("LinkLeft", var_11_17)

	local var_11_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_11_6:RegisterAnimationSequence("LinkLeft", var_11_18)

	local var_11_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		}
	}

	var_11_8:RegisterAnimationSequence("LinkLeft", var_11_19)

	local var_11_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_11_10:RegisterAnimationSequence("LinkLeft", var_11_20)

	local function var_11_21()
		var_11_4:AnimateSequence("LinkLeft")
		var_11_6:AnimateSequence("LinkLeft")
		var_11_8:AnimateSequence("LinkLeft")
		var_11_10:AnimateSequence("LinkLeft")
	end

	var_11_0._sequences.LinkLeft = var_11_21

	local var_11_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("HideLinks", var_11_22)

	local var_11_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("HideLinks", var_11_23)

	local var_11_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("HideLinks", var_11_24)

	local var_11_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("HideLinks", var_11_25)

	local function var_11_26()
		var_11_4:AnimateSequence("HideLinks")
		var_11_6:AnimateSequence("HideLinks")
		var_11_8:AnimateSequence("HideLinks")
		var_11_10:AnimateSequence("HideLinks")
	end

	var_11_0._sequences.HideLinks = var_11_26

	local var_11_27 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("InProgress", var_11_27)

	local var_11_28 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("InProgress", var_11_28)

	local function var_11_29()
		var_11_4:AnimateSequence("InProgress")
		var_11_6:AnimateSequence("InProgress")
	end

	var_11_0._sequences.InProgress = var_11_29

	local var_11_30 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("MyMatchWaiting", var_11_30)

	local var_11_31 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("MyMatchWaiting", var_11_31)

	local function var_11_32()
		var_11_4:AnimateSequence("MyMatchWaiting")
		var_11_6:AnimateSequence("MyMatchWaiting")
	end

	var_11_0._sequences.MyMatchWaiting = var_11_32

	local var_11_33 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("NotMyMatchInProgress", var_11_33)

	local var_11_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("NotMyMatchInProgress", var_11_34)

	local function var_11_35()
		var_11_4:AnimateSequence("NotMyMatchInProgress")
		var_11_6:AnimateSequence("NotMyMatchInProgress")
	end

	var_11_0._sequences.NotMyMatchInProgress = var_11_35

	local var_11_36 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("CollapsedRight", var_11_36)

	local var_11_37 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("CollapsedRight", var_11_37)

	local function var_11_38()
		var_11_8:AnimateSequence("CollapsedRight")
		var_11_10:AnimateSequence("CollapsedRight")
	end

	var_11_0._sequences.CollapsedRight = var_11_38

	local var_11_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_11_8:RegisterAnimationSequence("CollapsedSnapRight", var_11_39)

	local var_11_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_11_10:RegisterAnimationSequence("CollapsedSnapRight", var_11_40)

	local function var_11_41()
		var_11_8:AnimateSequence("CollapsedSnapRight")
		var_11_10:AnimateSequence("CollapsedSnapRight")
	end

	var_11_0._sequences.CollapsedSnapRight = var_11_41

	local var_11_42 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("ExtendedRight", var_11_42)

	local var_11_43 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("ExtendedRight", var_11_43)

	local function var_11_44()
		var_11_8:AnimateSequence("ExtendedRight")
		var_11_10:AnimateSequence("ExtendedRight")
	end

	var_11_0._sequences.ExtendedRight = var_11_44

	local var_11_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_11_8:RegisterAnimationSequence("ExtendedSnapRight", var_11_45)

	local var_11_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_11_10:RegisterAnimationSequence("ExtendedSnapRight", var_11_46)

	local function var_11_47()
		var_11_8:AnimateSequence("ExtendedSnapRight")
		var_11_10:AnimateSequence("ExtendedSnapRight")
	end

	var_11_0._sequences.ExtendedSnapRight = var_11_47

	local var_11_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("ExtendThenCollapseRight", var_11_48)

	local var_11_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("ExtendThenCollapseRight", var_11_49)

	local function var_11_50()
		var_11_8:AnimateSequence("ExtendThenCollapseRight")
		var_11_10:AnimateSequence("ExtendThenCollapseRight")
	end

	var_11_0._sequences.ExtendThenCollapseRight = var_11_50

	local var_11_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94
		}
	}

	var_11_8:RegisterAnimationSequence("CollapsedSnapLeft", var_11_51)

	local var_11_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94
		}
	}

	var_11_10:RegisterAnimationSequence("CollapsedSnapLeft", var_11_52)

	local function var_11_53()
		var_11_8:AnimateSequence("CollapsedSnapLeft")
		var_11_10:AnimateSequence("CollapsedSnapLeft")
	end

	var_11_0._sequences.CollapsedSnapLeft = var_11_53

	local var_11_54 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("CollapsedLeft", var_11_54)

	local var_11_55 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("CollapsedLeft", var_11_55)

	local function var_11_56()
		var_11_8:AnimateSequence("CollapsedLeft")
		var_11_10:AnimateSequence("CollapsedLeft")
	end

	var_11_0._sequences.CollapsedLeft = var_11_56

	local var_11_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("ExtendThenCollapseLeft", var_11_57)

	local var_11_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("ExtendThenCollapseLeft", var_11_58)

	local function var_11_59()
		var_11_8:AnimateSequence("ExtendThenCollapseLeft")
		var_11_10:AnimateSequence("ExtendThenCollapseLeft")
	end

	var_11_0._sequences.ExtendThenCollapseLeft = var_11_59

	local var_11_60 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("ExtendedLeft", var_11_60)

	local var_11_61 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("ExtendedLeft", var_11_61)

	local function var_11_62()
		var_11_8:AnimateSequence("ExtendedLeft")
		var_11_10:AnimateSequence("ExtendedLeft")
	end

	var_11_0._sequences.ExtendedLeft = var_11_62

	local var_11_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		}
	}

	var_11_8:RegisterAnimationSequence("ExtendedSnapLeft", var_11_63)

	local var_11_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		}
	}

	var_11_10:RegisterAnimationSequence("ExtendedSnapLeft", var_11_64)

	local function var_11_65()
		var_11_8:AnimateSequence("ExtendedSnapLeft")
		var_11_10:AnimateSequence("ExtendedSnapLeft")
	end

	var_11_0._sequences.ExtendedSnapLeft = var_11_65

	local var_11_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_11_4:RegisterAnimationSequence("FinalLinkLeft", var_11_66)

	local var_11_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -42
		}
	}

	var_11_6:RegisterAnimationSequence("FinalLinkLeft", var_11_67)

	local var_11_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200
		}
	}

	var_11_10:RegisterAnimationSequence("FinalLinkLeft", var_11_68)

	local function var_11_69()
		var_11_4:AnimateSequence("FinalLinkLeft")
		var_11_6:AnimateSequence("FinalLinkLeft")
		var_11_10:AnimateSequence("FinalLinkLeft")
	end

	var_11_0._sequences.FinalLinkLeft = var_11_69

	local var_11_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_11_4:RegisterAnimationSequence("FinalLinkRight", var_11_70)

	local var_11_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 42
		}
	}

	var_11_6:RegisterAnimationSequence("FinalLinkRight", var_11_71)

	local var_11_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		}
	}

	var_11_10:RegisterAnimationSequence("FinalLinkRight", var_11_72)

	local function var_11_73()
		var_11_4:AnimateSequence("FinalLinkRight")
		var_11_6:AnimateSequence("FinalLinkRight")
		var_11_10:AnimateSequence("FinalLinkRight")
	end

	var_11_0._sequences.FinalLinkRight = var_11_73

	var_0_10(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("MatchGroup", MatchGroup)
LockTable(_M)
