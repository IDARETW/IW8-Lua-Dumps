module(..., package.seeall)

function MissionArrowButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 90 * _1080p)

	var_1_0.id = "MissionArrowButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericButtonBlurBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "BlurBackground"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BlurBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "HonorsGrad"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.5, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, _1080p * 65, _1080p * 76)
	var_1_0:addElement(var_1_6)

	var_1_0.HonorsGrad = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TabBackground"

	var_1_8:SetRGBFromTable(SWATCHES.tabManager.tabBackgroundFocused, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 30, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.TabBackground = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "HonorsDivider"

	var_1_10:SetRGBFromInt(10921638, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, _1080p * 63, _1080p * 65)
	var_1_0:addElement(var_1_10)

	var_1_0.HonorsDivider = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "imageStub"

	var_1_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 45, _1080p * 49, _1080p * 52.5, _1080p * 56.5)
	var_1_0:addElement(var_1_12)

	var_1_0.imageStub = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "HonorsStub"

	var_1_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -129, _1080p * -125, _1080p * 52.5, _1080p * 56.5)
	var_1_0:addElement(var_1_14)

	var_1_0.HonorsStub = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "Selection"

	var_1_16:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_16)

	var_1_0.Selection = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("ArrowLeft", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "ArrowLeft"

	var_1_18:SetScale(-0.25, 0)
	var_1_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -28, _1080p * 4, _1080p * -32, _1080p * 32)
	var_1_0:addElement(var_1_18)

	var_1_0.ArrowLeft = var_1_18

	local var_1_19
	local var_1_20 = MenuBuilder.BuildRegisteredType("ArrowRight", {
		controllerIndex = var_1_1
	})

	var_1_20.id = "ArrowRight"

	var_1_20:SetScale(-0.25, 0)
	var_1_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -4, _1080p * 28, _1080p * -32, _1080p * 32)
	var_1_0:addElement(var_1_20)

	var_1_0.ArrowRight = var_1_20

	local var_1_21
	local var_1_22 = LUI.UIStyledText.new()

	var_1_22.id = "Text"

	var_1_22:SetRGBFromTable(SWATCHES.MissionSelectButton.headerText, 0)
	var_1_22:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_1_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_22:SetAlignment(LUI.Alignment.Left)
	var_1_22:SetOutlineRGBFromInt(0, 0)
	var_1_22:SetDecodeLetterLength(20)
	var_1_22:SetDecodeMaxRandChars(3)
	var_1_22:SetDecodeUpdatesPerLetter(4)
	var_1_22:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * -10, _1080p * 3, _1080p * 23)
	var_1_0:addElement(var_1_22)

	var_1_0.Text = var_1_22

	local var_1_23
	local var_1_24 = LUI.UIStyledText.new()

	var_1_24.id = "HeaderCompletion"

	var_1_24:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_24:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TARGET")), 0)
	var_1_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_24:SetAlignment(LUI.Alignment.Left)
	var_1_24:SetOutlineRGBFromInt(0, 0)
	var_1_24:SetDecodeLetterLength(20)
	var_1_24:SetDecodeMaxRandChars(3)
	var_1_24:SetDecodeUpdatesPerLetter(4)
	var_1_24:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 53, 0, _1080p * -42, _1080p * -29)
	var_1_0:addElement(var_1_24)

	var_1_0.HeaderCompletion = var_1_24

	local var_1_25
	local var_1_26 = LUI.UIStyledText.new()

	var_1_26.id = "HeaderHonours"

	var_1_26:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/HONORS")), 0)
	var_1_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_26:SetAlignment(LUI.Alignment.Center)
	var_1_26:SetOutlineRGBFromInt(0, 0)
	var_1_26:SetDecodeLetterLength(20)
	var_1_26:SetDecodeMaxRandChars(3)
	var_1_26:SetDecodeUpdatesPerLetter(4)
	var_1_26:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -180, _1080p * -10, _1080p * -42, _1080p * -29)
	var_1_0:addElement(var_1_26)

	var_1_0.HeaderHonours = var_1_26

	local var_1_27
	local var_1_28 = LUI.UIStyledText.new()

	var_1_28.id = "NumText"

	var_1_28:SetRGBFromInt(0, 0)
	var_1_28:setText("1", 0)
	var_1_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_28:SetAlignment(LUI.Alignment.Center)
	var_1_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, _1080p * 1, _1080p * 25)
	var_1_0:addElement(var_1_28)

	var_1_0.NumText = var_1_28

	local var_1_29
	local var_1_30 = MenuBuilder.BuildRegisteredType("MissionsHonours", {
		controllerIndex = var_1_1
	})

	var_1_30.id = "MissionsHonours"

	var_1_30:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -190, _1080p * -10, _1080p * -22, _1080p * -2)
	var_1_0:addElement(var_1_30)

	var_1_0.MissionsHonours = var_1_30

	local var_1_31
	local var_1_32 = LUI.UIStyledText.new()

	var_1_32.id = "TextCompletion"

	var_1_32:setText(ToUpperCase("99"), 0)
	var_1_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_32:SetAlignment(LUI.Alignment.Center)
	var_1_32:SetOutlineRGBFromInt(0, 0)
	var_1_32:SetDecodeLetterLength(20)
	var_1_32:SetDecodeMaxRandChars(3)
	var_1_32:SetDecodeUpdatesPerLetter(4)
	var_1_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 40, _1080p * 105, _1080p * -22, _1080p * -2)
	var_1_0:addElement(var_1_32)

	var_1_0.TextCompletion = var_1_32

	local var_1_33
	local var_1_34 = LUI.UIImage.new()

	var_1_34.id = "SideGrad"

	var_1_34:SetRGBFromInt(0, 0)
	var_1_34:SetAlpha(0.3, 0)
	var_1_34:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 36, 0, _1080p * 90)
	var_1_0:addElement(var_1_34)

	var_1_0.SideGrad = var_1_34

	local function var_1_35()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_35

	local var_1_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("ButtonOver", var_1_36)

	local function var_1_37()
		var_1_22:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_37

	local var_1_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("ButtonUp", var_1_38)

	local function var_1_39()
		var_1_22:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_39

	local var_1_40 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("Locked", var_1_40)

	local function var_1_41()
		var_1_22:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_41

	local var_1_42 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("NewNotification", var_1_42)

	local function var_1_43()
		var_1_22:AnimateSequence("NewNotification")
	end

	var_1_0._sequences.NewNotification = var_1_43

	local var_1_44 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("ButtonOverDisabled", var_1_44)

	local function var_1_45()
		var_1_22:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_45

	local var_1_46 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_22:RegisterAnimationSequence("ButtonUpDisabled", var_1_46)

	local function var_1_47()
		var_1_22:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_47

	var_1_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUpDisabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOverDisabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("MissionArrowButton", MissionArrowButton)
LockTable(_M)
