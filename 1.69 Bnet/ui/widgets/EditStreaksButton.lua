module(..., package.seeall)

local var_0_0 = 32 * _1080p
local var_0_1 = 8 * _1080p

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._streakRef = arg_1_2

	if Engine.ECHCFGDDDF() then
		local var_1_0 = StringTable.BJJBBCJGEJ(CSV.streaks.file, CSV.streaks.cols.ref, arg_1_2)
		local var_1_1 = CSV.ReadRow(CSV.streaks, var_1_0)

		arg_1_1.Image:setImage(RegisterMaterial(STREAK.GetImage(var_1_1.ref)))

		arg_1_1._killsRequired = Engine.CBBHFCGDIC("LUA_MENU/KILL_COUNT", var_1_1.kills)
		arg_1_1._scoreRequired = Engine.JCBDICCAH(var_1_1.scoreCost)
	elseif CONDITIONS.IsThirdGameMode() then
		local var_1_2 = StringTable.BJJBBCJGEJ(CSV.munitions.file, CSV.munitions.cols.ref, arg_1_2)
		local var_1_3 = CSV.ReadRow(CSV.munitions, var_1_2)

		arg_1_1.Image:setImage(RegisterMaterial(MUNITION.GetImage(var_1_3.ref)))

		arg_1_1._killsRequired = ""
		arg_1_1._scoreRequired = ""
	end
end

local function var_0_3(arg_2_0)
	if IsLanguageArabic() then
		local var_2_0 = arg_2_0._streakInfoWidgets[1]:GetCurrentAnchorsAndPositions().right

		for iter_2_0 = 1, #arg_2_0._streakInfoWidgets - 1 do
			var_2_0 = var_2_0 + LAYOUT.GetTextWidth(arg_2_0._streakInfoWidgets[iter_2_0].TextInfo) + var_0_0 + var_0_1

			arg_2_0._streakInfoWidgets[iter_2_0 + 1]:SetRight(var_2_0, 150)
		end
	else
		local var_2_1 = arg_2_0._streakInfoWidgets[#arg_2_0._streakInfoWidgets]:GetCurrentAnchorsAndPositions().right

		for iter_2_1 = #arg_2_0._streakInfoWidgets, 2, -1 do
			var_2_1 = var_2_1 - LAYOUT.GetTextWidth(arg_2_0._streakInfoWidgets[iter_2_1].TextInfo) - var_0_0 - var_0_1

			arg_2_0._streakInfoWidgets[iter_2_1 - 1]:SetRight(var_2_1, 150)
		end
	end
end

local function var_0_4(arg_3_0, arg_3_1)
	if arg_3_0._showKills then
		arg_3_1.TextInfo:setText(arg_3_1._killsRequired)
	else
		arg_3_1.TextInfo:setText(arg_3_1._scoreRequired)
	end
end

local function var_0_5(arg_4_0, arg_4_1)
	arg_4_0.PlayMenuButton:Contract()

	local function var_4_0(arg_5_0)
		arg_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_5_0.PlayMenuButton.Description:SetRight(330 * _1080p)
	end

	local function var_4_1(arg_6_0)
		arg_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	local function var_4_2(arg_7_0, arg_7_1, arg_7_2)
		if not LUI.IsLastInputMouseNavigation(arg_4_1) then
			var_4_0(arg_7_0)
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")

			if not arg_7_2 then
				arg_4_0.ScoreTogglePrompt:SetAlpha(1)
			end

			if Engine.ECHCFGDDDF() then
				var_0_3(arg_7_0)
			end

			for iter_7_0 = 1, #arg_7_0._streakInfoWidgets do
				ACTIONS.AnimateSequence(arg_7_0._streakInfoWidgets[iter_7_0], "Maximize")
			end
		else
			arg_4_0.ScoreTogglePrompt:setText("")
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOverKBM")
			arg_4_0.ScoreTogglePrompt:SetAlpha(0)

			for iter_7_1 = 1, #arg_7_0._streakInfoWidgets do
				ACTIONS.AnimateSequence(arg_7_0._streakInfoWidgets[iter_7_1], "Minimize")
			end
		end

		if arg_7_2 then
			arg_4_0.EquippedText:SetAlpha(0)
		end
	end

	local function var_4_3(arg_8_0, arg_8_1)
		var_4_1(arg_8_0)
		arg_4_0.ScoreTogglePrompt:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_8_0, "ButtonUpAR")
		else
			ACTIONS.AnimateSequence(arg_8_0, "ButtonUp")
		end

		for iter_8_0 = 1, #arg_8_0._streakInfoWidgets do
			ACTIONS.AnimateSequence(arg_8_0._streakInfoWidgets[iter_8_0], "Minimize")
		end
	end

	arg_4_0:addEventHandler("button_over", var_4_2)
	arg_4_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		var_4_2(arg_9_0, arg_9_1, true)
	end)
	arg_4_0:addEventHandler("button_up", var_4_3)
	arg_4_0:addEventHandler("button_disable", var_4_3)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

