module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.Star1,
		arg_1_0.Star2,
		arg_1_0.Star3
	}
	local var_1_1 = {
		arg_1_0.Score1,
		arg_1_0.Score2,
		arg_1_0.Score3
	}

	local function var_1_2()
		if CONDITIONS.IsSpecOpsGameType() then
			arg_1_0:SetAlpha(1)

			local var_2_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
			local var_2_1 = CP.GetStarsEarnedForMap(var_2_0, arg_1_1)
			local var_2_2 = CP.GetClassicSpecOpsMissionInfo(var_2_0)

			if #var_2_2.desc > 0 then
				arg_1_0.Description:setText(Engine.CBBHFCGDIC(var_2_2.desc))
			else
				arg_1_0.Description:setText("")
			end

			if not IsSystemLink() then
				for iter_2_0 = 1, #var_1_1 do
					if var_2_2.scoreType == "time" then
						if iter_2_0 == 1 then
							var_1_1[iter_2_0]:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/SUCCEED"))
						else
							local var_2_3 = tonumber(var_2_2["tier" .. iter_2_0]) or 0

							var_1_1[iter_2_0]:setText(Engine.BFBIAHJJFA(var_2_3))
						end
					else
						var_1_1[iter_2_0]:setText("")
					end
				end

				local var_2_4 = LUI.clamp(var_2_1, 0, #var_1_0)

				for iter_2_1 = 1, #var_1_0 do
					if iter_2_1 <= var_2_4 then
						ACTIONS.AnimateSequence(var_1_0[iter_2_1], "On")
					else
						ACTIONS.AnimateSequence(var_1_0[iter_2_1], "Off")
					end
				end
			else
				ACTIONS.AnimateSequence(arg_1_0, "Offline")
			end
		else
			arg_1_0:SetAlpha(0)
		end
	end

	arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.gameType:GetModel(arg_1_1), var_1_2)
	arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.mapName:GetModel(arg_1_1), var_1_2)
end

function SOStarRequirementsSmall(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_3_0.id = "SOStarRequirementsSmall"
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

	var_3_4.id = "GradientStars"

	var_3_4:setImage(RegisterMaterial("gradient_bottom"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.GradientStars = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "OfflineWarning"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/STARS_LOCAL_PLAY_WARNING"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 63, _1080p * 423, _1080p * -47, _1080p * -23)
	var_3_0:addElement(var_3_6)

	var_3_0.OfflineWarning = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "StarIcon"

	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("star_on"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 22, _1080p * 54, _1080p * -53, _1080p * -21)
	var_3_0:addElement(var_3_8)

	var_3_0.StarIcon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Score3"

	var_3_10:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_10:setText("00:00", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 63, _1080p * 223, _1080p * -28, _1080p * -4)
	var_3_0:addElement(var_3_10)

	var_3_0.Score3 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Score2"

	var_3_12:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_12:setText("00:00", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -79, _1080p * 81, _1080p * -28, _1080p * -4)
	var_3_0:addElement(var_3_12)

	var_3_0.Score2 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Score1"

	var_3_14:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_14:setText("00:00", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -223, _1080p * -63, _1080p * -28, _1080p * -4)
	var_3_0:addElement(var_3_14)

	var_3_0.Score1 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "TierDividerRight"

	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 72, _1080p * 73, _1080p * -66, _1080p * -4)
	var_3_0:addElement(var_3_16)

	var_3_0.TierDividerRight = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "TierDividerLeft"

	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -71, _1080p * -70, _1080p * -66, _1080p * -4)
	var_3_0:addElement(var_3_18)

	var_3_0.TierDividerLeft = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("SORewardStar", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "Star3"

	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 123, _1080p * 163, _1080p * -71, _1080p * -31)
	var_3_0:addElement(var_3_20)

	var_3_0.Star3 = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("SORewardStar", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "Star2"

	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -19, _1080p * 21, _1080p * -71, _1080p * -31)
	var_3_0:addElement(var_3_22)

	var_3_0.Star2 = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("SORewardStar", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "Star1"

	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -163, _1080p * -123, _1080p * -71, _1080p * -31)
	var_3_0:addElement(var_3_24)

	var_3_0.Star1 = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIStyledText.new()

	var_3_26.id = "Description"

	var_3_26:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_26:setText("", 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_26:SetAlignment(LUI.Alignment.Left)
	var_3_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_26:SetStartupDelay(1000)
	var_3_26:SetLineHoldTime(400)
	var_3_26:SetAnimMoveTime(150)
	var_3_26:SetAnimMoveSpeed(50)
	var_3_26:SetEndDelay(1000)
	var_3_26:SetCrossfadeTime(400)
	var_3_26:SetFadeInTime(300)
	var_3_26:SetFadeOutTime(300)
	var_3_26:SetMaxVisibleLines(2)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22, _1080p * 418, _1080p * 12, _1080p * 32)
	var_3_0:addElement(var_3_26)

	var_3_0.Description = var_3_26

	local function var_3_27()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_27

	local var_3_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Offline", var_3_28)

	local var_3_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Offline", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -54
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Offline", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -54
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Offline", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -54
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Offline", var_3_32)

	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Offline", var_3_33)

	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Offline", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Offline", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Offline", var_3_36)

	local var_3_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Offline", var_3_37)

	local function var_3_38()
		var_3_6:AnimateSequence("Offline")
		var_3_8:AnimateSequence("Offline")
		var_3_10:AnimateSequence("Offline")
		var_3_12:AnimateSequence("Offline")
		var_3_14:AnimateSequence("Offline")
		var_3_16:AnimateSequence("Offline")
		var_3_18:AnimateSequence("Offline")
		var_3_20:AnimateSequence("Offline")
		var_3_22:AnimateSequence("Offline")
		var_3_24:AnimateSequence("Offline")
	end

	var_3_0._sequences.Offline = var_3_38

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SOStarRequirementsSmall", SOStarRequirementsSmall)
LockTable(_M)
