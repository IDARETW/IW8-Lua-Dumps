module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not CONDITIONS.IsUserSignedInDemonware(arg_1_0._controllerIndex) then
		arg_1_0:SetAlpha(0)

		return
	end

	if arg_1_1 then
		arg_1_0.FavoritesPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FAVORITE", arg_1_2, LOOT.maxFavorites))
		ACTIONS.AnimateSequence(arg_1_0, "StopWarning")
	elseif arg_1_2 >= LOOT.maxFavorites then
		arg_1_0.FavoritesPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/FAVORITES_FULL", arg_1_2, LOOT.maxFavorites))
	else
		arg_1_0.FavoritesPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/ADD_FAVORITE", arg_1_2, LOOT.maxFavorites))
		ACTIONS.AnimateSequence(arg_1_0, "StopWarning")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateText = var_0_0
	arg_2_0._controllerIndex = arg_2_1
end

function FavoritesPrompt(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 130 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "FavoritesPrompt"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "FavoritesPrompt"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 22)
	var_3_0:addElement(var_3_4)

	var_3_0.FavoritesPrompt = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Warning", var_3_6)

	local function var_3_7()
		var_3_4:AnimateSequence("Warning")
	end

	var_3_0._sequences.Warning = var_3_7

	local var_3_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("StopWarning", var_3_8)

	local function var_3_9()
		var_3_4:AnimateSequence("StopWarning")
	end

	var_3_0._sequences.StopWarning = var_3_9

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("FavoritesPrompt", FavoritesPrompt)
LockTable(_M)
