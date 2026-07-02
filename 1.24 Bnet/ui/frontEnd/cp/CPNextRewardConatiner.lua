module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_2)
	assert(arg_1_3)

	local var_1_0 = CP.GetPlaylistReward(arg_1_2, arg_1_3)

	if var_1_0 ~= nil then
		if LOOT.IsUnlockedWithID(arg_1_1, var_1_0.lootItemID) then
			if arg_1_3 == 0 then
				arg_1_0.CPNextRewardCheckBox1.CheckBox:SetAlpha(1)
			elseif arg_1_3 == 1 then
				arg_1_0.CPNextRewardCheckBox2.CheckBox:SetAlpha(1)
			end
		elseif arg_1_3 == 0 then
			arg_1_0.CPNextRewardCheckBox1.CheckBox:SetAlpha(0)
		elseif arg_1_3 == 1 then
			arg_1_0.CPNextRewardCheckBox2.CheckBox:SetAlpha(0)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.CPNextReward:SetDataSourceThroughElement(arg_2_0, nil)
	arg_2_0.CPNextReward2:SetDataSourceThroughElement(arg_2_0, nil)
	arg_2_0:SetAlpha(0)
	arg_2_0:SubscribeToDataSourceThroughElement(arg_2_0, nil, function()
		local var_3_0 = arg_2_0:GetDataSource()

		if var_3_0 then
			local var_3_1 = var_3_0.scoreLimit:GetValue(arg_2_1)
			local var_3_2 = var_3_0.timeLimit:GetValue(arg_2_1)

			if var_3_2 ~= nil and var_3_2 > 0 and var_3_2 < 100 then
				arg_2_0.HowText:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_CP_HOW_TO_LIM"), 0)
			else
				arg_2_0.HowText:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_CP_HOW_TO"), 0)
			end

			if var_3_1 ~= nil and var_3_1 > 0 then
				arg_2_0:SetAlpha(1)
				var_0_0(arg_2_0, arg_2_1, var_3_1, 0)
				var_0_0(arg_2_0, arg_2_1, var_3_1, 1)

				local var_3_3 = 0
				local var_3_4 = 0

				if CP.GetPlaylistReward(var_3_1, var_3_3) ~= nil then
					local var_3_5 = 1
					local var_3_6 = var_3_3 + 1

					if CP.GetPlaylistReward(var_3_1, var_3_6) ~= nil then
						var_3_5 = 2
					end

					if var_3_5 == 1 then
						ACTIONS.AnimateSequence(arg_2_0, "Rewardx1")
					elseif var_3_5 == 2 then
						ACTIONS.AnimateSequence(arg_2_0, "Rewardx2")
					end
				end
			else
				arg_2_0:SetAlpha(0)
			end
		end
	end)
end

function CPNextRewardConatiner(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 445 * _1080p)

	var_4_0.id = "CPNextRewardConatiner"
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

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, 0, _1080p * 445)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("CPNextReward", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "CPNextReward2"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 190, _1080p * 382, _1080p * 133, _1080p * 385)
	var_4_0:addElement(var_4_6)

	var_4_0.CPNextReward2 = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("CPNextReward", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "CPNextReward"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -3, _1080p * 189, _1080p * 133, _1080p * 385)
	var_4_0:addElement(var_4_8)

	var_4_0.CPNextReward = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Title"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 205, _1080p * 6, _1080p * 30)
	var_4_0:addElement(var_4_10)

	var_4_0.Title = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "HowText"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_12:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_CP_HOW_TO_LIM"), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 363, _1080p * 57, _1080p * 77)
	var_4_0:addElement(var_4_12)

	var_4_0.HowText = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "Complete"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("AAR/COMLETE"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 255, _1080p * 374, _1080p * 10, _1080p * 30)
	var_4_0:addElement(var_4_14)

	var_4_0.Complete = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("CPNextRewardCheckbox", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "CPNextRewardCheckBox1"

	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 251, _1080p * 10, _1080p * 30)
	var_4_0:addElement(var_4_16)

	var_4_0.CPNextRewardCheckBox1 = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("CPNextRewardCheckbox", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "CPNextRewardCheckBox2"

	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 251, _1080p * 10, _1080p * 30)
	var_4_0:addElement(var_4_18)

	var_4_0.CPNextRewardCheckBox2 = var_4_18

	local function var_4_19()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 382
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 133
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 385
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Rewardx2", var_4_21)

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 133
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 385
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Rewardx2", var_4_22)

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 205
		}
	}

	var_4_10:RegisterAnimationSequence("Rewardx2", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 205
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 225
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Rewardx2", var_4_24)

	local var_4_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Rewardx2", var_4_25)

	local function var_4_26()
		var_4_6:AnimateSequence("Rewardx2")
		var_4_8:AnimateSequence("Rewardx2")
		var_4_10:AnimateSequence("Rewardx2")
		var_4_16:AnimateSequence("Rewardx2")
		var_4_18:AnimateSequence("Rewardx2")
	end

	var_4_0._sequences.Rewardx2 = var_4_26

	local var_4_27
	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Rewardx1", var_4_28)

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 286
		}
	}

	var_4_8:RegisterAnimationSequence("Rewardx1", var_4_29)

	local var_4_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Rewardx1", var_4_30)

	local var_4_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 251
		}
	}

	var_4_16:RegisterAnimationSequence("Rewardx1", var_4_31)

	local var_4_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Rewardx1", var_4_32)

	local function var_4_33()
		var_4_6:AnimateSequence("Rewardx1")
		var_4_8:AnimateSequence("Rewardx1")
		var_4_14:AnimateSequence("Rewardx1")
		var_4_16:AnimateSequence("Rewardx1")
		var_4_18:AnimateSequence("Rewardx1")
	end

	var_4_0._sequences.Rewardx1 = var_4_33

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CPNextRewardConatiner", CPNextRewardConatiner)
LockTable(_M)
