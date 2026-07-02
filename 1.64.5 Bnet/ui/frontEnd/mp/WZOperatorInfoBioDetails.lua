module(..., package.seeall)

local var_0_0 = 0.75

local function var_0_1(arg_1_0, arg_1_1)
	if not arg_1_1 or type(arg_1_1) ~= "table" then
		assert(false, "Need to provide a table of the Operators detail information ( background, citizenShip, etc. )")
	end

	local var_1_0 = arg_1_1.background

	arg_1_0.BackgroundInfoLabel:setText(var_1_0)
	arg_1_0.FirstLanguageInfoLabel:setText(arg_1_1.firstLanguage)
	arg_1_0.CitizenshipInfoLabel:setText(arg_1_1.citizenShip)

	if not arg_1_1.favoriteWeaponRef or arg_1_1.favoriteWeaponRef == "" then
		ACTIONS.AnimateSequence(arg_1_0, "HideFavoriteWeaponDetails")
	else
		arg_1_0.FavoriteWeapon:SetWeaponDataByRef(arg_1_1.favoriteWeaponRef)
		ACTIONS.AnimateSequence(arg_1_0, "ShowFavoriteWeaponDetails")
	end

	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0.BackgroundInfoLabel:getLocalRect()
	local var_1_5 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.BackgroundInfoLabel, var_1_0)
	local var_1_6, var_1_7, var_1_8, var_1_9 = arg_1_0.FirstLanguageLabel:getLocalRect()
	local var_1_10 = var_1_9 - var_1_7
	local var_1_11, var_1_12, var_1_13, var_1_14 = arg_1_0.FirstLanguageInfoLabel:getLocalRect()
	local var_1_15 = 20 * _1080p
	local var_1_16 = var_1_2 + var_1_5 + var_1_15

	arg_1_0.FirstLanguageLabel:SetTop(var_1_16)
	arg_1_0.FirstLanguageLabel:SetBottom(var_1_16 + var_1_10)
	arg_1_0.CitizenshipLabel:SetTop(var_1_16)
	arg_1_0.CitizenshipLabel:SetBottom(var_1_16 + var_1_10)

	local var_1_17 = var_1_16 + var_1_10
	local var_1_18 = var_1_14 - var_1_12

	if CONDITIONS.IsJapanese() and not arg_1_0.labelScaleApplied then
		var_1_18 = var_1_18 * var_0_0
		arg_1_0.labelScaleApplied = true
	end

	arg_1_0.FirstLanguageInfoLabel:SetTop(var_1_17)
	arg_1_0.FirstLanguageInfoLabel:SetBottom(var_1_17 + var_1_18)
	arg_1_0.CitizenshipInfoLabel:SetTop(var_1_17)
	arg_1_0.CitizenshipInfoLabel:SetBottom(var_1_17 + var_1_18)

	local var_1_19 = var_1_17 + var_1_18
	local var_1_20, var_1_21, var_1_22, var_1_23 = arg_1_0.BotSep:getLocalRect()
	local var_1_24 = var_1_23 - var_1_21

	arg_1_0.BotSep:SetTop(var_1_19 + var_1_18)
	arg_1_0.BotSep:SetBottom(var_1_19 + var_1_18 + var_1_24)

	local var_1_25 = var_1_19 + var_1_18 + var_1_24 + var_1_15

	arg_1_0.FavoriteWeapon:SetTop(var_1_25)

	if CONDITIONS.IsJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JA")
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetBioDetails = var_0_1
end

function WZOperatorInfoBioDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 437 * _1080p)

	var_3_0.id = "WZOperatorInfoBioDetails"
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

	var_3_4.id = "TopSep"

	var_3_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_3_0:addElement(var_3_4)

	var_3_0.TopSep = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "BotSep"

	var_3_6:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_6:SetAlpha(0.6, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 158, _1080p * 159)
	var_3_0:addElement(var_3_6)

	var_3_0.BotSep = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "BackgroundLabel"

	var_3_8:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZATION_FIELD_BACKGROUND_CAPS"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 22, _1080p * 40)
	var_3_0:addElement(var_3_8)

	var_3_0.BackgroundLabel = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "BackgroundInfoLabel"

	var_3_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 550, _1080p * 40, _1080p * 63)
	var_3_0:addElement(var_3_10)

	var_3_0.BackgroundInfoLabel = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "FirstLanguageLabel"

	var_3_12:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FIRST_LANGUAGE")), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetWordWrap(false)
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 275, _1080p * 97, _1080p * 115)
	var_3_0:addElement(var_3_12)

	var_3_0.FirstLanguageLabel = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "FirstLanguageInfoLabel"

	var_3_14:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU/FIRST_LANGUAGE"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 275, _1080p * 116, _1080p * 139)
	var_3_0:addElement(var_3_14)

	var_3_0.FirstLanguageInfoLabel = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "CitizenshipLabel"

	var_3_16:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_16:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CITIZENSHIP")), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetWordWrap(false)
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -275, 0, _1080p * 97, _1080p * 115)
	var_3_0:addElement(var_3_16)

	var_3_0.CitizenshipLabel = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "CitizenshipInfoLabel"

	var_3_18:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU/CITIZENSHIP"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetWordWrap(false)
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -275, 0, _1080p * 116, _1080p * 139)
	var_3_0:addElement(var_3_18)

	var_3_0.CitizenshipInfoLabel = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("WZOperatorInfoBioDetailWeapon", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "FavoriteWeapon"

	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 180, _1080p * 436)
	var_3_0:addElement(var_3_20)

	var_3_0.FavoriteWeapon = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("ShowFavoriteWeaponDetails", var_3_23)

	local function var_3_24()
		var_3_20:AnimateSequence("ShowFavoriteWeaponDetails")
	end

	var_3_0._sequences.ShowFavoriteWeaponDetails = var_3_24

	local var_3_25
	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("HideFavoriteWeaponDetails", var_3_26)

	local function var_3_27()
		var_3_20:AnimateSequence("HideFavoriteWeaponDetails")
	end

	var_3_0._sequences.HideFavoriteWeaponDetails = var_3_27

	var_0_2(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZOperatorInfoBioDetails", WZOperatorInfoBioDetails)
LockTable(_M)
