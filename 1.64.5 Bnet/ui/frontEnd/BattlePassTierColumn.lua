module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2 and type(arg_1_2) == "table" and arg_1_2.tier, "You must provide a table of options, specifically the data, for displaying a tier column.")

	local var_1_0 = BATTLEPASS.GetTierItemName(arg_1_1, tonumber(arg_1_2.tier), tonumber(arg_1_2.subTier))

	if arg_1_2.colorSwatch then
		assert(type(arg_1_2.colorSwatch) == "string", "The swatch must be a string reference to a path in Swatches.lua table.")

		local var_1_1 = GetSwatchIntColor(nil, arg_1_2.colorSwatch)

		assert(var_1_1, "Could not find a valid swatch from the path " .. arg_1_2.colorSwatch .. ". Please review your themeColorSwatch entry in battlepass_upsell_items.csv.")
		arg_1_0.Tier:SetRGBFromInt(var_1_1)
		arg_1_0.Icon:SetRGBFromInt(var_1_1)
	end

	local var_1_2 = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NUMBER_NAME", arg_1_2.tier, var_1_0))
	local var_1_3 = arg_1_2.iconAlignment and LUI.Alignment[arg_1_2.iconAlignment] or nil

	if var_1_3 and var_1_3 == LUI.Alignment.Right or CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AlignRight")

		var_1_2 = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NUMBER_NAME", var_1_0, arg_1_2.tier))
	elseif var_1_3 and var_1_3 == LUI.Alignment.Left then
		ACTIONS.AnimateSequence(arg_1_0, "AlignLeft")
	end

	if arg_1_2.category and arg_1_2.category ~= "" then
		ACTIONS.AnimateSequence(arg_1_0, "ShowCategory")
		arg_1_0.TierCategory:setText(Engine.CBBHFCGDIC("BATTLEPASS/" .. arg_1_2.category))
	end

	arg_1_0.Tier:setText(var_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "Show")

	if arg_1_2.blueprintIcon and arg_1_2.blueprintIcon ~= "" then
		ACTIONS.AnimateSequence(arg_1_0, "SetIcon")
		arg_1_0.BlueprintIcon:setImage(RegisterMaterial(arg_1_2.blueprintIcon))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTier = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "Hide")

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function BattlePassTierColumn(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 286 * _1080p, 0, 26 * _1080p)

	var_3_0.id = "BattlePassTierColumn"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Icon"

	var_3_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_4:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 10, _1080p * 36, _1080p * 3, _1080p * -4)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Tier"

	var_3_6:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 46, _1080p * 264, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_6)

	var_3_0.Tier = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "TierCategory"

	var_3_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 9, 0, _1080p * -35, _1080p * -11)
	var_3_0:addElement(var_3_8)

	var_3_0.TierCategory = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "BlueprintIcon"

	var_3_10:SetAlpha(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -44, _1080p * 46, _1080p * -20, _1080p * 25)
	var_3_0:addElement(var_3_10)

	var_3_0.BlueprintIcon = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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

	var_3_4:RegisterAnimationSequence("AlignRight", var_3_13)

	local var_3_14 = {
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
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		}
	}

	var_3_6:RegisterAnimationSequence("AlignRight", var_3_14)

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_3_8:RegisterAnimationSequence("AlignRight", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("AlignRight")
		var_3_6:AnimateSequence("AlignRight")
		var_3_8:AnimateSequence("AlignRight")
	end

	var_3_0._sequences.AlignRight = var_3_16

	local var_3_17
	local var_3_18 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		}
	}

	var_3_4:RegisterAnimationSequence("AlignLeft", var_3_18)

	local var_3_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 264
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		}
	}

	var_3_6:RegisterAnimationSequence("AlignLeft", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("AlignLeft")
		var_3_6:AnimateSequence("AlignLeft")
	end

	var_3_0._sequences.AlignLeft = var_3_20

	local var_3_21
	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 231
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_22)

	local function var_3_23()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Show", var_3_25)

	local var_3_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Show", var_3_26)

	local function var_3_27()
		var_3_4:AnimateSequence("Show")
		var_3_6:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_29)

	local var_3_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_30)

	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Hide", var_3_31)

	local var_3_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Hide", var_3_32)

	local function var_3_33()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
		var_3_8:AnimateSequence("Hide")
		var_3_10:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_33

	local var_3_34
	local var_3_35 = {
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_8:RegisterAnimationSequence("ShowCategory", var_3_35)

	local function var_3_36()
		var_3_8:AnimateSequence("ShowCategory")
	end

	var_3_0._sequences.ShowCategory = var_3_36

	local var_3_37
	local var_3_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("SetIcon", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		}
	}

	var_3_8:RegisterAnimationSequence("SetIcon", var_3_39)

	local var_3_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("SetIcon", var_3_40)

	local function var_3_41()
		var_3_4:AnimateSequence("SetIcon")
		var_3_8:AnimateSequence("SetIcon")
		var_3_10:AnimateSequence("SetIcon")
	end

	var_3_0._sequences.SetIcon = var_3_41

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassTierColumn", BattlePassTierColumn)
LockTable(_M)
