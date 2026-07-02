module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = BATTLEPASS.GetEmblemGold()

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0.SeasonImg:setImage(RegisterMaterial(var_1_0))
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_1_0.GenericPopupWindow, "WZSetup")
	end
end

function BattlePassPopupWindow(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1710 * _1080p, 0, 802 * _1080p)

	var_2_0.id = "BattlePassPopupWindow"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "SeasonImg"

	var_2_4:SetAlpha(0.15, 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 441, _1080p * 1081, _1080p * -341, _1080p * 299)
	var_2_0:addElement(var_2_4)

	var_2_0.SeasonImg = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "GenericPopupWindow"

	var_2_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_6.PopupBackground:SetAlpha(0.3, 0)
	var_2_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.GenericPopupWindow = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local function var_2_8()
		return
	end

	var_2_0._sequences.Display1 = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.Display2 = var_2_9

	local function var_2_10()
		return
	end

	var_2_0._sequences.Display3 = var_2_10

	local var_2_11
	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -835
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -136
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 383
		}
	}

	var_2_4:RegisterAnimationSequence("VIP", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("VIP")
	end

	var_2_0._sequences.VIP = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassPopupWindow", BattlePassPopupWindow)
LockTable(_M)
