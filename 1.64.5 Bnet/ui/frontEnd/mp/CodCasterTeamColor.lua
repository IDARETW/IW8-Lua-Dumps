module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = "CodCasterTeamColorSelector"

	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:getParent().id == var_1_0 and "primary" or "secondary"

		arg_2_0:dispatchEventToCurrentMenu({
			name = "color_selected",
			intColor = arg_1_0.intColor,
			colorToChange = var_2_0
		})
	end)
end

function CodCasterTeamColor(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "CodCasterTeamColor"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "LoadoutItemButtonBackground"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3)
	var_3_0:addElement(var_3_4)

	var_3_0.LoadoutItemButtonBackground = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TeamColor"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 60, 0, _1080p * 60)
	var_3_0:addElement(var_3_6)

	var_3_0.TeamColor = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "ColorLocked"

	var_3_8:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_3_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 47, _1080p * 13, _1080p * 47)
	var_3_0:addElement(var_3_8)

	var_3_0.ColorLocked = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Icon"

	var_3_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_10:SetAlpha(0, 0)
	var_3_10:setImage(RegisterMaterial("cac_equip_ring"), 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 43, _1080p * -2, _1080p * 43, _1080p * -2)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local var_3_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DefaultSequence", var_3_11)

	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("DefaultSequence", var_3_12)

	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("DefaultSequence", var_3_13)

	local function var_3_14()
		var_3_6:AnimateSequence("DefaultSequence")
		var_3_8:AnimateSequence("DefaultSequence")
		var_3_10:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_14

	local var_3_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Selected", var_3_15)

	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_3_10:RegisterAnimationSequence("Selected", var_3_16)

	local function var_3_17()
		var_3_6:AnimateSequence("Selected")
		var_3_10:AnimateSequence("Selected")
	end

	var_3_0._sequences.Selected = var_3_17

	local var_3_18 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_18)

	local var_3_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_19)

	local function var_3_20()
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_20

	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("CodCasterTeamColor", CodCasterTeamColor)
LockTable(_M)
