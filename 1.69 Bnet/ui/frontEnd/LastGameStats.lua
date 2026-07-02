module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2.mapName ~= "" then
		local var_1_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_1_2.mode, CSV.gameTypesTable.cols.name)

		arg_1_0.MapNameHeader.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/" .. string.upper(string.gsub(arg_1_2.mapName, "mp", "mapname", 1))) .. " - " .. Engine.CBBHFCGDIC(var_1_0))
	else
		arg_1_0.MapNameHeader.Text:setText("")
	end

	local var_1_1 = RegisterMaterial(arg_1_2.mapImage)

	arg_1_0.MapImage:setImage(var_1_1)
	arg_1_0.MatchStats:Setup(arg_1_2.stats)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ProcessMatchData = var_0_0
end

function LastGameStats(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1160 * _1080p, 0, 530 * _1080p)

	var_3_0.id = "LastGameStats"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("CombatRecordStatsGroup", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "MatchStats"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 580, _1080p * -265, _1080p * 255)
	var_3_0:addElement(var_3_4)

	var_3_0.MatchStats = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "DoubleNotchedBacker"

	var_3_6:SetAlpha(0.5, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -580, _1080p * -21, _1080p * -265, _1080p * 73)
	var_3_0:addElement(var_3_6)

	var_3_0.DoubleNotchedBacker = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "MapImage"

	var_3_8:setImage(RegisterMaterial("preview_mp_hackney_am_lobby"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -528, _1080p * -72, _1080p * -165, _1080p * 63)
	var_3_0:addElement(var_3_8)

	var_3_0.MapImage = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "MapNameHeader"

	var_3_10.Text:setText("", 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -580, _1080p * -105, _1080p * -265, _1080p * -219)
	var_3_0:addElement(var_3_10)

	var_3_0.MapNameHeader = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LastGameStats", LastGameStats)
LockTable(_M)
