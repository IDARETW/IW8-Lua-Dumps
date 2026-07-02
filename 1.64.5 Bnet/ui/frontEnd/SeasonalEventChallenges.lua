module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ChallengeIndicator:SetData(arg_1_1)
end

local function var_0_1(arg_2_0)
	return
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._currentLocation = nil
	arg_3_0._isInitialized = false

	ACTIONS.AnimateSequence(arg_3_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())

	arg_3_0.SetActiveChallenge = var_0_0
	arg_3_0.ClearActiveChallenge = var_0_1

	if not CONDITIONS.SeasonalEventIsAdler() then
		SEASONAL_EVENT.RegisterElementToModAnimEvent(arg_3_0)
	end
end

function SeasonalEventChallenges(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 560 * _1080p)

	var_4_0.id = "SeasonalEventChallenges"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		var_4_3 = LUI.UIImage.new()
		var_4_3.id = "Image"

		var_4_3:SetRGBFromInt(14561479, 0)
		var_4_3:SetAlpha(0, 0)
		var_4_3:setImage(RegisterMaterial("ui_seasonal_event_halloween_map"), 0)
		var_4_0:addElement(var_4_3)

		var_4_0.Image = var_4_3
	end

	local var_4_4
	local var_4_5 = MenuBuilder.BuildRegisteredType("SeasonalEventChallengesIndicator", {
		controllerIndex = var_4_1
	})

	var_4_5.id = "ChallengeIndicator"

	var_4_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -497, _1080p * -236, _1080p * -89, _1080p * 32)
	var_4_0:addElement(var_4_5)

	var_4_0.ChallengeIndicator = var_4_5

	local function var_4_6()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.HideIndicator = var_4_7

	local function var_4_8()
		return
	end

	var_4_0._sequences.ShowIndicator = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.Area01 = var_4_9

	local function var_4_10()
		return
	end

	var_4_0._sequences.Area02 = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.Area03 = var_4_11

	local function var_4_12()
		return
	end

	var_4_0._sequences.Area04 = var_4_12

	local function var_4_13()
		return
	end

	var_4_0._sequences.Area05 = var_4_13

	local function var_4_14()
		return
	end

	var_4_0._sequences.Area06 = var_4_14

	local function var_4_15()
		return
	end

	var_4_0._sequences.Area07 = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.Area08 = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.Area09 = var_4_17

	local function var_4_18()
		return
	end

	var_4_0._sequences.Area10 = var_4_18

	local function var_4_19()
		return
	end

	var_4_0._sequences.Area11 = var_4_19

	local function var_4_20()
		return
	end

	var_4_0._sequences.Area12 = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.Area13 = var_4_21

	local function var_4_22()
		return
	end

	var_4_0._sequences.Area14 = var_4_22

	local function var_4_23()
		return
	end

	var_4_0._sequences.Area15 = var_4_23

	local function var_4_24()
		return
	end

	var_4_0._sequences.Area16 = var_4_24

	local var_4_25

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_26 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_atlantis_map")
			}
		}

		var_4_3:RegisterAnimationSequence("AtlantisEvent", var_4_26)
	end

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -146
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -523
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -262
		}
	}

	var_4_5:RegisterAnimationSequence("AtlantisEvent", var_4_27)

	local function var_4_28()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("AtlantisEvent")
		end

		var_4_5:AnimateSequence("AtlantisEvent")
	end

	var_4_0._sequences.AtlantisEvent = var_4_28

	local var_4_29

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_30 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_atlantis_map")
			}
		}

		var_4_3:RegisterAnimationSequence("SetupZombiesEvent", var_4_30)
	end

	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -158
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -573
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -312
		}
	}

	var_4_5:RegisterAnimationSequence("SetupZombiesEvent", var_4_31)

	local function var_4_32()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("SetupZombiesEvent")
		end

		var_4_5:AnimateSequence("SetupZombiesEvent")
	end

	var_4_0._sequences.SetupZombiesEvent = var_4_32

	local var_4_33

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_34 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_outbreak_map_wz")
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_4_3:RegisterAnimationSequence("ModWZ", var_4_34)
	end

	local function var_4_35()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("ModWZ")
		end
	end

	var_4_0._sequences.ModWZ = var_4_35

	local var_4_36

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_37 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_outbreak_map_cw")
			}
		}

		var_4_3:RegisterAnimationSequence("ModCW", var_4_37)
	end

	local function var_4_38()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("ModCW")
		end
	end

	var_4_0._sequences.ModCW = var_4_38

	local var_4_39
	local var_4_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 230
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_5:RegisterAnimationSequence("SetupAdlerEvent", var_4_40)

	local function var_4_41()
		var_4_5:AnimateSequence("SetupAdlerEvent")
	end

	var_4_0._sequences.SetupAdlerEvent = var_4_41

	local var_4_42
	local var_4_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -406
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 558
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -205
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_5:RegisterAnimationSequence("SetupSeasonalEvent", var_4_43)

	local function var_4_44()
		var_4_5:AnimateSequence("SetupSeasonalEvent")
	end

	var_4_0._sequences.SetupSeasonalEvent = var_4_44

	local var_4_45
	local var_4_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -201
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_5:RegisterAnimationSequence("SetupLEPEvent", var_4_46)

	local function var_4_47()
		var_4_5:AnimateSequence("SetupLEPEvent")
	end

	var_4_0._sequences.SetupLEPEvent = var_4_47

	local var_4_48

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_49 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("SetupNumbersEvent", var_4_49)
	end

	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 551
		}
	}

	var_4_5:RegisterAnimationSequence("SetupNumbersEvent", var_4_50)

	local function var_4_51()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("SetupNumbersEvent")
		end

		var_4_5:AnimateSequence("SetupNumbersEvent")
	end

	var_4_0._sequences.SetupNumbersEvent = var_4_51

	local var_4_52

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("SetupHauntEvent", var_4_53)
	end

	local var_4_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 551
		}
	}

	var_4_5:RegisterAnimationSequence("SetupHauntEvent", var_4_54)

	local function var_4_55()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("SetupHauntEvent")
		end

		var_4_5:AnimateSequence("SetupHauntEvent")
	end

	var_4_0._sequences.SetupHauntEvent = var_4_55

	local var_4_56

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
		local var_4_57 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_outbreak_map_cw")
			}
		}

		var_4_3:RegisterAnimationSequence("ModVA", var_4_57)
	end

	local function var_4_58()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Image") then
			var_4_3:AnimateSequence("ModVA")
		end
	end

	var_4_0._sequences.ModVA = var_4_58

	local var_4_59
	local var_4_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 554
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -365
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_4_5:RegisterAnimationSequence("SetupFestiveFervorEvent", var_4_60)

	local function var_4_61()
		var_4_5:AnimateSequence("SetupFestiveFervorEvent")
	end

	var_4_0._sequences.SetupFestiveFervorEvent = var_4_61

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonalEventChallenges", SeasonalEventChallenges)
LockTable(_M)
