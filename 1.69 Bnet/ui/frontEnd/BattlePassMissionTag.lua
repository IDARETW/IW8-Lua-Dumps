module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MissionName:setText(Engine.CBBHFCGDIC("BATTLEPASS/PLUS_MISSION", arg_1_2))
	arg_1_0.Backer:SetRGBFromTable(arg_1_1)

	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.MissionName)
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.ViewDetails)
	local var_1_2 = var_1_1 < var_1_0 and var_1_0 or var_1_1
	local var_1_3 = 100 * _1080p

	arg_1_0.Backer:SetRight(var_1_2 + var_1_3)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupMissionTag = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function BattlePassMissionTag(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "BattlePassMissionTag"
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

	var_3_4.id = "Backer"

	var_3_4:SetAlpha(0.3, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 311, 0, _1080p * 60)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "MissionName"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 63, _1080p * 263, _1080p * 6, _1080p * 30)
	var_3_0:addElement(var_3_6)

	var_3_0.MissionName = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "ViewDetails"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIEW_MISSION_DETAILS"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetTintFontIcons(true)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 63, _1080p * 311, _1080p * 30, _1080p * 52)
	var_3_0:addElement(var_3_8)

	var_3_0.ViewDetails = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Icon"

	var_3_10:setImage(RegisterMaterial("battlepass_operator_challenge_icon"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 52, _1080p * 8, _1080p * 52)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_12)

	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 311
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_13)

	local function var_3_14()
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassMissionTag", BattlePassMissionTag)
LockTable(_M)
