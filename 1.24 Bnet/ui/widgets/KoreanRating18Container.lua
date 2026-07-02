module(..., package.seeall)

function KoreanRating18Container(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 648 * _1080p, 0, 252 * _1080p)

	var_1_0.id = "KoreanRating18Container"

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
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -317, _1080p * -117, _1080p * -118, _1080p * 118)
	var_1_0:addElement(var_1_4)

	var_1_0.KoreanRating18Icon = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "KoreanRatingViolenceIcon"

	var_1_6:setImage(RegisterMaterial("icon_korean_ratingviolence"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -118, _1080p * 118)
	var_1_0:addElement(var_1_6)

	var_1_0.KoreanRatingViolenceIcon = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "KoreanRatingLanguage"

	var_1_8:setImage(RegisterMaterial("icon_korean_ratinglanguage"), 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 117, _1080p * 317, _1080p * -118, _1080p * 118)
	var_1_0:addElement(var_1_8)

	var_1_0.KoreanRatingLanguage = var_1_8

	return var_1_0
end

MenuBuilder.registerType("KoreanRating18Container", KoreanRating18Container)
LockTable(_M)
