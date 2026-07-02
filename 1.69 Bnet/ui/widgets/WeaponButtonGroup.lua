module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if CONDITIONS.AreRestrictionsActiveAndBlueprintsBlocked(arg_1_0, arg_1_0._controllerIndex) then
		return
	end

	if arg_1_0.BlueprintButton then
		if CONDITIONS.IsArmoryEnabled(arg_1_0, arg_1_0._controllerIndex) and arg_1_2 and arg_1_3 then
			if arg_1_0.BlueprintButton.removed then
				arg_1_0:addElement(arg_1_0.BlueprintButton)

				arg_1_0.BlueprintButton.removed = false
			end

			arg_1_0.BlueprintButton:Setup(arg_1_3)
		elseif not arg_1_0.BlueprintButton.removed then
			arg_1_0:RemoveElement(arg_1_0.BlueprintButton)

			arg_1_0.BlueprintButton.removed = true
		end
	end

	arg_1_0._blueprintActive = arg_1_2

	if arg_1_0.BlueprintStoreButton then
		local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)

		if Engine.DDJFBBJAIG() and CONDITIONS.IsBlueprintStoreEnabled() and var_1_0.bundleVariants[arg_1_1] then
			arg_1_0.BlueprintStoreButton.BlueprintCount:setText(#var_1_0.bundleVariants[arg_1_1])

			if arg_1_0.BlueprintStoreButton.removed then
				arg_1_0:addElement(arg_1_0.BlueprintStoreButton)

				arg_1_0.BlueprintStoreButton.removed = false
			end
		elseif not arg_1_0.BlueprintStoreButton.removed then
			arg_1_0:RemoveElement(arg_1_0.BlueprintStoreButton)

			arg_1_0.BlueprintStoreButton.removed = true
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.SetBlueprintActive = var_0_0
	arg_2_0._expandButtons = false

	local function var_2_0()
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")

		if arg_2_0.BlueprintButton then
			ACTIONS.AnimateSequence(arg_2_0.BlueprintButton, "Expand")
		end

		if arg_2_0.BlueprintStoreButton then
			ACTIONS.AnimateSequence(arg_2_0.BlueprintStoreButton, "Expand")
		end

		if not arg_2_0._expandButtons then
			arg_2_0:getParent():processEvent({
				name = "update_expanded_buttons"
			})

			arg_2_0._expandButtons = true
		end
	end

	local function var_2_1()
		if arg_2_0._expandButtons then
			ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")

			if arg_2_0.BlueprintButton then
				ACTIONS.AnimateSequence(arg_2_0.BlueprintButton, "Collapse")
			end

			if arg_2_0.BlueprintStoreButton then
				ACTIONS.AnimateSequence(arg_2_0.BlueprintStoreButton, "Collapse")
			end

			arg_2_0._expandButtons = false
		end
	end

	arg_2_0.WeaponButton:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		var_2_0()
	end)
	arg_2_0:addEventHandler("update_expanded_buttons", function(arg_6_0, arg_6_1)
		var_2_1()
	end)
	arg_2_0.WeaponButton:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
		var_2_0()
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		var_2_1()
	end)

	if arg_2_0.BlueprintButton then
		arg_2_0.BlueprintButton:addEventHandler("button_over", function(arg_9_0, arg_9_1)
			var_2_0()
		end)
		arg_2_0.BlueprintButton:setPriority(3)
	end

	if arg_2_0.BlueprintStoreButton then
		arg_2_0.BlueprintStoreButton:addEventHandler("button_over", function(arg_10_0, arg_10_1)
			var_2_0()
		end)
		arg_2_0.BlueprintStoreButton:setPriority(3)
	end

	arg_2_0:SetForceDefaultFocus(true)
	arg_2_0.WeaponButton:setPriority(1)

	if arg_2_0.BlueprintButton then
		arg_2_0.BlueprintButton:setPriority(2)
	end
end

function WeaponButtonGroup(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIHorizontalList.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 532 * _1080p, 0, 162 * _1080p)

	var_11_0.id = "WeaponButtonGroup"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	var_11_0:SetSpacing(10 * _1080p)

	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("WeaponButton", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "WeaponButton"

	var_11_4.Text:setText(ToUpperCase(""), 0)
	var_11_4.Text:SetAlignment(LUI.Alignment.Left)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 22, _1080p * 162)
	var_11_0:addElement(var_11_4)

	var_11_0.WeaponButton = var_11_4

	local var_11_5

	if CONDITIONS.EnableBlueprintsButton(var_11_0, var_11_1) then
		var_11_5 = MenuBuilder.BuildRegisteredType("BlueprintButton", {
			controllerIndex = var_11_1
		})
		var_11_5.id = "BlueprintButton"

		var_11_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 410, _1080p * 452, _1080p * 25, _1080p * 159)
		var_11_0:addElement(var_11_5)

		var_11_0.BlueprintButton = var_11_5
	end

	local var_11_6

	if Engine.DDJFBBJAIG() and CONDITIONS.EnableStoreBlueprintsButton(var_11_0, var_11_1) then
		var_11_6 = MenuBuilder.BuildRegisteredType("BlueprintStoreButton", {
			controllerIndex = var_11_1
		})
		var_11_6.id = "BlueprintStoreButton"

		var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 462, _1080p * 504, _1080p * 25, _1080p * 159)
		var_11_0:addElement(var_11_6)

		var_11_0.BlueprintStoreButton = var_11_6
	end

	local function var_11_7()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_7

	local var_11_8

	if CONDITIONS.EnableBlueprintsButton(var_11_0, var_11_1) then
		local var_11_9 = {
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 490
			}
		}

		var_11_5:RegisterAnimationSequence("ButtonOver", var_11_9)
	end

	if Engine.DDJFBBJAIG() and CONDITIONS.EnableStoreBlueprintsButton(var_11_0, var_11_1) then
		local var_11_10 = {
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 580
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 500
			}
		}

		var_11_6:RegisterAnimationSequence("ButtonOver", var_11_10)
	end

	local function var_11_11()
		if CONDITIONS.EnableBlueprintsButton(var_11_0, var_11_1) then
			var_11_5:AnimateSequence("ButtonOver")
		end

		if Engine.DDJFBBJAIG() and CONDITIONS.EnableStoreBlueprintsButton(var_11_0, var_11_1) then
			var_11_6:AnimateSequence("ButtonOver")
		end
	end

	var_11_0._sequences.ButtonOver = var_11_11

	local var_11_12

	if CONDITIONS.EnableBlueprintsButton(var_11_0, var_11_1) then
		local var_11_13 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 452
			}
		}

		var_11_5:RegisterAnimationSequence("ButtonUp", var_11_13)
	end

	if Engine.DDJFBBJAIG() and CONDITIONS.EnableStoreBlueprintsButton(var_11_0, var_11_1) then
		local var_11_14 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 504
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 462
			}
		}

		var_11_6:RegisterAnimationSequence("ButtonUp", var_11_14)
	end

	local function var_11_15()
		if CONDITIONS.EnableBlueprintsButton(var_11_0, var_11_1) then
			var_11_5:AnimateSequence("ButtonUp")
		end

		if Engine.DDJFBBJAIG() and CONDITIONS.EnableStoreBlueprintsButton(var_11_0, var_11_1) then
			var_11_6:AnimateSequence("ButtonUp")
		end
	end

	var_11_0._sequences.ButtonUp = var_11_15

	var_0_1(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WeaponButtonGroup", WeaponButtonGroup)
LockTable(_M)
