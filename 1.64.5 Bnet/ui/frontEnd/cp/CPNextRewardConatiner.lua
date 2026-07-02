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

			arg_2_0.uniqueIdentifier = var_3_1

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

				arg_2_0._reward = CP.GetPlaylistReward(var_3_1, var_3_3)

				if arg_2_0._reward ~= nil then
					local var_3_5 = 1
					local var_3_6 = var_3_3 + 1

					arg_2_0._secondReward = CP.GetPlaylistReward(var_3_1, var_3_6)

					if arg_2_0._secondReward ~= nil then
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

	if Dvar.IBEGCHEFE("LROKTOQOKQ") then
		arg_2_0.bindButton = LUI.UIBindButton.new()

		arg_2_0:addElement(arg_2_0.bindButton)
		arg_2_0.bindButton:registerEventHandler("button_right_stick", function(arg_4_0, arg_4_1)
			if arg_2_0.uniqueIdentifier and arg_2_0.uniqueIdentifier > 0 then
				if arg_2_0._secondReward and arg_2_0._secondReward.type ~= "xp" then
					local var_4_0 = {
						lootData = {
							arg_2_0._reward,
							arg_2_0._secondReward
						}
					}

					LUI.FlowManager.RequestPopupMenu(nil, "MultipleRewardPreviewPopup", true, arg_2_1, false, var_4_0)
				elseif arg_2_0._reward and arg_2_0._reward.type ~= "xp" then
					STORE.PreviewItem(arg_4_1.controller, LOOT.GetTypeForID(arg_2_0._reward.lootItemID), arg_2_0._reward.lootItemID)
				end
			end
		end)
		arg_2_0.Preview:SetAlpha(1)
	else
		arg_2_0.Preview:SetAlpha(0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function CPNextRewardConatiner(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 445 * _1080p)

	var_5_0.id = "CPNextRewardConatiner"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, 0, _1080p * 445)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("CPNextReward", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "CPNextReward2"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 190, _1080p * 382, _1080p * 133, _1080p * 385)
	var_5_0:addElement(var_5_6)

	var_5_0.CPNextReward2 = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("CPNextReward", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "CPNextReward"

	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -3, _1080p * 189, _1080p * 133, _1080p * 385)
	var_5_0:addElement(var_5_8)

	var_5_0.CPNextReward = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Title"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 205, _1080p * 6, _1080p * 30)
	var_5_0:addElement(var_5_10)

	var_5_0.Title = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "HowText"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_CP_HOW_TO_LIM"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 363, _1080p * 57, _1080p * 77)
	var_5_0:addElement(var_5_12)

	var_5_0.HowText = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Complete"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("AAR/COMLETE"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 255, _1080p * 374, _1080p * 10, _1080p * 30)
	var_5_0:addElement(var_5_14)

	var_5_0.Complete = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("CPNextRewardCheckbox", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "CPNextRewardCheckBox1"

	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 251, _1080p * 10, _1080p * 30)
	var_5_0:addElement(var_5_16)

	var_5_0.CPNextRewardCheckBox1 = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("CPNextRewardCheckbox", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "CPNextRewardCheckBox2"

	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 251, _1080p * 10, _1080p * 30)
	var_5_0:addElement(var_5_18)

	var_5_0.CPNextRewardCheckBox2 = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "Preview"

	var_5_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_20:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_LOOT_PREVIEW"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 168, _1080p * 393, _1080p * 413)
	var_5_0:addElement(var_5_20)

	var_5_0.Preview = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
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

	var_5_6:RegisterAnimationSequence("Rewardx2", var_5_23)

	local var_5_24 = {
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

	var_5_8:RegisterAnimationSequence("Rewardx2", var_5_24)

	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 205
		}
	}

	var_5_10:RegisterAnimationSequence("Rewardx2", var_5_25)

	local var_5_26 = {
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

	var_5_16:RegisterAnimationSequence("Rewardx2", var_5_26)

	local var_5_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Rewardx2", var_5_27)

	local function var_5_28()
		var_5_6:AnimateSequence("Rewardx2")
		var_5_8:AnimateSequence("Rewardx2")
		var_5_10:AnimateSequence("Rewardx2")
		var_5_16:AnimateSequence("Rewardx2")
		var_5_18:AnimateSequence("Rewardx2")
	end

	var_5_0._sequences.Rewardx2 = var_5_28

	local var_5_29
	local var_5_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Rewardx1", var_5_30)

	local var_5_31 = {
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

	var_5_8:RegisterAnimationSequence("Rewardx1", var_5_31)

	local var_5_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Rewardx1", var_5_32)

	local var_5_33 = {
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

	var_5_16:RegisterAnimationSequence("Rewardx1", var_5_33)

	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Rewardx1", var_5_34)

	local function var_5_35()
		var_5_6:AnimateSequence("Rewardx1")
		var_5_8:AnimateSequence("Rewardx1")
		var_5_14:AnimateSequence("Rewardx1")
		var_5_16:AnimateSequence("Rewardx1")
		var_5_18:AnimateSequence("Rewardx1")
	end

	var_5_0._sequences.Rewardx1 = var_5_35

	local var_5_36
	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_38)

	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_5_14:RegisterAnimationSequence("AR", var_5_39)

	local function var_5_40()
		var_5_10:AnimateSequence("AR")
		var_5_12:AnimateSequence("AR")
		var_5_14:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_40

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CPNextRewardConatiner", CPNextRewardConatiner)
LockTable(_M)
