module(..., package.seeall)

local var_0_0 = 3
local var_0_1 = {
	PERK_LEVEL_PERCENTS = {
		10,
		20,
		30
	}
}

local function var_0_2(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = arg_1_3 * var_0_0 + arg_1_2

	arg_1_1:DisplayPerkData({
		perkIndex = var_1_0,
		perkPercentData = var_0_1.PERK_LEVEL_PERCENTS
	})
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controlllerIndex = arg_2_1

	arg_2_0.ClanPerksGrid:SetNumChildren(var_0_0)
	arg_2_0.ClanPerksGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		var_0_2(arg_2_0, arg_3_0, arg_3_1, arg_3_2)
	end)
	arg_2_0.ClanPerksGrid:RefreshContent()
end

function ClanPerksWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 450 * _1080p)

	var_4_0.id = "ClanPerksWidget"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "ClanPerkHeader"

	var_4_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PERKS")), 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -486, _1080p * 9, _1080p * 8, _1080p * 58)
	var_4_0:addElement(var_4_4)

	var_4_0.ClanPerkHeader = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Line"

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -14, _1080p * 67, _1080p * 70)
	var_4_0:addElement(var_4_6)

	var_4_0.Line = var_4_6

	local var_4_7
	local var_4_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ClanPerks", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 300,
		rowHeight = _1080p * 350,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_9 = LUI.UIGrid.new(var_4_8)

	var_4_9.id = "ClanPerksGrid"

	var_4_9:setUseStencil(true)
	var_4_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * 87, _1080p * 500)
	var_4_0:addElement(var_4_9)

	var_4_0.ClanPerksGrid = var_4_9

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClanPerksWidget", ClanPerksWidget)
LockTable(_M)
