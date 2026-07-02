module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function InstallProgress(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "InstallProgress"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "mwLogo"

	var_2_4:SetRGBFromTable(SWATCHES.Frontend.install, 0)
	var_2_4:setImage(RegisterMaterial("logo_mw"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -14, _1080p * 114, 0, _1080p * 32)
	var_2_0:addElement(var_2_4)

	var_2_0.mwLogo = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("InstallProgressBar", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "ProgressBar"

	var_2_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 110, 0, _1080p * -10, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.ProgressBar = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "Percentage"

	var_2_8:SetRGBFromTable(SWATCHES.Frontend.install, 0)
	var_2_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PERCENTAGE_OF_COMPLETION"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -50, 0, 0, _1080p * 22)
	var_2_0:addElement(var_2_8)

	var_2_0.Percentage = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "CompleteMessage"

	var_2_10:SetRGBFromTable(SWATCHES.Frontend.install, 0)
	var_2_10:SetAlpha(0, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("LUA_MENU/LC_RESTART"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_10:SetStartupDelay(2000)
	var_2_10:SetLineHoldTime(700)
	var_2_10:SetAnimMoveTime(2000)
	var_2_10:SetAnimMoveSpeed(150)
	var_2_10:SetEndDelay(2000)
	var_2_10:SetCrossfadeTime(1000)
	var_2_10:SetFadeInTime(300)
	var_2_10:SetFadeOutTime(300)
	var_2_10:SetMaxVisibleLines(1)
	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 110, 0, 0, _1080p * 22)
	var_2_0:addElement(var_2_10)

	var_2_0.CompleteMessage = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "InstallMessage"

	var_2_12:SetRGBFromTable(SWATCHES.Frontend.install, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("LUA_MENU/LC_PROGRESS"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_12:SetStartupDelay(2000)
	var_2_12:SetLineHoldTime(700)
	var_2_12:SetAnimMoveTime(2000)
	var_2_12:SetAnimMoveSpeed(150)
	var_2_12:SetEndDelay(2000)
	var_2_12:SetCrossfadeTime(1000)
	var_2_12:SetFadeInTime(300)
	var_2_12:SetFadeOutTime(300)
	var_2_12:SetMaxVisibleLines(1)
	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 110, _1080p * -50, 0, _1080p * 22)
	var_2_0:addElement(var_2_12)

	var_2_0.InstallMessage = var_2_12

	local function var_2_13()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_13

	local var_2_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Complete", var_2_14)

	local var_2_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Complete", var_2_15)

	local var_2_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Complete", var_2_16)

	local var_2_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("Complete", var_2_17)

	local function var_2_18()
		var_2_6:AnimateSequence("Complete")
		var_2_8:AnimateSequence("Complete")
		var_2_10:AnimateSequence("Complete")
		var_2_12:AnimateSequence("Complete")
	end

	var_2_0._sequences.Complete = var_2_18

	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_19)

	local var_2_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_20)

	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 160
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_2_12:RegisterAnimationSequence("AR", var_2_21)

	local function var_2_22()
		var_2_8:AnimateSequence("AR")
		var_2_10:AnimateSequence("AR")
		var_2_12:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_22

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("InstallProgress", InstallProgress)
LockTable(_M)
