module(..., package.seeall)

function MapVoteTitle(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 24 * _1080p)

	var_1_0.id = "MapVoteTitle"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "TitleBackground"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 45)
	var_1_0:addElement(var_1_4)

	var_1_0.TitleBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "VoteTitle"

	var_1_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("MENU/VOTE_TITLE"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_6:SetDecodeLetterLength(50)
	var_1_6:SetDecodeMaxRandChars(5)
	var_1_6:SetDecodeUpdatesPerLetter(10)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 204, _1080p * -8, _1080p * 10)
	var_1_0:addElement(var_1_6)

	var_1_0.VoteTitle = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "VoteTimeText"

	var_1_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("MENU/VOTE_TIME"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Right)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetDecodeLetterLength(50)
	var_1_8:SetDecodeMaxRandChars(5)
	var_1_8:SetDecodeUpdatesPerLetter(10)
	var_1_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -296, _1080p * -78, _1080p * -8, _1080p * 10)
	var_1_0:addElement(var_1_8)

	var_1_0.VoteTimeText = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "LockCountdown"

	var_1_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Right)
	var_1_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -78, _1080p * -5, _1080p * -8, _1080p * 10)

	local function var_1_11()
		local var_2_0 = DataSources.frontEnd.lobby.votingTime:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_10:setEndTime(var_2_0)
		end
	end

	local var_1_12 = DataSources.frontEnd.lobby.votingTime

	var_1_10:SubscribeToModel(var_1_12:GetModel(var_1_1), var_1_11)
	var_1_0:addElement(var_1_10)

	var_1_0.LockCountdown = var_1_10

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_8:RegisterAnimationSequence("VoteComplete", var_1_14)

	local var_1_15 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_10:RegisterAnimationSequence("VoteComplete", var_1_15)

	local function var_1_16()
		var_1_8:AnimateSequence("VoteComplete")
		var_1_10:AnimateSequence("VoteComplete")
	end

	var_1_0._sequences.VoteComplete = var_1_16

	local var_1_17 = {
		{
			value = 11711405,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		},
		{
			value = 11711405,
			duration = 490,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_10:RegisterAnimationSequence("LowTime", var_1_17)

	local function var_1_18()
		var_1_10:AnimateLoop("LowTime")
	end

	var_1_0._sequences.LowTime = var_1_18

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_8:RegisterAnimationSequence("VoteStart", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_10:RegisterAnimationSequence("VoteStart", var_1_20)

	local function var_1_21()
		var_1_8:AnimateSequence("VoteStart")
		var_1_10:AnimateSequence("VoteStart")
	end

	var_1_0._sequences.VoteStart = var_1_21

	return var_1_0
end

MenuBuilder.registerType("MapVoteTitle", MapVoteTitle)
LockTable(_M)
