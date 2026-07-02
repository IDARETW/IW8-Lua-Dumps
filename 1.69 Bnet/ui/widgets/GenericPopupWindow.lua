module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_1_0, "WZSetup")
	end
end

function GenericPopupWindow(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1710 * _1080p, 0, 460 * _1080p)

	var_2_0.id = "GenericPopupWindow"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "PopupBackground"

	var_2_4:SetRGBFromTable(SWATCHES.Popups.popupbggradient, 0)
	var_2_4:SetAlpha(0.7, 0)
	var_2_4:SetPixelGridEnabled(true)
	var_2_4:SetPixelGridContrast(0.5, 0)
	var_2_4:SetPixelGridBlockWidth(2, 0)
	var_2_4:SetPixelGridBlockHeight(2, 0)
	var_2_4:SetPixelGridGutterWidth(1, 0)
	var_2_4:SetPixelGridGutterHeight(1, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.PopupBackground = var_2_4

	local var_2_5
	local var_2_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_2_7 = LUI.UIBorder.new(var_2_6)

	var_2_7.id = "CornerTopLeft"

	var_2_7:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_2_7:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_7:SetBorderThicknessBottom(_1080p * 0, 0)
	var_2_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, 0, _1080p * 30)
	var_2_0:addElement(var_2_7)

	var_2_0.CornerTopLeft = var_2_7

	local var_2_8
	local var_2_9 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_2_10 = LUI.UIBorder.new(var_2_9)

	var_2_10.id = "CornerTopRight"

	var_2_10:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_2_10:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_10:SetBorderThicknessBottom(_1080p * 0, 0)
	var_2_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 30)
	var_2_0:addElement(var_2_10)

	var_2_0.CornerTopRight = var_2_10

	local var_2_11
	local var_2_12 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_13 = LUI.UIBorder.new(var_2_12)

	var_2_13.id = "CornerBotLeft"

	var_2_13:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_2_13:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_13:SetBorderThicknessTop(_1080p * 0, 0)
	var_2_13:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 30, _1080p * -30, 0)
	var_2_0:addElement(var_2_13)

	var_2_0.CornerBotLeft = var_2_13

	local var_2_14
	local var_2_15 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_16 = LUI.UIBorder.new(var_2_15)

	var_2_16.id = "CornerBotRight"

	var_2_16:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_2_16:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_16:SetBorderThicknessTop(_1080p * 0, 0)
	var_2_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -30, 0, _1080p * -30, 0)
	var_2_0:addElement(var_2_16)

	var_2_0.CornerBotRight = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "TopBorder"

	var_2_18:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_2_18:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_2_0:addElement(var_2_18)

	var_2_0.TopBorder = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIImage.new()

	var_2_20.id = "BotBorder"

	var_2_20:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_2_20:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_2_0:addElement(var_2_20)

	var_2_0.BotBorder = var_2_20

	local var_2_21

	if CONDITIONS.IsMagmaGameMode() then
		local var_2_22 = LUI.UIImage.new()

		var_2_22.id = "PopupBackgroundWZ"

		var_2_22:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
		var_2_22:SetAlpha(0.8, 0)
		var_2_22:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_2_22:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -200, _1080p * 200, 0, 0)
		var_2_0:addElement(var_2_22)

		var_2_0.PopupBackgroundWZ = var_2_22
	end

	local var_2_23

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_2_23 = LUI.UIImage.new()
		var_2_23.id = "BotBorderWZ"

		var_2_23:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
		var_2_23:SetAlpha(0, 0)
		var_2_23:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_2_23:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * 3, _1080p * -1, 0)
		var_2_0:addElement(var_2_23)

		var_2_0.BotBorderWZ = var_2_23
	end

	local var_2_24

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_2_24 = LUI.UIImage.new()
		var_2_24.id = "TopBorderWZ"

		var_2_24:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
		var_2_24:SetAlpha(0, 0)
		var_2_24:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_2_24:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, 0, _1080p * 1)
		var_2_0:addElement(var_2_24)

		var_2_0.TopBorderWZ = var_2_24
	end

	local function var_2_25()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_25

	local var_2_26
	local var_2_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("WZSetup", var_2_27)

	local var_2_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_7:RegisterAnimationSequence("WZSetup", var_2_28)

	local var_2_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("WZSetup", var_2_29)

	local var_2_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_13:RegisterAnimationSequence("WZSetup", var_2_30)

	local var_2_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("WZSetup", var_2_31)

	local var_2_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("WZSetup", var_2_32)

	local var_2_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("WZSetup", var_2_33)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_2_34 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_23:RegisterAnimationSequence("WZSetup", var_2_34)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_2_35 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_24:RegisterAnimationSequence("WZSetup", var_2_35)
	end

	local function var_2_36()
		var_2_4:AnimateSequence("WZSetup")
		var_2_7:AnimateSequence("WZSetup")
		var_2_10:AnimateSequence("WZSetup")
		var_2_13:AnimateSequence("WZSetup")
		var_2_16:AnimateSequence("WZSetup")
		var_2_18:AnimateSequence("WZSetup")
		var_2_20:AnimateSequence("WZSetup")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_2_23:AnimateSequence("WZSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_2_24:AnimateSequence("WZSetup")
		end
	end

	var_2_0._sequences.WZSetup = var_2_36

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GenericPopupWindow", GenericPopupWindow)
LockTable(_M)
