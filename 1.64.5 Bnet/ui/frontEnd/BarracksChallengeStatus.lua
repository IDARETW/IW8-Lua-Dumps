module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 and arg_1_1.rewards and #arg_1_1.rewards > 0 then
		arg_1_0:SetAlpha(1)

		local var_1_0 = math.min(#arg_1_1.rewards, #arg_1_0._rewardWidgets)

		ACTIONS.AnimateSequence(arg_1_0, "ShowIcon" .. var_1_0)

		for iter_1_0 = 1, var_1_0 do
			local var_1_1 = arg_1_1.rewards[iter_1_0]
			local var_1_2 = arg_1_0._rewardWidgets[iter_1_0]
			local var_1_3 = arg_1_0._nameWidgets[iter_1_0]

			arg_1_0.PreivewPrompt:SetAlpha(0)

			arg_1_0._previewData = nil

			if var_1_1.lootItemID then
				arg_1_0._previewData = var_1_1

				if LOOT.GetTypeForID(var_1_1.lootItemID) ~= LOOT.itemTypes.CONSUMABLE then
					arg_1_0.PreivewPrompt:SetAlpha(1)
				end
			end

			var_1_2:UpdateCardConfig(var_1_1)
			var_1_3:setText(var_1_1.typeName or "")
		end
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 then
		if not arg_2_0._bannerShown then
			arg_2_0.LockBanner:SetAlpha(1)
			ACTIONS.AnimateSequence(arg_2_0.LockBanner, "ShowLock")

			arg_2_0._bannerShown = true
		end
	else
		arg_2_0.LockBanner:SetAlpha(0)

		arg_2_0._bannerShown = false
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = Challenge.GetDifficulty(arg_3_1.id, arg_3_1.type)

	if var_3_0 ~= Challenge.Difficulty.NONE then
		arg_3_0.DifficultyImage:SetAlpha(1)
		arg_3_0.ChallengeDifficultyText:SetAlpha(1)
		arg_3_0.Difficulty:SetAlpha(1)

		if var_3_0 == Challenge.Difficulty.REGULAR then
			arg_3_0.DifficultyImage:setImage(RegisterMaterial("icon_challenge_difficulty_regular"))
			arg_3_0.Difficulty:setText(Engine.CBBHFCGDIC("MENU/REGULAR"))
		elseif var_3_0 == Challenge.Difficulty.HARDENED then
			arg_3_0.DifficultyImage:setImage(RegisterMaterial("icon_challenge_difficulty_hard"))
			arg_3_0.Difficulty:setText(Engine.CBBHFCGDIC("MENU/HARDENED"))
		elseif var_3_0 == Challenge.Difficulty.VETERAN then
			arg_3_0.DifficultyImage:setImage(RegisterMaterial("icon_challenge_difficulty_veteran"))
			arg_3_0.Difficulty:setText(Engine.CBBHFCGDIC("MENU/VETERAN"))
		elseif var_3_0 == Challenge.Difficulty.GAMES_OF_SUMMER then
			arg_3_0.DifficultyImage:setImage(RegisterMaterial("icon_challenge_difficulty_gos"))
			arg_3_0.Difficulty:setText(Engine.CBBHFCGDIC("TRIALEVENT/MODE_NAME"))
		end
	else
		arg_3_0.DifficultyImage:SetAlpha(0)
		arg_3_0.ChallengeDifficultyText:SetAlpha(0)
		arg_3_0.Difficulty:SetAlpha(0)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.RewardName1)
	assert(arg_4_0.Reward1)
	assert(arg_4_0.RewardName2)
	assert(arg_4_0.Reward2)

	arg_4_0._bannerShown = false
	arg_4_0._nameWidgets = {
		arg_4_0.RewardName1,
		arg_4_0.RewardName2
	}
	arg_4_0._rewardWidgets = {
		arg_4_0.Reward1,
		arg_4_0.Reward2
	}
	arg_4_0.SetData = var_0_0
	arg_4_0.SetChallengeLocked = var_0_1
	arg_4_0.BindButton = LUI.UIBindButton.new()
	arg_4_0.BindButton.id = "BindButton"

	arg_4_0:addElement(arg_4_0.BindButton)
	arg_4_0.BindButton:registerEventHandler("button_right_stick", function(arg_5_0, arg_5_1)
		if arg_4_0._previewData then
			STORE.PreviewItem(arg_4_1, arg_4_0._previewData.type, arg_4_0._previewData.itemID)

			if arg_5_1.qualifier then
				Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
			end
		end
	end)

	arg_4_0.SetDifficulty = var_0_2
end

