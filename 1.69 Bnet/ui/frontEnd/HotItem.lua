module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Banner:SetText(Engine.CBBHFCGDIC("STORE/X_PERCENT_OFF", tostring(arg_1_1)))
end

local function var_0_1(arg_2_0)
	arg_2_0.Banner:SetText(Engine.CBBHFCGDIC("MENU/HOT_ITEM"))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupDiscountPercentage = var_0_0
	arg_3_0.SetupOnSaleText = var_0_1

	arg_3_0.Banner:PlayGlint()
	ACTIONS.AnimateSequence(arg_3_0.Banner, "HotVariant")
end

function HotItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p)

	var_4_0.id = "HotItem"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Fire"

	var_4_4:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -125, _1080p * 75)
	var_4_0:addElement(var_4_4)

	var_4_0.Fire = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Banner"

	var_4_6.LowerGlow.Glow:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_4_6.UpperGlow.Glow:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_4_6.FreeBanner:SetRGBFromTable(SWATCHES.Store.HotItemBase, 0)
	var_4_6.CenterOut:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_4_6.FreeText:SetRGBFromTable(SWATCHES.Store.HotItemText, 0)
	var_4_6.LowerLine:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_4_6.UpperLine:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_4_6.Highlight:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam, 0)
	var_4_6.InstantBonus:SetRGBFromTable(SWATCHES.Recharge.RechargeMedium, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -84, _1080p * 84, _1080p * 61, _1080p * 100)
	var_4_0:addElement(var_4_6)

	var_4_0.Banner = var_4_6

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("HotItem", HotItem)
LockTable(_M)
