module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if Engine.DDHFCGHJEA() then
		arg_1_0.KoreanRatingContainer:SetAlpha(1)
	else
		arg_1_0.KoreanRatingContainer:SetAlpha(0)
	end
end

function KoreanRatingsContainer(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 648 * _1080p, 0, 410 * _1080p)

	var_2_0.id = "KoreanRatingsContainer"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("KoreanRating15Container", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "KoreanRatingContainer"

	var_2_4:SetScale(-0.17, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 648, _1080p * -44, _1080p * 460)
	var_2_0:addElement(var_2_4)

	var_2_0.KoreanRatingContainer = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("KoreanRatingsContainer", KoreanRatingsContainer)
LockTable(_M)
