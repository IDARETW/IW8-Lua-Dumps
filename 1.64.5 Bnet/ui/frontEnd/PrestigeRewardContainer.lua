module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_2, "You must provide a valid screen name.")

	arg_1_3.defaultScreenName = arg_1_2

	LUI.FlowManager.RequestLeaveMenuByName("ProgressionMenu", false, false)
	LUI.FlowManager.RequestAddMenu("ProgressionMenu", true, arg_1_1, false, arg_1_3, false)
	LUI.FlowManager.RequestLeaveMenuByName("SeasonalProgressionMenu", false, false)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	LUI.FlowManager.RequestAddMenu(arg_2_2, true, arg_2_1, false, arg_2_3, false)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if not arg_3_2 or type(arg_3_2) ~= "table" or not arg_3_2.previewScreen or not arg_3_2.previewScreenFunction then
		assert(false, "You must provide a table of options that include a preview screen name and a function to call on the button event.")
	end

	arg_3_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "center",
		button_ref = "button_r3",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC(arg_3_2.previewPromptText)
	})
	arg_3_0.ButtonHelperBar.Background:SetAlpha(0)

	local var_3_0 = LUI.UIBindButton.new()

	var_3_0.id = "selfBindButton"

	arg_3_0:addElement(var_3_0)

	arg_3_0.bindButton = var_3_0

	arg_3_0.bindButton:addEventHandler("button_right_stick", function(arg_4_0, arg_4_1)
		arg_3_2.previewScreenFunction(arg_3_0, arg_3_1, arg_3_2.previewScreen, arg_3_2)

		if arg_4_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = SEASON.GetSeasonDataNumFromDisplayNum(arg_5_2)
	local var_5_1 = PROGRESSION.GetNextProgressionRewardBracket(arg_5_1, var_5_0)
	local var_5_2 = PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_5_1, var_5_0)

	arg_5_0.WZContainer:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LEVEL_X_REWARDS", var_5_1))
	ACTIONS.AnimateSequence(arg_5_0, "CurrentSeason")
	arg_5_0.Reward1:SetAlpha(0)
	arg_5_0.Reward2:SetAlpha(0)

	local var_5_3 = {
		arg_5_0.Reward1,
		arg_5_0.Reward2
	}
	local var_5_4 = PROGRESSION.GetSeasonalProgressionRewardsForNextPrestigeLevelBracket(arg_5_1, var_5_0)
	local var_5_5 = PROGRESSION.GetNextPrestigeLevelForSeasonIfValid(arg_5_1, var_5_0)
	local var_5_6 = {}

	if var_5_5 and var_5_4.tierSkips and var_5_4.tierSkips > 0 then
		local var_5_7 = var_5_4.tierSkips == 1 and Engine.CBBHFCGDIC("BATTLEPASS/TIER_SKIP") or Engine.CBBHFCGDIC("BATTLEPASS/N_TIER_SKIPS", var_5_4.tierSkips)
		local var_5_8 = {
			image = "icon_tier_skip_token",
			title = var_5_7
		}

		table.insert(var_5_6, var_5_8)
	end

	if var_5_5 then
		local var_5_9 = PROGRESSION.GetPrestigeIcon(var_5_5)
		local var_5_10 = {
			image = var_5_9,
			title = Engine.CBBHFCGDIC("PRESTIGE/STICKER_AND_EMBLEM")
		}

		table.insert(var_5_6, var_5_10)
	end

	if var_5_4.emblemID and var_5_4.emblemID ~= "" then
		local var_5_11 = LOOT.GetLootProperties(LOOT.itemTypes.EMBLEM, var_5_4.emblemID)
		local var_5_12 = {
			image = var_5_11.image,
			title = var_5_11.name
		}

		table.insert(var_5_6, var_5_12)
	end

	if var_5_4.markerID and var_5_4.markerID ~= "" then
		local var_5_13 = LOOT.GetLootProperties(LOOT.itemTypes.CONSUMABLE, var_5_4.markerID)
		local var_5_14 = {
			image = var_5_13.image,
			title = var_5_13.name
		}

		table.insert(var_5_6, var_5_14)
	end

	if #var_5_6 > 0 and #var_5_6 <= #var_5_3 then
		ACTIONS.AnimateSequence(arg_5_0, "Show" .. #var_5_6)
	end

	for iter_5_0 = 1, #var_5_6 do
		if iter_5_0 > #var_5_3 then
			assert("PrestigeRewardContainer: Cannot handle more icons")

			break
		end

		var_5_3[iter_5_0]:SetIconAndDesc({
			image = var_5_6[iter_5_0].image,
			title = var_5_6[iter_5_0].title
		})
	end

	local var_5_15 = false

	if PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank(var_5_1 - 1) then
		local var_5_16 = PROGRESSION.GetPrestigeMasterRibbonAwardedAtSeasonalRank(var_5_1 - 1) and "CurrentSeasonPrestigeMaster" or "CurrentSeasonBetweenPrestigeMaster"

		ACTIONS.AnimateSequence(arg_5_0, var_5_16)
		var_0_2(arg_5_0, arg_5_1, {
			previewScreen = "PrestigeMasterMenu",
			previewPromptText = "PRESTIGE/VIEW_PRESTIGE_MASTER_RIBBONS",
			previewScreenFunction = var_0_0
		})
	else
		local var_5_17 = PROGRESSION.GetPlayerProgressionData({
			_controllerIndex = arg_5_1,
			_seasonNumOverride = var_5_0,
			_rankTypeOverride = PROGRESSION.RANK_TYPES.SEASONAL
		})
		local var_5_18 = PROGRESSION.GetBlueprintRewardInfoBySeason(arg_5_1, arg_5_2)

		if var_5_18 and var_5_18._blueprintID > 0 and var_5_17._rankDisplay <= var_5_18._seasonRank then
			local var_5_19 = {}

			ACTIONS.AnimateSequence(arg_5_0, "CurrentSeasonWeaponPreview")

			var_5_15 = true

			local var_5_20 = WEAPON.GenerateWeaponTableFromID(arg_5_1, var_5_18._blueprintID)

			arg_5_0.WeaponPreview:Setup(var_5_20, false, true, false, true)

			var_5_19.menuName = "SeasonalProgressionMenu"
			var_5_19.weaponTable = var_5_20
			var_5_19.previewScreenFunction = var_0_1
			var_5_19.previewPromptText = "CAS/PREVIEW_BLUEPRINT_WEAPON"
			var_5_19.previewScreen = "WeaponPreview"

			arg_5_0.WeaponPreview:registerEventHandler("button_action", function(arg_6_0, arg_6_1)
				var_0_1(arg_6_0:getParent(), arg_6_1.controller, "WeaponPreview", var_5_19)
			end)
			var_0_2(arg_5_0, arg_5_1, var_5_19)
		else
			ACTIONS.AnimateSequence(arg_5_0, "CurrentSeasonPrestige")
			ACTIONS.AnimateSequence(arg_5_0:getParent(), "SetDisplayPrestigeProgress")
			var_0_2(arg_5_0, arg_5_1, {
				previewScreen = "ProgressionPrestigeMenu",
				previewPromptText = "PRESTIGE/VIEW_PRESTIGE_PROGRESSION",
				previewScreenFunction = var_0_0
			})
		end
	end

	arg_5_0.WeaponPreview:SetFocusable(var_5_15)
	arg_5_0.WeaponPreview:SetMouseFocusBlocker(not var_5_15)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	ACTIONS.AnimateSequence(arg_7_0, "PastSeason")

	local var_7_0 = SEASON.GetSeasonDataNumFromDisplayNum(arg_7_2)
	local var_7_1 = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_7_1,
		_seasonNumOverride = var_7_0
	})

	arg_7_0.WZContainer:SetTitle(SEASON.GetLocalizedName({
		seasonDataNumToUse = arg_7_2
	}))
	arg_7_0.Emblem:setImage(RegisterMaterial(var_7_1._rankIcon))
	arg_7_0.PrestigeLevel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/PRESTIGE_VALUE", var_7_1._prestige)))
	arg_7_0.LevelText:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_7_1._rankDisplay)))
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.GetPromptContainer = GetPromptContainer

	arg_8_0.WeaponPreview:SetDirectionalInputEnabled(false)

	arg_8_0.UpdateContainerForPrestigeLevel = var_0_3
	arg_8_0.UpdateContainerForPastSeason = var_0_4
