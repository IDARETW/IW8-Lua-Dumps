module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1, "Usage: SeasonalEventMapIndicator:SetData( <eventItemData> )")

	if not arg_1_1 then
		DebugPrint("SeasonalEventMapIndicator requires event item data during setup.")

		return false
	end

	local var_1_0 = arg_1_1.location
	local var_1_1 = arg_1_1.locationString

	if var_1_1 and #var_1_1 > 0 then
		arg_1_0.LocationTitle:setText(Engine.CBBHFCGDIC(var_1_1, arg_1_1.targetProgress))
	else
		DebugPrint("SeasonalEventMapIndicator: Missing location string during setup" .. (var_1_0 and " for location '" .. var_1_0 .. "'." or ""))

		return false
	end

	local var_1_2 = arg_1_1.lootData

	if var_1_2 then
		local var_1_3 = LOOT.GetLootQualityString(tonumber(var_1_2.rarity))
		local var_1_4 = LOOT.GetRarityColor(tonumber(var_1_2.rarity))
		local var_1_5 = LOOT.GetRarityImage(tonumber(var_1_2.rarity))
		local var_1_6 = LOOT.GetItemClassName(var_1_2.type, var_1_2.ref, var_1_2.ID)
		local var_1_7 = var_1_2.name

		if var_1_3 and #var_1_3 > 0 and var_1_6 and #var_1_6 > 0 then
			arg_1_0.RewardInfo:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE", var_1_3, var_1_6))
			arg_1_0.RewardInfo:SetRGBFromTable(var_1_4)
		end

		if var_1_7 and #var_1_7 > 0 then
			arg_1_0.RewardName:setText(var_1_7)
		end
	else
		DebugPrint("SeasonalEventMapIndicator: Missing loot data during setup" .. (var_1_0 and " for location '" .. var_1_0 .. "'." or ""))

		return false
	end

	ACTIONS.AnimateSequence(arg_1_0, arg_1_1.isComplete and "ShowComplete" or "ShowIncomplete")

	return true
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetData = var_0_0
end

function SeasonalEventMapIndicator(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 240 * _1080p, 0, 76 * _1080p)

	var_3_0.id = "SeasonalEventMapIndicator"
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

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 4, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "LocationTitle"

	var_3_6:SetRGBFromTable(SWATCHES.EventPromos.halloweenText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(2000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(2000)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(2000)
	var_3_6:SetCrossfadeTime(250)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 4, _1080p * 28)
	var_3_0:addElement(var_3_6)

	var_3_0.LocationTitle = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "RewardInfo"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(2000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(2000)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(2000)
	var_3_8:SetCrossfadeTime(250)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 30, _1080p * 48)
	var_3_0:addElement(var_3_8)

	var_3_0.RewardInfo = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "RewardName"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(2000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(2000)
	var_3_10:SetAnimMoveSpeed(50)
	var_3_10:SetEndDelay(2000)
	var_3_10:SetCrossfadeTime(250)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 48, _1080p * 72)
	var_3_0:addElement(var_3_10)

	var_3_0.RewardName = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Tab"

	var_3_12:SetRGBFromTable(SWATCHES.EventPromos.halloweenText, 0)
	var_3_12:SetAlpha(0.8, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 4)
	var_3_0:addElement(var_3_12)

	var_3_0.Tab = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local function var_3_14()
		return
	end

	var_3_0._sequences.Complete = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.Incomplete = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -72
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -72
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_4:RegisterAnimationSequence("ShowIncomplete", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 267,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowIncomplete", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 267,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowIncomplete", var_3_19)

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 267,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowIncomplete", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 13,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -240
		},
		{
			value = 0.8,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 27,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -240
		},
		{
			value = 0,
			duration = 93,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_12:RegisterAnimationSequence("ShowIncomplete", var_3_21)

	local function var_3_22()
		var_3_4:AnimateSequence("ShowIncomplete")
		var_3_6:AnimateSequence("ShowIncomplete")
		var_3_8:AnimateSequence("ShowIncomplete")
		var_3_10:AnimateSequence("ShowIncomplete")
		var_3_12:AnimateSequence("ShowIncomplete")
	end

	var_3_0._sequences.ShowIncomplete = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -72
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_4:RegisterAnimationSequence("ShowComplete", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowComplete", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowComplete", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowComplete", var_3_27)

	local var_3_28 = {
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -240
		},
		{
			value = 0.8,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_12:RegisterAnimationSequence("ShowComplete", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("ShowComplete")
		var_3_6:AnimateSequence("ShowComplete")
		var_3_8:AnimateSequence("ShowComplete")
		var_3_10:AnimateSequence("ShowComplete")
		var_3_12:AnimateSequence("ShowComplete")
	end

	var_3_0._sequences.ShowComplete = var_3_29

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SeasonalEventMapIndicator", SeasonalEventMapIndicator)
LockTable(_M)
