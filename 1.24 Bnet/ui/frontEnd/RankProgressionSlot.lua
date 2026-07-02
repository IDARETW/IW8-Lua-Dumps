module(..., package.seeall)

local var_0_0 = 1024
local var_0_1 = 24

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CurProgress:SetAnchorsAndPosition(0, 1, 0, 1, 0, (arg_1_2 + 1) * arg_1_0.slotWidth * _1080p, 0, var_0_1 * _1080p)
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.CurRank:SetAnchorsAndPosition(0, 1, 0, 1, arg_2_2 * arg_2_0.slotWidth * _1080p, (arg_2_2 + 1) * arg_2_0.slotWidth * _1080p, 0, var_0_1 * _1080p)
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.maxRank = StringTable.BFHCAIIDA(CSV.progressionItems.file)
	arg_3_0.slotWidth = var_0_0 / arg_3_0.maxRank
	arg_3_0.SetFocusedRankSlot = var_0_3
	arg_3_0.SetRankProgressionSlot = var_0_2

	arg_3_0.Mask:SetAlpha(1)
	arg_3_0.CurRank:SetMask(arg_3_0.Mask)
	arg_3_0.CurProgress:SetMask(arg_3_0.Mask)
	arg_3_0.BG:SetMask(arg_3_0.Mask)
end

function RankProgressionSlot(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1024 * _1080p, 0, 17 * _1080p)

	var_4_0.id = "RankProgressionSlot"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:setUseStencil(true)

	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "BG"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.breadcrumbs, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.BG = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "CurProgress"

	var_4_6:SetRGBFromTable(SWATCHES.HUD.eInkBack, 0)
	var_4_6:SetAlpha(0.75, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -712, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.CurProgress = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "CurRank"

	var_4_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -1005, 0, _1080p * 17)
	var_4_0:addElement(var_4_8)

	var_4_0.CurRank = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Mask"

	var_4_10:SetAlpha(0, 0)
	var_4_10:setImage(RegisterMaterial("progression_slots"), 0)
	var_4_0:addElement(var_4_10)

	var_4_0.Mask = var_4_10

	var_0_4(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("RankProgressionSlot", RankProgressionSlot)
LockTable(_M)
