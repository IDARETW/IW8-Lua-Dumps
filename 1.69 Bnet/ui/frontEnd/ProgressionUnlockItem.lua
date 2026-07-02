module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.rank = arg_1_2

	local var_1_0 = PROGRESSION.GetPlayerProgressionData({
		_combinedRankNum = arg_1_2,
		_rankTypeOverride = PROGRESSION.RANK_TYPES.MILITARY
	})

	arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_0._rankIcon))
	arg_1_0.RankText:setText(var_1_0._rankName)
	arg_1_0.RankValue:setText(var_1_0._rankDisplay)

	if arg_1_2 > PROGRESSION.GetPlayerRank(arg_1_1) then
		arg_1_0.disabled = true

		ACTIONS.AnimateSequence(arg_1_0, "Disabled")
	end

	arg_1_0.unlockIDs = {}

	for iter_1_0 = 1, #arg_1_3 do
		if arg_1_3[iter_1_0] and #arg_1_3[iter_1_0] > 0 then
			local var_1_1 = LOOT.GetGameSourceExclusivityByItemID(arg_1_3[iter_1_0])
			local var_1_2 = Engine.FABABBDBA() and var_1_1 == LOOT.itemSourceExclusivity.CW_ZOMBIES_EXCLUSIVE
			local var_1_3 = LOOT.GetGameSourceIDFromItemID(arg_1_3[iter_1_0])
			local var_1_4 = true

			if arg_1_4 ~= nil then
				local var_1_5 = arg_1_4:get()

				if var_1_5 ~= LOOT.filterOptions.ALL then
					var_1_4 = LOOT.filterGameSourceID[var_1_5] == var_1_3
				end
			end

			if var_1_2 == false and var_1_4 then
				table.insert(arg_1_0.unlockIDs, arg_1_3[iter_1_0])
			end
		end
	end

	arg_1_0.UnlockCount:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_COUNT", #arg_1_0.unlockIDs)))

	if arg_1_0:getParent() then
		arg_1_0:dispatchEventToRoot({
			name = "display_unlocks_changed",
			_shouldUpdateSelection = false,
			dispatchChildren = true,
			_unlockIDs = arg_1_0.unlockIDs,
			_rank = arg_1_0.rank
		})
	end
end

