module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not (arg_1_1 and next(arg_1_1) ~= nil) then
		return
	end

	if arg_1_0.SeasonalEventXPCard and arg_1_2._challengeRef and arg_1_2._challengeRef ~= "" then
		local var_1_0 = Challenge.GetIDFromRef(arg_1_2._challengeRef, Challenge.Type.GUN_UNLOCK)
		local var_1_1 = Challenge.GetXPReward(var_1_0, Challenge.Type.GUN_UNLOCK)

		arg_1_0.SeasonalEventXPCard.XPAmount:setText(var_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._previewsEnabled = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateCardConfig = var_0_0
	arg_3_0.SetPreview = var_0_1
	arg_3_0._previewsEnabled = true

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function SeasonalEventBaseWeaponReward(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 150 * _1080p)

	var_4_0.id = "SeasonalEventBaseWeaponReward"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "PlayercardBackground"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -186, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.PlayercardBackground = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "BackgroundMask"

	var_4_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -186, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.BackgroundMask = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Background"

	var_4_8:SetRGBFromInt(0, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -186, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Background = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("SeasonalEventXPCard", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "SeasonalEventXPCard"

	var_4_10:SetScale(-0.25, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 350, _1080p * 500, _1080p * -25, _1080p * 175)
	var_4_0:addElement(var_4_10)

	var_4_0.SeasonalEventXPCard = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "NameBackground"

	var_4_12:SetRGBFromInt(1842204, 0)
	var_4_12:SetAlpha(0.7, 0)
	var_4_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 353, _1080p * -30, _1080p * -1)
	var_4_0:addElement(var_4_12)

	var_4_0.NameBackground = var_4_12

	local var_4_13
	local var_4_14 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_4_15 = LUI.UIBorder.new(var_4_14)

	var_4_15.id = "Border"

	var_4_15:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_4_15:SetBorderThicknessLeft(_1080p * 2, 0)
	var_4_15:SetBorderThicknessRight(_1080p * 2, 0)
	var_4_15:SetBorderThicknessTop(_1080p * 2, 0)
	var_4_15:SetBorderThicknessBottom(_1080p * 2, 0)
	var_4_15:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -186, 0, 0)
	var_4_0:addElement(var_4_15)

	var_4_0.Border = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIImage.new()

	var_4_17.id = "LockedIconWeapon"

	var_4_17:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_4_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -217, _1080p * -192, _1080p * 6, _1080p * 31)
	var_4_0:addElement(var_4_17)

	var_4_0.LockedIconWeapon = var_4_17

	local var_4_18
	local var_4_19 = LUI.UIImage.new()

	var_4_19.id = "LockedIconXP"

	var_4_19:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_4_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -99, _1080p * -74, _1080p * 6, _1080p * 31)
	var_4_0:addElement(var_4_19)

	var_4_0.LockedIconXP = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIStyledText.new()

	var_4_21.id = "ItemName"

	var_4_21:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/FINAL_REWARD_TITLE"), 0)
	var_4_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_21:SetWordWrap(false)
	var_4_21:SetAlignment(LUI.Alignment.Left)
	var_4_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_21:SetStartupDelay(1000)
	var_4_21:SetLineHoldTime(400)
	var_4_21:SetAnimMoveTime(150)
	var_4_21:SetAnimMoveSpeed(50)
	var_4_21:SetEndDelay(1000)
	var_4_21:SetCrossfadeTime(400)
	var_4_21:SetFadeInTime(300)
	var_4_21:SetFadeOutTime(300)
	var_4_21:SetMaxVisibleLines(1)
	var_4_21:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 5, _1080p * -197, _1080p * -28, _1080p * -4)
	var_4_0:addElement(var_4_21)

	var_4_0.ItemName = var_4_21

	local function var_4_22()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("Locked", var_4_24)

	local var_4_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Locked", var_4_25)

	local function var_4_26()
		var_4_17:AnimateSequence("Locked")
		var_4_19:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_26

	local var_4_27
	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("Unlocked", var_4_28)

	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Unlocked", var_4_29)

	local function var_4_30()
		var_4_17:AnimateSequence("Unlocked")
		var_4_19:AnimateSequence("Unlocked")
	end

	var_4_0._sequences.Unlocked = var_4_30

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonalEventBaseWeaponReward", SeasonalEventBaseWeaponReward)
LockTable(_M)
