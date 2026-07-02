module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Status)
	assert(arg_1_0.Type)
	assert(arg_1_0.Players)
	assert(arg_1_0.Map)
	assert(arg_1_0.Host)

	if IsLanguageOversizedFont() then
		arg_1_0.Status:SetTop(-11 * _1080p, 0)
		arg_1_0.Status:SetBottom(11 * _1080p, 0)
		arg_1_0.Type:SetTop(-11 * _1080p, 0)
		arg_1_0.Type:SetBottom(11 * _1080p, 0)
		arg_1_0.Players:SetTop(-11 * _1080p, 0)
		arg_1_0.Players:SetBottom(11 * _1080p, 0)
		arg_1_0.Map:SetTop(-11 * _1080p, 0)
		arg_1_0.Map:SetBottom(11 * _1080p, 0)
		arg_1_0.Host:SetTop(-11 * _1080p, 0)
		arg_1_0.Host:SetBottom(11 * _1080p, 0)
	end

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function SystemLinkJoinMenuTitleRow(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 26 * _1080p)

	var_2_0.id = "SystemLinkJoinMenuTitleRow"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "Host"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("MENU/HOST_NAME"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 255, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_4)

	var_2_0.Host = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Map"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("MENU/MAP"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 690, _1080p * 890, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.Map = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "Players"

	var_2_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_8:setText(Engine.CBBHFCGDIC("MENU/NUMPLAYERS"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 245, _1080p * 375, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_8)

	var_2_0.Players = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "Type"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("MENU/TYPE1"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Right)
	var_2_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 840, _1080p * -10, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_10)

	var_2_0.Type = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "Status"

	var_2_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("MENU/STATUS_NAME"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Center)
	var_2_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 400, _1080p * 590, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_12)

	var_2_0.Status = var_2_12

	local function var_2_13()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_13

	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		}
	}

	var_2_4:RegisterAnimationSequence("JP", var_2_14)

	local var_2_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_2_6:RegisterAnimationSequence("JP", var_2_15)

	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		}
	}

	var_2_8:RegisterAnimationSequence("JP", var_2_16)

	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_2_10:RegisterAnimationSequence("JP", var_2_17)

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		}
	}

	var_2_12:RegisterAnimationSequence("JP", var_2_18)

	local function var_2_19()
		var_2_4:AnimateSequence("JP")
		var_2_6:AnimateSequence("JP")
		var_2_8:AnimateSequence("JP")
		var_2_10:AnimateSequence("JP")
		var_2_12:AnimateSequence("JP")
	end

	var_2_0._sequences.JP = var_2_19

	local var_2_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_20)

	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_21)

	local var_2_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_22)

	local var_2_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_23)

	local var_2_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_12:RegisterAnimationSequence("AR", var_2_24)

	local function var_2_25()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
		var_2_10:AnimateSequence("AR")
		var_2_12:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_25

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SystemLinkJoinMenuTitleRow", SystemLinkJoinMenuTitleRow)
LockTable(_M)
