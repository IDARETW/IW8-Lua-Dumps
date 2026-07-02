module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_1.widget = MenuBuilder.BuildRegisteredType("LoadoutCopyReplace", arg_1_1)

	local var_1_0 = MenuBuilder.BuildRegisteredType("FlyInPopup", arg_1_1)

	var_1_0.id = "LoadoutOptions"

	return var_1_0
end

MenuBuilder.registerType("LoadoutCopy", var_0_0)

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if Engine.BHICADFIHA() and not arg_2_2 then
		DebugPrint("WARNING: Missing \"loadoutIndex\" option for LoadoutOptionsPopup menu. Only OK after a MyChanges.")

		arg_2_2 = 0
	end

	assert(arg_2_2)

	local var_2_0 = PlayerData.BFFBGAJGD(arg_2_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_2_2]

	arg_2_0.RenameButton:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
		LOADOUT.RenameLoadout(arg_3_0, arg_2_1, var_2_0, arg_2_2)
	end)
	arg_2_0.CopyButton:registerEventHandler("button_action", function(arg_4_0, arg_4_1)
		LOADOUT.OpenLoadoutCopyPopup(arg_2_1, arg_2_2)
	end)

	if arg_2_0.FavoriteButton then
		arg_2_0.FavoriteButton:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
			LOADOUT.SetFavoriteLoadout(arg_5_0, arg_2_1, arg_2_2)
		end)
	end
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetupButtons = var_0_1
end

function LoadoutOptionsButtons(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalList.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 192 * _1080p)

	var_7_0.id = "LoadoutOptionsButtons"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(10 * _1080p)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "RenameButton"
	var_7_4.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/EMPTY_STRING")

	var_7_4.Text:setText(Engine.CBBHFCGDIC("MENU/RENAME"), 0)
	var_7_4.Description:setText("", 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 40)
	var_7_0:addElement(var_7_4)

	var_7_0.RenameButton = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "CopyButton"
	var_7_6.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/EMPTY_STRING")

	var_7_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/COPY_LOADOUT"), 0)
	var_7_6.Description:setText("", 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 50, _1080p * 90)
	var_7_0:addElement(var_7_6)

	var_7_0.CopyButton = var_7_6

	local var_7_7

	if not CONDITIONS.IsSystemLink(var_7_0) then
		local var_7_8 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
			controllerIndex = var_7_1
		})

		var_7_8.id = "FavoriteButton"

		if not CONDITIONS.IsSystemLink(var_7_0) then
			var_7_8.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/FAVORITE_LOADOUT_DESC")
		end

		var_7_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/SET_FAVORITE"), 0)
		var_7_8.Description:setText("", 0)
		var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 100, _1080p * 140)
		var_7_0:addElement(var_7_8)

		var_7_0.FavoriteButton = var_7_8
	end

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "Description"

	var_7_10.Description:SetRight(_1080p * 500, 0)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 430, _1080p * 150, _1080p * 182)
	var_7_0:addElement(var_7_10)

	var_7_0.Description = var_7_10

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LoadoutOptionsButtons", LoadoutOptionsButtons)
LockTable(_M)
