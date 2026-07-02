module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not Dvar.IBEGCHEFE("NPOLQSQMNO") then
		arg_1_0:SetAlpha(0)

		return
	end

	local var_1_0 = tonumber(arg_1_1)
	local var_1_1 = ""
	local var_1_2 = "white"

	if var_1_0 then
		if var_1_0 > 0 then
			var_1_1 = SEASON.GetName(var_1_0)
			var_1_2 = SEASON.GetImage(var_1_0)

			arg_1_0:SetAlpha(1)
		else
			arg_1_0:SetAlpha(0)
		end
	end

	arg_1_0.SeasonText:setText(Engine.CBBHFCGDIC(var_1_1))

	if #var_1_2 > 0 then
		arg_1_0.SeasonIcon:setImage(RegisterMaterial(var_1_2))
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.SeasonText)
	assert(arg_2_0.SeasonIcon)

	arg_2_0.UpdateSeasonText = var_0_0
end

function SeasonWithText(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 160 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "SeasonWithText"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "MainBacker"

	var_3_4:SetRGBFromInt(4737096, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 183, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.MainBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "SeasonText"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 43, _1080p * 418, _1080p * 4, _1080p * 28)
	var_3_0:addElement(var_3_6)

	var_3_0.SeasonText = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "SeasonIcon"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_8:setImage(RegisterMaterial("icon_rarity_4"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_3_0:addElement(var_3_8)

	var_3_0.SeasonIcon = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_11)

	local function var_3_12()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SeasonWithText", SeasonWithText)
LockTable(_M)
