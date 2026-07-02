module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MatchIndicatorSwatches)
	arg_1_0.MatchIndicatorSwatches:Setup(arg_1_1, "HUD")
	arg_1_0:registerEventHandler("colorblind_updated", function(arg_2_0, arg_2_1)
		arg_2_0.MatchIndicatorSwatches:Update(arg_1_1, arg_2_1.value)
	end)
end

function ColorblindSwatches(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 200 * _1080p)

	var_3_0.id = "ColorblindSwatches"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "Title"

	var_3_4:setText(ToUpperCase(Engine.CBBHFCGDIC("OPTIONS/COLORBLIND_SWATCHES")), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.Title = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "ColorRepresent"

	var_3_6:setText(Engine.CBBHFCGDIC("OPTIONS/COLOR_REPRESENT"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 118, _1080p * 136)
	var_3_0:addElement(var_3_6)

	var_3_0.ColorRepresent = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("ColorblindSwatchList", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "MatchIndicatorSwatches"

	var_3_8.SwatchCat:setText(Engine.CBBHFCGDIC("OPTIONS/MATCH_INDICATORS"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 367, _1080p * 70, _1080p * 100)
	var_3_0:addElement(var_3_8)

	var_3_0.MatchIndicatorSwatches = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("ColorblindSwatchList", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "WarzoneSquadSwatches"

	var_3_10.SwatchCat:setText(Engine.CBBHFCGDIC("OPTIONS/WARZONE_SQUAD"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 391, _1080p * 664, _1080p * 70, _1080p * 100)
	var_3_0:addElement(var_3_10)

	var_3_0.WarzoneSquadSwatches = var_3_10

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ColorblindSwatches", ColorblindSwatches)
LockTable(_M)
