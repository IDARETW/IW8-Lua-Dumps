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
end

function PCAchievement(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 220 * _1080p)

	var_2_0.id = "PCAchievement"
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

	var_2_4.id = "Background"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_2_4:SetAlpha(0.7, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "TextureLayer"

	var_2_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_2_6:SetAlpha(0, 0)
	var_2_6:SetPixelGridEnabled(true)
	var_2_6:SetPixelGridContrast(0.8, 0)
	var_2_6:SetPixelGridBlockWidth(2, 0)
	var_2_6:SetPixelGridBlockHeight(2, 0)
	var_2_6:SetPixelGridGutterWidth(1, 0)
	var_2_6:SetPixelGridGutterHeight(1, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 566, 0, _1080p * 220)
	var_2_0:addElement(var_2_6)

	var_2_0.TextureLayer = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Glow"

	var_2_8:SetAlpha(0, 0)
	var_2_8:SetPixelGridEnabled(true)
	var_2_8:SetPixelGridContrast(0.5, 0)
	var_2_8:SetPixelGridBlockWidth(2, 0)
	var_2_8:SetPixelGridBlockHeight(2, 0)
	var_2_8:SetPixelGridGutterWidth(1, 0)
	var_2_8:SetPixelGridGutterHeight(1, 0)
	var_2_8:setImage(RegisterMaterial("button_glow"), 0)
	var_2_8:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -8, _1080p * 575, _1080p * -8, _1080p * 220)
	var_2_0:addElement(var_2_8)

	var_2_0.Glow = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Image"

	var_2_10:SetAlpha(0.6, 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 200, _1080p * 20, _1080p * 200)
	var_2_0:addElement(var_2_10)

	var_2_0.Image = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "Name"

	var_2_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_12:setText("", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_12:SetStartupDelay(1000)
	var_2_12:SetLineHoldTime(400)
	var_2_12:SetAnimMoveTime(150)
	var_2_12:SetAnimMoveSpeed(50)
	var_2_12:SetEndDelay(1000)
	var_2_12:SetCrossfadeTime(400)
	var_2_12:SetFadeInTime(300)
	var_2_12:SetFadeOutTime(300)
	var_2_12:SetMaxVisibleLines(1)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 216, _1080p * 540, _1080p * 15, _1080p * 39)
	var_2_0:addElement(var_2_12)

	var_2_0.Name = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "Description"

	var_2_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_2_14:setText("", 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 540, _1080p * 75, _1080p * 93)
	var_2_0:addElement(var_2_14)

	var_2_0.Description = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIText.new()

	var_2_16.id = "GameMode"

	var_2_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_2_16:SetAlpha(0.8, 0)
	var_2_16:setText("", 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 216, _1080p * 540, _1080p * 41, _1080p * 59)
	var_2_0:addElement(var_2_16)

	var_2_0.GameMode = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "Separator"

	var_2_18:SetRGBFromTable(SWATCHES.CAC.abilityText, 0)
	var_2_18:SetAlpha(0.4, 0)
	var_2_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 218, _1080p * 540, _1080p * 68, _1080p * 69)
	var_2_0:addElement(var_2_18)

	var_2_0.Separator = var_2_18

	local var_2_19
	local var_2_20 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 0
	}
	local var_2_21 = LUI.UIBorder.new(var_2_20)

	var_2_21.id = "Border"

	var_2_21:SetAlpha(0, 0)
	var_2_21:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_21:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_21:SetBorderThicknessTop(_1080p * 2, 0)
	var_2_21:SetBorderThicknessBottom(_1080p * 0, 0)
	var_2_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 560, 0, _1080p * 255)
	var_2_0:addElement(var_2_21)

	var_2_0.Border = var_2_21

	local var_2_22
	local var_2_23 = MenuBuilder.BuildRegisteredType("CompletedItemNotification", {
		controllerIndex = var_2_1
	})

	var_2_23.id = "CompletedNotification"

	var_2_23:SetAlpha(0, 0)
	var_2_23.NewText:SetLeft(0, 0)
	var_2_23.NewText:SetRight(_1080p * -15, 0)
	var_2_23.NewText:setText(Engine.CBBHFCGDIC("MENU/COMPLETED"), 0)
	var_2_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 414, _1080p * 540, _1080p * 170, _1080p * 200)
	var_2_0:addElement(var_2_23)

	var_2_0.CompletedNotification = var_2_23

	local function var_2_24()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_24

	local var_2_25 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Completed", var_2_25)

	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Completed", var_2_26)

	local var_2_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Completed", var_2_27)

	local var_2_28 = {
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

	var_2_10:RegisterAnimationSequence("Completed", var_2_28)

	local var_2_29 = {
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

	var_2_12:RegisterAnimationSequence("Completed", var_2_29)

	local var_2_30 = {
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

	var_2_14:RegisterAnimationSequence("Completed", var_2_30)

	local var_2_31 = {
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

	var_2_16:RegisterAnimationSequence("Completed", var_2_31)

	local var_2_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_21:RegisterAnimationSequence("Completed", var_2_32)

	local var_2_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_23:RegisterAnimationSequence("Completed", var_2_33)

	local function var_2_34()
		var_2_4:AnimateSequence("Completed")
		var_2_6:AnimateSequence("Completed")
		var_2_8:AnimateSequence("Completed")
		var_2_10:AnimateSequence("Completed")
		var_2_12:AnimateSequence("Completed")
		var_2_14:AnimateSequence("Completed")
		var_2_16:AnimateSequence("Completed")
		var_2_21:AnimateSequence("Completed")
		var_2_23:AnimateSequence("Completed")
	end

	var_2_0._sequences.Completed = var_2_34

	local var_2_35 = {
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

	var_2_4:RegisterAnimationSequence("ButtonOver", var_2_35)

	local var_2_36 = {
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

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_36)

	local var_2_37 = {
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

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_37)

	local var_2_38 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonOver", var_2_38)

	local var_2_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.descText
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonOver", var_2_39)

	local var_2_40 = {
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

	var_2_16:RegisterAnimationSequence("ButtonOver", var_2_40)

	local var_2_41 = {
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

	var_2_21:RegisterAnimationSequence("ButtonOver", var_2_41)

	local function var_2_42()
		var_2_4:AnimateSequence("ButtonOver")
		var_2_6:AnimateSequence("ButtonOver")
		var_2_8:AnimateSequence("ButtonOver")
		var_2_12:AnimateSequence("ButtonOver")
		var_2_14:AnimateSequence("ButtonOver")
		var_2_16:AnimateSequence("ButtonOver")
		var_2_21:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_42

	local var_2_43 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonUp", var_2_43)

	local var_2_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_44)

	local var_2_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_45)

	local var_2_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonUp", var_2_46)

	local var_2_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.descText
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonUp", var_2_47)

	local var_2_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_2_16:RegisterAnimationSequence("ButtonUp", var_2_48)

	local var_2_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_21:RegisterAnimationSequence("ButtonUp", var_2_49)

	local function var_2_50()
		var_2_4:AnimateSequence("ButtonUp")
		var_2_6:AnimateSequence("ButtonUp")
		var_2_8:AnimateSequence("ButtonUp")
		var_2_12:AnimateSequence("ButtonUp")
		var_2_14:AnimateSequence("ButtonUp")
		var_2_16:AnimateSequence("ButtonUp")
		var_2_21:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_50

	local var_2_51 = {
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

	var_2_12:RegisterAnimationSequence("AR", var_2_51)

	local var_2_52 = {
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

	var_2_14:RegisterAnimationSequence("AR", var_2_52)

	local var_2_53 = {
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

	var_2_16:RegisterAnimationSequence("AR", var_2_53)

	local function var_2_54()
		var_2_12:AnimateSequence("AR")
		var_2_14:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_54

	local var_2_55 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Idle", var_2_55)

	local var_2_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Idle", var_2_56)

	local var_2_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Idle", var_2_57)

	local var_2_58 = {
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

	var_2_10:RegisterAnimationSequence("Idle", var_2_58)

	local var_2_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_12:RegisterAnimationSequence("Idle", var_2_59)

	local var_2_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		}
	}

	var_2_14:RegisterAnimationSequence("Idle", var_2_60)

	local var_2_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_2_16:RegisterAnimationSequence("Idle", var_2_61)

	local var_2_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_21:RegisterAnimationSequence("Idle", var_2_62)

	local var_2_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_23:RegisterAnimationSequence("Idle", var_2_63)

	local function var_2_64()
		var_2_4:AnimateSequence("Idle")
		var_2_6:AnimateSequence("Idle")
		var_2_8:AnimateSequence("Idle")
		var_2_10:AnimateSequence("Idle")
		var_2_12:AnimateSequence("Idle")
		var_2_14:AnimateSequence("Idle")
		var_2_16:AnimateSequence("Idle")
		var_2_21:AnimateSequence("Idle")
		var_2_23:AnimateSequence("Idle")
	end

	var_2_0._sequences.Idle = var_2_64

	var_2_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("PCAchievement", PCAchievement)
LockTable(_M)
