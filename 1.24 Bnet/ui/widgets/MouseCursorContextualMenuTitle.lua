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

	if not Engine.HDGDBCJFG() then
		var_1_3 = LUI.UIImage.new()
		var_1_3.id = "BnetBackground"

		var_1_3:SetRGBFromTable(SWATCHES.CAC.specialistBonus, 0)
		var_1_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 48)
		var_1_0:addElement(var_1_3)

		var_1_0.BnetBackground = var_1_3
	end

	local var_1_4

	if not Engine.HDGDBCJFG() then
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

	if not Engine.HDGDBCJFG() then
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

	if not Engine.HDGDBCJFG() then
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

	if not Engine.HDGDBCJFG() then
		local var_1_15 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("GenericAndBnet", var_1_15)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_16 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("GenericAndBnet", var_1_16)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_17 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("GenericAndBnet", var_1_17)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_18 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("GenericAndBnet", var_1_18)
	end

	local var_1_19 = {
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

	var_1_8:RegisterAnimationSequence("GenericAndBnet", var_1_19)

	local var_1_20 = {
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

	var_1_11:RegisterAnimationSequence("GenericAndBnet", var_1_20)

	local var_1_21 = {
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

	var_1_13:RegisterAnimationSequence("GenericAndBnet", var_1_21)

	local function var_1_22()
		if not Engine.HDGDBCJFG() then
			var_1_3:AnimateSequence("GenericAndBnet")
		end

		if not Engine.HDGDBCJFG() then
			var_1_4:AnimateSequence("GenericAndBnet")
		end

		if not Engine.HDGDBCJFG() then
			var_1_5:AnimateSequence("GenericAndBnet")
		end

		if not Engine.HDGDBCJFG() then
			var_1_6:AnimateSequence("GenericAndBnet")
		end

		var_1_8:AnimateSequence("GenericAndBnet")
		var_1_11:AnimateSequence("GenericAndBnet")
		var_1_13:AnimateSequence("GenericAndBnet")
	end

	var_1_0._sequences.GenericAndBnet = var_1_22

	if not Engine.HDGDBCJFG() then
		local var_1_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("GenericOnly", var_1_23)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_24 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("GenericOnly", var_1_24)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_25 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("GenericOnly", var_1_25)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("GenericOnly", var_1_26)
	end

	local var_1_27 = {
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

	var_1_8:RegisterAnimationSequence("GenericOnly", var_1_27)

	local var_1_28 = {
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

	var_1_11:RegisterAnimationSequence("GenericOnly", var_1_28)

	local var_1_29 = {
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

	var_1_13:RegisterAnimationSequence("GenericOnly", var_1_29)

	local function var_1_30()
		if not Engine.HDGDBCJFG() then
			var_1_3:AnimateSequence("GenericOnly")
		end

		if not Engine.HDGDBCJFG() then
			var_1_4:AnimateSequence("GenericOnly")
		end

		if not Engine.HDGDBCJFG() then
			var_1_5:AnimateSequence("GenericOnly")
		end

		if not Engine.HDGDBCJFG() then
			var_1_6:AnimateSequence("GenericOnly")
		end

		var_1_8:AnimateSequence("GenericOnly")
		var_1_11:AnimateSequence("GenericOnly")
		var_1_13:AnimateSequence("GenericOnly")
	end

	var_1_0._sequences.GenericOnly = var_1_30

	if not Engine.HDGDBCJFG() then
		local var_1_31 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("BnetOnly", var_1_31)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_32 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("BnetOnly", var_1_32)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_33 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("BnetOnly", var_1_33)
	end

	if not Engine.HDGDBCJFG() then
		local var_1_34 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("BnetOnly", var_1_34)
	end

	local var_1_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("BnetOnly", var_1_35)

	local var_1_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		}
	}

	var_1_11:RegisterAnimationSequence("BnetOnly", var_1_36)

	local var_1_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("BnetOnly", var_1_37)

	local function var_1_38()
		if not Engine.HDGDBCJFG() then
			var_1_3:AnimateSequence("BnetOnly")
		end

		if not Engine.HDGDBCJFG() then
			var_1_4:AnimateSequence("BnetOnly")
		end

		if not Engine.HDGDBCJFG() then
			var_1_5:AnimateSequence("BnetOnly")
		end

		if not Engine.HDGDBCJFG() then
			var_1_6:AnimateSequence("BnetOnly")
		end

		var_1_8:AnimateSequence("BnetOnly")
		var_1_11:AnimateSequence("BnetOnly")
		var_1_13:AnimateSequence("BnetOnly")
	end

	var_1_0._sequences.BnetOnly = var_1_38

	return var_1_0
end

MenuBuilder.registerType("MouseCursorContextualMenuTitle", MouseCursorContextualMenuTitle)
LockTable(_M)
