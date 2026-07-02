module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.TrackNumber:setText(Engine.CBBHFCGDIC("LUA_MENU/TRACK_NUMBER", arg_1_1.index, arg_1_1.total))
	arg_1_0.SongName:setText(Engine.CBBHFCGDIC(arg_1_1.songName))
	arg_1_0.PackName:setText(Engine.CBBHFCGDIC(arg_1_1.packName))
	ACTIONS.AnimateSequence(arg_1_0, "FadeIn")

	arg_1_0:Wait(2000).onComplete = function()
		if arg_1_1.menu._currentTrackShownIndex == arg_1_1.index then
			arg_1_1.menu:ShowNextTrack(arg_1_1.packName)
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.SetData = var_0_0
end

function VehicleTrackList(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 524 * _1080p, 0, 100 * _1080p)

	var_4_0.id = "VehicleTrackList"
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

	var_4_4.id = "SongName"

	var_4_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_4:SetWordWrap(false)
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_4:SetStartupDelay(2000)
	var_4_4:SetLineHoldTime(400)
	var_4_4:SetAnimMoveTime(1000)
	var_4_4:SetAnimMoveSpeed(50)
	var_4_4:SetEndDelay(2000)
	var_4_4:SetCrossfadeTime(400)
	var_4_4:SetFadeInTime(300)
	var_4_4:SetFadeOutTime(300)
	var_4_4:SetMaxVisibleLines(1)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 425, _1080p * 45, _1080p * 69)
	var_4_0:addElement(var_4_4)

	var_4_0.SongName = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "PackName"

	var_4_6:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetStartupDelay(2000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(150)
	var_4_6:SetAnimMoveSpeed(50)
	var_4_6:SetEndDelay(2000)
	var_4_6:SetCrossfadeTime(400)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 425, _1080p * 69, _1080p * 93)
	var_4_0:addElement(var_4_6)

	var_4_0.PackName = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "TrackNumber"

	var_4_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 425, _1080p * 9, _1080p * 33)
	var_4_0:addElement(var_4_8)

	var_4_0.TrackNumber = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("FadeOut", var_4_11)

	local var_4_12 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("FadeOut", var_4_12)

	local var_4_13 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("FadeOut", var_4_13)

	local function var_4_14()
		var_4_4:AnimateSequence("FadeOut")
		var_4_6:AnimateSequence("FadeOut")
		var_4_8:AnimateSequence("FadeOut")
	end

	var_4_0._sequences.FadeOut = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("FadeIn", var_4_16)

	local var_4_17 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("FadeIn", var_4_17)

	local var_4_18 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("FadeIn", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("FadeIn")
		var_4_6:AnimateSequence("FadeIn")
		var_4_8:AnimateSequence("FadeIn")
	end

	var_4_0._sequences.FadeIn = var_4_19

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("VehicleTrackList", VehicleTrackList)
LockTable(_M)
