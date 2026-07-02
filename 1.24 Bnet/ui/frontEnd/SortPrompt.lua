module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = ""

	if arg_1_1.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
		var_1_0 = var_1_0 .. Engine.CBBHFCGDIC("MENU/NEW")
	elseif arg_1_1.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
		var_1_0 = var_1_0 .. Engine.CBBHFCGDIC("MENU/OLD")
	end

	if arg_1_1.raritySortingType == LOOT.raritySortingOptions.LOW_FIRST then
		if var_1_0 ~= "" then
			var_1_0 = var_1_0 .. "/"
		end

		var_1_0 = var_1_0 .. Engine.CBBHFCGDIC("LOOT_MP/QUALITY_1")
	elseif arg_1_1.raritySortingType == LOOT.raritySortingOptions.HIGH_FIRST then
		if var_1_0 ~= "" then
			var_1_0 = var_1_0 .. "/"
		end

		var_1_0 = var_1_0 .. Engine.CBBHFCGDIC("LOOT_MP/QUALITY_4")
	end

	if var_1_0 ~= "" then
		var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/CURRENT_SORT_FILTER", var_1_0)
	else
		var_1_0 = "[" .. Engine.CBBHFCGDIC("LUA_MENU/ALPHABETICAL") .. "]"
	end

	local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER_PROMPT", Engine.JCBDICCAH(var_1_0))

	if arg_1_2 then
		var_1_1 = Engine.CBBHFCGDIC(arg_1_2) .. Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER_TYPE", Engine.JCBDICCAH(var_1_0))
	end

	arg_1_0.SortPrompt:setText(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateText = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function SortPrompt(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 130 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "SortPrompt"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "SortPrompt"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Right)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 22)
	var_3_0:addElement(var_3_4)

	var_3_0.SortPrompt = var_3_4

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

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_11

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SortPrompt", SortPrompt)
LockTable(_M)
