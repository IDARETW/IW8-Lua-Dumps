module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.rank = arg_1_2

	local var_1_0 = PROGRESSION.GetRankBigIcon(arg_1_2, 0)
	local var_1_1 = PROGRESSION.GetRankName(arg_1_2)

	arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_0))
	arg_1_0.RankText:setText(var_1_1)
	arg_1_0.RankValue:setText(PROGRESSION.GetRankDisplay(arg_1_2))

	if arg_1_2 > PROGRESSION.GetPlayerRank(arg_1_1) then
		arg_1_0.disabled = true

		ACTIONS.AnimateSequence(arg_1_0, "Disabled")
	end

	arg_1_0.unlockIDs = {}

	for iter_1_0 = 1, #arg_1_3 do
		if arg_1_3[iter_1_0] and #arg_1_3[iter_1_0] > 0 then
			table.insert(arg_1_0.unlockIDs, arg_1_3[iter_1_0])
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitUnlocks = var_0_0

	arg_2_0:addEventHandler("gain_focus", function(arg_3_0, arg_3_1)
		arg_3_0:dispatchEventToRoot({
			name = "display_unlocks_changed",
			unlockIDs = arg_3_0.unlockIDs,
			rank = arg_2_0.rank
		})

		if arg_2_0.disabled then
			ACTIONS.AnimateSequence(arg_2_0, "LockFocused")
		else
			ACTIONS.AnimateSequence(arg_2_0, "UnlockFocused")
		end
	end)
	arg_2_0:addEventHandler("lose_focus", function(arg_4_0, arg_4_1)
		if arg_2_0.disabled then
			ACTIONS.AnimateSequence(arg_2_0, "LockUnFocused")
		else
			ACTIONS.AnimateSequence(arg_2_0, "UnlockUnFocused")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function ProgressionUnlockItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 260 * _1080p)

	var_5_0.id = "ProgressionUnlockItem"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Arrow"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_4:SetAlpha(0, 0)
	var_5_4:SetXRotation(180, 0)
	var_5_4:setImage(RegisterMaterial("arrow_gradient"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -16, _1080p * 16, _1080p * 28, _1080p * -4)
	var_5_0:addElement(var_5_4)

	var_5_0.Arrow = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Backer"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.25, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 10, _1080p * -10)
	var_5_0:addElement(var_5_6)

	var_5_0.Backer = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "LoadoutItemButtonBackground"

	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 10, _1080p * -10)
	var_5_0:addElement(var_5_8)

	var_5_0.LoadoutItemButtonBackground = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "RankIcon"

	var_5_10:SetAlpha(0.6, 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -51, _1080p * 77)
	var_5_0:addElement(var_5_10)

	var_5_0.RankIcon = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "RankValue"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 8, _1080p * -8, _1080p * 80, _1080p * 108)
	var_5_0:addElement(var_5_12)

	var_5_0.RankValue = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "RankText"

	var_5_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 17, _1080p * -17, _1080p * -236, _1080p * -212)
	var_5_0:addElement(var_5_14)

	var_5_0.RankText = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_5_4:RegisterAnimationSequence("UnlockFocused", var_5_16)

	local var_5_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_5_6:RegisterAnimationSequence("UnlockFocused", var_5_17)

	local var_5_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("UnlockFocused", var_5_18)

	local var_5_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("UnlockFocused", var_5_19)

	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_12:RegisterAnimationSequence("UnlockFocused", var_5_20)

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_14:RegisterAnimationSequence("UnlockFocused", var_5_21)

	local function var_5_22()
		var_5_4:AnimateSequence("UnlockFocused")
		var_5_6:AnimateSequence("UnlockFocused")
		var_5_8:AnimateSequence("UnlockFocused")
		var_5_10:AnimateSequence("UnlockFocused")
		var_5_12:AnimateSequence("UnlockFocused")
		var_5_14:AnimateSequence("UnlockFocused")
	end

	var_5_0._sequences.UnlockFocused = var_5_22

	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("UnlockUnFocused", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_5_6:RegisterAnimationSequence("UnlockUnFocused", var_5_24)

	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("UnlockUnFocused", var_5_25)

	local var_5_26 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("UnlockUnFocused", var_5_26)

	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_12:RegisterAnimationSequence("UnlockUnFocused", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_14:RegisterAnimationSequence("UnlockUnFocused", var_5_28)

	local function var_5_29()
		var_5_4:AnimateSequence("UnlockUnFocused")
		var_5_6:AnimateSequence("UnlockUnFocused")
		var_5_8:AnimateSequence("UnlockUnFocused")
		var_5_10:AnimateSequence("UnlockUnFocused")
		var_5_12:AnimateSequence("UnlockUnFocused")
		var_5_14:AnimateSequence("UnlockUnFocused")
	end

	var_5_0._sequences.UnlockUnFocused = var_5_29

	local var_5_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_4:RegisterAnimationSequence("LockFocused", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LockFocused", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LockFocused", var_5_32)

	local var_5_33 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("LockFocused", var_5_33)

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_12:RegisterAnimationSequence("LockFocused", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_14:RegisterAnimationSequence("LockFocused", var_5_35)

	local function var_5_36()
		var_5_4:AnimateSequence("LockFocused")
		var_5_6:AnimateSequence("LockFocused")
		var_5_8:AnimateSequence("LockFocused")
		var_5_10:AnimateSequence("LockFocused")
		var_5_12:AnimateSequence("LockFocused")
		var_5_14:AnimateSequence("LockFocused")
	end

	var_5_0._sequences.LockFocused = var_5_36

	local var_5_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LockUnFocused", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_5_6:RegisterAnimationSequence("LockUnFocused", var_5_38)

	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LockUnFocused", var_5_39)

	local var_5_40 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("LockUnFocused", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_12:RegisterAnimationSequence("LockUnFocused", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_14:RegisterAnimationSequence("LockUnFocused", var_5_42)

	local function var_5_43()
		var_5_4:AnimateSequence("LockUnFocused")
		var_5_6:AnimateSequence("LockUnFocused")
		var_5_8:AnimateSequence("LockUnFocused")
		var_5_10:AnimateSequence("LockUnFocused")
		var_5_12:AnimateSequence("LockUnFocused")
		var_5_14:AnimateSequence("LockUnFocused")
	end

	var_5_0._sequences.LockUnFocused = var_5_43

	local var_5_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabFrame
		}
	}

	var_5_4:RegisterAnimationSequence("Disabled", var_5_44)

	local var_5_45 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_5_6:RegisterAnimationSequence("Disabled", var_5_45)

	local var_5_46 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Disabled", var_5_46)

	local var_5_47 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		}
	}

	var_5_10:RegisterAnimationSequence("Disabled", var_5_47)

	local var_5_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_12:RegisterAnimationSequence("Disabled", var_5_48)

	local var_5_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.grayText
		}
	}

	var_5_14:RegisterAnimationSequence("Disabled", var_5_49)

	local function var_5_50()
		var_5_4:AnimateSequence("Disabled")
		var_5_6:AnimateSequence("Disabled")
		var_5_8:AnimateSequence("Disabled")
		var_5_10:AnimateSequence("Disabled")
		var_5_12:AnimateSequence("Disabled")
		var_5_14:AnimateSequence("Disabled")
	end

	var_5_0._sequences.Disabled = var_5_50

	local var_5_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 112
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_51)

	local var_5_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -200
		}
	}

	var_5_14:RegisterAnimationSequence("AR", var_5_52)

	local function var_5_53()
		var_5_12:AnimateSequence("AR")
		var_5_14:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_53

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ProgressionUnlockItem", ProgressionUnlockItem)
LockTable(_M)
