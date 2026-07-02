module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.Title:setText(Engine.CBBHFCGDIC("CHALLENGE/WEEK_N", arg_1_3))

	if arg_1_2.locked then
		arg_1_0:SetButtonDisabled(true)

		arg_1_0._disabled = true

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpDisabled")
	else
		arg_1_0:SetButtonDisabled(false)

		arg_1_0._disabled = false

		local var_1_0 = 0

		if Engine.CFHBIHABCB(arg_1_0._controllerIndex) then
			arg_1_0._coreChallenges = arg_1_2[Challenge.Type.WEEKLY]
			var_1_0 = Challenge.GetChallengeCompletionStatus(arg_1_0._coreChallenges)
		else
			arg_1_0._coreChallenges = {}
		end

		arg_1_0._brChallenges = arg_1_2[Challenge.Type.BR_WEEKLY]

		local var_1_1 = var_1_0 + Challenge.GetChallengeCompletionStatus(arg_1_0._brChallenges)
		local var_1_2 = var_1_1 / (#arg_1_0._coreChallenges + #arg_1_0._brChallenges)

		arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_1, #arg_1_0._coreChallenges + #arg_1_0._brChallenges))
		arg_1_0.ProgressBar:SetProgress(var_1_2, 0)
		arg_1_0.CheckBox:SetValue(var_1_2 == 1)
		ACTIONS.AnimateSequence(arg_1_0, var_1_2 == 1 and "Complete" or "Incomplete")
	end

	arg_1_0.weekChallenges = arg_1_2
	arg_1_0.menu = arg_1_1
	arg_1_0._id = arg_1_3
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
	arg_2_0._disabled = false
	arg_2_0._id = 0
	arg_2_0._controllerIndex = arg_2_1

	arg_2_0:addEventHandler("button_over_disable", function(arg_3_0, arg_3_1)
		arg_3_0.menu:processEvent({
			name = "challenges_update_locked",
			locked = arg_2_0._disabled
		})
	end)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		if arg_4_0.menu then
			arg_4_0.menu:processEvent({
				name = "challenges_update_locked",
				locked = arg_2_0._disabled,
				coreChallenges = arg_2_0._coreChallenges,
				brChallenges = arg_2_0._brChallenges
			})
		end
	end)
	arg_2_0:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		arg_5_0.menu:processEvent({
			name = "challenges_open_weekly_tabs",
			index = arg_2_0._id,
			controller = arg_5_1.controller
		})
	end)
end

function BarracksChallengeItemWeek(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 64 * _1080p)

	var_6_0.id = "BarracksChallengeItemWeek"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "LoadoutItemButtonBackground"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.LoadoutItemButtonBackground = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "CheckBox"

	var_6_6:SetAlpha(0.5, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 51, _1080p * 14, _1080p * 50)
	var_6_0:addElement(var_6_6)

	var_6_0.CheckBox = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Title"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_8:setText("Challenge Name", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 372, _1080p * 10, _1080p * 32)
	var_6_0:addElement(var_6_8)

	var_6_0.Title = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "ProgressDesc"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_10:SetAlpha(0.5, 0)
	var_6_10:setText("1/10", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_10:SetWordWrap(false)
	var_6_10:SetAlignment(LUI.Alignment.Right)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 397, _1080p * 443, _1080p * 10, _1080p * 32)
	var_6_0:addElement(var_6_10)

	var_6_0.ProgressDesc = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "ProgressBar"

	var_6_12:SetAlpha(0.5, 0)
	var_6_12.Overlay:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_12.Overlay:SetAlpha(0.5, 0)
	var_6_12.Fill:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 443, _1080p * 39, _1080p * 47)
	var_6_0:addElement(var_6_12)

	var_6_0.ProgressBar = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "Lock"

	var_6_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_6_14:SetAlpha(0, 0)
	var_6_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 51, _1080p * 14, _1080p * 50)
	var_6_0:addElement(var_6_14)

	var_6_0.Lock = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "NewItemSmallIcon"

	var_6_16:SetAlpha(0, 0)
	var_6_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_6_0:addElement(var_6_16)

	var_6_0.NewItemSmallIcon = var_6_16

	local function var_6_17()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_19)

	local var_6_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOver", var_6_20)

	local var_6_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonOver", var_6_21)

	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonOver", var_6_22)

	local function var_6_23()
		var_6_6:AnimateSequence("ButtonOver")
		var_6_8:AnimateSequence("ButtonOver")
		var_6_10:AnimateSequence("ButtonOver")
		var_6_12:AnimateSequence("ButtonOver")
		var_6_14:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_23

	local var_6_24 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_25)

	local var_6_26 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUp", var_6_26)

	local var_6_27 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonUp", var_6_27)

	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonUp", var_6_28)

	local function var_6_29()
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
		var_6_10:AnimateSequence("ButtonUp")
		var_6_12:AnimateSequence("ButtonUp")
		var_6_14:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_29

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpDisabled", var_6_30)

	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpDisabled", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUpDisabled", var_6_32)

	local var_6_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonUpDisabled", var_6_33)

	local var_6_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonUpDisabled", var_6_34)

	local function var_6_35()
		var_6_6:AnimateSequence("ButtonUpDisabled")
		var_6_8:AnimateSequence("ButtonUpDisabled")
		var_6_10:AnimateSequence("ButtonUpDisabled")
		var_6_12:AnimateSequence("ButtonUpDisabled")
		var_6_14:AnimateSequence("ButtonUpDisabled")
	end

	var_6_0._sequences.ButtonUpDisabled = var_6_35

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOverDisabled", var_6_36)

	local var_6_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOverDisabled", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOverDisabled", var_6_38)

	local var_6_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonOverDisabled", var_6_39)

	local var_6_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonOverDisabled", var_6_40)

	local function var_6_41()
		var_6_6:AnimateSequence("ButtonOverDisabled")
		var_6_8:AnimateSequence("ButtonOverDisabled")
		var_6_10:AnimateSequence("ButtonOverDisabled")
		var_6_12:AnimateSequence("ButtonOverDisabled")
		var_6_14:AnimateSequence("ButtonOverDisabled")
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_41

	local var_6_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_6_0.ProgressBar.Fill
		}
	}

	var_6_12:RegisterAnimationSequence("Complete", var_6_42)

	local function var_6_43()
		var_6_12:AnimateSequence("Complete")
	end

	var_6_0._sequences.Complete = var_6_43

	local var_6_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_6_0.ProgressBar.Fill
		}
	}

	var_6_12:RegisterAnimationSequence("Incomplete", var_6_44)

	local function var_6_45()
		var_6_12:AnimateSequence("Incomplete")
	end

	var_6_0._sequences.Incomplete = var_6_45

	var_6_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_6_0:addEventHandler("button_disable", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUpDisabled")
	end)
	var_6_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOverDisabled")
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BarracksChallengeItemWeek", BarracksChallengeItemWeek)
LockTable(_M)
