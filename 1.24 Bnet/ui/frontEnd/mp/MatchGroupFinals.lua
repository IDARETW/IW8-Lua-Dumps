module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = MenuBuilder.BuildRegisteredType("TournamentPlayerStatus", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_0.id = "TournamentPlayerStatus1"

	var_1_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -222, _1080p * -142, _1080p * 172, _1080p * 210)
	var_1_0:SetNumPlayers(Tournament.DIGGEIGAHD())
	arg_1_0:addElement(var_1_0)

	arg_1_0.TournamentPlayerStatus1 = var_1_0

	local var_1_1 = MenuBuilder.BuildRegisteredType("TournamentPlayerStatus", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_1.id = "TournamentPlayerStatus2"

	var_1_1:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 142, _1080p * 222, _1080p * 172, _1080p * 210)
	var_1_1:SetNumPlayers(Tournament.DIGGEIGAHD())
	arg_1_0:addElement(var_1_1)

	arg_1_0.TournamentPlayerStatus2 = var_1_1

	arg_1_0.RoundNum:SetAlpha(0)
	arg_1_0.MatchTimeString:SetAlpha(0)
	arg_1_0.MatchTimeRemain:SetAlpha(0)

	arg_1_0._playerStatusCreated = true
end

local function var_0_1(arg_2_0)
	if arg_2_0.TournamentPlayerStatus1 and arg_2_0.TournamentPlayerStatus2 then
		arg_2_0.TournamentPlayerStatus1:closeTree()

		arg_2_0.TournamentPlayerStatus1 = nil

		arg_2_0.TournamentPlayerStatus2:closeTree()

		arg_2_0.TournamentPlayerStatus2 = nil

		arg_2_0.RoundNum:SetAlpha(1)
		arg_2_0.MatchTimeString:SetAlpha(1)
		arg_2_0.MatchTimeRemain:SetAlpha(1)

		arg_2_0._playerStatusCreated = false
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.RoundNum)
	assert(arg_3_0.MatchTimeString)
	assert(arg_3_0.BracketTeam1)
	assert(arg_3_0.BracketTeam2)

	if arg_3_1.canSpectate then
		arg_3_0.RoundNum:setText(MenuUtils.GetOrdinalNumber(arg_3_1.subMatchIndex, true))
		arg_3_0.RoundNum:SetAlpha(0)

		local var_3_0 = arg_3_1.timeString
		local var_3_1 = arg_3_1.time
		local var_3_2

		if var_3_1 then
			var_3_2 = var_3_1 > 0 and "DisplayMatchTime" or "DisplayMatchMsg"
		else
			var_3_2 = "DisplayMatchTime"
		end

		ACTIONS.AnimateSequence(arg_3_0, var_3_2)
		arg_3_0.MatchTimeString:setText(var_3_0)

		if arg_3_0._matchData and arg_3_0._matchData.timeString ~= arg_3_1.timeString and var_3_2 == "DisplayMatchMsg" then
			arg_3_0.MatchTimeString:SetAlpha(0)
		end

		arg_3_0.MatchTimeString:SetAlpha(1, 200, LUI.EASING.outQuadratic)

		if arg_3_0:isInFocus() then
			arg_3_0:dispatchEventToCurrentMenu({
				visible = true,
				name = "match_preview_prompt"
			})
		end
	else
		arg_3_0.RoundNum:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
		arg_3_0.MatchTimeString:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))

		if arg_3_0:isInFocus() then
			arg_3_0:dispatchEventToCurrentMenu({
				visible = false,
				name = "match_preview_prompt"
			})
		end
	end

	arg_3_0.BracketTeam1:Update(1, arg_3_1)
	arg_3_0.BracketTeam2:Update(2, arg_3_1)

	local var_3_3 = TOURNAMENT.GetAdjustedMatchIndex(arg_3_1.roundIndex - 1, arg_3_1.matchIndex - 1)

	arg_3_0.MatchNumButton.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_NUM", var_3_3))

	if arg_3_1.isMyMatch and not arg_3_1.complete then
		if not arg_3_0._playerStatusCreated then
			var_0_0(arg_3_0, teamIndex)
		end

		arg_3_0.TournamentPlayerStatus1:Update(arg_3_1.teams[1], arg_3_1.canSpectate, true)
		arg_3_0.TournamentPlayerStatus2:Update(arg_3_1.teams[2], arg_3_1.canSpectate, true)
	end

	if (not arg_3_1.isMyMatch or arg_3_1.complete) and arg_3_0._playerStatusCreated then
		var_0_1(arg_3_0)
	end

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.teams) do
		if not arg_3_1.complete then
			if arg_3_1.canSpectate then
				if arg_3_0._matchData and arg_3_0._matchData.canSpectate ~= arg_3_1.canSpectate then
					ACTIONS.AnimateSequence(arg_3_0, arg_3_1.isMyMatch and "InProgress" or "NotMyMatchInProgress")
				else
					ACTIONS.AnimateSequence(arg_3_0, "InProgressSnap")
				end
			elseif arg_3_1.isMyMatch then
				if arg_3_0._matchData and arg_3_0._matchData.canSpectate ~= arg_3_1.canSpectate then
					ACTIONS.AnimateSequence(arg_3_0, "MyMatchWaiting")
				else
					ACTIONS.AnimateSequence(arg_3_0, "MyMatchWaitingSnap")
				end
			else
				ACTIONS.AnimateSequence(arg_3_0, "NotMyMatchWaitingSnap")
			end
		end
	end

	arg_3_0.matchIndex = arg_3_1.matchIndex
	arg_3_0.roundIndex = arg_3_1.roundIndex
	arg_3_0._matchData = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.Update = var_0_2
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.bindButton = LUI.UIBindButton.new()

	arg_4_0:addElement(arg_4_0.bindButton)

	local var_4_0 = MenuBuilder.BuildRegisteredType("BracketTeamFinal", {
		controllerIndex = arg_4_1
	})

	var_4_0.id = "BracketTeam1"

	var_4_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -294, _1080p * -70, _1080p * 29, _1080p * 169)
	arg_4_0:addElement(var_4_0)

	arg_4_0.BracketTeam1 = var_4_0

	local var_4_1 = MenuBuilder.BuildRegisteredType("BracketTeamFinal", {
		isLeft = true,
		controllerIndex = arg_4_1
	})

	var_4_1.id = "BracketTeam2"

	var_4_1:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 70, _1080p * 294, _1080p * 29, _1080p * 169)
	arg_4_0:addElement(var_4_1)

	arg_4_0.BracketTeam2 = var_4_1

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		arg_4_0:dispatchEventToCurrentMenu({
			name = "match_preview_prompt",
			visible = arg_4_0._enablePreview
		})
	end)
