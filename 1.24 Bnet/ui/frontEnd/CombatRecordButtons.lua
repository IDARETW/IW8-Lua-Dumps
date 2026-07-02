module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0._buttons)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._buttons) do
		iter_1_1:processEvent({
			name = "lose_focus"
		})
	end

	arg_1_0._buttons[arg_1_1]:processEvent({
		name = "gain_focus"
	})
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._buttons = {
		arg_2_0.WeaponsButton,
		arg_2_0.LethalsButton,
		arg_2_0.TacticalsButton,
		arg_2_0.KillstreaksButton,
		arg_2_0.GameModesButton,
		arg_2_0.FieldUpgradesButton
	}
	arg_2_0.WeaponsButton.recordType = RECORDS.Types.WEAPON
	arg_2_0.LethalsButton.recordType = RECORDS.Types.LETHAL
	arg_2_0.TacticalsButton.recordType = RECORDS.Types.TACTICAL
	arg_2_0.KillstreaksButton.recordType = RECORDS.Types.STREAK
	arg_2_0.GameModesButton.recordType = RECORDS.Types.MODE
	arg_2_0.FieldUpgradesButton.recordType = RECORDS.Types.SUPER

	local function var_2_0(arg_3_0, arg_3_1)
		arg_2_0:dispatchEventToCurrentMenu({
			name = "update_combat_record",
			recordType = arg_3_0.recordType
		})
	end

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._buttons) do
		iter_2_1:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			LUI.FlowManager.RequestAddMenu("CombatRecordTabsMenu", true, arg_2_1, false, {
				index = iter_2_0
			}, true)
		end)
		iter_2_1:addEventHandler("button_over", var_2_0)
		iter_2_1:addEventHandler("button_over_disable", var_2_0)
	end

	arg_2_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
		local var_5_0 = LUI.FlowManager.GetScopedData("BarracksRecords")

		if var_5_0.activeRecordIndex and LUI.IsLastInputGamepad(arg_2_1) then
			var_0_0(arg_2_0, var_5_0.activeRecordIndex)
		else
			var_0_0(arg_2_0, 1)
		end
	end)
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.WeaponsButton)
	assert(arg_6_0.LethalsButton)
	assert(arg_6_0.TacticalsButton)
	assert(arg_6_0.KillstreaksButton)
	assert(arg_6_0.GameModesButton)
	var_0_1(arg_6_0, arg_6_1)
end

function CombatRecordButtons(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalList.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 319 * _1080p)

	var_7_0.id = "CombatRecordButtons"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(10 * _1080p)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "WeaponsButton"

	var_7_4.Text:SetLeft(_1080p * 20, 0)
	var_7_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_WEAPONS"), 0)
	var_7_4.Text:SetAlignment(LUI.Alignment.Left)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 38)
	var_7_0:addElement(var_7_4)

	var_7_0.WeaponsButton = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "LethalsButton"

	var_7_6.Text:SetLeft(_1080p * 20, 0)
	var_7_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_LETHALS"), 0)
	var_7_6.Text:SetAlignment(LUI.Alignment.Left)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 48, _1080p * 86)
	var_7_0:addElement(var_7_6)

	var_7_0.LethalsButton = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "TacticalsButton"

	var_7_8.Text:SetLeft(_1080p * 20, 0)
	var_7_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_TACTICALS"), 0)
	var_7_8.Text:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 96, _1080p * 134)
	var_7_0:addElement(var_7_8)

	var_7_0.TacticalsButton = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "KillstreaksButton"

	var_7_10.Text:SetLeft(_1080p * 20, 0)
	var_7_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_KILLSTREAKS"), 0)
	var_7_10.Text:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 144, _1080p * 182)
	var_7_0:addElement(var_7_10)

	var_7_0.KillstreaksButton = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "GameModesButton"

	var_7_12.Text:SetLeft(_1080p * 20, 0)
	var_7_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_GAME_MODES"), 0)
	var_7_12.Text:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 192, _1080p * 230)
	var_7_0:addElement(var_7_12)

	var_7_0.GameModesButton = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "FieldUpgradesButton"

	var_7_14.Text:SetLeft(_1080p * 20, 0)
	var_7_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADES"), 0)
	var_7_14.Text:SetAlignment(LUI.Alignment.Left)
	var_7_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 240, _1080p * 278)
	var_7_0:addElement(var_7_14)

	var_7_0.FieldUpgradesButton = var_7_14

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("CombatRecordButtons", CombatRecordButtons)
LockTable(_M)
