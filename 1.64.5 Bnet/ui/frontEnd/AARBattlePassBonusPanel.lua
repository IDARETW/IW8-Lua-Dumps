module(..., package.seeall)

local var_0_0 = 300
local var_0_1 = 350
local var_0_2 = 650
local var_0_3 = 300
local var_0_4 = 500
local var_0_5 = -0.4
local var_0_6 = 0.4

local function var_0_7(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = arg_1_2 - arg_1_0.initIndex
	local var_1_1 = var_0_1 - var_0_0 * var_1_0
	local var_1_2 = var_1_1 + var_0_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("AARCommendationItem", {
		controllerIndex = arg_1_1
	})

	var_1_4.id = "AARBonusWidget"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_1_1, _1080p * var_1_2, _1080p * 50, _1080p * 350)
	var_1_4.Icon:setImage(RegisterMaterial(arg_1_3.icon))

	if arg_1_3.color then
		var_1_4.Icon:SetRGBFromTable(arg_1_3.color)
	end

	arg_1_0:addElement(var_1_4)

	if arg_1_2 == arg_1_0.initIndex then
		var_1_4:SetScale(0, 0)
		var_1_4:SetAlpha(1, 200)
	else
		var_1_4:SetScale(var_0_5, 0)
		var_1_4:SetAlpha(var_0_6, 100)
	end

	local var_1_5 = {
		widget = var_1_4,
		left = var_1_1,
		right = var_1_2
	}

	table.insert(arg_1_0.bonusWidgetTable, var_1_5)
end

local function var_0_8(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.focusIndex == 0 or arg_2_0.focusIndex == #arg_2_0.bonusWidgetTable then
		return
	end

	arg_2_0.bonusWidgetTable[arg_2_0.focusIndex].widget:SetAlpha(var_0_6)
	arg_2_0.bonusWidgetTable[arg_2_0.focusIndex].widget:SetScale(var_0_5, var_0_4)

	local var_2_0

	if arg_2_2 == "left" then
		arg_2_0.focusIndex = arg_2_0.focusIndex - 1
		var_2_0 = -var_0_3
	elseif arg_2_2 == "right" then
		arg_2_0.focusIndex = arg_2_0.focusIndex + 1
		var_2_0 = var_0_3
	end

	arg_2_0.bonusWidgetTable[arg_2_0.focusIndex].widget:SetAlpha(1)
	arg_2_0.bonusWidgetTable[arg_2_0.focusIndex].widget:SetScale(0, var_0_4)

	for iter_2_0 = 1, #arg_2_0.bonusWidgetTable do
		local var_2_1 = arg_2_0.bonusWidgetTable[iter_2_0]
		local var_2_2 = var_2_1.left
		local var_2_3 = var_2_1.right
		local var_2_4 = var_2_2 + var_2_0
		local var_2_5 = var_2_3 + var_2_0

		arg_2_0.bonusWidgetTable[iter_2_0].left = var_2_4
		arg_2_0.bonusWidgetTable[iter_2_0].right = var_2_5

		arg_2_0.bonusWidgetTable[iter_2_0].widget:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_2_4, _1080p * var_2_5, _1080p * 50, _1080p * 350, var_0_4, LUI.EASING.outSine)
	end

	arg_2_0:Wait(var_0_4).onComplete = function()
		ACTIONS.AnimateSequence(arg_2_0.bonusWidgetTable[arg_2_0.focusIndex].widget, "Slam")
	end
end

local function var_0_9(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.totalIndex = 0
	arg_4_0.initIndex = 1
	arg_4_0.focusIndex = arg_4_0.initIndex
	arg_4_0.bonusWidgetTable = {}

	for iter_4_0 = 1, #arg_4_2 do
		if arg_4_2[iter_4_0].value > 0 then
			arg_4_0.totalIndex = arg_4_0.totalIndex + 1

			local var_4_0 = arg_4_2[iter_4_0]

			var_0_7(arg_4_0, arg_4_1, arg_4_0.totalIndex, var_4_0)
		end
	end

	ACTIONS.AnimateSequence(arg_4_0.bonusWidgetTable[arg_4_0.initIndex].widget, "Slam")
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InitAARBattlePassBonusPanel = var_0_9
	arg_5_0.ShowAARBonusWidget = ShowAARBonusWidget
	arg_5_0.MoveAARBonusWidget = var_0_8
end

function AARBattlePassBonusPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 400 * _1080p)

	var_6_0.id = "AARBattlePassBonusPanel"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("AARBattlePassBonusPanel", AARBattlePassBonusPanel)
LockTable(_M)
