module(..., package.seeall)

function CodCasterTeamIdentityInformationPanel(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 366 * _1080p)

	var_1_0.id = "CodCasterTeamIdentityInformationPanel"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("CodCasterTeamIdentityInformation", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "CodCasterTeam2Information"

	var_1_4.TeamColorImage:SetRGBFromTable(SWATCHES.HUD.enemyTeam, 0)
	var_1_4.TeamNameTitle:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM2_NAME"), 0)
	var_1_4.TeamLogoImage:setImage(RegisterMaterial("icon_faction_east_gray_large"), 0)
	var_1_4.TeamColorTitle:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM2_COLOR"), 0)
	var_1_4.TeamLogoTitle:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM2_LOGO"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 181, _1080p * 366)
	var_1_0:addElement(var_1_4)

	var_1_0.CodCasterTeam2Information = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("CodCasterTeamIdentityInformation", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "CodCasterTeam1Information"

	var_1_6.TeamColorImage:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_1_6.TeamNameTitle:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_NAME"), 0)
	var_1_6.TeamColorTitle:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_COLOR"), 0)
	var_1_6.TeamLogoTitle:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_LOGO"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 180)
	var_1_0:addElement(var_1_6)

	var_1_0.CodCasterTeam1Information = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "PopupGlowTop1"

	var_1_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_8:SetPixelGridEnabled(true)
	var_1_8:SetPixelGridContrast(0.5, 0)
	var_1_8:SetPixelGridBlockWidth(2, 0)
	var_1_8:SetPixelGridBlockHeight(2, 0)
	var_1_8:SetPixelGridGutterWidth(1, 0)
	var_1_8:SetPixelGridGutterHeight(1, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 559, _1080p * 53, _1080p * 55)
	var_1_0:addElement(var_1_8)

	var_1_0.PopupGlowTop1 = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "PopupGlowBottom1"

	var_1_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_10:SetPixelGridEnabled(true)
	var_1_10:SetPixelGridContrast(0.5, 0)
	var_1_10:SetPixelGridBlockWidth(2, 0)
	var_1_10:SetPixelGridBlockHeight(2, 0)
	var_1_10:SetPixelGridGutterWidth(1, 0)
	var_1_10:SetPixelGridGutterHeight(1, 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 559, _1080p * 105, _1080p * 107)
	var_1_0:addElement(var_1_10)

	var_1_0.PopupGlowBottom1 = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Gradient1"

	var_1_12:SetRGBFromTable(SWATCHES.Reticles.White, 0)
	var_1_12:SetAlpha(0.1, 0)
	var_1_12:SetXRotation(180, 0)
	var_1_12:SetPixelGridEnabled(true)
	var_1_12:SetPixelGridContrast(0.2, 0)
	var_1_12:SetPixelGridBlockWidth(2, 0)
	var_1_12:SetPixelGridBlockHeight(2, 0)
	var_1_12:SetPixelGridGutterWidth(1, 0)
	var_1_12:SetPixelGridGutterHeight(1, 0)
	var_1_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 563, _1080p * 105, _1080p * 63)
	var_1_0:addElement(var_1_12)

	var_1_0.Gradient1 = var_1_12

	local var_1_13
	local var_1_14 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_14.id = "PopupGlowTop2"

	var_1_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_14:SetPixelGridEnabled(true)
	var_1_14:SetPixelGridContrast(0.5, 0)
	var_1_14:SetPixelGridBlockWidth(2, 0)
	var_1_14:SetPixelGridBlockHeight(2, 0)
	var_1_14:SetPixelGridGutterWidth(1, 0)
	var_1_14:SetPixelGridGutterHeight(1, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 559, _1080p * 234, _1080p * 236)
	var_1_0:addElement(var_1_14)

	var_1_0.PopupGlowTop2 = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "PopupGlowBottom2"

	var_1_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_16:SetPixelGridEnabled(true)
	var_1_16:SetPixelGridContrast(0.5, 0)
	var_1_16:SetPixelGridBlockWidth(2, 0)
	var_1_16:SetPixelGridBlockHeight(2, 0)
	var_1_16:SetPixelGridGutterWidth(1, 0)
	var_1_16:SetPixelGridGutterHeight(1, 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 559, _1080p * 286, _1080p * 288)
	var_1_0:addElement(var_1_16)

	var_1_0.PopupGlowBottom2 = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIImage.new()

	var_1_18.id = "Gradient2"

	var_1_18:SetRGBFromTable(SWATCHES.Reticles.White, 0)
	var_1_18:SetAlpha(0.1, 0)
	var_1_18:SetXRotation(180, 0)
	var_1_18:SetPixelGridEnabled(true)
	var_1_18:SetPixelGridContrast(0.2, 0)
	var_1_18:SetPixelGridBlockWidth(2, 0)
	var_1_18:SetPixelGridBlockHeight(2, 0)
	var_1_18:SetPixelGridGutterWidth(1, 0)
	var_1_18:SetPixelGridGutterHeight(1, 0)
	var_1_18:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_18:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 563, _1080p * 286, _1080p * 244)
	var_1_0:addElement(var_1_18)

	var_1_0.Gradient2 = var_1_18

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_20)

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("DefaultSequence", var_1_21)

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("DefaultSequence", var_1_22)

	local var_1_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("DefaultSequence", var_1_23)

	local var_1_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("DefaultSequence", var_1_24)

	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("DefaultSequence", var_1_25)

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("DefaultSequence", var_1_26)

	local function var_1_27()
		var_1_4:AnimateSequence("DefaultSequence")
		var_1_6:AnimateSequence("DefaultSequence")
		var_1_8:AnimateSequence("DefaultSequence")
		var_1_10:AnimateSequence("DefaultSequence")
		var_1_12:AnimateSequence("DefaultSequence")
		var_1_14:AnimateSequence("DefaultSequence")
		var_1_16:AnimateSequence("DefaultSequence")
		var_1_18:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_27

	local var_1_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 366
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("ShowBoth", var_1_28)

	local var_1_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 165
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("ShowBoth", var_1_29)

	local var_1_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_8:RegisterAnimationSequence("ShowBoth", var_1_30)

	local var_1_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_10:RegisterAnimationSequence("ShowBoth", var_1_31)

	local var_1_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ShowBoth", var_1_32)

	local var_1_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_14:RegisterAnimationSequence("ShowBoth", var_1_33)

	local var_1_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_16:RegisterAnimationSequence("ShowBoth", var_1_34)

	local var_1_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("ShowBoth", var_1_35)

	local function var_1_36()
		var_1_4:AnimateSequence("ShowBoth")
		var_1_6:AnimateSequence("ShowBoth")
		var_1_8:AnimateSequence("ShowBoth")
		var_1_10:AnimateSequence("ShowBoth")
		var_1_12:AnimateSequence("ShowBoth")
		var_1_14:AnimateSequence("ShowBoth")
		var_1_16:AnimateSequence("ShowBoth")
		var_1_18:AnimateSequence("ShowBoth")
	end

	var_1_0._sequences.ShowBoth = var_1_36

	local var_1_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 366
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("ShowTeam1Only", var_1_37)

	local var_1_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 456
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("ShowTeam1Only", var_1_38)

	local var_1_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_8:RegisterAnimationSequence("ShowTeam1Only", var_1_39)

	local var_1_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_10:RegisterAnimationSequence("ShowTeam1Only", var_1_40)

	local var_1_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ShowTeam1Only", var_1_41)

	local var_1_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		}
	}

	var_1_14:RegisterAnimationSequence("ShowTeam1Only", var_1_42)

	local var_1_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		}
	}

	var_1_16:RegisterAnimationSequence("ShowTeam1Only", var_1_43)

	local var_1_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("ShowTeam1Only", var_1_44)

	local function var_1_45()
		var_1_4:AnimateSequence("ShowTeam1Only")
		var_1_6:AnimateSequence("ShowTeam1Only")
		var_1_8:AnimateSequence("ShowTeam1Only")
		var_1_10:AnimateSequence("ShowTeam1Only")
		var_1_12:AnimateSequence("ShowTeam1Only")
		var_1_14:AnimateSequence("ShowTeam1Only")
		var_1_16:AnimateSequence("ShowTeam1Only")
		var_1_18:AnimateSequence("ShowTeam1Only")
	end

	var_1_0._sequences.ShowTeam1Only = var_1_45

	local var_1_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 456
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 366
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("ShowTeam2Only", var_1_46)

	local var_1_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 456
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("ShowTeam2Only", var_1_47)

	local var_1_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_14:RegisterAnimationSequence("ShowTeam2Only", var_1_48)

	local var_1_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 547
		}
	}

	var_1_16:RegisterAnimationSequence("ShowTeam2Only", var_1_49)

	local var_1_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("ShowTeam2Only", var_1_50)

	local function var_1_51()
		var_1_4:AnimateSequence("ShowTeam2Only")
		var_1_6:AnimateSequence("ShowTeam2Only")
		var_1_14:AnimateSequence("ShowTeam2Only")
		var_1_16:AnimateSequence("ShowTeam2Only")
		var_1_18:AnimateSequence("ShowTeam2Only")
	end

	var_1_0._sequences.ShowTeam2Only = var_1_51

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("CodCasterTeamIdentityInformationPanel", CodCasterTeamIdentityInformationPanel)
LockTable(_M)
