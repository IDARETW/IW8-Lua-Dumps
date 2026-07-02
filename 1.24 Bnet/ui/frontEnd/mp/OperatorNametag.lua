module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0._superFactionIndex)

	if arg_1_0._superFactionIndex == arg_1_1 then
		arg_1_0.FavoriteOperator:SetAlpha(0)
		arg_1_0.Star:SetAlpha(1)
	else
		arg_1_0.FavoriteOperator:SetAlpha(1)
		arg_1_0.FavoriteOperator:setText(Engine.CBBHFCGDIC("LUA_MENU/SET_FAVORITE_OPERATOR"))
		arg_1_0.Star:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._superFactionIndex = arg_2_1

	var_0_0(arg_2_0, OPERATOR.GetSelectedOperatorIndex(arg_2_2 and arg_2_2 or arg_2_0._controllerIndex))
end

local function var_0_2(arg_3_0, arg_3_1)
	ACTIONS.AnimateSequence(arg_3_0, "Align" .. (arg_3_1 and "Left" or "Right"))
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.SetNametagAlignmentLeft = var_0_2
	arg_4_0.SetSuperfactionIndex = var_0_1
	arg_4_0.UpdateForFavoriteSuperfaction = var_0_0
end

function OperatorNametag(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 102 * _1080p)

	var_5_0.id = "OperatorNametag"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LoadoutItemButtonBackground"

	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.LoadoutItemButtonBackground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "Name"

	var_5_6:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_5_6:setText("GRAVES", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_6:SetWordWrap(false)
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_6:SetStartupDelay(1000)
	var_5_6:SetLineHoldTime(400)
	var_5_6:SetAnimMoveTime(150)
	var_5_6:SetAnimMoveSpeed(50)
	var_5_6:SetEndDelay(1000)
	var_5_6:SetCrossfadeTime(400)
	var_5_6:SetFadeInTime(300)
	var_5_6:SetFadeOutTime(300)
	var_5_6:SetMaxVisibleLines(1)
	var_5_6:SetDecodeLetterLength(50)
	var_5_6:SetDecodeMaxRandChars(2)
	var_5_6:SetDecodeUpdatesPerLetter(10)
	var_5_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 20, _1080p * -38, _1080p * -66, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Name = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Faction"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetDecodeLetterLength(50)
	var_5_8:SetDecodeMaxRandChars(2)
	var_5_8:SetDecodeUpdatesPerLetter(10)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -10, _1080p * 5, _1080p * 41)
	var_5_0:addElement(var_5_8)

	var_5_0.Faction = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "FavoriteOperator"

	var_5_10:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_10:SetTintFontIcons(true)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 5, _1080p * 29)
	var_5_0:addElement(var_5_10)

	var_5_0.FavoriteOperator = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Star"

	var_5_12:SetAlpha(0, 0)
	var_5_12:setImage(RegisterMaterial("favorite"), 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64)
	var_5_0:addElement(var_5_12)

	var_5_0.Star = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "NewItemSmallIcon"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 14, _1080p * 6, _1080p * 14)
	var_5_0:addElement(var_5_14)

	var_5_0.NewItemSmallIcon = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_16)

	local var_5_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_17)

	local function var_5_18()
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_18

	local var_5_19 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelText
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_19)

	local var_5_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_20)

	local function var_5_21()
		var_5_6:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_21

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		}
	}

	var_5_6:RegisterAnimationSequence("AlignRight", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		}
	}

	var_5_8:RegisterAnimationSequence("AlignRight", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -166
		}
	}

	var_5_10:RegisterAnimationSequence("AlignRight", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 64
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
		}
	}

	var_5_12:RegisterAnimationSequence("AlignRight", var_5_25)

	local var_5_26 = {
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
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_5_14:RegisterAnimationSequence("AlignRight", var_5_26)

	local function var_5_27()
		var_5_6:AnimateSequence("AlignRight")
		var_5_8:AnimateSequence("AlignRight")
		var_5_10:AnimateSequence("AlignRight")
		var_5_12:AnimateSequence("AlignRight")
		var_5_14:AnimateSequence("AlignRight")
	end

	var_5_0._sequences.AlignRight = var_5_27

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_5_6:RegisterAnimationSequence("AlignLeft", var_5_28)

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		}
	}

	var_5_8:RegisterAnimationSequence("AlignLeft", var_5_29)

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 222
		}
	}

	var_5_10:RegisterAnimationSequence("AlignLeft", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -64
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
		}
	}

	var_5_12:RegisterAnimationSequence("AlignLeft", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 14
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
		}
	}

	var_5_14:RegisterAnimationSequence("AlignLeft", var_5_32)

	local function var_5_33()
		var_5_6:AnimateSequence("AlignLeft")
		var_5_8:AnimateSequence("AlignLeft")
		var_5_10:AnimateSequence("AlignLeft")
		var_5_12:AnimateSequence("AlignLeft")
		var_5_14:AnimateSequence("AlignLeft")
	end

	var_5_0._sequences.AlignLeft = var_5_33

	var_5_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("OperatorNametag", OperatorNametag)
LockTable(_M)
