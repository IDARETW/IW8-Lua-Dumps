module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		if DataSources.frontEnd.lobby.mapName:GetValue(arg_1_1) ~= nil then
			local var_2_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
			local var_2_1 = MP.GetMapImage(var_2_0)

			arg_1_0.BackgroundImage:setImage(RegisterMaterial(var_2_1))
		end
	end

	local var_1_1 = DataSources.frontEnd.lobby.mapName

	arg_1_0:SubscribeToModel(var_1_1:GetModel(arg_1_1), var_1_0)
end

function MapBackgroundImage(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "MapBackgroundImage"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "BackgroundImage"

	var_3_4:setImage(RegisterMaterial("loading_mp_spear_bg"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.BackgroundImage = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "VignetteBottom"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_3_6:SetVMin(1, 0)
	var_3_6:SetVMax(0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.VignetteBottom = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "VignetteTop"

	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 2487, 0, _1080p * -244)
	var_3_0:addElement(var_3_8)

	var_3_0.VignetteTop = var_3_8

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MapBackgroundImage", MapBackgroundImage)
LockTable(_M)
