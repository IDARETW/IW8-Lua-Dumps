module(..., package.seeall)

function CdlEntryButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "CdlEntryButton"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Background"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Text"

	var_1_6:SetRGBFromInt(5863813, 0)
	var_1_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CDL_ENTRY")), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_6:SetStartupDelay(1000)
	var_1_6:SetLineHoldTime(400)
	var_1_6:SetAnimMoveTime(150)
	var_1_6:SetAnimMoveSpeed(50)
	var_1_6:SetEndDelay(1000)
	var_1_6:SetCrossfadeTime(400)
	var_1_6:SetFadeInTime(300)
	var_1_6:SetFadeOutTime(300)
	var_1_6:SetMaxVisibleLines(1)
	var_1_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 350, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	local var_1_7
	local var_1_8 = {
		{
			value = 5863813,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_8)

	local function var_1_9()
		var_1_6:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10
	local var_1_11 = {
		{
			value = 9225837,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_11)

	local function var_1_12()
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_12

	local var_1_13
	local var_1_14 = {
		{
			value = 8686977,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_14)

	local function var_1_15()
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_15

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("CdlEntryButton", CdlEntryButton)
LockTable(_M)
