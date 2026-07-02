module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetAlpha(0)

	local var_1_0 = 0
	local var_1_1
	local var_1_2 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))

	if var_1_2 then
		var_1_1 = PlaylistUtils.FindPlaylistDataSourceFromID(arg_1_1, var_1_2)
	end

	if var_1_1 then
		var_1_0 = var_1_1.timeLimit:GetValue(arg_1_1)
	end

	local var_1_3 = var_1_0

	if var_1_3 and var_1_3 ~= "" and var_1_3 > 0 and var_1_3 < 100 then
		if var_1_3 == 40 then
			arg_1_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_VETERAN"))
			arg_1_0:SetAlpha(1)
		elseif var_1_3 == 30 then
			arg_1_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_HARDENED"))
			arg_1_0:SetAlpha(1)
		elseif var_1_3 == 20 then
			arg_1_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_REGULAR"))
			arg_1_0:SetAlpha(1)
		elseif var_1_3 == 10 then
			arg_1_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BOTS_RECRUIT"))
			arg_1_0:SetAlpha(1)
		else
			arg_1_0:SetAlpha(0)
		end
	end
end

function CPPlaylistDifficulty(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 25 * _1080p)

	var_2_0.id = "CPPlaylistDifficulty"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Backing"

	var_2_4:SetRGBFromTable(SWATCHES.CAC.weaponMeterDark, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 25)
	var_2_0:addElement(var_2_4)

	var_2_0.Backing = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 388, 0, _1080p * 24)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "DifficultyIcon"

	var_2_8:SetScale(-0.5, 0)
	var_2_8:setImage(RegisterMaterial("icon_modifier_difficulty"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 379, _1080p * 443, _1080p * -20, _1080p * 44)
	var_2_0:addElement(var_2_8)

	var_2_0.DifficultyIcon = var_2_8

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPPlaylistDifficulty", CPPlaylistDifficulty)
LockTable(_M)
