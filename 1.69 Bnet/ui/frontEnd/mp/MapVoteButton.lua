module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MapName)

	local var_1_0 = arg_1_0.MapName

	var_1_0:SetShadowUOffset(-0.001)
	var_1_0:SetShadowVOffset(-0.001)
	assert(arg_1_0.GameTypeName)

	local var_1_1 = arg_1_0.GameTypeName

	var_1_1:SetShadowUOffset(-0.001)
	var_1_1:SetShadowVOffset(-0.001)
	assert(arg_1_0.VoteLabel)

	local var_1_2 = arg_1_0.VoteLabel

	var_1_2:SetShadowUOffset(-0.001)
	var_1_2:SetShadowVOffset(-0.001)
	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		assert(arg_2_1.controller)

		local var_2_0 = arg_2_0:GetDataSource().refIndex:GetValue(arg_2_1.controller)

		if not Lobby.IsVotingFinished() then
			Lobby.OpenAfterActionReport(arg_2_0, arg_1_1, var_2_0 + 1)
		end
	end)
end

function MapVoteButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p)

	var_3_0.id = "MapVoteButton"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:setUseStencil(true)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("MapVoteButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "MapVoteButtonBackground"

	var_3_4.MapBackground:SetVMax(1, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_3_5()
		local var_4_0 = var_3_0:GetDataSource().mapImage:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_4.MapBackground:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	var_3_4:SubscribeToModelThroughElement(var_3_0, "mapImage", var_3_5)
	var_3_0:addElement(var_3_4)

	var_3_0.MapVoteButtonBackground = var_3_4

	local var_3_6
	local var_3_7 = LUI.UIStyledText.new()

	var_3_7.id = "GameTypeName"

	var_3_7:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_7:SetAlignment(LUI.Alignment.Left)
	var_3_7:SetStartupDelay(1000)
	var_3_7:SetLineHoldTime(400)
	var_3_7:SetAnimMoveTime(150)
	var_3_7:SetEndDelay(1000)
	var_3_7:SetCrossfadeTime(400)
	var_3_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_7:SetMaxVisibleLines(1)
	var_3_7:SetShadowMinDistance(-0.2, 0)
	var_3_7:SetShadowMaxDistance(0.2, 0)
	var_3_7:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_3_7:SetOutlineRGBFromInt(0, 0)
	var_3_7:SetDecodeLetterLength(50)
	var_3_7:SetDecodeMaxRandChars(5)
	var_3_7:SetDecodeUpdatesPerLetter(10)
	var_3_7:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -10, _1080p * 31, _1080p * 49)

	local function var_3_8()
		local var_5_0 = var_3_0:GetDataSource().modeName:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_7:setText(ToUpperCase(var_5_0), 0)
		end
	end

	var_3_7:SubscribeToModelThroughElement(var_3_0, "modeName", var_3_8)
	var_3_0:addElement(var_3_7)

	var_3_0.GameTypeName = var_3_7

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "MapName"

	var_3_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetStartupDelay(1000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(150)
	var_3_10:SetEndDelay(1000)
	var_3_10:SetCrossfadeTime(400)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetShadowMinDistance(-0.2, 0)
	var_3_10:SetShadowMaxDistance(0.2, 0)
	var_3_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_3_10:SetOutlineRGBFromInt(0, 0)
	var_3_10:SetDecodeLetterLength(50)
	var_3_10:SetDecodeMaxRandChars(5)
	var_3_10:SetDecodeUpdatesPerLetter(10)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -10, _1080p * 9, _1080p * 27)

	local function var_3_11()
		local var_6_0 = var_3_0:GetDataSource().mapName:GetValue(var_3_1)

		if var_6_0 ~= nil then
			var_3_10:setText(ToUpperCase(var_6_0), 0)
		end
	end

	var_3_10:SubscribeToModelThroughElement(var_3_0, "mapName", var_3_11)
	var_3_0:addElement(var_3_10)

	var_3_0.MapName = var_3_10

	local var_3_12
	local var_3_13 = LUI.UIStyledText.new()

	var_3_13.id = "VoteLabel"

	var_3_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_13:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VOTES")), 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_13:SetAlignment(LUI.Alignment.Right)
	var_3_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_13:SetShadowMinDistance(-0.2, 0)
	var_3_13:SetShadowMaxDistance(0.2, 0)
	var_3_13:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_3_13:SetOutlineRGBFromInt(0, 0)
	var_3_13:SetDecodeLetterLength(50)
	var_3_13:SetDecodeMaxRandChars(5)
	var_3_13:SetDecodeUpdatesPerLetter(10)
	var_3_13:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -197, _1080p * -44, _1080p * -24, _1080p * -6)
	var_3_0:addElement(var_3_13)

	var_3_0.VoteLabel = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIText.new()

	var_3_15.id = "VoteCount"

	var_3_15:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_15:SetAlignment(LUI.Alignment.Center)
	var_3_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -41, _1080p * -3, _1080p * -24, _1080p * -6)

	local function var_3_16()
		local var_7_0 = var_3_0:GetDataSource().votes:GetValue(var_3_1)

		if var_7_0 ~= nil then
			var_3_15:setText(var_7_0, 0)
		end
	end

	var_3_15:SubscribeToModelThroughElement(var_3_0, "votes", var_3_16)
	var_3_0:addElement(var_3_15)

	var_3_0.VoteCount = var_3_15

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_7:RegisterAnimationSequence("VoteComplete", var_3_18)

	local var_3_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_10:RegisterAnimationSequence("VoteComplete", var_3_19)

	local var_3_20 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_13:RegisterAnimationSequence("VoteComplete", var_3_20)

	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_15:RegisterAnimationSequence("VoteComplete", var_3_21)

	local function var_3_22()
		var_3_7:AnimateSequence("VoteComplete")
		var_3_10:AnimateSequence("VoteComplete")
		var_3_13:AnimateSequence("VoteComplete")
		var_3_15:AnimateSequence("VoteComplete")
	end

	var_3_0._sequences.VoteComplete = var_3_22

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.normal,
			easing = LUI.EASING.inCubic
		}
	}

	var_3_7:RegisterAnimationSequence("ButtonOver", var_3_23)

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.normal,
			easing = LUI.EASING.inCubic
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOver", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_13:RegisterAnimationSequence("ButtonOver", var_3_25)

	local function var_3_26()
		var_3_7:AnimateSequence("ButtonOver")
		var_3_10:AnimateSequence("ButtonOver")
		var_3_13:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_26

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_3_7:RegisterAnimationSequence("ButtonUp", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonUp", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_3_13:RegisterAnimationSequence("ButtonUp", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonUp", var_3_30)

	local function var_3_31()
		var_3_7:AnimateSequence("ButtonUp")
		var_3_10:AnimateSequence("ButtonUp")
		var_3_13:AnimateSequence("ButtonUp")
		var_3_15:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_31

	local var_3_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_7:RegisterAnimationSequence("VoteStart", var_3_32)

	local var_3_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_10:RegisterAnimationSequence("VoteStart", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_13:RegisterAnimationSequence("VoteStart", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_15:RegisterAnimationSequence("VoteStart", var_3_35)

	local function var_3_36()
		var_3_7:AnimateSequence("VoteStart")
		var_3_10:AnimateSequence("VoteStart")
		var_3_13:AnimateSequence("VoteStart")
		var_3_15:AnimateSequence("VoteStart")
	end

	var_3_0._sequences.VoteStart = var_3_36

	var_3_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)

	local function var_3_37()
		if DataSources.frontEnd.lobby.votingComplete:GetValue(var_3_1) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue(var_3_1) == true then
			ACTIONS.AnimateSequence(var_3_0, "VoteComplete")
		end

		if DataSources.frontEnd.lobby.votingComplete:GetValue(var_3_1) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue(var_3_1) == false then
			ACTIONS.AnimateSequence(var_3_0, "VoteStart")
		end
	end

	local var_3_38 = DataSources.frontEnd.lobby.votingComplete

	var_3_0:SubscribeToModel(var_3_38:GetModel(var_3_1), var_3_37)
	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MapVoteButton", MapVoteButton)
LockTable(_M)
