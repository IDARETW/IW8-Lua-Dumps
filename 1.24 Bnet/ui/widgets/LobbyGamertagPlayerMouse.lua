module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().displayRank:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			ACTIONS.AnimateSequence(arg_1_0, PROGRESSION.IsElderRank(tonumber(var_2_0)) and "ElderRank" or "StandardRank")
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "displayRank", var_1_0)
end

function LobbyGamertagPlayerMouse(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "LobbyGamertagPlayerMouse"
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

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TextureLayer"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_3_6:SetAlpha(0.3, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.8, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.TextureLayer = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Gradient"

	var_3_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_8:SetAlpha(0.3, 0)
	var_3_8:SetPixelGridEnabled(true)
	var_3_8:SetPixelGridContrast(0.2, 0)
	var_3_8:SetPixelGridBlockWidth(2, 0)
	var_3_8:SetPixelGridBlockHeight(2, 0)
	var_3_8:SetPixelGridGutterWidth(1, 0)
	var_3_8:SetPixelGridGutterHeight(1, 0)
	var_3_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Gradient = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Emblem"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 93, _1080p * 5, _1080p * 95)

	local function var_3_11()
		local var_4_0 = var_3_0:GetDataSource().emblem:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_10:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	var_3_10:SubscribeToModelThroughElement(var_3_0, "emblem", var_3_11)
	var_3_0:addElement(var_3_10)

	var_3_0.Emblem = var_3_10

	local var_3_12
	local var_3_13 = LUI.UIImage.new()

	var_3_13.id = "PlayerCard"

	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 455, _1080p * 5, _1080p * 95)

	local function var_3_14()
		local var_5_0 = var_3_0:GetDataSource().background:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_13:setImage(RegisterMaterial(var_5_0), 0)
		end
	end

	var_3_13:SubscribeToModelThroughElement(var_3_0, "background", var_3_14)
	var_3_0:addElement(var_3_13)

	var_3_0.PlayerCard = var_3_13

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "RankIcon"

	var_3_16:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 457, _1080p * 517, _1080p * 5, _1080p * 65)

	local function var_3_17()
		local var_6_0 = var_3_0:GetDataSource().rankIcon:GetValue(var_3_1)

		if var_6_0 ~= nil then
			var_3_16:setImage(RegisterMaterial(var_6_0), 0)
		end
	end

	var_3_16:SubscribeToModelThroughElement(var_3_0, "rankIcon", var_3_17)
	var_3_0:addElement(var_3_16)

	var_3_0.RankIcon = var_3_16

	local var_3_18
	local var_3_19 = LUI.UIText.new()

	var_3_19.id = "Rank"

	var_3_19:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_3_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_19:SetAlignment(LUI.Alignment.Center)
	var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 457, _1080p * 517, _1080p * 65, _1080p * 95)

	local function var_3_20()
		local var_7_0 = var_3_0:GetDataSource().displayRank:GetValue(var_3_1)

		if var_7_0 ~= nil then
			var_3_19:setText(var_7_0, 0)
		end
	end

	var_3_19:SubscribeToModelThroughElement(var_3_0, "displayRank", var_3_20)
	var_3_0:addElement(var_3_19)

	var_3_0.Rank = var_3_19

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "HighlightBottom"

	var_3_22:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 520, _1080p * -2, 0)
	var_3_0:addElement(var_3_22)

	var_3_0.HighlightBottom = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "HighlightTop"

	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 520, 0, _1080p * 2)
	var_3_0:addElement(var_3_24)

	var_3_0.HighlightTop = var_3_24

	local function var_3_25()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_25

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_3_19:RegisterAnimationSequence("ElderRank", var_3_26)

	local function var_3_27()
		var_3_19:AnimateSequence("ElderRank")
	end

	var_3_0._sequences.ElderRank = var_3_27

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.Default
		}
	}

	var_3_19:RegisterAnimationSequence("StandardRank", var_3_28)

	local function var_3_29()
		var_3_19:AnimateSequence("StandardRank")
	end

	var_3_0._sequences.StandardRank = var_3_29

	local var_3_30 = {
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

	var_3_4:RegisterAnimationSequence("Show", var_3_30)

	local var_3_31 = {
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

	var_3_6:RegisterAnimationSequence("Show", var_3_31)

	local var_3_32 = {
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

	var_3_8:RegisterAnimationSequence("Show", var_3_32)

	local var_3_33 = {
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

	var_3_10:RegisterAnimationSequence("Show", var_3_33)

	local var_3_34 = {
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

	var_3_13:RegisterAnimationSequence("Show", var_3_34)

	local var_3_35 = {
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

	var_3_16:RegisterAnimationSequence("Show", var_3_35)

	local var_3_36 = {
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

	var_3_19:RegisterAnimationSequence("Show", var_3_36)

	local var_3_37 = {
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

	var_3_22:RegisterAnimationSequence("Show", var_3_37)

	local var_3_38 = {
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

	var_3_24:RegisterAnimationSequence("Show", var_3_38)

	local function var_3_39()
		var_3_4:AnimateSequence("Show")
		var_3_6:AnimateSequence("Show")
		var_3_8:AnimateSequence("Show")
		var_3_10:AnimateSequence("Show")
		var_3_13:AnimateSequence("Show")
		var_3_16:AnimateSequence("Show")
		var_3_19:AnimateSequence("Show")
		var_3_22:AnimateSequence("Show")
		var_3_24:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_39

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyGamertagPlayerMouse", LobbyGamertagPlayerMouse)
LockTable(_M)
