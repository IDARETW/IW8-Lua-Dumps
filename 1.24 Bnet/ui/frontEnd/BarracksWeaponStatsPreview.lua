module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = WEAPON.GetStatsTable(arg_1_1)
	local var_1_1 = 0
	local var_1_2 = "iw8_ar_kilo433"

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if var_1_1 < iter_1_1.kills then
			var_1_1 = iter_1_1.kills
			var_1_2 = iter_1_1.ref
		end
	end

	local var_1_3 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, var_1_2, CSV.MPWeapons.cols.name)
	local var_1_4 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, var_1_2, CSV.MPWeapons.cols.progressionImage)

	arg_1_0.WeaponName:setText(Engine.CBBHFCGDIC(var_1_3))

	if var_1_4 ~= nil and var_1_4 ~= "" then
		arg_1_0.WeaponImage:setImage(RegisterMaterial(var_1_4))
	else
		arg_1_0.WeaponImage:SetAlpha(0)
	end

	arg_1_0.KillStats.Value:setText(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetData = var_0_0

	var_0_0(arg_2_0, arg_2_1)
end

function BarracksWeaponStatsPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 450 * _1080p)

	var_3_0.id = "BarracksWeaponStatsPreview"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "KillStats"

	var_3_6.Value:setText("", 0)
	var_3_6.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TOTAL_NUMBER")), 0)
	var_3_6.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/KILLS")), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -20, _1080p * 400, _1080p * 323, _1080p * 423)
	var_3_0:addElement(var_3_6)

	var_3_0.KillStats = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "WeaponImage"

	var_3_8:setImage(RegisterMaterial("icon_cac_weapon_ar_akilo47"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -174, _1080p * 174, _1080p * 167, _1080p * 341)
	var_3_0:addElement(var_3_8)

	var_3_0.WeaponImage = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "WeaponName"

	var_3_10:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 150)
	var_3_0:addElement(var_3_10)

	var_3_0.WeaponName = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "BarracksHeader"

	var_3_12.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPON_STATS_PREVIEW_TITLE"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 40)
	var_3_0:addElement(var_3_12)

	var_3_0.BarracksHeader = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BarracksWeaponStatsPreview", BarracksWeaponStatsPreview)
LockTable(_M)
