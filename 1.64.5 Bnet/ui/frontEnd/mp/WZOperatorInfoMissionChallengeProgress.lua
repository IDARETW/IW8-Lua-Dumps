module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_2 or type(arg_1_2) ~= "table" or not arg_1_2.selectedIndex then
		assert(false, "You must provide a table of options that include the selected index.")
	end

	local var_1_0 = arg_1_2.selectedIndex
	local var_1_1

	if arg_1_0._mission.objectives and #arg_1_0._mission.objectives > 1 then
		var_1_1 = arg_1_0._mission.objectives[var_1_0]
	else
		var_1_1 = arg_1_0._mission
	end

	arg_1_0._allowNavigation = var_1_1.rewards and #var_1_1.rewards > 1

	arg_1_0.Pips:SetSelected(var_1_0)

	if var_1_0 <= arg_1_0._mission.numObjectivesComplete + 1 then
		if not var_1_1.progress then
			arg_1_0.ProgressBar:SetAlpha(0)
		else
			local var_1_2 = LUI.clamp(var_1_1.amountEarned / var_1_1.amountNeeded, 0, 1)

			arg_1_0.ProgressBar:SetProgress(var_1_2)
		end
	end

	if var_1_1.amountEarned and var_1_1.amountNeeded then
		arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_1.amountEarned, var_1_1.amountNeeded))
	else
		arg_1_0.ProgressDesc:setText("")
	end

	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.challengePipTab)
end

local function var_0_1(arg_2_0)
	if arg_2_0._navigationCallback then
		local var_2_0 = arg_2_0._isKBMInput and arg_2_0._navigationCallback or nil
		local var_2_1 = not arg_2_0._isKBMInput and arg_2_0._navigationCallback or nil

		arg_2_0.BindButton:registerEventHandler("button_left", var_2_0)
		arg_2_0.BindButton:registerEventHandler("button_right", var_2_0)
		arg_2_0.BindButton:registerEventHandler("button_left_trigger", var_2_1)
		arg_2_0.BindButton:registerEventHandler("button_right_trigger", var_2_1)

		local var_2_2 = arg_2_0._isKBMInput and function(arg_3_0, arg_3_1)
			local var_3_0 = arg_3_0:getParent()

			arg_3_1.name = arg_3_0 == var_3_0.LeftArrow and "button_left" or "button_right"

			var_3_0._navigationCallback(var_3_0.BindButton, arg_3_1)
		end or nil

		arg_2_0.LeftArrow:registerEventHandler("button_action", var_2_2)
		arg_2_0.RightArrow:registerEventHandler("button_action", var_2_2)
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	if not arg_4_1 or type(arg_4_1) ~= "table" or not arg_4_1.callback or type(arg_4_1.callback) ~= "function" then
		assert(false, "You must provide a table of options that include a callback property and value of type function.")
	end

	arg_4_0._navigationCallback = arg_4_1.callback

	var_0_1(arg_4_0)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_2 or type(arg_5_2) ~= "table" or not arg_5_2.mission then
		assert(false, "You must provide a table of options that include the mission data.")
	end

	local var_5_0 = arg_5_2.mission
	local var_5_1 = #var_5_0.objectives
	local var_5_2 = var_5_1 > 1

	arg_5_0._mission = var_5_0

	if var_5_2 then
		arg_5_0.Pips:SetActive(true)
		arg_5_0.Pips:Setup(var_5_1, var_5_0.numObjectivesComplete, LUI.Alignment.Center)
	end

	var_0_0(arg_5_0, arg_5_1, {
		selectedIndex = 1
	})
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetData = var_0_3
	arg_6_0.SetupEventhandlers = SetupEventhandlers
	arg_6_0.UpdateObjectiveData = var_0_0
	arg_6_0.SetEventHandler = var_0_2
	arg_6_0.BindButton = LUI.UIBindButton.new()
	arg_6_0.BindButton.id = "BindButton"

	arg_6_0:addElement(arg_6_0.BindButton)

	local function var_6_0(arg_7_0, arg_7_1)
		local var_7_0 = LUI.IsLastInputKeyboardMouse(arg_6_1)

		if var_7_0 then
			ACTIONS.AnimateSequence(arg_7_0, "DisplayKBM")
		else
			ACTIONS.AnimateSequence(arg_7_0, "DisplayGamepad")
		end

		arg_7_0._isKBMInput = var_7_0

		var_0_1(arg_7_0)
	end

	arg_6_0:addAndCallEventHandler("update_input_type", var_6_0)
end

