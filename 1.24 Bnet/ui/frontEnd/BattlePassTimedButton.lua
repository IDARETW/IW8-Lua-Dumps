module(..., package.seeall)

local var_0_0 = 2000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		arg_1_0._waitTime = arg_1_1
	end

	ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
	arg_1_0.GenericProgressBar:SetProgress(0, 0)
	arg_1_0:SetButtonDisabled(true)
	arg_1_0.GenericProgressBar:SetProgress(1, arg_1_0._waitTime)

	local var_1_0

	local function var_1_1()
		arg_1_0.GenericProgressBar:SetAlpha(0, 100)
		arg_1_0:SetButtonDisabled(false)

		if arg_1_2 then
			arg_1_0:dispatchEventToCurrentMenu({
				name = "timer_complete",
				controller = controllerIndex
			})
		end
	end

	if arg_1_0._waitTime and arg_1_0._waitTime > 0 then
		arg_1_0:Wait(arg_1_0._waitTime, true).onComplete = var_1_1
	else
		var_1_1()
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Text)
	arg_3_0.Text:setText(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.StartTimer = var_0_1
	arg_4_0.SetText = var_0_2
	arg_4_0._waitTime = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function BattlePassTimedButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_5_0.id = "BattlePassTimedButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetButtonDisabled(true)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LowerGlowHighlight"

	var_5_4:SetAlpha(0, 0)
	var_5_4.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -8, _1080p * 8)
	var_5_0:addElement(var_5_4)

	var_5_0.LowerGlowHighlight = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Backer"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Backer = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "TextureLayer"

	var_5_8:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_5_8:SetAlpha(0.05, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.8, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_5_0:addElement(var_5_8)

	var_5_0.TextureLayer = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "GenericProgressBar"

	var_5_10.Fill:SetRGBFromTable(SWATCHES.tabManager.tabTextDisabled, 0)
	var_5_10.Fill:SetAlpha(0.4, 0)
	var_5_10.Frame:SetAlpha(0, 0)
	var_5_10.Cap:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_5_0:addElement(var_5_10)

	var_5_0.GenericProgressBar = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Text"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_12:SetStartupDelay(2000)
	var_5_12:SetLineHoldTime(400)
	var_5_12:SetAnimMoveTime(300)
	var_5_12:SetAnimMoveSpeed(50)
	var_5_12:SetEndDelay(1500)
	var_5_12:SetCrossfadeTime(750)
	var_5_12:SetFadeInTime(300)
	var_5_12:SetFadeOutTime(300)
	var_5_12:SetMaxVisibleLines(1)
	var_5_12:SetOutlineRGBFromInt(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_5_0:addElement(var_5_12)

	var_5_0.Text = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Lock"

	var_5_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_5_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -13, _1080p * 13)
	var_5_0:addElement(var_5_14)

	var_5_0.Lock = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "ButtonGlow"

	var_5_16:SetAlpha(0, 0)
	var_5_16.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -8, _1080p * 8)
	var_5_0:addElement(var_5_16)

	var_5_0.ButtonGlow = var_5_16

	local var_5_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("DefaultSequence", var_5_17)

	local var_5_18 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_5_6:RegisterAnimationSequence("DefaultSequence", var_5_18)

	local var_5_19 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("DefaultSequence", var_5_19)

	local var_5_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("DefaultSequence", var_5_20)

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_12:RegisterAnimationSequence("DefaultSequence", var_5_21)

	local var_5_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("DefaultSequence", var_5_22)

	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("DefaultSequence", var_5_23)

	local function var_5_24()
		var_5_4:AnimateSequence("DefaultSequence")
		var_5_6:AnimateSequence("DefaultSequence")
		var_5_8:AnimateSequence("DefaultSequence")
		var_5_10:AnimateSequence("DefaultSequence")
		var_5_12:AnimateSequence("DefaultSequence")
		var_5_14:AnimateSequence("DefaultSequence")
		var_5_16:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_24

	local var_5_25 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_25)

	local var_5_26 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_26)

	local var_5_27 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_27)

	local var_5_28 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_28)

	local var_5_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_29)

	local var_5_30 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_30)

	local function var_5_31()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_6:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_31

	local var_5_32 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_32)

	local var_5_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeamDark
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_33)

	local var_5_34 = {
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_34)

	local var_5_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_36)

	local var_5_37 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_37)

	local function var_5_38()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_38

	local var_5_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOverDisabled", var_5_39)

	local var_5_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOverDisabled", var_5_40)

	local function var_5_41()
		var_5_12:AnimateSequence("ButtonOverDisabled")
		var_5_14:AnimateSequence("ButtonOverDisabled")
	end

	var_5_0._sequences.ButtonOverDisabled = var_5_41

	local var_5_42 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUpDisabled", var_5_42)

	local var_5_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUpDisabled", var_5_43)

	local function var_5_44()
		var_5_12:AnimateSequence("ButtonUpDisabled")
		var_5_14:AnimateSequence("ButtonUpDisabled")
	end

	var_5_0._sequences.ButtonUpDisabled = var_5_44

	local var_5_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_45)

	local function var_5_46()
		var_5_12:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_46

	var_5_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_5_0:addEventHandler("button_disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUpDisabled")
	end)
	var_5_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOverDisabled")
	end)
	var_0_3(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("BattlePassTimedButton", BattlePassTimedButton)
LockTable(_M)