local function var_0_6(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.StreakInfoOne)
	assert(arg_10_0.StreakInfoTwo)
	assert(arg_10_0.StreakInfoThree)

	arg_10_0._killsRequired = ""
	arg_10_0._scoreRequired = ""

	if IsLanguageChinese() then
		arg_10_0.PlayMenuButton:SetMinTextRight(400 * _1080p, true)
	elseif not IsLanguageArabic() then
		arg_10_0.PlayMenuButton:SetMinTextRight(260 * _1080p, true)
	end

	arg_10_0.PlayMenuButton:Contract()

	local var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.killstreakSetups

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearAllPickupMunitions(arg_10_1)

		if CONDITIONS.IsWaveGameType() then
			var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups
		else
			var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups
		end
	end

	if Engine.ECHCFGDDDF() then
		arg_10_0._streakInfoWidgets = {
			arg_10_0.StreakInfoOne,
			arg_10_0.StreakInfoTwo,
			arg_10_0.StreakInfoThree
		}
	elseif CONDITIONS.IsThirdGameMode() then
		arg_10_0._streakInfoWidgets = {
			arg_10_0.StreakInfoThree,
			arg_10_0.StreakInfoTwo,
			arg_10_0.StreakInfoOne
		}
	end

	for iter_10_0, iter_10_1 in ddlpairs(var_10_0) do
		local var_10_1 = arg_10_0._streakInfoWidgets[iter_10_0 + 1]

		if Engine.ECHCFGDDDF() then
			var_0_2(arg_10_0, var_10_1, iter_10_1.killstreak:get())
		elseif CONDITIONS.IsThirdGameMode() then
			var_0_2(arg_10_0, var_10_1, iter_10_1.munition:get())
		end
	end

	if Engine.ECHCFGDDDF() then
		arg_10_0._showKills = true

		local function var_10_2()
			for iter_11_0 = 1, #arg_10_0._streakInfoWidgets do
				var_0_4(arg_10_0, arg_10_0._streakInfoWidgets[iter_11_0])
			end
		end

		var_10_2()

		if CONDITIONS.ShowScorestreakValues() then
			local var_10_3 = "LUA_MENU/VIEW_SCORESTREAK_VALUES_PROMPT"

			local function var_10_4()
				if not arg_10_0:isInFocus() or LUI.IsLastInputMouseNavigation(arg_10_1) then
					return
				end

				var_10_2()

				var_10_3 = "LUA_MENU/VIEW_SCORESTREAK_VALUES_PROMPT"

				if arg_10_0._showKills == false then
					var_10_3 = "LUA_MENU/VIEW_KILLSTREAK_VALUES_PROMPT"
				end

				arg_10_0.ScoreTogglePrompt:setText(Engine.CBBHFCGDIC(var_10_3))

				arg_10_0._showKills = not arg_10_0._showKills

				Engine.BJDBIAGIDA(SOUND_SETS.default.action)

				return true
			end

			var_10_4()

			local var_10_5 = LUI.UIBindButton.new()

			var_10_5.id = "selfBindButton"

			arg_10_0:addElement(var_10_5)

			arg_10_0.bindButton = var_10_5

			arg_10_0.bindButton:addEventHandler("button_right_trigger", var_10_4)

			local function var_10_6(arg_13_0, arg_13_1)
				if not LUI.IsLastInputMouseNavigation(arg_13_1.controllerIndex) then
					arg_13_0.ScoreTogglePrompt:setText(Engine.CBBHFCGDIC(var_10_3))
				else
					arg_13_0.ScoreTogglePrompt:setText("")
				end
			end

			arg_10_0:addAndCallEventHandler("update_input_type", var_10_6, {
				controllerIndex = arg_10_1
			})
		end
	end

	var_0_5(arg_10_0, arg_10_1)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_10_0, "AR")
	end

	if CONDITIONS.AreRestrictionsActive(arg_10_1) then
		arg_10_0.PlayMenuButton.Lock:closeTree()

		arg_10_0.PlayMenuButton.Lock = nil
	end
end

function EditStreaksButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_14_0.id = "EditStreaksButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "PlayMenuButton"

	var_14_4.Text:setText("", 0)
	var_14_4.Description:setText("", 0)
	var_14_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_14_4.DisabledText:SetAnimMoveTime(2000)
	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.PlayMenuButton = var_14_4

	local var_14_5
	local var_14_6 = MenuBuilder.BuildRegisteredType("EquippedItemPanel", {
		controllerIndex = var_14_1
	})

	var_14_6.id = "StreakInfoThree"

	var_14_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -140, _1080p * -40, _1080p * -16, _1080p * 16)
	var_14_0:addElement(var_14_6)

	var_14_0.StreakInfoThree = var_14_6

	local var_14_7
	local var_14_8 = MenuBuilder.BuildRegisteredType("EquippedItemPanel", {
		controllerIndex = var_14_1
	})

	var_14_8.id = "StreakInfoTwo"

	var_14_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -183, _1080p * -83, _1080p * -16, _1080p * 16)
	var_14_0:addElement(var_14_8)

	var_14_0.StreakInfoTwo = var_14_8

	local var_14_9
	local var_14_10 = MenuBuilder.BuildRegisteredType("EquippedItemPanel", {
		controllerIndex = var_14_1
	})

	var_14_10.id = "StreakInfoOne"

	var_14_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -227, _1080p * -127, _1080p * -16, _1080p * 16)
	var_14_0:addElement(var_14_10)

	var_14_0.StreakInfoOne = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIStyledText.new()

	var_14_12.id = "ScoreTogglePrompt"

	var_14_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_12:SetAlpha(0, 0)
	var_14_12:setText("", 0)
	var_14_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_12:SetAlignment(LUI.Alignment.Left)
	var_14_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_12:SetShadowRGBFromInt(0, 0)
	var_14_12:SetOutlineRGBFromInt(0, 0)
	var_14_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 24, _1080p * 419, _1080p * 43, _1080p * 63)
	var_14_0:addElement(var_14_12)

	var_14_0.ScoreTogglePrompt = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIStyledText.new()

	var_14_14.id = "EquippedText"

	var_14_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_14_14:SetAlpha(0, 0)
	var_14_14:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
	var_14_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_14:SetAlignment(LUI.Alignment.Left)
	var_14_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 20, _1080p * -23, _1080p * -32, _1080p * -10)
	var_14_0:addElement(var_14_14)

	var_14_0.EquippedText = var_14_14

	local function var_14_15()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_15

	local var_14_16
	local var_14_17 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_17)

	local var_14_18 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOver", var_14_18)

	local var_14_19 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOver", var_14_19)

	local var_14_20 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonOver", var_14_20)

	local function var_14_21()
		var_14_6:AnimateSequence("ButtonOver")
		var_14_8:AnimateSequence("ButtonOver")
		var_14_10:AnimateSequence("ButtonOver")
		var_14_14:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_21

	local var_14_22
	local var_14_23 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -140
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_23)

	local var_14_24 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -183
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -83
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonUp", var_14_24)

	local var_14_25 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -127
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -227
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUp", var_14_25)

	local var_14_26 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonUp", var_14_26)

	local function var_14_27()
		var_14_6:AnimateSequence("ButtonUp")
		var_14_8:AnimateSequence("ButtonUp")
		var_14_10:AnimateSequence("ButtonUp")
		var_14_14:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_27

	local var_14_28
	local var_14_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -275
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_6:RegisterAnimationSequence("AR", var_14_29)

	local var_14_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -418
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_8:RegisterAnimationSequence("AR", var_14_30)

	local var_14_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -462
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -362
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_10:RegisterAnimationSequence("AR", var_14_31)

	local var_14_32 = {}

	var_14_12:RegisterAnimationSequence("AR", var_14_32)

	local function var_14_33()
		var_14_6:AnimateSequence("AR")
		var_14_8:AnimateSequence("AR")
		var_14_10:AnimateSequence("AR")
		var_14_12:AnimateSequence("AR")
	end

	var_14_0._sequences.AR = var_14_33

	local var_14_34
	local var_14_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -375
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -275
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpAR", var_14_35)

	local var_14_36 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -418
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -318
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonUpAR", var_14_36)

	local var_14_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -362
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -462
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUpAR", var_14_37)

	local var_14_38 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonUpAR", var_14_38)

	local function var_14_39()
		var_14_6:AnimateSequence("ButtonUpAR")
		var_14_8:AnimateSequence("ButtonUpAR")
		var_14_10:AnimateSequence("ButtonUpAR")
		var_14_14:AnimateSequence("ButtonUpAR")
	end

	var_14_0._sequences.ButtonUpAR = var_14_39

	var_0_6(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("EditStreaksButton", EditStreaksButton)
LockTable(_M)
