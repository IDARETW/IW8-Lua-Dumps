module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "KORZHJP")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_1_0, "RU")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericOptionSubcategoryTitle(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 34 * _1080p)

	var_2_0.id = "GenericOptionSubcategoryTitle"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "OptionSubcategory"

	var_2_4:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -27, _1080p * -7)
	var_2_0:addElement(var_2_4)

	var_2_0.OptionSubcategory = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Line"

	var_2_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.Line = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_10

	local var_2_11
	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_2_4:RegisterAnimationSequence("KORZHJP", var_2_12)

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_2_6:RegisterAnimationSequence("KORZHJP", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("KORZHJP")
		var_2_6:AnimateSequence("KORZHJP")
	end

	var_2_0._sequences.KORZHJP = var_2_14

	local var_2_15
	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		}
	}

	var_2_4:RegisterAnimationSequence("RU", var_2_16)

	local function var_2_17()
		var_2_4:AnimateSequence("RU")
	end

	var_2_0._sequences.RU = var_2_17

	local var_2_18
	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipSetup", var_2_19)

	local var_2_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipSetup", var_2_20)

	local function var_2_21()
		var_2_4:AnimateSequence("WZWipSetup")
		var_2_6:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_21

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GenericOptionSubcategoryTitle", GenericOptionSubcategoryTitle)
LockTable(_M)
