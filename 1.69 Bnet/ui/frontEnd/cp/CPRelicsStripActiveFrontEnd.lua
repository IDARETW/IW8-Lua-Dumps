module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_3)
	assert(arg_1_2)

	local var_1_0 = tostring(arg_1_3)
	local var_1_1 = "Relic" .. var_1_0

	if arg_1_2 and arg_1_2 ~= "" then
		local var_1_2 = tonumber(arg_1_2)
		local var_1_3 = StringTable.DIFCHIGDFB(CSV.cpRelicTable.file, CSV.cpRelicTable.cols.idx, var_1_2, CSV.cpRelicTable.cols.icon)

		if var_1_3 and var_1_3 ~= "" then
			arg_1_0[var_1_1].RelicIcon:setImage(RegisterMaterial(var_1_3), 0)
		end

		arg_1_0[var_1_1]:SetAlpha(1, 0)
	else
		arg_1_0[var_1_1]:SetAlpha(0, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetAlpha(0)

	local var_2_0 = 0
	local var_2_1
	local var_2_2 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))

	if var_2_2 then
		var_2_1 = PlaylistUtils.FindPlaylistDataSourceFromID(arg_2_1, var_2_2)
	end

	if var_2_1 then
		var_2_0 = var_2_1.numRounds:GetValue(arg_2_1)
	end

	local var_2_3 = var_2_0

	if var_2_3 and var_2_3 ~= "" and var_2_3 > 0 then
		local var_2_4 = tostring(var_2_3)
		local var_2_5 = string.sub(var_2_4, 1, 2)

		var_0_0(arg_2_0, arg_2_1, var_2_5, 1)

		local var_2_6 = string.sub(var_2_4, 3, 4)

		var_0_0(arg_2_0, arg_2_1, var_2_6, 2)

		local var_2_7 = string.sub(var_2_4, 5, 6)

		var_0_0(arg_2_0, arg_2_1, var_2_7, 3)

		local var_2_8 = string.sub(var_2_4, 7, 8)

		var_0_0(arg_2_0, arg_2_1, var_2_8, 4)
		arg_2_0:SetAlpha(1)
	else
		arg_2_0:SetAlpha(0)
	end
end

function CPRelicsStripActiveFrontEnd(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 64 * _1080p)

	var_3_0.id = "CPRelicsStripActiveFrontEnd"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.7, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 64)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("CPRelicsStripIcon", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Relic4"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 370, _1080p * 420, _1080p * 7, _1080p * 57)
	var_3_0:addElement(var_3_6)

	var_3_0.Relic4 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("CPRelicsStripIcon", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Relic3"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 310, _1080p * 360, _1080p * 7, _1080p * 57)
	var_3_0:addElement(var_3_8)

	var_3_0.Relic3 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("CPRelicsStripIcon", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Relic2"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 250, _1080p * 300, _1080p * 7, _1080p * 57)
	var_3_0:addElement(var_3_10)

	var_3_0.Relic2 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("CPRelicsStripIcon", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Relic1"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 190, _1080p * 240, _1080p * 7, _1080p * 57)
	var_3_0:addElement(var_3_12)

	var_3_0.Relic1 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Text"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/RELIC_HEADER"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 185, _1080p * 18, _1080p * 46)
	var_3_0:addElement(var_3_14)

	var_3_0.Text = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPRelicsStripActiveFrontEnd", CPRelicsStripActiveFrontEnd)
LockTable(_M)
