module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.GamerTagLabel)
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.RankNumber)

	if var_1_0 < var_1_1 then
		var_1_0 = var_1_1
	end

	local var_1_2 = arg_1_0.RankIcon:GetCurrentAnchorsAndPositions().right - arg_1_0.Backer:GetCurrentAnchorsAndPositions().right
	local var_1_3 = 5 * _1080p
	local var_1_4 = var_1_0 + var_1_3
	local var_1_5 = LAYOUT.GetElementWidth(arg_1_0.Backer)

	arg_1_0.Backer:SetRight(-var_1_4)
	arg_1_0.Backer:SetLeft(-var_1_4 - var_1_5)
	arg_1_0.RadialProgress:SetRight(-var_1_4)
	arg_1_0.RadialProgress:SetLeft(-var_1_4 - var_1_5)

	local var_1_6 = LAYOUT.GetElementWidth(arg_1_0.RankIcon)

	arg_1_0.RankIcon:SetRight(-var_1_4 + var_1_2)
	arg_1_0.RankIcon:SetLeft(-var_1_4 - var_1_6 + var_1_2)
	arg_1_0.RankNumber:SetLeft(-var_1_4 + var_1_3 * 2)

	if arg_1_0.Wallet then
		local var_1_7 = 30 * _1080p
		local var_1_8 = arg_1_0.Backer:GetCurrentAnchorsAndPositions().left

		arg_1_0.Wallet:SetRight(var_1_8 - var_1_7)
	end
end

local function var_0_1(arg_2_0)
	arg_2_0._rankHidden = true

	ACTIONS.AnimateSequence(arg_2_0, "HideRank")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.RankNumber)
	assert(arg_3_0.RankIcon)

	arg_3_0.HideRankAndProgress = var_0_1
	arg_3_0._rankHidden = false

	local function var_3_0()
		local var_4_0 = Engine.BAGAFBABEE(arg_3_1)

		if var_4_0 ~= nil then
			arg_3_0.GamerTagLabel:setText(var_4_0)
		end
	end

	var_3_0()

	if Engine.BAHCIEEBFD(arg_3_1) then
		local var_3_1 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Common, CoD.PlayMode.Core)

		if var_3_1 ~= nil then
			local var_3_2 = var_3_1.clanTag

			arg_3_0:SubscribeToModel(var_3_2:GetModel(arg_3_1), var_3_0)
		end
	end

	arg_3_0:addEventHandler("change_active_clan", var_3_0)
	arg_3_0:addEventHandler("change_active_clan_tag_type", var_3_0)

	local function var_3_3()
		if arg_3_0._rankHidden then
			return
		end

		local var_5_0 = PROGRESSION.GetPlayerRankIcon(arg_3_1)

		if var_5_0 and #var_5_0 > 0 then
			arg_3_0.RankIcon:setImage(RegisterMaterial(var_5_0))
		end

		local var_5_1 = arg_3_0.RankIcon:GetAlpha() > 0

		if PROGRESSION.IsElder(arg_3_1) or Dvar.IBEGCHEFE("lui_force_elder_progression_menu") then
			if var_5_1 then
				if PROGRESSION.IsPlayerLifeTimeXPMax(arg_3_1) then
					ACTIONS.AnimateSequence(arg_3_0, "LifeTimeRankMax")
				else
					ACTIONS.AnimateSequence(arg_3_0, "ElderProgression")

					if IsLanguageJapanese() then
						ACTIONS.AnimateSequence(arg_3_0, "ElderJP")
					end
				end
			end

			arg_3_0.GamerTagLabel:SetAlignment(LUI.Alignment.Right)
			arg_3_0.RankNumber:SetAlignment(LUI.Alignment.Left)
			arg_3_0.RankNumber:setText(Engine.CBBHFCGDIC("LUA_MENU/RANK_VALUE", PROGRESSION.GetPlayerRank(arg_3_1) + 1))

			local var_5_2

			if PROGRESSION.IsElder(arg_3_1, true) then
				var_5_2 = tonumber(PROGRESSION.GetSeasonRankPercentage(arg_3_1))
			else
				var_5_2 = tonumber(PROGRESSION.GetRankPercentage(arg_3_1))
			end

			arg_3_0.RadialProgress:SetProgressInC(var_5_2, 0, 0)
			var_0_0(arg_3_0)
		else
			if var_5_1 then
				ACTIONS.AnimateSequence(arg_3_0, "NormalProgression")
			end

			arg_3_0.GamerTagLabel:SetAlignment(LUI.Alignment.Left)
			arg_3_0.RankNumber:SetAlignment(LUI.Alignment.Center)
			arg_3_0.RankNumber:setText(PROGRESSION.GetPlayerRank(arg_3_1) + 1)

			local var_5_3 = tonumber(PROGRESSION.GetRankPercentage(arg_3_1))

			if arg_3_0.BorderlessFillBar then
				arg_3_0.BorderlessFillBar:SetPercent(var_5_3)
			end
		end
	end

	local var_3_4 = "challenges_updated"

	arg_3_0:addAndCallEventHandler(var_3_4, var_3_3)
