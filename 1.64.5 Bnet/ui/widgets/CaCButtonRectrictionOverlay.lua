module(..., package.seeall)

function CaCButtonRectrictionOverlay(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 304 * _1080p, 0, 166 * _1080p)

	var_1_0.id = "CaCButtonRectrictionOverlay"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Icon"

	var_1_4:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_1_4:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -26, _1080p * 26)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local var_1_5

	if Engine.EAIICIFIFA() then
		var_1_5 = LUI.UIImage.new()
		var_1_5.id = "IconCP"

		var_1_5:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
		var_1_5:SetScale(0.4, 0)
		var_1_5:setImage(RegisterMaterial("icon_lock"), 0)
		var_1_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16)
		var_1_0:addElement(var_1_5)

		var_1_0.IconCP = var_1_5
	end

	if Engine.EAIICIFIFA() then
		local var_1_6 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("DefaultSequence", var_1_6)
	end

	local function var_1_7()
		if Engine.EAIICIFIFA() then
			var_1_5:AnimateSequence("DefaultSequence")
		end
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_9

	local var_1_10 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_11

	local var_1_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("CPLock", var_1_12)

	if Engine.EAIICIFIFA() then
		local var_1_13 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("CPLock", var_1_13)
	end

	local function var_1_14()
		var_1_4:AnimateSequence("CPLock")

		if Engine.EAIICIFIFA() then
			var_1_5:AnimateSequence("CPLock")
		end
	end

	var_1_0._sequences.CPLock = var_1_14

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	if CONDITIONS.IsThirdGameMode(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "CPLock")
	end

	return var_1_0
end

MenuBuilder.registerType("CaCButtonRectrictionOverlay", CaCButtonRectrictionOverlay)
LockTable(_M)
