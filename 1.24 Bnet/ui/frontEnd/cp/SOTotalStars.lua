module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1 = CP.GetTotalStarsEarned(arg_1_1)
	local var_1_2 = CP.GetNextReward(var_1_0)
	local var_1_3 = var_1_2 and var_1_2.stars or var_1_0

	arg_1_0.TotalStarsCount:setText(var_1_0)
	arg_1_0.NextRewardStarCount:setText(var_1_3)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function SOTotalStars(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 525 * _1080p, 0, 60 * _1080p)

	var_2_0.id = "SOTotalStars"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "GradientBackground"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_2_4:SetAlpha(0.1, 0)
	var_2_4:setImage(RegisterMaterial("gradient"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 525, _1080p * 68, _1080p * 104)
	var_2_0:addElement(var_2_4)

	var_2_0.GradientBackground = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "StatsBacker"

	var_2_6:SetAlpha(0.5, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 525, 0, _1080p * 60)
	var_2_0:addElement(var_2_6)

	var_2_0.StatsBacker = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "NextRewardStarCount"

	var_2_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_8:setText("99", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -122, _1080p * -71, _1080p * 15, _1080p * 45)
	var_2_0:addElement(var_2_8)

	var_2_0.NextRewardStarCount = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "NextRewardabel"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("LUA_MENU/NEXT_REWARD"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_10:SetWordWrap(false)
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetTintFontIcons(true)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 295, _1080p * 422, _1080p * 19, _1080p * 41)
	var_2_0:addElement(var_2_10)

	var_2_0.NextRewardabel = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "NextRewardIcon"

	var_2_12:setImage(RegisterMaterial("star_on"), 0)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 201.5, _1080p * 242.5, _1080p * 9, _1080p * 49)
	var_2_0:addElement(var_2_12)

	var_2_0.NextRewardIcon = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "Divider"

	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 274, _1080p * 276, _1080p * 2, _1080p * 60)
	var_2_0:addElement(var_2_14)

	var_2_0.Divider = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIText.new()

	var_2_16.id = "TotalStarsCount"

	var_2_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_16:setText("99", 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetWordWrap(false)
	var_2_16:SetAlignment(LUI.Alignment.Right)
	var_2_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -368, _1080p * -317, _1080p * 15, _1080p * 45)
	var_2_0:addElement(var_2_16)

	var_2_0.TotalStarsCount = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "TotalStarsIcon"

	var_2_18:setImage(RegisterMaterial("star_on"), 0)
	var_2_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -47.5, _1080p * -7.5, _1080p * 8, _1080p * 48)
	var_2_0:addElement(var_2_18)

	var_2_0.TotalStarsIcon = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIStyledText.new()

	var_2_20.id = "TotalStarsLabel"

	var_2_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_20:setText(Engine.CBBHFCGDIC("LUA_MENU/TOTAL_EARNED"), 0)
	var_2_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_20:SetWordWrap(false)
	var_2_20:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetTintFontIcons(true)
	var_2_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 151, _1080p * 17, _1080p * 39)
	var_2_0:addElement(var_2_20)

	var_2_0.TotalStarsLabel = var_2_20

	local var_2_21
	local var_2_22 = LUI.UIStyledText.new()

	var_2_22.id = "ViewChallengesPrompt"

	var_2_22:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_22:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_ALL_STAR_REWARDS"), 0)
	var_2_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_22:SetWordWrap(false)
	var_2_22:SetAlignment(LUI.Alignment.Left)
	var_2_22:SetTintFontIcons(true)
	var_2_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 238, _1080p * 75, _1080p * 97)
	var_2_0:addElement(var_2_22)

	var_2_0.ViewChallengesPrompt = var_2_22

	local function var_2_23()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_23

	local var_2_24
	local var_2_25 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_25)

	local var_2_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -306
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_2_22:RegisterAnimationSequence("AR", var_2_26)

	local function var_2_27()
		var_2_4:AnimateSequence("AR")
		var_2_22:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_27

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SOTotalStars", SOTotalStars)
LockTable(_M)
