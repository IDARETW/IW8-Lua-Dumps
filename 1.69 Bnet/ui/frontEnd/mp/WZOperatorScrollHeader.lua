module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2 and type(arg_1_2) == "table" and arg_1_2.operators and type(arg_1_2.operators) == "table", "You need to assign a valid table of options to this method.")

	local var_1_0 = 0
	local var_1_1 = arg_1_2.operators

	for iter_1_0 = 1, #var_1_1 do
		if OPERATOR.IsUnlocked(arg_1_1, var_1_1[iter_1_0].ref) then
			var_1_0 = var_1_0 + 1
		end
	end

	local var_1_2 = "LUA_MENU/X_OF_Y_OPERATORS"
	local var_1_3 = arg_1_2.subtractRandomOperator and #var_1_1 - 1 or #var_1_1

	if IsLanguageRussian() or IsLanguagePolish() then
		var_1_2 = "LUA_MENU/X_OF_Y_OPERATORS_RU_PL"
	end

	arg_1_0.ItemsCollected:setText(Engine.CBBHFCGDIC(var_1_2, math.max(0, arg_1_2.subtractRandomOperator and var_1_0 - 1 or var_1_0), var_1_3))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupScrollHeader = var_0_0
end

function WZOperatorScrollHeader(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 28 * _1080p)

	var_3_0.id = "WZOperatorScrollHeader"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Line"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 23, _1080p * 24)
	var_3_0:addElement(var_3_4)

	var_3_0.Line = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "ItemsCollected"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y_OPERATORS"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 250, 0, _1080p * 22)
	var_3_0:addElement(var_3_6)

	var_3_0.ItemsCollected = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZOperatorScrollHeader", WZOperatorScrollHeader)
LockTable(_M)
