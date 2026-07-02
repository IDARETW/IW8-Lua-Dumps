module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = Engine.CBBHFCGDIC("TOURNAMENT/READY_UP")
	local var_1_1 = "ReadyUp"
	local var_1_2 = Tournament.BEFJGJJBEI()
	local var_1_3 = var_1_2 ~= arg_1_0._participatoinStatus
	local var_1_4 = var_1_2 == MP.TournamentParticipationStatus.VICTORIOUS
	local var_1_5 = var_1_2 ~= MP.TournamentParticipationStatus.NOT_PARTICIPATING and var_1_2 ~= MP.TournamentParticipationStatus.ACTIVE

	if not arg_1_0._timerExpired then
		if var_1_4 then
			arg_1_0:SetAlpha(1)
			arg_1_0.StatusText:setText(Engine.CBBHFCGDIC("TOURNAMENT/VICTORIOUS"))
			LAYOUT.SetTextBoxSize(arg_1_0.StatusText, arg_1_0.Backer, Engine.CBBHFCGDIC("TOURNAMENT/VICTORIOUS"), 10, nil, LUI.Alignment.Center, arg_1_0._promptTextInitialized and 200 or 0, LUI.EASING.outQuadratic)

			arg_1_0._promptTextInitialized = true

			local var_1_6 = arg_1_0.Backer:GetCurrentAnchorsAndPositions()

			arg_1_0.Gradient:SetLeft(var_1_6.left)
			arg_1_0.Gradient:SetRight(var_1_6.right)

			if var_1_3 then
				ACTIONS.AnimateSequence(arg_1_0, "Victorious")
				ACTIONS.AnimateSequence(arg_1_0, "TextBlinkOff")
				ACTIONS.AnimateSequence(arg_1_0, "HideTimer")
			end
		elseif var_1_5 then
			arg_1_0:SetAlpha(1)
			arg_1_0.StatusText:setText(Engine.CBBHFCGDIC("TOURNAMENT/ELIMINATED"))
			LAYOUT.SetTextBoxSize(arg_1_0.StatusText, arg_1_0.Backer, arg_1_0.StatusText:getText(), 10, nil, LUI.Alignment.Center, arg_1_0._promptTextInitialized and 200 or 0, LUI.EASING.outQuadratic)

			arg_1_0._promptTextInitialized = true

			if var_1_3 then
				ACTIONS.AnimateSequence(arg_1_0, "Waiting")
				ACTIONS.AnimateSequence(arg_1_0, "TextBlinkOff")
				ACTIONS.AnimateSequence(arg_1_0, "HideTimer")
			end
		else
			local var_1_7 = TOURNAMENT.GetMyCurrentMatchInfo()

			if var_1_7 then
				arg_1_0:SetAlpha(1)

				local var_1_8 = var_1_7.teams[1].teamID ~= -1 and var_1_7.teams[2].teamID ~= -1

				if TOURNAMENT.CanReadyUp() then
					arg_1_0.bindButton._readyPressed = false
					var_1_0 = Engine.CBBHFCGDIC("TOURNAMENT/READY_UP")
					var_1_1 = "ReadyUp"

					ACTIONS.AnimateSequence(arg_1_0, "ShowTimer")

					local var_1_9 = Engine.BFBIDEGDFB()
					local var_1_10 = Dvar.CFHDGABACF("RQLRMRPTT")
					local var_1_11 = Tournament.BEEFFFJDFE()
					local var_1_12 = var_1_9 + (var_1_10 - var_1_11 - 5000)

					if not arg_1_0._timerInitialized and var_1_11 < var_1_10 - 5000 and var_1_11 > 0 then
						arg_1_0.CountdownTimer:setEndTime(var_1_12)

						arg_1_0._timerInitialized = true
					end
				elseif not Tournament.DBEBAGHJCA() and not var_1_8 then
					var_1_0 = Engine.CBBHFCGDIC("TOURNAMENT/WAITING_ON_PREV_MATCH")
					var_1_1 = "Waiting"

					ACTIONS.AnimateSequence(arg_1_0, "HideTimer")
				elseif Tournament.DBEBAGHJCA() then
					var_1_0 = Engine.CBBHFCGDIC("TOURNAMENT/WAITING_ON_READY_UP")
					var_1_1 = "Waiting"

					ACTIONS.AnimateSequence(arg_1_0, "ShowTimer")
				end

				arg_1_0.StatusText:setText(var_1_0)
				LAYOUT.SetTextBoxSize(arg_1_0.StatusText, arg_1_0.Backer, var_1_0, 10, nil, LUI.Alignment.Center, arg_1_0._promptTextInitialized and 200 or 0, LUI.EASING.outQuadratic)

				arg_1_0._promptTextInitialized = true

				ACTIONS.AnimateSequence(arg_1_0, var_1_1)

				if var_1_1 == "ReadyUp" then
					local var_1_13 = arg_1_0.Backer:GetCurrentAnchorsAndPositions()

					arg_1_0.BackerPulse:SetLeft(var_1_13.left)
					arg_1_0.BackerPulse:SetRight(var_1_13.right)
					ACTIONS.AnimateSequence(arg_1_0, "PulseOn")
					ACTIONS.AnimateSequence(arg_1_0, "TextBlinkOff")
				else
					ACTIONS.AnimateSequence(arg_1_0, "PulseOff")
					ACTIONS.AnimateSequence(arg_1_0, "TextBlinkOn")
				end
			else
				arg_1_0:SetAlpha(0)
			end
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "PulseOff")
		ACTIONS.AnimateSequence(arg_1_0, "TextBlinkOn")
		ACTIONS.AnimateSequence(arg_1_0, "HideTimer")
		ACTIONS.AnimateSequence(arg_1_0, "Waiting")
		arg_1_0.StatusText:setText(Engine.CBBHFCGDIC("TOURNAMENT/READY_ALL_PLAYERS"))
		LAYOUT.SetTextBoxSize(arg_1_0.StatusText, arg_1_0.Backer, arg_1_0.StatusText:getText(), 10, nil, LUI.Alignment.Center, arg_1_0._promptTextInitialized and 200 or 0, LUI.EASING.outQuadratic)
	end

	arg_1_0._participatoinStatus = var_1_2
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdatePlayerMatchStatus = var_0_0
	arg_2_0._promptTextInitialized = false
	arg_2_0.bindButton = LUI.UIBindButton.new()

	arg_2_0:addElement(arg_2_0.bindButton)
	arg_2_0.bindButton:addEventHandler("button_alt1", function(arg_3_0, arg_3_1)
		if TOURNAMENT.CanReadyUp() and not arg_3_0._readyPressed then
			arg_3_0._readyPressed = Tournament.DCEGEADDJG(1)

			Engine.BJDBIAGIDA("ui_select_alt")
		end
	end)
	arg_2_0.CountdownTimer:addEventHandler("timeout", function(arg_4_0, arg_4_1)
		arg_2_0._timerExpired = true
	end)
