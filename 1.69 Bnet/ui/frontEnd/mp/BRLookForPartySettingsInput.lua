module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = Lobby.LOOK_FOR_PARTY_METADATA

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		arg_1_0.SideOptionPopUp:CreateHeader(iter_1_1[var_1_0.HEADER_TEXT_REF])

		local var_1_1 = arg_1_0.SideOptionPopUp:CreateSelectAllButton()

		var_1_1.buttonsList = arg_1_0.SideOptionPopUp:CreateButtons(iter_1_1[var_1_0.BUTTON_DATA_REF], arg_1_2, arg_1_3, arg_1_0, iter_1_1[var_1_0.EXEC_CAT_CODE_REF])

		arg_1_0.SideOptionPopUp:SetSelectAllButtonHandler(var_1_1, arg_1_2, arg_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.buttonData
	local var_2_1 = Lobby.PrepLookForPartyPanelData(var_2_0)

	if var_2_1.desc ~= nil and var_2_1.desc ~= "" then
		arg_2_1.description:setText(var_2_1.desc)
	else
		arg_2_1.description:setText("")
	end

	if arg_2_1.Icon:GetAlpha() == 0 then
		arg_2_1.Icon:SetAlpha(1)
	end

	arg_2_1.Icon:setImage(RegisterMaterial(var_2_0.icon))
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.parentData
	local var_3_1 = arg_3_0.buttonData
	local var_3_2 = var_3_1[Lobby.LOOK_FOR_PARTY_METADATA.MAX_PARTY_SIZE_REF]
	local var_3_3 = var_3_1[Lobby.LOOK_FOR_PARTY_METADATA.EXEC_CODE_REF]

	Lobby.LOOK_FOR_PARTY_EXEC_INTERACTED = true

	if arg_3_0.selectedState == nil then
		arg_3_0.selectedState = false
	end

	if Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0] == nil then
		Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0] = {}
	end

	local var_3_4 = Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0].count
	local var_3_5 = false

	if arg_3_0.selectedState and var_3_4 > 1 then
		arg_3_0.selectedState = false

		arg_3_0.Selected:SetEquipped(arg_3_0.selectedState)

		Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0][var_3_3] = nil

		local var_3_6 = true

		Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0].count = Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0].count - 1

		Lobby.LookForPartySetMaxParty(var_3_3, var_3_2, {
			delete = true
		})
		Lobby.AffectLocalLookForPartyBinaryData(var_3_1.btnIdx, 0)
	elseif arg_3_0.selectedState == false then
		arg_3_0.selectedState = true
		Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0][var_3_3] = var_3_3

		arg_3_0.Selected:SetEquipped(arg_3_0.selectedState)

		Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0].count = Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_3_0].count + 1

		Lobby.LookForPartySetMaxParty(var_3_3, var_3_2)
		Lobby.AffectLocalLookForPartyBinaryData(var_3_1.btnIdx, 1)
	end

	local var_3_7 = Lobby.PrepLookForPartyPanelData(var_3_1)

	Lobby.SetLookForPartyStatusPanelData(var_3_7, arg_3_0.selectedState)
	arg_3_0:dispatchEventToRoot({
		immediate = true,
		name = "update_lfp_status_panel"
	})
	Lobby.BuildLookForPartyExecString(Lobby.LOOK_FOR_PARTY_EXEC_CODES)
end

local function var_0_3(arg_4_0, arg_4_1)
	Lobby.lfpSideOptionsBtnCount = 1

	var_0_0(arg_4_0, Lobby.LOOK_FOR_PARTY_FLYOUT_DATA[Lobby.LOOK_FOR_PARTY_METADATA.GAME_MODE_DATA_REF], var_0_2, var_0_1)
	var_0_0(arg_4_0, Lobby.LOOK_FOR_PARTY_FLYOUT_DATA[Lobby.LOOK_FOR_PARTY_METADATA.MISC_PARTY_DATA_REF], var_0_2, var_0_1)
end

local function var_0_4(arg_5_0)
	local var_5_0 = "playlists"
	local var_5_1 = "play_styles"
	local var_5_2 = "communications"

	Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_0].count = 0
	Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_2].count = 0
	Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_1].count = 0

	local var_5_3 = false
	local var_5_4 = false
	local var_5_5 = arg_5_0.SideOptionPopUp:GetButtons()

	for iter_5_0 = 1, #var_5_5 do
		local var_5_6 = var_5_5[iter_5_0]
		local var_5_7 = Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_6.parentData]

		if var_5_7 ~= nil then
			local var_5_8 = var_5_7[var_5_6.buttonData[Lobby.LOOK_FOR_PARTY_METADATA.EXEC_CODE_REF]] ~= nil

			if var_5_8 == true then
				var_5_6.selectedState = var_5_8

				var_5_6.Selected:SetEquipped(var_5_8)

				if Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_6.parentData].count == nil then
					Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_6.parentData].count = 0
				end

				Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_6.parentData].count = Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_5_6.parentData].count + 1
			end
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.ButtonHandler = var_0_2

	arg_6_0.description:setText("")
	arg_6_0.Icon:SetAlpha(0)
	arg_6_0.SideOptionPopUp.WidgetTitle:SetTitle(Engine.CBBHFCGDIC("MENU/MY_PARTY_SETTINGS_BLADETITLE"))
	var_0_3(arg_6_0, arg_6_1)
	var_0_4(arg_6_0)
end

function BRLookForPartySettingsInput(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "BRLookForPartySettingsInput"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("WZDataDrivenSideOptionPopUp", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "SideOptionPopUp"

	var_7_4.WidgetTitle.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTINGS")), 0)
	var_7_4.WidgetDescription:setText(Engine.CBBHFCGDIC("MENU/PARTY_SETTINGS_DESC"), 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.SideOptionPopUp = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Icon"

	var_7_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 100, _1080p * 157, _1080p * -143, _1080p * -85)
	var_7_0:addElement(var_7_6)

	var_7_0.Icon = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "description"

	var_7_8:setText("Hello there, curious how this will wrap, so I'm going to keep this going.", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 164, _1080p * 536, _1080p * 937, _1080p * 961)
	var_7_0:addElement(var_7_8)

	var_7_0.description = var_7_8

	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BRLookForPartySettingsInput", BRLookForPartySettingsInput)
LockTable(_M)
