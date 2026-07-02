module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetAlpha(0)
	arg_1_0:SubscribeToDataSourceThroughElement(arg_1_0, nil, function()
		local var_2_0 = arg_1_0:GetDataSource()

		if var_2_0 then
			local var_2_1 = var_2_0.timeLimit:GetValue(arg_1_1)

			if var_2_1 and var_2_1 ~= "" and var_2_1 > 0 and var_2_1 < 100 then
				if var_2_1 == 40 then
					arg_1_0.DifficultyText:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_VETERAN"))
					arg_1_0:SetAlpha(1)
				elseif var_2_1 == 30 then
					arg_1_0.DifficultyText:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_HARDENED"))
					arg_1_0:SetAlpha(1)
				elseif var_2_1 == 20 then
					arg_1_0.DifficultyText:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_REGULAR"))
					arg_1_0:SetAlpha(1)
				elseif var_2_1 == 10 then
					arg_1_0.DifficultyText:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_RECRUIT"))
					arg_1_0:SetAlpha(1)
				else
					arg_1_0:SetAlpha(0)
				end
			else
				arg_1_0:SetAlpha(0)
			end
		end
	end)
end

function CPDifficultyPlaylistInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 289 * _1080p, 0, 67 * _1080p)

	var_3_0.id = "CPDifficultyPlaylistInfo"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "Title"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("LUA_MENU/DIFFICULTY"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 79, 0, _1080p * 12, _1080p * 36)
	var_3_0:addElement(var_3_4)

	var_3_0.Title = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "DifficultyIcon"

	var_3_6:setImage(RegisterMaterial("icon_modifier_difficulty"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 68, 0, _1080p * 64)
	var_3_0:addElement(var_3_6)

	var_3_0.DifficultyIcon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "DifficultyText"

	var_3_8:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 79, 0, _1080p * 36, _1080p * 60)
	var_3_0:addElement(var_3_8)

	var_3_0.DifficultyText = var_3_8

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPDifficultyPlaylistInfo", CPDifficultyPlaylistInfo)
LockTable(_M)
