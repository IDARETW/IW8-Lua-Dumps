module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CPGameModes", {
	"host"
})

local function var_0_0(arg_1_0)
	local var_1_0 = StringTable.BJJBBCJGEJ(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_1_0)
	local var_1_1 = CSV.ReadRow(CSV.gameTypesTable, var_1_0)

	if #var_1_1.image > 0 then
		var_1_1.image = RegisterMaterial(var_1_1.image)
	else
		var_1_1.image = RegisterMaterial("gamemode_generic")
	end

	var_1_1.name = Engine.CBBHFCGDIC(var_1_1.name)
	var_1_1.desc = Engine.CBBHFCGDIC(var_1_1.desc)

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/GAME_TYPES"))
	assert(arg_2_0.bindButton)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		ACTIONS.LeaveMenu(arg_2_0)
	end)

	if arg_2_0.CPGameModesButtons.ClassicButton then
		arg_2_0.CPGameModesButtons.ClassicButton:addEventHandler("button_over", function(arg_4_0, arg_4_1)
			local var_4_0 = var_0_0(CP.CLASSIC_MISSIONS)

			arg_2_0.ModeDetails:SetMode(var_4_0)
		end)
	end

	if arg_2_0.CPGameModesButtons.SurvivalButton then
		arg_2_0.CPGameModesButtons.SurvivalButton:addEventHandler("button_over", function(arg_5_0, arg_5_1)
			local var_5_0 = var_0_0(CP.WAVE_SURVIVAL)

			arg_2_0.ModeDetails:SetMode(var_5_0)
		end)
	end

	if arg_2_0.CPGameModesButtons.SurvivalButton then
		arg_2_0.CPGameModesButtons.SurvivalButton:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
			local var_6_0 = var_0_0(CP.WAVE_SURVIVAL)

			arg_2_0.ModeDetails:SetMode(var_6_0)
		end)
	end

	if arg_2_0.CPGameModesButtons.SpecOpsButton then
		arg_2_0.CPGameModesButtons.SpecOpsButton:addEventHandler("button_over", function(arg_7_0, arg_7_1)
			local var_7_0 = var_0_0(CP.SPEC_OPS)

			arg_2_0.ModeDetails:SetMode(var_7_0)
		end)
	end

	local var_2_0 = var_0_0(CP.CLASSIC_MISSIONS)

	arg_2_0.ModeDetails:SetMode(var_2_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Darken)
end

function CPGameModes(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "CPGameModes"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = {
		worldBlur = 1,
		controllerIndex = var_8_1
	}
	local var_8_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_8_4)

	var_8_5.id = "WorldBlur"

	var_8_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_8_0:addElement(var_8_5)

	var_8_0.WorldBlur = var_8_5

	local var_8_6
	local var_8_7 = LUI.UIImage.new()

	var_8_7.id = "Darken"

	var_8_7:SetRGBFromInt(0, 0)
	var_8_7:SetAlpha(0.5, 0)
	var_8_0:addElement(var_8_7)

	var_8_0.Darken = var_8_7

	local var_8_8
	local var_8_9 = MenuBuilder.BuildRegisteredType("CPGameModesButtons", {
		controllerIndex = var_8_1
	})

	var_8_9.id = "CPGameModesButtons"

	var_8_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 111, _1080p * 531, _1080p * 216, _1080p * 616)
	var_8_0:addElement(var_8_9)

	var_8_0.CPGameModesButtons = var_8_9

	local var_8_10
	local var_8_11 = MenuBuilder.BuildRegisteredType("ModeDetails", {
		controllerIndex = var_8_1
	})

	var_8_11.id = "ModeDetails"

	var_8_11.GenericItemInfo.BodyText:setText("", 0)
	var_8_11.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
	var_8_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1392, _1080p * 216, _1080p * 416)
	var_8_0:addElement(var_8_11)

	var_8_0.ModeDetails = var_8_11

	local var_8_12
	local var_8_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_13.id = "MenuTitle"

	var_8_13.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/GAME_TYPES")), 0)
	var_8_13.Line:SetLeft(0, 0)
	var_8_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_8_0:addElement(var_8_13)

	var_8_0.MenuTitle = var_8_13

	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_8_14 = LUI.UIBindButton.new()

	var_8_14.id = "selfBindButton"

	var_8_0:addElement(var_8_14)

	var_8_0.bindButton = var_8_14

	var_8_0.bindButton:addEventHandler("button_start", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.controller or var_8_1

		ACTIONS.OpenOptionsMenu(var_9_0, "")
	end)
	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("CPGameModes", CPGameModes)
LockTable(_M)
