module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_2_1 = ""
		local var_2_2 = ""
		local var_2_3 = false

		for iter_2_0 = 1, #var_2_0 do
			local var_2_4 = string.sub(tostring(var_2_0), iter_2_0, iter_2_0)

			if tonumber(var_2_4) then
				if var_2_3 then
					var_2_2 = var_2_2 .. var_2_4
				else
					var_2_1 = var_2_1 .. var_2_4
				end
			else
				var_2_3 = true
			end
		end

		arg_1_0.Hour:setText(var_2_1)
		arg_1_0.Minute:setText(var_2_2)

		local var_2_5, var_2_6, var_2_7 = Engine.CDHECDHEDF()
		local var_2_8 = ToUpperCase(Engine.BBBFCJBBJD(Engine.DCJHCAFIIA()))

		arg_1_0.Date:setText(var_2_5)
		arg_1_0.Month:setText(var_2_8)

		arg_1_0:Wait(var_0_0).onComplete = var_1_1
	end

	var_1_1()
end

function WatchCode(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchCode"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Face"

	var_3_4:setImage(RegisterMaterial("watch_code_face"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_3_0:addElement(var_3_4)

	var_3_0.Face = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Month"

	var_3_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_6:setText("APR", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 127, _1080p * 256, _1080p * 296)
	var_3_0:addElement(var_3_6)

	var_3_0.Month = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Date"

	var_3_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_8:setText("00", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 119, _1080p * 204, _1080p * 264)
	var_3_0:addElement(var_3_8)

	var_3_0.Date = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Hour"

	var_3_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_10:setText("00", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 396, _1080p * 497, _1080p * 204, _1080p * 264)
	var_3_0:addElement(var_3_10)

	var_3_0.Hour = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Minute"

	var_3_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_12:setText("00", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 396, _1080p * 497, _1080p * 250, _1080p * 310)
	var_3_0:addElement(var_3_12)

	var_3_0.Minute = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchCode", WatchCode)
LockTable(_M)
