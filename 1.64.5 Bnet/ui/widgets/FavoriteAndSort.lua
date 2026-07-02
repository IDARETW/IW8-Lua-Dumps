module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.IsLastInputGamepad(arg_1_1) and 5 or 10
	local var_1_1 = -(LAYOUT.GetTextWidth(arg_1_0.SortPrompt.SortPrompt) + var_1_0)

	arg_1_0.FavoritesPrompt:SetRight(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.SortPrompt:UpdateText(arg_2_2, arg_2_3)
	var_0_0(arg_2_0, arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Update = var_0_1

	arg_3_0:addAndCallEventHandler("update_input_type", function(arg_4_0, arg_4_1)
		var_0_0(arg_4_0, arg_4_1.controllerIndex)
	end, {
		controllerIndex = arg_3_1
	})
end

function FavoriteAndSort(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 24 * _1080p)

	var_5_0.id = "FavoriteAndSort"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("SortPrompt", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "SortPrompt"

	var_5_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -150, 0, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_4)

	var_5_0.SortPrompt = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("FavoritesPrompt", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "FavoritesPrompt"

	var_5_6.FavoritesPrompt:SetAlignment(LUI.Alignment.Right)
	var_5_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -300, _1080p * -150, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_6)

	var_5_0.FavoritesPrompt = var_5_6

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("FavoriteAndSort", FavoriteAndSort)
LockTable(_M)
