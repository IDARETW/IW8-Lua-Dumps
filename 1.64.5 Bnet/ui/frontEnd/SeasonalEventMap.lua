module(..., package.seeall)

local var_0_0 = "Area"

local function var_0_1(arg_1_0, arg_1_1)
	assert(arg_1_0._isInitialized, "SeasonalEventMap:SetLocationData called while uninitialized.")

	if not arg_1_0._isInitialized then
		DebugPrint("SeasonalEventMap must be initialized by calling Setup().")

		return
	end

	assert(arg_1_1, "Usage: SeasonalEventMap:SetLocationData( <location> );")

	if not arg_1_1 or #arg_1_1 == 0 then
		DebugPrint("SeasonalEventMap not given a location to set.")

		return
	end

	if arg_1_0._currentLocation ~= arg_1_1 then
		if arg_1_0._locationMap[arg_1_1] then
			local var_1_0 = arg_1_0._locationMap[arg_1_1].anim
			local var_1_1 = arg_1_0._locationMap[arg_1_1].eventItemData

			if arg_1_0._sequences[var_1_0] then
				if arg_1_0.MapIndicator:SetData(var_1_1) then
					if arg_1_0._currentLocation then
						arg_1_0._locationMap[arg_1_0._currentLocation].checkbox:SetScale(-0.4, 150, LUI.EASING.outQuadratic)
						arg_1_0._locationMap[arg_1_0._currentLocation].checkbox:SetAlpha(0.75, 150, LUI.EASING.outQuadratic)
					end

					arg_1_0._currentLocation = arg_1_1

					ACTIONS.AnimateSequence(arg_1_0, "ShowIndicator")
					ACTIONS.AnimateSequence(arg_1_0, var_1_0)
					arg_1_0._locationMap[arg_1_0._currentLocation].checkbox:SetScale(0, 150, LUI.EASING.outQuadratic)
					arg_1_0._locationMap[arg_1_0._currentLocation].checkbox:SetAlpha(1, 150, LUI.EASING.outQuadratic)
				end
			else
				DebugPrint("SeasonalEventMap does not have animation sequence defined for '" .. var_1_0 .. "'")
				ACTIONS.AnimateSequence(arg_1_0, "HideIndicator")
			end
		else
			DebugPrint("SeasonalEventMap given an unknown location '" .. arg_1_1 .. "'")
			ACTIONS.AnimateSequence(arg_1_0, "HideIndicator")
		end
	end
end

local function var_0_2(arg_2_0)
	arg_2_0._currentLocation = nil

	ACTIONS.AnimateSequence(arg_2_0, "HideIndicator")
end

