module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = StringTable.BJJBBCJGEJ(CSV.lootFlareData.file, CSV.lootFlareData.cols.ref, arg_1_1)
	local var_1_1 = CSV.ReadRow(CSV.lootFlareData, var_1_0)
	local var_1_2 = {
		image = var_1_1.image,
		rows = tonumber(var_1_1.rows),
		columns = tonumber(var_1_1.columns),
		playbackRate = tonumber(var_1_1.playbackRate),
		endingFrame = tonumber(var_1_1.endingFrame)
	}

	ACTIONS.AnimateSequence(arg_1_0, "ShowFlareSprite")

	function arg_1_0.FlareSprite._onAnimComplete()
		ACTIONS.AnimateSequence(arg_1_0, "HideFlareSprite")
	end

	arg_1_0.FlareSprite:Play(var_1_2)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PlayFlareSprite = var_0_0

	arg_3_0.FlareSprite:SetSpriteBlendMode(arg_3_0.FlareSprite:GetBlendMode())
end

function LootItemCardFlare(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_4_0.id = "LootItemCardFlare"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Flare"

	var_4_4:SetAlpha(0, 0)
	var_4_4:setImage(RegisterMaterial("loot_card_border_flare_highlight_flipbook"), 0)
	var_4_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -296, _1080p * 296)
	var_4_0:addElement(var_4_4)

	var_4_0.Flare = var_4_4

	local var_4_5
	local var_4_6 = {
		columns = 10,
		playMode = 1,
		shouldDisablePlayOnCreation = true,
		playbackRate = 15,
		material = "loot_card_border_flare_rare_t9_",
		endingFrame = 0,
		rows = 4,
		startingFrame = 1,
		controllerIndex = var_4_1
	}
	local var_4_7 = MenuBuilder.BuildRegisteredType("Sprite", var_4_6)

	var_4_7.id = "FlareSprite"

	var_4_7:SetAlpha(0, 0)
	var_4_7:setImage(RegisterMaterial("loot_card_border_flare_rare_t9_"), 0)
	var_4_7:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -37, _1080p * 37)
	var_4_0:addElement(var_4_7)

	var_4_0.FlareSprite = var_4_7

	local function var_4_8()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_8

	local var_4_9
	local var_4_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("StopEffect", var_4_10)

	local var_4_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("StopEffect", var_4_11)

	local function var_4_12()
		var_4_4:AnimateSequence("StopEffect")
		var_4_7:AnimateSequence("StopEffect")
	end

	var_4_0._sequences.StopEffect = var_4_12

	local var_4_13
	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_highlight_flipbook")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -199
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_4_4:RegisterAnimationSequence("BattlePassIntroduction", var_4_14)

	local var_4_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("BattlePassIntroduction", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("BattlePassIntroduction")
		var_4_7:AnimateSequence("BattlePassIntroduction")
	end

	var_4_0._sequences.BattlePassIntroduction = var_4_16

	local var_4_17
	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_highlight_flipbook")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -199
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_4_4:RegisterAnimationSequence("SpecialItemHighlight", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("SpecialItemHighlight", var_4_19)

	local function var_4_20()
		var_4_4:AnimateSequence("SpecialItemHighlight")
		var_4_7:AnimateSequence("SpecialItemHighlight")
	end

	var_4_0._sequences.SpecialItemHighlight = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowFlareSprite", var_4_22)

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("ShowFlareSprite", var_4_23)

	local function var_4_24()
		var_4_4:AnimateSequence("ShowFlareSprite")
		var_4_7:AnimateSequence("ShowFlareSprite")
	end

	var_4_0._sequences.ShowFlareSprite = var_4_24

	local var_4_25
	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("HideFlareSprite", var_4_26)

	local function var_4_27()
		var_4_7:AnimateSequence("HideFlareSprite")
	end

	var_4_0._sequences.HideFlareSprite = var_4_27

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LootItemCardFlare", LootItemCardFlare)
LockTable(_M)
