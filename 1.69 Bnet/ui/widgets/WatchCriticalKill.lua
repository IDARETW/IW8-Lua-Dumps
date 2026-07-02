module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._headshotKills = 0

	arg_1_0.LabelValue:setText(string.format("%06d", tostring(arg_1_0._headshotKills)))

	if not CONDITIONS.InFrontend() and Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch() then
		arg_1_0:SubscribeToModel(DataSources.inGame.HUD.hitMarker.kill:GetModel(arg_1_1), function()
			if DataSources.inGame.player.BRData.prematchPeriod:GetValue(arg_1_1) == 0 and DataSources.inGame.HUD.hitMarker.headShot:GetValue(arg_1_1) then
				arg_1_0._headshotKills = arg_1_0._headshotKills + 1

				arg_1_0.LabelValue:setText(string.format("%06d", tostring(arg_1_0._headshotKills)))
			end
		end, true)
	end
end

function WatchCriticalKill(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchCriticalKill"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "LabelValue"

	var_3_4:SetRGBFromTable(SWATCHES.Reticles.DarkRed, 0)
	var_3_4:SetColorOp(COLOR_OP.saturation, 0)
	var_3_4:SetColorOpParam(80, 0)
	var_3_4:setText("000895", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_4:SetAlignment(LUI.Alignment.Center)
	var_3_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 446, _1080p * 196, _1080p * 316)
	var_3_0:addElement(var_3_4)

	var_3_0.LabelValue = var_3_4

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchCriticalKill", WatchCriticalKill)
LockTable(_M)
