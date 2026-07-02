module(..., package.seeall)

function WeaponMasterUltimateCheckboxes(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 440 * _1080p, 0, 26 * _1080p)

	var_1_0.id = "WeaponMasterUltimateCheckboxes"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(20 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Checkbox1"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 26, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Checkbox1 = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Checkbox2"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 46, _1080p * 72, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Checkbox2 = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "Checkbox3"

	var_1_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 92, _1080p * 118, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Checkbox3 = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "Checkbox4"

	var_1_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 138, _1080p * 164, 0, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.Checkbox4 = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "Checkbox5"

	var_1_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 184, _1080p * 210, 0, 0)
	var_1_0:addElement(var_1_12)

	var_1_0.Checkbox5 = var_1_12

	local var_1_13
	local var_1_14 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_14.id = "Checkbox6"

	var_1_14:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 230, _1080p * 256, 0, 0)
	var_1_0:addElement(var_1_14)

	var_1_0.Checkbox6 = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "Checkbox7"

	var_1_16:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 276, _1080p * 302, 0, 0)
	var_1_0:addElement(var_1_16)

	var_1_0.Checkbox7 = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "Checkbox8"

	var_1_18:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 322, _1080p * 348, 0, 0)
	var_1_0:addElement(var_1_18)

	var_1_0.Checkbox8 = var_1_18

	local var_1_19
	local var_1_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_20.id = "Checkbox9"

	var_1_20:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 368, _1080p * 394, 0, 0)
	var_1_0:addElement(var_1_20)

	var_1_0.Checkbox9 = var_1_20

	local var_1_21
	local var_1_22 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_1_1
	})

	var_1_22.id = "Checkbox10"

	var_1_22:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 414, _1080p * 440, 0, 0)
	var_1_0:addElement(var_1_22)

	var_1_0.Checkbox10 = var_1_22

	return var_1_0
end

MenuBuilder.registerType("WeaponMasterUltimateCheckboxes", WeaponMasterUltimateCheckboxes)
LockTable(_M)
