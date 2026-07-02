module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_1 = LOOT.HideLootBreadcrumbsCondition(arg_1_3) and 0 or arg_1_1

	if arg_1_2 then
		arg_1_0:SetAlpha(arg_1_1, arg_1_2)
	else
		arg_1_0:SetAlpha(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if LOOT.HideLootBreadcrumbsCondition(arg_2_3) then
		return
	end

	local var_2_0 = false

	if arg_2_2 and arg_2_2 > 0 then
		if LOOT.IsBundle(arg_2_2) then
			var_2_0 = not STORE.HasSeenItem(arg_2_1, arg_2_2)
		else
			var_2_0 = Loot.HDJCADADF(arg_2_1, arg_2_2)
		end
	end

	arg_2_0:UpdateAlpha(var_2_0 and 1 or 0)

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if LOOT.HideLootBreadcrumbsCondition(arg_3_3) then
		return
	end

	local var_3_0 = false
	local var_3_1 = false

	if arg_3_2 and arg_3_2 > 0 then
		var_3_1 = LOOT.IsBundle(arg_3_2)

		if var_3_1 then
			var_3_0 = not STORE.HasSeenItem(arg_3_1, arg_3_2)
		else
			var_3_0 = Loot.HDJCADADF(arg_3_1, arg_3_2)
		end
	end

	if var_3_0 then
		arg_3_0:SetAlpha(0)

		if var_3_1 then
			STORE.MarkItemSeen(arg_3_1, arg_3_2)
		else
			Loot.BCAACADBEA(arg_3_1, arg_3_2)
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateAlpha = var_0_0
	arg_4_0.UpdateBreadcrumbByID = var_0_1
	arg_4_0.ClearBreadcrumbByID = var_0_2
end

function NewItemSmallIcon(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 8 * _1080p, 0, 8 * _1080p)

	var_5_0.id = "NewItemSmallIcon"
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

	var_5_4.id = "DotImage"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.newIndicator, 0)
	var_5_4:SetPixelGridEnabled(true)
	var_5_4:SetPixelGridContrast(0.2, 0)
	var_5_4:SetPixelGridBlockWidth(1, 0)
	var_5_4:SetPixelGridBlockHeight(1, 0)
	var_5_4:SetPixelGridGutterWidth(1, 0)
	var_5_4:SetPixelGridGutterHeight(1, 0)
	var_5_4:setImage(RegisterMaterial("icon_new_pulse"), 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10)
	var_5_0:addElement(var_5_4)

	var_5_0.DotImage = var_5_4

	local var_5_5
	local var_5_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_new_pulse")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_5_4:RegisterAnimationSequence("DefaultSequence", var_5_6)

	local function var_5_7()
		var_5_4:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_7

	local var_5_8
	local var_5_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_new_store_pulse")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_4:RegisterAnimationSequence("Store", var_5_9)

	local function var_5_10()
		var_5_4:AnimateSequence("Store")
	end

	var_5_0._sequences.Store = var_5_10

	var_0_3(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("NewItemSmallIcon", NewItemSmallIcon)
LockTable(_M)
