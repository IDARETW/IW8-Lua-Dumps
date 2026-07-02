module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)

	local var_1_0 = 88 * _1080p
	local var_1_1 = ToUpperCase(arg_1_1)
	local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0.MenuTitle:getLocalRect()
	local var_1_6 = math.abs(var_1_5 - var_1_3)
	local var_1_7 = arg_1_0.MenuTitle:GetCurrentFont()
	local var_1_8, var_1_9, var_1_10, var_1_11 = GetTextDimensions(var_1_1, var_1_7, var_1_6)
	local var_1_12 = var_1_0 + (var_1_10 - var_1_8)

	if arg_1_0.maxRightEdge ~= nil and var_1_12 > arg_1_0.maxRightEdge then
		var_1_12 = arg_1_0.maxRightEdge

		arg_1_0.MenuTitle:SetRight(arg_1_0.maxRightEdge)
	end

	arg_1_0.Line:SetRight(var_1_12)
	arg_1_0.MenuTitle:setText(var_1_1)

	if not arg_1_2 then
		ACTIONS.PlaySoundSetSound(arg_1_0, "menuDecode", false)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.maxRightEdge = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.MWLogo:SetAlpha(1)
	arg_3_0.MenuTitle:SetAlpha(0)
	arg_3_0.Line:SetRight(300 * _1080p)
	ACTIONS.AnimateSequence(arg_3_0, "MW")

	if not arg_3_1 then
		ACTIONS.PlaySoundSetSound(arg_3_0, "menuDecode", false)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.WZLogo:SetAlpha(1)
	arg_4_0.MenuTitle:SetAlpha(0)
	arg_4_0.Line:SetRight(300 * _1080p)
	ACTIONS.AnimateSequence(arg_4_0, "WZ")

	if not arg_4_1 then
		ACTIONS.PlaySoundSetSound(arg_4_0, "menuDecode", false)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	if IsLanguageChinese() or IsLanguageKorean() then
		ACTIONS.AnimateSequence(arg_5_0, "KORZH")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_5_0, "JP")
	elseif IsLanguageRussian() or IsLanguageSpanish() then
		ACTIONS.AnimateSequence(arg_5_0, "RU")
	end

	arg_5_0.SetTitle = var_0_0
	arg_5_0.SetMaxRightEdge = var_0_1
	arg_5_0.SetMWTitle = var_0_2
	arg_5_0.SetWarzoneTitle = var_0_3

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_5_0, "WZ")
	end
end

function MenuTitle(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1024 * _1080p, 0, 105 * _1080p)

	var_6_0.id = "MenuTitle"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIStyledText.new()

	var_6_4.id = "MenuTitle"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_6_4:setText("PRIMARY WEAPON SELECT", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_4:SetStartupDelay(1250)
	var_6_4:SetLineHoldTime(400)
	var_6_4:SetAnimMoveTime(300)
	var_6_4:SetAnimMoveSpeed(50)
	var_6_4:SetEndDelay(1000)
	var_6_4:SetCrossfadeTime(500)
	var_6_4:SetFadeInTime(300)
	var_6_4:SetFadeOutTime(300)
	var_6_4:SetMaxVisibleLines(1)
	var_6_4:SetDecodeLetterLength(20)
	var_6_4:SetDecodeMaxRandChars(6)
	var_6_4:SetDecodeUpdatesPerLetter(4)
	var_6_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 91, _1080p * 1024, _1080p * -60, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.MenuTitle = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Line"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1024, _1080p * -4, _1080p * -3)
	var_6_0:addElement(var_6_6)

	var_6_0.Line = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "WZLogo"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setImage(RegisterMaterial("logo_warzone_sm"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 300, _1080p * 29, _1080p * 93)
	var_6_0:addElement(var_6_8)

	var_6_0.WZLogo = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "MWLogo"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setImage(RegisterMaterial("logo_cod_mw_sm"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 300, _1080p * 29, _1080p * 93)
	var_6_0:addElement(var_6_10)

	var_6_0.MWLogo = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_6_4:RegisterAnimationSequence("KORZH", var_6_13)

	local function var_6_14()
		var_6_4:AnimateSequence("KORZH")
	end

	var_6_0._sequences.KORZH = var_6_14

	local var_6_15
	local var_6_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_6_4:RegisterAnimationSequence("JP", var_6_16)

	local function var_6_17()
		var_6_4:AnimateSequence("JP")
	end

	var_6_0._sequences.JP = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		}
	}

	var_6_4:RegisterAnimationSequence("RU", var_6_19)

	local function var_6_20()
		var_6_4:AnimateSequence("RU")
	end

	var_6_0._sequences.RU = var_6_20

	local var_6_21
	local var_6_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.wzTitle
		}
	}

	var_6_4:RegisterAnimationSequence("WZ", var_6_22)

	local var_6_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.wzTitle
		}
	}

	var_6_6:RegisterAnimationSequence("WZ", var_6_23)

	local function var_6_24()
		var_6_4:AnimateSequence("WZ")
		var_6_6:AnimateSequence("WZ")
	end

	var_6_0._sequences.WZ = var_6_24

	local var_6_25
	local var_6_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("MW", var_6_26)

	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.title
		}
	}

	var_6_6:RegisterAnimationSequence("MW", var_6_27)

	local var_6_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("MW", var_6_28)

	local function var_6_29()
		var_6_4:AnimateSequence("MW")
		var_6_6:AnimateSequence("MW")
		var_6_10:AnimateSequence("MW")
	end

	var_6_0._sequences.MW = var_6_29

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MenuTitle", MenuTitle)
LockTable(_M)
