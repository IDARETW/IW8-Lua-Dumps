module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ModesButton)
	assert(arg_1_0.ModesButton.DynamicText)
	assert(arg_1_0.MapsButton)
	assert(arg_1_0.MapsButton.DynamicText)

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(arg_1_0) then
		assert(arg_1_0.OptionsButton)
		assert(arg_1_0.OptionsButton.DynamicText)
	end

	MatchRules.CJGCIGEBB(1)

	if Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		Lobby.DIDBDHFDGG()
	end

	local var_1_0 = Lobby.GetCurrentGameType()
	local var_1_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_1_0, CSV.gameTypesTable.cols.name)

	arg_1_0.ModesButton.DynamicText:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_1)))
	arg_1_0.MapsButton.DynamicText:setText(ToUpperCase(Lobby.ECIFCJJJIA()))

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(arg_1_0) then
		arg_1_0.OptionsButton.DynamicText:SetAlpha(0, 0)
	end
end

function CPGameSetupButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 392 * _1080p)

	var_2_0.id = "CPGameSetupButtons"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(10 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MapsButton"
	var_2_4.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/DESC_MAP")

	var_2_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAP_CAPS")), 0)
	var_2_4.DynamicText:setText("", 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
	var_2_0:addElement(var_2_4)

	var_2_0.MapsButton = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "ModesButton"
	var_2_6.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/DESC_GAMEMODE")

	var_2_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MODE_CAPS")), 0)
	var_2_6.DynamicText:setText("", 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 50, _1080p * 90)
	var_2_0:addElement(var_2_6)

	var_2_0.ModesButton = var_2_6

	local var_2_7

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_2_0) then
		var_2_7 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
			controllerIndex = var_2_1
		})
		var_2_7.id = "OptionsButton"

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_2_0) then
			var_2_7.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/DESC_OPTIONS")
		end

		var_2_7.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY")), 0)
		var_2_7.DynamicText:setText("", 0)
		var_2_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 100, _1080p * 140)
		var_2_0:addElement(var_2_7)

		var_2_0.OptionsButton = var_2_7
	end

	local var_2_8

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_2_0) then
		var_2_8 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
			controllerIndex = var_2_1
		})
		var_2_8.id = "StartingFloor"

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_2_0) then
			var_2_8.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/DESC_OPTIONS")
		end

		var_2_8.Text:setText(ToUpperCase("Mission(Debug)"), 0)
		var_2_8.DynamicText:setText("", 0)
		var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 150, _1080p * 190)
		var_2_0:addElement(var_2_8)

		var_2_0.StartingFloor = var_2_8
	end

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Spacer"

	var_2_10:SetAlpha(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 200, _1080p * 250)
	var_2_0:addElement(var_2_10)

	var_2_0.Spacer = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "ButtonDescription"

	var_2_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_12.Description:SetRight(_1080p * 415, 0)
	var_2_12.Description:SetRGBFromInt(16777215, 0)
	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 260, _1080p * 300)
	var_2_0:addElement(var_2_12)

	var_2_0.ButtonDescription = var_2_12

	var_2_4:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller or var_2_1

		ACTIONS.OpenMenu("CPMaps", true, var_3_0)
	end)
	var_2_6:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.controller or var_2_1

		ACTIONS.OpenMenu("CPGameModes", true, var_4_0)
	end)

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_2_0) then
		var_2_7:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_1.controller or var_2_1

			ACTIONS.OpenMenu("CPGameDifficulty", true, var_5_0)
		end)
	end

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_2_0) then
		var_2_8:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			local var_6_0 = arg_6_1.controller or var_2_1

			ACTIONS.OpenMenu("MissionSelectDebug", true, var_6_0)
		end)
	end

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPGameSetupButtons", CPGameSetupButtons)
LockTable(_M)
