module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_charge") / 10

		arg_2_0.BarFull:SetAnchors(0, 1 - var_2_0, 0, 0, 0, 0)
	end

	arg_1_0:registerOmnvarHandler("ui_pet_watch_charge", function(arg_3_0)
		var_1_0(arg_3_0)
	end)
	arg_1_0.BarFullSuper:SetAlpha(0)
end

function WatchPetBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 16 * _1080p)

	var_4_0.id = "WatchPetBar"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "BarBG"

	var_4_4:SetRGBFromInt(11193778, 0)
	var_4_4:setImage(RegisterMaterial("watch_riley_charge_empty"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 16)
	var_4_0:addElement(var_4_4)

	var_4_0.BarBG = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "BarFull"

	var_4_6:SetRGBFromInt(11193778, 0)
	var_4_6:setImage(RegisterMaterial("watch_riley_charge_ready"), 0)
	var_4_0:addElement(var_4_6)

	var_4_0.BarFull = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "BarFullSuper"

	var_4_8:SetRGBFromInt(11193778, 0)
	var_4_8:setImage(RegisterMaterial("watch_riley_supercharge_ready"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 16)
	var_4_0:addElement(var_4_8)

	var_4_0.BarFullSuper = var_4_8

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WatchPetBar", WatchPetBar)
LockTable(_M)