end

function MatchGroupFinals(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 816 * _1080p, 0, 142 * _1080p)

	var_6_0.id = "MatchGroupFinals"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIText.new()

	var_6_4.id = "RoundNum"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_4:SetAlpha(0, 0)
	var_6_4:setText("", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_4:SetAlignment(LUI.Alignment.Center)
	var_6_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -87, _1080p * -69)
	var_6_0:addElement(var_6_4)

	var_6_0.RoundNum = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "RoundTxt"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_6:SetAlpha(0, 0)
	var_6_6:setText(Engine.CBBHFCGDIC("TOURNAMENT/ROUND"), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Center)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 47, _1080p * -47, _1080p * 71, _1080p * 89)
	var_6_0:addElement(var_6_6)

	var_6_0.RoundTxt = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "MatchTimeRemain"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/REMAIN"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -47, _1080p * 47, _1080p * 114, _1080p * 132)
	var_6_0:addElement(var_6_8)

	var_6_0.MatchTimeRemain = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "MatchTimeString"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_10:SetStartupDelay(1000)
	var_6_10:SetLineHoldTime(400)
	var_6_10:SetAnimMoveTime(2000)
	var_6_10:SetAnimMoveSpeed(50)
	var_6_10:SetEndDelay(1000)
	var_6_10:SetCrossfadeTime(400)
	var_6_10:SetFadeInTime(300)
	var_6_10:SetFadeOutTime(300)
	var_6_10:SetMaxVisibleLines(1)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 98, _1080p * 116)
	var_6_0:addElement(var_6_10)

	var_6_0.MatchTimeString = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "MatchNumButton"

	var_6_12.Text:SetLeft(_1080p * 20, 0)
	var_6_12.Text:setText(ToUpperCase("Match Number"), 0)
	var_6_12.Text:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -294, _1080p * 294, 0, _1080p * 38)
	var_6_0:addElement(var_6_12)

	var_6_0.MatchNumButton = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "StatusDivider"

	var_6_14:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_14:SetAlpha(0, 0)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -33, _1080p * 37, _1080p * 93, _1080p * 95)
	var_6_0:addElement(var_6_14)

	var_6_0.StatusDivider = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "StatusBackerLeft"

	var_6_16:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_6_16:SetAlpha(0.2, 0)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -294, _1080p * -70, _1080p * 171, _1080p * 207)
	var_6_0:addElement(var_6_16)

	var_6_0.StatusBackerLeft = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "StatusBackerRight"

	var_6_18:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_6_18:SetAlpha(0.2, 0)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 70, _1080p * 294, _1080p * 171, _1080p * 207)
	var_6_0:addElement(var_6_18)

	var_6_0.StatusBackerRight = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIStyledText.new()

	var_6_20.id = "Vs"

	var_6_20:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_6_20:setText(Engine.CBBHFCGDIC("TOURNAMENT/VERSUS"), 0)
	var_6_20:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_20:SetAlignment(LUI.Alignment.Center)
	var_6_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -55, _1080p * 59, _1080p * 138, _1080p * 178)
	var_6_0:addElement(var_6_20)

	var_6_0.Vs = var_6_20

	local function var_6_21()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_21

	local function var_6_22()
		return
	end

	var_6_0._sequences.ButtonUp = var_6_22

	local function var_6_23()
		return
	end

	var_6_0._sequences.ButtonOver = var_6_23

	local var_6_24 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DisplayMatchMsg", var_6_24)

	local var_6_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 110
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("DisplayMatchMsg", var_6_25)

	local function var_6_26()
		var_6_8:AnimateSequence("DisplayMatchMsg")
		var_6_10:AnimateSequence("DisplayMatchMsg")
	end

	var_6_0._sequences.DisplayMatchMsg = var_6_26

	local var_6_27 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DisplayMatchTime", var_6_27)

	local var_6_28 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 98
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 116
		}
	}

	var_6_10:RegisterAnimationSequence("DisplayMatchTime", var_6_28)

	local function var_6_29()
		var_6_8:AnimateSequence("DisplayMatchTime")
		var_6_10:AnimateSequence("DisplayMatchTime")
	end

	var_6_0._sequences.DisplayMatchTime = var_6_29

	local var_6_30 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("InProgress", var_6_30)

	local var_6_31 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("InProgress", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("InProgress", var_6_32)

	local function var_6_33()
		var_6_4:AnimateSequence("InProgress")
		var_6_6:AnimateSequence("InProgress")
		var_6_14:AnimateSequence("InProgress")
	end

	var_6_0._sequences.InProgress = var_6_33

	local var_6_34 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("NotMyMatchInProgress", var_6_34)

	local var_6_35 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NotMyMatchInProgress", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("NotMyMatchInProgress", var_6_36)

	local var_6_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("NotMyMatchInProgress", var_6_37)

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("NotMyMatchInProgress", var_6_38)

	local function var_6_39()
		var_6_4:AnimateSequence("NotMyMatchInProgress")
		var_6_6:AnimateSequence("NotMyMatchInProgress")
		var_6_14:AnimateSequence("NotMyMatchInProgress")
		var_6_16:AnimateSequence("NotMyMatchInProgress")
		var_6_18:AnimateSequence("NotMyMatchInProgress")
	end

	var_6_0._sequences.NotMyMatchInProgress = var_6_39

	local var_6_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("InProgressSnap", var_6_40)

	local var_6_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("InProgressSnap", var_6_41)

	local var_6_42 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("InProgressSnap", var_6_42)

	local var_6_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		}
	}

	var_6_16:RegisterAnimationSequence("InProgressSnap", var_6_43)

	local var_6_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		}
	}

	var_6_18:RegisterAnimationSequence("InProgressSnap", var_6_44)

	local function var_6_45()
		var_6_4:AnimateSequence("InProgressSnap")
		var_6_6:AnimateSequence("InProgressSnap")
		var_6_14:AnimateSequence("InProgressSnap")
		var_6_16:AnimateSequence("InProgressSnap")
		var_6_18:AnimateSequence("InProgressSnap")
	end

	var_6_0._sequences.InProgressSnap = var_6_45

	local var_6_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("MyMatchWaiting", var_6_46)

	local var_6_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("MyMatchWaiting", var_6_47)

	local var_6_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("MyMatchWaiting", var_6_48)

	local var_6_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("MyMatchWaiting", var_6_49)

	local var_6_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("MyMatchWaiting", var_6_50)

	local var_6_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 209
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("MyMatchWaiting", var_6_51)

	local var_6_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 209
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("MyMatchWaiting", var_6_52)

	local function var_6_53()
		var_6_4:AnimateSequence("MyMatchWaiting")
		var_6_6:AnimateSequence("MyMatchWaiting")
		var_6_8:AnimateSequence("MyMatchWaiting")
		var_6_10:AnimateSequence("MyMatchWaiting")
		var_6_14:AnimateSequence("MyMatchWaiting")
		var_6_16:AnimateSequence("MyMatchWaiting")
		var_6_18:AnimateSequence("MyMatchWaiting")
	end

	var_6_0._sequences.MyMatchWaiting = var_6_53

	local var_6_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_54)

	local var_6_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_55)

	local var_6_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_56)

	local var_6_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_57)

	local var_6_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_58)

	local var_6_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 209
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_59)

	local var_6_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 209
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("MyMatchWaitingSnap", var_6_60)

	local function var_6_61()
		var_6_4:AnimateSequence("MyMatchWaitingSnap")
		var_6_6:AnimateSequence("MyMatchWaitingSnap")
		var_6_8:AnimateSequence("MyMatchWaitingSnap")
		var_6_10:AnimateSequence("MyMatchWaitingSnap")
		var_6_14:AnimateSequence("MyMatchWaitingSnap")
		var_6_16:AnimateSequence("MyMatchWaitingSnap")
		var_6_18:AnimateSequence("MyMatchWaitingSnap")
	end

	var_6_0._sequences.MyMatchWaitingSnap = var_6_61

	local var_6_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_6_62)

	local var_6_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_6_63)

	local var_6_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_6_64)

	local var_6_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 171
		}
	}

	var_6_16:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_6_65)

	local var_6_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 171
		}
	}

	var_6_18:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_6_66)

	local function var_6_67()
		var_6_4:AnimateSequence("NotMyMatchWaitingSnap")
		var_6_6:AnimateSequence("NotMyMatchWaitingSnap")
		var_6_14:AnimateSequence("NotMyMatchWaitingSnap")
		var_6_16:AnimateSequence("NotMyMatchWaitingSnap")
		var_6_18:AnimateSequence("NotMyMatchWaitingSnap")
	end

	var_6_0._sequences.NotMyMatchWaitingSnap = var_6_67

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MatchGroupFinals", MatchGroupFinals)
LockTable(_M)
