module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		arg_1_0.Title:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 600, _1080p * 3, _1080p * 39)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._challenge = arg_2_2
	arg_2_0._menu = arg_2_1
	arg_2_0._numRewards = 0

	if arg_2_0._challenge.desc and arg_2_0._challenge.amount then
		arg_2_0.Title:setText(Engine.CBBHFCGDIC(arg_2_0._challenge.desc, arg_2_0._challenge.amount))
	else
		arg_2_0.Title:setText("")
	end

	if arg_2_0._challenge.rewards and #arg_2_0._challenge.rewards > 0 then
		arg_2_0._numRewards = math.min(#arg_2_0._challenge.rewards, #arg_2_0._iconWidgets)

		for iter_2_0 = 1, arg_2_0._numRewards do
			local var_2_0 = arg_2_0._challenge.rewards[iter_2_0]
			local var_2_1 = arg_2_0._iconWidgets[iter_2_0]

			if var_2_0.typeIconRendered and #var_2_0.typeIconRendered > 0 then
				var_2_1:SetAlpha(arg_2_0._isOver and 1 or 0.5)
				var_2_1:setImage(RegisterMaterial(var_2_0.typeIconRendered))

				if var_2_0.typeIconRenderedScale then
					var_2_1:SetScale(var_2_0.typeIconRenderedScale)
				else
					var_2_1:SetScale(var_2_1.buildScale)
				end
			else
				var_2_1:SetAlpha(0)
			end
		end

		ACTIONS.AnimateSequence(arg_2_0, "ShowIcon" .. arg_2_0._numRewards)
	end

	arg_2_0.CheckBox:SetValue(arg_2_0._challenge.isComplete)

	if arg_2_0._challenge.progress then
		arg_2_0.ProgressBar:SetProgress(arg_2_0._challenge.progress, 0, 0)
		arg_2_0.ProgressBar:SetAlpha(arg_2_0._isOver and 1 or 0.5)

		arg_2_0._useProgressBar = true

		ACTIONS.AnimateSequence(arg_2_0, arg_2_0._challenge.progress == 1 and "Complete" or "Incomplete")
	end

	if arg_2_0._challenge.amountEarned and arg_2_0._challenge.amountNeeded then
		arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_2_0._challenge.amountEarned, arg_2_0._challenge.amountNeeded))
		arg_2_0.ProgressDesc:SetAlpha(arg_2_0._isOver and 1 or 0.5)

		arg_2_0._useProgressDesc = true
	else
		arg_2_0.ProgressDesc:SetAlpha(0)
	end

	if not arg_2_0._challenge.unlocked then
		arg_2_0.Lock:SetAlpha(1)
	else
		arg_2_0.Lock:SetAlpha(0)
	end

	arg_2_0:SetButtonDisabled(not arg_2_0._challenge.unlocked)

	local var_2_2 = arg_2_0._challenge.type and (arg_2_0._challenge.type == Challenge.Type.DAILY or arg_2_0._challenge.type == Challenge.Type.BR_DAILY)

	if not arg_2_0._challenge.isComplete and Dvar.IBEGCHEFE("LLQKSNOSS") and var_2_2 then
		local var_2_3 = Challenge.GetDifficulty(arg_2_0._challenge.id, arg_2_0._challenge.type)

		if var_2_3 == Challenge.Difficulty.REGULAR then
			arg_2_0.DifficultyLabel:setImage(RegisterMaterial("icon_challenge_difficulty_regular"))
		elseif var_2_3 == Challenge.Difficulty.HARDENED then
			arg_2_0.DifficultyLabel:setImage(RegisterMaterial("icon_challenge_difficulty_hard"))
		elseif var_2_3 == Challenge.Difficulty.VETERAN then
			arg_2_0.DifficultyLabel:setImage(RegisterMaterial("icon_challenge_difficulty_veteran"))
		elseif var_2_3 == Challenge.Difficulty.GAMES_OF_SUMMER then
			arg_2_0.DifficultyLabel:setImage(RegisterMaterial("icon_challenge_difficulty_gos"))
		else
			arg_2_0.DifficultyLabel:SetAlpha(0)
		end
	else
		arg_2_0.DifficultyLabel:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Lock)

	arg_3_0.Setup = var_0_1

	if IsLanguageArabic() then
		arg_3_0.Title:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 600, 0, _1080p * 32)
		arg_3_0.ProgressDesc:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 625, _1080p * 671, 0, _1080p * 32)
	end

	arg_3_0._iconWidgets = {
		arg_3_0.RewardIcon1,
		arg_3_0.RewardIcon2
	}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0._iconWidgets) do
		iter_3_1.buildScale = iter_3_1:GetScale()
	end

	local function var_3_0(arg_4_0)
		arg_4_0._isOver = true

		if arg_4_0._challenge then
			if arg_4_0._menu then
				arg_4_0._menu:processEvent({
					name = "challenges_update_status",
					challenge = arg_4_0._challenge
				})
			end

			if arg_4_0._numRewards > 0 then
				for iter_4_0 = 1, arg_4_0._numRewards do
					arg_4_0._iconWidgets[iter_4_0]:SetAlpha(1)
				end
			end
		end

		if arg_4_0._useProgressBar then
			arg_4_0.ProgressBar:SetAlpha(1)
		end

		if arg_4_0._useProgressDesc then
			arg_4_0.ProgressDesc:SetAlpha(1)
		end

		ACTIONS.AnimateSequence(arg_3_0, arg_3_0._challenge.unlocked and "ButtonOver" or "ButtonOverDisabled")
	end

	arg_3_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		var_3_0(arg_5_0)
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		var_3_0(arg_6_0)
	end)

	local function var_3_1(arg_7_0)
		arg_7_0._isOver = false

		if arg_7_0._challenge and arg_7_0._numRewards > 0 then
			for iter_7_0 = 1, arg_7_0._numRewards do
				arg_7_0._iconWidgets[iter_7_0]:SetAlpha(0.5)
			end
		end

		if arg_7_0._useProgressBar then
			arg_7_0.ProgressBar:SetAlpha(0.5)
		end

		if arg_7_0._useProgressDesc then
			arg_7_0.ProgressDesc:SetAlpha(0.5)
		end

		ACTIONS.AnimateSequence(arg_3_0, arg_3_0._challenge.unlocked and "ButtonUp" or "ButtonUpDisabled")
	end

	arg_3_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		var_3_1(arg_8_0)
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		var_3_1(arg_9_0)
	end)
	var_0_0(arg_3_0)
