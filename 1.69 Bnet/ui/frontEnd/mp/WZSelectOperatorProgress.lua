module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = OPERATOR.GetRank(arg_1_0._controllerIndex, arg_1_1)
	local var_1_1 = OPERATOR.GetRankDisplay(var_1_0)
	local var_1_2 = OPERATOR.GetOperatorProgress(arg_1_0._controllerIndex, arg_1_1).xp
	local var_1_3 = OPERATOR.GetRankMaxXP(arg_1_1, var_1_0)
	local var_1_4 = var_1_2 / var_1_3

	arg_1_0.ProgressBar:SetProgress(var_1_4, 0)
	arg_1_0.OperatorXP:setText(Engine.CBBHFCGDIC("MENU_SP/X_SLASH_Y_XP", var_1_2, var_1_3))

	if OPERATOR.GetMaxRank(arg_1_1) == var_1_0 then
		arg_1_0.OperatorLevel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_LEVEL_MAX", var_1_1)))
		ACTIONS.AnimateSequence(arg_1_0, "ShowMaxLevel")
	else
		arg_1_0.OperatorLevel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_LEVEL", var_1_1)))
		ACTIONS.AnimateSequence(arg_1_0, "ShowNonMaxLevel")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupProgression = var_0_0
	arg_2_0._controllerIndex = arg_2_1
end

function WZSelectOperatorProgress(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "WZSelectOperatorProgress"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "ProgressBar"

	var_3_4.Fill:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZProgressBar, 0)
	var_3_4.Frame:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_3_4.Cap:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 401, _1080p * 39, _1080p * 53)
	var_3_0:addElement(var_3_4)

	var_3_0.ProgressBar = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "OperatorLevel"

	var_3_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_LEVEL"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 234, _1080p * 10, _1080p * 30)
	var_3_0:addElement(var_3_6)

	var_3_0.OperatorLevel = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "OperatorXP"

	var_3_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("MENU_SP/X_SLASH_Y_XP"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 251, _1080p * 401, _1080p * 10, _1080p * 30)
	var_3_0:addElement(var_3_8)

	var_3_0.OperatorXP = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowMaxLevel", var_3_11)

	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowMaxLevel", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("ShowMaxLevel")
		var_3_8:AnimateSequence("ShowMaxLevel")
	end

	var_3_0._sequences.ShowMaxLevel = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowNonMaxLevel", var_3_15)

	local var_3_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowNonMaxLevel", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("ShowNonMaxLevel")
		var_3_8:AnimateSequence("ShowNonMaxLevel")
	end

	var_3_0._sequences.ShowNonMaxLevel = var_3_17

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZSelectOperatorProgress", WZSelectOperatorProgress)
LockTable(_M)
