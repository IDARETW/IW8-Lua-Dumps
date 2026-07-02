module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/ENTER_NAME")
	local var_1_1 = arg_1_1.emblemName
	local var_1_2 = 16
	local var_1_3 = false
	local var_1_4 = true
	local var_1_5 = CoD.KeyboardInputTypes.Normal
	local var_1_6 = false

	OSK.CBJGJDGFC(arg_1_0, var_1_0, var_1_1, var_1_2, var_1_3, var_1_4, var_1_6, function(arg_2_0, arg_2_1)
		if arg_2_1 ~= nil and arg_2_1 ~= "" then
			EmblemEditor.BECBICEHAJ(arg_2_0, arg_1_1.slotIndex, arg_2_1)
			LUI.FlowManager.RequestLeaveMenuByName("EmblemSelectOptionsPopup")
		end
	end, var_1_5)
end

local function var_0_1(arg_3_0, arg_3_1)
	EmblemEditor.BCEFHGBAGE(arg_3_0, arg_3_1)
	LUI.FlowManager.RequestLeaveMenuByName("EmblemSelectOptionsPopup")
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.controllerIndex
	local var_4_1 = {}

	var_4_1.width = 400
	var_4_1.message = arg_4_1.message
	var_4_1.defaultFocusIndex = 1
	var_4_1.cancelClosesPopup = true
	var_4_1.buttonsClosePopup = true
	var_4_1.yesAction = arg_4_1.yesAction

	local var_4_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_4_1)

	var_4_2.id = "DeleteEmblemPopup"

	return var_4_2
end

local function var_0_3(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.controllerIndex
	local var_5_1 = {}

	var_5_1.width = 400
	var_5_1.message = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/LAYERS_EMPTY_MESSAGE")
	var_5_1.defaultFocusIndex = 1
	var_5_1.cancelClosesPopup = true
	var_5_1.buttonsClosePopup = true

	local var_5_2 = MenuBuilder.BuildRegisteredType("PopupOK", var_5_1)

	var_5_2.id = "EmblemEmptyLayersPopup"

	return var_5_2
end

local function var_0_4(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.controllerIndex
	local var_6_1 = arg_6_1.slotIndex
	local var_6_2 = {
		title = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/OPTIONS_MENU_TITLE")
	}

	var_6_2.width = 400
	var_6_2.message = ""
	var_6_2.defaultFocusIndex = 1
	var_6_2.cancelClosesPopup = true
	var_6_2.buttonsClosePopup = false
	var_6_2.buttons = {
		{
			label = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/RENAME_EMBLEM"),
			action = function(arg_7_0, arg_7_1)
				var_0_0(arg_7_1, arg_6_1)
			end
		},
		{
			label = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/DELETE_EMBLEM"),
			action = function(arg_8_0, arg_8_1)
				LUI.FlowManager.RequestPopupMenu(arg_8_0, "DeleteEmblemPopup", true, arg_8_1, false, {
					yesAction = function(arg_9_0, arg_9_1)
						var_0_1(arg_8_1, var_6_1)
					end,
					message = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/CONFIRM_DELETE_EMBLEM_MESSAGE")
				})
			end
		}
	}

	local var_6_3 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_6_2)

	var_6_3.id = "EmblemSelectOptionsPopup"

	return var_6_3
end

local function var_0_5(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.controllerIndex
	local var_10_1 = {
		title = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/SLOT_LIMIT_REACHED_TITLE")
	}

	var_10_1.width = 400
	var_10_1.message = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/SLOT_LIMIT_REACHED_MESSAGE")
	var_10_1.defaultFocusIndex = 1
	var_10_1.cancelClosesPopup = true
	var_10_1.buttonsClosePopup = true

	local var_10_2 = MenuBuilder.BuildRegisteredType("PopupOK", var_10_1)

	var_10_2.id = "EmblemSelectOptionsPopup"

	return var_10_2
end

local function var_0_6(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.controllerIndex
	local var_11_1 = {}

	var_11_1.width = 400
	var_11_1.message = Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/EMBLEM_EQUIPPED_MESSAGE")
	var_11_1.defaultFocusIndex = 1
	var_11_1.cancelClosesPopup = true
	var_11_1.buttonsClosePopup = true

	local var_11_2 = MenuBuilder.BuildRegisteredType("PopupOK", var_11_1)

	var_11_2.id = "EmblemEquippedPopup"

	return var_11_2
end

MenuBuilder.registerType("DeleteEmblemPopup", var_0_2)
MenuBuilder.registerType("EmblemEmptyLayersPopup", var_0_3)
MenuBuilder.registerType("EmblemEquippedPopup", var_0_6)
MenuBuilder.registerType("EmblemSelectOptionsPopup", var_0_4)
MenuBuilder.registerType("EmblemSlotLimitReachedPopup", var_0_5)
