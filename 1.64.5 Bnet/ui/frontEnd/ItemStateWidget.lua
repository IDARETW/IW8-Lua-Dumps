module(..., package.seeall)

function ItemStateWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "ItemStateWidget"
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

	var_1_4.id = "StateBacker"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 136, 0, _1080p * 32)
	var_1_0:addElement(var_1_4)

	var_1_0.StateBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "State"

	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 130, _1080p * 7, _1080p * 25)
	var_1_0:addElement(var_1_6)

	var_1_0.State = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "StateNotch"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, 0, _1080p * 32)
	var_1_0:addElement(var_1_8)

	var_1_0.StateNotch = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_1_4:RegisterAnimationSequence("Equipped", var_1_10)

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_CAPS")
		}
	}

	var_1_6:RegisterAnimationSequence("Equipped", var_1_11)

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_1_8:RegisterAnimationSequence("Equipped", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("Equipped")
		var_1_6:AnimateSequence("Equipped")
		var_1_8:AnimateSequence("Equipped")
	end

	var_1_0._sequences.Equipped = var_1_13

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.border
		}
	}

	var_1_4:RegisterAnimationSequence("Locked", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/LOCKED_CAPS")
		}
	}

	var_1_6:RegisterAnimationSequence("Locked", var_1_15)

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.border
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Locked")
		var_1_6:AnimateSequence("Locked")
		var_1_8:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_17

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.border
		}
	}

	var_1_4:RegisterAnimationSequence("SupplyDrop", var_1_18)

	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SUPPLY_DROP")
		}
	}

	var_1_6:RegisterAnimationSequence("SupplyDrop", var_1_19)

	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.border
		}
	}

	var_1_8:RegisterAnimationSequence("SupplyDrop", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("SupplyDrop")
		var_1_6:AnimateSequence("SupplyDrop")
		var_1_8:AnimateSequence("SupplyDrop")
	end

	var_1_0._sequences.SupplyDrop = var_1_21

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.border
		}
	}

	var_1_4:RegisterAnimationSequence("Purchase", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_CAPS")
		}
	}

	var_1_6:RegisterAnimationSequence("Purchase", var_1_23)

	local var_1_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.border
		}
	}

	var_1_8:RegisterAnimationSequence("Purchase", var_1_24)

	local function var_1_25()
		var_1_4:AnimateSequence("Purchase")
		var_1_6:AnimateSequence("Purchase")
		var_1_8:AnimateSequence("Purchase")
	end

	var_1_0._sequences.Purchase = var_1_25

	return var_1_0
end

MenuBuilder.registerType("ItemStateWidget", ItemStateWidget)
LockTable(_M)
