module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.RankIcon)
	assert(arg_1_0.Progress)

	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("retroT9")
	end

	local function var_1_1()
		if Engine.DDJFBBJAIG() then
			return Engine.DBEJJAFIAI(arg_1_1)
		else
			return Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0)
		end

		return false
	end

	local function var_1_2(arg_3_0)
		local var_3_0 = tostring(arg_3_0)
		local var_3_1 = {}

		for iter_3_0 = 1, #var_1_0 do
			local var_3_2 = tonumber(string.sub(var_3_0, iter_3_0, iter_3_0))

			if var_3_2 then
				table.insert(var_3_1, var_3_2)
			end
		end

		for iter_3_1 = #var_1_0, 1, -1 do
			local var_3_3 = #var_3_1 + iter_3_1 - #var_1_0

			if var_3_3 > 0 and var_3_1[var_3_3] ~= nil then
				var_1_0[iter_3_1]:SetAlpha(1)
				var_1_0[iter_3_1]:SetCounterDigit(var_3_1[var_3_3])
			else
				var_1_0[iter_3_1]:SetAlpha(0)
			end
		end
	end

	local var_1_3

	local function var_1_4()
		if var_1_1() then
			ACTIONS.AnimateSequence(arg_1_0, "MilitaryRank")

			local var_4_0 = PROGRESSION.GetPlayerRank(arg_1_1) + 1
			local var_4_1 = RegisterMaterial(PROGRESSION.GetPlayerRankIcon(arg_1_1))
			local var_4_2 = 0

			if not Engine.DDJFBBJAIG() and CONDITIONS.InKillCam(arg_1_1) then
				local var_4_3 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id"):GetValue(arg_1_1)

				var_4_0 = Game.BAJEAFFCGG(var_4_3)
				var_4_1 = RegisterMaterial(Game.HGEFIIJID(var_4_3))
				var_4_2 = 0
			elseif PROGRESSION.GetPlayerIsInSeasonalProgression(arg_1_1) then
				var_4_2 = PROGRESSION.GetPlayerSeasonRankPercentage(arg_1_1)
			else
				var_4_2 = PROGRESSION.GetPlayerMilitaryRankPercentage(arg_1_1)
			end

			if var_4_2 >= 0.75 then
				ACTIONS.AnimateSequence(arg_1_0.Progress, "Progress75")
			elseif var_4_2 >= 0.5 then
				ACTIONS.AnimateSequence(arg_1_0.Progress, "Progress50")
			elseif var_4_2 >= 0.25 then
				ACTIONS.AnimateSequence(arg_1_0.Progress, "Progress25")
			else
				ACTIONS.AnimateSequence(arg_1_0.Progress, "Progress0")
			end

			arg_1_0.RankIcon:setImage(var_4_1)
			var_1_2(var_4_0)
		else
			ACTIONS.AnimateSequence(arg_1_0, "Offline")
		end

		arg_1_0:Wait(var_0_0).onComplete = var_1_4
	end

	var_1_4()

	if not Engine.DDJFBBJAIG() then
		local var_1_5 = DataSources.inGame.player.inKillCam
		local var_1_6 = LUI.DataSourceInControllerModel.new("cg.spectating.isSpectating")

		local function var_1_7()
			if CONDITIONS.IsSpectating(arg_1_1) and not CONDITIONS.InKillCam(arg_1_1) then
				ACTIONS.AnimateSequence(arg_1_0, "Offline")
			else
				var_1_4()
			end
		end

		arg_1_0:SubscribeToModel(var_1_5:GetModel(arg_1_1), var_1_7)
		arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), var_1_7)
	end
end

