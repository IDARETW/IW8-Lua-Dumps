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

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = RANDOM.IsEnabled(arg_4_1, LOOT.itemTypes.OPERATOR, {
		operatorFaction = arg_4_0._superFactionIndex
	}) and "LUA_MENU/REMOVE_RANDOM" or "LUA_MENU/SET_RANDOM"

	arg_4_0.Random:setText(Engine.CBBHFCGDIC(var_4_0))
end

local function var_0_4(arg_5_0, arg_5_1)
	RANDOM.Toggle(arg_5_1, LOOT.itemTypes.OPERATOR, {
		operatorFaction = arg_5_0._superFactionIndex
	})
	var_0_3(arg_5_0, arg_5_1)
	arg_5_0:dispatchEventToCurrentMenu({
		name = "setup_operator_characters",
		controller = arg_5_1
	})
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0.SetNametagAlignmentLeft = var_0_2
	arg_6_0.SetSuperfactionIndex = var_0_1
	arg_6_0.UpdateForFavoriteSuperfaction = var_0_0

	arg_6_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")

		arg_7_0._buttonOver = true

		if OPERATOR.IsRandomFeatureEnabled() then
			arg_7_0.Random:SetAlpha(1)
		end

		var_0_3(arg_7_0, arg_7_1.controller or arg_6_1)
	end)
	arg_6_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_8_0, "ButtonUp")

		arg_8_0._buttonOver = false

		arg_8_0.Random:SetAlpha(0)
	end)

	if OPERATOR.IsRandomFeatureEnabled() then
		arg_6_0.bindButton = LUI.UIBindButton.new()
		arg_6_0.bindButton.id = "selfBindButton"

		arg_6_0:addElement(arg_6_0.bindButton)
		arg_6_0.bindButton:registerEventHandler("button_right_trigger", function(arg_9_0, arg_9_1)
			if arg_6_0._buttonOver then
				var_0_4(arg_6_0, arg_9_1.controller)

				return true
			end
		end)
	end

	arg_6_0.Random:SetAlpha(0)
end

function OperatorNametag(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 102 * _1080p)

	var_10_0.id = "OperatorNametag"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "LoadoutItemButtonBackground"

	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.LoadoutItemButtonBackground = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIStyledText.new()

	var_10_6.id = "Name"

	var_10_6:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_10_6:setText("GRAVES", 0)
	var_10_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_6:SetWordWrap(false)
	var_10_6:SetAlignment(LUI.Alignment.Left)
	var_10_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_6:SetStartupDelay(1000)
	var_10_6:SetLineHoldTime(400)
	var_10_6:SetAnimMoveTime(150)
	var_10_6:SetAnimMoveSpeed(50)
	var_10_6:SetEndDelay(1000)
	var_10_6:SetCrossfadeTime(400)
	var_10_6:SetFadeInTime(300)
	var_10_6:SetFadeOutTime(300)
	var_10_6:SetMaxVisibleLines(1)
	var_10_6:SetDecodeLetterLength(50)
	var_10_6:SetDecodeMaxRandChars(2)
	var_10_6:SetDecodeUpdatesPerLetter(10)
	var_10_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 20, _1080p * -38, _1080p * -66, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.Name = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIStyledText.new()

	var_10_8.id = "Faction"

	var_10_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_8:setText("", 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_8:SetWordWrap(false)
	var_10_8:SetAlignment(LUI.Alignment.Left)
	var_10_8:SetDecodeLetterLength(50)
	var_10_8:SetDecodeMaxRandChars(2)
	var_10_8:SetDecodeUpdatesPerLetter(10)
	var_10_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -10, _1080p * 5, _1080p * 41)
	var_10_0:addElement(var_10_8)

	var_10_0.Faction = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "FavoriteOperator"

	var_10_10:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_10_10:setText("", 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_10:SetTintFontIcons(true)
	var_10_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 5, _1080p * 29)
	var_10_0:addElement(var_10_10)

	var_10_0.FavoriteOperator = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Star"

	var_10_12:SetAlpha(0, 0)
	var_10_12:setImage(RegisterMaterial("favorite"), 0)
	var_10_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64)
	var_10_0:addElement(var_10_12)

	var_10_0.Star = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "NewItemSmallIcon"

	var_10_14:SetAlpha(0, 0)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 14, _1080p * 6, _1080p * 14)
	var_10_0:addElement(var_10_14)

	var_10_0.NewItemSmallIcon = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIText.new()

	var_10_16.id = "Random"

	var_10_16:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_10_16:setText("", 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_16:SetAlignment(LUI.Alignment.Left)
	var_10_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_16:SetTintFontIcons(true)
	var_10_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -136, _1080p * -112)
	var_10_0:addElement(var_10_16)

	var_10_0.Random = var_10_16

	local function var_10_17()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_17

	local var_10_18
	local var_10_19 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOver", var_10_19)

	local var_10_20 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_20)

	local function var_10_21()
		var_10_6:AnimateSequence("ButtonOver")
		var_10_8:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_21

	local var_10_22
	local var_10_23 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelText
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUp", var_10_23)

	local var_10_24 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_24)

	local function var_10_25()
		var_10_6:AnimateSequence("ButtonUp")
		var_10_8:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_25

	local var_10_26
	local var_10_27 = {
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

	var_10_6:RegisterAnimationSequence("AlignRight", var_10_27)

	local var_10_28 = {
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

	var_10_8:RegisterAnimationSequence("AlignRight", var_10_28)

	local var_10_29 = {
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

	var_10_10:RegisterAnimationSequence("AlignRight", var_10_29)

	local var_10_30 = {
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

	var_10_12:RegisterAnimationSequence("AlignRight", var_10_30)

	local var_10_31 = {
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

	var_10_14:RegisterAnimationSequence("AlignRight", var_10_31)

	local function var_10_32()
		var_10_6:AnimateSequence("AlignRight")
		var_10_8:AnimateSequence("AlignRight")
		var_10_10:AnimateSequence("AlignRight")
		var_10_12:AnimateSequence("AlignRight")
		var_10_14:AnimateSequence("AlignRight")
	end

	var_10_0._sequences.AlignRight = var_10_32

	local var_10_33
	local var_10_34 = {
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

	var_10_6:RegisterAnimationSequence("AlignLeft", var_10_34)

	local var_10_35 = {
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

	var_10_8:RegisterAnimationSequence("AlignLeft", var_10_35)

	local var_10_36 = {
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

	var_10_10:RegisterAnimationSequence("AlignLeft", var_10_36)

	local var_10_37 = {
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

	var_10_12:RegisterAnimationSequence("AlignLeft", var_10_37)

	local var_10_38 = {
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

	var_10_14:RegisterAnimationSequence("AlignLeft", var_10_38)

	local function var_10_39()
		var_10_6:AnimateSequence("AlignLeft")
		var_10_8:AnimateSequence("AlignLeft")
		var_10_10:AnimateSequence("AlignLeft")
		var_10_12:AnimateSequence("AlignLeft")
		var_10_14:AnimateSequence("AlignLeft")
	end

	var_10_0._sequences.AlignLeft = var_10_39

	var_0_5(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("OperatorNametag", OperatorNametag)
LockTable(_M)
