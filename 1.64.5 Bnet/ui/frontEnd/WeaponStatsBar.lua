module(..., package.seeall)

function WeaponStatsBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "WeaponStatsBar"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("WeaponStatsProgressBar", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "ProgressBar"

	var_1_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 111, _1080p * -67, _1080p * -5, _1080p * 5)
	var_1_0:addElement(var_1_4)

	var_1_0.ProgressBar = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "StatName"

	var_1_6:SetAlpha(0.5, 0)
	var_1_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/STATS_CAPS")), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 100, _1080p * 1, _1080p * 19)
	var_1_0:addElement(var_1_6)

	var_1_0.StatName = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "BaseValue"

	var_1_8:SetAlpha(0.5, 0)
	var_1_8:setText("999", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Right)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -63, _1080p * -33, 0, _1080p * 19)
	var_1_0:addElement(var_1_8)

	var_1_0.BaseValue = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "AttachmentValue"

	var_1_10:SetRGBFromTable(SWATCHES.HUDMeters.fill_temp, 0)
	var_1_10:setText("999", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 19)
	var_1_0:addElement(var_1_10)

	var_1_0.AttachmentValue = var_1_10

	return var_1_0
end

MenuBuilder.registerType("WeaponStatsBar", WeaponStatsBar)
LockTable(_M)
