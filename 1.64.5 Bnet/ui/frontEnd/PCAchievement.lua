module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.CompletedNotification.NewText:getLocalRect()
	local var_1_4 = arg_1_0.CompletedNotification.NewText:getText()
	local var_1_5 = arg_1_0.CompletedNotification.NewText:GetCurrentFont()
	local var_1_6, var_1_7, var_1_8, var_1_9 = GetTextDimensions(var_1_4, var_1_5, var_1_3 - var_1_1, nil, 1 * _1080p)
	local var_1_10 = var_1_8 - var_1_6
	local var_1_11 = 25 * _1080p

	arg_1_0.CompletedNotification:SetAnchorsAndPosition(1, 0, 1, 0, -(var_1_10 + 25), var_1_11 - 30, var_1_1 - 25, -20 * _1080p)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_1_0, "WZSetup")
	end
end

function PCAchievement(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 220 * _1080p)

	var_4_0.id = "PCAchievement"
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

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_4_4:SetAlpha(0.7, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_4_5 = LUI.UIImage.new()
		var_4_5.id = "TextureLayer"

		var_4_5:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_4_5:SetAlpha(0, 0)
		var_4_5:SetPixelGridEnabled(true)
		var_4_5:SetPixelGridContrast(0.8, 0)
		var_4_5:SetPixelGridBlockWidth(2, 0)
		var_4_5:SetPixelGridBlockHeight(2, 0)
		var_4_5:SetPixelGridGutterWidth(1, 0)
		var_4_5:SetPixelGridGutterHeight(1, 0)
		var_4_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 566, 0, _1080p * 220)
		var_4_0:addElement(var_4_5)

		var_4_0.TextureLayer = var_4_5
	end

	local var_4_6

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_4_6 = LUI.UIImage.new()
		var_4_6.id = "Glow"

		var_4_6:SetAlpha(0, 0)
		var_4_6:SetPixelGridEnabled(true)
		var_4_6:SetPixelGridContrast(0.5, 0)
		var_4_6:SetPixelGridBlockWidth(2, 0)
		var_4_6:SetPixelGridBlockHeight(2, 0)
		var_4_6:SetPixelGridGutterWidth(1, 0)
		var_4_6:SetPixelGridGutterHeight(1, 0)
		var_4_6:setImage(RegisterMaterial("button_glow"), 0)
		var_4_6:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
		var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -8, _1080p * 575, _1080p * -8, _1080p * 220)
		var_4_0:addElement(var_4_6)

		var_4_0.Glow = var_4_6
	end

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Image"

	var_4_8:SetAlpha(0.6, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 200, _1080p * 20, _1080p * 200)
	var_4_0:addElement(var_4_8)

	var_4_0.Image = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Name"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_10:SetStartupDelay(1000)
	var_4_10:SetLineHoldTime(400)
	var_4_10:SetAnimMoveTime(150)
	var_4_10:SetAnimMoveSpeed(50)
	var_4_10:SetEndDelay(1000)
	var_4_10:SetCrossfadeTime(400)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(1)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 216, _1080p * 540, _1080p * 15, _1080p * 39)
	var_4_0:addElement(var_4_10)

	var_4_0.Name = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "Description"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 540, _1080p * 75, _1080p * 95)
	var_4_0:addElement(var_4_12)

	var_4_0.Description = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "GameMode"

	var_4_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_14:SetAlpha(0.8, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 216, _1080p * 540, _1080p * 41, _1080p * 59)
	var_4_0:addElement(var_4_14)

	var_4_0.GameMode = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Separator"

	var_4_16:SetRGBFromTable(SWATCHES.CAC.abilityText, 0)
	var_4_16:SetAlpha(0.4, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 218, _1080p * 540, _1080p * 68, _1080p * 69)
	var_4_0:addElement(var_4_16)

	var_4_0.Separator = var_4_16

	local var_4_17
	local var_4_18 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 0
	}
	local var_4_19 = LUI.UIBorder.new(var_4_18)

	var_4_19.id = "Border"

	var_4_19:SetAlpha(0, 0)
	var_4_19:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_19:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_19:SetBorderThicknessTop(_1080p * 2, 0)
	var_4_19:SetBorderThicknessBottom(_1080p * 0, 0)
	var_4_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 560, 0, _1080p * 255)
	var_4_0:addElement(var_4_19)

	var_4_0.Border = var_4_19

	local var_4_20
	local var_4_21 = MenuBuilder.BuildRegisteredType("CompletedItemNotification", {
		controllerIndex = var_4_1
	})

	var_4_21.id = "CompletedNotification"

	var_4_21:SetAlpha(0, 0)
	var_4_21.NewText:SetLeft(0, 0)
	var_4_21.NewText:SetRight(_1080p * -15, 0)
	var_4_21.NewText:setText(Engine.CBBHFCGDIC("MENU/COMPLETED"), 0)
	var_4_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 414, _1080p * 540, _1080p * 170, _1080p * 200)
	var_4_0:addElement(var_4_21)

	var_4_0.CompletedNotification = var_4_21

	local var_4_22

	if CONDITIONS.IsMagmaGameMode() then
		var_4_22 = LUI.UIImage.new()
		var_4_22.id = "BotBorderWZ"

		var_4_22:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_4_22:SetAlpha(0.6, 0)
		var_4_22:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
		var_4_0:addElement(var_4_22)

		var_4_0.BotBorderWZ = var_4_22
	end

	local var_4_23

	if CONDITIONS.IsMagmaGameMode() then
		var_4_23 = LUI.UIImage.new()
		var_4_23.id = "TopBorderWZ"

		var_4_23:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_4_23:SetAlpha(0.6, 0)
		var_4_23:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_4_0:addElement(var_4_23)

		var_4_0.TopBorderWZ = var_4_23
	end

	local function var_4_24()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_24

	local var_4_25
	local var_4_26 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Completed", var_4_26)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("Completed", var_4_27)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("Completed", var_4_28)
	end

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Completed", var_4_29)

	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		}
	}

	var_4_10:RegisterAnimationSequence("Completed", var_4_30)

	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		}
	}

	var_4_12:RegisterAnimationSequence("Completed", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		}
	}

	var_4_14:RegisterAnimationSequence("Completed", var_4_32)

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Completed", var_4_33)

	local var_4_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Completed", var_4_34)

	local function var_4_35()
		var_4_4:AnimateSequence("Completed")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("Completed")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("Completed")
		end

		var_4_8:AnimateSequence("Completed")
		var_4_10:AnimateSequence("Completed")
		var_4_12:AnimateSequence("Completed")
		var_4_14:AnimateSequence("Completed")
		var_4_19:AnimateSequence("Completed")
		var_4_21:AnimateSequence("Completed")
	end

	var_4_0._sequences.Completed = var_4_35

	local var_4_36
	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_37)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_38 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 560
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 220
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("ButtonOver", var_4_38)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -7
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -7
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 568
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 228
			},
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 568
			}
		}

		var_4_6:RegisterAnimationSequence("ButtonOver", var_4_39)
	end

	local var_4_40 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonOver", var_4_40)

	local var_4_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.descText
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonOver", var_4_41)

	local var_4_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonOver", var_4_42)

	local var_4_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		}
	}

	var_4_19:RegisterAnimationSequence("ButtonOver", var_4_43)

	local function var_4_44()
		var_4_4:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("ButtonOver")
		end

		var_4_10:AnimateSequence("ButtonOver")
		var_4_12:AnimateSequence("ButtonOver")
		var_4_14:AnimateSequence("ButtonOver")
		var_4_19:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_44

	local var_4_45
	local var_4_46 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_46)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_47 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("ButtonUp", var_4_47)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("ButtonUp", var_4_48)
	end

	local var_4_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonUp", var_4_49)

	local var_4_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.descText
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonUp", var_4_50)

	local var_4_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonUp", var_4_51)

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("ButtonUp", var_4_52)

	local function var_4_53()
		var_4_4:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("ButtonUp")
		end

		var_4_10:AnimateSequence("ButtonUp")
		var_4_12:AnimateSequence("ButtonUp")
		var_4_14:AnimateSequence("ButtonUp")
		var_4_19:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_53

	local var_4_54
	local var_4_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_55)

	local var_4_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_56)

	local var_4_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		}
	}

	var_4_14:RegisterAnimationSequence("AR", var_4_57)

	local function var_4_58()
		var_4_10:AnimateSequence("AR")
		var_4_12:AnimateSequence("AR")
		var_4_14:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_58

	local var_4_59
	local var_4_60 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Idle", var_4_60)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_61 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("Idle", var_4_61)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_62 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("Idle", var_4_62)
	end

	local var_4_63 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("Idle", var_4_63)

	local var_4_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		}
	}

	var_4_12:RegisterAnimationSequence("Idle", var_4_64)

	local var_4_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_4_14:RegisterAnimationSequence("Idle", var_4_65)

	local var_4_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Idle", var_4_66)

	local var_4_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Idle", var_4_67)

	local function var_4_68()
		var_4_4:AnimateSequence("Idle")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("Idle")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("Idle")
		end

		var_4_8:AnimateSequence("Idle")
		var_4_12:AnimateSequence("Idle")
		var_4_14:AnimateSequence("Idle")
		var_4_19:AnimateSequence("Idle")
		var_4_21:AnimateSequence("Idle")
	end

	var_4_0._sequences.Idle = var_4_68

	local var_4_69
	local var_4_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_4:RegisterAnimationSequence("WZSetup", var_4_70)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_71 = {}

		var_4_5:RegisterAnimationSequence("WZSetup", var_4_71)
	end

	local var_4_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_4_10:RegisterAnimationSequence("WZSetup", var_4_72)

	local var_4_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 118
		}
	}

	var_4_12:RegisterAnimationSequence("WZSetup", var_4_73)

	local var_4_74 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 74
		}
	}

	var_4_14:RegisterAnimationSequence("WZSetup", var_4_74)

	local var_4_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		}
	}

	var_4_16:RegisterAnimationSequence("WZSetup", var_4_75)

	local var_4_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("WZSetup", var_4_76)

	local var_4_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight,
			child = var_4_0.CompletedNotification.Highlight
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -141
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_4_21:RegisterAnimationSequence("WZSetup", var_4_77)

	local function var_4_78()
		var_4_4:AnimateSequence("WZSetup")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("WZSetup")
		end

		var_4_10:AnimateSequence("WZSetup")
		var_4_12:AnimateSequence("WZSetup")
		var_4_14:AnimateSequence("WZSetup")
		var_4_16:AnimateSequence("WZSetup")
		var_4_19:AnimateSequence("WZSetup")
		var_4_21:AnimateSequence("WZSetup")
	end

	var_4_0._sequences.WZSetup = var_4_78

	local var_4_79
	local var_4_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		},
		{
			value = 0.9,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonOver", var_4_80)

	local var_4_81 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipButtonOver", var_4_81)

	local var_4_82 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipButtonOver", var_4_82)

	if CONDITIONS.IsMagmaGameMode() then
		local var_4_83 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_22:RegisterAnimationSequence("WZWipButtonOver", var_4_83)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_4_84 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_23:RegisterAnimationSequence("WZWipButtonOver", var_4_84)
	end

	local function var_4_85()
		var_4_4:AnimateSequence("WZWipButtonOver")
		var_4_10:AnimateSequence("WZWipButtonOver")
		var_4_14:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsMagmaGameMode() then
			var_4_22:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_4_23:AnimateSequence("WZWipButtonOver")
		end
	end

	var_4_0._sequences.WZWipButtonOver = var_4_85

	local var_4_86

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("WZWipIdle", var_4_87)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_88 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipIdle", var_4_88)
	end

	local var_4_89 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipIdle", var_4_89)

	local var_4_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipIdle", var_4_90)

	local var_4_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipIdle", var_4_91)

	local var_4_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("WZWipIdle", var_4_92)

	local var_4_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("WZWipIdle", var_4_93)

	local function var_4_94()
		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("WZWipIdle")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("WZWipIdle")
		end

		var_4_8:AnimateSequence("WZWipIdle")
		var_4_12:AnimateSequence("WZWipIdle")
		var_4_14:AnimateSequence("WZWipIdle")
		var_4_19:AnimateSequence("WZWipIdle")
		var_4_21:AnimateSequence("WZWipIdle")
	end

	var_4_0._sequences.WZWipIdle = var_4_94

	local var_4_95
	local var_4_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonUp", var_4_96)

	local var_4_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipButtonUp", var_4_97)

	local var_4_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.descText
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipButtonUp", var_4_98)

	local var_4_99 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipButtonUp", var_4_99)

	local var_4_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("WZWipButtonUp", var_4_100)

	if CONDITIONS.IsMagmaGameMode() then
		local var_4_101 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_22:RegisterAnimationSequence("WZWipButtonUp", var_4_101)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_4_102 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_23:RegisterAnimationSequence("WZWipButtonUp", var_4_102)
	end

	local function var_4_103()
		var_4_4:AnimateSequence("WZWipButtonUp")
		var_4_10:AnimateSequence("WZWipButtonUp")
		var_4_12:AnimateSequence("WZWipButtonUp")
		var_4_14:AnimateSequence("WZWipButtonUp")
		var_4_19:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsMagmaGameMode() then
			var_4_22:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_4_23:AnimateSequence("WZWipButtonUp")
		end
	end

	var_4_0._sequences.WZWipButtonUp = var_4_103

	local var_4_104

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_105 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("WZWipCompleted", var_4_105)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_106 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipCompleted", var_4_106)
	end

	local var_4_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipCompleted", var_4_107)

	local var_4_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipCompleted", var_4_108)

	local var_4_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipCompleted", var_4_109)

	local var_4_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipCompleted", var_4_110)

	local var_4_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("WZWipCompleted", var_4_111)

	local var_4_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("WZWipCompleted", var_4_112)

	local function var_4_113()
		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("WZWipCompleted")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("WZWipCompleted")
		end

		var_4_8:AnimateSequence("WZWipCompleted")
		var_4_10:AnimateSequence("WZWipCompleted")
		var_4_12:AnimateSequence("WZWipCompleted")
		var_4_14:AnimateSequence("WZWipCompleted")
		var_4_19:AnimateSequence("WZWipCompleted")
		var_4_21:AnimateSequence("WZWipCompleted")
	end

	var_4_0._sequences.WZWipCompleted = var_4_113

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("PCAchievement", PCAchievement)
LockTable(_M)
