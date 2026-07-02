module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonUp")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function BRPlayTutorialButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 115 * _1080p)

	var_4_0.id = "BRPlayTutorialButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "PlayTutorial"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_TUTORIAL")), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_6:SetTracking(1 * _1080p, 0)
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -15.5, _1080p * 14.5)
	var_4_0:addElement(var_4_6)

	var_4_0.PlayTutorial = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			duration = 290,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_9)

	local function var_4_10()
		var_4_6:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_10

	local var_4_11
	local var_4_12 = {
		{
			duration = 290,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 290,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipSetup", var_4_15)

	local function var_4_16()
		var_4_6:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_16

	local var_4_17
	local var_4_18 = {
		{
			duration = 290,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			value = 1,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipButtonOver", var_4_18)

	local function var_4_19()
		var_4_6:AnimateSequence("WZWipButtonOver")
	end

	var_4_0._sequences.WZWipButtonOver = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			value = 0.5,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipButtonUp", var_4_21)

	local function var_4_22()
		var_4_6:AnimateSequence("WZWipButtonUp")
	end

	var_4_0._sequences.WZWipButtonUp = var_4_22

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BRPlayTutorialButton", BRPlayTutorialButton)
LockTable(_M)
