module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = OPTIONS.InitOptionsList(arg_1_0, arg_1_1)

	arg_1_0.vList:SetActiveParentBehavior()

	local var_1_1 = {}

	table.insert(var_1_1, "Volume")
	table.insert(var_1_1, "MusicVolume")
	table.insert(var_1_1, "EffectsVolume")
	table.insert(var_1_1, "CinematicsVolume")
	table.insert(var_1_1, "VoiceVolume")
	table.insert(var_1_1, "WarTracksVolume")

	for iter_1_0 = 1, #var_1_1 do
		local var_1_2 = var_1_0[var_1_1[iter_1_0]]

		if var_1_2.type == "Dropdown" then
			var_1_2.type = "CyclingList"
		end

		local var_1_3 = OPTIONS.CreateOption(arg_1_0, arg_1_1, var_1_2)

		var_1_3:RemoveToolTipData()
		arg_1_0.vList:AddElement(var_1_3)
	end
end

function AudioOptionsButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "AudioOptionsButtons"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	local var_2_2 = LUI.UIElement.new()

	var_2_2.id = "AudioButtonsStencil"

	var_2_2:setUseStencil(true)
	var_2_2:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 140, 0, 0)

	var_2_0.listStencil = var_2_2

	var_2_0:addElement(var_2_2)

	var_2_0.vList = LUI.UIGrid.new({
		maxVisibleColumns = 1,
		wrapY = true,
		maxRows = 25,
		controllerIndex = var_2_1,
		maxVisibleRows = CONDITIONS.IsSplitscreen() and 6 or 14,
		spacingY = 8 * _1080p
	})

	var_2_0.vList:SetAnchorsAndPosition(0, 0, 0, 1, 0, -140 * _1080p, 0, 490 * _1080p)

	var_2_0.vList.id = "AudioOptionsButtonsList"

	var_2_2:addElement(var_2_0.vList)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("AudioOptionsButtons", AudioOptionsButtons)
LockTable(_M)