local function var_0_3(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = StringTable.BFHCAIIDA(CSV.seasonalEvent.file)

	for iter_3_0 = 0, var_3_1 - 1 do
		local var_3_2 = CSV.ReadRowWithFile(CSV.seasonalEvent, CSV.seasonalEvent.file, iter_3_0)

		if var_3_2 and var_3_2.isFinalReward ~= "1" and var_3_2.location and var_3_2.location ~= "" then
			local var_3_3 = split(var_3_2.location, "_")[2]

			if var_3_3 then
				local var_3_4 = arg_3_0["Checkbox" .. var_3_3]

				if not var_3_4 then
					DebugPrint("SeasonalEventMap: Checkbox missing for location '" .. var_3_2.location .. "'.")
				end

				var_3_0[var_3_2.location] = {
					ID = var_3_3,
					anim = var_0_0 .. var_3_3,
					checkbox = var_3_4
				}
			else
				DebugPrint("SeasonalEventMap: Could not extract location ID from location '" .. var_3_2.location .. "'.")
			end
		end
	end

	return var_3_0
end

local function var_0_4(arg_4_0, arg_4_1)
	assert(arg_4_1, "Usage: SeasonalEventMap:Setup( <eventGridData> )")

	if not arg_4_1 then
		DebugPrint("SeasonalEventMap: All event data is required to setup widget.")

		return
	end

	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		local var_4_0 = iter_4_1.location

		if var_4_0 and #var_4_0 > 0 then
			local var_4_1 = arg_4_0._locationMap[var_4_0]

			if var_4_1 then
				var_4_1.eventItemData = iter_4_1

				if var_4_1.checkbox then
					ACTIONS.AnimateSequence(var_4_1.checkbox, iter_4_1.isComplete and "CheckInstant" or "UnCheckInstant")
				end
			else
				DebugPrint("SeasonalEventMap: location '" .. var_4_0 .. "' missing from locationMap.")
			end
		else
			DebugPrint("SeasonalEventMap: Missing location for event item #" .. iter_4_0 .. ", skipping setup.")
		end
	end

	arg_4_0:ClearLocation()

	arg_4_0._isInitialized = true
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._currentLocation = nil
	arg_5_0._isInitialized = false
	arg_5_0._locationMap = var_0_3(arg_5_0)
	arg_5_0.Setup = var_0_4
	arg_5_0.SetLocation = var_0_1
	arg_5_0.ClearLocation = var_0_2
end

function SeasonalEventMap(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 560 * _1080p)

	var_6_0.id = "SeasonalEventMap"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "MapImage"

	var_6_4:setImage(RegisterMaterial("ui_seasonal_event_halloween_map"), 0)
	var_6_0:addElement(var_6_4)

	var_6_0.MapImage = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Checkbox01"

	var_6_6:SetAlpha(0.75, 0)
	var_6_6:SetScale(-0.4, 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -61, _1080p * -39, _1080p * -162, _1080p * -140)
	var_6_0:addElement(var_6_6)

	var_6_0.Checkbox01 = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Checkbox02"

	var_6_8:SetAlpha(0.75, 0)
	var_6_8:SetScale(-0.4, 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -259, _1080p * -237, _1080p * 54, _1080p * 76)
	var_6_0:addElement(var_6_8)

	var_6_0.Checkbox02 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Checkbox03"

	var_6_10:SetAlpha(0.75, 0)
	var_6_10:SetScale(-0.4, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * -196, _1080p * -173, _1080p * -151)
	var_6_0:addElement(var_6_10)

	var_6_0.Checkbox03 = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Checkbox04"

	var_6_12:SetAlpha(0.75, 0)
	var_6_12:SetScale(-0.4, 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 72, _1080p * 94, _1080p * 57, _1080p * 79)
	var_6_0:addElement(var_6_12)

	var_6_0.Checkbox04 = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Checkbox05"

	var_6_14:SetAlpha(0.75, 0)
	var_6_14:SetScale(-0.4, 0)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -378, _1080p * -356, _1080p * 46, _1080p * 68)
	var_6_0:addElement(var_6_14)

	var_6_0.Checkbox05 = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "Checkbox06"

	var_6_16:SetAlpha(0.75, 0)
	var_6_16:SetScale(-0.4, 0)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * -20, _1080p * 46, _1080p * 68)
	var_6_0:addElement(var_6_16)

	var_6_0.Checkbox06 = var_6_16

	local var_6_17
	local var_6_18 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_18.id = "Checkbox07"

	var_6_18:SetAlpha(0.75, 0)
	var_6_18:SetScale(-0.4, 0)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * -128, _1080p * -79, _1080p * -57)
	var_6_0:addElement(var_6_18)

	var_6_0.Checkbox07 = var_6_18

	local var_6_19
	local var_6_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_20.id = "Checkbox08"

	var_6_20:SetAlpha(0.75, 0)
	var_6_20:SetScale(-0.4, 0)
	var_6_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 102, _1080p * -154, _1080p * -132)
	var_6_0:addElement(var_6_20)

	var_6_0.Checkbox08 = var_6_20

	local var_6_21
	local var_6_22 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_22.id = "Checkbox09"

	var_6_22:SetAlpha(0.75, 0)
	var_6_22:SetScale(-0.4, 0)
	var_6_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 142, _1080p * 164, _1080p * 156, _1080p * 178)
	var_6_0:addElement(var_6_22)

	var_6_0.Checkbox09 = var_6_22

	local var_6_23
	local var_6_24 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_24.id = "Checkbox10"

	var_6_24:SetAlpha(0.75, 0)
	var_6_24:SetScale(-0.4, 0)
	var_6_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 101, _1080p * 123, _1080p * -22, 0)
	var_6_0:addElement(var_6_24)

	var_6_0.Checkbox10 = var_6_24

	local var_6_25
	local var_6_26 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_26.id = "Checkbox11"

	var_6_26:SetAlpha(0.75, 0)
	var_6_26:SetScale(-0.4, 0)
	var_6_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 365, _1080p * 387, _1080p * 189, _1080p * 211)
	var_6_0:addElement(var_6_26)

	var_6_0.Checkbox11 = var_6_26

	local var_6_27
	local var_6_28 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_28.id = "Checkbox12"

	var_6_28:SetAlpha(0.75, 0)
	var_6_28:SetScale(-0.4, 0)
	var_6_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 274, _1080p * 296, _1080p * 65, _1080p * 87)
	var_6_0:addElement(var_6_28)

	var_6_0.Checkbox12 = var_6_28

	local var_6_29
	local var_6_30 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_30.id = "Checkbox13"

	var_6_30:SetAlpha(0.75, 0)
	var_6_30:SetScale(-0.4, 0)
	var_6_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 22, _1080p * -76, _1080p * -54)
	var_6_0:addElement(var_6_30)

	var_6_0.Checkbox13 = var_6_30

	local var_6_31
	local var_6_32 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_32.id = "Checkbox14"

	var_6_32:SetAlpha(0.75, 0)
	var_6_32:SetScale(-0.4, 0)
	var_6_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -218, _1080p * -35, _1080p * -13)
	var_6_0:addElement(var_6_32)

	var_6_0.Checkbox14 = var_6_32

	local var_6_33
	local var_6_34 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_34.id = "Checkbox15"

	var_6_34:SetAlpha(0.75, 0)
	var_6_34:SetScale(-0.4, 0)
	var_6_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -190, _1080p * -168, _1080p * 161, _1080p * 183)
	var_6_0:addElement(var_6_34)

	var_6_0.Checkbox15 = var_6_34

	local var_6_35
	local var_6_36 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_36.id = "Checkbox16"

	var_6_36:SetAlpha(0.75, 0)
	var_6_36:SetScale(-0.4, 0)
	var_6_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -108, _1080p * -86, _1080p * 15, _1080p * 37)
	var_6_0:addElement(var_6_36)

	var_6_0.Checkbox16 = var_6_36

	local var_6_37
	local var_6_38 = MenuBuilder.BuildRegisteredType("SeasonalEventMapIndicator", {
		controllerIndex = var_6_1
	})

	var_6_38.id = "MapIndicator"

	var_6_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -280, _1080p * -19, _1080p * -5, _1080p * 84)
	var_6_0:addElement(var_6_38)

	var_6_0.MapIndicator = var_6_38

	local function var_6_39()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_38:RegisterAnimationSequence("HideIndicator", var_6_41)

	local function var_6_42()
		var_6_38:AnimateSequence("HideIndicator")
	end

	var_6_0._sequences.HideIndicator = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_38:RegisterAnimationSequence("ShowIndicator", var_6_44)

	local function var_6_45()
		var_6_38:AnimateSequence("ShowIndicator")
	end

	var_6_0._sequences.ShowIndicator = var_6_45

	local var_6_46
	local var_6_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -162
		}
	}

	var_6_38:RegisterAnimationSequence("Area01", var_6_47)

	local function var_6_48()
		var_6_38:AnimateSequence("Area01")
	end

	var_6_0._sequences.Area01 = var_6_48

	local var_6_49
	local var_6_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -236
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 130
		}
	}

	var_6_38:RegisterAnimationSequence("Area02", var_6_50)

	local function var_6_51()
		var_6_38:AnimateSequence("Area02")
	end

	var_6_0._sequences.Area02 = var_6_51

	local var_6_52
	local var_6_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -97
		}
	}

	var_6_38:RegisterAnimationSequence("Area03", var_6_53)

	local function var_6_54()
		var_6_38:AnimateSequence("Area03")
	end

	var_6_0._sequences.Area03 = var_6_54

	local var_6_55
	local var_6_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 133
		}
	}

	var_6_38:RegisterAnimationSequence("Area04", var_6_56)

	local function var_6_57()
		var_6_38:AnimateSequence("Area04")
	end

	var_6_0._sequences.Area04 = var_6_57

	local var_6_58
	local var_6_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -355
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		}
	}

	var_6_38:RegisterAnimationSequence("Area05", var_6_59)

	local function var_6_60()
		var_6_38:AnimateSequence("Area05")
	end

	var_6_0._sequences.Area05 = var_6_60

	local var_6_61
	local var_6_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 221
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		}
	}

	var_6_38:RegisterAnimationSequence("Area06", var_6_62)

	local function var_6_63()
		var_6_38:AnimateSequence("Area06")
	end

	var_6_0._sequences.Area06 = var_6_63

	local var_6_64
	local var_6_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		}
	}

	var_6_38:RegisterAnimationSequence("Area07", var_6_65)

	local function var_6_66()
		var_6_38:AnimateSequence("Area07")
	end

	var_6_0._sequences.Area07 = var_6_66

	local var_6_67
	local var_6_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 343
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -78
		}
	}

	var_6_38:RegisterAnimationSequence("Area08", var_6_68)

	local function var_6_69()
		var_6_38:AnimateSequence("Area08")
	end

	var_6_0._sequences.Area08 = var_6_69

	local var_6_70
	local var_6_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 178
		}
	}

	var_6_38:RegisterAnimationSequence("Area09", var_6_71)

	local function var_6_72()
		var_6_38:AnimateSequence("Area09")
	end

	var_6_0._sequences.Area09 = var_6_72

	local var_6_73
	local var_6_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_6_38:RegisterAnimationSequence("Area10", var_6_74)

	local function var_6_75()
		var_6_38:AnimateSequence("Area10")
	end

	var_6_0._sequences.Area10 = var_6_75

	local var_6_76
	local var_6_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 135
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 365
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 211
		}
	}

	var_6_38:RegisterAnimationSequence("Area11", var_6_77)

	local function var_6_78()
		var_6_38:AnimateSequence("Area11")
	end

	var_6_0._sequences.Area11 = var_6_78

	local var_6_79
	local var_6_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 273
		}
	}

	var_6_38:RegisterAnimationSequence("Area12", var_6_80)

	local function var_6_81()
		var_6_38:AnimateSequence("Area12")
	end

	var_6_0._sequences.Area12 = var_6_81

	local var_6_82
	local var_6_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 263
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_6_38:RegisterAnimationSequence("Area13", var_6_83)

	local function var_6_84()
		var_6_38:AnimateSequence("Area13")
	end

	var_6_0._sequences.Area13 = var_6_84

	local var_6_85
	local var_6_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -217
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		}
	}

	var_6_38:RegisterAnimationSequence("Area14", var_6_86)

	local function var_6_87()
		var_6_38:AnimateSequence("Area14")
	end

	var_6_0._sequences.Area14 = var_6_87

	local var_6_88
	local var_6_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 183
		}
	}

	var_6_38:RegisterAnimationSequence("Area15", var_6_89)

	local function var_6_90()
		var_6_38:AnimateSequence("Area15")
	end

	var_6_0._sequences.Area15 = var_6_90

	local var_6_91
	local var_6_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		}
	}

	var_6_38:RegisterAnimationSequence("Area16", var_6_92)

	local function var_6_93()
		var_6_38:AnimateSequence("Area16")
	end

	var_6_0._sequences.Area16 = var_6_93

	var_0_5(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SeasonalEventMap", SeasonalEventMap)
LockTable(_M)