end

function TournamentPlayerMatchStatus(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 76 * _1080p)

	var_5_0.id = "TournamentPlayerMatchStatus"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "BackerPulse"

	var_5_4:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_5_4:SetAlpha(0, 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, 0, _1080p * 40)
	var_5_0:addElement(var_5_4)

	var_5_0.BackerPulse = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Backer"

	var_5_6:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_5_6:SetAlpha(0.4, 0)
	var_5_6:SetPixelGridEnabled(true)
	var_5_6:SetPixelGridContrast(0.2, 0)
	var_5_6:SetPixelGridBlockWidth(2, 0)
	var_5_6:SetPixelGridBlockHeight(2, 0)
	var_5_6:SetPixelGridGutterWidth(1, 0)
	var_5_6:SetPixelGridGutterHeight(1, 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, 0, _1080p * 44)
	var_5_0:addElement(var_5_6)

	var_5_0.Backer = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Gradient"

	var_5_8:SetRGBFromTable(SWATCHES.CashPlacement.GoldBody, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.6, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, 0, _1080p * 44)
	var_5_0:addElement(var_5_8)

	var_5_0.Gradient = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "StatusText"

	var_5_10:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_10:SetTintFontIcons(true)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * -28, _1080p * -4)
	var_5_0:addElement(var_5_10)

	var_5_0.StatusText = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "CountdownTimer"

	var_5_12:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_5_12:SetAlpha(0, 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:setEndTime(0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -54, _1080p * 54, 0, _1080p * 30)
	var_5_0:addElement(var_5_12)

	var_5_0.CountdownTimer = var_5_12

	local function var_5_13()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_13

	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBacker,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_6:RegisterAnimationSequence("ReadyUp", var_5_14)

	local var_5_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ReadyUp", var_5_15)

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.roundText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_5_10:RegisterAnimationSequence("ReadyUp", var_5_16)

	local function var_5_17()
		var_5_6:AnimateSequence("ReadyUp")
		var_5_8:AnimateSequence("ReadyUp")
		var_5_10:AnimateSequence("ReadyUp")
	end

	var_5_0._sequences.ReadyUp = var_5_17

	local var_5_18 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelBacker,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_6:RegisterAnimationSequence("Waiting", var_5_18)

	local var_5_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Waiting", var_5_19)

	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.roundText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_5_10:RegisterAnimationSequence("Waiting", var_5_20)

	local function var_5_21()
		var_5_6:AnimateSequence("Waiting")
		var_5_8:AnimateSequence("Waiting")
		var_5_10:AnimateSequence("Waiting")
	end

	var_5_0._sequences.Waiting = var_5_21

	local var_5_22 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.4,
			duration = 800,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.4,
			duration = 900,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_4:RegisterAnimationSequence("PulseOn", var_5_22)

	local function var_5_23()
		var_5_4:AnimateLoop("PulseOn")
	end

	var_5_0._sequences.PulseOn = var_5_23

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("PulseOff", var_5_24)

	local function var_5_25()
		var_5_4:AnimateSequence("PulseOff")
	end

	var_5_0._sequences.PulseOff = var_5_25

	local var_5_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("TextBlinkOn", var_5_26)

	local function var_5_27()
		var_5_10:AnimateLoop("TextBlinkOn")
	end

	var_5_0._sequences.TextBlinkOn = var_5_27

	local var_5_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("TextBlinkOff", var_5_28)

	local function var_5_29()
		var_5_10:AnimateSequence("TextBlinkOff")
	end

	var_5_0._sequences.TextBlinkOff = var_5_29

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		}
	}

	var_5_4:RegisterAnimationSequence("ShowTimer", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		}
	}

	var_5_6:RegisterAnimationSequence("ShowTimer", var_5_31)

	local var_5_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ShowTimer", var_5_32)

	local function var_5_33()
		var_5_4:AnimateSequence("ShowTimer")
		var_5_6:AnimateSequence("ShowTimer")
		var_5_12:AnimateSequence("ShowTimer")
	end

	var_5_0._sequences.ShowTimer = var_5_33

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		}
	}

	var_5_4:RegisterAnimationSequence("HideTimer", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		}
	}

	var_5_6:RegisterAnimationSequence("HideTimer", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("HideTimer", var_5_36)

	local function var_5_37()
		var_5_4:AnimateSequence("HideTimer")
		var_5_6:AnimateSequence("HideTimer")
		var_5_12:AnimateSequence("HideTimer")
	end

	var_5_0._sequences.HideTimer = var_5_37

	local var_5_38 = {
		{
			value = 13342014,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Victorious", var_5_38)

	local var_5_39 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_8:RegisterAnimationSequence("Victorious", var_5_39)

	local var_5_40 = {
		{
			value = 16775648,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		}
	}

	var_5_10:RegisterAnimationSequence("Victorious", var_5_40)

	local function var_5_41()
		var_5_6:AnimateLoop("Victorious")
		var_5_8:AnimateLoop("Victorious")
		var_5_10:AnimateLoop("Victorious")
	end

	var_5_0._sequences.Victorious = var_5_41

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("TournamentPlayerMatchStatus", TournamentPlayerMatchStatus)
LockTable(_M)
