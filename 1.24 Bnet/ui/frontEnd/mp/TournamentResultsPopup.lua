module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 256
	local var_1_1 = 158
	local var_1_2 = arg_1_0._rewardIndex
	local var_1_3 = MenuBuilder.BuildRegisteredType("TournamentRewardItem", {
		controllerIndex = arg_1_1
	})

	var_1_3:SetRewardData(arg_1_2)

	local var_1_4 = var_1_2 * arg_1_0._spacing

	var_1_3:SetAnchorsAndPosition(0, 1, 0, 1, var_1_4 + _1080p * var_1_2 * var_1_0, var_1_4 + _1080p * (var_1_2 + 1) * var_1_0, _1080p * 0, _1080p * var_1_1)
	arg_1_0.TournamentResultRewardList:addElement(var_1_3)
	ACTIONS.AnimateSequence(var_1_3, "Result")

	arg_1_0._rewardIndex = arg_1_0._rewardIndex + 1

	return var_1_3
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = 2
	local var_2_1 = TOURNAMENT.maxRewards

	arg_2_0._rewardIndex = 0
	arg_2_0._spacing = 36 * _1080p

	arg_2_0.TournamentResultRewardList:SetNoWrap(true)
	arg_2_0.TournamentResultRewardList:SetAlignment(LUI.Alignment.Center)

	local var_2_2 = TOURNAMENT.GetRewardsForRank(var_2_0)

	if var_2_2 then
		local var_2_3 = tonumber(var_2_2.lootID)
		local var_2_4 = LOOT.GetTypeForID(var_2_3)

		if var_2_4 and var_2_4 ~= LOOT.itemTypes.INVALID then
			var_0_0(arg_2_0, arg_2_1, LOOT.GetLootProperties(var_2_4, var_2_3))
		end

		local var_2_5 = var_2_2.AdditionalRewards

		if var_2_5 then
			local var_2_6 = var_2_5.XP
			local var_2_7 = var_2_5.CP

			if var_2_6 then
				var_0_0(arg_2_0, arg_2_1, LOOT.GetXPLootProperties(var_2_6))
			end

			if var_2_7 then
				var_0_0(arg_2_0, arg_2_1, LOOT.GetCPLootProperties(var_2_7))
			end

			local var_2_8 = var_2_5.lootItems

			for iter_2_0 = 1, #var_2_8 do
				local var_2_9 = tonumber(var_2_8[iter_2_0])
				local var_2_10 = LOOT.GetTypeForID(var_2_9)

				if var_2_10 and var_2_10 ~= LOOT.itemTypes.INVALID then
					var_0_0(arg_2_0, arg_2_1, LOOT.GetLootProperties(var_2_10, var_2_9))
				end
			end
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.RewardsGrid)

	local var_3_0 = arg_3_2 == 5 and 4 or arg_3_2
	local var_3_1 = TOURNAMENT.GetAllRewards(arg_3_1, true, var_3_0)

	arg_3_0.RewardsGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_0:UpdateCardConfig(var_3_1[arg_4_1 + 1])
	end)
	arg_3_0.RewardsGrid:SetNumChildren(#var_3_1)
	arg_3_0.RewardsGrid:RefreshContent()

	local var_3_2 = 150
	local var_3_3 = 20
	local var_3_4 = var_3_2 * #var_3_1 + var_3_3 * (#var_3_1 - 1)
	local var_3_5 = arg_3_0.RewardsGrid:GetCurrentAnchorsAndPositions()

	arg_3_0.RewardsGrid:SetAnchorsAndPosition(var_3_5.leftAnchor, var_3_5.rightAnchor, var_3_5.topAnchor, var_3_5.bottomAnchor, _1080p * (-var_3_4 / 2), _1080p * (var_3_4 / 2), var_3_5.top, var_3_5.bottom)
end

local function var_0_3(arg_5_0)
	if TOURNAMENT.GetMyPlacement() == 1 then
		local var_5_0 = arg_5_0:getParent()

		var_5_0.TrophyFlare:SetAlpha(1)
		ACTIONS.AnimateSequence(var_5_0, "FlareSpin")
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = TOURNAMENT.GetMyPlacement()
	local var_6_1
	local var_6_2 = "Reveal"
	local var_6_3 = CONDITIONS.IsTournamentFullSize(arg_6_0)

	if var_6_0 == 1 then
		var_6_1 = "ui_iw8_2v2_rank_firstplace"
	elseif var_6_0 == 2 then
		var_6_1 = "ui_iw8_2v2_rank_secondplace"
	elseif var_6_0 == 3 then
		var_6_1 = "ui_iw8_2v2_rank_thirdplace"
	elseif var_6_0 == 5 and var_6_3 then
		var_6_1 = "ui_iw8_2v2_rank_thirdplace"
	else
		var_6_1 = "ui_iw8_2v2_rank_genericplace"
		var_6_2 = "ParticipationReveal"
	end

	Engine.BJDBIAGIDA(var_6_1)
	arg_6_0.Place:setText(TOURNAMENT.GetMyPlacementString())
	arg_6_0.TrophyImage:setImage(TOURNAMENT.GetMyPlacementImage())
	var_0_1(arg_6_0, arg_6_1)
	var_0_2(arg_6_0, arg_6_1, var_6_0)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_6_0.Background)
	ACTIONS.AnimateSequence(arg_6_0, var_6_2)