end

function MPPlayerDetails(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 40 * _1080p)

	var_6_0.id = "MPPlayerDetails"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIText.new()

	var_6_4.id = "GamerTagLabel"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_4:setText("{WWWWW}WWWWWWWWWWWWW#9999999", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_6_4:SetWordWrap(false)
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -300, 0, 0, _1080p * 22)
	var_6_0:addElement(var_6_4)

	var_6_0.GamerTagLabel = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "RankNumber"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Center)
	var_6_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -352, _1080p * -308, 0, _1080p * 36)
	var_6_0:addElement(var_6_6)

	var_6_0.RankNumber = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "RankIcon"

	var_6_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -396, _1080p * -352, 0, _1080p * 44)
	var_6_0:addElement(var_6_8)

	var_6_0.RankIcon = var_6_8

	local var_6_9

	if CONDITIONS.InFrontend(var_6_0) then
		var_6_9 = MenuBuilder.BuildRegisteredType("BorderlessFillBar", {
			controllerIndex = var_6_1
		})
		var_6_9.id = "BorderlessFillBar"

		var_6_9:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -300, 0, _1080p * 27, _1080p * 35)
		var_6_0:addElement(var_6_9)

		var_6_0.BorderlessFillBar = var_6_9
	end

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "Backer"

	var_6_11:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_6_11:SetAlpha(0.6, 0)
	var_6_11:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_6_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -403, _1080p * -345, _1080p * -7, _1080p * 51)
	var_6_0:addElement(var_6_11)

	var_6_0.Backer = var_6_11

	local var_6_12
	local var_6_13 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_6_1
	}
	local var_6_14 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_6_13)

	var_6_14.id = "RadialProgress"

	var_6_14:SetRGBFromTable(SWATCHES.genericMenu.progressFill, 0)
	var_6_14:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_6_14:SetProgress(0.9)
	var_6_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -403, _1080p * -345, _1080p * -7, _1080p * 51)
	var_6_0:addElement(var_6_14)

	var_6_0.RadialProgress = var_6_14

	local var_6_15

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		var_6_15 = MenuBuilder.BuildRegisteredType("Wallet", {
			controllerIndex = var_6_1
		})
		var_6_15.id = "Wallet"

		var_6_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -426, 0, _1080p * 40)
		var_6_0:addElement(var_6_15)

		var_6_0.Wallet = var_6_15
	end

	local function var_6_16()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_16

	local var_6_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_6_4:RegisterAnimationSequence("HideRank", var_6_17)

	local var_6_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("HideRank", var_6_18)

	local var_6_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("HideRank", var_6_19)

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("HideRank", var_6_20)
	end

	local var_6_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("HideRank", var_6_21)

	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("HideRank", var_6_22)

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_6_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_15:RegisterAnimationSequence("HideRank", var_6_23)
	end

	local function var_6_24()
		var_6_4:AnimateSequence("HideRank")
		var_6_6:AnimateSequence("HideRank")
		var_6_8:AnimateSequence("HideRank")

		if CONDITIONS.InFrontend(var_6_0) then
			var_6_9:AnimateSequence("HideRank")
		end

		var_6_11:AnimateSequence("HideRank")
		var_6_14:AnimateSequence("HideRank")

		if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
			var_6_15:AnimateSequence("HideRank")
		end
	end

	var_6_0._sequences.HideRank = var_6_24

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_6_4:RegisterAnimationSequence("ShowRank", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ShowRank", var_6_26)

	local var_6_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShowRank", var_6_27)

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_28 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ShowRank", var_6_28)
	end

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_6_29 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_15:RegisterAnimationSequence("ShowRank", var_6_29)
	end

	local function var_6_30()
		var_6_4:AnimateSequence("ShowRank")
		var_6_6:AnimateSequence("ShowRank")
		var_6_8:AnimateSequence("ShowRank")

		if CONDITIONS.InFrontend(var_6_0) then
			var_6_9:AnimateSequence("ShowRank")
		end

		if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
			var_6_15:AnimateSequence("ShowRank")
		end
	end

	var_6_0._sequences.ShowRank = var_6_30

	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -332
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_4:RegisterAnimationSequence("ElderProgression", var_6_31)

	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -300
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.IGRBonusText
		}
	}

	var_6_6:RegisterAnimationSequence("ElderProgression", var_6_32)

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ElderProgression", var_6_33)
	end

	local var_6_34 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ElderProgression", var_6_34)

	local var_6_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("ElderProgression", var_6_35)

	local function var_6_36()
		var_6_4:AnimateSequence("ElderProgression")
		var_6_6:AnimateSequence("ElderProgression")

		if CONDITIONS.InFrontend(var_6_0) then
			var_6_9:AnimateSequence("ElderProgression")
		end

		var_6_11:AnimateSequence("ElderProgression")
		var_6_14:AnimateSequence("ElderProgression")
	end

	var_6_0._sequences.ElderProgression = var_6_36

	local var_6_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -300
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		}
	}

	var_6_4:RegisterAnimationSequence("NormalProgression", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -352
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -308
		}
	}

	var_6_6:RegisterAnimationSequence("NormalProgression", var_6_38)

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_39 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("NormalProgression", var_6_39)
	end

	local var_6_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("NormalProgression", var_6_40)

	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("NormalProgression", var_6_41)

	local function var_6_42()
		var_6_4:AnimateSequence("NormalProgression")
		var_6_6:AnimateSequence("NormalProgression")

		if CONDITIONS.InFrontend(var_6_0) then
			var_6_9:AnimateSequence("NormalProgression")
		end

		var_6_11:AnimateSequence("NormalProgression")
		var_6_14:AnimateSequence("NormalProgression")
	end

	var_6_0._sequences.NormalProgression = var_6_42

	local var_6_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -332
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_4:RegisterAnimationSequence("LifeTimeRankMax", var_6_43)

	local var_6_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -300
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_6:RegisterAnimationSequence("LifeTimeRankMax", var_6_44)

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("LifeTimeRankMax", var_6_45)
	end

	local var_6_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("LifeTimeRankMax", var_6_46)

	local var_6_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("LifeTimeRankMax", var_6_47)

	local function var_6_48()
		var_6_4:AnimateSequence("LifeTimeRankMax")
		var_6_6:AnimateSequence("LifeTimeRankMax")

		if CONDITIONS.InFrontend(var_6_0) then
			var_6_9:AnimateSequence("LifeTimeRankMax")
		end

		var_6_11:AnimateSequence("LifeTimeRankMax")
		var_6_14:AnimateSequence("LifeTimeRankMax")
	end

	var_6_0._sequences.LifeTimeRankMax = var_6_48

	local var_6_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		}
	}

	var_6_6:RegisterAnimationSequence("ElderJP", var_6_49)

	local function var_6_50()
		var_6_6:AnimateSequence("ElderJP")
	end

	var_6_0._sequences.ElderJP = var_6_50

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MPPlayerDetails", MPPlayerDetails)
LockTable(_M)
