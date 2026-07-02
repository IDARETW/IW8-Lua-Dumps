module(..., package.seeall)

function FrontendLoadoutButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 60 * _1080p)

	var_1_0.id = "FrontendLoadoutButton"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("SelectLoadoutButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "LoadoutButton"

	var_1_4.Text:setText(ToUpperCase(""), 0)
	var_1_4.Text:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 370, 0, _1080p * 60)
	var_1_0:addElement(var_1_4)

	var_1_0.LoadoutButton = var_1_4

	local var_1_5

	if not CONDITIONS.InFrontend(var_1_0) then
		local var_1_6 = MenuBuilder.BuildRegisteredType("GenericImageButton", {
			controllerIndex = var_1_1
		})

		var_1_6.id = "OptionsButton"

		var_1_6:SetAlpha(0, 0)
		var_1_6.Icon:setImage(RegisterMaterial("icon_chat_settings"), 0)
		var_1_6.ItemName:setText("", 0)
		var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 374, _1080p * 434, 0, _1080p * 60)
		var_1_0:addElement(var_1_6)

		var_1_0.OptionsButton = var_1_6
	end

	local var_1_7

	if not CONDITIONS.IsSystemLink(var_1_0) then
		local var_1_8 = LUI.UIImage.new()

		var_1_8.id = "Star"

		var_1_8:SetAlpha(0, 0)
		var_1_8:setImage(RegisterMaterial("favorite"), 0)
		var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, 0, _1080p * -60, 0, _1080p * 60)
		var_1_0:addElement(var_1_8)

		var_1_0.Star = var_1_8
	end

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "RestrictionWarning"

	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -45, _1080p * -15, _1080p * 15, _1080p * 45)
	var_1_0:addElement(var_1_10)

	var_1_0.RestrictionWarning = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local function var_1_12()
		return
	end

	var_1_0._sequences.ButtonUp = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.ButtonOver = var_1_13

	local function var_1_14()
		return
	end

	var_1_0._sequences.ButtonDisabled = var_1_14

	local function var_1_15()
		return
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("RestrictionOn", var_1_17)

	local function var_1_18()
		var_1_10:AnimateSequence("RestrictionOn")
	end

	var_1_0._sequences.RestrictionOn = var_1_18

	local var_1_19
	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("RestrictionOff", var_1_20)

	local function var_1_21()
		var_1_10:AnimateSequence("RestrictionOff")
	end

	var_1_0._sequences.RestrictionOff = var_1_21

	return var_1_0
end

MenuBuilder.registerType("FrontendLoadoutButton", FrontendLoadoutButton)
LockTable(_M)
