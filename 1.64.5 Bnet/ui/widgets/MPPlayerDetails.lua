module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0._rankHidden = true

	ACTIONS.AnimateSequence(arg_1_0, "HideRank")
end

local function var_0_1(arg_2_0)
	if not arg_2_0._rankHidden then
		local var_2_0 = _1080p * 10
		local var_2_1 = arg_2_0.RankNumber:getLocalRect() + var_2_0
		local var_2_2
		local var_2_3
		local var_2_4
		local var_2_5 = LAYOUT.GetTextWidth(arg_2_0.RankNumber)
		local var_2_6 = LAYOUT.GetTextWidth(arg_2_0.GamerTagLabel)

		arg_2_0.GamerTagLabel:SetLeft(var_2_1 + var_2_5)
		arg_2_0.GamerTagLabel:SetRight(var_2_1 + var_2_5 + var_2_6)

		local var_2_7 = PROGRESSION.GetPlayerProgressionData({
			_controllerIndex = arg_2_0._controllerIndex
		})

		arg_2_0.RankNumber:SetRGBFromTable(var_2_7._prestigeMasterColor)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.RankNumber)
	assert(arg_3_0.RankIcon)

	arg_3_0.UpdateGamerTagPosition = var_0_1
	arg_3_0.HideRankAndProgress = var_0_0
	arg_3_0._rankHidden = false
	arg_3_0._controllerIndex = arg_3_1

	local function var_3_0()
		local var_4_0 = Engine.BAGAFBABEE(arg_3_1)

		if var_4_0 ~= nil then
			arg_3_0.GamerTagLabel:setText(var_4_0)
			arg_3_0:UpdateGamerTagPosition()
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

	local function var_3_3(arg_5_0, arg_5_1)
		local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)

		if var_5_0 and var_5_0.hideRank then
			var_0_0(arg_5_0)
		end

		if arg_5_0._rankHidden then
			return
		end

		local var_5_1 = PROGRESSION.GetPlayerProgressionData({
			_controllerIndex = arg_3_1
		})

		if PROGRESSION.GetPlayerAtMaxRank(arg_3_1) then
			ACTIONS.AnimateSequence(arg_5_0, "Mod4DigitRank")
		end

		ACTIONS.AnimateSequence(arg_5_0, "Progression")
		arg_5_0.RankNumber:setText(var_5_1._rankDisplay)
		arg_5_0:UpdateGamerTagPosition()
		arg_5_0.RankIcon:setImage(RegisterMaterial(var_5_1._rankIcon))

		if arg_5_0.RadialProgress then
			arg_5_0.RadialProgress:SetRGBFromTable(var_5_1._progressionColor)
			arg_5_0.RadialProgress:SetProgress(var_5_1._rankPercentage)
		end
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_3_0, "WZSetup")
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
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 181, _1080p * 486, _1080p * 10, _1080p * 30)
	var_6_0:addElement(var_6_4)

	var_6_0.GamerTagLabel = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "RankNumber"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_6:setText("40", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 140, _1080p * 177, _1080p * 4, _1080p * 36)
	var_6_0:addElement(var_6_6)

	var_6_0.RankNumber = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Backer"

	var_6_8:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_6_8:SetAlpha(0.6, 0)
	var_6_8:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 82, _1080p * 132, _1080p * -7, _1080p * 43)
	var_6_0:addElement(var_6_8)

	var_6_0.Backer = var_6_8

	local var_6_9
	local var_6_10 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_6_1
	}
	local var_6_11 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_6_10)

	var_6_11.id = "RadialProgress"

	var_6_11:SetRGBFromTable(SWATCHES.genericMenu.progressFill, 0)
	var_6_11:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_6_11:SetProgress(0.9)
	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 82, _1080p * 132, _1080p * -7, _1080p * 43)
	var_6_0:addElement(var_6_11)

	var_6_0.RadialProgress = var_6_11

	local var_6_12
	local var_6_13 = LUI.UIImage.new()

	var_6_13.id = "RankIcon"

	var_6_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 86, _1080p * 128, _1080p * -2, _1080p * 38)
	var_6_0:addElement(var_6_13)

	var_6_0.RankIcon = var_6_13

	local var_6_14

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		var_6_14 = MenuBuilder.BuildRegisteredType("Wallet", {
			controllerIndex = var_6_1
		})
		var_6_14.id = "Wallet"

		var_6_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -593, _1080p * -423, 0, _1080p * 40)
		var_6_0:addElement(var_6_14)

		var_6_0.Wallet = var_6_14
	end

	local function var_6_15()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 523
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

	local var_6_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("HideRank", var_6_20)

	local var_6_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_13:RegisterAnimationSequence("HideRank", var_6_21)

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_6_22 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -594
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -4
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -424
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 36
			}
		}

		var_6_14:RegisterAnimationSequence("HideRank", var_6_22)
	end

	local function var_6_23()
		var_6_4:AnimateSequence("HideRank")
		var_6_6:AnimateSequence("HideRank")
		var_6_8:AnimateSequence("HideRank")
		var_6_11:AnimateSequence("HideRank")
		var_6_13:AnimateSequence("HideRank")

		if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
			var_6_14:AnimateSequence("HideRank")
		end
	end

	var_6_0._sequences.HideRank = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ShowRank", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_13:RegisterAnimationSequence("ShowRank", var_6_26)

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_6_27 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("ShowRank", var_6_27)
	end

	local function var_6_28()
		var_6_6:AnimateSequence("ShowRank")
		var_6_13:AnimateSequence("ShowRank")

		if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
			var_6_14:AnimateSequence("ShowRank")
		end
	end

	var_6_0._sequences.ShowRank = var_6_28

	local var_6_29
	local var_6_30 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Progression", var_6_30)

	local var_6_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("Progression", var_6_31)

	local var_6_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_13:RegisterAnimationSequence("Progression", var_6_32)

	local function var_6_33()
		var_6_8:AnimateSequence("Progression")
		var_6_11:AnimateSequence("Progression")
		var_6_13:AnimateSequence("Progression")
	end

	var_6_0._sequences.Progression = var_6_33

	local var_6_34
	local var_6_35 = {
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

	var_6_6:RegisterAnimationSequence("Mod4DigitRank", var_6_35)

	local function var_6_36()
		var_6_6:AnimateSequence("Mod4DigitRank")
	end

	var_6_0._sequences.Mod4DigitRank = var_6_36

	local var_6_37
	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_4:RegisterAnimationSequence("WZSetup", var_6_38)

	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_6:RegisterAnimationSequence("WZSetup", var_6_39)

	local function var_6_40()
		var_6_4:AnimateSequence("WZSetup")
		var_6_6:AnimateSequence("WZSetup")
	end

	var_6_0._sequences.WZSetup = var_6_40

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MPPlayerDetails", MPPlayerDetails)
LockTable(_M)
