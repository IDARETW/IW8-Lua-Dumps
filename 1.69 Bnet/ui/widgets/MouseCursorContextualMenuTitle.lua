module(..., package.seeall)

function MouseCursorContextualMenuTitle(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 298 * _1080p, 0, 85 * _1080p)

	var_1_0.id = "MouseCursorContextualMenuTitle"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3

	if Engine.CGABICJHAI() then
		var_1_3 = LUI.UIImage.new()
		var_1_3.id = "BnetBackground"

		var_1_3:SetRGBFromTable(SWATCHES.CAC.specialistBonus, 0)
		var_1_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 48)
		var_1_0:addElement(var_1_3)

		var_1_0.BnetBackground = var_1_3
	end

	local var_1_4

	if Engine.CGABICJHAI() then
		var_1_4 = LUI.UIText.new()
		var_1_4.id = "BnetTitle"

		var_1_4:SetRGBFromTable(SWATCHES.text.overText, 0)
		var_1_4:setText("", 0)
		var_1_4:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		var_1_4:SetWordWrap(false)
		var_1_4:SetAlignment(LUI.Alignment.Left)
		var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 48, _1080p * 287, _1080p * 3, _1080p * 25)
		var_1_0:addElement(var_1_4)

		var_1_0.BnetTitle = var_1_4
	end

	local var_1_5

	if Engine.CGABICJHAI() then
		var_1_5 = LUI.UIText.new()
		var_1_5.id = "BnetSubtitle"

		var_1_5:SetRGBFromTable(SWATCHES.text.overText, 0)
		var_1_5:setText("", 0)
		var_1_5:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		var_1_5:SetWordWrap(false)
		var_1_5:SetAlignment(LUI.Alignment.Left)
		var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 48, _1080p * 286, _1080p * 25, _1080p * 41)
		var_1_0:addElement(var_1_5)

		var_1_0.BnetSubtitle = var_1_5
	end

	local var_1_6

	if Engine.CGABICJHAI() then
		var_1_6 = LUI.UIImage.new()
		var_1_6.id = "IconBNet"

		var_1_6:SetRGBFromTable(SWATCHES.genericButton.contentFocus, 0)
		var_1_6:setImage(RegisterMaterial("icon_platform_pc"), 0)
		var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 42, _1080p * 9, _1080p * 41)
		var_1_0:addElement(var_1_6)

		var_1_0.IconBNet = var_1_6
	end

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Background"

	var_1_8:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 48, _1080p * 85)
	var_1_0:addElement(var_1_8)

	var_1_0.Background = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "Border"

	var_1_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_11:SetAlpha(0, 0)
	var_1_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 85)
	var_1_0:addElement(var_1_11)

	var_1_0.Border = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIText.new()

	var_1_13.id = "Title"

	var_1_13:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_13:setText("", 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_1_13:SetWordWrap(false)
	var_1_13:SetAlignment(LUI.Alignment.Left)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 285, _1080p * 55, _1080p * 77)
	var_1_0:addElement(var_1_13)

	var_1_0.Title = var_1_13

	local function var_1_14()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_14

	local var_1_15

	if Engine.CGABICJHAI() then
		local var_1_16 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("GenericAndBnet", var_1_16)
	end

	if Engine.CGABICJHAI() then
		local var_1_17 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 48
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 287
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 3
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 25
			}
		}

		var_1_4:RegisterAnimationSequence("GenericAndBnet", var_1_17)
	end

	if Engine.CGABICJHAI() then
		local var_1_18 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("GenericAndBnet", var_1_18)
	end

	if Engine.CGABICJHAI() then
		local var_1_19 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("icon_platform_bnet")
			}
		}

		var_1_6:RegisterAnimationSequence("GenericAndBnet", var_1_19)
	end

	local var_1_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_1_8:RegisterAnimationSequence("GenericAndBnet", var_1_20)

	local var_1_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_1_11:RegisterAnimationSequence("GenericAndBnet", var_1_21)

	local var_1_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 77
		}
	}

	var_1_13:RegisterAnimationSequence("GenericAndBnet", var_1_22)

	local function var_1_23()
		if Engine.CGABICJHAI() then
			var_1_3:AnimateSequence("GenericAndBnet")
		end

		if Engine.CGABICJHAI() then
			var_1_4:AnimateSequence("GenericAndBnet")
		end

		if Engine.CGABICJHAI() then
			var_1_5:AnimateSequence("GenericAndBnet")
		end

		if Engine.CGABICJHAI() then
			var_1_6:AnimateSequence("GenericAndBnet")
		end

		var_1_8:AnimateSequence("GenericAndBnet")
		var_1_11:AnimateSequence("GenericAndBnet")
		var_1_13:AnimateSequence("GenericAndBnet")
	end

	var_1_0._sequences.GenericAndBnet = var_1_23

	local var_1_24

	if Engine.CGABICJHAI() then
		local var_1_25 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("GenericOnly", var_1_25)
	end

	if Engine.CGABICJHAI() then
		local var_1_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("GenericOnly", var_1_26)
	end

	if Engine.CGABICJHAI() then
		local var_1_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("GenericOnly", var_1_27)
	end

	if Engine.CGABICJHAI() then
		local var_1_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("GenericOnly", var_1_28)
	end

	local var_1_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("GenericOnly", var_1_29)

	local var_1_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		}
	}

	var_1_11:RegisterAnimationSequence("GenericOnly", var_1_30)

	local var_1_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("GenericOnly", var_1_31)

	local function var_1_32()
		if Engine.CGABICJHAI() then
			var_1_3:AnimateSequence("GenericOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_4:AnimateSequence("GenericOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_5:AnimateSequence("GenericOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_6:AnimateSequence("GenericOnly")
		end

		var_1_8:AnimateSequence("GenericOnly")
		var_1_11:AnimateSequence("GenericOnly")
		var_1_13:AnimateSequence("GenericOnly")
	end

	var_1_0._sequences.GenericOnly = var_1_32

	local var_1_33

	if Engine.CGABICJHAI() then
		local var_1_34 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("BnetOnly", var_1_34)
	end

	if Engine.CGABICJHAI() then
		local var_1_35 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 48
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 287
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 3
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 25
			}
		}

		var_1_4:RegisterAnimationSequence("BnetOnly", var_1_35)
	end

	if Engine.CGABICJHAI() then
		local var_1_36 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("BnetOnly", var_1_36)
	end

	if Engine.CGABICJHAI() then
		local var_1_37 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("icon_platform_bnet")
			}
		}

		var_1_6:RegisterAnimationSequence("BnetOnly", var_1_37)
	end

	local var_1_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("BnetOnly", var_1_38)

	local var_1_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		}
	}

	var_1_11:RegisterAnimationSequence("BnetOnly", var_1_39)

	local var_1_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("BnetOnly", var_1_40)

	local function var_1_41()
		if Engine.CGABICJHAI() then
			var_1_3:AnimateSequence("BnetOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_4:AnimateSequence("BnetOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_5:AnimateSequence("BnetOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_6:AnimateSequence("BnetOnly")
		end

		var_1_8:AnimateSequence("BnetOnly")
		var_1_11:AnimateSequence("BnetOnly")
		var_1_13:AnimateSequence("BnetOnly")
	end

	var_1_0._sequences.BnetOnly = var_1_41

	local var_1_42

	if Engine.CGABICJHAI() then
		local var_1_43 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 8355711,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_1_3:RegisterAnimationSequence("LazeOnly", var_1_43)
	end

	if Engine.CGABICJHAI() then
		local var_1_44 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 48
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 287
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 14
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 36
			}
		}

		var_1_4:RegisterAnimationSequence("LazeOnly", var_1_44)
	end

	if Engine.CGABICJHAI() then
		local var_1_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("LazeOnly", var_1_45)
	end

	if Engine.CGABICJHAI() then
		local var_1_46 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("icon_platform_steam")
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("LazeOnly", var_1_46)
	end

	local var_1_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("LazeOnly", var_1_47)

	local var_1_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		}
	}

	var_1_11:RegisterAnimationSequence("LazeOnly", var_1_48)

	local var_1_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("LazeOnly", var_1_49)

	local function var_1_50()
		if Engine.CGABICJHAI() then
			var_1_3:AnimateSequence("LazeOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_4:AnimateSequence("LazeOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_5:AnimateSequence("LazeOnly")
		end

		if Engine.CGABICJHAI() then
			var_1_6:AnimateSequence("LazeOnly")
		end

		var_1_8:AnimateSequence("LazeOnly")
		var_1_11:AnimateSequence("LazeOnly")
		var_1_13:AnimateSequence("LazeOnly")
	end

	var_1_0._sequences.LazeOnly = var_1_50

	local var_1_51

	if Engine.CGABICJHAI() then
		local var_1_52 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 8355711,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_1_3:RegisterAnimationSequence("GenericAndLaze", var_1_52)
	end

	if Engine.CGABICJHAI() then
		local var_1_53 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 14
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 36
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 48
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 287
			}
		}

		var_1_4:RegisterAnimationSequence("GenericAndLaze", var_1_53)
	end

	if Engine.CGABICJHAI() then
		local var_1_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("GenericAndLaze", var_1_54)
	end

	if Engine.CGABICJHAI() then
		local var_1_55 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("icon_platform_steam")
			}
		}

		var_1_6:RegisterAnimationSequence("GenericAndLaze", var_1_55)
	end

	local var_1_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_1_8:RegisterAnimationSequence("GenericAndLaze", var_1_56)

	local var_1_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_1_11:RegisterAnimationSequence("GenericAndLaze", var_1_57)

	local var_1_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 77
		}
	}

	var_1_13:RegisterAnimationSequence("GenericAndLaze", var_1_58)

	local function var_1_59()
		if Engine.CGABICJHAI() then
			var_1_3:AnimateSequence("GenericAndLaze")
		end

		if Engine.CGABICJHAI() then
			var_1_4:AnimateSequence("GenericAndLaze")
		end

		if Engine.CGABICJHAI() then
			var_1_5:AnimateSequence("GenericAndLaze")
		end

		if Engine.CGABICJHAI() then
			var_1_6:AnimateSequence("GenericAndLaze")
		end

		var_1_8:AnimateSequence("GenericAndLaze")
		var_1_11:AnimateSequence("GenericAndLaze")
		var_1_13:AnimateSequence("GenericAndLaze")
	end

	var_1_0._sequences.GenericAndLaze = var_1_59

	return var_1_0
end

MenuBuilder.registerType("MouseCursorContextualMenuTitle", MouseCursorContextualMenuTitle)
LockTable(_M)