function BarracksChallengeStatus(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 425 * _1080p, 0, 400 * _1080p)

	var_6_0.id = "BarracksChallengeStatus"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "DoubleNotchedBacker"

	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 425, 0, _1080p * 400)
	var_6_0:addElement(var_6_4)

	var_6_0.DoubleNotchedBacker = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "RewardName2"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 138, _1080p * -137, _1080p * 70, _1080p * 92)
	var_6_0:addElement(var_6_6)

	var_6_0.RewardName2 = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "RewardName1"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 138, _1080p * -137, _1080p * 70, _1080p * 92)
	var_6_0:addElement(var_6_8)

	var_6_0.RewardName1 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "ChallengeHeader"

	var_6_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 2, _1080p * 48)
	var_6_0:addElement(var_6_10)

	var_6_0.ChallengeHeader = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Reward2"

	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 138, _1080p * 288, _1080p * 97, _1080p * 297)
	var_6_0:addElement(var_6_12)

	var_6_0.Reward2 = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Reward1"

	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 138, _1080p * 288, _1080p * 97, _1080p * 297)
	var_6_0:addElement(var_6_14)

	var_6_0.Reward1 = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "PreivewPrompt"

	var_6_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_16:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_LOOT_ITEM"), 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_16:SetWordWrap(false)
	var_6_16:SetAlignment(LUI.Alignment.Left)
	var_6_16:SetTintFontIcons(true)
	var_6_16:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 162, _1080p * 9, _1080p * 33)
	var_6_0:addElement(var_6_16)

	var_6_0.PreivewPrompt = var_6_16

	local var_6_17
	local var_6_18 = MenuBuilder.BuildRegisteredType("BarracksChallengeStatusLockBanner", {
		controllerIndex = var_6_1
	})

	var_6_18.id = "LockBanner"

	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 426, _1080p * -50, _1080p * 20)
	var_6_0:addElement(var_6_18)

	var_6_0.LockBanner = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIStyledText.new()

	var_6_20.id = "ChallengeDifficultyText"

	var_6_20:SetAlpha(0, 0)
	var_6_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHALLENGE_DIFFICULTY"), 0)
	var_6_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_20:SetAlignment(LUI.Alignment.Left)
	var_6_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22, _1080p * 223, _1080p * 324, _1080p * 344)
	var_6_0:addElement(var_6_20)

	var_6_0.ChallengeDifficultyText = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIImage.new()

	var_6_22.id = "DifficultyImage"

	var_6_22:SetAlpha(0, 0)
	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 52, _1080p * 354, _1080p * 382)
	var_6_0:addElement(var_6_22)

	var_6_0.DifficultyImage = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIStyledText.new()

	var_6_24.id = "Difficulty"

	var_6_24:SetAlpha(0, 0)
	var_6_24:setText(Engine.CBBHFCGDIC("MENU/HARDENED"), 0)
	var_6_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_24:SetAlignment(LUI.Alignment.Left)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 63, _1080p * 223, _1080p * 359, _1080p * 377)
	var_6_0:addElement(var_6_24)

	var_6_0.Difficulty = var_6_24

	local function var_6_25()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_25

	local var_6_26
	local var_6_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("HideIcon", var_6_27)

	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("HideIcon", var_6_28)

	local var_6_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("HideIcon", var_6_29)

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("HideIcon", var_6_30)

	local function var_6_31()
		var_6_6:AnimateSequence("HideIcon")
		var_6_8:AnimateSequence("HideIcon")
		var_6_12:AnimateSequence("HideIcon")
		var_6_14:AnimateSequence("HideIcon")
	end

	var_6_0._sequences.HideIcon = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ShowIcon1", var_6_33)

	local var_6_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -107
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShowIcon1", var_6_34)

	local var_6_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		}
	}

	var_6_12:RegisterAnimationSequence("ShowIcon1", var_6_35)

	local var_6_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		}
	}

	var_6_14:RegisterAnimationSequence("ShowIcon1", var_6_36)

	local function var_6_37()
		var_6_6:AnimateSequence("ShowIcon1")
		var_6_8:AnimateSequence("ShowIcon1")
		var_6_12:AnimateSequence("ShowIcon1")
		var_6_14:AnimateSequence("ShowIcon1")
	end

	var_6_0._sequences.ShowIcon1 = var_6_37

	local var_6_38
	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ShowIcon2", var_6_39)

	local var_6_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -235
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShowIcon2", var_6_40)

	local var_6_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 385
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ShowIcon2", var_6_41)

	local var_6_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_6_14:RegisterAnimationSequence("ShowIcon2", var_6_42)

	local function var_6_43()
		var_6_6:AnimateSequence("ShowIcon2")
		var_6_8:AnimateSequence("ShowIcon2")
		var_6_12:AnimateSequence("ShowIcon2")
		var_6_14:AnimateSequence("ShowIcon2")
	end

	var_6_0._sequences.ShowIcon2 = var_6_43

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BarracksChallengeStatus", BarracksChallengeStatus)
LockTable(_M)
