module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._streakRef = arg_1_1

	if Engine.ECHCFGDDDF() then
		local var_1_0 = StringTable.BJJBBCJGEJ(CSV.streaks.file, CSV.streaks.cols.ref, arg_1_1)
		local var_1_1 = CSV.ReadRow(CSV.streaks, var_1_0)

		arg_1_0.StreakIcon:setImage(RegisterMaterial(STREAK.GetImage(var_1_1.ref)))

		arg_1_0._killsRequired = Engine.CBBHFCGDIC("LUA_MENU/KILL_COUNT", var_1_1.kills)
		arg_1_0._scoreRequired = var_1_1.scoreCost
	elseif CONDITIONS.IsThirdGameMode() then
		local var_1_2 = StringTable.BJJBBCJGEJ(CSV.munitions.file, CSV.munitions.cols.ref, arg_1_1)
		local var_1_3 = CSV.ReadRow(CSV.munitions, var_1_2)

		if not CONDITIONS.IsWaveGameType() then
			if tonumber(var_1_3.scoreCost) == 0 then
				arg_1_0._scoreRequired = Engine.CBBHFCGDIC("LUA_MENU/COST_FREE")
			else
				arg_1_0._scoreRequired = Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECTION_COST_LABEL", var_1_3.scoreCost)
			end
		end

		if var_1_3.ref == "empty1" or var_1_3.ref == "empty2" or var_1_3.ref == "empty3" or var_1_3.ref == "none" then
			ACTIONS.AnimateSequence(arg_1_0, "MunitionUnavailable")
			arg_1_0.StreakIcon:setImage(RegisterMaterial("icon_empty_x"))
			arg_1_0.Text:SetAlpha(0)
		else
			ACTIONS.AnimateSequence(arg_1_0, "MunitionAvailable")
			arg_1_0.StreakIcon:setImage(RegisterMaterial(MUNITION.GetImage(var_1_3.ref)))
			arg_1_0.Text:setText(arg_1_0._scoreRequired)
			arg_1_0.Text:SetAlpha(1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 then
		arg_2_0.Text:setText(arg_2_0._killsRequired)
	else
		arg_2_0.Text:setText(arg_2_0._scoreRequired)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.StreakIcon)
	assert(arg_3_0.Text)

	arg_3_0.SetupStreak = var_0_0
	arg_3_0.ShowKills = var_0_1
	arg_3_0._killsRequired = ""
	arg_3_0._scoreRequired = ""

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function StreakInfo(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 80 * _1080p, 0, 125 * _1080p)

	var_4_0.id = "StreakInfo"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "StreakIcon"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 72, _1080p * 8, _1080p * 72)
	var_4_0:addElement(var_4_4)

	var_4_0.StreakIcon = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Text"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/KILL_COUNT"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 92, _1080p * 116)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8 = {
		{
			value = -0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_4_4:RegisterAnimationSequence("MoveText", var_4_8)

	local var_4_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_4_6:RegisterAnimationSequence("MoveText", var_4_9)

	local function var_4_10()
		var_4_4:AnimateSequence("MoveText")
		var_4_6:AnimateSequence("MoveText")
	end

	var_4_0._sequences.MoveText = var_4_10

	local var_4_11 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -92
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_11)

	local function var_4_12()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_12

	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_4_6:RegisterAnimationSequence("MoveTextCP", var_4_13)

	local function var_4_14()
		var_4_6:AnimateSequence("MoveTextCP")
	end

	var_4_0._sequences.MoveTextCP = var_4_14

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 72
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("MunitionAvailable", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("MunitionAvailable")
	end

	var_4_0._sequences.MunitionAvailable = var_4_16

	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("MunitionUnavailable", var_4_17)

	local function var_4_18()
		var_4_4:AnimateSequence("MunitionUnavailable")
	end

	var_4_0._sequences.MunitionUnavailable = var_4_18

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("StreakInfo", StreakInfo)
LockTable(_M)
