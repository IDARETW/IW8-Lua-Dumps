module(..., package.seeall)

local var_0_0 = SWATCHES.genericButton.textFocus
local var_0_1 = SWATCHES.CAC.equipped
local var_0_2 = SWATCHES.genericMenu.bodycopy
local var_0_3 = 0.5
local var_0_4 = SWATCHES.genericButton.description
local var_0_5 = 1

local function var_0_6(arg_1_0, arg_1_1)
	assert(arg_1_0._pips and arg_1_1 <= #arg_1_0._pips)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._pips) do
		local var_1_0 = iter_1_1.Pip

		if iter_1_1.selected then
			iter_1_1.selected = false

			if iter_1_1.complete then
				var_1_0:SetRGBFromTable(var_0_4)
				var_1_0:SetAlpha(var_0_5)
			elseif arg_1_0._isActiveObjective and iter_1_1.isActive then
				var_1_0:SetRGBFromTable(var_0_1)
				var_1_0:SetAlpha(var_0_5)
			else
				var_1_0:SetRGBFromTable(var_0_2)
				var_1_0:SetAlpha(var_0_3)
			end

			iter_1_1.Lock:SetRGBFromTable(SWATCHES.genericButton.description)
		end

		if iter_1_0 == arg_1_1 then
			local var_1_1 = arg_1_0._isActiveObjective and iter_1_1.isActive

			var_1_0:SetRGBFromTable(var_1_1 and var_0_1 or var_0_0)
			var_1_0:SetAlpha(var_0_5)
			iter_1_1.Lock:SetRGBFromTable(SWATCHES.tabManager.tabTextDisabled)

			iter_1_1.selected = true
		end
	end
end

local function var_0_7(arg_2_0, arg_2_1)
	arg_2_0._isActiveObjective = arg_2_1
end

local function var_0_8(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	assert(arg_3_1 and arg_3_1 > 0)

	for iter_3_0 = 1, #arg_3_0._pips do
		arg_3_0._pips[iter_3_0]:closeTree()
	end

	arg_3_0._pips = {}

	local var_3_0 = not arg_3_4
	local var_3_1 = arg_3_0._pipHeight / 2

	for iter_3_1 = 1, arg_3_1 do
		local var_3_2 = LUI.UIButton.new()

		var_3_2.id = "Pip" .. iter_3_1

		var_3_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, arg_3_0._pipWidth, -var_3_1, var_3_1)

		local var_3_3 = 6 * _1080p
		local var_3_4 = 6 * _1080p
		local var_3_5 = LUI.UIImage.new()

		var_3_5.id = "Pip" .. iter_3_1 .. "Image"

		var_3_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -var_3_4, var_3_4, -var_3_4, var_3_4)

		local var_3_6 = LUI.UIImage.new()

		var_3_6.id = "Lock"

		var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -var_3_3, var_3_3, -var_3_3, var_3_3)
		var_3_6:SetRGBFromTable(SWATCHES.genericButton.description)
		var_3_6:setImage(RegisterMaterial("icon_lock"))
		var_3_2:addElement(var_3_5)
		var_3_2:addElement(var_3_6)

		var_3_2.Pip = var_3_5
		var_3_2.Lock = var_3_6

		arg_3_0._pipContainer:addElement(var_3_2)

		var_3_2.complete = iter_3_1 <= arg_3_2
		var_3_2.index = iter_3_1

		local var_3_7 = var_3_2.Pip

		if var_3_2.complete then
			var_3_7:SetRGBFromTable(var_0_4)
			var_3_7:SetAlpha(var_0_5)
			var_3_2.Lock:SetAlpha(0)
		else
			if var_3_0 then
				var_3_0 = false
				var_3_2.isActive = true
			else
				var_3_2.isActive = false
			end

			if arg_3_0._isActiveObjective and var_3_2.isActive then
				var_3_7:SetRGBFromTable(var_0_1)
				var_3_7:SetAlpha(var_0_5)
			else
				var_3_7:SetRGBFromTable(var_0_2)
				var_3_7:SetAlpha(var_0_3)
			end

			if not var_3_2.isActive then
				var_3_2.Lock:SetAlpha(0.9)
			else
				var_3_2.Lock:SetAlpha(0)
			end
		end

		var_3_2:registerEventHandler("leftmouseup", function(arg_4_0, arg_4_1)
			arg_4_0:getParent():dispatchEventToParent({
				name = "mission_details_mouse_navigate",
				index = arg_4_0.index
			})
		end)
		table.insert(arg_3_0._pips, var_3_2)
	end

	if arg_3_3 and arg_3_3 == LUI.Alignment.Center then
		local var_3_8 = arg_3_1 * (arg_3_0._pipWidth + arg_3_0._spacing)

		arg_3_0._pipContainer:SetLeft(-(var_3_8 / 2))
	end
end

local function var_0_9(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.Setup = var_0_8
	arg_5_0.SetSelected = var_0_6
	arg_5_0.SetActive = var_0_7
	arg_5_0._isActiveObjective = false

	local var_5_0, var_5_1, var_5_2, var_5_3 = arg_5_0.Pip:getLocalRect()

	arg_5_0._pipContainer = LUI.UIHorizontalStackedLayout.new()
	arg_5_0._pipContainer.id = "PipContainer"

	arg_5_0._pipContainer:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_5_0._pipContainer:SetSpacing(3 * _1080p)
	arg_5_0:addElement(arg_5_0._pipContainer)

	arg_5_0._pipWidth = var_5_2 - var_5_0
	arg_5_0._pipHeight = var_5_3 - var_5_1
	arg_5_0._spacing = arg_5_0:GetSpacing()
	arg_5_0._pips = {}

	arg_5_0.Pip:closeTree()

	arg_5_0.Pip = nil
end

function BarracksChallengeMissionDetailsPips(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 15 * _1080p, 0, 5 * _1080p)

	var_6_0.id = "BarracksChallengeMissionDetailsPips"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Pip"

	var_6_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 15, _1080p * -2.5, _1080p * 2.5)
	var_6_0:addElement(var_6_4)

	var_6_0.Pip = var_6_4

	var_0_9(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BarracksChallengeMissionDetailsPips", BarracksChallengeMissionDetailsPips)
LockTable(_M)
