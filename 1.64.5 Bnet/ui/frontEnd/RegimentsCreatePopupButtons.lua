module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.NameRestrictions:setText(Engine.CBBHFCGDIC("REGIMENTS/NAME_RESTRICTIONS_TIP", FRIENDS.CLANS_MAX_NAME_LENGTH, FRIENDS.MAX_DIGITS_IN_CLAN_NAME))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function RegimentsCreatePopupButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 440 * _1080p, 0, 270 * _1080p)

	var_2_0.id = "RegimentsCreatePopupButtons"
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

	var_2_4.id = "RegimentName"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_NAME"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 440, 0, _1080p * 20)
	var_2_0:addElement(var_2_4)

	var_2_0.RegimentName = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "NameCharacters"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHARACTERS_USED")), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 212, _1080p * 440, 0, _1080p * 20)
	var_2_0:addElement(var_2_6)

	var_2_0.NameCharacters = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("RecipeNameInputButton", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "NameInputButton"

	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 30, _1080p * 68)
	var_2_0:addElement(var_2_8)

	var_2_0.NameInputButton = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "NameRestrictions"

	var_2_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_10:setText("", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 440, _1080p * 70, _1080p * 90)
	var_2_0:addElement(var_2_10)

	var_2_0.NameRestrictions = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "CreateButton"

	var_2_12.Text:SetLeft(_1080p * 20, 0)
	var_2_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATE"), 0)
	var_2_12.Text:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 440, _1080p * 117, _1080p * 155)
	var_2_0:addElement(var_2_12)

	var_2_0.CreateButton = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "Line1"

	var_2_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_14:SetAlpha(0.4, 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 440, _1080p * 23, _1080p * 24)
	var_2_0:addElement(var_2_14)

	var_2_0.Line1 = var_2_14

	local function var_2_15()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_15

	local var_2_16
	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_17)

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_18)

	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 100
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_19)

	local function var_2_20()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
		var_2_10:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_20

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("RegimentsCreatePopupButtons", RegimentsCreatePopupButtons)
LockTable(_M)