function WZOperatorInfoMissionChallengeProgress(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 72 * _1080p)

	var_8_0.id = "WZOperatorInfoMissionChallengeProgress"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "ProgressBar"

	var_8_4.Overlay:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_8_4.Overlay:SetAlpha(0.5, 0)
	var_8_4.Fill:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 8, _1080p * 26)
	var_8_0:addElement(var_8_4)

	var_8_0.ProgressBar = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIText.new()

	var_8_6.id = "ProgressDesc"

	var_8_6:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_8_6:setText("99/99", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetWordWrap(false)
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 336, _1080p * 8, _1080p * 26)
	var_8_0:addElement(var_8_6)

	var_8_0.ProgressDesc = var_8_6

	local var_8_7
	local var_8_8 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_8_1
	}
	local var_8_9 = MenuBuilder.BuildRegisteredType("IconImage", var_8_8)

	var_8_9.id = "LeftTrigger"

	var_8_9:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_8_9:setImage(RegisterMaterial("button_trigger_left"), 0)
	var_8_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, _1080p * 35, _1080p * 67)
	var_8_0:addElement(var_8_9)

	var_8_0.LeftTrigger = var_8_9

	local var_8_10
	local var_8_11 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_8_1
	}
	local var_8_12 = MenuBuilder.BuildRegisteredType("IconImage", var_8_11)

	var_8_12.id = "RightTrigger"

	var_8_12:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_8_12:setImage(RegisterMaterial("button_trigger_right"), 0)
	var_8_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, _1080p * 35, _1080p * 67)
	var_8_0:addElement(var_8_12)

	var_8_0.RightTrigger = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "LeftArrow"

	var_8_14:SetZRotation(90, 0)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, _1080p * 1, _1080p * 33)
	var_8_0:addElement(var_8_14)

	var_8_0.LeftArrow = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "RightArrow"

	var_8_16:SetZRotation(-90, 0)
	var_8_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, _1080p * 1, _1080p * 33)
	var_8_0:addElement(var_8_16)

	var_8_0.RightArrow = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "Pips"

	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 14, _1080p * 51, _1080p * 55)
	var_8_0:addElement(var_8_18)

	var_8_0.Pips = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "Lock"

	var_8_20:SetAlpha(0, 0)
	var_8_20:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 62, _1080p * 1, _1080p * 33)
	var_8_0:addElement(var_8_20)

	var_8_0.Lock = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIStyledText.new()

	var_8_22.id = "LockLabel"

	var_8_22:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_8_22:SetAlpha(0, 0)
	var_8_22:setText("", 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_22:SetWordWrap(false)
	var_8_22:SetAlignment(LUI.Alignment.Left)
	var_8_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 52, _1080p * 466, _1080p * 7, _1080p * 27)
	var_8_0:addElement(var_8_22)

	var_8_0.LockLabel = var_8_22

	local function var_8_23()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_8_4:RegisterAnimationSequence("DisplayKBM", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 368
		}
	}

	var_8_6:RegisterAnimationSequence("DisplayKBM", var_8_26)

	local var_8_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_9:RegisterAnimationSequence("DisplayKBM", var_8_27)

	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("DisplayKBM", var_8_28)

	local var_8_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("DisplayKBM", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("DisplayKBM", var_8_30)

	local function var_8_31()
		var_8_4:AnimateSequence("DisplayKBM")
		var_8_6:AnimateSequence("DisplayKBM")
		var_8_9:AnimateSequence("DisplayKBM")
		var_8_12:AnimateSequence("DisplayKBM")
		var_8_14:AnimateSequence("DisplayKBM")
		var_8_16:AnimateSequence("DisplayKBM")
	end

	var_8_0._sequences.DisplayKBM = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_8_4:RegisterAnimationSequence("DisplayGamepad", var_8_33)

	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 336
		}
	}

	var_8_6:RegisterAnimationSequence("DisplayGamepad", var_8_34)

	local var_8_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_9:RegisterAnimationSequence("DisplayGamepad", var_8_35)

	local var_8_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("DisplayGamepad", var_8_36)

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("DisplayGamepad", var_8_37)

	local var_8_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("DisplayGamepad", var_8_38)

	local function var_8_39()
		var_8_4:AnimateSequence("DisplayGamepad")
		var_8_6:AnimateSequence("DisplayGamepad")
		var_8_9:AnimateSequence("DisplayGamepad")
		var_8_12:AnimateSequence("DisplayGamepad")
		var_8_14:AnimateSequence("DisplayGamepad")
		var_8_16:AnimateSequence("DisplayGamepad")
	end

	var_8_0._sequences.DisplayGamepad = var_8_39

	local var_8_40
	local var_8_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Locked", var_8_41)

	local var_8_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Locked", var_8_42)

	local var_8_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Locked", var_8_43)

	local var_8_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 466
		}
	}

	var_8_22:RegisterAnimationSequence("Locked", var_8_44)

	local function var_8_45()
		var_8_4:AnimateSequence("Locked")
		var_8_6:AnimateSequence("Locked")
		var_8_20:AnimateSequence("Locked")
		var_8_22:AnimateSequence("Locked")
	end

	var_8_0._sequences.Locked = var_8_45

	local var_8_46
	local var_8_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Unlocked", var_8_47)

	local var_8_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Unlocked", var_8_48)

	local var_8_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Unlocked", var_8_49)

	local var_8_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("Unlocked", var_8_50)

	local function var_8_51()
		var_8_4:AnimateSequence("Unlocked")
		var_8_6:AnimateSequence("Unlocked")
		var_8_20:AnimateSequence("Unlocked")
		var_8_22:AnimateSequence("Unlocked")
	end

	var_8_0._sequences.Unlocked = var_8_51

	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WZOperatorInfoMissionChallengeProgress", WZOperatorInfoMissionChallengeProgress)
LockTable(_M)
