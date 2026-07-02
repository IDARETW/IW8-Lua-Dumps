module(..., package.seeall)

local var_0_0 = {
	{
		name = "TRIALEVENT/BRONZE_CAPS",
		image = "trial_medal_bronze",
		color = SWATCHES.trialEvent.trialBronze
	},
	{
		name = "TRIALEVENT/SILVER_CAPS",
		image = "trial_medal_silver",
		color = SWATCHES.trialEvent.trialSilver
	},
	{
		name = "TRIALEVENT/GOLD_CAPS",
		image = "trial_medal_gold",
		color = SWATCHES.trialEvent.trialGold
	}
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.options = arg_1_2

	if arg_1_2.isParticipation or arg_1_2.showCompletionReward then
		arg_1_0.LootGrid:SetMaxVisibleColumns(1)
		arg_1_0.LootGrid:SetNumColumns(1)
		arg_1_0.LootGrid:SetNumChildren(1)

		if arg_1_2.isParticipation then
			Dvar.DHEGHJJJHI("LOPTQONSTM", false)
			ACTIONS.AnimateSequence(arg_1_0, "Participation")

			local var_1_0 = LOOT.GetLootCardData(arg_1_1, TRIALS.ParticipationLootID)

			arg_1_0.LootGrid:GetElementAtPosition(0, 0):UpdateCardConfig(var_1_0)
			ACTIONS.AnimateSequence(arg_1_0.LootGrid:GetElementAtPosition(0, 0), "HideType")
		elseif arg_1_2.showCompletionReward then
			if arg_1_2.isAllGold then
				ACTIONS.AnimateSequence(arg_1_0, "Completion")
				Dvar.DHEGHJJJHI("NSRRPSPKRN", false)
			else
				ACTIONS.AnimateSequence(arg_1_0, "GoldPreview")
			end

			local var_1_1 = LOOT.GetLootCardData(arg_1_1, TRIALS.CompletionLootID)

			arg_1_0.LootGrid:GetElementAtPosition(0, 0):UpdateCardConfig(var_1_1)
			ACTIONS.AnimateSequence(arg_1_0.LootGrid:GetElementAtPosition(0, 0), "HideType")
		end
	else
		assert(arg_1_2.reward)
		assert(arg_1_2.previousMedal)
		assert(arg_1_2.lootIds)

		local var_1_2 = arg_1_2.reward - arg_1_2.previousMedal

		arg_1_0.LootGrid:SetMaxVisibleColumns(var_1_2)
		arg_1_0.LootGrid:SetNumColumns(var_1_2)
		arg_1_0.LootGrid:SetNumChildren(var_1_2)

		for iter_1_0 = arg_1_2.previousMedal, arg_1_2.reward - 1 do
			local var_1_3 = LOOT.GetLootCardData(arg_1_1, arg_1_2.lootIds[iter_1_0 + 1])
			local var_1_4 = arg_1_0.LootGrid:GetElementAtPosition(iter_1_0 - arg_1_2.previousMedal, 0)

			var_1_4:UpdateCardConfig(var_1_3)
			ACTIONS.AnimateSequence(var_1_4, "HideType")
		end

		arg_1_0.MedalLabel:setText(Engine.CBBHFCGDIC(var_0_0[arg_1_2.reward].name), 0)
		arg_1_0.MedalLabel:SetRGBFromTable(var_0_0[arg_1_2.reward].color)
		arg_1_0.MedalImage:setImage(RegisterMaterial(var_0_0[arg_1_2.reward].image))

		if arg_1_2.isAllGold then
			local function var_1_5(arg_2_0, arg_2_1)
				arg_1_0.options.showCompletionReward = true

				LUI.FlowManager.RequestPopupMenu(nil, "TrialEventRewardPopup", true, arg_1_1, false, arg_1_0.options)
				ACTIONS.LeaveMenu(arg_1_0)
			end

			arg_1_0.ContinueButton:addEventHandler("button_action", var_1_5)
			arg_1_0.bindButton:addEventHandler("button_secondary", var_1_5)
			arg_1_0.bindButton:addEventHandler("button_primary", var_1_5)
		end
	end
end

function TrialEventRewardPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "TrialEventRewardPopup"
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

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 87, _1080p * 87)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GenericPopupWindow"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -324, _1080p * 379)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Title"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_8:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/REWARD_TITLE")), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -291, _1080p * -231)
	var_3_0:addElement(var_3_8)

	var_3_0.Title = var_3_8

	local var_3_9
	local var_3_10 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LootItemCardMini", {
				controllerIndex = var_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 50,
		spacingY = _1080p * 50,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 200,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_3_11 = LUI.UIGrid.new(var_3_10)

	var_3_11.id = "LootGrid"

	var_3_11:setUseStencil(false)
	var_3_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -188, _1080p * 12)
	var_3_0:addElement(var_3_11)

	var_3_0.LootGrid = var_3_11

	local var_3_12
	local var_3_13 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_13.id = "ContinueButton"

	var_3_13.Text:SetLeft(_1080p * 20, 0)
	var_3_13.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OK"), 0)
	var_3_13.Text:SetAlignment(LUI.Alignment.Center)
	var_3_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 305, _1080p * 343)
	var_3_0:addElement(var_3_13)

	var_3_0.ContinueButton = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIText.new()

	var_3_15.id = "LootReceived"

	var_3_15:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt2, 0)
	var_3_15:setText(Engine.CBBHFCGDIC("TRIALEVENT/HIGHEST_MEDAL"), 0)
	var_3_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_15:SetAlignment(LUI.Alignment.Center)
	var_3_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 70.5, _1080p * 94.5)
	var_3_0:addElement(var_3_15)

	var_3_0.LootReceived = var_3_15

	local var_3_16
	local var_3_17 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_17.id = "ButtonHelperBar"

	var_3_17.Background:SetAlpha(0, 0)
	var_3_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 379, _1080p * 439)
	var_3_0:addElement(var_3_17)

	var_3_0.ButtonHelperBar = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIText.new()

	var_3_19.id = "MedalLabel"

	var_3_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_19:setText("", 0)
	var_3_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_19:SetAlignment(LUI.Alignment.Center)
	var_3_19:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 684, _1080p * 1236, _1080p * 751, _1080p * 821)
	var_3_0:addElement(var_3_19)

	var_3_0.MedalLabel = var_3_19

	local var_3_20
	local var_3_21 = LUI.UIImage.new()

	var_3_21.id = "MedalImage"

	var_3_21:setImage(RegisterMaterial("trial_medal_gold"), 0)
	var_3_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -998, _1080p * -922, _1080p * 662, _1080p * 738)
	var_3_0:addElement(var_3_21)

	var_3_0.MedalImage = var_3_21

	local function var_3_22()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 316
		}
	}

	var_3_6:RegisterAnimationSequence("Participation", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/PARTICIPATION_TITLE"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -228
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -168
		}
	}

	var_3_8:RegisterAnimationSequence("Participation", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		}
	}

	var_3_11:RegisterAnimationSequence("Participation", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 242
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_3_13:RegisterAnimationSequence("Participation", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("TRIALEVENT/PARTICIPATION_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 181
		}
	}

	var_3_15:RegisterAnimationSequence("Participation", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 376
		}
	}

	var_3_17:RegisterAnimationSequence("Participation", var_3_29)

	local var_3_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("Participation", var_3_30)

	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("Participation", var_3_31)

	local function var_3_32()
		var_3_6:AnimateSequence("Participation")
		var_3_8:AnimateSequence("Participation")
		var_3_11:AnimateSequence("Participation")
		var_3_13:AnimateSequence("Participation")
		var_3_15:AnimateSequence("Participation")
		var_3_17:AnimateSequence("Participation")
		var_3_19:AnimateSequence("Participation")
		var_3_21:AnimateSequence("Participation")
	end

	var_3_0._sequences.Participation = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 316
		}
	}

	var_3_6:RegisterAnimationSequence("Completion", var_3_34)

	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/COMPLETION_TITLE"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -228
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -168
		}
	}

	var_3_8:RegisterAnimationSequence("Completion", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		}
	}

	var_3_11:RegisterAnimationSequence("Completion", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 242
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_3_13:RegisterAnimationSequence("Completion", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("TRIALEVENT/COMPLETION_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 181
		}
	}

	var_3_15:RegisterAnimationSequence("Completion", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 376
		}
	}

	var_3_17:RegisterAnimationSequence("Completion", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("Completion", var_3_40)

	local var_3_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("Completion", var_3_41)

	local function var_3_42()
		var_3_6:AnimateSequence("Completion")
		var_3_8:AnimateSequence("Completion")
		var_3_11:AnimateSequence("Completion")
		var_3_13:AnimateSequence("Completion")
		var_3_15:AnimateSequence("Completion")
		var_3_17:AnimateSequence("Completion")
		var_3_19:AnimateSequence("Completion")
		var_3_21:AnimateSequence("Completion")
	end

	var_3_0._sequences.Completion = var_3_42

	local var_3_43
	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 316
		}
	}

	var_3_6:RegisterAnimationSequence("GoldPreview", var_3_44)

	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/COMPLETION_TITLE"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -228
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -168
		}
	}

	var_3_8:RegisterAnimationSequence("GoldPreview", var_3_45)

	local var_3_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		}
	}

	var_3_11:RegisterAnimationSequence("GoldPreview", var_3_46)

	local var_3_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 242
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_3_13:RegisterAnimationSequence("GoldPreview", var_3_47)

	local var_3_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("TRIALEVENT/PREVIEW_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 181
		}
	}

	var_3_15:RegisterAnimationSequence("GoldPreview", var_3_48)

	local var_3_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 376
		}
	}

	var_3_17:RegisterAnimationSequence("GoldPreview", var_3_49)

	local var_3_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("GoldPreview", var_3_50)

	local var_3_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("GoldPreview", var_3_51)

	local function var_3_52()
		var_3_6:AnimateSequence("GoldPreview")
		var_3_8:AnimateSequence("GoldPreview")
		var_3_11:AnimateSequence("GoldPreview")
		var_3_13:AnimateSequence("GoldPreview")
		var_3_15:AnimateSequence("GoldPreview")
		var_3_17:AnimateSequence("GoldPreview")
		var_3_19:AnimateSequence("GoldPreview")
		var_3_21:AnimateSequence("GoldPreview")
	end

	var_3_0._sequences.GoldPreview = var_3_52

	var_3_13:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)

	function var_3_0.addButtonHelperFunction(arg_11_0, arg_11_1)
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_53 = LUI.UIBindButton.new()

	var_3_53.id = "selfBindButton"

	var_3_0:addElement(var_3_53)

	var_3_0.bindButton = var_3_53

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_3_0.bindButton:addEventHandler("button_primary", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialEventRewardPopup", TrialEventRewardPopup)
LockTable(_M)