function WatchRankT9(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_6_0.id = "WatchRankT9"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Background"

	var_6_4:SetRGBFromInt(6182981, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -3, _1080p * -3)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "OfflineMessage"

	var_6_6:SetRGBFromInt(0, 0)
	var_6_6:SetAlpha(0, 0)
	var_6_6:SetScale(0.5, 0)
	var_6_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE")), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Center)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -18, _1080p * 18)
	var_6_0:addElement(var_6_6)

	var_6_0.OfflineMessage = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("WatchRankT9Progress", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Progress"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 32, _1080p * 228, _1080p * -123, _1080p * -67)
	var_6_0:addElement(var_6_8)

	var_6_0.Progress = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "RankIcon"

	var_6_10:SetColorOp(COLOR_OP.saturation, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -123, _1080p * 123, _1080p * -149, _1080p * 97)
	var_6_0:addElement(var_6_10)

	var_6_0.RankIcon = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Digit1"

	var_6_12:SetRGBFromInt(0, 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -224, _1080p * -176, _1080p * -123, _1080p * -63)
	var_6_0:addElement(var_6_12)

	var_6_0.Digit1 = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Digit2"

	var_6_14:SetRGBFromInt(0, 0)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -175, _1080p * -127, _1080p * -123, _1080p * -63)
	var_6_0:addElement(var_6_14)

	var_6_0.Digit2 = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "Digit3"

	var_6_16:SetRGBFromInt(0, 0)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -126, _1080p * -78, _1080p * -123, _1080p * -63)
	var_6_0:addElement(var_6_16)

	var_6_0.Digit3 = var_6_16

	local var_6_17
	local var_6_18 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_18.id = "Digit4"

	var_6_18:SetRGBFromInt(0, 0)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -77, _1080p * -29, _1080p * -123, _1080p * -63)
	var_6_0:addElement(var_6_18)

	var_6_0.Digit4 = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIText.new()

	var_6_20.id = "RankLabel"

	var_6_20:SetRGBFromInt(0, 0)
	var_6_20:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/RANK")), 0)
	var_6_20:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_6_20:SetWordWrap(false)
	var_6_20:SetAlignment(LUI.Alignment.Left)
	var_6_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -220, _1080p * 20, _1080p * -177, _1080p * -141)
	var_6_0:addElement(var_6_20)

	var_6_0.RankLabel = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIImage.new()

	var_6_22.id = "pipUpperRight"

	var_6_22:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_22:SetZRotation(25, 0)
	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 464, _1080p * 489, _1080p * 157, _1080p * 162)
	var_6_0:addElement(var_6_22)

	var_6_0.pipUpperRight = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIImage.new()

	var_6_24.id = "pipUpperLeft"

	var_6_24:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_24:SetZRotation(-25, 0)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 45, _1080p * 157, _1080p * 162)
	var_6_0:addElement(var_6_24)

	var_6_0.pipUpperLeft = var_6_24

	local var_6_25
	local var_6_26 = LUI.UIImage.new()

	var_6_26.id = "pipLowerRight"

	var_6_26:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_26:SetZRotation(-25, 0)
	var_6_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 464, _1080p * 489, _1080p * 290, _1080p * 295)
	var_6_0:addElement(var_6_26)

	var_6_0.pipLowerRight = var_6_26

	local var_6_27
	local var_6_28 = LUI.UIImage.new()

	var_6_28.id = "pipLowerLeft"

	var_6_28:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_28:SetZRotation(25, 0)
	var_6_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 45, _1080p * 290, _1080p * 295)
	var_6_0:addElement(var_6_28)

	var_6_0.pipLowerLeft = var_6_28

	local function var_6_29()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_6_6:RegisterAnimationSequence("Offline", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Offline", var_6_32)

	local var_6_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Offline", var_6_33)

	local var_6_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Offline", var_6_34)

	local var_6_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Offline", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Offline", var_6_36)

	local var_6_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("Offline", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("Offline", var_6_38)

	local function var_6_39()
		var_6_6:AnimateSequence("Offline")
		var_6_8:AnimateSequence("Offline")
		var_6_10:AnimateSequence("Offline")
		var_6_12:AnimateSequence("Offline")
		var_6_14:AnimateSequence("Offline")
		var_6_16:AnimateSequence("Offline")
		var_6_18:AnimateSequence("Offline")
		var_6_20:AnimateSequence("Offline")
	end

	var_6_0._sequences.Offline = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("MilitaryRank", var_6_41)

	local var_6_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("MilitaryRank", var_6_42)

	local var_6_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("MilitaryRank", var_6_43)

	local var_6_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("MilitaryRank", var_6_44)

	local var_6_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("MilitaryRank", var_6_45)

	local var_6_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("MilitaryRank", var_6_46)

	local var_6_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("MilitaryRank", var_6_47)

	local var_6_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("MilitaryRank", var_6_48)

	local function var_6_49()
		var_6_6:AnimateSequence("MilitaryRank")
		var_6_8:AnimateSequence("MilitaryRank")
		var_6_10:AnimateSequence("MilitaryRank")
		var_6_12:AnimateSequence("MilitaryRank")
		var_6_14:AnimateSequence("MilitaryRank")
		var_6_16:AnimateSequence("MilitaryRank")
		var_6_18:AnimateSequence("MilitaryRank")
		var_6_20:AnimateSequence("MilitaryRank")
	end

	var_6_0._sequences.MilitaryRank = var_6_49

	local function var_6_50()
		return
	end

	var_6_0._sequences.Prestige = var_6_50

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WatchRankT9", WatchRankT9)
LockTable(_M)
