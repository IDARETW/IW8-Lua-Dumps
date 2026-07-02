module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.colorWidgets[arg_1_0.defaultColorTeam]:processEvent(arg_1_1)

	return true
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {
		arg_2_0.CodCasterTeamColor1,
		arg_2_0.CodCasterTeamColor2,
		arg_2_0.CodCasterTeamColor3,
		arg_2_0.CodCasterTeamColor4,
		arg_2_0.CodCasterTeamColor5,
		arg_2_0.CodCasterTeamColor6,
		arg_2_0.CodCasterTeamColor7,
		arg_2_0.CodCasterTeamColor8,
		arg_2_0.CodCasterTeamColor9,
		arg_2_0.CodCasterTeamColor10,
		arg_2_0.CodCasterTeamColor11,
		arg_2_0.CodCasterTeamColor12,
		arg_2_0.CodCasterTeamColor13,
		arg_2_0.CodCasterTeamColor14,
		arg_2_0.CodCasterTeamColor15,
		arg_2_0.CodCasterTeamColor16
	}
	local var_2_1 = math.ceil(#var_2_0 / 2)

	for iter_2_0 = 1, #var_2_0 do
		var_2_0[iter_2_0].navigation = {
			left = var_2_0[iter_2_0 - 1],
			right = var_2_0[iter_2_0 + 1],
			up = var_2_0[iter_2_0 - var_2_1],
			down = var_2_0[iter_2_0 + var_2_1]
		}
	end

	arg_2_0.colorWidgets = {}

	for iter_2_1 = 1, #var_2_0 do
		local var_2_2, var_2_3, var_2_4, var_2_5 = var_2_0[iter_2_1].TeamColor:getCurrentRGBA()
		local var_2_6 = {
			r = var_2_2,
			g = var_2_3,
			b = var_2_4
		}
		local var_2_7 = GetIntForColor(var_2_6)

		arg_2_0.colorWidgets[var_2_7] = var_2_0[iter_2_1]
		arg_2_0.colorWidgets[var_2_7].intColor = var_2_7

		if iter_2_1 == 8 then
			arg_2_0.defaultColorTeam = var_2_7
		end
	end

	arg_2_0:registerEventHandler("gain_focus", var_0_0)
end

function CoDCasterTeamColorSelectorSecondary(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 587 * _1080p, 0, 137 * _1080p)

	var_3_0.id = "CoDCasterTeamColorSelectorSecondary"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "CodCasterTeamColor16"

	var_3_4.TeamColor:SetRGBFromInt(9800959, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 527, _1080p * 587, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_4)

	var_3_0.CodCasterTeamColor16 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "CodCasterTeamColor15"

	var_3_6.TeamColor:SetRGBFromInt(13807615, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 451, _1080p * 511, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_6)

	var_3_0.CodCasterTeamColor15 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "CodCasterTeamColor14"

	var_3_8.TeamColor:SetRGBFromInt(14647291, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 375, _1080p * 435, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_8)

	var_3_0.CodCasterTeamColor14 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "CodCasterTeamColor13"

	var_3_10.TeamColor:SetRGBFromInt(12049407, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 297, _1080p * 357, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_10)

	var_3_0.CodCasterTeamColor13 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "CodCasterTeamColor12"

	var_3_12.TeamColor:SetRGBFromInt(10996223, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 222, _1080p * 282, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_12)

	var_3_0.CodCasterTeamColor12 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "CodCasterTeamColor11"

	var_3_14.TeamColor:SetRGBFromInt(7469305, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 147, _1080p * 207, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_14)

	var_3_0.CodCasterTeamColor11 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "CodCasterTeamColor10"

	var_3_16.TeamColor:SetRGBFromInt(10476157, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 73, _1080p * 133, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_16)

	var_3_0.CodCasterTeamColor10 = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "CodCasterTeamColor9"

	var_3_18.TeamColor:SetRGBFromInt(12185689, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 60, _1080p * 77, _1080p * 137)
	var_3_0:addElement(var_3_18)

	var_3_0.CodCasterTeamColor9 = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "CodCasterTeamColor8"

	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 527, _1080p * 587, 0, _1080p * 60)
	var_3_0:addElement(var_3_20)

	var_3_0.CodCasterTeamColor8 = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "CodCasterTeamColor7"

	var_3_22.TeamColor:SetRGBFromInt(16643720, 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 451, _1080p * 511, 0, _1080p * 60)
	var_3_0:addElement(var_3_22)

	var_3_0.CodCasterTeamColor7 = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "CodCasterTeamColor6"

	var_3_24.TeamColor:SetRGBFromInt(15713571, 0)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 375, _1080p * 435, 0, _1080p * 60)
	var_3_0:addElement(var_3_24)

	var_3_0.CodCasterTeamColor6 = var_3_24

	local var_3_25
	local var_3_26 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_26.id = "CodCasterTeamColor5"

	var_3_26.TeamColor:SetRGBFromInt(16756854, 0)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 297, _1080p * 357, 0, _1080p * 60)
	var_3_0:addElement(var_3_26)

	var_3_0.CodCasterTeamColor5 = var_3_26

	local var_3_27
	local var_3_28 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_28.id = "CodCasterTeamColor4"

	var_3_28.TeamColor:SetRGBFromInt(14586539, 0)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 222, _1080p * 282, 0, _1080p * 60)
	var_3_0:addElement(var_3_28)

	var_3_0.CodCasterTeamColor4 = var_3_28

	local var_3_29
	local var_3_30 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_30.id = "CodCasterTeamColor3"

	var_3_30.TeamColor:SetRGBFromInt(16750211, 0)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 147, _1080p * 207, 0, _1080p * 60)
	var_3_0:addElement(var_3_30)

	var_3_0.CodCasterTeamColor3 = var_3_30

	local var_3_31
	local var_3_32 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_32.id = "CodCasterTeamColor2"

	var_3_32.TeamColor:SetRGBFromInt(16746897, 0)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 73, _1080p * 133, 0, _1080p * 60)
	var_3_0:addElement(var_3_32)

	var_3_0.CodCasterTeamColor2 = var_3_32

	local var_3_33
	local var_3_34 = MenuBuilder.BuildRegisteredType("CodCasterTeamColor", {
		controllerIndex = var_3_1
	})

	var_3_34.id = "CodCasterTeamColor1"

	var_3_34.TeamColor:SetRGBFromInt(16730184, 0)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 60, 0, _1080p * 60)
	var_3_0:addElement(var_3_34)

	var_3_0.CodCasterTeamColor1 = var_3_34

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CoDCasterTeamColorSelectorSecondary", CoDCasterTeamColorSelectorSecondary)
LockTable(_M)
