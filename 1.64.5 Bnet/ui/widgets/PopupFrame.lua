module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Title)
	assert(arg_1_0.Darkener)

	arg_1_0.BindButton = LUI.UIBindButton.new()
	arg_1_0.BindButton.id = "selfBindButton"

	arg_1_0:addElement(arg_1_0.BindButton)

	function arg_1_0.SetTitle(arg_2_0, arg_2_1)
		arg_2_0.Title:setText(ToUpperCase(arg_2_1))
	end

	function arg_1_0.MeasureTitle(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0.Title:GetCurrentFont()
		local var_3_1, var_3_2, var_3_3, var_3_4 = arg_3_0.Title:getLocalRect()
		local var_3_5, var_3_6, var_3_7, var_3_8 = arg_3_0.Title:GetAnchorData()

		assert(var_3_6 == 0 and var_3_8 == 1 or var_3_6 == 1 and var_3_8 == 0)

		local var_3_9 = math.abs(var_3_2 - var_3_4)
		local var_3_10, var_3_11, var_3_12, var_3_13 = GetTextDimensions(arg_3_1, var_3_0, var_3_9)

		return var_3_12 - var_3_10
	end

	if arg_1_2.hideBackground then
		arg_1_0.Darkener:SetAlpha(0, 0)
	end

	if arg_1_2.blockBackground == true then
		arg_1_0.Darkener:SetAlpha(1)
	end

	if arg_1_2.hideFrame then
		arg_1_0.TitleBG:SetAlpha(0, 0)
	end

	if CONDITIONS.IsSplitscreen() then
		arg_1_0.Darkener:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1200, _1080p * 1200, _1080p * -960, _1080p * 960, 0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if not arg_1_2.noBackButton then
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	if not arg_1_2.noSelectButton then
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function PopupFrame(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p)

	var_4_0.id = "PopupFrame"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.6, 0)
	var_4_4:SetScale(1, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -760, _1080p * 760, _1080p * -760, _1080p * 760)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "TitleBG"

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -70, _1080p * 20)
	var_4_0:addElement(var_4_6)

	var_4_0.TitleBG = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_8:SetStartupDelay(1250)
	var_4_8:SetLineHoldTime(400)
	var_4_8:SetAnimMoveTime(300)
	var_4_8:SetAnimMoveSpeed(50)
	var_4_8:SetEndDelay(1000)
	var_4_8:SetCrossfadeTime(500)
	var_4_8:SetFadeInTime(300)
	var_4_8:SetFadeOutTime(300)
	var_4_8:SetMaxVisibleLines(1)
	var_4_8:SetDecodeLetterLength(25)
	var_4_8:SetDecodeMaxRandChars(3)
	var_4_8:SetDecodeUpdatesPerLetter(4)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -60, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "ButtonHelperBar"

	var_4_10.Background:SetAlpha(0, 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -100, _1080p * 100, _1080p * 20, _1080p * 80)
	var_4_0:addElement(var_4_10)

	var_4_0.ButtonHelperBar = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Darken", var_4_13)

	local function var_4_14()
		var_4_4:AnimateSequence("Darken")
	end

	var_4_0._sequences.Darken = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -44
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_16)

	local function var_4_17()
		var_4_8:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_19)

	local function var_4_20()
		var_4_8:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_20

	ACTIONS.AnimateSequence(var_4_0, "Darken")
	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("PopupFrame", PopupFrame)
LockTable(_M)
