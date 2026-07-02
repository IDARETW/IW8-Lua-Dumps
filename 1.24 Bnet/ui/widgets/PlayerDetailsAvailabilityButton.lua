module(..., package.seeall)

function PlayerDetailsAvailabilityButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 24 * _1080p)

	var_1_0.id = "PlayerDetailsAvailabilityButton"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Highlight"

	var_1_4:SetRGBFromInt(6710886, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Highlight = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "GenericButton0"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * 1)
	var_1_0:addElement(var_1_6)

	var_1_0.GenericButton0 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Dot"

	var_1_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_8:SetPixelGridEnabled(true)
	var_1_8:SetPixelGridContrast(0.2, 0)
	var_1_8:SetPixelGridBlockWidth(2, 0)
	var_1_8:SetPixelGridBlockHeight(2, 0)
	var_1_8:SetPixelGridGutterWidth(1, 0)
	var_1_8:SetPixelGridGutterHeight(1, 0)
	var_1_8:setImage(RegisterMaterial("icon_bnet_available"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 25, _1080p * -10, _1080p * 10)
	var_1_0:addElement(var_1_8)

	var_1_0.Dot = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Arrow"

	var_1_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_10:SetZRotation(180, 0)
	var_1_10:setImage(RegisterMaterial("icon_option_arrow_up_down"), 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -25, _1080p * -1, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_10)

	var_1_0.Arrow = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "AvailabilityLabel"

	var_1_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetWordWrap(false)
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_12:SetUseEllipses(ELLIPSES.enabled_default)
	var_1_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 32, _1080p * -22, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_12)

	var_1_0.AvailabilityLabel = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "PadPromptLabel"

	var_1_14:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_LEFT_STICK"), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -28, _1080p * -4, _1080p * -8, _1080p * 10)
	var_1_0:addElement(var_1_14)

	var_1_0.PadPromptLabel = var_1_14

	local function var_1_15()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_18

	local var_1_19
	local var_1_20 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_21

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)

	return var_1_0
end

MenuBuilder.registerType("PlayerDetailsAvailabilityButton", PlayerDetailsAvailabilityButton)
LockTable(_M)
