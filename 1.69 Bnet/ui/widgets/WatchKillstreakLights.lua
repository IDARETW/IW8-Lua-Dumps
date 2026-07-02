module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if Engine.DDJFBBJAIG() then
		ACTIONS.AnimateSequence(arg_1_0, "Inactive")

		return
	end

	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = Game.BFEEGCHICA(arg_1_1, "ui_score_streak")
		local var_2_1 = Game.BFEEGCHICA(arg_1_1, "ui_score_streak_cost")
		local var_2_2 = Game.BFEEGCHICA(arg_1_1, "ui_score_streak_available_1")
		local var_2_3 = var_2_0 / var_2_1

		if var_2_3 >= 1 then
			ACTIONS.AnimateSequence(arg_2_0, "Level5")
		elseif var_2_3 >= 0.8 then
			ACTIONS.AnimateSequence(arg_2_0, "Level4")
		elseif var_2_3 >= 0.6 then
			ACTIONS.AnimateSequence(arg_2_0, "Level3")
		elseif var_2_3 >= 0.4 then
			ACTIONS.AnimateSequence(arg_2_0, "Level2")
		elseif var_2_3 >= 0.2 then
			ACTIONS.AnimateSequence(arg_2_0, "Level1")
		elseif var_2_2 == 1 then
			ACTIONS.AnimateSequence(arg_2_0, "Level5")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Inactive")
		end
	end

	if CONDITIONS.IsBRGameType(arg_1_0) then
		arg_1_0:registerOmnvarHandler("ui_score_streak_cost", var_1_0)
		arg_1_0:registerOmnvarHandler("ui_score_streak", var_1_0)
		arg_1_0:registerOmnvarHandler("ui_score_streak_available_1", var_1_0)
	else
		ACTIONS.AnimateSequence(arg_1_0, "Inactive")
	end
end

function WatchKillstreakLights(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 150 * _1080p)

	var_3_0.id = "WatchKillstreakLights"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 150)
	var_3_0:addElement(var_3_4)

	var_3_0.background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "level1"

	var_3_6:SetRGBFromInt(16898, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 100, 0, _1080p * 150)
	var_3_0:addElement(var_3_6)

	var_3_0.level1 = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "level2"

	var_3_8:SetRGBFromInt(493068, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 200, 0, _1080p * 150)
	var_3_0:addElement(var_3_8)

	var_3_0.level2 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "level3"

	var_3_10:SetRGBFromInt(16579946, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 300, 0, _1080p * 150)
	var_3_0:addElement(var_3_10)

	var_3_0.level3 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "level4"

	var_3_12:SetRGBFromInt(16378894, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 400, 0, _1080p * 150)
	var_3_0:addElement(var_3_12)

	var_3_0.level4 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "level5"

	var_3_14:SetRGBFromInt(14298413, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 400, _1080p * 500, 0, _1080p * 150)
	var_3_0:addElement(var_3_14)

	var_3_0.level5 = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_16)

	local var_3_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DefaultSequence", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("DefaultSequence", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("DefaultSequence", var_3_19)

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("DefaultSequence", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("DefaultSequence", var_3_21)

	local function var_3_22()
		var_3_4:AnimateSequence("DefaultSequence")
		var_3_6:AnimateSequence("DefaultSequence")
		var_3_8:AnimateSequence("DefaultSequence")
		var_3_10:AnimateSequence("DefaultSequence")
		var_3_12:AnimateSequence("DefaultSequence")
		var_3_14:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Level1", var_3_24)

	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Level1", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Level1", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Level1", var_3_27)

	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Level1", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Level1", var_3_29)

	local function var_3_30()
		var_3_4:AnimateSequence("Level1")
		var_3_6:AnimateSequence("Level1")
		var_3_8:AnimateSequence("Level1")
		var_3_10:AnimateSequence("Level1")
		var_3_12:AnimateSequence("Level1")
		var_3_14:AnimateSequence("Level1")
	end

	var_3_0._sequences.Level1 = var_3_30

	local var_3_31
	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Level2", var_3_32)

	local var_3_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Level2", var_3_33)

	local var_3_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Level2", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Level2", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Level2", var_3_36)

	local var_3_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Level2", var_3_37)

	local function var_3_38()
		var_3_4:AnimateSequence("Level2")
		var_3_6:AnimateSequence("Level2")
		var_3_8:AnimateSequence("Level2")
		var_3_10:AnimateSequence("Level2")
		var_3_12:AnimateSequence("Level2")
		var_3_14:AnimateSequence("Level2")
	end

	var_3_0._sequences.Level2 = var_3_38

	local var_3_39
	local var_3_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Level3", var_3_40)

	local var_3_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Level3", var_3_41)

	local var_3_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Level3", var_3_42)

	local var_3_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Level3", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Level3", var_3_44)

	local var_3_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Level3", var_3_45)

	local function var_3_46()
		var_3_4:AnimateSequence("Level3")
		var_3_6:AnimateSequence("Level3")
		var_3_8:AnimateSequence("Level3")
		var_3_10:AnimateSequence("Level3")
		var_3_12:AnimateSequence("Level3")
		var_3_14:AnimateSequence("Level3")
	end

	var_3_0._sequences.Level3 = var_3_46

	local var_3_47
	local var_3_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Level4", var_3_48)

	local var_3_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Level4", var_3_49)

	local var_3_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Level4", var_3_50)

	local var_3_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Level4", var_3_51)

	local var_3_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Level4", var_3_52)

	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Level4", var_3_53)

	local function var_3_54()
		var_3_4:AnimateSequence("Level4")
		var_3_6:AnimateSequence("Level4")
		var_3_8:AnimateSequence("Level4")
		var_3_10:AnimateSequence("Level4")
		var_3_12:AnimateSequence("Level4")
		var_3_14:AnimateSequence("Level4")
	end

	var_3_0._sequences.Level4 = var_3_54

	local var_3_55
	local var_3_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Level5", var_3_56)

	local var_3_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Level5", var_3_57)

	local var_3_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Level5", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Level5", var_3_59)

	local var_3_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Level5", var_3_60)

	local var_3_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Level5", var_3_61)

	local function var_3_62()
		var_3_4:AnimateSequence("Level5")
		var_3_6:AnimateSequence("Level5")
		var_3_8:AnimateSequence("Level5")
		var_3_10:AnimateSequence("Level5")
		var_3_12:AnimateSequence("Level5")
		var_3_14:AnimateSequence("Level5")
	end

	var_3_0._sequences.Level5 = var_3_62

	local var_3_63
	local var_3_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Inactive", var_3_64)

	local var_3_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Inactive", var_3_65)

	local var_3_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Inactive", var_3_66)

	local var_3_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Inactive", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Inactive", var_3_68)

	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Inactive", var_3_69)

	local function var_3_70()
		var_3_4:AnimateSequence("Inactive")
		var_3_6:AnimateSequence("Inactive")
		var_3_8:AnimateSequence("Inactive")
		var_3_10:AnimateSequence("Inactive")
		var_3_12:AnimateSequence("Inactive")
		var_3_14:AnimateSequence("Inactive")
	end

	var_3_0._sequences.Inactive = var_3_70

	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("WatchKillstreakLights", WatchKillstreakLights)
LockTable(_M)
