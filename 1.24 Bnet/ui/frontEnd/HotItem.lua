module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Banner:SetText(Engine.CBBHFCGDIC("MENU/HOT_ITEM"))
	arg_1_0.Banner:PlayGlint()
	ACTIONS.AnimateSequence(arg_1_0.Banner, "HotVariant")
end

function HotItem(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_2_0.id = "HotItem"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Fire"

	var_2_4:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -40, _1080p * 40)
	var_2_0:addElement(var_2_4)

	var_2_0.Fire = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "Banner"

	var_2_6.LowerGlow.Glow:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_2_6.UpperGlow.Glow:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_2_6.FreeBanner:SetRGBFromTable(SWATCHES.Store.HotItemBase, 0)
	var_2_6.CenterOut:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_2_6.FreeText:SetRGBFromTable(SWATCHES.Store.HotItemText, 0)
	var_2_6.LowerLine:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_2_6.UpperLine:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_2_6.Highlight:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam, 0)
	var_2_6.InstantBonus:SetRGBFromTable(SWATCHES.Recharge.RechargeMedium, 0)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * 3, _1080p * 27)
	var_2_0:addElement(var_2_6)

	var_2_0.Banner = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("HotItem", HotItem)
LockTable(_M)
