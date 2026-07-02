module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "rank", function()
		local var_2_0 = tonumber(arg_1_0:GetDataSource().rank:GetValue(arg_1_1))
		local var_2_1 = tonumber(arg_1_0:GetDataSource().prestige:GetValue(arg_1_1))

		if var_2_0 and var_2_1 then
			local var_2_2 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_2_0,
				_prestigeLevel = var_2_1
			})

			arg_1_0.Rank:setText(var_2_2._rankDisplay)
			arg_1_0.RankIcon:setImage(RegisterMaterial(var_2_2._rankIcon))
			ACTIONS.AnimateSequence(arg_1_0, var_2_2._isUsingSeasonalRank and "ElderRank" or "StandardRank")
		end
	end)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "emblem", function(arg_3_0)
		local var_3_0 = tostring(DataModel.JJEHAEBDF(arg_3_0))

		if var_3_0 and var_3_0 ~= "" then
			arg_1_0.Emblem:setImage(RegisterMaterial(var_3_0))
		end
	end)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "background", function(arg_4_0)
		local var_4_0 = tostring(DataModel.JJEHAEBDF(arg_4_0))

		if var_4_0 and var_4_0 ~= "" then
			arg_1_0.PlayerCard:setImage(RegisterMaterial(var_4_0))
		end
	end)
end

function LobbyGamertagPlayerMouse(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 100 * _1080p)

	var_5_0.id = "LobbyGamertagPlayerMouse"
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

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "TextureLayer"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_5_6:SetAlpha(0.3, 0)
	var_5_6:SetPixelGridEnabled(true)
	var_5_6:SetPixelGridContrast(0.8, 0)
	var_5_6:SetPixelGridBlockWidth(2, 0)
	var_5_6:SetPixelGridBlockHeight(2, 0)
	var_5_6:SetPixelGridGutterWidth(1, 0)
	var_5_6:SetPixelGridGutterHeight(1, 0)
	var_5_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.TextureLayer = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Gradient"

	var_5_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_8:SetAlpha(0.3, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.2, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.Gradient = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Emblem"

	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 93, _1080p * 5, _1080p * 95)
	var_5_0:addElement(var_5_10)

	var_5_0.Emblem = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "PlayerCard"

	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 455, _1080p * 5, _1080p * 95)
	var_5_0:addElement(var_5_12)

	var_5_0.PlayerCard = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "RankIcon"

	var_5_14:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 457, _1080p * 517, _1080p * 5, _1080p * 65)
	var_5_0:addElement(var_5_14)

	var_5_0.RankIcon = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIText.new()

	var_5_16.id = "Rank"

	var_5_16:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_16:SetAlignment(LUI.Alignment.Center)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 457, _1080p * 517, _1080p * 65, _1080p * 95)
	var_5_0:addElement(var_5_16)

	var_5_0.Rank = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "HighlightBottom"

	var_5_18:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 520, _1080p * -2, 0)
	var_5_0:addElement(var_5_18)

	var_5_0.HighlightBottom = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "HighlightTop"

	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 520, 0, _1080p * 2)
	var_5_0:addElement(var_5_20)

	var_5_0.HighlightTop = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_5_16:RegisterAnimationSequence("ElderRank", var_5_23)

	local function var_5_24()
		var_5_16:AnimateSequence("ElderRank")
	end

	var_5_0._sequences.ElderRank = var_5_24

	local var_5_25
	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.Default
		}
	}

	var_5_16:RegisterAnimationSequence("StandardRank", var_5_26)

	local function var_5_27()
		var_5_16:AnimateSequence("StandardRank")
	end

	var_5_0._sequences.StandardRank = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Show", var_5_29)

	local var_5_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Show", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Show", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Show", var_5_32)

	local var_5_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Show", var_5_33)

	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Show", var_5_34)

	local var_5_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Show", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Show", var_5_36)

	local var_5_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Show", var_5_37)

	local function var_5_38()
		var_5_4:AnimateSequence("Show")
		var_5_6:AnimateSequence("Show")
		var_5_8:AnimateSequence("Show")
		var_5_10:AnimateSequence("Show")
		var_5_12:AnimateSequence("Show")
		var_5_14:AnimateSequence("Show")
		var_5_16:AnimateSequence("Show")
		var_5_18:AnimateSequence("Show")
		var_5_20:AnimateSequence("Show")
	end

	var_5_0._sequences.Show = var_5_38

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LobbyGamertagPlayerMouse", LobbyGamertagPlayerMouse)
LockTable(_M)