local function var_0_1(arg_2_0)
	local var_2_0 = arg_2_0.disabled and "LockUnFocused" or "UnlockUnFocused"

	ACTIONS.AnimateSequence(arg_2_0, var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.InitUnlocks = var_0_0

	arg_3_0:addEventHandler("update_display", function(arg_4_0, arg_4_1)
		if arg_4_1.index then
			arg_3_0:dispatchEventToRoot({
				name = "display_unlocks_changed",
				_shouldUpdateSelection = true,
				_unlockIDs = arg_3_0.unlockIDs,
				_rank = arg_4_1.index
			})
			arg_3_0.UnlockCount:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_COUNT", #arg_3_0.unlockIDs)))
		end
	end)
	arg_3_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
		arg_5_0:dispatchEventToRoot({
			name = "display_unlocks_changed",
			_shouldUpdateSelection = true,
			_unlockIDs = arg_5_0.unlockIDs,
			_rank = arg_5_0.rank
		})
		arg_5_0.UnlockCount:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_COUNT", #arg_3_0.unlockIDs)))

		local var_5_0 = arg_5_0.disabled and "LockFocused" or "UnlockFocused"

		ACTIONS.AnimateSequence(arg_3_0, var_5_0)
	end)
	arg_3_0:addEventHandler("lose_focus", function(arg_6_0, arg_6_1)
		var_0_1(arg_6_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	var_0_1(arg_3_0)
end

function ProgressionUnlockItem(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 226 * _1080p, 0, 226 * _1080p)

	var_7_0.id = "ProgressionUnlockItem"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Backer"

	var_7_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_7_4:SetAlpha(0.4, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Backer = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "RankIcon"

	var_7_6:SetAlpha(0.6, 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -65, _1080p * 65, _1080p * -70, _1080p * 60)
	var_7_0:addElement(var_7_6)

	var_7_0.RankIcon = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "RankValue"

	var_7_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_7_8:setText("", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 8, _1080p * -8, _1080p * 66, _1080p * 102)
	var_7_0:addElement(var_7_8)

	var_7_0.RankValue = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIText.new()

	var_7_10.id = "RankText"

	var_7_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_7_10:setText("", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 8, _1080p * -8, _1080p * -209, _1080p * -189)
	var_7_0:addElement(var_7_10)

	var_7_0.RankText = var_7_10

	local var_7_11
	local var_7_12 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_7_13 = LUI.UIBorder.new(var_7_12)

	var_7_13.id = "Border"

	var_7_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_7_13:SetBorderThicknessLeft(_1080p * 2, 0)
	var_7_13:SetBorderThicknessRight(_1080p * 2, 0)
	var_7_13:SetBorderThicknessTop(_1080p * 2, 0)
	var_7_13:SetBorderThicknessBottom(_1080p * 2, 0)
	var_7_0:addElement(var_7_13)

	var_7_0.Border = var_7_13

	local var_7_14
	local var_7_15 = LUI.UIStyledText.new()

	var_7_15.id = "UnlockCount"

	var_7_15:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_7_15:SetAlpha(0, 0)
	var_7_15:setText(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_COUNT"), 0)
	var_7_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_15:SetWordWrap(false)
	var_7_15:SetAlignment(LUI.Alignment.Center)
	var_7_15:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_15:SetStartupDelay(2000)
	var_7_15:SetLineHoldTime(400)
	var_7_15:SetAnimMoveTime(150)
	var_7_15:SetAnimMoveSpeed(50)
	var_7_15:SetEndDelay(1500)
	var_7_15:SetCrossfadeTime(400)
	var_7_15:SetFadeInTime(300)
	var_7_15:SetFadeOutTime(300)
	var_7_15:SetMaxVisibleLines(1)
	var_7_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 218, _1080p * 223, _1080p * 241)
	var_7_0:addElement(var_7_15)

	var_7_0.UnlockCount = var_7_15

	local var_7_16
	local var_7_17 = LUI.UIImage.new()

	var_7_17.id = "BottomHighlight"

	var_7_17:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_7_17:SetAlpha(0, 0)
	var_7_17:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_7_17:Setup3SliceHorizontalImage(_1080p * 15, 0.1)
	var_7_17:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 28, _1080p * 30)
	var_7_0:addElement(var_7_17)

	var_7_0.BottomHighlight = var_7_17

	local var_7_18
	local var_7_19 = LUI.UIImage.new()

	var_7_19.id = "TopHighlight"

	var_7_19:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_7_19:SetAlpha(0, 0)
	var_7_19:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_7_19:Setup3SliceHorizontalImage(_1080p * 15, 0.1)
	var_7_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_7_0:addElement(var_7_19)

	var_7_0.TopHighlight = var_7_19

	local function var_7_20()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_20

	local function var_7_21()
		return
	end

	var_7_0._sequences.AR = var_7_21

	local var_7_22
	local var_7_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
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
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("UnlockUnFocused", var_7_23)

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("UnlockUnFocused", var_7_24)

	local var_7_25 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_8:RegisterAnimationSequence("UnlockUnFocused", var_7_25)

	local var_7_26 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("UnlockUnFocused", var_7_26)

	local var_7_27 = {
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
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("UnlockUnFocused", var_7_27)

	local var_7_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("UnlockUnFocused", var_7_28)

	local var_7_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("UnlockUnFocused", var_7_29)

	local var_7_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("UnlockUnFocused", var_7_30)

	local function var_7_31()
		var_7_4:AnimateSequence("UnlockUnFocused")
		var_7_6:AnimateSequence("UnlockUnFocused")
		var_7_8:AnimateSequence("UnlockUnFocused")
		var_7_10:AnimateSequence("UnlockUnFocused")
		var_7_13:AnimateSequence("UnlockUnFocused")
		var_7_15:AnimateSequence("UnlockUnFocused")
		var_7_17:AnimateSequence("UnlockUnFocused")
		var_7_19:AnimateSequence("UnlockUnFocused")
	end

	var_7_0._sequences.UnlockUnFocused = var_7_31

	local var_7_32
	local var_7_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
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
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_4:RegisterAnimationSequence("LockFocused", var_7_33)

	local var_7_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LockFocused", var_7_34)

	local var_7_35 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("LockFocused", var_7_35)

	local var_7_36 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("LockFocused", var_7_36)

	local var_7_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("LockFocused", var_7_37)

	local var_7_38 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("LockFocused", var_7_38)

	local var_7_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("LockFocused", var_7_39)

	local var_7_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("LockFocused", var_7_40)

	local function var_7_41()
		var_7_4:AnimateSequence("LockFocused")
		var_7_6:AnimateSequence("LockFocused")
		var_7_8:AnimateSequence("LockFocused")
		var_7_10:AnimateSequence("LockFocused")
		var_7_13:AnimateSequence("LockFocused")
		var_7_15:AnimateSequence("LockFocused")
		var_7_17:AnimateSequence("LockFocused")
		var_7_19:AnimateSequence("LockFocused")
	end

	var_7_0._sequences.LockFocused = var_7_41

	local var_7_42
	local var_7_43 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
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
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_4:RegisterAnimationSequence("LockUnFocused", var_7_43)

	local var_7_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LockUnFocused", var_7_44)

	local var_7_45 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_8:RegisterAnimationSequence("LockUnFocused", var_7_45)

	local var_7_46 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("LockUnFocused", var_7_46)

	local var_7_47 = {
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
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("LockUnFocused", var_7_47)

	local var_7_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("LockUnFocused", var_7_48)

	local var_7_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("LockUnFocused", var_7_49)

	local var_7_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("LockUnFocused", var_7_50)

	local function var_7_51()
		var_7_4:AnimateSequence("LockUnFocused")
		var_7_6:AnimateSequence("LockUnFocused")
		var_7_8:AnimateSequence("LockUnFocused")
		var_7_10:AnimateSequence("LockUnFocused")
		var_7_13:AnimateSequence("LockUnFocused")
		var_7_15:AnimateSequence("LockUnFocused")
		var_7_17:AnimateSequence("LockUnFocused")
		var_7_19:AnimateSequence("LockUnFocused")
	end

	var_7_0._sequences.LockUnFocused = var_7_51

	local var_7_52
	local var_7_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("UnlockFocused", var_7_53)

	local var_7_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("UnlockFocused", var_7_54)

	local var_7_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_8:RegisterAnimationSequence("UnlockFocused", var_7_55)

	local var_7_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("UnlockFocused", var_7_56)

	local var_7_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("UnlockFocused", var_7_57)

	local var_7_58 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("UnlockFocused", var_7_58)

	local var_7_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("UnlockFocused", var_7_59)

	local var_7_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("UnlockFocused", var_7_60)

	local function var_7_61()
		var_7_4:AnimateSequence("UnlockFocused")
		var_7_6:AnimateSequence("UnlockFocused")
		var_7_8:AnimateSequence("UnlockFocused")
		var_7_10:AnimateSequence("UnlockFocused")
		var_7_13:AnimateSequence("UnlockFocused")
		var_7_15:AnimateSequence("UnlockFocused")
		var_7_17:AnimateSequence("UnlockFocused")
		var_7_19:AnimateSequence("UnlockFocused")
	end

	var_7_0._sequences.UnlockFocused = var_7_61

	local var_7_62
	local var_7_63 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
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
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_7_4:RegisterAnimationSequence("Disabled", var_7_63)

	local var_7_64 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Disabled", var_7_64)

	local var_7_65 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("Disabled", var_7_65)

	local var_7_66 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Disabled", var_7_66)

	local var_7_67 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_13:RegisterAnimationSequence("Disabled", var_7_67)

	local var_7_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("Disabled", var_7_68)

	local var_7_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("Disabled", var_7_69)

	local var_7_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("Disabled", var_7_70)

	local function var_7_71()
		var_7_4:AnimateSequence("Disabled")
		var_7_6:AnimateSequence("Disabled")
		var_7_8:AnimateSequence("Disabled")
		var_7_10:AnimateSequence("Disabled")
		var_7_13:AnimateSequence("Disabled")
		var_7_15:AnimateSequence("Disabled")
		var_7_17:AnimateSequence("Disabled")
		var_7_19:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_71

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ProgressionUnlockItem", ProgressionUnlockItem)
LockTable(_M)
