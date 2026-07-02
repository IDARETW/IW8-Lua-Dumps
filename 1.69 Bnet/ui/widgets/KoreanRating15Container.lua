module(..., package.seeall)

function KoreanRating15Container(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 720 * _1080p, 0, 540 * _1080p)

	var_1_0.id = "KoreanRating15Container"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "KoreanRating18Icon"

	var_1_4:setImage(RegisterMaterial("icon_korean_ratingeighteen"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * -180, _1080p * 5, _1080p * 205)
	var_1_0:addElement(var_1_4)

	var_1_0.KoreanRating18Icon = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "KoreanRating18ViolenceIcon"

	var_1_6:setImage(RegisterMaterial("icon_korean_ratingviolence"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -180, 0, _1080p * 5, _1080p * 205)
	var_1_0:addElement(var_1_6)

	var_1_0.KoreanRating18ViolenceIcon = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "KoreanRating18LanguageIcon"

	var_1_8:setImage(RegisterMaterial("icon_korean_ratinglanguage"), 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 180, _1080p * 5, _1080p * 205)
	var_1_0:addElement(var_1_8)

	var_1_0.KoreanRating18LanguageIcon = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "KoreanRatingDrugIcon"

	var_1_10:setImage(RegisterMaterial("icon_korean_ratingdrug"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 180, _1080p * 360, _1080p * 5, _1080p * 205)
	var_1_0:addElement(var_1_10)

	var_1_0.KoreanRatingDrugIcon = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "KoreanRating18LanguageIconMW"

	var_1_12:setImage(RegisterMaterial("icon_korean_ratinglanguage"), 0)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 180, _1080p * -205, _1080p * -5)
	var_1_0:addElement(var_1_12)

	var_1_0.KoreanRating18LanguageIconMW = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "KoreanRating18ViolenceIconMW"

	var_1_14:setImage(RegisterMaterial("icon_korean_ratingviolence"), 0)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -180, 0, _1080p * -205, _1080p * -5)
	var_1_0:addElement(var_1_14)

	var_1_0.KoreanRating18ViolenceIconMW = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "KoreanRating18IconMW"

	var_1_16:setImage(RegisterMaterial("icon_korean_ratingeighteen"), 0)
	var_1_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * -180, _1080p * -205, _1080p * -5)
	var_1_0:addElement(var_1_16)

	var_1_0.KoreanRating18IconMW = var_1_16

	return var_1_0
end

MenuBuilder.registerType("KoreanRating15Container", KoreanRating15Container)
LockTable(_M)
