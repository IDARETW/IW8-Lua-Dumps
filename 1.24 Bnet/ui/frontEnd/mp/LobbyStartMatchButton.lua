module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.Status:getText()
	local var_1_1 = Lobby.GetStatusString(arg_1_1)

	if #var_1_1 == 0 then
		if Lobby.BGIADHIHAG() then
			var_1_1 = Engine.CBBHFCGDIC("MENU/START_MATCH")
		else
			var_1_1 = Engine.CBBHFCGDIC("MENU/WAITING_FOR_HOST")
		end
	end

	if var_1_1 ~= var_1_0 then
		arg_1_0.Status:setText(var_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateStatus = var_0_0
end

function LobbyStartMatchButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "LobbyStartMatchButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Status"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(1000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(2000)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(1000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 230, _1080p * 6, _1080p * 24)
	var_3_0:addElement(var_3_6)

	var_3_0.Status = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("FrameCorners", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "FrameCorners"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.brackets, 0)
	var_3_8:SetAlpha(0.7, 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_3_0:addElement(var_3_8)

	var_3_0.FrameCorners = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Lock"

	var_3_10:SetAlpha(0, 0)
	var_3_10:setImage(RegisterMaterial("cp_wepbuild_lock"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 112, _1080p * 137, _1080p * -12, _1080p * 13)
	var_3_0:addElement(var_3_10)

	var_3_0.Lock = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Foreground"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_12:SetAlpha(0.4, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_3_0:addElement(var_3_12)

	var_3_0.Foreground = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "HighlightTop"

	var_3_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * 7)
	var_3_0:addElement(var_3_14)

	var_3_0.HighlightTop = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "HighlighBottom"

	var_3_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_16:SetAlpha(0, 0)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 23, _1080p * 27)
	var_3_0:addElement(var_3_16)

	var_3_0.HighlighBottom = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOver", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonOver", var_3_19)

	local var_3_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonOver", var_3_20)

	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonOver", var_3_21)

	local function var_3_22()
		var_3_10:AnimateSequence("ButtonOver")
		var_3_12:AnimateSequence("ButtonOver")
		var_3_14:AnimateSequence("ButtonOver")
		var_3_16:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_22

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonUp", var_3_23)

	local var_3_24 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonUp", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonUp", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonUp", var_3_26)

	local function var_3_27()
		var_3_10:AnimateSequence("ButtonUp")
		var_3_12:AnimateSequence("ButtonUp")
		var_3_14:AnimateSequence("ButtonUp")
		var_3_16:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_27

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOverDisabled", var_3_28)

	local var_3_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOverDisabled", var_3_29)

	local var_3_30 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonOverDisabled", var_3_30)

	local var_3_31 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonOverDisabled", var_3_31)

	local var_3_32 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonOverDisabled", var_3_32)

	local function var_3_33()
		var_3_6:AnimateSequence("ButtonOverDisabled")
		var_3_10:AnimateSequence("ButtonOverDisabled")
		var_3_12:AnimateSequence("ButtonOverDisabled")
		var_3_14:AnimateSequence("ButtonOverDisabled")
		var_3_16:AnimateSequence("ButtonOverDisabled")
	end

	var_3_0._sequences.ButtonOverDisabled = var_3_33

	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUpDisabled", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonUpDisabled", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonUpDisabled", var_3_36)

	local var_3_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonUpDisabled", var_3_37)

	local function var_3_38()
		var_3_6:AnimateSequence("ButtonUpDisabled")
		var_3_12:AnimateSequence("ButtonUpDisabled")
		var_3_14:AnimateSequence("ButtonUpDisabled")
		var_3_16:AnimateSequence("ButtonUpDisabled")
	end

	var_3_0._sequences.ButtonUpDisabled = var_3_38

	var_3_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUpDisabled")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOverDisabled")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyStartMatchButton", LobbyStartMatchButton)
LockTable(_M)
