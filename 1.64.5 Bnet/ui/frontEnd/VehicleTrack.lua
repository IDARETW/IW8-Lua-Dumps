module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.SongName:setText(Engine.CBBHFCGDIC(arg_1_1.name))
	arg_1_0.PackName:setText(Engine.CBBHFCGDIC(arg_1_1.packName))

	arg_1_0._alias = arg_1_1.alias
	arg_1_0._ref = arg_1_1.ref
	arg_1_0._audioVFX = arg_1_2
	arg_1_0._index = arg_1_1.index
end

local function var_0_1(arg_2_0)
	if arg_2_0._soundID then
		Engine.EAGBECEBGA(arg_2_0._soundID)

		arg_2_0._soundID = nil

		if arg_2_0._audioVFX then
			arg_2_0._audioVFX:setImage(RegisterMaterial("ui_waveform_idle"))
		end
	end
end

local function var_0_2(arg_3_0)
	if arg_3_0._alias then
		if not (arg_3_0._soundID and Engine.CHFEJIG(arg_3_0._soundID)) then
			arg_3_0._soundID = Engine.BJDBIAGIDA(arg_3_0._alias)
		end

		if arg_3_0._audioVFX then
			arg_3_0._audioVFX:setImage(RegisterMaterial("ui_waveform_active"))
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.UpdateData = var_0_0

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		arg_5_0:dispatchEventToParent({
			name = "track_button_over",
			trackIndex = arg_4_0._index
		})
	end)
	arg_4_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		var_0_2(arg_4_0)
	end)
	arg_4_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		var_0_1(arg_4_0)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
	end)
end

function VehicleTrack(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 50 * _1080p)

	var_8_0.id = "VehicleTrack"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Highlight"

	var_8_4:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_8_4:SetAlpha(0.1, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 50)
	var_8_0:addElement(var_8_4)

	var_8_0.Highlight = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "SongName"

	var_8_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_8_6:setText("", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetWordWrap(false)
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(2000)
	var_8_6:SetLineHoldTime(400)
	var_8_6:SetAnimMoveTime(1000)
	var_8_6:SetAnimMoveSpeed(50)
	var_8_6:SetEndDelay(2000)
	var_8_6:SetCrossfadeTime(400)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 335, 0, _1080p * 24)
	var_8_0:addElement(var_8_6)

	var_8_0.SongName = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "PackName"

	var_8_8:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_8_8:setText("", 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetStartupDelay(2000)
	var_8_8:SetLineHoldTime(400)
	var_8_8:SetAnimMoveTime(1000)
	var_8_8:SetAnimMoveSpeed(50)
	var_8_8:SetEndDelay(2000)
	var_8_8:SetCrossfadeTime(400)
	var_8_8:SetFadeInTime(300)
	var_8_8:SetFadeOutTime(300)
	var_8_8:SetMaxVisibleLines(1)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 335, _1080p * 25, _1080p * 49)
	var_8_0:addElement(var_8_8)

	var_8_0.PackName = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10
	local var_8_11 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_11)

	local var_8_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_12)

	local var_8_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_13)

	local function var_8_14()
		var_8_4:AnimateSequence("ButtonOver")
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_14

	local var_8_15
	local var_8_16 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUp", var_8_16)

	local var_8_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_17)

	local var_8_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_18)

	local function var_8_19()
		var_8_4:AnimateSequence("ButtonUp")
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_19

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("VehicleTrack", VehicleTrack)
LockTable(_M)