end

function BarracksChallengeItem(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 64 * _1080p)

	var_10_0.id = "BarracksChallengeItem"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "LoadoutItemButtonBackground"

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 800, 0, _1080p * 64)
	var_10_0:addElement(var_10_4)

	var_10_0.LoadoutItemButtonBackground = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "CheckBox"

	var_10_6:SetAlpha(0.5, 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 51, _1080p * 14, _1080p * 50)
	var_10_0:addElement(var_10_6)

	var_10_0.CheckBox = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIStyledText.new()

	var_10_8.id = "Title"

	var_10_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_8:setText("Challenge Name", 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_8:SetWordWrap(false)
	var_10_8:SetAlignment(LUI.Alignment.Left)
	var_10_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_8:SetStartupDelay(1700)
	var_10_8:SetLineHoldTime(400)
	var_10_8:SetAnimMoveTime(2000)
	var_10_8:SetAnimMoveSpeed(50)
	var_10_8:SetEndDelay(1700)
	var_10_8:SetCrossfadeTime(400)
	var_10_8:SetFadeInTime(300)
	var_10_8:SetFadeOutTime(300)
	var_10_8:SetMaxVisibleLines(1)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 600, _1080p * 10, _1080p * 32)
	var_10_0:addElement(var_10_8)

	var_10_0.Title = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "RewardIcon1"

	var_10_10:SetAlpha(0, 0)
	var_10_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -120, _1080p * -70, _1080p * 7, _1080p * 57)
	var_10_0:addElement(var_10_10)

	var_10_0.RewardIcon1 = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "ProgressDesc"

	var_10_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_12:SetAlpha(0.5, 0)
	var_10_12:setText("1/10", 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_12:SetWordWrap(false)
	var_10_12:SetAlignment(LUI.Alignment.Right)
	var_10_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 625, _1080p * 671, _1080p * 10, _1080p * 32)
	var_10_0:addElement(var_10_12)

	var_10_0.ProgressDesc = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "ProgressBar"

	var_10_14:SetAlpha(0.5, 0)
	var_10_14.Overlay:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_14.Overlay:SetAlpha(0.5, 0)
	var_10_14.Fill:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 671, _1080p * 39, _1080p * 47)
	var_10_0:addElement(var_10_14)

	var_10_0.ProgressBar = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "NewItemSmallIcon"

	var_10_16:SetAlpha(0, 0)
	var_10_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_10_0:addElement(var_10_16)

	var_10_0.NewItemSmallIcon = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "RewardIcon2"

	var_10_18:SetAlpha(0, 0)
	var_10_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -62, _1080p * -12, _1080p * 7, _1080p * 57)
	var_10_0:addElement(var_10_18)

	var_10_0.RewardIcon2 = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIImage.new()

	var_10_20.id = "Lock"

	var_10_20:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_10_20:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -783, _1080p * -751, _1080p * 16, _1080p * 48)
	var_10_0:addElement(var_10_20)

	var_10_0.Lock = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIImage.new()

	var_10_22.id = "DifficultyLabel"

	var_10_22:setImage(RegisterMaterial("icon_challenge_difficulty_regular"), 0)
	var_10_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 47, _1080p * 18, _1080p * 46)
	var_10_0:addElement(var_10_22)

	var_10_0.DifficultyLabel = var_10_22

	local function var_10_23()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_23

	local var_10_24 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOver", var_10_24)

	local var_10_25 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_25)

	local var_10_26 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_26)

	local var_10_27 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonOver", var_10_27)

	local var_10_28 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonOver", var_10_28)

	local function var_10_29()
		var_10_6:AnimateSequence("ButtonOver")
		var_10_8:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
		var_10_12:AnimateSequence("ButtonOver")
		var_10_14:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_29

	local var_10_30 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUp", var_10_30)

	local var_10_31 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_31)

	local var_10_32 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_32)

	local var_10_33 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonUp", var_10_33)

	local var_10_34 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonUp", var_10_34)

	local function var_10_35()
		var_10_6:AnimateSequence("ButtonUp")
		var_10_8:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
		var_10_12:AnimateSequence("ButtonUp")
		var_10_14:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_35

	local var_10_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("HideIcon", var_10_36)

	local function var_10_37()
		var_10_10:AnimateSequence("HideIcon")
	end

	var_10_0._sequences.HideIcon = var_10_37

	local var_10_38 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -70
		}
	}

	var_10_10:RegisterAnimationSequence("ShowIcon1", var_10_38)

	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -12
		}
	}

	var_10_18:RegisterAnimationSequence("ShowIcon1", var_10_39)

	local function var_10_40()
		var_10_10:AnimateSequence("ShowIcon1")
		var_10_18:AnimateSequence("ShowIcon1")
	end

	var_10_0._sequences.ShowIcon1 = var_10_40

	local var_10_41 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowIcon2", var_10_41)

	local var_10_42 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("ShowIcon2", var_10_42)

	local function var_10_43()
		var_10_10:AnimateSequence("ShowIcon2")
		var_10_18:AnimateSequence("ShowIcon2")
	end

	var_10_0._sequences.ShowIcon2 = var_10_43

	local var_10_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_10_0.ProgressBar.Fill
		}
	}

	var_10_14:RegisterAnimationSequence("Complete", var_10_44)

	local function var_10_45()
		var_10_14:AnimateSequence("Complete")
	end

	var_10_0._sequences.Complete = var_10_45

	local var_10_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_10_0.ProgressBar.Fill
		}
	}

	var_10_14:RegisterAnimationSequence("Incomplete", var_10_46)

	local function var_10_47()
		var_10_14:AnimateSequence("Incomplete")
	end

	var_10_0._sequences.Incomplete = var_10_47

	local var_10_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			child = var_10_0.CheckBox.Frame
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOverDisabled", var_10_48)

	local var_10_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textOverDisabled
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_49)

	local function var_10_50()
		var_10_6:AnimateSequence("ButtonOverDisabled")
		var_10_8:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_50

	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			child = var_10_0.CheckBox.Frame
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUpDisabled", var_10_51)

	local var_10_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUpDisabled", var_10_52)

	local function var_10_53()
		var_10_6:AnimateSequence("ButtonUpDisabled")
		var_10_8:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_53

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BarracksChallengeItem", BarracksChallengeItem)
LockTable(_M)
