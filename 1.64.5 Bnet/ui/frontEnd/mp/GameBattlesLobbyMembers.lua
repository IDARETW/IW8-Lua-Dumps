module(..., package.seeall)

local function var_0_0()
	local var_1_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")
	local var_1_1 = LUI.DataSourceFromList.new(var_1_0)

	var_1_1.MakeDataSourceAtIndex = Lobby.GetLobbyMemberDataSourceAtIndex("alwaysLoaded.activeParty.members")

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.GameBattlesWinCount:SetMatchNumber(arg_2_1)
end

function PostLoadFunc(arg_3_0)
	arg_3_0.SetMatchNumber = var_0_1

	local var_3_0 = var_0_0()

	arg_3_0.List:SetGridDataSource(var_3_0)
end

function GameBattlesLobbyMembers(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 850 * _1080p)

	var_4_0.id = "GameBattlesLobbyMembers"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIStyledText.new()

	var_4_4.id = "TeamName"

	var_4_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_4:SetStartupDelay(1000)
	var_4_4:SetLineHoldTime(400)
	var_4_4:SetAnimMoveTime(600)
	var_4_4:SetAnimMoveSpeed(50)
	var_4_4:SetEndDelay(1000)
	var_4_4:SetCrossfadeTime(400)
	var_4_4:SetFadeInTime(300)
	var_4_4:SetFadeOutTime(300)
	var_4_4:SetMaxVisibleLines(1)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 349, _1080p * 28, _1080p * 72)
	var_4_0:addElement(var_4_4)

	var_4_0.TeamName = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GameBattlesWinCount", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GameBattlesWinCount"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 213, _1080p * 349, _1080p * 70, _1080p * 100)
	var_4_0:addElement(var_4_6)

	var_4_0.GameBattlesWinCount = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "TeamLogo"

	var_4_8:setImage(RegisterMaterial("icon_faction_west_enemy_small"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 349, _1080p * 517, _1080p * -16, _1080p * 156)
	var_4_0:addElement(var_4_8)

	var_4_0.TeamLogo = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Divider"

	var_4_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_10:SetAlpha(0.6, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 544, _1080p * 545)
	var_4_0:addElement(var_4_10)

	var_4_0.Divider = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "StatusLabel"

	var_4_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 9, _1080p * 117, _1080p * 93, _1080p * 113)
	var_4_0:addElement(var_4_12)

	var_4_0.StatusLabel = var_4_12

	local var_4_13
	local var_4_14 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameBattlesLobbyMember", {
				controllerIndex = var_4_1
			})
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_15 = LUI.UIDataSourceGrid.new(var_4_14)

	var_4_15.id = "List"

	var_4_15:setUseStencil(false)
	var_4_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -500, 0, _1080p * 549, _1080p * 989)
	var_4_0:addElement(var_4_15)

	var_4_0.List = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_16

	local var_4_17
	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9.25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 590.75
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
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

	var_4_4:RegisterAnimationSequence("CODCasters", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("CODCasters", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("CODCasters", var_4_20)

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 295
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_15:RegisterAnimationSequence("CODCasters", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("CODCasters")
		var_4_10:AnimateSequence("CODCasters")
		var_4_12:AnimateSequence("CODCasters")
		var_4_15:AnimateSequence("CODCasters")
	end

	var_4_0._sequences.CODCasters = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 538
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
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -504
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -155
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("HasEnteredMatchLeftTeam", var_4_24)

	local var_4_25 = {
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -291
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -155
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasEnteredMatchLeftTeam", var_4_25)

	local var_4_26 = {
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
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -156
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("HasEnteredMatchLeftTeam", var_4_26)

	local var_4_27 = {
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasEnteredMatchLeftTeam", var_4_27)

	local function var_4_28()
		var_4_4:AnimateSequence("HasEnteredMatchLeftTeam")
		var_4_6:AnimateSequence("HasEnteredMatchLeftTeam")
		var_4_8:AnimateSequence("HasEnteredMatchLeftTeam")
		var_4_12:AnimateSequence("HasEnteredMatchLeftTeam")
	end

	var_4_0._sequences.HasEnteredMatchLeftTeam = var_4_28

	local var_4_29
	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
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

	var_4_4:RegisterAnimationSequence("HasNotJoinedMatchLeftTeam", var_4_30)

	local var_4_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasNotJoinedMatchLeftTeam", var_4_31)

	local var_4_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
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

	var_4_8:RegisterAnimationSequence("HasNotJoinedMatchLeftTeam", var_4_32)

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasNotJoinedMatchLeftTeam", var_4_33)

	local function var_4_34()
		var_4_4:AnimateSequence("HasNotJoinedMatchLeftTeam")
		var_4_6:AnimateSequence("HasNotJoinedMatchLeftTeam")
		var_4_8:AnimateSequence("HasNotJoinedMatchLeftTeam")
		var_4_12:AnimateSequence("HasNotJoinedMatchLeftTeam")
	end

	var_4_0._sequences.HasNotJoinedMatchLeftTeam = var_4_34

	local var_4_35
	local var_4_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
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

	var_4_4:RegisterAnimationSequence("HasNotJoinedMatchRightTeam", var_4_36)

	local var_4_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasNotJoinedMatchRightTeam", var_4_37)

	local var_4_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		}
	}

	var_4_8:RegisterAnimationSequence("HasNotJoinedMatchRightTeam", var_4_38)

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasNotJoinedMatchRightTeam", var_4_39)

	local function var_4_40()
		var_4_4:AnimateSequence("HasNotJoinedMatchRightTeam")
		var_4_6:AnimateSequence("HasNotJoinedMatchRightTeam")
		var_4_8:AnimateSequence("HasNotJoinedMatchRightTeam")
		var_4_12:AnimateSequence("HasNotJoinedMatchRightTeam")
	end

	var_4_0._sequences.HasNotJoinedMatchRightTeam = var_4_40

	local var_4_41
	local var_4_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -500
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 538
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
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 504
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("HasEnteredMatchRightTeam", var_4_42)

	local var_4_43 = {
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 291
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasEnteredMatchRightTeam", var_4_43)

	local var_4_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 156
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		}
	}

	var_4_8:RegisterAnimationSequence("HasEnteredMatchRightTeam", var_4_44)

	local var_4_45 = {
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasEnteredMatchRightTeam", var_4_45)

	local function var_4_46()
		var_4_4:AnimateSequence("HasEnteredMatchRightTeam")
		var_4_6:AnimateSequence("HasEnteredMatchRightTeam")
		var_4_8:AnimateSequence("HasEnteredMatchRightTeam")
		var_4_12:AnimateSequence("HasEnteredMatchRightTeam")
	end

	var_4_0._sequences.HasEnteredMatchRightTeam = var_4_46

	local var_4_47
	local var_4_48 = {
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -504
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -155
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 538
		},
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 280,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("HasLeftMatchLeftTeam", var_4_48)

	local var_4_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -291
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -155
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasLeftMatchLeftTeam", var_4_49)

	local var_4_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
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
			duration = 320,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		}
	}

	var_4_8:RegisterAnimationSequence("HasLeftMatchLeftTeam", var_4_50)

	local var_4_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasLeftMatchLeftTeam", var_4_51)

	local function var_4_52()
		var_4_4:AnimateSequence("HasLeftMatchLeftTeam")
		var_4_6:AnimateSequence("HasLeftMatchLeftTeam")
		var_4_8:AnimateSequence("HasLeftMatchLeftTeam")
		var_4_12:AnimateSequence("HasLeftMatchLeftTeam")
	end

	var_4_0._sequences.HasLeftMatchLeftTeam = var_4_52

	local var_4_53
	local var_4_54 = {
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 504
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -500
		},
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 538
		},
		{
			value = 1,
			duration = 280,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("HasLeftMatchRightTeam", var_4_54)

	local var_4_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 291
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasLeftMatchRightTeam", var_4_55)

	local var_4_56 = {
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 156
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 280,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		}
	}

	var_4_8:RegisterAnimationSequence("HasLeftMatchRightTeam", var_4_56)

	local var_4_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasLeftMatchRightTeam", var_4_57)

	local function var_4_58()
		var_4_4:AnimateSequence("HasLeftMatchRightTeam")
		var_4_6:AnimateSequence("HasLeftMatchRightTeam")
		var_4_8:AnimateSequence("HasLeftMatchRightTeam")
		var_4_12:AnimateSequence("HasLeftMatchRightTeam")
	end

	var_4_0._sequences.HasLeftMatchRightTeam = var_4_58

	local var_4_59
	local var_4_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -502
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -153
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
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

	var_4_4:RegisterAnimationSequence("HasJoinedMatchLeftTeam", var_4_60)

	local var_4_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -157
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

	var_4_6:RegisterAnimationSequence("HasJoinedMatchLeftTeam", var_4_61)

	local var_4_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
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

	var_4_8:RegisterAnimationSequence("HasJoinedMatchLeftTeam", var_4_62)

	local var_4_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasJoinedMatchLeftTeam", var_4_63)

	local function var_4_64()
		var_4_4:AnimateSequence("HasJoinedMatchLeftTeam")
		var_4_6:AnimateSequence("HasJoinedMatchLeftTeam")
		var_4_8:AnimateSequence("HasJoinedMatchLeftTeam")
		var_4_12:AnimateSequence("HasJoinedMatchLeftTeam")
	end

	var_4_0._sequences.HasJoinedMatchLeftTeam = var_4_64

	local var_4_65
	local var_4_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 504
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		}
	}

	var_4_4:RegisterAnimationSequence("HasJoinedMatchRightTeam", var_4_66)

	local var_4_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 291
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		}
	}

	var_4_6:RegisterAnimationSequence("HasJoinedMatchRightTeam", var_4_67)

	local var_4_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 156
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HasJoinedMatchRightTeam", var_4_68)

	local var_4_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasJoinedMatchRightTeam", var_4_69)

	local function var_4_70()
		var_4_4:AnimateSequence("HasJoinedMatchRightTeam")
		var_4_6:AnimateSequence("HasJoinedMatchRightTeam")
		var_4_8:AnimateSequence("HasJoinedMatchRightTeam")
		var_4_12:AnimateSequence("HasJoinedMatchRightTeam")
	end

	var_4_0._sequences.HasJoinedMatchRightTeam = var_4_70

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GameBattlesLobbyMembers", GameBattlesLobbyMembers)
LockTable(_M)
