module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = StringTable.BFHCAIIDA(CSV.progressionItems.GetFile())

	arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LEVEL_X_UNLOCKS", var_1_0)))

	local var_1_1 = PROGRESSION.GetPlayerRank(arg_1_1) + 1 == var_1_0 and true or false

	ACTIONS.AnimateSequence(arg_1_0, var_1_1 and "Earned" or "NotEarned")

	local var_1_2 = LAYOUT.GetTextWidth(arg_1_0.EarnedText) / 2

	arg_1_0.EarnedText:SetLeft(-var_1_2)
	arg_1_0.EarnedText:SetRight(var_1_2)

	local var_1_3 = LAYOUT.GetElementWidth(arg_1_0.Checkmark)
	local var_1_4 = var_1_2 + 5 * _1080p

	arg_1_0.Checkmark:SetLeft(var_1_4)
	arg_1_0.Checkmark:SetRight(var_1_4 + var_1_3)
end

function WZUnlocksMaxRankPanel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 330 * _1080p, 0, 188 * _1080p)

	var_2_0.id = "WZUnlocksMaxRankPanel"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Backing"

	var_2_4:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_2_4:SetAlpha(0.6, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Backing = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "DocumentBorder"

	var_2_6:SetRGBFromTable(SWATCHES.CH2.Ch2Brown, 0)
	var_2_6:SetAlpha(0, 0)
	var_2_6:setImage(RegisterMaterial("ui_t9_menu_frontend_document_border"), 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_2_0:addElement(var_2_6)

	var_2_0.DocumentBorder = var_2_6

	local var_2_7
	local var_2_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_9 = LUI.UIBorder.new(var_2_8)

	var_2_9.id = "Border0"

	var_2_9:SetRGBFromTable(SWATCHES.CH2.Ch2Brown, 0)
	var_2_9:SetAlpha(0.5, 0)
	var_2_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 327, _1080p * 3, _1080p * 185)
	var_2_0:addElement(var_2_9)

	var_2_0.Border0 = var_2_9

	local var_2_10
	local var_2_11 = LUI.UIStyledText.new()

	var_2_11.id = "KeyText"

	var_2_11:SetRGBFromTable(SWATCHES.genericButton.warzoneDescription, 0)
	var_2_11:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/PRESTIGE_KEY")), 0)
	var_2_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_11:SetAlignment(LUI.Alignment.Center)
	var_2_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_11:SetStartupDelay(1000)
	var_2_11:SetLineHoldTime(400)
	var_2_11:SetAnimMoveTime(1500)
	var_2_11:SetAnimMoveSpeed(1500)
	var_2_11:SetEndDelay(1000)
	var_2_11:SetCrossfadeTime(400)
	var_2_11:SetFadeInTime(300)
	var_2_11:SetFadeOutTime(300)
	var_2_11:SetMaxVisibleLines(1)
	var_2_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -159, _1080p * -11, _1080p * 132, _1080p * 150)
	var_2_0:addElement(var_2_11)

	var_2_0.KeyText = var_2_11

	local var_2_12
	local var_2_13 = LUI.UIImage.new()

	var_2_13.id = "KeyIcon"

	var_2_13:setImage(RegisterMaterial("ui_icon_key_prestige"), 0)
	var_2_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -119, _1080p * -51, _1080p * 60, _1080p * 128)
	var_2_0:addElement(var_2_13)

	var_2_0.KeyIcon = var_2_13

	local var_2_14
	local var_2_15 = LUI.UIStyledText.new()

	var_2_15.id = "RewardText"

	var_2_15:SetRGBFromTable(SWATCHES.genericButton.warzoneDescription, 0)
	var_2_15:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/UNLOCKS_MAX_RANK_REWARD_TEXT")), 0)
	var_2_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_15:SetAlignment(LUI.Alignment.Center)
	var_2_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_15:SetStartupDelay(1000)
	var_2_15:SetLineHoldTime(400)
	var_2_15:SetAnimMoveTime(1500)
	var_2_15:SetAnimMoveSpeed(1500)
	var_2_15:SetEndDelay(1000)
	var_2_15:SetCrossfadeTime(400)
	var_2_15:SetFadeInTime(300)
	var_2_15:SetFadeOutTime(300)
	var_2_15:SetMaxVisibleLines(1)
	var_2_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 161, _1080p * 132, _1080p * 150)
	var_2_0:addElement(var_2_15)

	var_2_0.RewardText = var_2_15

	local var_2_16
	local var_2_17 = LUI.UIImage.new()

	var_2_17.id = "RewardIcon"

	var_2_17:setImage(RegisterMaterial("ui_icon_t9_rank_prestige_01"), 0)
	var_2_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 46, _1080p * 128, _1080p * 53, _1080p * 135)
	var_2_0:addElement(var_2_17)

	var_2_0.RewardIcon = var_2_17

	local var_2_18
	local var_2_19 = LUI.UIStyledText.new()

	var_2_19.id = "Title"

	var_2_19:SetRGBFromTable(SWATCHES.masterChallenges.active, 0)
	var_2_19:setText("", 0)
	var_2_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_19:SetWordWrap(false)
	var_2_19:SetAlignment(LUI.Alignment.Center)
	var_2_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_19:SetStartupDelay(1000)
	var_2_19:SetLineHoldTime(400)
	var_2_19:SetAnimMoveTime(150)
	var_2_19:SetAnimMoveSpeed(50)
	var_2_19:SetEndDelay(1000)
	var_2_19:SetCrossfadeTime(400)
	var_2_19:SetFadeInTime(300)
	var_2_19:SetFadeOutTime(300)
	var_2_19:SetMaxVisibleLines(1)
	var_2_19:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -12, _1080p * 19, _1080p * 49)
	var_2_0:addElement(var_2_19)

	var_2_0.Title = var_2_19

	local var_2_20
	local var_2_21 = LUI.UIStyledText.new()

	var_2_21.id = "EarnedText"

	var_2_21:SetRGBFromTable(SWATCHES.splashNotifications.Green, 0)
	var_2_21:SetAlpha(0.8, 0)
	var_2_21:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/XP_EARNED")), 0)
	var_2_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_21:SetWordWrap(false)
	var_2_21:SetAlignment(LUI.Alignment.Right)
	var_2_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -51, _1080p * 13, _1080p * 156, _1080p * 174)
	var_2_0:addElement(var_2_21)

	var_2_0.EarnedText = var_2_21

	local var_2_22
	local var_2_23 = LUI.UIImage.new()

	var_2_23.id = "Checkmark"

	var_2_23:SetRGBFromTable(SWATCHES.splashNotifications.Green, 0)
	var_2_23:SetAlpha(0.8, 0)
	var_2_23:setImage(RegisterMaterial("ui_t9_menu_frontend_selected_checkMark"), 0)
	var_2_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 16, _1080p * 33, _1080p * 157, _1080p * 173)
	var_2_0:addElement(var_2_23)

	var_2_0.Checkmark = var_2_23

	local function var_2_24()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_24

	local var_2_25
	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_2_4:RegisterAnimationSequence("NotEarned", var_2_26)

	local var_2_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_21:RegisterAnimationSequence("NotEarned", var_2_27)

	local var_2_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_23:RegisterAnimationSequence("NotEarned", var_2_28)

	local function var_2_29()
		var_2_4:AnimateSequence("NotEarned")
		var_2_21:AnimateSequence("NotEarned")
		var_2_23:AnimateSequence("NotEarned")
	end

	var_2_0._sequences.NotEarned = var_2_29

	local var_2_30
	local var_2_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_2_4:RegisterAnimationSequence("Earned", var_2_31)

	local var_2_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_21:RegisterAnimationSequence("Earned", var_2_32)

	local var_2_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_23:RegisterAnimationSequence("Earned", var_2_33)

	local function var_2_34()
		var_2_4:AnimateSequence("Earned")
		var_2_21:AnimateSequence("Earned")
		var_2_23:AnimateSequence("Earned")
	end

	var_2_0._sequences.Earned = var_2_34

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WZUnlocksMaxRankPanel", WZUnlocksMaxRankPanel)
LockTable(_M)