end

function PrestigeRewardContainer(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 364 * _1080p, 0, 250 * _1080p)

	var_9_0.id = "PrestigeRewardContainer"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "WZContainer"

	var_9_4.TitleBackground:SetLeft(_1080p * 3, 0)
	var_9_4.TitleBackground:SetRight(_1080p * -3, 0)
	var_9_4.TitleBackground:SetTop(_1080p * 3, 0)
	var_9_4.TitleBackground:SetBottom(_1080p * 47, 0)
	var_9_4.TitleBackground:SetAlpha(0.2, 0)
	var_9_4.Title:SetLeft(_1080p * 14, 0)
	var_9_4.Title:SetRight(_1080p * -14, 0)
	var_9_4.Title:SetTop(_1080p * 12, 0)
	var_9_4.Title:SetBottom(_1080p * 36, 0)
	var_9_4.Title:setText("", 0)
	var_9_4.Title:SetAlignment(LUI.Alignment.Center)
	var_9_4.BorderBacker:SetLeft(0, 0)
	var_9_4.BorderBacker:SetRight(0, 0)
	var_9_4.BorderBacker:SetTop(0, 0)
	var_9_4.BorderBacker:SetBottom(0, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.WZContainer = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "ItemContainer"

	var_9_6.TitleBackground:SetLeft(_1080p * 2, 0)
	var_9_6.TitleBackground:SetRight(_1080p * -2, 0)
	var_9_6.TitleBackground:SetTop(0, 0)
	var_9_6.TitleBackground:SetBottom(_1080p * 44, 0)
	var_9_6.TitleBackground:SetAlpha(0, 0)
	var_9_6.Title:SetLeft(_1080p * 14, 0)
	var_9_6.Title:SetRight(_1080p * -14, 0)
	var_9_6.Title:SetTop(_1080p * 10, 0)
	var_9_6.Title:SetBottom(_1080p * 34, 0)
	var_9_6.Title:SetAlpha(0, 0)
	var_9_6.Title:setText("", 0)
	var_9_6.Title:SetAlignment(LUI.Alignment.Center)
	var_9_6.BorderBacker:SetLeft(0, 0)
	var_9_6.BorderBacker:SetRight(0, 0)
	var_9_6.BorderBacker:SetTop(0, 0)
	var_9_6.BorderBacker:SetBottom(0, 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 64, _1080p * 182)
	var_9_0:addElement(var_9_6)

	var_9_0.ItemContainer = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("WeaponLockerButton", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "WeaponPreview"

	var_9_8:SetScale(-0.05, 0)
	var_9_8.BlueprintIcon:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 347, _1080p * 72, _1080p * 174)
	var_9_0:addElement(var_9_8)

	var_9_0.WeaponPreview = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "ButtonHelperBar"

	var_9_10:SetAlpha(0, 0)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 56, _1080p * 115)
	var_9_0:addElement(var_9_10)

	var_9_0.ButtonHelperBar = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("PrestigeRewardItem", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "Reward2"

	var_9_12:SetAlpha(0, 0)
	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -34.5, _1080p * 33.5, _1080p * -129, _1080p * -29)
	var_9_0:addElement(var_9_12)

	var_9_0.Reward2 = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("PrestigeRewardItem", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "Reward1"

	var_9_14:SetAlpha(0, 0)
	var_9_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 37, _1080p * 105, _1080p * -129, _1080p * -29)
	var_9_0:addElement(var_9_14)

	var_9_0.Reward1 = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIImage.new()

	var_9_16.id = "Emblem"

	var_9_16:SetAlpha(0, 0)
	var_9_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -87.5, _1080p * 88.5, _1080p * -111.5, _1080p * 56.5)
	var_9_0:addElement(var_9_16)

	var_9_0.Emblem = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIText.new()

	var_9_18.id = "LevelText"

	var_9_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_9_18:setText("", 0)
	var_9_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_18:SetAlignment(LUI.Alignment.Center)
	var_9_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 35, _1080p * 329, _1080p * -61, _1080p * -31)
	var_9_0:addElement(var_9_18)

	var_9_0.LevelText = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIText.new()

	var_9_20.id = "PrestigeLevel"

	var_9_20:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_9_20:setText("", 0)
	var_9_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_20:SetAlignment(LUI.Alignment.Center)
	var_9_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 35, _1080p * 329, _1080p * -79, _1080p * -61)
	var_9_0:addElement(var_9_20)

	var_9_0.PrestigeLevel = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIImage.new()

	var_9_22.id = "PrestigeMasterRibbon"

	var_9_22:SetScale(-0.4, 0)
	var_9_22:setImage(RegisterMaterial("ui_icon_prestige_master_01"), 0)
	var_9_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -258, _1080p * 254, _1080p * 59, _1080p * 187)
	var_9_0:addElement(var_9_22)

	var_9_0.PrestigeMasterRibbon = var_9_22

	local function var_9_23()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_23

	local var_9_24
	local var_9_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("Show2", var_9_25)

	local var_9_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("Show2", var_9_26)

	local function var_9_27()
		var_9_12:AnimateSequence("Show2")
		var_9_14:AnimateSequence("Show2")
	end

	var_9_0._sequences.Show2 = var_9_27

	local var_9_28
	local var_9_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("Show3", var_9_29)

	local var_9_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("Show3", var_9_30)

	local function var_9_31()
		var_9_12:AnimateSequence("Show3")
		var_9_14:AnimateSequence("Show3")
	end

	var_9_0._sequences.Show3 = var_9_31

	local var_9_32
	local var_9_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("Show1", var_9_33)

	local function var_9_34()
		var_9_14:AnimateSequence("Show1")
	end

	var_9_0._sequences.Show1 = var_9_34

	local var_9_35
	local var_9_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ShowBlueprint", var_9_36)

	local function var_9_37()
		var_9_8:AnimateSequence("ShowBlueprint")
	end

	var_9_0._sequences.ShowBlueprint = var_9_37

	local var_9_38
	local var_9_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.ItemContainer.Background
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.ItemContainer.BorderBacker
		}
	}

	var_9_6:RegisterAnimationSequence("PastSeason", var_9_39)

	local var_9_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("PastSeason", var_9_40)

	local var_9_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("PastSeason", var_9_41)

	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("PastSeason", var_9_42)

	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("PastSeason", var_9_43)

	local var_9_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -67
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -71
		}
	}

	var_9_16:RegisterAnimationSequence("PastSeason", var_9_44)

	local var_9_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		}
	}

	var_9_18:RegisterAnimationSequence("PastSeason", var_9_45)

	local var_9_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -41
		}
	}

	var_9_20:RegisterAnimationSequence("PastSeason", var_9_46)

	local var_9_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("PastSeason", var_9_47)

	local function var_9_48()
		var_9_6:AnimateSequence("PastSeason")
		var_9_8:AnimateSequence("PastSeason")
		var_9_10:AnimateSequence("PastSeason")
		var_9_12:AnimateSequence("PastSeason")
		var_9_14:AnimateSequence("PastSeason")
		var_9_16:AnimateSequence("PastSeason")
		var_9_18:AnimateSequence("PastSeason")
		var_9_20:AnimateSequence("PastSeason")
		var_9_22:AnimateSequence("PastSeason")
	end

	var_9_0._sequences.PastSeason = var_9_48

	local var_9_49
	local var_9_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -122
		}
	}

	var_9_4:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_50)

	local var_9_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_51)

	local var_9_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_52)

	local var_9_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 117
		}
	}

	var_9_10:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_53)

	local var_9_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 245
		}
	}

	var_9_12:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_54)

	local var_9_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 142
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 242
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_55)

	local var_9_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_56)

	local var_9_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_57)

	local var_9_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 172
		}
	}

	var_9_22:RegisterAnimationSequence("CurrentSeasonPrestige", var_9_59)

	local function var_9_60()
		var_9_4:AnimateSequence("CurrentSeasonPrestige")
		var_9_6:AnimateSequence("CurrentSeasonPrestige")
		var_9_8:AnimateSequence("CurrentSeasonPrestige")
		var_9_10:AnimateSequence("CurrentSeasonPrestige")
		var_9_12:AnimateSequence("CurrentSeasonPrestige")
		var_9_14:AnimateSequence("CurrentSeasonPrestige")
		var_9_16:AnimateSequence("CurrentSeasonPrestige")
		var_9_18:AnimateSequence("CurrentSeasonPrestige")
		var_9_20:AnimateSequence("CurrentSeasonPrestige")
		var_9_22:AnimateSequence("CurrentSeasonPrestige")
	end

	var_9_0._sequences.CurrentSeasonPrestige = var_9_60

	local var_9_61
	local var_9_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_62)

	local var_9_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 253
		}
	}

	var_9_10:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_63)

	local var_9_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 281
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_9_12:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_64)

	local var_9_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_9_14:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_65)

	local var_9_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_66)

	local var_9_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_67)

	local var_9_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_68)

	local var_9_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("CurrentSeasonWeaponPreview", var_9_69)

	local function var_9_70()
		var_9_8:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_10:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_12:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_14:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_16:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_18:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_20:AnimateSequence("CurrentSeasonWeaponPreview")
		var_9_22:AnimateSequence("CurrentSeasonWeaponPreview")
	end

	var_9_0._sequences.CurrentSeasonWeaponPreview = var_9_70

	local var_9_71
	local var_9_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_72)

	local var_9_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 253
		}
	}

	var_9_10:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_73)

	local var_9_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_9_12:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_74)

	local var_9_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_9_14:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_75)

	local var_9_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_76)

	local var_9_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_77)

	local var_9_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_78)

	local var_9_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("CurrentSeasonPrestigeMaster", var_9_79)

	local function var_9_80()
		var_9_8:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_10:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_12:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_14:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_16:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_18:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_20:AnimateSequence("CurrentSeasonPrestigeMaster")
		var_9_22:AnimateSequence("CurrentSeasonPrestigeMaster")
	end

	var_9_0._sequences.CurrentSeasonPrestigeMaster = var_9_80

	local var_9_81
	local var_9_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_82)

	local var_9_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_83)

	local var_9_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 109
		}
	}

	var_9_10:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_84)

	local var_9_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_9_12:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_85)

	local var_9_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_9_14:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_86)

	local var_9_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_87)

	local var_9_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_88)

	local var_9_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_89)

	local var_9_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("CurrentSeasonBetweenPrestigeMaster", var_9_90)

	local function var_9_91()
		var_9_6:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_8:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_10:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_12:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_14:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_16:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_18:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_20:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
		var_9_22:AnimateSequence("CurrentSeasonBetweenPrestigeMaster")
	end

	var_9_0._sequences.CurrentSeasonBetweenPrestigeMaster = var_9_91

	var_0_5(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("PrestigeRewardContainer", PrestigeRewardContainer)
LockTable(_M)
