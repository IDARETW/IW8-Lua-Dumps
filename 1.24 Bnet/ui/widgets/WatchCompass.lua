module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not Engine.DDJFBBJAIG() then
		arg_1_0:SubscribeToModel(DataSources.inGame.HUD.compassRotation:GetModel(arg_1_1), function(arg_2_0)
			local var_2_0 = math.abs(math.floor(DataModel.JJEHAEBDF(arg_2_0)) - 360)
			local var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH")
			local var_2_2 = var_2_0 % 360

			if var_2_2 < 0 then
				var_2_2 = var_2_2 + 360
			end

			arg_1_0.Arrow:SetZRotation(var_2_2)
			arg_1_0.CardinalDirection:SetRGBFromTable(COLORS.white, 100)
			arg_1_0.Degrees:SetRGBFromInt(12566463, 100)

			if var_2_2 >= 0 and var_2_2 <= 10 or var_2_2 >= 350 and var_2_2 <= 360 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH")

				arg_1_0.CardinalDirection:SetRGBFromInt(16733502, 0)
				arg_1_0.Degrees:SetRGBFromInt(16733502, 0)
			elseif var_2_2 >= 11 and var_2_2 <= 79 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH_EAST")
			elseif var_2_2 >= 80 and var_2_2 <= 100 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/EAST")
			elseif var_2_2 >= 101 and var_2_2 <= 169 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/SOUTH_EAST")
			elseif var_2_2 >= 170 and var_2_2 <= 190 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/SOUTH")
			elseif var_2_2 >= 191 and var_2_2 <= 259 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/SOUTH_WEST")
			elseif var_2_2 >= 260 and var_2_2 <= 280 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/WEST")
			elseif var_2_2 >= 281 and var_2_2 <= 359 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH_WEST")
			end

			arg_1_0.CardinalDirection:setText(var_2_1)
			arg_1_0.Degrees:setText(Engine.CBBHFCGDIC("HUD/DEGREES", var_2_2))
		end)
	else
		arg_1_0.CardinalDirection:setText(Engine.CBBHFCGDIC("HUD/NORTH"))
		arg_1_0.Degrees:setText(Engine.CBBHFCGDIC("HUD/DEGREES", 0))
	end
end

function WatchCompass(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchCompass"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Radi"

	var_3_6:SetAlpha(0.05, 0)
	var_3_6:SetScale(-0.2, 0)
	var_3_6:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 30, _1080p * -30, _1080p * 30, _1080p * -30)
	var_3_0:addElement(var_3_6)

	var_3_0.Radi = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Ticks"

	var_3_8:SetScale(-0.02, 0)
	var_3_8:setImage(RegisterMaterial("watch_compass_ticks"), 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Ticks = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Arrow"

	var_3_10:SetScale(-0.02, 0)
	var_3_10:setImage(RegisterMaterial("watch_compass_arrows"), 0)
	var_3_0:addElement(var_3_10)

	var_3_0.Arrow = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Degrees"

	var_3_12:SetRGBFromInt(12566463, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 506, _1080p * 186, _1080p * 256)
	var_3_0:addElement(var_3_12)

	var_3_0.Degrees = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "CardinalDirection"

	var_3_14:SetRGBFromInt(16733502, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 506, _1080p * 255, _1080p * 325)
	var_3_0:addElement(var_3_14)

	var_3_0.CardinalDirection = var_3_14

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchCompass", WatchCompass)
LockTable(_M)
