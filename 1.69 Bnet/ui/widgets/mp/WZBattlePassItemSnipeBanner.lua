module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_1.backerRightPadding = 24 * _1080p

	LOOT.SetWZSnipeBannerGameSource(arg_1_0, arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetGameSource = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "Hide")
end

function WZBattlePassItemSnipeBanner(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "WZBattlePassItemSnipeBanner"
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

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WZExclusiveSnipeIcon", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "WZExclusiveSnipeIcon"

	var_3_6:SetScale(-0.3, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -23, _1080p * 159, _1080p * -1, _1080p * 31)
	var_3_0:addElement(var_3_6)

	var_3_0.WZExclusiveSnipeIcon = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRedDark
		}
	}

	var_3_4:RegisterAnimationSequence("CW", var_3_9)

	local function var_3_10()
		var_3_4:AnimateSequence("CW")
	end

	var_3_0._sequences.CW = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelBacker
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("WZ", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("WZ")
	end

	var_3_0._sequences.WZ = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_17

	local var_3_18
	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.FriendlyDarkBlue
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("MW", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("MW")
	end

	var_3_0._sequences.MW = var_3_20

	local var_3_21
	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("HideBackground", var_3_22)

	local function var_3_23()
		var_3_4:AnimateSequence("HideBackground")
	end

	var_3_0._sequences.HideBackground = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelBacker
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("VG", var_3_25)

	local function var_3_26()
		var_3_4:AnimateSequence("VG")
	end

	var_3_0._sequences.VG = var_3_26

	local var_3_27
	local var_3_28 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRedDark
		}
	}

	var_3_4:RegisterAnimationSequence("CWandMW", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("CWandMW")
	end

	var_3_0._sequences.CWandMW = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRedDark
		}
	}

	var_3_4:RegisterAnimationSequence("CWandVG", var_3_31)

	local function var_3_32()
		var_3_4:AnimateSequence("CWandVG")
	end

	var_3_0._sequences.CWandVG = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.FriendlyDarkBlue
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("MWandVG", var_3_34)

	local function var_3_35()
		var_3_4:AnimateSequence("MWandVG")
	end

	var_3_0._sequences.MWandVG = var_3_35

	local var_3_36
	local var_3_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowSnipeIcon", var_3_37)

	local function var_3_38()
		var_3_6:AnimateSequence("ShowSnipeIcon")
	end

	var_3_0._sequences.ShowSnipeIcon = var_3_38

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZBattlePassItemSnipeBanner", WZBattlePassItemSnipeBanner)
LockTable(_M)
