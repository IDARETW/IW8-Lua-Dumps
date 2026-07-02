module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_3)
	assert(arg_1_2)

	local var_1_0 = tostring(arg_1_3)
	local var_1_1 = "Relic" .. var_1_0
	local var_1_2 = 4
	local var_1_3 = 0
	local var_1_4 = Engine.CBBHFCGDIC("LUA_MENU_CP/SURVIVAL")
	local var_1_5 = 0
	local var_1_6 = 0

	if arg_1_2 and arg_1_2 ~= "" then
		arg_1_0[var_1_1].RelicDesc:setText(var_1_4)

		var_1_5 = LAYOUT.GetTextHeightWithWrapping(arg_1_0[var_1_1].RelicDesc, var_1_4)

		local var_1_7 = tonumber(arg_1_2)
		local var_1_8 = StringTable.DIFCHIGDFB(CSV.cpRelicTable.file, CSV.cpRelicTable.cols.idx, var_1_7, CSV.cpRelicTable.cols.icon)
		local var_1_9 = ToUpperCase(Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.cpRelicTable.file, CSV.cpRelicTable.cols.idx, var_1_7, CSV.cpRelicTable.cols.name)))
		local var_1_10 = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.cpRelicTable.file, CSV.cpRelicTable.cols.idx, var_1_7, CSV.cpRelicTable.cols.desc))

		if var_1_8 and var_1_8 ~= "" then
			arg_1_0[var_1_1].RelicIcon:setImage(RegisterMaterial(var_1_8), 0)
		end

		if var_1_9 then
			arg_1_0[var_1_1].RelicText:setText(var_1_9)
		end

		if var_1_10 == var_1_9 then
			var_1_10 = var_1_10 .. " add a description in cp_relic_table.csv."
		end

		if var_1_10 then
			arg_1_0[var_1_1].RelicDesc:setText(var_1_10)

			var_1_3 = LAYOUT.GetTextHeightWithWrapping(arg_1_0[var_1_1].RelicDesc, var_1_10)
		end

		ACTIONS.AnimateSequenceByElement(arg_1_0, {
			sequenceName = "Display",
			elementName = var_1_1,
			elementPath = arg_1_0[var_1_1]
		})
	else
		ACTIONS.AnimateSequenceByElement(arg_1_0, {
			sequenceName = "Hide",
			elementName = var_1_1,
			elementPath = arg_1_0[var_1_1]
		})
	end

	local var_1_11 = tonumber(string.format("%." .. (2 or 0) .. "f", var_1_3))
	local var_1_12 = tonumber(string.format("%." .. (2 or 0) .. "f", var_1_5))
	local var_1_13 = var_1_11 / var_1_12

	if var_1_13 >= 2 and var_1_13 <= 3 then
		var_1_6 = var_1_12
	elseif var_1_13 >= 1 and var_1_13 <= 2 then
		var_1_6 = var_1_12 * 2
	else
		var_1_6 = 0
	end

	return var_1_6 - var_1_2
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetAlpha(0)
	arg_2_0:SubscribeToDataSourceThroughElement(arg_2_0, nil, function()
		local var_3_0 = arg_2_0:GetDataSource()

		if var_3_0 then
			local var_3_1 = var_3_0.numRounds:GetValue(arg_2_1)

			if var_3_1 > 0 then
				local var_3_2 = tostring(var_3_1)
				local var_3_3 = string.sub(var_3_2, 1, 2)
				local var_3_4 = var_0_0(arg_2_0, arg_2_1, var_3_3, 1)
				local var_3_5 = string.sub(var_3_2, 3, 4)
				local var_3_6 = var_0_0(arg_2_0, arg_2_1, var_3_5, 2)
				local var_3_7 = string.sub(var_3_2, 5, 6)
				local var_3_8 = var_0_0(arg_2_0, arg_2_1, var_3_7, 3)
				local var_3_9 = string.sub(var_3_2, 7, 8)
				local var_3_10 = var_0_0(arg_2_0, arg_2_1, var_3_9, 4)

				arg_2_0:SetAlpha(1)
				arg_2_0.Relic1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 45, _1080p * 145)
				arg_2_0.Relic2:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 145 - var_3_4, _1080p * 245 - var_3_4)
				arg_2_0.Relic3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 245 - var_3_4 - var_3_6, _1080p * 345 - var_3_4 - var_3_6)
				arg_2_0.Relic4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 345 - var_3_4 - var_3_6 - var_3_8, _1080p * 445 - var_3_4 - var_3_6 - var_3_8)
			else
				arg_2_0:SetAlpha(0)
			end
		end
	end)
end

function CPRelicsActiveFrontEnd(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 375 * _1080p, 0, 445 * _1080p)

	var_4_0.id = "CPRelicsActiveFrontEnd"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, 0, _1080p * 445)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("CPRelicsWidgetFrontEnd", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Relic4"

	var_4_6.RelicText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_4_6.RelicDesc:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 345, _1080p * 445)
	var_4_0:addElement(var_4_6)

	var_4_0.Relic4 = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("CPRelicsWidgetFrontEnd", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Relic3"

	var_4_8.RelicText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_4_8.RelicDesc:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 245, _1080p * 345)
	var_4_0:addElement(var_4_8)

	var_4_0.Relic3 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("CPRelicsWidgetFrontEnd", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Relic2"

	var_4_10.RelicText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_4_10.RelicDesc:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 145, _1080p * 245)
	var_4_0:addElement(var_4_10)

	var_4_0.Relic2 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("CPRelicsWidgetFrontEnd", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Relic1"

	var_4_12.RelicText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_4_12.RelicDesc:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 45, _1080p * 145)
	var_4_0:addElement(var_4_12)

	var_4_0.Relic1 = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "Header"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/RELIC_HEADER_MAIN"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetWordWrap(false)
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetShadowMinDistance(-0.2, 0)
	var_4_14:SetShadowMaxDistance(0.2, 0)
	var_4_14:SetShadowUOffset(-0.002, 0)
	var_4_14:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 17, _1080p * -17, _1080p * 7, _1080p * 31)
	var_4_0:addElement(var_4_14)

	var_4_0.Header = var_4_14

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CPRelicsActiveFrontEnd", CPRelicsActiveFrontEnd)
LockTable(_M)
