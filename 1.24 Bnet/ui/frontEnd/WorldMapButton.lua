module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._mapId = arg_1_2.MapID
	arg_1_0._buttonData = WORLD_MAP.GetTerritoryData(arg_1_0._mapId)

	assert(arg_1_0._buttonData)
	arg_1_0.MapImage:setImage(RegisterMaterial(arg_1_0._buttonData.icon))

	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0:dispatchEventToCurrentMenu({
			name = "update_mission_details",
			data = arg_1_0._buttonData
		})
		ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	end

	local function var_1_1(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonUp")
	end

	arg_1_0:registerEventHandler("button_over", var_1_0)
	arg_1_0:registerEventHandler("button_up", var_1_1)
end

function WorldMapButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_4_0.id = "WorldMapButton"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_4_7 = LUI.UIBorder.new(var_4_6)

	var_4_7.id = "Border"

	var_4_7:SetBorderThicknessLeft(_1080p * 2, 0)
	var_4_7:SetBorderThicknessRight(_1080p * 2, 0)
	var_4_7:SetBorderThicknessTop(_1080p * 2, 0)
	var_4_7:SetBorderThicknessBottom(_1080p * 2, 0)
	var_4_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_4_0:addElement(var_4_7)

	var_4_0.Border = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIImage.new()

	var_4_9.id = "HighlightBottom"

	var_4_9:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_9:SetAlpha(0, 0)
	var_4_9:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 3, _1080p * -3, _1080p * -7, _1080p * -3)
	var_4_0:addElement(var_4_9)

	var_4_0.HighlightBottom = var_4_9

	local var_4_10
	local var_4_11 = LUI.UIImage.new()

	var_4_11.id = "HighlightTop"

	var_4_11:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_11:SetAlpha(0, 0)
	var_4_11:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * 7)
	var_4_0:addElement(var_4_11)

	var_4_0.HighlightTop = var_4_11

	local var_4_12
	local var_4_13 = LUI.UIImage.new()

	var_4_13.id = "Foreground"

	var_4_13:SetRGBFromTable(SWATCHES.HUD.accent, 0)
	var_4_13:SetAlpha(0, 0)
	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_4_0:addElement(var_4_13)

	var_4_0.Foreground = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIImage.new()

	var_4_15.id = "MapImage"

	var_4_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 94, _1080p * 34, _1080p * 94)
	var_4_0:addElement(var_4_15)

	var_4_0.MapImage = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_16

	local var_4_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonOver", var_4_17)

	local var_4_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_11:RegisterAnimationSequence("ButtonOver", var_4_18)

	local var_4_19 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("ButtonOver", var_4_19)

	local function var_4_20()
		var_4_9:AnimateSequence("ButtonOver")
		var_4_11:AnimateSequence("ButtonOver")
		var_4_13:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_20

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonUp", var_4_21)

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_11:RegisterAnimationSequence("ButtonUp", var_4_22)

	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("ButtonUp", var_4_23)

	local function var_4_24()
		var_4_9:AnimateSequence("ButtonUp")
		var_4_11:AnimateSequence("ButtonUp")
		var_4_13:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_24

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WorldMapButton", WorldMapButton)
LockTable(_M)
