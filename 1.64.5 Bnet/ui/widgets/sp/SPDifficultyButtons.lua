module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.ButtonRecruit.SPMenuButton.Description)
	assert(arg_1_0.ButtonRegular.SPMenuButton.Description)
	assert(arg_1_0.ButtonVeteran.SPMenuButton.Description)
	assert(arg_1_0.ButtonHardened.SPMenuButton.Description)
	assert(arg_1_0.ButtonRealism.SPMenuButton.Description)
	arg_1_0.ButtonRecruit:AddTooltipData(arg_1_1, {
		tooltipDescription = arg_1_0.ButtonRecruit.SPMenuButton.Description:getText()
	})
	arg_1_0.ButtonRegular:AddTooltipData(arg_1_1, {
		tooltipDescription = arg_1_0.ButtonRegular.SPMenuButton.Description:getText()
	})
	arg_1_0.ButtonVeteran:AddTooltipData(arg_1_1, {
		tooltipDescription = arg_1_0.ButtonVeteran.SPMenuButton.Description:getText()
	})
	arg_1_0.ButtonHardened:AddTooltipData(arg_1_1, {
		tooltipDescription = arg_1_0.ButtonHardened.SPMenuButton.Description:getText()
	})
	arg_1_0.ButtonRealism:AddTooltipData(arg_1_1, {
		tooltipDescription = arg_1_0.ButtonRealism.SPMenuButton.Description:getText()
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	var_0_0(arg_2_0, arg_2_1)
end

function SPDifficultyButtons(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalList.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_3_0.id = "SPDifficultyButtons"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(14 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("SPSelectableMenuButton", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "ButtonRecruit"

	var_3_4.SPMenuButton.Text:setText(Engine.CBBHFCGDIC("MENU/RECRUIT"), 0)
	var_3_4.SPMenuButton.Description:setText(Engine.CBBHFCGDIC("MENU/RECRUIT_DESC"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_3_0:addElement(var_3_4)

	var_3_0.ButtonRecruit = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("SPSelectableMenuButton", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ButtonRegular"

	var_3_6.SPMenuButton.Text:setText(Engine.CBBHFCGDIC("MENU/REGULAR"), 0)
	var_3_6.SPMenuButton.Description:setText(Engine.CBBHFCGDIC("MENU/REGULAR_DESC_FULL"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 64, _1080p * 114)
	var_3_0:addElement(var_3_6)

	var_3_0.ButtonRegular = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("SPSelectableMenuButton", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ButtonHardened"

	var_3_8.SPMenuButton.Text:setText(Engine.CBBHFCGDIC("MENU/HARDENED"), 0)
	var_3_8.SPMenuButton.Description:setText(Engine.CBBHFCGDIC("MENU/HARDENED_DESC"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 128, _1080p * 178)
	var_3_0:addElement(var_3_8)

	var_3_0.ButtonHardened = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("SPSelectableMenuButton", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "ButtonVeteran"

	var_3_10.SPMenuButton.Text:setText(Engine.CBBHFCGDIC("MENU/VETERAN"), 0)
	var_3_10.SPMenuButton.Description:setText(Engine.CBBHFCGDIC("MENU/VETERAN_DESC"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 192, _1080p * 242)
	var_3_0:addElement(var_3_10)

	var_3_0.ButtonVeteran = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("SPSelectableMenuButton", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ButtonRealism"

	var_3_12.SPMenuButton.Text:setText(Engine.CBBHFCGDIC("MENU/REALISM"), 0)
	var_3_12.SPMenuButton.Description:setText(Engine.CBBHFCGDIC("MENU/REALISM_DESC"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 256, _1080p * 306)
	var_3_0:addElement(var_3_12)

	var_3_0.ButtonRealism = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SPDifficultyButtons", SPDifficultyButtons)
LockTable(_M)