end

function TournamentResultsPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0.id = "TournamentResultsPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0.8, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -362, _1080p * 362)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "Results"

	var_7_8:SetRGBFromTable(SWATCHES.Tournament.resultsTitle, 0)
	var_7_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/RESULTS"), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -314, _1080p * -254)
	var_7_0:addElement(var_7_8)

	var_7_0.Results = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIText.new()

	var_7_10.id = "YouPlaced"

	var_7_10:SetRGBFromTable(SWATCHES.Tournament.resultsSubtitle, 0)
	var_7_10:setText(Engine.CBBHFCGDIC("TOURNAMENT/YOU_PLACED"), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -215, _1080p * -187)
	var_7_0:addElement(var_7_10)

	var_7_0.YouPlaced = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIText.new()

	var_7_12.id = "Place"

	var_7_12:SetRGBFromTable(SWATCHES.Tournament.resultsPlacement, 0)
	var_7_12:setText("1st", 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_12:SetAlignment(LUI.Alignment.Center)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -191, _1080p * -119)
	var_7_0:addElement(var_7_12)

	var_7_0.Place = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "GenericButton"

	var_7_14.Text:SetLeft(_1080p * 20, 0)
	var_7_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/RETURN")), 0)
	var_7_14.Text:SetAlignment(LUI.Alignment.Center)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 275, _1080p * 313)
	var_7_0:addElement(var_7_14)

	var_7_0.GenericButton = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("TournamentResultRewardList", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "TournamentResultRewardList"

	var_7_16:SetAlpha(0, 0)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -857, _1080p * 857, _1080p * 58, _1080p * 216)
	var_7_0:addElement(var_7_16)

	var_7_0.TournamentResultRewardList = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "TrophyFlare"

	var_7_18:SetAlpha(0, 0)
	var_7_18:setImage(RegisterMaterial("arena_winner_flare_temp"), 0)
	var_7_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -198, _1080p * 198, _1080p * -140, _1080p * 256)
	var_7_0:addElement(var_7_18)

	var_7_0.TrophyFlare = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIImage.new()

	var_7_20.id = "TrophyImage"

	var_7_20:setImage(RegisterMaterial("tournament_trophy_participation"), 0)
	var_7_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -198, _1080p * 314)
	var_7_0:addElement(var_7_20)

	var_7_0.TrophyImage = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIStyledText.new()

	var_7_22.id = "SelectText"

	var_7_22:setText(Engine.CBBHFCGDIC("PLATFORM/SELECT"), 0)
	var_7_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_22:SetWordWrap(false)
	var_7_22:SetAlignment(LUI.Alignment.Center)
	var_7_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * 378, _1080p * 400)
	var_7_0:addElement(var_7_22)

	var_7_0.SelectText = var_7_22

	local var_7_23
	local var_7_24 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 8,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LootItemCardMini", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 200,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_25 = LUI.UIGrid.new(var_7_24)

	var_7_25.id = "RewardsGrid"

	var_7_25:setUseStencil(false)
	var_7_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -670, _1080p * 670, _1080p * -42, _1080p * 158)
	var_7_0:addElement(var_7_25)

	var_7_0.RewardsGrid = var_7_25

	local var_7_26
	local var_7_27 = LUI.UIText.new()

	var_7_27.id = "RewardsTitle"

	var_7_27:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_7_27:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/REWARDS_EARNED")), 0)
	var_7_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_27:SetWordWrap(false)
	var_7_27:SetAlignment(LUI.Alignment.Center)
	var_7_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -71, _1080p * 71, _1080p * -96, _1080p * -74)
	var_7_0:addElement(var_7_27)

	var_7_0.RewardsTitle = var_7_27

	local function var_7_28()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_28

	local var_7_29 = {
		{
			value = 360,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.05,
			duration = 10000,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 20000,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 10000,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_18:RegisterAnimationSequence("FlareSpin", var_7_29)

	local function var_7_30()
		var_7_18:AnimateLoop("FlareSpin")
	end

	var_7_0._sequences.FlareSpin = var_7_30

	local var_7_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Reveal", var_7_31)

	local var_7_32 = {
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
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -362,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 362,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_6:RegisterAnimationSequence("Reveal", var_7_32)

	local var_7_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 350,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_7_8:RegisterAnimationSequence("Reveal", var_7_33)

	local var_7_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 450,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_7_10:RegisterAnimationSequence("Reveal", var_7_34)

	local var_7_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 550,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_7_12:RegisterAnimationSequence("Reveal", var_7_35)

	local var_7_36 = {
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
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("Reveal", var_7_36)

	local var_7_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("Reveal", var_7_37)

	local var_7_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 720,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 720,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_25:RegisterAnimationSequence("Reveal", var_7_38)

	local var_7_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 650,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 650,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_27:RegisterAnimationSequence("Reveal", var_7_39)

	local function var_7_40()
		var_7_4:AnimateSequence("Reveal")
		var_7_6:AnimateSequence("Reveal")
		var_7_8:AnimateSequence("Reveal")
		var_7_10:AnimateSequence("Reveal")
		var_7_12:AnimateSequence("Reveal")
		var_7_14:AnimateSequence("Reveal")
		var_7_20:AnimateSequence("Reveal")
		var_7_25:AnimateSequence("Reveal")
		var_7_27:AnimateSequence("Reveal")
	end

	var_7_0._sequences.Reveal = var_7_40

	local var_7_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ParticipationReveal", var_7_41)

	local var_7_42 = {
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
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -362,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 362,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_6:RegisterAnimationSequence("ParticipationReveal", var_7_42)

	local var_7_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 350,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_7_8:RegisterAnimationSequence("ParticipationReveal", var_7_43)

	local var_7_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 450,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_7_10:RegisterAnimationSequence("ParticipationReveal", var_7_44)

	local var_7_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 550,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_7_12:RegisterAnimationSequence("ParticipationReveal", var_7_45)

	local var_7_46 = {
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
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ParticipationReveal", var_7_46)

	local var_7_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 650,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.8,
			duration = 650,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic,
			onComplete = var_0_3
		}
	}

	var_7_20:RegisterAnimationSequence("ParticipationReveal", var_7_47)

	local var_7_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("ParticipationReveal", var_7_48)

	local var_7_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("ParticipationReveal", var_7_49)

	local function var_7_50()
		var_7_4:AnimateSequence("ParticipationReveal")
		var_7_6:AnimateSequence("ParticipationReveal")
		var_7_8:AnimateSequence("ParticipationReveal")
		var_7_10:AnimateSequence("ParticipationReveal")
		var_7_12:AnimateSequence("ParticipationReveal")
		var_7_14:AnimateSequence("ParticipationReveal")
		var_7_20:AnimateSequence("ParticipationReveal")
		var_7_25:AnimateSequence("ParticipationReveal")
		var_7_27:AnimateSequence("ParticipationReveal")
	end

	var_7_0._sequences.ParticipationReveal = var_7_50

	ACTIONS.AnimateSequence(var_7_0, "Reveal")
	var_7_14:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_7_51 = LUI.UIBindButton.new()

	var_7_51.id = "selfBindButton"

	var_7_0:addElement(var_7_51)

	var_7_0.bindButton = var_7_51

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("TournamentResultsPopup", TournamentResultsPopup)
LockTable(_M)
