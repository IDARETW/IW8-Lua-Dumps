module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		if IsLanguageArabic() then
			LUI.FlowManager.RequestPopupMenu(nil, "CodcasterTeamNameArabicPopup", false, arg_1_1, false)
		else
			local var_2_0 = Engine.CBBHFCGDIC("CODCASTER/TEAM_NAME")
			local var_2_1 = arg_2_0.TeamName:getText()
			local var_2_2 = 30
			local var_2_3 = true
			local var_2_4 = true
			local var_2_5 = false
			local var_2_6 = CoD.KeyboardInputTypes.Normal

			OSK.CBJGJDGFC(arg_1_1, var_2_0, var_2_1, var_2_2, var_2_3, var_2_4, var_2_5, function(arg_3_0, arg_3_1, arg_3_2)
				if arg_3_1 ~= nil and arg_3_1 ~= "" then
					arg_2_0.TeamName:setText(arg_3_1)
					arg_2_0:dispatchEventToCurrentMenu({
						name = "update_team_name",
						teamName = arg_3_1
					})
				end
			end, var_2_6)
		end
	end

	arg_1_0:registerEventHandler("button_action", var_1_0)
end

function CodCasterTeamNameSelector(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "CodCasterTeamNameSelector"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "TeamName"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.subheader, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 494, _1080p * 9, _1080p * 31)
	var_4_0:addElement(var_4_6)

	var_4_0.TeamName = var_4_6

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CodCasterTeamNameSelector", CodCasterTeamNameSelector)
LockTable(_M)
