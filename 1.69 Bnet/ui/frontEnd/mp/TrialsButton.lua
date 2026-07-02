module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.TrialsButton.Background:SetBackgroundVisibility(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetBackgroundVisibility = var_0_0

	local var_2_0 = CONDITIONS.IsGameBattlesAllowed(arg_2_0)
	local var_2_1 = CONDITIONS.AreTrialsEnabled(arg_2_0)

	arg_2_0.TrialsButton:SetMinTextRight(220, true)
	arg_2_0.TrialsButton:Contract()

	if CONDITIONS.AreTrialsEnabled(arg_2_0) then
		local var_2_2 = Loot.DEBEIFJEEG(arg_2_1, TRIALS.TicketID)

		arg_2_0.TrialsCount:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_TICKET_COUNT", var_2_2))
	end

	local function var_2_3(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
	end

	local function var_2_4(arg_4_0)
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	arg_2_0:addEventHandler("disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "Disable")

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_2_0, "ARDisable")
		end
	end)
	arg_2_0:addEventHandler("enable", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "Enable")
	end)
	arg_2_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			var_2_3(arg_7_0)
			WZWIP.AnimateThemeElement(arg_7_0, "ButtonOver")
		else
			WZWIP.AnimateThemeElement(arg_7_0, "ButtonOverKBM")
		end
	end)
	arg_2_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		var_2_4(arg_8_0)
		WZWIP.AnimateThemeElement(arg_8_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		var_2_4(arg_9_0)
		WZWIP.AnimateThemeElement(arg_9_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_10_0, arg_10_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			var_2_3(arg_10_0)
			WZWIP.AnimateThemeElement(arg_10_0, "ButtonOver")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")

		if var_2_0 and var_2_1 then
			ACTIONS.AnimateSequence(arg_2_0.TrialsButton, "ARGameBattles")
		end
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function TrialsButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_11_0.id = "TrialsButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("FeaturedAccordionButton", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "TrialsButton"

	var_11_4.Background.BackgroundImage:setImage(RegisterMaterial("button_realism"), 0)
	var_11_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRIALS")), 0)
	var_11_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TRIALS_DESC"), 0)
	var_11_4.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.TrialsButton = var_11_4

	local var_11_5

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		var_11_5 = LUI.UIImage.new()
		var_11_5.id = "TrialIcon"

		var_11_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_11_5:setImage(RegisterMaterial("icon_killhouse_ticket"), 0)
		var_11_5:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -18, _1080p * -12, _1080p * 12)
		var_11_0:addElement(var_11_5)

		var_11_0.TrialIcon = var_11_5
	end

	local var_11_6

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		var_11_6 = LUI.UIStyledText.new()
		var_11_6.id = "TrialsCount"

		var_11_6:SetRGBFromTable(SWATCHES.Store.Description, 0)
		var_11_6:setText("x99", 0)
		var_11_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_11_6:SetAlignment(LUI.Alignment.Right)
		var_11_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -95, _1080p * -45, _1080p * -12, _1080p * 12)
		var_11_0:addElement(var_11_6)

		var_11_0.TrialsCount = var_11_6
	end

	local function var_11_7()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_7

	local var_11_8

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_9 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -60
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -36
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_11_5:RegisterAnimationSequence("ButtonOver", var_11_9)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_10 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -60
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -36
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_11_6:RegisterAnimationSequence("ButtonOver", var_11_10)
	end

	local function var_11_11()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("ButtonOver")
		end
	end

	var_11_0._sequences.ButtonOver = var_11_11

	local var_11_12

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_13 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			}
		}

		var_11_5:RegisterAnimationSequence("ButtonUp", var_11_13)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_14 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			}
		}

		var_11_6:RegisterAnimationSequence("ButtonUp", var_11_14)
	end

	local function var_11_15()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("ButtonUp")
		end
	end

	var_11_0._sequences.ButtonUp = var_11_15

	local var_11_16

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -387
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -363
			}
		}

		var_11_5:RegisterAnimationSequence("AR", var_11_17)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_18 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -442
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -390
			}
		}

		var_11_6:RegisterAnimationSequence("AR", var_11_18)
	end

	local function var_11_19()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("AR")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("AR")
		end
	end

	var_11_0._sequences.AR = var_11_19

	local var_11_20

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_21 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -33
			}
		}

		var_11_5:RegisterAnimationSequence("Disable", var_11_21)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_22 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -110
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -60
			}
		}

		var_11_6:RegisterAnimationSequence("Disable", var_11_22)
	end

	local function var_11_23()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("Disable")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("Disable")
		end
	end

	var_11_0._sequences.Disable = var_11_23

	local var_11_24

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_25 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_11_5:RegisterAnimationSequence("Enable", var_11_25)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_26 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_11_6:RegisterAnimationSequence("Enable", var_11_26)
	end

	local function var_11_27()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("Enable")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("Enable")
		end
	end

	var_11_0._sequences.Enable = var_11_27

	local var_11_28

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_29 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_11_5:RegisterAnimationSequence("ButtonOverKBM", var_11_29)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_30 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_11_6:RegisterAnimationSequence("ButtonOverKBM", var_11_30)
	end

	local function var_11_31()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("ButtonOverKBM")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("ButtonOverKBM")
		end
	end

	var_11_0._sequences.ButtonOverKBM = var_11_31

	local var_11_32

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_33 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -349
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -325
			}
		}

		var_11_5:RegisterAnimationSequence("ARDisable", var_11_33)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_34 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -412
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -352
			}
		}

		var_11_6:RegisterAnimationSequence("ARDisable", var_11_34)
	end

	local function var_11_35()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("ARDisable")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("ARDisable")
		end
	end

	var_11_0._sequences.ARDisable = var_11_35

	local var_11_36

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_37 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			},
			{
				value = 0.5,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_5:RegisterAnimationSequence("WZWipSetup", var_11_37)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_38 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			},
			{
				value = 0.5,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_6:RegisterAnimationSequence("WZWipSetup", var_11_38)
	end

	local function var_11_39()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("WZWipSetup")
		end
	end

	var_11_0._sequences.WZWipSetup = var_11_39

	local var_11_40

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_41 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -60
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -36
			}
		}

		var_11_5:RegisterAnimationSequence("WZWipButtonOver", var_11_41)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_42 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -60
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -36
			}
		}

		var_11_6:RegisterAnimationSequence("WZWipButtonOver", var_11_42)
	end

	local function var_11_43()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("WZWipButtonOver")
		end
	end

	var_11_0._sequences.WZWipButtonOver = var_11_43

	local var_11_44

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_45 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -33
			}
		}

		var_11_5:RegisterAnimationSequence("WZWipDisable", var_11_45)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_46 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -110
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -60
			}
		}

		var_11_6:RegisterAnimationSequence("WZWipDisable", var_11_46)
	end

	local function var_11_47()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("WZWipDisable")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("WZWipDisable")
		end
	end

	var_11_0._sequences.WZWipDisable = var_11_47

	local var_11_48

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_49 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_5:RegisterAnimationSequence("WZEnable", var_11_49)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_50 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_6:RegisterAnimationSequence("WZEnable", var_11_50)
	end

	local function var_11_51()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("WZEnable")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("WZEnable")
		end
	end

	var_11_0._sequences.WZEnable = var_11_51

	local var_11_52

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_53 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			}
		}

		var_11_5:RegisterAnimationSequence("WZWipButtonOverKBM", var_11_53)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_54 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			}
		}

		var_11_6:RegisterAnimationSequence("WZWipButtonOverKBM", var_11_54)
	end

	local function var_11_55()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("WZWipButtonOverKBM")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("WZWipButtonOverKBM")
		end
	end

	var_11_0._sequences.WZWipButtonOverKBM = var_11_55

	local var_11_56

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_57 = {
			{
				value = 0.5,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			}
		}

		var_11_5:RegisterAnimationSequence("WZWipButtonUp", var_11_57)
	end

	if CONDITIONS.AreTrialsEnabled(var_11_0) then
		local var_11_58 = {
			{
				value = 0.5,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			}
		}

		var_11_6:RegisterAnimationSequence("WZWipButtonUp", var_11_58)
	end

	local function var_11_59()
		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_5:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.AreTrialsEnabled(var_11_0) then
			var_11_6:AnimateSequence("WZWipButtonUp")
		end
	end

	var_11_0._sequences.WZWipButtonUp = var_11_59

	var_0_1(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("TrialsButton", TrialsButton)
LockTable(_M)
